@implementation _NFContactlessPaymentSession

- (_NFContactlessPaymentSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6 hostCardEmulationSupport:(BOOL)a7
{
  _NFContactlessPaymentSession *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_NFContactlessPaymentSession;
  result = -[_NFXPCSession initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:](&v9, "initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:", a3, a4, a5, a6);
  if (result)
    result->_hostCardEmulationSupport = a7;
  return result;
}

- (void)cleanup
{
  uint64_t v4;
  NSObject *v5;
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
  const char *v18;
  const char *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  uint64_t v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  _BOOL4 v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void (*v44)(uint64_t, const char *, ...);
  objc_class *v45;
  _BOOL4 v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  objc_class *v51;
  int v52;
  const char *v53;
  const char *v54;
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
  id v70;
  uint64_t v71;
  NSObject *v72;
  const char *v73;
  const char *Name;
  const char *v75;
  const char *v76;
  const char *v77;
  objc_super v78;
  uint8_t buf[4];
  int v80;
  __int16 v81;
  const char *v82;
  __int16 v83;
  const char *v84;
  __int16 v85;
  int v86;
  __int16 v87;
  void *v88;

  v4 = NFSharedSignpostLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFContactlessPaymentSession", buf, 2u);
  }

  if (-[_NFSession needsCleanup](self, "needsCleanup"))
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
      v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 90);
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
      v18 = object_getClassName(self);
      v19 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v80 = v17;
      v81 = 2082;
      v82 = v18;
      v83 = 2082;
      v84 = v19;
      v85 = 1024;
      v86 = 90;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
    }

    sub_10023B69C((uint64_t)NFSecureElementWrapper);
    self->_deferredAuthRequested = 0;
    -[_NFContactlessSession setDeferredActivationApplet:](self, "setDeferredActivationApplet:", 0);
    -[NFTimer stopTimer](self->_deferredAuthTimer, "stopTimer");
    -[NFTimer stopTimer](self->_restartRoutingTimer, "stopTimer");
    -[_NFContactlessPaymentSession waitForSafeTransactionCompletion](self, "waitForSafeTransactionCompletion");
    if (-[_NFContactlessSession plasticCardMode](self, "plasticCardMode"))
    {
      -[_NFContactlessPaymentSession startWiredMode](self, "startWiredMode");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "handle"));
      v22 = objc_msgSend(v21, "enableGreenCarThreshold:", 1);

      if ((v22 & 1) == 0)
      {
        v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v24 = NFLogGetLogger(v23);
        if (v24)
        {
          v25 = (void (*)(uint64_t, const char *, ...))v24;
          v26 = object_getClass(self);
          v27 = class_isMetaClass(v26);
          v28 = object_getClassName(self);
          v75 = sel_getName(a2);
          v29 = 45;
          if (v27)
            v29 = 43;
          v25(6, "%c[%{public}s %{public}s]:%i Failed to re-enable GC logic", v29, v28, v75, 106);
        }
        v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v31 = NFSharedLogGetLogger(v30);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = object_getClass(self);
          if (class_isMetaClass(v33))
            v34 = 43;
          else
            v34 = 45;
          v35 = object_getClassName(self);
          v36 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v80 = v34;
          v81 = 2082;
          v82 = v35;
          v83 = 2082;
          v84 = v36;
          v85 = 1024;
          v86 = 106;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed to re-enable GC logic", buf, 0x22u);
        }

      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));

      if (v37)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
        v40 = sub_100239BA4(v38, 0, v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

        if (v41)
        {
          v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v43 = NFLogGetLogger(v42);
          if (v43)
          {
            v44 = (void (*)(uint64_t, const char *, ...))v43;
            v45 = object_getClass(self);
            v46 = class_isMetaClass(v45);
            v73 = object_getClassName(self);
            v76 = sel_getName(a2);
            v47 = 45;
            if (v46)
              v47 = 43;
            v44(3, "%c[%{public}s %{public}s]:%i Failed to disable plastic card mode: %{public}@", v47, v73, v76, 112, v41);
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
            v53 = object_getClassName(self);
            v54 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            v80 = v52;
            v81 = 2082;
            v82 = v53;
            v83 = 2082;
            v84 = v54;
            v85 = 1024;
            v86 = 112;
            v87 = 2114;
            v88 = v41;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disable plastic card mode: %{public}@", buf, 0x2Cu);
          }

        }
      }
    }
    if (self->_hasAuthorized)
      -[_NFContactlessPaymentSession _deauthorize](self, "_deauthorize");
    if (self->_delayExpressMode > 0.0)
    {
      v55 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v56 = NFLogGetLogger(v55);
      if (v56)
      {
        v57 = (void (*)(uint64_t, const char *, ...))v56;
        v58 = object_getClass(self);
        v59 = class_isMetaClass(v58);
        v60 = object_getClassName(self);
        v77 = sel_getName(a2);
        v61 = 45;
        if (v59)
          v61 = 43;
        v57(6, "%c[%{public}s %{public}s]:%i Delaying express enablement after transaction", v61, v60, v77, 125);
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
        v68 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v80 = v66;
        v81 = 2082;
        v82 = v67;
        v83 = 2082;
        v84 = v68;
        v85 = 1024;
        v86 = 125;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Delaying express enablement after transaction", buf, 0x22u);
      }

      -[_NFContactlessPaymentSession startWiredMode](self, "startWiredMode");
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
      sub_100043EE4(v69, self->_delayExpressMode);

    }
  }
  v78.receiver = self;
  v78.super_class = (Class)_NFContactlessPaymentSession;
  v70 = -[_NFContactlessSession cleanup](&v78, "cleanup");
  v71 = NFSharedSignpostLog(v70);
  v72 = objc_claimAutoreleasedReturnValue(v71);
  if (os_signpost_enabled(v72))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v72, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFContactlessPaymentSession", buf, 2u);
  }

}

- (BOOL)suspendWithInfo:(id)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
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
  const char *v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *v31;
  _BOOL4 v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  objc_class *v37;
  int v38;
  const char *v39;
  const char *v40;
  id v41;
  const char *v43;
  const char *Name;
  const char *v45;
  objc_super v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  void *v56;

  v46.receiver = self;
  v46.super_class = (Class)_NFContactlessPaymentSession;
  v5 = -[_NFContactlessSession suspendWithInfo:](&v46, "suspendWithInfo:", a3);
  if (v5)
  {
    self->_deferredAuthRequested = 0;
    -[_NFContactlessSession setDeferredActivationApplet:](self, "setDeferredActivationApplet:", 0);
    -[NFTimer stopTimer](self->_deferredAuthTimer, "stopTimer");
    -[NFTimer stopTimer](self->_restartRoutingTimer, "stopTimer");
    -[_NFContactlessPaymentSession waitForSafeTransactionCompletion](self, "waitForSafeTransactionCompletion");
    if (-[_NFContactlessSession plasticCardMode](self, "plasticCardMode"))
    {
      -[_NFContactlessPaymentSession startWiredMode](self, "startWiredMode");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "handle"));
      v8 = objc_msgSend(v7, "enableGreenCarThreshold:", 1);

      if ((v8 & 1) == 0)
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
          v15 = 45;
          if (isMetaClass)
            v15 = 43;
          v11(6, "%c[%{public}s %{public}s]:%i Failed to re-enable GC logic", v15, ClassName, Name, 155);
        }
        v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v17 = NFSharedLogGetLogger(v16);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = object_getClass(self);
          if (class_isMetaClass(v19))
            v20 = 43;
          else
            v20 = 45;
          v21 = object_getClassName(self);
          v22 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v48 = v20;
          v49 = 2082;
          v50 = v21;
          v51 = 2082;
          v52 = v22;
          v53 = 1024;
          v54 = 155;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed to re-enable GC logic", buf, 0x22u);
        }

      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
        v26 = sub_100239BA4(v24, 0, v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

        if (v27)
        {
          v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v29 = NFLogGetLogger(v28);
          if (v29)
          {
            v30 = (void (*)(uint64_t, const char *, ...))v29;
            v31 = object_getClass(self);
            v32 = class_isMetaClass(v31);
            v43 = object_getClassName(self);
            v45 = sel_getName(a2);
            v33 = 45;
            if (v32)
              v33 = 43;
            v30(3, "%c[%{public}s %{public}s]:%i Failed to disable plastic card mode: %{public}@", v33, v43, v45, 161, v27);
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
            *(_DWORD *)buf = 67110146;
            v48 = v38;
            v49 = 2082;
            v50 = v39;
            v51 = 2082;
            v52 = v40;
            v53 = 1024;
            v54 = 161;
            v55 = 2114;
            v56 = v27;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disable plastic card mode: %{public}@", buf, 0x2Cu);
          }

        }
      }
      -[_NFContactlessSession setPlasticCardMode:](self, "setPlasticCardMode:", 0);
    }
    if (self->_hasAuthorized)
      -[_NFContactlessPaymentSession _deauthorize](self, "_deauthorize");
    self->_inWiredMode = 0;
    self->_fieldPresent = 0;
    self->_transactionState = 0;
    v41 = -[_NFContactlessSession setActiveApplet:](self, "setActiveApplet:", 0);
  }
  return v5;
}

- (unint64_t)defaultEmulationType
{
  if (self->_hostCardEmulationSupport)
    return 6;
  else
    return 2;
}

- (id)preloadApplets
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NFContactlessPaymentSession;
  v2 = -[_NFContactlessSession preloadApplets](&v7, "preloadApplets");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (BOOL)useFilteredApplets
{
  return 1;
}

- (BOOL)readyForPayment
{
  void *v3;
  BOOL hasAuthorized;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
  if (v3)
    hasAuthorized = self->_hasAuthorized;
  else
    hasAuthorized = 0;

  return hasAuthorized;
}

- (BOOL)dontWaitForEOT
{
  return self->_dontWaitForEOT;
}

- (BOOL)inWiredMode
{
  return self->_inWiredMode;
}

- (BOOL)readyForVAS
{
  return 0;
}

- (void)didStartSession:(id)a3
{
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NFContactlessPaymentSession;
  -[_NFContactlessSession didStartSession:](&v6, "didStartSession:");
  if (!a3)
    v5 = -[_NFContactlessSession setActiveApplet:](self, "setActiveApplet:", 0);
}

- (void)didEndSession:(id)a3
{
  id v5;
  NFTimer *deferredAuthTimer;
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
  _BYTE *v19;
  void *v20;
  NFTimer *restartRoutingTimer;
  const char *Name;
  objc_super v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;

  v5 = a3;
  if (!-[_NFSession didEnd](self, "didEnd"))
  {
    self->_deferredAuthRequested = 0;
    -[NFTimer stopTimer](self->_deferredAuthTimer, "stopTimer");
    deferredAuthTimer = self->_deferredAuthTimer;
    self->_deferredAuthTimer = 0;

    if (self->_restartRoutingTimer)
    {
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
        v9(6, "%c[%{public}s %{public}s]:%i Unpausing express mode", v13, ClassName, Name, 241);
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
        v25 = v18;
        v26 = 2082;
        v27 = object_getClassName(self);
        v28 = 2082;
        v29 = sel_getName(a2);
        v30 = 1024;
        v31 = 241;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unpausing express mode", buf, 0x22u);
      }

      -[NFTimer stopTimer](self->_restartRoutingTimer, "stopTimer");
      v19 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
      v20 = v19;
      if (v19)
        sub_100040428(v19, 0, 1u);

      restartRoutingTimer = self->_restartRoutingTimer;
      self->_restartRoutingTimer = 0;

    }
  }
  v23.receiver = self;
  v23.super_class = (Class)_NFContactlessPaymentSession;
  -[_NFSession didEndSession:](&v23, "didEndSession:", v5);

}

- (void)getAppletsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  SEL v14;
  objc_super v15;
  uint8_t buf[16];

  v5 = a3;
  v6 = kdebug_trace(724566076, 0, 0, 0, 0);
  v7 = NFSharedSignpostLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLIENT_GET_APPLETS", "before dispatch", buf, 2u);
  }

  v15.receiver = self;
  v15.super_class = (Class)_NFContactlessPaymentSession;
  v9 = -[_NFSession workQueue](&v15, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011F1FC;
  block[3] = &unk_1002E5D28;
  v13 = v5;
  v14 = a2;
  block[4] = self;
  v11 = v5;
  dispatch_async(v10, block);

}

- (void)setActivePaymentApplet:(id)a3 keys:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  OS_dispatch_queue *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  SEL v29;
  objc_super v30;
  uint8_t buf[4];
  _BOOL4 v32;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = kdebug_trace(724566072, 0, 0, 0, 0);
  v16 = NFSharedSignpostLog(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 67109120;
    v32 = v13 != 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLIENT_AUTH_REQUEST", "setActivePaymentApplet, auth=%d", buf, 8u);
  }

  v30.receiver = self;
  v30.super_class = (Class)_NFContactlessPaymentSession;
  v18 = -[_NFSession workQueue](&v30, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10011F734;
  v24[3] = &unk_1002E89F8;
  v28 = v14;
  v29 = a2;
  v24[4] = self;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v20 = v13;
  v21 = v12;
  v22 = v11;
  v23 = v14;
  dispatch_async(v19, v24);

}

- (void)setActivePaymentApplets:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  OS_dispatch_queue *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  SEL v24;
  objc_super v25;
  uint8_t buf[4];
  _BOOL4 v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = kdebug_trace(724566072, 0, 0, 0, 0);
  v13 = NFSharedSignpostLog(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 67109120;
    v27 = v10 != 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLIENT_AUTH_REQUEST", "setActivePaymentApplets, auth=%d", buf, 8u);
  }

  v25.receiver = self;
  v25.super_class = (Class)_NFContactlessPaymentSession;
  v15 = -[_NFSession workQueue](&v25, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue(v15);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100121010;
  block[3] = &unk_1002E6240;
  v23 = v11;
  v24 = a2;
  block[4] = self;
  v21 = v9;
  v22 = v10;
  v17 = v10;
  v18 = v9;
  v19 = v11;
  dispatch_async(v16, block);

}

- (void)startCardEmulationWithAuthorization:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  OS_dispatch_queue *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  objc_super v20;
  uint8_t buf[4];
  _BOOL4 v22;

  v7 = a3;
  v8 = a4;
  v9 = kdebug_trace(724566072, 0, 0, 0, 0);
  v10 = NFSharedSignpostLog(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 67109120;
    v22 = v7 != 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLIENT_AUTH_REQUEST", "startCardEmulationWithAuthorization, auth=%d", buf, 8u);
  }

  v20.receiver = self;
  v20.super_class = (Class)_NFContactlessPaymentSession;
  v12 = -[_NFSession workQueue](&v20, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100122ECC;
  v16[3] = &unk_1002E6268;
  v18 = v8;
  v19 = a2;
  v16[4] = self;
  v17 = v7;
  v14 = v7;
  v15 = v8;
  dispatch_async(v13, v16);

}

- (void)handleDeferredAuthTimeout
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
  void *v17;
  void *v18;
  void *v19;
  NSData *deferredAuth;
  const char *Name;
  void *v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;

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
    v6(5, "%c[%{public}s %{public}s]:%i Deferred authorization timeout", v10, ClassName, Name, 572);
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
    v24 = v15;
    v25 = 2082;
    v26 = object_getClassName(self);
    v27 = 2082;
    v28 = sel_getName(a2);
    v29 = 1024;
    v30 = 572;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Deferred authorization timeout", buf, 0x22u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
    v22 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    -[_NFContactlessPaymentSession handleTimerExpiredEvent:](self, "handleTimerExpiredEvent:", v19);

  }
  else
  {
    -[_NFContactlessPaymentSession handleTimerExpiredEvent:](self, "handleTimerExpiredEvent:", &off_100305E48);
  }
  self->_deferredAuthRequested = 0;
  deferredAuth = self->_deferredAuth;
  self->_deferredAuth = 0;

}

- (void)_sync_startDeferredCardEmulationWithAuthorization:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v15;
  const char *ClassName;
  const char *Name;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v26;
  _BOOL4 v27;
  NSData *v28;
  NSData *deferredAuth;
  void *v30;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  objc_class *v38;
  int v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void (*v46)(uint64_t, const char *, ...);
  objc_class *v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  objc_class *v54;
  int v55;
  const char *v56;
  const char *v57;
  id v58;
  OS_dispatch_queue *v59;
  void *v60;
  NFTimer *v61;
  NFTimer *deferredAuthTimer;
  void *v63;
  void (*v64)(uint64_t, const char *, ...);
  objc_class *v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  void *v69;
  uint64_t v70;
  NSObject *v71;
  objc_class *v72;
  int v73;
  const char *v74;
  const char *v75;
  objc_super v76;
  _QWORD v77[4];
  id v78;
  id buf;
  __int16 v80;
  const char *v81;
  __int16 v82;
  const char *v83;
  __int16 v84;
  int v85;
  __int16 v86;
  void *v87;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v9 = kdebug_trace(724566144, 0, 0, 0, 0);
  v10 = NFSharedSignpostLog(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v7 != 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLIENT_DEFERRED_AUTH_REQUEST", "auth=%d", (uint8_t *)&buf, 8u);
  }

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class))
      v15 = 43;
    else
      v15 = 45;
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
    Logger(6, "%c[%{public}s %{public}s]:%i %{public}@", v15, ClassName, Name, 590, v18);

  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFSharedLogGetLogger(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = object_getClass(self);
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    v24 = object_getClassName(self);
    v25 = sel_getName(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
    LODWORD(buf) = 67110146;
    HIDWORD(buf) = v23;
    v80 = 2082;
    v81 = v24;
    v82 = 2082;
    v83 = v25;
    v84 = 1024;
    v85 = 590;
    v86 = 2114;
    v87 = v26;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", (uint8_t *)&buf, 0x2Cu);

  }
  self->_deferredAuthRequested = 1;
  if (v7)
  {
    v27 = !self->_deferredAuth || (objc_msgSend(v7, "isEqual:") & 1) == 0;
    v28 = (NSData *)v7;
    deferredAuth = self->_deferredAuth;
    self->_deferredAuth = v28;
  }
  else
  {
    v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v30);
    if (v31)
    {
      v32 = object_getClass(self);
      if (class_isMetaClass(v32))
        v33 = 43;
      else
        v33 = 45;
      v34 = object_getClassName(self);
      v35 = sel_getName(a2);
      v31(6, "%c[%{public}s %{public}s]:%i No authorization supplied", v33, v34, v35, 601);
    }
    v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v37 = NFSharedLogGetLogger(v36);
    deferredAuth = (NSData *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(&deferredAuth->super, OS_LOG_TYPE_DEFAULT))
    {
      v38 = object_getClass(self);
      if (class_isMetaClass(v38))
        v39 = 43;
      else
        v39 = 45;
      v40 = object_getClassName(self);
      v41 = sel_getName(a2);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v39;
      v80 = 2082;
      v81 = v40;
      v82 = 2082;
      v83 = v41;
      v84 = 1024;
      v85 = 601;
      _os_log_impl((void *)&_mh_execute_header, &deferredAuth->super, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No authorization supplied", (uint8_t *)&buf, 0x22u);
    }
    v27 = 0;
  }

  v42 = kdebug_trace(724566152, 0, 0, 0, 0);
  v43 = NFSharedSignpostLog(v42);
  v44 = objc_claimAutoreleasedReturnValue(v43);
  if (os_signpost_enabled(v44))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLIENT_CALLBACK", ", (uint8_t *)&buf, 2u);
  }

  v8[2](v8, 0);
  if (self->_deferredAuthTimer)
  {
    if (v27)
    {
      v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v46 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v45);
      if (v46)
      {
        v47 = object_getClass(self);
        if (class_isMetaClass(v47))
          v48 = 43;
        else
          v48 = 45;
        v49 = object_getClassName(self);
        v50 = sel_getName(a2);
        v46(6, "%c[%{public}s %{public}s]:%i Auth changed", v48, v49, v50, 619);
      }
      v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v52 = NFSharedLogGetLogger(v51);
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = object_getClass(self);
        if (class_isMetaClass(v54))
          v55 = 43;
        else
          v55 = 45;
        v56 = object_getClassName(self);
        v57 = sel_getName(a2);
        LODWORD(buf) = 67109890;
        HIDWORD(buf) = v55;
        v80 = 2082;
        v81 = v56;
        v82 = 2082;
        v83 = v57;
        v84 = 1024;
        v85 = 619;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Auth changed", (uint8_t *)&buf, 0x22u);
      }

      -[NFTimer stopTimer](self->_deferredAuthTimer, "stopTimer");
      -[NFTimer startTimer:leeway:](self->_deferredAuthTimer, "startTimer:leeway:", 60.0, 0.5);
    }
  }
  else
  {
    objc_initWeak(&buf, self);
    v58 = objc_alloc((Class)NFTimer);
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_100123F04;
    v77[3] = &unk_1002E5C08;
    objc_copyWeak(&v78, &buf);
    v76.receiver = self;
    v76.super_class = (Class)_NFContactlessPaymentSession;
    v59 = -[_NFSession workQueue](&v76, "workQueue");
    v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
    v61 = (NFTimer *)objc_msgSend(v58, "initWithCallback:queue:", v77, v60);
    deferredAuthTimer = self->_deferredAuthTimer;
    self->_deferredAuthTimer = v61;

    -[NFTimer startTimer:leeway:](self->_deferredAuthTimer, "startTimer:leeway:", 60.0, 0.5);
    objc_destroyWeak(&v78);
    objc_destroyWeak(&buf);
  }
  if (self->_fieldPresent && self->_fieldNotification)
  {
    v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v64 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v63);
    if (v64)
    {
      v65 = object_getClass(self);
      if (class_isMetaClass(v65))
        v66 = 43;
      else
        v66 = 45;
      v67 = object_getClassName(self);
      v68 = sel_getName(a2);
      v64(6, "%c[%{public}s %{public}s]:%i Field is already present, starting emulation", v66, v67, v68, 626);
    }
    v69 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v70 = NFSharedLogGetLogger(v69);
    v71 = objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      v72 = object_getClass(self);
      if (class_isMetaClass(v72))
        v73 = 43;
      else
        v73 = 45;
      v74 = object_getClassName(self);
      v75 = sel_getName(a2);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v73;
      v80 = 2082;
      v81 = v74;
      v82 = 2082;
      v83 = v75;
      v84 = 1024;
      v85 = 626;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Field is already present, starting emulation", (uint8_t *)&buf, 0x22u);
    }

    -[_NFContactlessPaymentSession _performDeferredAuthIfNeeded:](self, "_performDeferredAuthIfNeeded:", self->_fieldNotification);
  }
  else
  {
    -[_NFContactlessPaymentSession startWiredMode](self, "startWiredMode");
  }

}

- (void)startDeferredCardEmulationWithAuthorization:(id)a3 completion:(id)a4
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
  v17.super_class = (Class)_NFContactlessPaymentSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100124054;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)enablePlasticCardMode:(BOOL)a3 completion:(id)a4
{
  id v7;
  OS_dispatch_queue *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  BOOL v14;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_NFContactlessPaymentSession;
  v8 = -[_NFSession workQueue](&v15, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001243F0;
  v11[3] = &unk_1002E7E90;
  v12 = v7;
  v13 = a2;
  v11[4] = self;
  v14 = a3;
  v10 = v7;
  dispatch_async(v9, v11);

}

- (void)startExpressModeWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFContactlessPaymentSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001255E0;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)startHostCardEmulationWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFContactlessPaymentSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100125D28;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)stopCardEmulationWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFContactlessPaymentSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012645C;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)getFelicaAppletState:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  OS_dispatch_queue *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;
  objc_super v19;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = NFSharedSignpostLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLPaymentSession:getFelicaAppletState", "in", buf, 2u);
  }

  v19.receiver = self;
  v19.super_class = (Class)_NFContactlessPaymentSession;
  v11 = -[_NFSession workQueue](&v19, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100126B08;
  v15[3] = &unk_1002E6268;
  v17 = v8;
  v18 = a2;
  v15[4] = self;
  v16 = v7;
  v13 = v7;
  v14 = v8;
  dispatch_async(v12, v15);

}

- (void)getTransitAppletState:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  OS_dispatch_queue *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;
  objc_super v19;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = NFSharedSignpostLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLPaymentSession:getTransitAppletState", "in", buf, 2u);
  }

  v19.receiver = self;
  v19.super_class = (Class)_NFContactlessPaymentSession;
  v11 = -[_NFSession workQueue](&v19, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001274A8;
  v15[3] = &unk_1002E6268;
  v17 = v8;
  v18 = a2;
  v15[4] = self;
  v16 = v7;
  v13 = v7;
  v14 = v8;
  dispatch_async(v12, v15);

}

- (BOOL)allowTransactionsInWiredMode
{
  return 0;
}

- (BOOL)_authorize:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *v16;
  _BOOL4 v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *specific;
  uint64_t Logger;
  void (*v32)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  objc_class *v39;
  int v40;
  const char *v41;
  const char *v42;
  BOOL v43;
  void *v45;
  void *v46;
  unsigned __int8 v47;
  void *v48;
  uint64_t v49;
  void (*v50)(uint64_t, const char *, ...);
  objc_class *v51;
  _BOOL4 v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  objc_class *v58;
  int v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  const char *Name;
  const char *v66;
  uint8_t buf[4];
  int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;

  v5 = a3;
  v6 = kdebug_trace(724566160, 0, 0, 0, 0);
  v7 = NFSharedSignpostLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AUTHORIZE_CALL", "begin", buf, 2u);
  }

  if (!-[_NFContactlessPaymentSession startWiredMode](self, "startWiredMode"))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v32 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v36 = 45;
      if (isMetaClass)
        v36 = 43;
      v32(3, "%c[%{public}s %{public}s]:%i Failed to set mode to wired", v36, ClassName, Name, 909);
    }
    v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v38 = NFSharedLogGetLogger(v37);
    v29 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v39 = object_getClass(self);
      if (class_isMetaClass(v39))
        v40 = 43;
      else
        v40 = 45;
      v41 = object_getClassName(self);
      v42 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v68 = v40;
      v69 = 2082;
      v70 = v41;
      v71 = 2082;
      v72 = v42;
      v73 = 1024;
      v74 = 909;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set mode to wired", buf, 0x22u);
    }
    goto LABEL_26;
  }
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
    v10 = -[_NFSession uid](self, "uid");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "instanceACL"));
    LODWORD(v10) = sub_1001DC504(v9, v5, v10, 0, v12);

    if ((_DWORD)v10)
    {
      v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v14 = NFLogGetLogger(v13);
      if (v14)
      {
        v15 = (void (*)(uint64_t, const char *, ...))v14;
        v16 = object_getClass(self);
        v17 = class_isMetaClass(v16);
        v18 = object_getClassName(self);
        v64 = sel_getName(a2);
        v19 = 45;
        if (v17)
          v19 = 43;
        v15(3, "%c[%{public}s %{public}s]:%i Failed to authorize", v19, v18, v64, 920);
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
        v68 = v24;
        v69 = 2082;
        v70 = v25;
        v71 = 2082;
        v72 = v26;
        v73 = 1024;
        v74 = 920;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to authorize", buf, 0x22u);
      }

      v27 = kdebug_trace(724566140, 0, 0, 0, 0);
      v28 = NFSharedSignpostLog(v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AUTHORIZE_APPLET_FAILED", ", buf, 2u);
      }
LABEL_26:
      v43 = 0;
      goto LABEL_27;
    }
    self->_hasAuthorized = 1;
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "handle"));
  v47 = objc_msgSend(v46, "setAlwaysOn:", 1);

  if ((v47 & 1) == 0)
  {
    v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v49 = NFLogGetLogger(v48);
    if (v49)
    {
      v50 = (void (*)(uint64_t, const char *, ...))v49;
      v51 = object_getClass(self);
      v52 = class_isMetaClass(v51);
      v53 = object_getClassName(self);
      v66 = sel_getName(a2);
      v54 = 45;
      if (v52)
        v54 = 43;
      v50(3, "%c[%{public}s %{public}s]:%i Failed to set eSE always on", v54, v53, v66, 932);
    }
    v55 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v56 = NFSharedLogGetLogger(v55);
    v57 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v58 = object_getClass(self);
      if (class_isMetaClass(v58))
        v59 = 43;
      else
        v59 = 45;
      v60 = object_getClassName(self);
      v61 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v68 = v59;
      v69 = 2082;
      v70 = v60;
      v71 = 2082;
      v72 = v61;
      v73 = 1024;
      v74 = 932;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set eSE always on", buf, 0x22u);
    }

  }
  PLLogRegisteredEvent(47, CFSTR("Card"), &off_100306678, 0);
  v43 = 1;
  v62 = kdebug_trace(724566160, 1, 0, 0, 0);
  v63 = NFSharedSignpostLog(v62);
  v29 = objc_claimAutoreleasedReturnValue(v63);
  if (os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AUTHORIZE_CALL", "success", buf, 2u);
    v43 = 1;
  }
LABEL_27:

  return v43;
}

- (void)_deauthorize
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSData *deferredAuth;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *v13;
  _BOOL4 v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  const char *v24;
  void *specific;
  uint64_t Logger;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  uint64_t v42;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *v44;
  _BOOL4 v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  objc_class *v51;
  int v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  const char *v58;
  const char *Name;
  const char *v60;
  uint64_t buf;
  _BYTE v62[32];

  v4 = kdebug_trace(724566164, 0, 0, 0, 0);
  v5 = NFSharedSignpostLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DEAUTHORIZE_CALL", "begin", (uint8_t *)&buf, 2u);
  }

  deferredAuth = self->_deferredAuth;
  self->_deferredAuth = 0;

  if (!-[_NFContactlessPaymentSession startWiredMode](self, "startWiredMode"))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v27 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v31 = 45;
      if (isMetaClass)
        v31 = 43;
      v27(3, "%c[%{public}s %{public}s]:%i Failed to set mode to wired", v31, ClassName, Name, 953);
    }
    v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v33 = NFSharedLogGetLogger(v32);
    v19 = objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v34 = object_getClass(self);
    if (class_isMetaClass(v34))
      v35 = 43;
    else
      v35 = 45;
    v36 = object_getClassName(self);
    v37 = sel_getName(a2);
    LODWORD(buf) = 67109890;
    HIDWORD(buf) = v35;
    *(_WORD *)v62 = 2082;
    *(_QWORD *)&v62[2] = v36;
    *(_WORD *)&v62[10] = 2082;
    *(_QWORD *)&v62[12] = v37;
    *(_WORD *)&v62[20] = 1024;
    *(_DWORD *)&v62[22] = 953;
    v24 = "%c[%{public}s %{public}s]:%i Failed to set mode to wired";
    goto LABEL_23;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
  v9 = sub_1001DD3DC(v8);

  if (!v9)
    goto LABEL_25;
  v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v11 = NFLogGetLogger(v10);
  if (v11)
  {
    v12 = (void (*)(uint64_t, const char *, ...))v11;
    v13 = object_getClass(self);
    v14 = class_isMetaClass(v13);
    v15 = object_getClassName(self);
    v58 = sel_getName(a2);
    v16 = 45;
    if (v14)
      v16 = 43;
    v12(3, "%c[%{public}s %{public}s]:%i Failed to deauth", v16, v15, v58, 958);
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
    v22 = object_getClassName(self);
    v23 = sel_getName(a2);
    LODWORD(buf) = 67109890;
    HIDWORD(buf) = v21;
    *(_WORD *)v62 = 2082;
    *(_QWORD *)&v62[2] = v22;
    *(_WORD *)&v62[10] = 2082;
    *(_QWORD *)&v62[12] = v23;
    *(_WORD *)&v62[20] = 1024;
    *(_DWORD *)&v62[22] = 958;
    v24 = "%c[%{public}s %{public}s]:%i Failed to deauth";
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&buf, 0x22u);
  }
LABEL_24:

LABEL_25:
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "handle"));
  v40 = objc_msgSend(v39, "setAlwaysOn:", 0);

  if ((v40 & 1) == 0)
  {
    v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v42 = NFLogGetLogger(v41);
    if (v42)
    {
      v43 = (void (*)(uint64_t, const char *, ...))v42;
      v44 = object_getClass(self);
      v45 = class_isMetaClass(v44);
      v46 = object_getClassName(self);
      v60 = sel_getName(a2);
      v47 = 45;
      if (v45)
        v47 = 43;
      v43(3, "%c[%{public}s %{public}s]:%i Failed to disable eSE always on", v47, v46, v60, 963, buf, *(_OWORD *)v62, *(_OWORD *)&v62[16]);
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
      v53 = object_getClassName(self);
      v54 = sel_getName(a2);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v52;
      *(_WORD *)v62 = 2082;
      *(_QWORD *)&v62[2] = v53;
      *(_WORD *)&v62[10] = 2082;
      *(_QWORD *)&v62[12] = v54;
      *(_WORD *)&v62[20] = 1024;
      *(_DWORD *)&v62[22] = 963;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disable eSE always on", (uint8_t *)&buf, 0x22u);
    }

  }
  PLLogRegisteredEvent(47, CFSTR("Card"), &off_1003066A0, 0);
  self->_hasAuthorized = 0;
  v55 = kdebug_trace(724566164, 1, 0, 0, 0);
  v56 = NFSharedSignpostLog(v55);
  v57 = objc_claimAutoreleasedReturnValue(v56);
  if (os_signpost_enabled(v57))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v57, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DEAUTHORIZE_CALL", "success", (uint8_t *)&buf, 2u);
  }

}

- (BOOL)startCardEmulationWithType:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  objc_super v10;
  uint8_t buf[16];

  v5 = kdebug_trace(724566112, 0, 0, 0, 0);
  v6 = NFSharedSignpostLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TX_CE", "start Card Emulation", buf, 2u);
  }

  self->_transactionState = 0;
  v10.receiver = self;
  v10.super_class = (Class)_NFContactlessPaymentSession;
  v8 = -[_NFContactlessSession startCardEmulationWithType:](&v10, "startCardEmulationWithType:", a3);
  if (v8)
  {
    self->_inWiredMode = 0;
    -[NFTimer stopTimer](self->_restartRoutingTimer, "stopTimer");
  }
  return v8;
}

- (BOOL)startWiredMode
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  objc_super v11;
  uint8_t buf[16];

  -[_NFContactlessPaymentSession waitForSafeTransactionCompletion](self, "waitForSafeTransactionCompletion");
  v3 = kdebug_trace(724566116, 0, 0, 0, 0);
  v4 = NFSharedSignpostLog(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TX_WIRED", "start Wired Mode", buf, 2u);
  }

  if (self->_deferredAuthRequested)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig embeddedWiredModeWithFD:](NFRoutingConfig, "embeddedWiredModeWithFD:", 2));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "setRoutingConfig:", v7));

    v9 = v8 == 0;
    if (!v8)
      self->_inWiredMode = 1;

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_NFContactlessPaymentSession;
    if (-[_NFContactlessSession startWiredMode](&v11, "startWiredMode"))
    {
      v9 = 1;
      self->_inWiredMode = 1;
    }
    else
    {
      return 0;
    }
  }
  return v9;
}

- (BOOL)startDefaultMode
{
  _BOOL4 v3;
  objc_super v5;

  -[_NFContactlessPaymentSession waitForSafeTransactionCompletion](self, "waitForSafeTransactionCompletion");
  v5.receiver = self;
  v5.super_class = (Class)_NFContactlessPaymentSession;
  v3 = -[_NFContactlessSession startDefaultMode](&v5, "startDefaultMode");
  if (v3)
    self->_inWiredMode = 0;
  return v3;
}

- (BOOL)startFieldDetectMode
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  objc_super v8;
  uint8_t buf[16];

  -[_NFContactlessPaymentSession waitForSafeTransactionCompletion](self, "waitForSafeTransactionCompletion");
  v3 = kdebug_trace(724566120, 0, 0, 0, 0);
  v4 = NFSharedSignpostLog(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TX_FD", "start Field Detect Mode", buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)_NFContactlessPaymentSession;
  v6 = -[_NFContactlessSession startFieldDetectMode](&v8, "startFieldDetectMode");
  if (v6)
    self->_inWiredMode = 0;
  return v6;
}

- (void)waitForSafeTransactionCompletion
{
  unsigned int transactionState;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *v8;
  _BOOL4 v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  BOOL v20;
  int v21;
  void *v23;
  uint64_t v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  _BOOL4 v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  unsigned int v37;
  void *v38;
  void *v39;
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
  NSObject *v50;
  objc_class *v51;
  int v52;
  const char *v53;
  const char *v54;
  const char *v55;
  NSObject *v56;
  os_log_type_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *specific;
  uint64_t Logger;
  void (*v65)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  objc_class *v73;
  int v74;
  unsigned int v75;
  void *v76;
  void *v77;
  unsigned int v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  uint64_t v83;
  void (*v84)(uint64_t, const char *, ...);
  objc_class *v85;
  _BOOL4 v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  objc_class *v91;
  int v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  const char *Name;
  const char *v102;
  uint8_t buf[4];
  int v104;
  __int16 v105;
  const char *v106;
  __int16 v107;
  const char *v108;
  __int16 v109;
  int v110;

  if (!self->_dontWaitForEOT && !self->_inWiredMode)
  {
    transactionState = self->_transactionState;
    if (transactionState == 2)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "moduleIdentifier"));
      v60 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A4A8, 10);
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "NF_asHexString"));
      v62 = objc_msgSend(v59, "caseInsensitiveCompare:", v61);

      if (!v62)
      {
        usleep(0x61A80u);
LABEL_68:
        self->_transactionState = 0;
        return;
      }
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v65 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v69 = 45;
        if (isMetaClass)
          v69 = 43;
        v65(6, "%c[%{public}s %{public}s]:%i Waiting for RAPDU Sent notification", v69, ClassName, Name, 1058);
      }
      v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v71 = NFSharedLogGetLogger(v70);
      v72 = objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        v73 = object_getClass(self);
        if (class_isMetaClass(v73))
          v74 = 43;
        else
          v74 = 45;
        *(_DWORD *)buf = 67109890;
        v104 = v74;
        v105 = 2082;
        v106 = object_getClassName(self);
        v107 = 2082;
        v108 = sel_getName(a2);
        v109 = 1024;
        v110 = 1058;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Waiting for RAPDU Sent notification", buf, 0x22u);
      }

      v75 = -10;
      while (1)
      {
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "handle"));
        v78 = objc_msgSend(v77, "hasSentRAPDU");

        if (v78)
          break;
        v79 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "handle"));
        v81 = objc_msgSend(v80, "hasTransactionEnded");

        if ((v81 & 1) == 0)
        {
          usleep(0x2710u);
          v75 += 10;
          if (v75 >> 1 < 0x9BF)
            continue;
        }
        goto LABEL_16;
      }
      v95 = kdebug_trace(724566100, 0, 0, 0, 0);
      v96 = NFSharedSignpostLog(v95);
      v97 = objc_claimAutoreleasedReturnValue(v96);
      if (os_signpost_enabled(v97))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v97, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TX_RADPU_SENT", ", buf, 2u);
      }

      usleep(0x30D40u);
    }
    else
    {
      if (transactionState != 4)
      {
LABEL_17:
        v20 = transactionState > 4;
        v21 = (1 << transactionState) & 0x16;
        if (!v20 && v21 != 0)
        {
          v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v24 = NFLogGetLogger(v23);
          if (v24)
          {
            v25 = (void (*)(uint64_t, const char *, ...))v24;
            v26 = object_getClass(self);
            v27 = class_isMetaClass(v26);
            v28 = object_getClassName(self);
            v99 = sel_getName(a2);
            v29 = 45;
            if (v27)
              v29 = 43;
            v25(6, "%c[%{public}s %{public}s]:%i Waiting for transaction to end...", v29, v28, v99, 1080);
          }
          v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v31 = NFSharedLogGetLogger(v30);
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = object_getClass(self);
            if (class_isMetaClass(v33))
              v34 = 43;
            else
              v34 = 45;
            v35 = object_getClassName(self);
            v36 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v104 = v34;
            v105 = 2082;
            v106 = v35;
            v107 = 2082;
            v108 = v36;
            v109 = 1024;
            v110 = 1080;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Waiting for transaction to end...", buf, 0x22u);
          }

          v37 = -50;
          while (1)
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "handle"));
            v40 = objc_msgSend(v39, "hasTransactionEnded");

            if (v40)
              break;
            usleep(0xC350u);
            v37 += 50;
            if (v37 >> 1 >= 0x9AB)
            {
              v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v42 = NFLogGetLogger(v41);
              if (v42)
              {
                v43 = (void (*)(uint64_t, const char *, ...))v42;
                v44 = object_getClass(self);
                v45 = class_isMetaClass(v44);
                v46 = object_getClassName(self);
                v100 = sel_getName(a2);
                v47 = 45;
                if (v45)
                  v47 = 43;
                v43(3, "%c[%{public}s %{public}s]:%i Timed out", v47, v46, v100, 1096);
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
                v53 = object_getClassName(self);
                v54 = sel_getName(a2);
                *(_DWORD *)buf = 67109890;
                v104 = v52;
                v105 = 2082;
                v106 = v53;
                v107 = 2082;
                v108 = v54;
                v109 = 1024;
                v110 = 1096;
                v55 = "%c[%{public}s %{public}s]:%i Timed out";
                v56 = v50;
                v57 = OS_LOG_TYPE_ERROR;
LABEL_66:
                _os_log_impl((void *)&_mh_execute_header, v56, v57, v55, buf, 0x22u);
                goto LABEL_67;
              }
              goto LABEL_67;
            }
          }
          v82 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v83 = NFLogGetLogger(v82);
          if (v83)
          {
            v84 = (void (*)(uint64_t, const char *, ...))v83;
            v85 = object_getClass(self);
            v86 = class_isMetaClass(v85);
            v87 = object_getClassName(self);
            v102 = sel_getName(a2);
            v88 = 45;
            if (v86)
              v88 = 43;
            v84(6, "%c[%{public}s %{public}s]:%i transaction has completed", v88, v87, v102, 1088);
          }
          v89 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v90 = NFSharedLogGetLogger(v89);
          v50 = objc_claimAutoreleasedReturnValue(v90);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            v91 = object_getClass(self);
            if (class_isMetaClass(v91))
              v92 = 43;
            else
              v92 = 45;
            v93 = object_getClassName(self);
            v94 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v104 = v92;
            v105 = 2082;
            v106 = v93;
            v107 = 2082;
            v108 = v94;
            v109 = 1024;
            v110 = 1088;
            v55 = "%c[%{public}s %{public}s]:%i transaction has completed";
            v56 = v50;
            v57 = OS_LOG_TYPE_DEFAULT;
            goto LABEL_66;
          }
LABEL_67:

        }
        goto LABEL_68;
      }
      v5 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v6 = NFLogGetLogger(v5);
      if (v6)
      {
        v7 = (void (*)(uint64_t, const char *, ...))v6;
        v8 = object_getClass(self);
        v9 = class_isMetaClass(v8);
        v10 = object_getClassName(self);
        v98 = sel_getName(a2);
        v11 = 45;
        if (v9)
          v11 = 43;
        v7(6, "%c[%{public}s %{public}s]:%i Field lost before End Of Transaction - disabling emulation", v11, v10, v98, 1045);
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
        v104 = v16;
        v105 = 2082;
        v106 = object_getClassName(self);
        v107 = 2082;
        v108 = sel_getName(a2);
        v109 = 1024;
        v110 = 1045;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Field lost before End Of Transaction - disabling emulation", buf, 0x22u);
      }

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig embeddedWiredModeWithFD:](NFRoutingConfig, "embeddedWiredModeWithFD:", 0));
    v19 = objc_msgSend(v17, "setRoutingConfig:", v18);

LABEL_16:
    transactionState = self->_transactionState;
    goto LABEL_17;
  }
}

- (BOOL)_isField:(id)a3 compatibleWithApplet:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isTypeF") & 1) == 0 && (objc_msgSend(v6, "rfTechnology") & 3) != 0
    || objc_msgSend(v7, "isTypeF") && (objc_msgSend(v6, "rfTechnology") & 4) != 0)
  {
    v10 = 1;
  }
  else
  {
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v10 = sub_10004C0C4(v8, v9, v6);

  }
  return v10;
}

- (BOOL)_checkActiveAppletCompatibilityWithField:(id)a3
{
  id v5;
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
  BOOL v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  uint64_t v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  _BOOL4 v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  int v45;
  const char *v46;
  const char *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void (*v55)(uint64_t, const char *, ...);
  objc_class *v56;
  _BOOL4 v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  objc_class *v62;
  int v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void (*v70)(uint64_t, const char *, ...);
  objc_class *v71;
  _BOOL4 v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  objc_class *v78;
  int v79;
  const char *v80;
  const char *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void (*v85)(uint64_t, const char *, ...);
  objc_class *v86;
  _BOOL4 v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  NSObject *v91;
  objc_class *v92;
  int v93;
  const char *v94;
  const char *v95;
  const char *v97;
  const char *v98;
  const char *v99;
  const char *Name;
  const char *v101;
  const char *v102;
  const char *v103;
  const char *v104;
  const char *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint8_t v110[128];
  uint8_t buf[4];
  int v112;
  __int16 v113;
  const char *v114;
  __int16 v115;
  const char *v116;
  __int16 v117;
  int v118;
  __int16 v119;
  id v120;

  v5 = a3;
  if (objc_msgSend(v5, "rfTechnology") == 8)
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
      v8(4, "%c[%{public}s %{public}s]:%i Only ECP found; assumes active applet is compatible with reader",
        v12,
        ClassName,
        Name,
        1125);
    }
    v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(self);
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      *(_DWORD *)buf = 67109890;
      v112 = v17;
      v113 = 2082;
      v114 = object_getClassName(self);
      v115 = 2082;
      v116 = sel_getName(a2);
      v117 = 1024;
      v118 = 1125;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Only ECP found; assumes active applet is compatible with reader",
        buf,
        0x22u);
    }
    v18 = 1;
LABEL_75:

    goto LABEL_76;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
  v20 = -[_NFContactlessPaymentSession _isField:compatibleWithApplet:](self, "_isField:compatibleWithApplet:", v5, v19);

  if ((v20 & 1) == 0)
  {
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v22 = NFLogGetLogger(v21);
    if (v22)
    {
      v23 = (void (*)(uint64_t, const char *, ...))v22;
      v24 = object_getClass(self);
      v25 = class_isMetaClass(v24);
      v26 = object_getClassName(self);
      v101 = sel_getName(a2);
      v27 = 45;
      if (v25)
        v27 = 43;
      v23(6, "%c[%{public}s %{public}s]:%i Active applet not compatible with current field - checking for group members", v27, v26, v101, 1131);
    }
    v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v29 = NFSharedLogGetLogger(v28);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = object_getClass(self);
      if (class_isMetaClass(v31))
        v32 = 43;
      else
        v32 = 45;
      *(_DWORD *)buf = 67109890;
      v112 = v32;
      v113 = 2082;
      v114 = object_getClassName(self);
      v115 = 2082;
      v116 = sel_getName(a2);
      v117 = 1024;
      v118 = 1131;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Active applet not compatible with current field - checking for group members", buf, 0x22u);
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeAppletGroupMembers](self, "activeAppletGroupMembers"));
    v34 = objc_msgSend(v33, "copy");

    if (v34)
    {
      v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v36 = NFLogGetLogger(v35);
      if (v36)
      {
        v37 = (void (*)(uint64_t, const char *, ...))v36;
        v38 = object_getClass(self);
        v39 = class_isMetaClass(v38);
        v97 = object_getClassName(self);
        v102 = sel_getName(a2);
        v40 = 45;
        if (v39)
          v40 = 43;
        v37(6, "%c[%{public}s %{public}s]:%i Group applets: %{public}@", v40, v97, v102, 1135, v34);
      }
      v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v42 = NFSharedLogGetLogger(v41);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = object_getClass(self);
        if (class_isMetaClass(v44))
          v45 = 43;
        else
          v45 = 45;
        v46 = object_getClassName(self);
        v47 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v112 = v45;
        v113 = 2082;
        v114 = v46;
        v115 = 2082;
        v116 = v47;
        v117 = 1024;
        v118 = 1135;
        v119 = 2114;
        v120 = v34;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Group applets: %{public}@", buf, 0x2Cu);
      }

    }
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v15 = v34;
    v48 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v106, v110, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v107;
LABEL_36:
      v51 = 0;
      while (1)
      {
        if (*(_QWORD *)v107 != v50)
          objc_enumerationMutation(v15);
        v52 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v51);
        if (-[_NFContactlessPaymentSession _isField:compatibleWithApplet:](self, "_isField:compatibleWithApplet:", v5, v52))
        {
          break;
        }
        if (v49 == (id)++v51)
        {
          v49 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v106, v110, 16);
          if (v49)
            goto LABEL_36;
          goto LABEL_63;
        }
      }
      v53 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v54 = NFLogGetLogger(v53);
      if (v54)
      {
        v55 = (void (*)(uint64_t, const char *, ...))v54;
        v56 = object_getClass(self);
        v57 = class_isMetaClass(v56);
        v98 = object_getClassName(self);
        v103 = sel_getName(a2);
        v58 = 45;
        if (v57)
          v58 = 43;
        v55(6, "%c[%{public}s %{public}s]:%i Found compatible group applet: %{public}@", v58, v98, v103, 1141, v52);
      }
      v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v60 = NFSharedLogGetLogger(v59);
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v62 = object_getClass(self);
        if (class_isMetaClass(v62))
          v63 = 43;
        else
          v63 = 45;
        v64 = object_getClassName(self);
        v65 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v112 = v63;
        v113 = 2082;
        v114 = v64;
        v115 = 2082;
        v116 = v65;
        v117 = 1024;
        v118 = 1141;
        v119 = 2114;
        v120 = v52;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found compatible group applet: %{public}@", buf, 0x2Cu);
      }

      v66 = objc_claimAutoreleasedReturnValue(-[_NFContactlessSession setActiveApplet:](self, "setActiveApplet:", v52));
      if (!v66)
      {
        v18 = 1;
        v91 = v15;
        goto LABEL_74;
      }
      v67 = (void *)v66;
      v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v69 = NFLogGetLogger(v68);
      if (v69)
      {
        v70 = (void (*)(uint64_t, const char *, ...))v69;
        v71 = object_getClass(self);
        v72 = class_isMetaClass(v71);
        v73 = object_getClassName(self);
        v104 = sel_getName(a2);
        v74 = 45;
        if (v72)
          v74 = 43;
        v70(3, "%c[%{public}s %{public}s]:%i Failed to switch to group applet - firing auth failure", v74, v73, v104, 1144);
      }
      v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v76 = NFSharedLogGetLogger(v75);
      v77 = objc_claimAutoreleasedReturnValue(v76);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v78 = object_getClass(self);
        if (class_isMetaClass(v78))
          v79 = 43;
        else
          v79 = 45;
        v80 = object_getClassName(self);
        v81 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v112 = v79;
        v113 = 2082;
        v114 = v80;
        v115 = 2082;
        v116 = v81;
        v117 = 1024;
        v118 = 1144;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to switch to group applet - firing auth failure", buf, 0x22u);
      }

      v82 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
      objc_msgSend(v82, "didFailDeferredAuthorization");

      -[_NFContactlessPaymentSession startDefaultMode](self, "startDefaultMode");
    }
LABEL_63:

    v83 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v84 = NFLogGetLogger(v83);
    if (v84)
    {
      v85 = (void (*)(uint64_t, const char *, ...))v84;
      v86 = object_getClass(self);
      v87 = class_isMetaClass(v86);
      v99 = object_getClassName(self);
      v105 = sel_getName(a2);
      v88 = 45;
      if (v87)
        v88 = 43;
      v85(3, "%c[%{public}s %{public}s]:%i No compatible applet found for field: %{public}@", v88, v99, v105, 1155, v5);
    }
    v89 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v90 = NFSharedLogGetLogger(v89);
    v91 = objc_claimAutoreleasedReturnValue(v90);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      v92 = object_getClass(self);
      if (class_isMetaClass(v92))
        v93 = 43;
      else
        v93 = 45;
      v94 = object_getClassName(self);
      v95 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v112 = v93;
      v113 = 2082;
      v114 = v94;
      v115 = 2082;
      v116 = v95;
      v117 = 1024;
      v118 = 1155;
      v119 = 2114;
      v120 = v5;
      _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No compatible applet found for field: %{public}@", buf, 0x2Cu);
    }
    v18 = 0;
LABEL_74:

    goto LABEL_75;
  }
  v18 = 1;
LABEL_76:

  return v18;
}

- (BOOL)_checkDeferredActiveAppletCompatibilityWithField:(id)a3
{
  id v5;
  void *v6;
  void *v7;
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
  void *v19;
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
  void *v32;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession deferredActivationApplet](self, "deferredActivationApplet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessPaymentSession _switchToBestGroupMemberOfHead:forField:](self, "_switchToBestGroupMemberOfHead:forField:", v6, v5));

  if (v7)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i Failed to _switchToBestGroupMember, back to defaultMode : %{public}@", v13, ClassName, Name, 1165, v7);
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
      *(_DWORD *)buf = 67110146;
      v24 = v18;
      v25 = 2082;
      v26 = object_getClassName(self);
      v27 = 2082;
      v28 = sel_getName(a2);
      v29 = 1024;
      v30 = 1165;
      v31 = 2114;
      v32 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to _switchToBestGroupMember, back to defaultMode : %{public}@", buf, 0x2Cu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v19, "didFailDeferredAuthorization");

    -[_NFContactlessPaymentSession startDefaultMode](self, "startDefaultMode");
  }

  return v7 == 0;
}

- (BOOL)_checkActiveVASCompatibilityWithField:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[_NFContactlessPaymentSession readyForVAS](self, "readyForVAS")
    && objc_msgSend(v4, "notificationType") == (id)2
    && objc_msgSend(v4, "terminalMode") < 3;

  return v5;
}

- (void)_performDeferredAuthIfNeeded:(id)a3
{
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  _BOOL4 deferredAuthRequested;
  unsigned int v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  uint64_t v27;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *v29;
  _BOOL4 v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  const char *v40;
  NSObject *v41;
  os_log_type_t v42;
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
  NSData *deferredAuth;
  NSData *v57;
  const char *v58;
  const char *v59;
  _QWORD v60[5];
  uint8_t buf[4];
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  _BOOL4 v70;
  __int16 v71;
  id v72;

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
    v13 = 45;
    if (isMetaClass)
      v13 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i deferred requested:%d - field:%{public}@", v13, ClassName, Name, 1189, self->_deferredAuthRequested, v5);
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
    v19 = object_getClassName(self);
    v20 = sel_getName(a2);
    deferredAuthRequested = self->_deferredAuthRequested;
    *(_DWORD *)buf = 67110402;
    v62 = v18;
    v63 = 2082;
    v64 = v19;
    v65 = 2082;
    v66 = v20;
    v67 = 1024;
    v68 = 1189;
    v69 = 1024;
    v70 = deferredAuthRequested;
    v71 = 2114;
    v72 = v5;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i deferred requested:%d - field:%{public}@", buf, 0x32u);
  }

  if (!self->_deferredAuthRequested)
  {
    v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v27 = NFLogGetLogger(v26);
    if (v27)
    {
      v28 = (void (*)(uint64_t, const char *, ...))v27;
      v29 = object_getClass(self);
      v30 = class_isMetaClass(v29);
      v31 = object_getClassName(self);
      v58 = sel_getName(a2);
      v32 = 45;
      if (v30)
        v32 = 43;
      v28(6, "%c[%{public}s %{public}s]:%i deferred auth not requested", v32, v31, v58, 1191);
    }
    v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v34 = NFSharedLogGetLogger(v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    v36 = object_getClass(self);
    if (class_isMetaClass(v36))
      v37 = 43;
    else
      v37 = 45;
    v38 = object_getClassName(self);
    v39 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v62 = v37;
    v63 = 2082;
    v64 = v38;
    v65 = 2082;
    v66 = v39;
    v67 = 1024;
    v68 = 1191;
    v40 = "%c[%{public}s %{public}s]:%i deferred auth not requested";
    v41 = v35;
    v42 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_34;
  }
  if (!self->_fieldPresent)
  {
    v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v44 = NFLogGetLogger(v43);
    if (v44)
    {
      v45 = (void (*)(uint64_t, const char *, ...))v44;
      v46 = object_getClass(self);
      v47 = class_isMetaClass(v46);
      v48 = object_getClassName(self);
      v59 = sel_getName(a2);
      v49 = 45;
      if (v47)
        v49 = 43;
      v45(3, "%c[%{public}s %{public}s]:%i no field", v49, v48, v59, 1196);
    }
    v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v51 = NFSharedLogGetLogger(v50);
    v35 = objc_claimAutoreleasedReturnValue(v51);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    v52 = object_getClass(self);
    if (class_isMetaClass(v52))
      v53 = 43;
    else
      v53 = 45;
    v54 = object_getClassName(self);
    v55 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v62 = v53;
    v63 = 2082;
    v64 = v54;
    v65 = 2082;
    v66 = v55;
    v67 = 1024;
    v68 = 1196;
    v40 = "%c[%{public}s %{public}s]:%i no field";
    v41 = v35;
    v42 = OS_LOG_TYPE_ERROR;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v41, v42, v40, buf, 0x22u);
LABEL_35:

    goto LABEL_39;
  }
  v22 = -[_NFContactlessPaymentSession _checkActiveVASCompatibilityWithField:](self, "_checkActiveVASCompatibilityWithField:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));

  if (v23)
    LODWORD(v23) = -[_NFContactlessPaymentSession _checkActiveAppletCompatibilityWithField:](self, "_checkActiveAppletCompatibilityWithField:", v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession deferredActivationApplet](self, "deferredActivationApplet"));

  if (v24)
    v25 = -[_NFContactlessPaymentSession _checkDeferredActiveAppletCompatibilityWithField:](self, "_checkDeferredActiveAppletCompatibilityWithField:", v5);
  else
    v25 = 0;
  if ((v23 | v25 | v22) == 1)
  {
    deferredAuth = self->_deferredAuth;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10012A2E8;
    v60[3] = &unk_1002E8A20;
    v60[4] = self;
    -[_NFContactlessPaymentSession _performAuthAndStartCardEmulation:fromDeferred:completion:](self, "_performAuthAndStartCardEmulation:fromDeferred:completion:", deferredAuth, 1, v60);
    v57 = self->_deferredAuth;
    self->_deferredAuth = 0;

  }
LABEL_39:

}

- (void)_performAuthAndStartCardEmulation:(id)a3 fromDeferred:(BOOL)a4 completion:(id)a5
{
  char *v8;
  void (**v9)(id, id);
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  char *v26;
  void *v27;
  uint64_t v28;
  void (*v29)(uint64_t, const char *, ...);
  objc_class *v30;
  _BOOL4 v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  NFApplet *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  _BOOL8 v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  void (*v66)(uint64_t, const char *, ...);
  objc_class *v67;
  _BOOL4 v68;
  const char *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  objc_class *v76;
  int v77;
  const char *v78;
  const char *v79;
  const char *v80;
  id v81;
  uint64_t v82;
  NSObject *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  void *v93;
  uint64_t v94;
  void (*v95)(uint64_t, const char *, ...);
  objc_class *v96;
  _BOOL4 v97;
  const char *v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  NSObject *v104;
  objc_class *v105;
  int v106;
  const char *v107;
  const char *v108;
  const char *v109;
  id v110;
  id v111;
  const char *v112;
  const char *v113;
  _BOOL4 v114;
  objc_super v115;
  NSErrorUserInfoKey v116;
  void *v117;
  NSErrorUserInfoKey v118;
  void *v119;
  uint8_t buf[4];
  int v121;
  __int16 v122;
  const char *v123;
  __int16 v124;
  const char *v125;
  __int16 v126;
  int v127;
  __int16 v128;
  const char *v129;

  v114 = a4;
  v8 = (char *)a3;
  v9 = (void (**)(id, id))a5;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
    v18 = 45;
    if (isMetaClass)
      v18 = 43;
    v12(6, "%c[%{public}s %{public}s]:%i %{public}@", v18, ClassName, Name, 1228, v17);

  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFSharedLogGetLogger(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = object_getClass(self);
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    v24 = object_getClassName(self);
    v25 = sel_getName(a2);
    v26 = (char *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
    *(_DWORD *)buf = 67110146;
    v121 = v23;
    v122 = 2082;
    v123 = v24;
    v124 = 2082;
    v125 = v25;
    v126 = 1024;
    v127 = 1228;
    v128 = 2114;
    v129 = v26;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v28 = NFLogGetLogger(v27);
  if (v28)
  {
    v29 = (void (*)(uint64_t, const char *, ...))v28;
    v30 = object_getClass(self);
    v31 = class_isMetaClass(v30);
    v112 = object_getClassName(self);
    v113 = sel_getName(a2);
    v32 = 45;
    if (v31)
      v32 = 43;
    v29(6, "%c[%{public}s %{public}s]:%i auth: %{public}@", v32, v112, v113, 1229, v8);
  }
  v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v34 = NFSharedLogGetLogger(v33);
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = object_getClass(self);
    if (class_isMetaClass(v36))
      v37 = 43;
    else
      v37 = 45;
    v38 = object_getClassName(self);
    v39 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v121 = v37;
    v122 = 2082;
    v123 = v38;
    v124 = 2082;
    v125 = v39;
    v126 = 1024;
    v127 = 1229;
    v128 = 2114;
    v129 = v8;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i auth: %{public}@", buf, 0x2Cu);
  }

  v41 = NFSharedSignpostLog(v40);
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_signpost_enabled(v42))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "performAuthAndStartCardEmulation", ", buf, 2u);
  }

  self->_deferredAuthRequested = 0;
  -[NFTimer stopTimer](self->_deferredAuthTimer, "stopTimer");
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
  v115.receiver = self;
  v115.super_class = (Class)_NFContactlessPaymentSession;
  v44 = -[_NFContactlessSession activeApplet](&v115, "activeApplet");
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v46 = sub_10023A858((uint64_t)v43, v45);

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v48 = v47;
  if (v46)
    v49 = 2;
  else
    v49 = 1;
  objc_msgSend(v47, "reconfigureDynamicTransitRF:withOverride:", v49, 1);

  if (v8)
  {
    if (!v114
      || (v50 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet")),
          v50,
          v50))
    {
      sub_10023B69C((uint64_t)NFSecureElementWrapper);
      v51 = kdebug_trace(724566064, 0, 0, 0, 0);
      v52 = NFSharedSignpostLog(v51);
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_signpost_enabled(v53))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v53, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AUTHORIZE_APPLET", ", buf, 2u);
      }

      v54 = -[_NFContactlessPaymentSession _authorize:](self, "_authorize:", v8);
      if (!v54)
      {
        v91 = NFSharedSignpostLog(v54);
        v92 = objc_claimAutoreleasedReturnValue(v91);
        if (os_signpost_enabled(v92))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v92, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "performAuthAndStartCardEmulation", "error", buf, 2u);
        }

        v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v94 = NFLogGetLogger(v93);
        if (v94)
        {
          v95 = (void (*)(uint64_t, const char *, ...))v94;
          v96 = object_getClass(self);
          v97 = class_isMetaClass(v96);
          v98 = object_getClassName(self);
          v99 = sel_getName(a2);
          if (v114)
            v100 = "yes";
          else
            v100 = "no";
          v101 = 45;
          if (v97)
            v101 = 43;
          v95(3, "%c[%{public}s %{public}s]:%i Authorization failed.  For deferred - [%s]", v101, v98, v99, 1261, v100);
        }
        v102 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v103 = NFSharedLogGetLogger(v102);
        v104 = objc_claimAutoreleasedReturnValue(v103);
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          v105 = object_getClass(self);
          if (class_isMetaClass(v105))
            v106 = 43;
          else
            v106 = 45;
          v107 = object_getClassName(self);
          v108 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          if (v114)
            v109 = "yes";
          else
            v109 = "no";
          v121 = v106;
          v122 = 2082;
          v123 = v107;
          v124 = 2082;
          v125 = v108;
          v126 = 1024;
          v127 = 1261;
          v128 = 2080;
          v129 = v109;
          _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Authorization failed.  For deferred - [%s]", buf, 0x2Cu);
        }

        v110 = objc_alloc((Class)NSError);
        v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v118 = NSLocalizedDescriptionKey;
        v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
        v119 = v86;
        v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1));
        v88 = v110;
        v89 = v85;
        v90 = 16;
        goto LABEL_78;
      }
    }
  }
  v55 = kdebug_trace(724566068, 0, 0, 0, 0);
  v56 = NFSharedSignpostLog(v55);
  v57 = objc_claimAutoreleasedReturnValue(v56);
  if (os_signpost_enabled(v57))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v57, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "START_PAYMENT_EMULATION", ", buf, 2u);
  }

  if (!-[_NFContactlessPaymentSession startCardEmulationWithType:](self, "startCardEmulationWithType:", -[_NFContactlessPaymentSession defaultEmulationType](self, "defaultEmulationType")))
  {
    v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v65 = NFLogGetLogger(v64);
    if (v65)
    {
      v66 = (void (*)(uint64_t, const char *, ...))v65;
      v67 = object_getClass(self);
      v68 = class_isMetaClass(v67);
      v69 = object_getClassName(self);
      v70 = sel_getName(a2);
      if (v114)
        v71 = " (from) deferred";
      else
        v71 = "";
      v72 = 45;
      if (v68)
        v72 = 43;
      v66(3, "%c[%{public}s %{public}s]:%i Failed to start%s card emulation", v72, v69, v70, 1272, v71);
    }
    v73 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v74 = NFSharedLogGetLogger(v73);
    v75 = objc_claimAutoreleasedReturnValue(v74);
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      v76 = object_getClass(self);
      if (class_isMetaClass(v76))
        v77 = 43;
      else
        v77 = 45;
      v78 = object_getClassName(self);
      v79 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      if (v114)
        v80 = " (from) deferred";
      else
        v80 = "";
      v121 = v77;
      v122 = 2082;
      v123 = v78;
      v124 = 2082;
      v125 = v79;
      v126 = 1024;
      v127 = 1272;
      v128 = 2080;
      v129 = v80;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start%s card emulation", buf, 0x2Cu);
    }

    if (self->_hasAuthorized)
      v81 = -[_NFContactlessPaymentSession _deauthorize](self, "_deauthorize");
    v82 = NFSharedSignpostLog(v81);
    v83 = objc_claimAutoreleasedReturnValue(v82);
    if (os_signpost_enabled(v83))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v83, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "performAuthAndStartCardEmulation", "error", buf, 2u);
    }

    v84 = objc_alloc((Class)NSError);
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v116 = NSLocalizedDescriptionKey;
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
    v117 = v86;
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1));
    v88 = v84;
    v89 = v85;
    v90 = 15;
LABEL_78:
    v111 = objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, v90, v87);
    v9[2](v9, v111);

    -[_NFContactlessPaymentSession startDefaultMode](self, "startDefaultMode");
    goto LABEL_79;
  }
  +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &off_1003066C8);
  sub_10020BD44((uint64_t)NFDailyStatisticsCALogger, CFSTR("totalCEEnable"));
  v59 = NFSharedSignpostLog(v58);
  v60 = objc_claimAutoreleasedReturnValue(v59);
  if (os_signpost_enabled(v60))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v60, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "performAuthAndStartCardEmulation", ", buf, 2u);
  }

  if (!v114)
  {
    v61 = kdebug_trace(724566152, 0, 0, 0, 0);
    v62 = NFSharedSignpostLog(v61);
    v63 = objc_claimAutoreleasedReturnValue(v62);
    if (os_signpost_enabled(v63))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v63, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLIENT_CALLBACK", ", buf, 2u);
    }

  }
  v9[2](v9, 0);
LABEL_79:

}

- (id)_switchToBestGroupMemberOfHead:(id)a3 forField:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  void *v33;
  uint64_t v34;
  void (*v35)(uint64_t, const char *, ...);
  objc_class *v36;
  _BOOL4 v37;
  const char *v38;
  const char *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  objc_class *v46;
  int v47;
  const char *v48;
  const char *v49;
  void *v50;
  void *v51;
  void *specific;
  uint64_t Logger;
  void (*v54)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  objc_class *v64;
  int v65;
  const char *v66;
  const char *v67;
  void *v68;
  const char *v70;
  const char *v71;
  void *v72;
  id v74;
  __int128 v75;
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
  void *v88;
  _BYTE v89[128];

  v6 = a3;
  v74 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v7);

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v72 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupMemberIDs"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v76;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v76 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
        v15 = sub_10022F2F0(v14, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

        if (v16)
        {
          v17 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
          v19 = sub_10004C0C4(v17, v18, v74);

          if (v19)
          {
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            Logger = NFLogGetLogger(specific);
            if (Logger)
            {
              v54 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
              v60 = 45;
              if (isMetaClass)
                v60 = 43;
              v54(6, "%c[%{public}s %{public}s]:%i Applet %{public}@ matches field, switching", v60, ClassName, Name, 1314, v59);

            }
            v61 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v62 = NFSharedLogGetLogger(v61);
            v63 = objc_claimAutoreleasedReturnValue(v62);
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              v64 = object_getClass(self);
              if (class_isMetaClass(v64))
                v65 = 43;
              else
                v65 = 45;
              v66 = object_getClassName(self);
              v67 = sel_getName(a2);
              v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
              *(_DWORD *)buf = 67110146;
              v80 = v65;
              v81 = 2082;
              v82 = v66;
              v83 = 2082;
              v84 = v67;
              v85 = 1024;
              v86 = 1314;
              v87 = 2114;
              v88 = v68;
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Applet %{public}@ matches field, switching", buf, 0x2Cu);

            }
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession setActiveApplet:](self, "setActiveApplet:", v16));

            v45 = v72;
            goto LABEL_41;
          }
        }
        else
        {
          v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v21 = NFLogGetLogger(v20);
          if (v21)
          {
            v22 = (void (*)(uint64_t, const char *, ...))v21;
            v23 = object_getClass(self);
            v24 = class_isMetaClass(v23);
            v70 = object_getClassName(self);
            v71 = sel_getName(a2);
            v25 = 45;
            if (v24)
              v25 = 43;
            v22(4, "%c[%{public}s %{public}s]:%i Got AID %{public}@ from groupMemberIDs, but secureElementWrapper couldn't find it?!", v25, v70, v71, 1305, v13);
          }
          v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v27 = NFSharedLogGetLogger(v26);
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = object_getClass(self);
            if (class_isMetaClass(v29))
              v30 = 43;
            else
              v30 = 45;
            v31 = object_getClassName(self);
            v32 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            v80 = v30;
            v81 = 2082;
            v82 = v31;
            v83 = 2082;
            v84 = v32;
            v85 = 1024;
            v86 = 1305;
            v87 = 2114;
            v88 = v13;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Got AID %{public}@ from groupMemberIDs, but secureElementWrapper couldn't find it?!", buf, 0x2Cu);
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
      if (v10)
        continue;
      break;
    }
  }

  v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v34 = NFLogGetLogger(v33);
  if (v34)
  {
    v35 = (void (*)(uint64_t, const char *, ...))v34;
    v36 = object_getClass(self);
    v37 = class_isMetaClass(v36);
    v38 = object_getClassName(self);
    v39 = sel_getName(a2);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "identifier"));
    v41 = 45;
    if (v37)
      v41 = 43;
    v35(6, "%c[%{public}s %{public}s]:%i No group members matched the field, using head applet %{public}@", v41, v38, v39, 1319, v40);

  }
  v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v43 = NFSharedLogGetLogger(v42);
  v44 = objc_claimAutoreleasedReturnValue(v43);
  v45 = v72;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v46 = object_getClass(self);
    if (class_isMetaClass(v46))
      v47 = 43;
    else
      v47 = 45;
    v48 = object_getClassName(self);
    v49 = sel_getName(a2);
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "identifier"));
    *(_DWORD *)buf = 67110146;
    v80 = v47;
    v81 = 2082;
    v82 = v48;
    v83 = 2082;
    v84 = v49;
    v85 = 1024;
    v86 = 1319;
    v87 = 2114;
    v88 = v50;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No group members matched the field, using head applet %{public}@", buf, 0x2Cu);

  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession setActiveApplet:](self, "setActiveApplet:", v72));
LABEL_41:

  return v51;
}

- (void)handleFieldChanged:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  unsigned __int8 *v10;
  int v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned int v29;
  NFContactlessPaymentStartEvent *transactionStartEvent;
  NFFieldNotification *fieldNotification;
  const char *Name;
  objc_super v33;
  uint8_t buf[4];
  _BYTE v35[14];
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;

  v3 = a3;
  v6 = kdebug_trace(724566080, a3, 0, 0, 0);
  v7 = NFSharedSignpostLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    v9 = CFSTR("OFF");
    if (v3)
      v9 = CFSTR("ON");
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v35 = v9;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFTRACE_FIELD_DETECT", "field %@", buf, 0xCu);
  }

  v10 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
  if (v10)
  {
    v11 = v10[172];

    if (v11)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v14 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v18 = 45;
        if (isMetaClass)
          v18 = 43;
        v14(4, "%c[%{public}s %{public}s]:%i express mode in progress", v18, ClassName, Name, 1331);
      }
      v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v20 = NFSharedLogGetLogger(v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = object_getClass(self);
        if (class_isMetaClass(v22))
          v23 = 43;
        else
          v23 = 45;
        v24 = object_getClassName(self);
        v25 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v35 = v23;
        *(_WORD *)&v35[4] = 2082;
        *(_QWORD *)&v35[6] = v24;
        v36 = 2082;
        v37 = v25;
        v38 = 1024;
        v39 = 1331;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i express mode in progress", buf, 0x22u);
      }
      goto LABEL_23;
    }
  }
  if (!v3)
  {
    if (!-[_NFContactlessSession plasticCardMode](self, "plasticCardMode"))
    {
      v26 = objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
      if (v26)
      {
        v27 = (void *)v26;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
        v29 = objc_msgSend(v28, "isTypeF");

        if (v29)
        {
          -[_NFContactlessPaymentSession _fireFelicaTransactionEndEvent](self, "_fireFelicaTransactionEndEvent");
          transactionStartEvent = self->_transactionStartEvent;
          self->_transactionStartEvent = 0;

        }
      }
    }
    if (self->_deferredAuthRequested)
    {
      v21 = objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
      -[NSObject restartDiscovery](v21, "restartDiscovery");
LABEL_23:

    }
  }
  if (!self->_fieldPresent)
  {
    fieldNotification = self->_fieldNotification;
    self->_fieldNotification = 0;

  }
  self->_fieldPresent = v3;
  v33.receiver = self;
  v33.super_class = (Class)_NFContactlessPaymentSession;
  -[_NFContactlessSession handleFieldChanged:](&v33, "handleFieldChanged:", v3);
}

- (void)handleFieldNotification:(id)a3
{
  NFFieldNotification *v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  _BOOL8 deferredAuthRequested;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  _BOOL4 v23;
  void *v24;
  NFFieldNotification *fieldNotification;
  NFFieldNotification *v26;
  objc_super v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  void *v39;

  v5 = (NFFieldNotification *)a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    deferredAuthRequested = self->_deferredAuthRequested;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession deferredActivationApplet](self, "deferredActivationApplet"));
    v15 = 45;
    if (isMetaClass)
      v15 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i deferredAuth = %d : deferredActivation: %{public}@", v15, ClassName, Name, 1360, deferredAuthRequested, v14);

  }
  v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v17 = NFSharedLogGetLogger(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = object_getClass(self);
    if (class_isMetaClass(v19))
      v20 = 43;
    else
      v20 = 45;
    v21 = object_getClassName(self);
    v22 = sel_getName(a2);
    v23 = self->_deferredAuthRequested;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession deferredActivationApplet](self, "deferredActivationApplet"));
    *(_DWORD *)buf = 67110402;
    v29 = v20;
    v30 = 2082;
    v31 = v21;
    v32 = 2082;
    v33 = v22;
    v34 = 1024;
    v35 = 1360;
    v36 = 1024;
    v37 = v23;
    v38 = 2114;
    v39 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i deferredAuth = %d : deferredActivation: %{public}@", buf, 0x32u);

  }
  fieldNotification = self->_fieldNotification;
  self->_fieldNotification = v5;
  v26 = v5;

  v27.receiver = self;
  v27.super_class = (Class)_NFContactlessPaymentSession;
  -[_NFContactlessSession handleFieldNotification:](&v27, "handleFieldNotification:", v26);
  -[_NFContactlessPaymentSession _performDeferredAuthIfNeeded:](self, "_performDeferredAuthIfNeeded:", v26);

}

- (void)handleFieldReset
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
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  const char *Name;
  const char *v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;

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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 1370);
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
    v36 = v15;
    v37 = 2082;
    v38 = object_getClassName(self);
    v39 = 2082;
    v40 = sel_getName(a2);
    v41 = 1024;
    v42 = 1370;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  if (self->_transactionState == 1)
  {
    v16 = kdebug_trace(724566104, 0, 0, 0, 0);
    v17 = NFSharedSignpostLog(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TX_TEAR", ", buf, 2u);
    }

    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFLogGetLogger(v19);
    if (v20)
    {
      v21 = (void (*)(uint64_t, const char *, ...))v20;
      v22 = object_getClass(self);
      v23 = class_isMetaClass(v22);
      v24 = object_getClassName(self);
      v34 = sel_getName(a2);
      v25 = 45;
      if (v23)
        v25 = 43;
      v21(5, "%c[%{public}s %{public}s]:%i Field loss before end of transaction", v25, v24, v34, 1375);
    }
    v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v27 = NFSharedLogGetLogger(v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = object_getClass(self);
      if (class_isMetaClass(v29))
        v30 = 43;
      else
        v30 = 45;
      v31 = object_getClassName(self);
      v32 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v36 = v30;
      v37 = 2082;
      v38 = v31;
      v39 = 2082;
      v40 = v32;
      v41 = 1024;
      v42 = 1375;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Field loss before end of transaction", buf, 0x22u);
    }

    self->_transactionState = 4;
  }
}

- (void)handleTimerExpiredEvent:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
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
  __CFString *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  int v45;
  const char *v46;
  const char *v47;
  void *v48;
  const char *ClassName;
  const char *v50;
  const char *Name;
  const char *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  int v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  id v67;

  v5 = a3;
  v6 = kdebug_trace(724566084, 0, 0, 0, 0);
  v7 = NFSharedSignpostLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AUTH_EXPIRED", ", buf, 2u);
  }

  PLLogRegisteredEvent(47, CFSTR("Transaction"), &off_1003066F0, 0);
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
    v11(6, "%c[%{public}s %{public}s]:%i %{public}@", v14, ClassName, Name, 1388, v5);
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
    v59 = v19;
    v60 = 2082;
    v61 = v20;
    v62 = 2082;
    v63 = v21;
    v64 = 1024;
    v65 = 1388;
    v66 = 2114;
    v67 = v5;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v22 = (__CFString *)v5;
  v23 = -[__CFString countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v54;
    while (2)
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v54 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
        v30 = objc_msgSend(v27, "isEqualToString:", v29);

        if (v30)
        {
          v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v36 = NFLogGetLogger(v35);
          if (v36)
          {
            v37 = (void (*)(uint64_t, const char *, ...))v36;
            v38 = object_getClass(self);
            v39 = class_isMetaClass(v38);
            v50 = object_getClassName(self);
            v52 = sel_getName(a2);
            v40 = 45;
            if (v39)
              v40 = 43;
            v37(6, "%c[%{public}s %{public}s]:%i Firing timer expired event for %{public}@", v40, v50, v52, 1391, v27);
          }
          v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v42 = NFSharedLogGetLogger(v41);
          v43 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v44 = object_getClass(self);
            if (class_isMetaClass(v44))
              v45 = 43;
            else
              v45 = 45;
            v46 = object_getClassName(self);
            v47 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            v59 = v45;
            v60 = 2082;
            v61 = v46;
            v62 = 2082;
            v63 = v47;
            v64 = 1024;
            v65 = 1391;
            v66 = 2114;
            v67 = v27;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Firing timer expired event for %{public}@", buf, 0x2Cu);
          }

          v48 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
          objc_msgSend(v48, "didExpireTransactionForApplet:", v27);
          v34 = v22;
          goto LABEL_34;
        }
      }
      v24 = -[__CFString countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      if (v24)
        continue;
      break;
    }
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "identifier"));

  }
  else
  {
    v34 = &stru_1002ED8A8;
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v48, "didExpireTransactionForApplet:", v34);
LABEL_34:

  -[_NFContactlessPaymentSession startDefaultMode](self, "startDefaultMode");
}

- (void)handleTransactionStartEvent:(id)a3 atlData:(id)a4
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  double v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  void *specific;
  uint64_t Logger;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  void *v35;
  unsigned int v36;
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
  const char *v49;
  const char *v50;
  const char *v51;
  unsigned __int8 *v52;
  int v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  unsigned __int8 v58;
  unsigned int v59;
  void *v60;
  uint64_t v61;
  void (*v62)(uint64_t, const char *, ...);
  objc_class *v63;
  _BOOL4 v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  objc_class *v70;
  int v71;
  const char *v72;
  const char *v73;
  const char *v74;
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
  void *v101;
  uint64_t v102;
  void (*v103)(uint64_t, const char *, ...);
  objc_class *v104;
  _BOOL4 v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  NSObject *v110;
  objc_class *v111;
  int v112;
  const char *v113;
  const char *v114;
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
  const char *v126;
  const char *v127;
  const char *Name;
  const char *v129;
  const char *v130;
  const char *v131;
  const char *v132;
  const char *v133;
  const char *v134;
  uint8_t buf[4];
  int v136;
  __int16 v137;
  const char *v138;
  __int16 v139;
  const char *v140;
  __int16 v141;
  int v142;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DelayExpressReentry")));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DelayExpressReentry")));
    objc_msgSend(v11, "doubleValue");
    self->_delayExpressMode = v12 / 1000.0;

  }
  else
  {
    self->_delayExpressMode = 0.0;
  }
  v13 = kdebug_trace(724566088, 0, 0, 0, 0);
  v14 = NFSharedSignpostLog(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TX_START", "Transaction Start Event", buf, 2u);
  }

  *(_QWORD *)&v16 = PLLogRegisteredEvent(47, CFSTR("Transaction"), &off_100306718, 0).n128_u64[0];
  self->_dontWaitForEOT = 0;
  self->_ignoreRFEvents = 0;
  if (v9)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("DontWaitForEOT"), v16));
    v18 = objc_msgSend(v17, "BOOLValue");

    if (v18)
      self->_dontWaitForEOT = 1;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("IgnoreRFEvents")));
    v20 = objc_msgSend(v19, "BOOLValue");

    if (v20)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v23 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v27 = 45;
        if (isMetaClass)
          v27 = 43;
        v23(5, "%c[%{public}s %{public}s]:%i Ignore RF events", v27, ClassName, Name, 1431);
      }
      v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v29 = NFSharedLogGetLogger(v28);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = object_getClass(self);
        if (class_isMetaClass(v31))
          v32 = 43;
        else
          v32 = 45;
        v33 = object_getClassName(self);
        v34 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v136 = v32;
        v137 = 2082;
        v138 = v33;
        v139 = 2082;
        v140 = v34;
        v141 = 1024;
        v142 = 1431;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignore RF events", buf, 0x22u);
      }

      self->_ignoreRFEvents = 1;
    }
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("EoTCallbackExpected"), v16));
  v36 = objc_msgSend(v35, "BOOLValue");

  if (v36)
    self->_endOfTransactionRequired = 1;
  if (-[_NFContactlessSession plasticCardMode](self, "plasticCardMode"))
  {
    v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v38 = NFLogGetLogger(v37);
    if (v38)
    {
      v39 = (void (*)(uint64_t, const char *, ...))v38;
      v40 = object_getClass(self);
      v41 = class_isMetaClass(v40);
      v42 = object_getClassName(self);
      v129 = sel_getName(a2);
      v43 = 45;
      if (v41)
        v43 = 43;
      v39(5, "%c[%{public}s %{public}s]:%i Plastic card mode active - not handling start event", v43, v42, v129, 1442);
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
      v49 = object_getClassName(self);
      v50 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v136 = v48;
      v137 = 2082;
      v138 = v49;
      v139 = 2082;
      v140 = v50;
      v141 = 1024;
      v142 = 1442;
      v51 = "%c[%{public}s %{public}s]:%i Plastic card mode active - not handling start event";
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, v51, buf, 0x22u);
      goto LABEL_80;
    }
    goto LABEL_80;
  }
  v52 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
  if (v52)
  {
    v53 = v52[172];

    if (v53)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appletIdentifier"));
      v56 = sub_10022F2F0(v54, v55);
      v46 = objc_claimAutoreleasedReturnValue(v56);

      if (-[NSObject isTypeF](v46, "isTypeF")
        && (v57 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper")),
            v58 = sub_10023B608(v57, v46),
            v57,
            (v58 & 1) == 0))
      {
        v88 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v89 = NFLogGetLogger(v88);
        if (v89)
        {
          v90 = (void (*)(uint64_t, const char *, ...))v89;
          v91 = object_getClass(self);
          v92 = class_isMetaClass(v91);
          v93 = object_getClassName(self);
          v132 = sel_getName(a2);
          v94 = 45;
          if (v92)
            v94 = 43;
          v90(6, "%c[%{public}s %{public}s]:%i applet v2.0 - dropping transaction start event", v94, v93, v132, 1449);
        }
        v95 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v96 = NFSharedLogGetLogger(v95);
        v69 = objc_claimAutoreleasedReturnValue(v96);
        if (!os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          goto LABEL_67;
        v97 = object_getClass(self);
        if (class_isMetaClass(v97))
          v98 = 43;
        else
          v98 = 45;
        v99 = object_getClassName(self);
        v100 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v136 = v98;
        v137 = 2082;
        v138 = v99;
        v139 = 2082;
        v140 = v100;
        v141 = 1024;
        v142 = 1449;
        v74 = "%c[%{public}s %{public}s]:%i applet v2.0 - dropping transaction start event";
      }
      else
      {
        v59 = objc_msgSend(v8, "background");
        v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v61 = NFLogGetLogger(v60);
        v62 = (void (*)(uint64_t, const char *, ...))v61;
        if (!v59)
        {
          if (v61)
          {
            v75 = object_getClass(self);
            v76 = class_isMetaClass(v75);
            v77 = object_getClassName(self);
            v131 = sel_getName(a2);
            v78 = 45;
            if (v76)
              v78 = 43;
            v62(6, "%c[%{public}s %{public}s]:%i firing express transaction started state", v78, v77, v131, 1457);
          }
          v79 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v80 = NFSharedLogGetLogger(v79);
          v81 = objc_claimAutoreleasedReturnValue(v80);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            v82 = object_getClass(self);
            if (class_isMetaClass(v82))
              v83 = 43;
            else
              v83 = 45;
            v84 = object_getClassName(self);
            v85 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v136 = v83;
            v137 = 2082;
            v138 = v84;
            v139 = 2082;
            v140 = v85;
            v141 = 1024;
            v142 = 1457;
            _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i firing express transaction started state", buf, 0x22u);
          }

          v86 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appletIdentifier"));
          objc_msgSend(v86, "didExpressModeStateChange:withObject:", 2, v87);

          self->_sendExpressModeEnded = 0;
          goto LABEL_80;
        }
        if (v61)
        {
          v63 = object_getClass(self);
          v64 = class_isMetaClass(v63);
          v65 = object_getClassName(self);
          v130 = sel_getName(a2);
          v66 = 45;
          if (v64)
            v66 = 43;
          v62(6, "%c[%{public}s %{public}s]:%i ignoring express mode update for background event.", v66, v65, v130, 1454);
        }
        v67 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v68 = NFSharedLogGetLogger(v67);
        v69 = objc_claimAutoreleasedReturnValue(v68);
        if (!os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
LABEL_67:

          goto LABEL_80;
        }
        v70 = object_getClass(self);
        if (class_isMetaClass(v70))
          v71 = 43;
        else
          v71 = 45;
        v72 = object_getClassName(self);
        v73 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v136 = v71;
        v137 = 2082;
        v138 = v72;
        v139 = 2082;
        v140 = v73;
        v141 = 1024;
        v142 = 1454;
        v74 = "%c[%{public}s %{public}s]:%i ignoring express mode update for background event.";
      }
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, v74, buf, 0x22u);
      goto LABEL_67;
    }
  }
  if (self->_inWiredMode
    && !-[_NFContactlessPaymentSession allowTransactionsInWiredMode](self, "allowTransactionsInWiredMode"))
  {
    v115 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v116 = NFLogGetLogger(v115);
    if (v116)
    {
      v117 = (void (*)(uint64_t, const char *, ...))v116;
      v118 = object_getClass(self);
      v119 = class_isMetaClass(v118);
      v120 = object_getClassName(self);
      v134 = sel_getName(a2);
      v121 = 45;
      if (v119)
        v121 = 43;
      v117(5, "%c[%{public}s %{public}s]:%i Suppresing Start Event when in Wired", v121, v120, v134, 1466);
    }
    v122 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v123 = NFSharedLogGetLogger(v122);
    v46 = objc_claimAutoreleasedReturnValue(v123);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v124 = object_getClass(self);
      if (class_isMetaClass(v124))
        v125 = 43;
      else
        v125 = 45;
      v126 = object_getClassName(self);
      v127 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v136 = v125;
      v137 = 2082;
      v138 = v126;
      v139 = 2082;
      v140 = v127;
      v141 = 1024;
      v142 = 1466;
      v51 = "%c[%{public}s %{public}s]:%i Suppresing Start Event when in Wired";
      goto LABEL_32;
    }
  }
  else
  {
    v101 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v102 = NFLogGetLogger(v101);
    if (v102)
    {
      v103 = (void (*)(uint64_t, const char *, ...))v102;
      v104 = object_getClass(self);
      v105 = class_isMetaClass(v104);
      v106 = object_getClassName(self);
      v133 = sel_getName(a2);
      v107 = 45;
      if (v105)
        v107 = 43;
      v103(6, "%c[%{public}s %{public}s]:%i firing start transaction callback", v107, v106, v133, 1469);
    }
    v108 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v109 = NFSharedLogGetLogger(v108);
    v110 = objc_claimAutoreleasedReturnValue(v109);
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      v111 = object_getClass(self);
      if (class_isMetaClass(v111))
        v112 = 43;
      else
        v112 = 45;
      v113 = object_getClassName(self);
      v114 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v136 = v112;
      v137 = 2082;
      v138 = v113;
      v139 = 2082;
      v140 = v114;
      v141 = 1024;
      v142 = 1469;
      _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i firing start transaction callback", buf, 0x22u);
    }

    self->_transactionState = 1;
    objc_storeStrong((id *)&self->_transactionStartEvent, a3);
    v46 = objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    -[NSObject didStartTransaction:](v46, "didStartTransaction:", v8);
  }
LABEL_80:

}

- (void)handleTransactionEndEvent:(id)a3 atlData:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *specific;
  uint64_t Logger;
  void (*v17)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  _BOOL4 dontWaitForEOT;
  void *v31;
  uint64_t v32;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *v34;
  _BOOL4 v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  objc_class *v41;
  int v42;
  const char *v43;
  const char *v44;
  const char *v45;
  unsigned __int8 *v46;
  int v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  unsigned __int8 v52;
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
  const char *v67;
  _DWORD *v68;
  _BOOL4 sendExpressModeEnded;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void (*v77)(uint64_t, const char *, ...);
  objc_class *v78;
  _BOOL4 v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  objc_class *v84;
  int v85;
  const char *v86;
  const char *v87;
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
  int transactionState;
  void *v102;
  uint64_t v103;
  void (*v104)(uint64_t, const char *, ...);
  objc_class *v105;
  _BOOL4 v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  NSObject *v111;
  objc_class *v112;
  int v113;
  const char *v114;
  const char *v115;
  void *v116;
  NFContactlessPaymentStartEvent *transactionStartEvent;
  void *v118;
  uint64_t v119;
  void (*v120)(uint64_t, const char *, ...);
  objc_class *v121;
  _BOOL4 v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  objc_class *v127;
  int v128;
  const char *v129;
  const char *v130;
  void *v131;
  uint64_t v132;
  void (*v133)(uint64_t, const char *, ...);
  objc_class *v134;
  _BOOL4 v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  objc_class *v140;
  int v141;
  const char *v142;
  const char *v143;
  id v144;
  void *v145;
  void *v146;
  NFContactlessPaymentEndEvent *v147;
  void *v148;
  uint64_t v149;
  void (*v150)(uint64_t, const char *, ...);
  objc_class *v151;
  _BOOL4 v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  NSObject *v156;
  objc_class *v157;
  int v158;
  const char *v159;
  const char *v160;
  void *v161;
  const char *v162;
  const char *v163;
  const char *v164;
  const char *v165;
  const char *v166;
  const char *v167;
  const char *v168;
  const char *v169;
  const char *v170;
  void *v171;
  uint8_t buf[4];
  int v173;
  __int16 v174;
  const char *v175;
  __int16 v176;
  const char *v177;
  __int16 v178;
  int v179;
  __int16 v180;
  NFContactlessPaymentEndEvent *v181;

  v7 = a3;
  v8 = a4;
  v9 = kdebug_trace(724566092, 0, 0, 0, 0);
  v10 = NFSharedSignpostLog(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TX_END", "Transaction End Event", buf, 2u);
  }

  v12 = objc_msgSend(v8, "valueForKey:", CFSTR("DontWaitForEOT"), PLLogRegisteredEvent(47, CFSTR("Transaction"), &off_100306740, 0).n128_f64[0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("DontWaitForEOT")));
    self->_dontWaitForEOT = objc_msgSend(v14, "BOOLValue");

    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v17 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v22 = 45;
      if (isMetaClass)
        v22 = 43;
      v17(6, "%c[%{public}s %{public}s]:%i ATLEndEventDontWaitForEOT: %d", v22, ClassName, Name, 1487, self->_dontWaitForEOT);
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
      dontWaitForEOT = self->_dontWaitForEOT;
      *(_DWORD *)buf = 67110146;
      v173 = v27;
      v174 = 2082;
      v175 = v28;
      v176 = 2082;
      v177 = v29;
      v178 = 1024;
      v179 = 1487;
      v180 = 1024;
      LODWORD(v181) = dontWaitForEOT;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ATLEndEventDontWaitForEOT: %d", buf, 0x28u);
    }

  }
  if (-[_NFContactlessSession plasticCardMode](self, "plasticCardMode"))
  {
    v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v32 = NFLogGetLogger(v31);
    if (v32)
    {
      v33 = (void (*)(uint64_t, const char *, ...))v32;
      v34 = object_getClass(self);
      v35 = class_isMetaClass(v34);
      v36 = object_getClassName(self);
      v163 = sel_getName(a2);
      v37 = 45;
      if (v35)
        v37 = 43;
      v33(5, "%c[%{public}s %{public}s]:%i Plastic card mode active - not handling end event", v37, v36, v163, 1491);
    }
    v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v39 = NFSharedLogGetLogger(v38);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      goto LABEL_66;
    v41 = object_getClass(self);
    if (class_isMetaClass(v41))
      v42 = 43;
    else
      v42 = 45;
    v43 = object_getClassName(self);
    v44 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v173 = v42;
    v174 = 2082;
    v175 = v43;
    v176 = 2082;
    v177 = v44;
    v178 = 1024;
    v179 = 1491;
    v45 = "%c[%{public}s %{public}s]:%i Plastic card mode active - not handling end event";
    goto LABEL_24;
  }
  v46 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
  if (v46)
  {
    v47 = v46[172];

    if (v47)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appletIdentifier"));
      v50 = sub_10022F2F0(v48, v49);
      v40 = objc_claimAutoreleasedReturnValue(v50);

      if (-[NSObject isTypeF](v40, "isTypeF")
        && (v51 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper")),
            v52 = sub_10023B608(v51, v40),
            v51,
            (v52 & 1) == 0))
      {
        v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v76 = NFLogGetLogger(v75);
        if (v76)
        {
          v77 = (void (*)(uint64_t, const char *, ...))v76;
          v78 = object_getClass(self);
          v79 = class_isMetaClass(v78);
          v80 = object_getClassName(self);
          v165 = sel_getName(a2);
          v81 = 45;
          if (v79)
            v81 = 43;
          v77(6, "%c[%{public}s %{public}s]:%i applet v2.0 - dropping transaction end event", v81, v80, v165, 1501);
        }
        v82 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v83 = NFSharedLogGetLogger(v82);
        v62 = objc_claimAutoreleasedReturnValue(v83);
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          goto LABEL_65;
        v84 = object_getClass(self);
        if (class_isMetaClass(v84))
          v85 = 43;
        else
          v85 = 45;
        v86 = object_getClassName(self);
        v87 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v173 = v85;
        v174 = 2082;
        v175 = v86;
        v176 = 2082;
        v177 = v87;
        v178 = 1024;
        v179 = 1501;
        v67 = "%c[%{public}s %{public}s]:%i applet v2.0 - dropping transaction end event";
      }
      else if (objc_msgSend(v7, "background"))
      {
        v53 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v54 = NFLogGetLogger(v53);
        if (v54)
        {
          v55 = (void (*)(uint64_t, const char *, ...))v54;
          v56 = object_getClass(self);
          v57 = class_isMetaClass(v56);
          v58 = object_getClassName(self);
          v164 = sel_getName(a2);
          v59 = 45;
          if (v57)
            v59 = 43;
          v55(6, "%c[%{public}s %{public}s]:%i ignoring express mode update for background event", v59, v58, v164, 1506);
        }
        v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v61 = NFSharedLogGetLogger(v60);
        v62 = objc_claimAutoreleasedReturnValue(v61);
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          goto LABEL_65;
        v63 = object_getClass(self);
        if (class_isMetaClass(v63))
          v64 = 43;
        else
          v64 = 45;
        v65 = object_getClassName(self);
        v66 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v173 = v64;
        v174 = 2082;
        v175 = v65;
        v176 = 2082;
        v177 = v66;
        v178 = 1024;
        v179 = 1506;
        v67 = "%c[%{public}s %{public}s]:%i ignoring express mode update for background event";
      }
      else
      {
        v68 = (_DWORD *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
        if (v68 && v68[40] >= 6u)
        {
          sendExpressModeEnded = self->_sendExpressModeEnded;

          if (!sendExpressModeEnded)
          {
            v70 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
            v71 = objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
            v72 = (void *)v71;
            if (v71)
              v73 = *(unsigned int *)(v71 + 160);
            else
              v73 = 0;
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appletIdentifier"));
            objc_msgSend(v70, "didExpressModeStateChange:withObject:", v73, v74);

            self->_sendExpressModeEnded = 1;
            goto LABEL_66;
          }
        }
        else
        {

        }
        v88 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v89 = NFLogGetLogger(v88);
        if (v89)
        {
          v90 = (void (*)(uint64_t, const char *, ...))v89;
          v91 = object_getClass(self);
          v92 = class_isMetaClass(v91);
          v93 = object_getClassName(self);
          v166 = sel_getName(a2);
          v94 = 45;
          if (v92)
            v94 = 43;
          v90(6, "%c[%{public}s %{public}s]:%i Express transaction already ended - ignoring", v94, v93, v166, 1516);
        }
        v95 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v96 = NFSharedLogGetLogger(v95);
        v62 = objc_claimAutoreleasedReturnValue(v96);
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          goto LABEL_65;
        v97 = object_getClass(self);
        if (class_isMetaClass(v97))
          v98 = 43;
        else
          v98 = 45;
        v99 = object_getClassName(self);
        v100 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v173 = v98;
        v174 = 2082;
        v175 = v99;
        v176 = 2082;
        v177 = v100;
        v178 = 1024;
        v179 = 1516;
        v67 = "%c[%{public}s %{public}s]:%i Express transaction already ended - ignoring";
      }
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, v67, buf, 0x22u);
LABEL_65:

      goto LABEL_66;
    }
  }
  if (self->_inWiredMode
    && !-[_NFContactlessPaymentSession allowTransactionsInWiredMode](self, "allowTransactionsInWiredMode"))
  {
    v118 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v119 = NFLogGetLogger(v118);
    if (v119)
    {
      v120 = (void (*)(uint64_t, const char *, ...))v119;
      v121 = object_getClass(self);
      v122 = class_isMetaClass(v121);
      v123 = object_getClassName(self);
      v168 = sel_getName(a2);
      v124 = 45;
      if (v122)
        v124 = 43;
      v120(5, "%c[%{public}s %{public}s]:%i Suppresing End Event when in Wired", v124, v123, v168, 1523);
    }
    v125 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v126 = NFSharedLogGetLogger(v125);
    v40 = objc_claimAutoreleasedReturnValue(v126);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      goto LABEL_66;
    v127 = object_getClass(self);
    if (class_isMetaClass(v127))
      v128 = 43;
    else
      v128 = 45;
    v129 = object_getClassName(self);
    v130 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v173 = v128;
    v174 = 2082;
    v175 = v129;
    v176 = 2082;
    v177 = v130;
    v178 = 1024;
    v179 = 1523;
    v45 = "%c[%{public}s %{public}s]:%i Suppresing End Event when in Wired";
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, v45, buf, 0x22u);
LABEL_66:

    goto LABEL_67;
  }
  transactionState = self->_transactionState;
  if (transactionState == 2)
  {
    v131 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v132 = NFLogGetLogger(v131);
    if (v132)
    {
      v133 = (void (*)(uint64_t, const char *, ...))v132;
      v134 = object_getClass(self);
      v135 = class_isMetaClass(v134);
      v136 = object_getClassName(self);
      v169 = sel_getName(a2);
      v137 = 45;
      if (v135)
        v137 = 43;
      v133(6, "%c[%{public}s %{public}s]:%i Transaction already ended, ignoring", v137, v136, v169, 1545);
    }
    v138 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v139 = NFSharedLogGetLogger(v138);
    v40 = objc_claimAutoreleasedReturnValue(v139);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      goto LABEL_66;
    v140 = object_getClass(self);
    if (class_isMetaClass(v140))
      v141 = 43;
    else
      v141 = 45;
    v142 = object_getClassName(self);
    v143 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v173 = v141;
    v174 = 2082;
    v175 = v142;
    v176 = 2082;
    v177 = v143;
    v178 = 1024;
    v179 = 1545;
    v45 = "%c[%{public}s %{public}s]:%i Transaction already ended, ignoring";
    goto LABEL_24;
  }
  if (transactionState == 4 && !self->_ignoreRFEvents)
  {
    v144 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", &off_100306768);
    v145 = (void *)objc_claimAutoreleasedReturnValue(-[NFContactlessPaymentStartEvent appletIdentifier](self->_transactionStartEvent, "appletIdentifier"));

    if (v145)
    {
      v146 = (void *)objc_claimAutoreleasedReturnValue(-[NFContactlessPaymentStartEvent appletIdentifier](self->_transactionStartEvent, "appletIdentifier"));
      objc_msgSend(v144, "setObject:forKey:", v146, CFSTR("appletIdentifier"));

    }
    v171 = v144;
    v147 = -[NFContactlessPaymentEndEvent initWithDictionary:]([NFContactlessPaymentEndEvent alloc], "initWithDictionary:", v144);
    v148 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v149 = NFLogGetLogger(v148);
    if (v149)
    {
      v150 = (void (*)(uint64_t, const char *, ...))v149;
      v151 = object_getClass(self);
      v152 = class_isMetaClass(v151);
      v162 = object_getClassName(self);
      v170 = sel_getName(a2);
      v153 = 45;
      if (v152)
        v153 = 43;
      v150(5, "%c[%{public}s %{public}s]:%i Field Lost before transaction ended: firing: %{public}@", v153, v162, v170, 1541, v147);
    }
    v154 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v155 = NFSharedLogGetLogger(v154);
    v156 = objc_claimAutoreleasedReturnValue(v155);
    if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
    {
      v157 = object_getClass(self);
      if (class_isMetaClass(v157))
        v158 = 43;
      else
        v158 = 45;
      v159 = object_getClassName(self);
      v160 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v173 = v158;
      v174 = 2082;
      v175 = v159;
      v176 = 2082;
      v177 = v160;
      v178 = 1024;
      v179 = 1541;
      v180 = 2114;
      v181 = v147;
      _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Field Lost before transaction ended: firing: %{public}@", buf, 0x2Cu);
    }

    v161 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v161, "didEndTransaction:", v147);

  }
  else
  {
    v102 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v103 = NFLogGetLogger(v102);
    if (v103)
    {
      v104 = (void (*)(uint64_t, const char *, ...))v103;
      v105 = object_getClass(self);
      v106 = class_isMetaClass(v105);
      v107 = object_getClassName(self);
      v167 = sel_getName(a2);
      v108 = 45;
      if (v106)
        v108 = 43;
      v104(6, "%c[%{public}s %{public}s]:%i firing end transaction callback", v108, v107, v167, 1549);
    }
    v109 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v110 = NFSharedLogGetLogger(v109);
    v111 = objc_claimAutoreleasedReturnValue(v110);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      v112 = object_getClass(self);
      if (class_isMetaClass(v112))
        v113 = 43;
      else
        v113 = 45;
      v114 = object_getClassName(self);
      v115 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v173 = v113;
      v174 = 2082;
      v175 = v114;
      v176 = 2082;
      v177 = v115;
      v178 = 1024;
      v179 = 1549;
      _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i firing end transaction callback", buf, 0x22u);
    }

    self->_transactionState = 2;
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v116, "didEndTransaction:", v7);

  }
  transactionStartEvent = self->_transactionStartEvent;
  self->_transactionStartEvent = 0;

  -[_NFContactlessPaymentSession _deauthorize](self, "_deauthorize");
  if (self->_delayExpressMode <= 0.0)
    -[_NFContactlessPaymentSession startDefaultMode](self, "startDefaultMode");
  else
    -[_NFContactlessPaymentSession pauseExpressAndStartDefaultModeAfter:](self, "pauseExpressAndStartDefaultModeAfter:");
LABEL_67:

}

- (void)pauseExpressAndStartDefaultModeAfter:(double)a3
{
  id v6;
  OS_dispatch_queue *v7;
  void *v8;
  NFTimer *v9;
  NFTimer *restartRoutingTimer;
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
  const char *v22;
  const char *v23;
  _BYTE *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[4];
  id v28[2];
  id location;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;

  -[NFTimer stopTimer](self->_restartRoutingTimer, "stopTimer");
  objc_initWeak(&location, self);
  v6 = objc_alloc((Class)NFTimer);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10012DC24;
  v27[3] = &unk_1002E6290;
  objc_copyWeak(v28, &location);
  v28[1] = (id)a2;
  v26.receiver = self;
  v26.super_class = (Class)_NFContactlessPaymentSession;
  v7 = -[_NFSession workQueue](&v26, "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (NFTimer *)objc_msgSend(v6, "initWithCallback:queue:", v27, v8);
  restartRoutingTimer = self->_restartRoutingTimer;
  self->_restartRoutingTimer = v9;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class))
      v14 = 43;
    else
      v14 = 45;
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Pausing express mode after ATL transaction", v14, ClassName, Name, 1590);
  }
  v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = NFSharedLogGetLogger(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = object_getClass(self);
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    v22 = object_getClassName(self);
    v23 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v31 = v21;
    v32 = 2082;
    v33 = v22;
    v34 = 2082;
    v35 = v23;
    v36 = 1024;
    v37 = 1590;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Pausing express mode after ATL transaction", buf, 0x22u);
  }

  v24 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
  v25 = v24;
  if (v24)
    sub_100040428(v24, 1u, 1u);

  -[NFTimer startTimer:leeway:](self->_restartRoutingTimer, "startTimer:leeway:", a3, 0.5);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
}

- (BOOL)_requiresDeferredActivation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *specific;
  uint64_t Logger;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  BOOL v34;
  const char *ClassName;
  const char *Name;
  id v38;
  id obj;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A4B2, 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_asHexString"));

  v7 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A4A8, 10);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_asHexString"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "moduleIdentifier"));
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v9)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupMemberIDs"));
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    if (v10)
    {
      v11 = v10;
      v38 = v4;
      v12 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
          v16 = sub_10022F2F0(v15, v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

          if (v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "moduleIdentifier"));
            if (objc_msgSend(v18, "isEqualToString:", v6))
            {

LABEL_27:
              v34 = 1;
              goto LABEL_28;
            }
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "moduleIdentifier"));
            v20 = objc_msgSend(v19, "isEqualToString:", v41);

            if ((v20 & 1) != 0)
              goto LABEL_27;
          }
          else
          {
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            Logger = NFLogGetLogger(specific);
            if (Logger)
            {
              v23 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v26 = 45;
              if (isMetaClass)
                v26 = 43;
              v23(4, "%c[%{public}s %{public}s]:%i Got AID %{public}@ from groupMemberIDs, but secureElementWrapper couldn't find it?!", v26, ClassName, Name, 1630, v14);
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
              v47 = v31;
              v48 = 2082;
              v49 = v32;
              v50 = 2082;
              v51 = v33;
              v52 = 1024;
              v53 = 1630;
              v54 = 2114;
              v55 = v14;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Got AID %{public}@ from groupMemberIDs, but secureElementWrapper couldn't find it?!", buf, 0x2Cu);
            }

          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
        if (v11)
          continue;
        break;
      }
      v34 = 0;
LABEL_28:
      v4 = v38;
    }
    else
    {
      v34 = 0;
    }

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (void)handleSecureElementEndOfOperation
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = kdebug_trace(724566096, 0, 0, 0, 0);
  v4 = NFSharedSignpostLog(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TX_EOO", "Tx End Of Operation", v6, 2u);
  }

  self->_transactionState = 3;
}

- (void)handleExpressModeStarted
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  NSString *v27;
  NSString *expressType;
  void *v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
    v12 = sub_10003BE0C(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i %{public}@ express mode entered", v14, ClassName, Name, 1652, v13);

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
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
    v23 = sub_10003BE0C(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    *(_DWORD *)buf = 67110146;
    v31 = v19;
    v32 = 2082;
    v33 = v20;
    v34 = 2082;
    v35 = v21;
    v36 = 1024;
    v37 = 1652;
    v38 = 2114;
    v39 = v24;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ express mode entered", buf, 0x2Cu);

  }
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
  v26 = sub_10003BE0C(v25);
  v27 = (NSString *)objc_claimAutoreleasedReturnValue(v26);
  expressType = self->_expressType;
  self->_expressType = v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v29, "didExpressModeStateChange:withObject:", 1, self->_expressType);

}

- (void)handleExpressModeExited
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  NSString *expressType;
  void *v20;
  NSString *v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  NSString *v31;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i %{public}@ express mode exited", v11, ClassName, Name, 1660, self->_expressType);
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
    expressType = self->_expressType;
    *(_DWORD *)buf = 67110146;
    v23 = v16;
    v24 = 2082;
    v25 = v17;
    v26 = 2082;
    v27 = v18;
    v28 = 1024;
    v29 = 1660;
    v30 = 2114;
    v31 = expressType;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ express mode exited", buf, 0x2Cu);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v20, "didExpressModeStateChange:withObject:", 4, self->_expressType);

  v21 = self->_expressType;
  self->_expressType = 0;

  if (self->_delayExpressMode > 0.0)
    -[_NFContactlessPaymentSession pauseExpressAndStartDefaultModeAfter:](self, "pauseExpressAndStartDefaultModeAfter:");
}

- (void)handleExpressModeTimeout
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  NSString *expressType;
  void *v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  NSString *v30;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i %{public}@ express mode timeout", v11, ClassName, Name, 1674, self->_expressType);
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
    expressType = self->_expressType;
    *(_DWORD *)buf = 67110146;
    v22 = v16;
    v23 = 2082;
    v24 = v17;
    v25 = 2082;
    v26 = v18;
    v27 = 1024;
    v28 = 1674;
    v29 = 2114;
    v30 = expressType;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ express mode timeout", buf, 0x2Cu);
  }

  if (!-[_NFContactlessSession plasticCardMode](self, "plasticCardMode"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v20, "didExpressModeStateChange:withObject:", 3, self->_expressType);

  }
}

- (void)handleAppletInactivityTimeout:(id)a3
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
  _BYTE *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  const char *ClassName;
  const char *Name;
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
    v8(6, "%c[%{public}s %{public}s]:%i Applet activity timeout: %{public}@", v11, ClassName, Name, 1687, v5);
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
    v25 = v16;
    v26 = 2082;
    v27 = object_getClassName(self);
    v28 = 2082;
    v29 = sel_getName(a2);
    v30 = 1024;
    v31 = 1687;
    v32 = 2114;
    v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Applet activity timeout: %{public}@", buf, 0x2Cu);
  }

  if (!-[_NFContactlessSession plasticCardMode](self, "plasticCardMode"))
  {
    v17 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
    if (v17)
      v18 = v17[172] != 0;
    else
      v18 = 0;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    v20 = v19;
    if (v18)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NFContactlessPaymentStartEvent appletIdentifier](self->_transactionStartEvent, "appletIdentifier"));
      objc_msgSend(v20, "didExpressModeStateChange:withObject:", 3, v21);

    }
    else
    {
      objc_msgSend(v19, "didReceiveActivityTimeout:", v5);
    }

  }
}

- (void)handleRequestService:(id)a3
{
  NFContactlessPaymentStartEvent *v5;
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
  unsigned __int8 *v17;
  int v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  _UNKNOWN **v22;
  void *v23;
  NFContactlessPaymentStartEvent *v24;
  void *v25;
  uint64_t v26;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *v28;
  _BOOL4 v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  NSString *expressType;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned __int8 v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  NFContactlessPaymentStartEvent *v50;
  NFContactlessPaymentStartEvent *transactionStartEvent;
  void *v52;
  uint64_t v53;
  void (*v54)(uint64_t, const char *, ...);
  objc_class *v55;
  _BOOL4 v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  objc_class *v63;
  int v64;
  const char *v65;
  const char *v66;
  NFContactlessPaymentStartEvent *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void (*v71)(uint64_t, const char *, ...);
  objc_class *v72;
  _BOOL4 v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  objc_class *v78;
  int v79;
  const char *v80;
  const char *v81;
  const char *ClassName;
  const char *Name;
  const char *v84;
  _QWORD v85[2];
  _QWORD v86[2];
  uint8_t buf[4];
  int v88;
  __int16 v89;
  const char *v90;
  __int16 v91;
  const char *v92;
  __int16 v93;
  int v94;
  __int16 v95;
  NFContactlessPaymentStartEvent *v96;
  __int16 v97;
  NFContactlessPaymentStartEvent *v98;

  v5 = (NFContactlessPaymentStartEvent *)a3;
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
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@", v11, ClassName, Name, 1706, v5);
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
    v88 = v16;
    v89 = 2082;
    v90 = object_getClassName(self);
    v91 = 2082;
    v92 = sel_getName(a2);
    v93 = 1024;
    v94 = 1706;
    v95 = 2114;
    v96 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  if (!-[_NFContactlessSession plasticCardMode](self, "plasticCardMode"))
  {
    v17 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
    if (!v17 || (v18 = v17[172], v17, !v18))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));

      if (v42)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
        v45 = sub_10023B608(v43, v44);

        if ((v45 & 1) != 0)
        {
          v46 = objc_alloc((Class)NSMutableDictionary);
          v85[0] = CFSTR("appletIdentifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "identifier"));
          v85[1] = CFSTR("paymentMode");
          v86[0] = v48;
          v86[1] = &off_1002FF888;
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v86, v85, 2));
          v24 = (NFContactlessPaymentStartEvent *)objc_msgSend(v46, "initWithDictionary:", v49);

          v50 = -[NFContactlessPaymentStartEvent initWithDictionary:]([NFContactlessPaymentStartEvent alloc], "initWithDictionary:", v24);
          transactionStartEvent = self->_transactionStartEvent;
          self->_transactionStartEvent = v50;

          v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v53 = NFLogGetLogger(v52);
          if (v53)
          {
            v54 = (void (*)(uint64_t, const char *, ...))v53;
            v55 = object_getClass(self);
            v56 = class_isMetaClass(v55);
            v57 = object_getClassName(self);
            v58 = sel_getName(a2);
            v59 = 45;
            if (v56)
              v59 = 43;
            v54(6, "%c[%{public}s %{public}s]:%i transaction started: %{public}@", v59, v57, v58, 1738, self->_transactionStartEvent);
          }
          v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v61 = NFSharedLogGetLogger(v60);
          v62 = objc_claimAutoreleasedReturnValue(v61);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            v63 = object_getClass(self);
            if (class_isMetaClass(v63))
              v64 = 43;
            else
              v64 = 45;
            v65 = object_getClassName(self);
            v66 = sel_getName(a2);
            v67 = self->_transactionStartEvent;
            *(_DWORD *)buf = 67110146;
            v88 = v64;
            v89 = 2082;
            v90 = v65;
            v91 = 2082;
            v92 = v66;
            v93 = 1024;
            v94 = 1738;
            v95 = 2114;
            v96 = v67;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i transaction started: %{public}@", buf, 0x2Cu);
          }

          v68 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
          objc_msgSend(v68, "didStartTransaction:", self->_transactionStartEvent);

        }
        else
        {
          v69 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v70 = NFLogGetLogger(v69);
          if (v70)
          {
            v71 = (void (*)(uint64_t, const char *, ...))v70;
            v72 = object_getClass(self);
            v73 = class_isMetaClass(v72);
            v74 = object_getClassName(self);
            v84 = sel_getName(a2);
            v75 = 45;
            if (v73)
              v75 = 43;
            v71(6, "%c[%{public}s %{public}s]:%i applet v2.0 - dropping service request", v75, v74, v84, 1731);
          }
          v76 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v77 = NFSharedLogGetLogger(v76);
          v24 = (NFContactlessPaymentStartEvent *)objc_claimAutoreleasedReturnValue(v77);
          if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_DEFAULT))
          {
            v78 = object_getClass(self);
            if (class_isMetaClass(v78))
              v79 = 43;
            else
              v79 = 45;
            v80 = object_getClassName(self);
            v81 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v88 = v79;
            v89 = 2082;
            v90 = v80;
            v91 = 2082;
            v92 = v81;
            v93 = 1024;
            v94 = 1731;
            _os_log_impl((void *)&_mh_execute_header, &v24->super, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i applet v2.0 - dropping service request", buf, 0x22u);
          }
        }
      }
      else
      {
        v24 = self->_transactionStartEvent;
        self->_transactionStartEvent = 0;
      }
      goto LABEL_29;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
    v20 = sub_100048378((uint64_t)v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    if (-[NSString isEqualToString:](self->_expressType, "isEqualToString:", CFSTR("express.transit.cathay")))
    {
      v22 = &off_1002FF858;
    }
    else
    {
      if (!-[NSString isEqualToString:](self->_expressType, "isEqualToString:", CFSTR("express.transit.suica")))
      {
        v24 = 0;
        goto LABEL_19;
      }
      v22 = &off_1002FF870;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v22));
    v24 = (NFContactlessPaymentStartEvent *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", 0));

LABEL_19:
    v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v26 = NFLogGetLogger(v25);
    if (v26)
    {
      v27 = (void (*)(uint64_t, const char *, ...))v26;
      v28 = object_getClass(self);
      v29 = class_isMetaClass(v28);
      v30 = object_getClassName(self);
      v31 = sel_getName(a2);
      v32 = 45;
      if (v29)
        v32 = 43;
      v27(6, "%c[%{public}s %{public}s]:%i %{public}@ Express transaction started for %{public}@", v32, v30, v31, 1722, self->_expressType, v24);
    }
    v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v34 = NFSharedLogGetLogger(v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = object_getClass(self);
      if (class_isMetaClass(v36))
        v37 = 43;
      else
        v37 = 45;
      v38 = object_getClassName(self);
      v39 = sel_getName(a2);
      expressType = self->_expressType;
      *(_DWORD *)buf = 67110402;
      v88 = v37;
      v89 = 2082;
      v90 = v38;
      v91 = 2082;
      v92 = v39;
      v93 = 1024;
      v94 = 1722;
      v95 = 2114;
      v96 = (NFContactlessPaymentStartEvent *)expressType;
      v97 = 2114;
      v98 = v24;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ Express transaction started for %{public}@", buf, 0x36u);
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v41, "didExpressModeStateChange:withObject:", 2, v24);

LABEL_29:
  }

}

- (void)handlePendingServerRequest
{
  OS_dispatch_queue *v4;
  NSObject *v5;
  _QWORD v6[6];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NFContactlessPaymentSession;
  v4 = -[_NFSession workQueue](&v7, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10012F23C;
  v6[3] = &unk_1002E5C30;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(v5, v6);

}

- (void)_fireFelicaTransactionEndEvent
{
  NFContactlessPaymentStartEvent *transactionStartEvent;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  NSMutableArray *v18;
  void *v19;
  char **v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  NFContactlessPaymentEndEvent *v26;
  void *v27;
  uint64_t v28;
  void (*v29)(uint64_t, const char *, ...);
  objc_class *v30;
  _BOOL4 v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  NFFelicaStateEvent *felicaEvents;
  id v49;
  void *v50;
  void *v51;
  id v52;
  NFContactlessPaymentEndEvent *v53;
  void *specific;
  uint64_t Logger;
  void (*v56)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  objc_class *v63;
  void *v64;
  char **v65;
  int v66;
  const char *v67;
  const char *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void (*v72)(uint64_t, const char *, ...);
  objc_class *v73;
  _BOOL4 v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  objc_class *v79;
  int v80;
  void *v81;
  uint64_t v82;
  void (*v83)(uint64_t, const char *, ...);
  objc_class *v84;
  _BOOL4 v85;
  __CFString *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  objc_class *v91;
  int v92;
  const char *v93;
  const char *v94;
  void *v95;
  void *v96;
  unsigned int v97;
  _UNKNOWN **v98;
  void *v99;
  uint64_t v100;
  void (*v101)(uint64_t, const char *, ...);
  objc_class *v102;
  _BOOL4 v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  NSObject *v108;
  objc_class *v109;
  int v110;
  const char *v111;
  const char *v112;
  NFContactlessPaymentStartEvent *v113;
  NFFelicaStateEvent *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  const char *v119;
  const char *ClassName;
  const char *v121;
  const char *v122;
  const char *Name;
  const char *v124;
  const char *v125;
  const char *v126;
  const char *sel;
  __CFString *v128;
  __CFString *v129;
  void *v130;
  _QWORD v131[6];
  id v132;
  _QWORD v133[3];
  _QWORD v134[3];
  uint8_t buf[4];
  int v136;
  __int16 v137;
  const char *v138;
  __int16 v139;
  const char *v140;
  __int16 v141;
  int v142;
  __int16 v143;
  NFContactlessPaymentEndEvent *v144;
  __int16 v145;
  void *v146;

  transactionStartEvent = self->_transactionStartEvent;
  if (!transactionStartEvent)
    return;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFContactlessPaymentStartEvent appletIdentifier](transactionStartEvent, "appletIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  if (objc_msgSend(v5, "caseInsensitiveCompare:", v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NFContactlessPaymentStartEvent appletIdentifier](self->_transactionStartEvent, "appletIdentifier"));
    v10 = sub_10022F2F0(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v11, "isTypeF");

    if (!v12)
      return;
  }
  else
  {

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NFContactlessPaymentStartEvent appletIdentifier](self->_transactionStartEvent, "appletIdentifier"));
  if (v13)
  {
    v14 = objc_claimAutoreleasedReturnValue(-[NFContactlessPaymentStartEvent appletIdentifier](self->_transactionStartEvent, "appletIdentifier"));
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));

  }
  if (v14)
    v16 = (__CFString *)v14;
  else
    v16 = &stru_1002ED8A8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
  v18 = sub_1000482D8((uint64_t)v17, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  if (v19 && (objc_msgSend(v19, "containsObject:", v16) & 1) == 0)
    self->_delayExpressMode = 4.0;
  v20 = &selRef__getKeyInfo_;
  if (!self->_endOfTransactionRequired)
  {
    felicaEvents = self->_felicaEvents;
    if (felicaEvents && !-[NFFelicaStateEvent isEmpty](felicaEvents, "isEmpty"))
    {
      v95 = (void *)objc_claimAutoreleasedReturnValue(-[NFFelicaStateEvent asDictionary](self->_felicaEvents, "asDictionary"));
      v131[0] = _NSConcreteStackBlock;
      v131[1] = 3221225472;
      v131[2] = sub_10012FF38;
      v131[3] = &unk_1002E8A48;
      v131[4] = self;
      v131[5] = a2;
      objc_msgSend(v95, "enumerateKeysAndObjectsUsingBlock:", v131);

    }
    else
    {
      v49 = objc_alloc((Class)NSMutableDictionary);
      v133[0] = CFSTR("appletIdentifier");
      v133[1] = CFSTR("type");
      v129 = v16;
      v134[0] = v16;
      v134[1] = &off_1002FF8D0;
      v133[2] = CFSTR("result");
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 0xFFFFLL));
      v134[2] = v50;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v134, v133, 3));
      v52 = objc_msgSend(v49, "initWithDictionary:", v51);

      v53 = -[NFContactlessPaymentEndEvent initWithDictionary:]([NFContactlessPaymentEndEvent alloc], "initWithDictionary:", v52);
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v56 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v59 = 45;
        if (isMetaClass)
          v59 = 43;
        v20 = &selRef__getKeyInfo_;
        v56(6, "%c[%{public}s %{public}s]:%i %{public}@", v59, ClassName, Name, 1825, v53);
      }
      v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v61 = NFSharedLogGetLogger(v60);
      v62 = objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = object_getClass(self);
        v64 = v19;
        v65 = v20;
        if (class_isMetaClass(v63))
          v66 = 43;
        else
          v66 = 45;
        v67 = object_getClassName(self);
        v68 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v136 = v66;
        v20 = v65;
        v19 = v64;
        v137 = 2082;
        v138 = v67;
        v139 = 2082;
        v140 = v68;
        v141 = 1024;
        v142 = 1825;
        v143 = 2114;
        v144 = v53;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
      }

      v69 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
      objc_msgSend(v69, "didEndTransaction:", v53);

      v16 = v129;
    }
    goto LABEL_70;
  }
  if (!-[_NFContactlessPaymentSession startWiredMode](self, "startWiredMode"))
  {
    v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v71 = NFLogGetLogger(v70);
    if (v71)
    {
      v72 = (void (*)(uint64_t, const char *, ...))v71;
      v73 = object_getClass(self);
      v74 = class_isMetaClass(v73);
      v75 = object_getClassName(self);
      v124 = sel_getName(a2);
      v76 = 45;
      if (v74)
        v76 = 43;
      v72(3, "%c[%{public}s %{public}s]:%i failed to set wired mode", v76, v75, v124, 1815);
    }
    v77 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v78 = NFSharedLogGetLogger(v77);
    v25 = objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v79 = object_getClass(self);
      if (class_isMetaClass(v79))
        v80 = 43;
      else
        v80 = 45;
      *(_DWORD *)buf = 67109890;
      v136 = v80;
      v137 = 2082;
      v138 = object_getClassName(self);
      v139 = 2082;
      v140 = sel_getName(a2);
      v141 = 1024;
      v142 = 1815;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i failed to set wired mode", buf, 0x22u);
    }
    goto LABEL_69;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
  v132 = 0;
  v23 = sub_10023B324(v21, v22, &v132);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = v132;

  if (v24 && !v25)
  {
    sel = a2;
    v128 = v16;
    self->_endOfTransactionRequired = 0;
    v26 = -[NFContactlessPaymentEndEvent initWithDictionary:]([NFContactlessPaymentEndEvent alloc], "initWithDictionary:", v24);
    v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v28 = NFLogGetLogger(v27);
    if (v28)
    {
      v29 = (void (*)(uint64_t, const char *, ...))v28;
      v30 = object_getClass(self);
      v31 = class_isMetaClass(v30);
      v119 = object_getClassName(self);
      v122 = sel_getName(a2);
      v32 = 45;
      if (v31)
        v32 = 43;
      v29(6, "%c[%{public}s %{public}s]:%i %{public}@", v32, v119, v122, 1791, v26);
    }
    v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v34 = NFSharedLogGetLogger(v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = object_getClass(self);
      if (class_isMetaClass(v36))
        v37 = 43;
      else
        v37 = 45;
      v38 = object_getClassName(self);
      v39 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v136 = v37;
      v137 = 2082;
      v138 = v38;
      v139 = 2082;
      v140 = v39;
      v141 = 1024;
      v142 = 1791;
      v143 = 2114;
      v144 = v26;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v40, "didEndTransaction:", v26);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "identifier"));
    v44 = sub_100043748((uint64_t)v41, v43);
    sub_1002289EC((uint64_t)NFHciTransactionEventCALogger, v24, v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[NFContactlessPaymentEndEvent felicaInfo](v26, "felicaInfo"));
    v46 = v45;
    if (!v45)
      goto LABEL_66;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("NFServiceProviderID")));
    if (objc_msgSend(&off_1002FF8A0, "isEqualToNumber:", v47))
    {

    }
    else
    {
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("NFServiceProviderID")));
      v97 = objc_msgSend(&off_1002FF8B8, "isEqualToNumber:", v96);

      if (!v97)
      {
        v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("NFServiceProviderID")));
        if ((objc_msgSend(&off_1002FF810, "isEqualToNumber:", v117) & 1) == 0)
        {

          goto LABEL_66;
        }
        v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("NFInStation")));

        if (!v118)
        {
LABEL_66:

          a2 = sel;
          v16 = v128;
LABEL_67:
          v20 = &selRef__getKeyInfo_;
          goto LABEL_68;
        }
        v98 = &off_1003067B8;
LABEL_65:
        +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", v98);
        goto LABEL_66;
      }
    }
    v98 = &off_100306790;
    goto LABEL_65;
  }
  v130 = v24;
  v81 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v82 = NFLogGetLogger(v81);
  if (v82)
  {
    v83 = (void (*)(uint64_t, const char *, ...))v82;
    v84 = object_getClass(self);
    v85 = class_isMetaClass(v84);
    v86 = v16;
    v87 = object_getClassName(self);
    v125 = sel_getName(a2);
    v88 = 45;
    if (v85)
      v88 = 43;
    v121 = v87;
    v16 = v86;
    v83(3, "%c[%{public}s %{public}s]:%i processEndOfFelicaTransactionForApplet failed: %{public}@ or output dictionary is nil: %{public}@", v88, v121, v125, 1784, v25, v130);
  }
  v89 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v90 = NFSharedLogGetLogger(v89);
  v26 = (NFContactlessPaymentEndEvent *)objc_claimAutoreleasedReturnValue(v90);
  if (os_log_type_enabled(&v26->super, OS_LOG_TYPE_ERROR))
  {
    v91 = object_getClass(self);
    if (class_isMetaClass(v91))
      v92 = 43;
    else
      v92 = 45;
    v93 = object_getClassName(self);
    v94 = sel_getName(a2);
    *(_DWORD *)buf = 67110402;
    v136 = v92;
    v137 = 2082;
    v138 = v93;
    v139 = 2082;
    v140 = v94;
    v141 = 1024;
    v142 = 1784;
    v143 = 2114;
    v144 = (NFContactlessPaymentEndEvent *)v25;
    v145 = 2114;
    v24 = v130;
    v146 = v130;
    _os_log_impl((void *)&_mh_execute_header, &v26->super, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i processEndOfFelicaTransactionForApplet failed: %{public}@ or output dictionary is nil: %{public}@", buf, 0x36u);
    goto LABEL_67;
  }
  v20 = &selRef__getKeyInfo_;
  v24 = v130;
LABEL_68:

LABEL_69:
LABEL_70:
  if (self->_hasAuthorized)
  {
    v99 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v100 = NFLogGetLogger(v99);
    if (v100)
    {
      v101 = (void (*)(uint64_t, const char *, ...))v100;
      v102 = object_getClass(self);
      v103 = class_isMetaClass(v102);
      v104 = object_getClassName(self);
      v126 = sel_getName(a2);
      v105 = 45;
      if (v103)
        v105 = 43;
      v101(6, "%c[%{public}s %{public}s]:%i Deauthorizing applet after transaction", v105, v104, v126, 1861);
    }
    v106 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v107 = NFSharedLogGetLogger(v106);
    v108 = objc_claimAutoreleasedReturnValue(v107);
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      v109 = object_getClass(self);
      if (class_isMetaClass(v109))
        v110 = 43;
      else
        v110 = 45;
      v111 = object_getClassName(self);
      v112 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v136 = v110;
      v137 = 2082;
      v138 = v111;
      v139 = 2082;
      v140 = v112;
      v141 = 1024;
      v142 = 1861;
      _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Deauthorizing applet after transaction", buf, 0x22u);
    }

    -[_NFContactlessPaymentSession _deauthorize](self, "_deauthorize");
  }
  v113 = self->_transactionStartEvent;
  self->_transactionStartEvent = 0;

  v114 = objc_opt_new(NFFelicaStateEvent);
  v115 = *((int *)v20 + 926);
  v116 = *(Class *)((char *)&self->super.super.super.super.isa + v115);
  *(Class *)((char *)&self->super.super.super.super.isa + v115) = (Class)v114;

}

- (void)_fireFelicaTransactionStartEvent
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NFContactlessPaymentStartEvent *v9;
  NFContactlessPaymentStartEvent *transactionStartEvent;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  NFContactlessPaymentStartEvent *v26;
  void *v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  NFContactlessPaymentStartEvent *v37;
  const __CFString *v38;
  void *v39;

  if (!self->_transactionStartEvent)
  {
    v4 = objc_alloc((Class)NSMutableDictionary);
    v38 = CFSTR("appletIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession activeApplet](self, "activeApplet"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v39 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
    v8 = objc_msgSend(v4, "initWithDictionary:", v7);

    v9 = -[NFContactlessPaymentStartEvent initWithDictionary:]([NFContactlessPaymentStartEvent alloc], "initWithDictionary:", v8);
    transactionStartEvent = self->_transactionStartEvent;
    self->_transactionStartEvent = v9;

    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v18 = 45;
      if (isMetaClass)
        v18 = 43;
      v13(6, "%c[%{public}s %{public}s]:%i %{public}@", v18, ClassName, Name, 1875, self->_transactionStartEvent);
    }
    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFSharedLogGetLogger(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = object_getClass(self);
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      v24 = object_getClassName(self);
      v25 = sel_getName(a2);
      v26 = self->_transactionStartEvent;
      *(_DWORD *)buf = 67110146;
      v29 = v23;
      v30 = 2082;
      v31 = v24;
      v32 = 2082;
      v33 = v25;
      v34 = 1024;
      v35 = 1875;
      v36 = 2114;
      v37 = v26;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v27, "didStartTransaction:", self->_transactionStartEvent);

  }
}

- (void)handleFelicaStateEvent:(id)a3 appletAID:(id)a4
{
  id v6;
  unsigned __int8 *v7;
  int v8;
  NFFelicaStateEvent *v9;
  NFFelicaStateEvent *felicaEvents;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (!-[_NFContactlessSession plasticCardMode](self, "plasticCardMode"))
  {
    v7 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
    if (!v7 || (v8 = v7[172], v7, !v8))
    {
      if (!self->_felicaEvents)
      {
        v9 = objc_alloc_init(NFFelicaStateEvent);
        felicaEvents = self->_felicaEvents;
        self->_felicaEvents = v9;

      }
      -[_NFContactlessPaymentSession _fireFelicaTransactionStartEvent](self, "_fireFelicaTransactionStartEvent");
      -[NFFelicaStateEvent addStateInfo:appletAID:](self->_felicaEvents, "addStateInfo:appletAID:", v12, v6);
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v11, "didFelicaStateChange:", v12);

}

- (unsigned)transactionState
{
  return self->_transactionState;
}

- (void)setTransactionState:(unsigned __int8)a3
{
  self->_transactionState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressType, 0);
  objc_storeStrong((id *)&self->_fieldNotification, 0);
  objc_storeStrong((id *)&self->_felicaEvents, 0);
  objc_storeStrong((id *)&self->_restartRoutingTimer, 0);
  objc_storeStrong((id *)&self->_deferredAuthTimer, 0);
  objc_storeStrong((id *)&self->_deferredAuth, 0);
  objc_storeStrong((id *)&self->_transactionStartEvent, 0);
}

@end
