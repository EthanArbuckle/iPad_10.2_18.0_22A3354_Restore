@implementation NFExpressModeManager

- (void)driverFieldExited
{
  NFExpressModeManager *v3;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_expressModeState == 5)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
      Logger(5, "%s:%i CLEARING EXPRESS MODE STATE", "-[NFExpressModeManager driverFieldExited]", 2034);
    v6 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v7 = NFSharedLogGetLogger(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v10 = "-[NFExpressModeManager driverFieldExited]";
      v11 = 1024;
      v12 = 2034;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%i CLEARING EXPRESS MODE STATE", buf, 0x12u);
    }

    v3->_expressModeState = 0;
    v3->_expressModeType = 0;
  }
  objc_sync_exit(v3);

  -[NFTimer stopTimer](v3->_typeFTransactionTimer, "stopTimer");
  -[NFExpressModeManagerDelegate handleFieldChanged:](v3->_delegate, "handleFieldChanged:", 0);
}

- (void)driverFieldEntered
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008600;
  block[3] = &unk_1002E5C58;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)driverExpressModeEntered:(unsigned __int8)a3
{
  NSObject *workQueue;
  _QWORD v4[5];
  unsigned __int8 v5;

  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000492B4;
  v4[3] = &unk_1002E5BB8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(workQueue, v4);
}

- (void)driverRequestService:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000496B8;
  v7[3] = &unk_1002E5CA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)driverExpressModeExited
{
  sub_10003D9DC((uint64_t)self, 0);
}

- (void)handleHostCardReaderDetected:(id)a3
{
  id v5;
  NSObject *workQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A79C;
  block[3] = &unk_1002E5C80;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(workQueue, block);

}

- (id)appletForIdentifier:(id)a3 filtered:(BOOL)a4
{
  return sub_10004440C(self, a3, a4);
}

- (void)handleAppletInactivityTimeout:(id)a3 atlData:(id)a4 caData:(id)a5
{
  id v9;
  id v10;
  id v11;
  NFExpressModeManager *v12;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v16;
  const char *ClassName;
  const char *Name;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  unsigned int expressModeState;
  void *v27;
  void *v28;
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
  unsigned int v39;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  objc_sync_enter(v12);
  if (v12->_expressModeState - 1 > 1)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(v12);
      if (class_isMetaClass(Class))
        v16 = 43;
      else
        v16 = 45;
      ClassName = object_getClassName(v12);
      Name = sel_getName(a2);
      Logger(5, "%c[%{public}s %{public}s]:%i Express mode state is unexpected: %d", v16, ClassName, Name, 2115, v12->_expressModeState);
    }
    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFSharedLogGetLogger(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = object_getClass(v12);
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      v24 = object_getClassName(v12);
      v25 = sel_getName(a2);
      expressModeState = v12->_expressModeState;
      *(_DWORD *)buf = 67110146;
      v31 = v23;
      v32 = 2082;
      v33 = v24;
      v34 = 2082;
      v35 = v25;
      v36 = 1024;
      v37 = 2115;
      v38 = 1024;
      v39 = expressModeState;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Express mode state is unexpected: %d", buf, 0x28u);
    }

  }
  else
  {
    v12->_expressModeState = 3;
  }
  objc_sync_exit(v12);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("applet")));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifierAsData"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12->_caTransactionInfo, "setObject:forKeyedSubscript:", v28, CFSTR("AID"));

  if (v11)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v12->_expressModeType));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v29, CFSTR("expressType"));

  }
  -[NFExpressModeManagerDelegate handleAppletInactivityTimeout:atlData:caData:](v12->_delegate, "handleAppletInactivityTimeout:atlData:caData:", v9, v10, v11);

}

- (void)handleFelicaStateEvent:(id)a3 appletAID:(id)a4
{
  id v6;
  _BYTE *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (self)
  {
    v7 = sub_1000443EC(self, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifierAsData"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_caTransactionInfo, "setObject:forKeyedSubscript:", v10, CFSTR("AID"));

    }
  }
  else
  {
    v9 = 0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NFServiceProviderID")));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NFServiceProviderID")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_caTransactionInfo, "setObject:forKeyedSubscript:", v12, CFSTR("SPID"));

  }
  -[NFExpressModeManagerDelegate handleFelicaStateEvent:appletAID:](self->_delegate, "handleFelicaStateEvent:appletAID:", v13, v6);

}

- (void)handleStepUpEvent:(id)a3 forApplet:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *workQueue;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  const char *v16;

  v12 = a3;
  v6 = a4;
  if (self && self->_expressModeInProgress && !self->_limitedToApplet)
  {
    if (sub_100042050((uint64_t)self))
    {
      v7 = v12;
      v8 = v6;
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004A400;
      block[3] = &unk_1002E5CD0;
      block[4] = self;
      v16 = "_handleStepUpEventInExpressMode:forApplet:";
      v10 = v7;
      v14 = v10;
      v11 = v8;
      v15 = v11;
      dispatch_async(workQueue, block);

    }
  }
  else
  {
    -[NFExpressModeManagerDelegate handleStepUpEvent:forApplet:](self->_delegate, "handleStepUpEvent:forApplet:", v12, v6);
  }

}

- (void)handleTimerExpiredEvent:(id)a3
{
  -[NFExpressModeManagerDelegate handleTimerExpiredEvent:](self->_delegate, "handleTimerExpiredEvent:", a3);
}

- (void)handleTransactionEndEvent:(id)a3 atlData:(id)a4 caData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *specific;
  uint64_t Logger;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
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
  const char *v42;
  const char *v43;
  unsigned int v44;
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
  unsigned int v57;
  unsigned int v58;
  void *v59;
  uint64_t v60;
  void (*v61)(uint64_t, const char *, ...);
  objc_class *v62;
  _BOOL4 v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  objc_class *v68;
  int v69;
  objc_class *v70;
  _BOOL4 v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  objc_class *v76;
  int v77;
  void *v78;
  uint64_t v79;
  void (*v80)(uint64_t, const char *, ...);
  objc_class *v81;
  _BOOL4 v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  NSObject *v87;
  objc_class *v88;
  int v89;
  const char *v90;
  const char *v91;
  const char *v92;
  const char *Name;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  const char *v98;
  uint8_t buf[4];
  int v101;
  __int16 v102;
  const char *v103;
  __int16 v104;
  const char *v105;
  __int16 v106;
  int v107;
  __int16 v108;
  id v109;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", self->_expressModeType));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("expressType"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applet"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applet"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifierAsData"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_caTransactionInfo, "setObject:forKeyedSubscript:", v14, CFSTR("AID"));

  }
  if (v9)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("State")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("SPRaw")));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("SPRaw")));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_caTransactionInfo, "setObject:forKeyedSubscript:", v17, CFSTR("SPID"));

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ForceExpressExit")));
    if (self->_expressModeState - 6 <= 2)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v21 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v25 = 45;
        if (isMetaClass)
          v25 = 43;
        v21(5, "%c[%{public}s %{public}s]:%i Not firing end event because express mode transaction is already in ended state", v25, ClassName, Name, 2222);
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
        *(_DWORD *)buf = 67109890;
        v101 = v30;
        v102 = 2082;
        v103 = object_getClassName(self);
        v104 = 2082;
        v105 = sel_getName(a2);
        v106 = 1024;
        v107 = 2222;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Not firing end event because express mode transaction is already in ended state", buf, 0x22u);
      }

      v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v32 = NFLogGetLogger(v31);
      if (v32)
      {
        v33 = (void (*)(uint64_t, const char *, ...))v32;
        v34 = object_getClass(self);
        v35 = class_isMetaClass(v34);
        v92 = object_getClassName(self);
        v94 = sel_getName(a2);
        v36 = 45;
        if (v35)
          v36 = 43;
        v33(5, "%c[%{public}s %{public}s]:%i %{public}@", v36, v92, v94, 2223, v8);
      }
      v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v38 = NFSharedLogGetLogger(v37);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = object_getClass(self);
        if (class_isMetaClass(v40))
          v41 = 43;
        else
          v41 = 45;
        v42 = object_getClassName(self);
        v43 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v101 = v41;
        v102 = 2082;
        v103 = v42;
        v104 = 2082;
        v105 = v43;
        v106 = 1024;
        v107 = 2223;
        v108 = 2114;
        v109 = v8;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
      }

      goto LABEL_80;
    }
    if (!self->_expressModeInProgress)
    {
LABEL_78:
      -[NFExpressModeManagerDelegate handleTransactionEndEvent:atlData:caData:](self->_delegate, "handleTransactionEndEvent:atlData:caData:", v8, v9, v10);
      if (self->_expressModeInProgress)
        self->_didPerformExpressTransaction = 1;
LABEL_80:

      if (!self->_expressModeInProgress)
        goto LABEL_92;
      goto LABEL_81;
    }
    if (objc_msgSend(v8, "didError") && objc_msgSend(v8, "result") == 61444)
    {
      v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v46 = NFLogGetLogger(v45);
      if (v46)
      {
        v47 = (void (*)(uint64_t, const char *, ...))v46;
        v48 = object_getClass(self);
        v49 = class_isMetaClass(v48);
        v50 = object_getClassName(self);
        v95 = sel_getName(a2);
        v51 = 45;
        if (v49)
          v51 = 43;
        v47(5, "%c[%{public}s %{public}s]:%i Transaction end incompatible", v51, v50, v95, 2231);
      }
      v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v53 = NFSharedLogGetLogger(v52);
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = object_getClass(self);
        if (class_isMetaClass(v55))
          v56 = 43;
        else
          v56 = 45;
        *(_DWORD *)buf = 67109890;
        v101 = v56;
        v102 = 2082;
        v103 = object_getClassName(self);
        v104 = 2082;
        v105 = sel_getName(a2);
        v106 = 1024;
        v107 = 2231;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Transaction end incompatible", buf, 0x22u);
      }
      v57 = 7;
    }
    else
    {
      if (objc_msgSend(v8, "didError") && objc_msgSend(v8, "result") == 61445)
      {
        v57 = 9;
LABEL_77:
        self->_expressModeState = v57;
        goto LABEL_78;
      }
      v58 = objc_msgSend(v8, "didError");
      v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v60 = NFLogGetLogger(v59);
      v61 = (void (*)(uint64_t, const char *, ...))v60;
      if (v58)
      {
        if (v60)
        {
          v62 = object_getClass(self);
          v63 = class_isMetaClass(v62);
          v64 = object_getClassName(self);
          v96 = sel_getName(a2);
          v65 = 45;
          if (v63)
            v65 = 43;
          v61(5, "%c[%{public}s %{public}s]:%i Transaction end failure", v65, v64, v96, 2238);
        }
        v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v67 = NFSharedLogGetLogger(v66);
        v54 = objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v68 = object_getClass(self);
          if (class_isMetaClass(v68))
            v69 = 43;
          else
            v69 = 45;
          *(_DWORD *)buf = 67109890;
          v101 = v69;
          v102 = 2082;
          v103 = object_getClassName(self);
          v104 = 2082;
          v105 = sel_getName(a2);
          v106 = 1024;
          v107 = 2238;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Transaction end failure", buf, 0x22u);
        }
        v57 = 8;
      }
      else
      {
        if (v60)
        {
          v70 = object_getClass(self);
          v71 = class_isMetaClass(v70);
          v72 = object_getClassName(self);
          v97 = sel_getName(a2);
          v73 = 45;
          if (v71)
            v73 = 43;
          v61(5, "%c[%{public}s %{public}s]:%i Transaction ended", v73, v72, v97, 2242);
        }
        v74 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v75 = NFSharedLogGetLogger(v74);
        v54 = objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v76 = object_getClass(self);
          if (class_isMetaClass(v76))
            v77 = 43;
          else
            v77 = 45;
          *(_DWORD *)buf = 67109890;
          v101 = v77;
          v102 = 2082;
          v103 = object_getClassName(self);
          v104 = 2082;
          v105 = sel_getName(a2);
          v106 = 1024;
          v107 = 2242;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Transaction ended", buf, 0x22u);
        }
        v57 = 6;
      }
    }

    goto LABEL_77;
  }
  if (self->_expressModeState)
  {
    if (objc_msgSend(v8, "didError") && objc_msgSend(v8, "result") == 61444)
    {
      v44 = 7;
    }
    else if (objc_msgSend(v8, "didError"))
    {
      v44 = 8;
    }
    else
    {
      v44 = 6;
    }
    self->_expressModeState = v44;
  }
  -[NFExpressModeManagerDelegate handleTransactionEndEvent:atlData:caData:](self->_delegate, "handleTransactionEndEvent:atlData:caData:", v8, 0, v10);
  if (!self->_expressModeInProgress)
  {
    v18 = 0;
    goto LABEL_92;
  }
  v18 = 0;
  self->_didPerformExpressTransaction = 1;
LABEL_81:
  if (objc_msgSend(v18, "BOOLValue"))
  {
    usleep(0x30D40u);
    v78 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v79 = NFLogGetLogger(v78);
    if (v79)
    {
      v80 = (void (*)(uint64_t, const char *, ...))v79;
      v81 = object_getClass(self);
      v82 = class_isMetaClass(v81);
      v83 = object_getClassName(self);
      v98 = sel_getName(a2);
      v84 = 45;
      if (v82)
        v84 = 43;
      v80(6, "%c[%{public}s %{public}s]:%i ATLEndEventForceExpressExit set - exiting express", v84, v83, v98, 2259);
    }
    v85 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v86 = NFSharedLogGetLogger(v85);
    v87 = objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      v88 = object_getClass(self);
      if (class_isMetaClass(v88))
        v89 = 43;
      else
        v89 = 45;
      v90 = object_getClassName(self);
      v91 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v101 = v89;
      v102 = 2082;
      v103 = v90;
      v104 = 2082;
      v105 = v91;
      v106 = 1024;
      v107 = 2259;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ATLEndEventForceExpressExit set - exiting express", buf, 0x22u);
    }

    sub_10003D9DC((uint64_t)self, 0);
  }
LABEL_92:

}

- (void)handleTransactionStartEvent:(id)a3 atlData:(id)a4 caData:(id)a5
{
  id v8;
  id v9;
  unsigned int expressModeState;
  BOOL v11;
  void *v13;
  _BYTE *v14;
  NFApplet *v15;
  NFApplet *activeApplet;
  void *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  expressModeState = self->_expressModeState;
  if (expressModeState)
    v11 = expressModeState == 5;
  else
    v11 = 1;
  if (!v11)
  {
    expressModeState = 2;
    self->_expressModeState = 2;
  }
  if ((self->_expressModeType | 4) == 5 && expressModeState == 5)
  {
    -[NFTimer stopTimer](self->_typeFTransactionTimer, "stopTimer");
    -[NFTimer startTimer:](self->_typeFTransactionTimer, "startTimer:", 0.25);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "appletIdentifier"));
  v14 = sub_1000443EC(self, v13);
  v15 = (NFApplet *)objc_claimAutoreleasedReturnValue(v14);
  activeApplet = self->_activeApplet;
  self->_activeApplet = v15;

  if (v9)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", self->_expressModeType));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("expressType"));

  }
  -[NFExpressModeManagerDelegate handleTransactionStartEvent:atlData:caData:](self->_delegate, "handleTransactionStartEvent:atlData:caData:", v18, v8, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_caTransactionInfo, 0);
  objc_storeStrong((id *)&self->_singlePollAssertionTimer, 0);
  objc_storeStrong((id *)&self->_typeFTransactionTimer, 0);
  objc_storeStrong((id *)&self->_expressModeExitTimer, 0);
  objc_storeStrong((id *)&self->_reactivationTimer, 0);
  objc_storeStrong((id *)&self->_delayExpressTimer, 0);
  objc_storeStrong((id *)&self->_activeApplet, 0);
  objc_storeStrong((id *)&self->_limitedToApplet, 0);
  objc_storeStrong((id *)&self->_configMap, 0);
  objc_storeStrong((id *)&self->_eseConfig, 0);
  objc_storeStrong((id *)&self->_stepUpController, 0);
  objc_storeStrong((id *)&self->_controllerManager, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
