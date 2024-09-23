@implementation NFWalletPresentationService

- (unint64_t)walletDomain
{
  if (self)
    self = (NFWalletPresentationService *)self->_walletPresentationEventPublisher;
  return -[NFWalletPresentationService walletDomain](self, "walletDomain");
}

- (id)walletBundleIdentifier
{
  if (self)
    self = (NFWalletPresentationService *)self->_walletPresentationEventPublisher;
  return sub_1000097F8((os_unfair_lock_s *)self);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v7;
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
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  uint64_t v25;
  const char *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  unsigned __int8 v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  objc_class *v39;
  int v40;
  const char *v41;
  const char *v42;
  unsigned int v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  const char *Name;
  const char *v51;
  id v52;
  _QWORD v53[5];
  id v54[2];
  _QWORD v55[5];
  id v56[2];
  id location;
  uint8_t buf[4];
  int v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  unsigned int v67;
  __int16 v68;
  id v69;

  v52 = a3;
  v7 = a4;
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
    v10(6, "%c[%{public}s %{public}s]:%i ", v14, ClassName, Name, 113);
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
    v59 = v19;
    v60 = 2082;
    v61 = object_getClassName(self);
    v62 = 2082;
    v63 = sel_getName(a2);
    v64 = 1024;
    v65 = 113;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  objc_initWeak(&location, v7);
  if (self)
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NFWalletPresentationInterface));
  else
    v20 = 0;
  objc_msgSend(v7, "setExportedInterface:", v20);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_msgSend(v7, "setRemoteObjectInterface:", 0);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100052890;
  v55[3] = &unk_1002E5E80;
  objc_copyWeak(v56, &location);
  v55[4] = self;
  v56[1] = (id)a2;
  objc_msgSend(v7, "setInvalidationHandler:", v55);
  v53[1] = 3221225472;
  v53[2] = sub_100052AE8;
  v53[3] = &unk_1002E5E80;
  v53[0] = _NSConcreteStackBlock;
  objc_copyWeak(v54, &location);
  v53[4] = self;
  v54[1] = (id)a2;
  objc_msgSend(v7, "setInterruptionHandler:", v53);
  sub_1001CE498(v7);
  v21 = sub_1001CE7CC(v7);
  if ((v21 & 1) != 0)
  {
    objc_msgSend(v7, "resume");
  }
  else
  {
    v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v22);
    if (v23)
    {
      v24 = object_getClass(self);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      v26 = object_getClassName(self);
      v51 = sel_getName(a2);
      v27 = objc_msgSend(v7, "processIdentifier");
      v28 = sub_1001CE3DC(v7);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      v30 = (void *)v29;
      v31 = v21;
      v32 = v26;
      v33 = v25;
      if (v29)
        v34 = *(void **)(v29 + 8);
      else
        v34 = 0;
      v35 = v34;
      v23(3, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) does not entitle to access service", v33, v32, v51, 145, v27, v35);
      v21 = v31;

    }
    v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v37 = NFSharedLogGetLogger(v36);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = object_getClass(self);
      if (class_isMetaClass(v39))
        v40 = 43;
      else
        v40 = 45;
      v41 = object_getClassName(self);
      v42 = sel_getName(a2);
      v43 = objc_msgSend(v7, "processIdentifier");
      v44 = sub_1001CE3DC(v7);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      v46 = (void *)v45;
      if (v45)
        v47 = *(void **)(v45 + 8);
      else
        v47 = 0;
      v48 = v47;
      *(_DWORD *)buf = 67110402;
      v59 = v40;
      v60 = 2082;
      v61 = v41;
      v62 = 2082;
      v63 = v42;
      v64 = 1024;
      v65 = 145;
      v66 = 1024;
      v67 = v43;
      v68 = 2114;
      v69 = v48;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) does not entitle to access service", buf, 0x32u);

    }
  }
  objc_destroyWeak(v54);
  objc_destroyWeak(v56);
  objc_destroyWeak(&location);

  return v21;
}

- (void)presentWithCompletion:(id)a3
{
  void (**v5)(_QWORD);
  void *v6;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  id v14;
  const char *v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  NFWalletPresentationEventPublisher *walletPresentationEventPublisher;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  double v38;
  double v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  uint8_t buf[4];
  _BYTE v44[24];
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;

  v5 = (void (**)(_QWORD))a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v14 = sub_1001CE3DC(v6);
    v15 = a2;
    v16 = v5;
    v17 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "debugDescription"));
    v20 = 45;
    if (isMetaClass)
      v20 = 43;
    v9(6, "%c[%{public}s %{public}s]:%i %@", v20, ClassName, Name, 162, v19);

    v6 = v17;
    v5 = v16;
    a2 = v15;
  }
  v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v22 = NFSharedLogGetLogger(v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = object_getClass(self);
    if (class_isMetaClass(v24))
      v25 = 43;
    else
      v25 = 45;
    v26 = object_getClassName(self);
    v27 = sel_getName(a2);
    v28 = sub_1001CE3DC(v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "debugDescription"));
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v44 = v25;
    *(_WORD *)&v44[4] = 2082;
    *(_QWORD *)&v44[6] = v26;
    *(_WORD *)&v44[14] = 2082;
    *(_QWORD *)&v44[16] = v27;
    v45 = 1024;
    v46 = 162;
    v47 = 2112;
    v48 = v30;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v32 = NFSharedSignpostLog(v31);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "[XPC]presentWithCompletion:", ", buf, 2u);
  }

  if (self)
    walletPresentationEventPublisher = self->_walletPresentationEventPublisher;
  else
    walletPresentationEventPublisher = 0;
  sub_100054E24((id *)&walletPresentationEventPublisher->super.isa);
  v36 = NFSharedSignpostLog(v35);
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "[XPC]presentWithCompletion:", ", buf, 2u);
  }

  objc_msgSend(v31, "timeIntervalSinceNow");
  v39 = v38;
  v40 = NFSharedLogGetLogger(0);
  v41 = objc_claimAutoreleasedReturnValue(v40);
  v42 = v41;
  if (v39 >= -0.5)
  {
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v44 = "-[NFWalletPresentationService presentWithCompletion:]";
      *(_WORD *)&v44[8] = 2050;
      *(double *)&v44[10] = -v39;
      _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%s signalPresentation interval=%{public}f", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134349056;
    *(_QWORD *)v44 = 0x3FE0000000000000;
    _os_log_fault_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_FAULT, "Exceed %{public}f time limit", buf, 0xCu);
  }

  v5[2](v5);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("walletDomain")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NFWalletPresentationService;
    v5 = objc_msgSendSuper2(&v7, "automaticallyNotifiesObserversForKey:", v4);
  }

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *ClassName;
  const char *Name;
  objc_super v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  id v35;

  v11 = a5;
  if (off_100328360 == a6)
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
      v17 = 45;
      if (isMetaClass)
        v17 = 43;
      v14(6, "%c[%{public}s %{public}s]:%i change=%@", v17, ClassName, Name, 197, v11);
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
      *(_DWORD *)buf = 67110146;
      v27 = v22;
      v28 = 2082;
      v29 = object_getClassName(self);
      v30 = 2082;
      v31 = sel_getName(a2);
      v32 = 1024;
      v33 = 197;
      v34 = 2112;
      v35 = v11;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i change=%@", buf, 0x2Cu);
    }

    -[NFWalletPresentationService willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("walletDomain"));
    -[NFWalletPresentationService didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("walletDomain"));
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)NFWalletPresentationService;
    -[NFWalletPresentationService observeValueForKeyPath:ofObject:change:context:](&v25, "observeValueForKeyPath:ofObject:change:context:", a3, a4, v11, a6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceCounter, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_walletPresentationEventPublisher, 0);
  objc_storeStrong((id *)&self->_presentmentService, 0);
}

- (BOOL)notifyFieldDetectPresentmentWithFieldNotification:(id)a3
{
  id v4;
  NFWalletPresentationServiceAssertionCounter *referenceCounter;
  NFWalletPresentationServiceAssertionCounter *v6;
  NFWalletPresentationServiceAssertionCounter *v7;
  unsigned __int8 v8;
  BOOL v9;
  NFWalletPresentationEventPublisher *walletPresentationEventPublisher;

  v4 = a3;
  if (self)
    referenceCounter = self->_referenceCounter;
  else
    referenceCounter = 0;
  v6 = referenceCounter;
  if (sub_100139F34(v6, 1uLL))
  {

LABEL_8:
    v9 = 0;
    goto LABEL_12;
  }
  if (self)
    v7 = self->_referenceCounter;
  else
    v7 = 0;
  v8 = sub_100139F34(v7, 2uLL);

  if ((v8 & 1) != 0)
    goto LABEL_8;
  if (self)
    walletPresentationEventPublisher = self->_walletPresentationEventPublisher;
  else
    walletPresentationEventPublisher = 0;
  v9 = sub_100055FD8((uint64_t)walletPresentationEventPublisher, v4);
LABEL_12:

  return v9;
}

- (BOOL)forceNotifyFieldDetectPresentmentWithFieldNotification:(id)a3 walletDomain:(unint64_t)a4
{
  id v6;
  NFWalletPresentationServiceAssertionCounter *referenceCounter;
  NFWalletPresentationServiceAssertionCounter *v8;
  NFWalletPresentationServiceAssertionCounter *v9;
  unsigned __int8 v10;
  BOOL v11;
  NFWalletPresentationEventPublisher *walletPresentationEventPublisher;

  v6 = a3;
  if (self)
    referenceCounter = self->_referenceCounter;
  else
    referenceCounter = 0;
  v8 = referenceCounter;
  if (sub_100139F34(v8, 1uLL))
  {

LABEL_8:
    v11 = 0;
    goto LABEL_12;
  }
  if (self)
    v9 = self->_referenceCounter;
  else
    v9 = 0;
  v10 = sub_100139F34(v9, 2uLL);

  if ((v10 & 1) != 0)
    goto LABEL_8;
  if (self)
    walletPresentationEventPublisher = self->_walletPresentationEventPublisher;
  else
    walletPresentationEventPublisher = 0;
  v11 = sub_10005674C((uint64_t)walletPresentationEventPublisher, v6, a4);
LABEL_12:

  return v11;
}

- (void)notifyPresentmentFieldExit
{
  NFWalletPresentationServiceAssertionCounter *referenceCounter;
  NFWalletPresentationServiceAssertionCounter *v4;
  unsigned __int8 v5;
  NFWalletPresentationEventPublisher *walletPresentationEventPublisher;
  NFWalletPresentationServiceAssertionCounter *v7;

  if (self)
    referenceCounter = self->_referenceCounter;
  else
    referenceCounter = 0;
  v7 = referenceCounter;
  if (sub_100139F34(v7, 1uLL))
  {

  }
  else
  {
    if (self)
      v4 = self->_referenceCounter;
    else
      v4 = 0;
    v5 = sub_100139F34(v4, 2uLL);

    if ((v5 & 1) == 0)
    {
      if (self)
        walletPresentationEventPublisher = self->_walletPresentationEventPublisher;
      else
        walletPresentationEventPublisher = 0;
      sub_100056E84((uint64_t)walletPresentationEventPublisher);
    }
  }
}

- (BOOL)assert:(unint64_t)a3 isFirst:(BOOL *)a4
{
  NFWalletPresentationService *v6;
  unsigned int v7;
  uint64_t referenceCounter;
  int v9;
  NFWalletPresentationEventPublisher *v10;
  NFWalletPresentationEventPublisher *walletPresentationEventPublisher;

  v6 = self;
  if (self)
    self = (NFWalletPresentationService *)self->_referenceCounter;
  v7 = sub_100139F34(self, a3);
  if (v6)
    referenceCounter = (uint64_t)v6->_referenceCounter;
  else
    referenceCounter = 0;
  v9 = sub_100139980(referenceCounter, a3);
  if (((v7 | v9 ^ 1) & 1) == 0)
  {
    if (a3 == 1)
    {
      if (v6)
        walletPresentationEventPublisher = v6->_walletPresentationEventPublisher;
      else
        walletPresentationEventPublisher = 0;
      sub_100055AA0(walletPresentationEventPublisher);
      if (a4)
        goto LABEL_12;
      return v9;
    }
    if (!a3)
    {
      if (v6)
        v10 = v6->_walletPresentationEventPublisher;
      else
        v10 = 0;
      sub_100055C00(v10);
    }
  }
  if (a4)
LABEL_12:
    *a4 = v7 ^ 1;
  return v9;
}

- (BOOL)deassert:(unint64_t)a3 isLast:(BOOL *)a4
{
  NFWalletPresentationServiceAssertionCounter *referenceCounter;
  NFWalletPresentationEventPublisher *v9;
  NFWalletPresentationEventPublisher *walletPresentationEventPublisher;
  char v12;
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
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  unint64_t v35;

  if (self)
  {
    if ((sub_100139C5C((uint64_t)self->_referenceCounter, a3) & 1) != 0)
    {
      referenceCounter = self->_referenceCounter;
LABEL_4:
      if ((sub_100139F34(referenceCounter, a3) & 1) == 0)
      {
        if (a4)
          *a4 = 1;
        if (a3 == 1)
        {
          if (self)
            walletPresentationEventPublisher = self->_walletPresentationEventPublisher;
          else
            walletPresentationEventPublisher = 0;
          sub_100055B50(walletPresentationEventPublisher);
        }
        else if (!a3)
        {
          if (self)
            v9 = self->_walletPresentationEventPublisher;
          else
            v9 = 0;
          sub_100055DDC((id *)&v9->super.isa);
        }
      }
      return 1;
    }
  }
  else
  {
    v12 = sub_100139C5C(0, a3);
    referenceCounter = 0;
    if ((v12 & 1) != 0)
      goto LABEL_4;
  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v15 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v18 = 45;
    if (isMetaClass)
      v18 = 43;
    v15(3, "%c[%{public}s %{public}s]:%i Missing assertion (%lu)", v18, ClassName, Name, 283, a3);
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
    *(_DWORD *)buf = 67110146;
    v27 = v23;
    v28 = 2082;
    v29 = object_getClassName(self);
    v30 = 2082;
    v31 = sel_getName(a2);
    v32 = 1024;
    v33 = 283;
    v34 = 2048;
    v35 = a3;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing assertion (%lu)", buf, 0x2Cu);
  }

  return 0;
}

- (BOOL)isAsserted:(unint64_t)a3
{
  if (self)
    self = (NFWalletPresentationService *)self->_referenceCounter;
  return sub_100139F34(self, a3);
}

- (BOOL)fieldDetectRequested
{
  NFWalletPresentationEventPublisher *v2;
  NFWalletPresentationEventPublisher *walletPresentationEventPublisher;
  NFWalletPresentationEventPublisher *v5;
  id v6;
  NFWalletPresentationEventPublisher *v7;
  NFWalletPresentationEventPublisher *v8;
  id v9;
  void *v10;
  BOOL v11;

  if (self)
    walletPresentationEventPublisher = self->_walletPresentationEventPublisher;
  else
    walletPresentationEventPublisher = 0;
  v5 = walletPresentationEventPublisher;
  v6 = -[NFWalletPresentationEventPublisher walletDomain](v5, "walletDomain");
  if (v6 != (id)2)
  {
    v7 = self ? self->_walletPresentationEventPublisher : 0;
    v2 = v7;
    if ((id)-[NFWalletPresentationEventPublisher walletDomain](v2, "walletDomain") != (id)1)
    {
      v11 = 0;
LABEL_12:

      goto LABEL_13;
    }
  }
  if (self)
    v8 = self->_walletPresentationEventPublisher;
  else
    v8 = 0;
  v9 = sub_1000097F8((os_unfair_lock_s *)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v10, "lengthOfBytesUsingEncoding:", 4) != 0;

  if (v6 != (id)2)
    goto LABEL_12;
LABEL_13:

  return v11;
}

- (id)dumpState
{
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  void *v5;
  NFWalletPresentationEventPublisher *walletPresentationEventPublisher;
  NSMutableDictionary *v7;
  void *v8;
  NSMutableDictionary *v10;
  void *v11;

  v3 = objc_opt_new(NSMutableDictionary);
  if (self)
  {
    v4 = sub_10013A0F4((unsigned __int8 *)self->_referenceCounter);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CFSTR("AssertRefCounters"));

    walletPresentationEventPublisher = self->_walletPresentationEventPublisher;
  }
  else
  {
    v10 = sub_10013A0F4(0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, CFSTR("AssertRefCounters"));

    walletPresentationEventPublisher = 0;
  }
  v7 = sub_100056FA8((uint64_t)walletPresentationEventPublisher);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, CFSTR("EventPublisher"));

  return v3;
}

@end
