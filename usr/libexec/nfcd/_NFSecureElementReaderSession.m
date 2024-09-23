@implementation _NFSecureElementReaderSession

+ (id)validateEntitlements:(id)a3
{
  id v5;
  id v6;
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
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  const char *Name;
  _QWORD v27[4];
  _QWORD v28[4];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;

  v5 = a3;
  if (objc_msgSend(v5, "seSessionAccess")
    && (objc_msgSend(v5, "readerInternalAccess") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", v13, ClassName, Name, 53);
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
      *(_DWORD *)buf = 67109890;
      v30 = v18;
      v31 = 2082;
      v32 = object_getClassName(a1);
      v33 = 2082;
      v34 = sel_getName(a2);
      v35 = 1024;
      v36 = 53;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", buf, 0x22u);
    }

    v19 = objc_alloc((Class)NSError);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v27[0] = NSLocalizedDescriptionKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v28[0] = v21;
    v28[1] = &off_1002FFAB0;
    v27[1] = CFSTR("Line");
    v27[2] = CFSTR("Method");
    v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v28[2] = v22;
    v27[3] = NSDebugDescriptionErrorKey;
    v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 54);
    v28[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 4));
    v6 = objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 32, v24);

  }
  return v6;
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig embeddedWiredModeWithFD:](NFRoutingConfig, "embeddedWiredModeWithFD:", 1);
}

- (void)cleanup
{
  uint64_t v4;
  NSObject *v5;
  id WeakRetained;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
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
  void *v35;

  v4 = NFSharedSignpostLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFSecureElementReaderSession", buf, 2u);
  }

  if (-[_NFSession needsCleanup](self, "needsCleanup") && !-[_NFSession isSuspended](self, "isSuspended"))
  {
    -[_NFSecureElementReaderSession _cleanupVAS](self, "_cleanupVAS");
    WeakRetained = objc_loadWeakRetained((id *)&self->_powerConsumptionReporter);
    sub_10019D694((uint64_t)WeakRetained, self);

    Logger = NFLogGetLogger(2);
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v8(6, "%c[%{public}s %{public}s]:%i NFC Reader mode terminated: %@", v14, ClassName, Name, 74, v13);

    }
    v15 = NFSharedLogGetLogger(2);
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
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      *(_DWORD *)buf = 67110146;
      v27 = v18;
      v28 = 2082;
      v29 = v19;
      v30 = 2082;
      v31 = v20;
      v32 = 1024;
      v33 = 74;
      v34 = 2112;
      v35 = v21;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC Reader mode terminated: %@", buf, 0x2Cu);

    }
  }
  v25.receiver = self;
  v25.super_class = (Class)_NFSecureElementReaderSession;
  v22 = -[_NFSession cleanup](&v25, "cleanup");
  v23 = NFSharedSignpostLog(v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFSecureElementReaderSession", buf, 2u);
  }

}

- (void)didStartSession:(id)a3
{
  id v4;
  void *v5;
  NFSecureElementWrapper *v6;
  NFSecureElementWrapper *embeddedSecureElementWrapper;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_NFSecureElementReaderSession;
  v4 = a3;
  -[_NFSession didStartSession:](&v9, "didStartSession:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager", v9.receiver, v9.super_class));
  v6 = (NFSecureElementWrapper *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secureElementWrapper"));
  embeddedSecureElementWrapper = self->_embeddedSecureElementWrapper;
  self->_embeddedSecureElementWrapper = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v8, "didStartSession:", v4);

}

- (BOOL)suspendWithInfo:(id)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
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
  id WeakRetained;
  uint64_t v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  _BOOL4 v27;
  const char *v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  void *v37;
  const char *Name;
  objc_super v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;

  v40.receiver = self;
  v40.super_class = (Class)_NFSecureElementReaderSession;
  v5 = -[_NFXPCSession suspendWithInfo:](&v40, "suspendWithInfo:", a3);
  if (v5 && self->_readerOn)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig embeddedWiredMode](NFRoutingConfig, "embeddedWiredMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "setRoutingConfig:", v7));

    if (v8)
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
        v11(3, "%c[%{public}s %{public}s]:%i Failed to change routing.", v15, ClassName, Name, 103);
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
        *(_DWORD *)buf = 67109890;
        v42 = v20;
        v43 = 2082;
        v44 = v21;
        v45 = 2082;
        v46 = v22;
        v47 = 1024;
        v48 = 103;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to change routing.", buf, 0x22u);
      }
    }
    else
    {
      self->_readerOn = 0;
      self->_tooHot = 0;
      WeakRetained = objc_loadWeakRetained((id *)&self->_powerConsumptionReporter);
      sub_10019D694((uint64_t)WeakRetained, self);

      v24 = NFLogGetLogger(2);
      if (v24)
      {
        v25 = (void (*)(uint64_t, const char *, ...))v24;
        v26 = object_getClass(self);
        v27 = class_isMetaClass(v26);
        v28 = object_getClassName(self);
        v29 = sel_getName(a2);
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
        v31 = 45;
        if (v27)
          v31 = 43;
        v25(6, "%c[%{public}s %{public}s]:%i NFC Reader mode terminated: %@", v31, v28, v29, 101, v30);

      }
      v32 = NFSharedLogGetLogger(2);
      v18 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v33 = object_getClass(self);
        if (class_isMetaClass(v33))
          v34 = 43;
        else
          v34 = 45;
        v35 = object_getClassName(self);
        v36 = sel_getName(a2);
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
        *(_DWORD *)buf = 67110146;
        v42 = v34;
        v43 = 2082;
        v44 = v35;
        v45 = 2082;
        v46 = v36;
        v47 = 1024;
        v48 = 101;
        v49 = 2112;
        v50 = v37;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC Reader mode terminated: %@", buf, 0x2Cu);

      }
    }

  }
  return v5;
}

- (BOOL)shouldHandleSecureElementTransactionData
{
  return 1;
}

- (void)handleReaderBurnoutTimer
{
  OS_dispatch_queue *v4;
  NSObject *v5;
  _QWORD v6[6];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NFSecureElementReaderSession;
  v4 = -[_NFSession workQueue](&v7, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001400D4;
  v6[3] = &unk_1002E5C30;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(v5, v6);

}

- (void)handleReaderBurnoutCleared
{
  id v2;

  self->_tooHot = 0;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v2, "didReceiveThermalIndication:", 0);

}

- (id)selectApplets:(id)a3
{
  id v5;
  _UNKNOWN **v6;
  void *i;
  uint64_t v8;
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
  void *v24;
  id v25;
  unsigned int v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  _UNKNOWN **v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *v41;
  _BOOL4 v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  const char *ClassName;
  const char *Name;
  const char *v55;
  id v56;
  const char *sel;
  _NFSecureElementReaderSession *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[2];
  _QWORD v68[2];
  NSErrorUserInfoKey v69;
  void *v70;
  uint8_t buf[4];
  int v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  int v78;
  __int16 v79;
  uint64_t v80;
  _BYTE v81[128];

  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v5 = a3;
  v61 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
  if (v61)
  {
    v59 = *(_QWORD *)v64;
    v6 = &AMFDRSealingMapCopyLocalData_ptr;
    v56 = v5;
    sel = a2;
    v58 = self;
    while (2)
    {
      for (i = 0; i != v61; i = (char *)i + 1)
      {
        if (*(_QWORD *)v64 != v59)
          objc_enumerationMutation(v5);
        v8 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
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
          v6 = &AMFDRSealingMapCopyLocalData_ptr;
          v11(6, "%c[%{public}s %{public}s]:%i Selecting %{public}@", v14, ClassName, Name, 154, v8);
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
          v72 = v19;
          v73 = 2082;
          v74 = v20;
          v75 = 2082;
          v76 = v21;
          v77 = 1024;
          v78 = 154;
          v79 = 2114;
          v80 = v8;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Selecting %{public}@", buf, 0x2Cu);
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementReaderSession embeddedSecureElementWrapper](self, "embeddedSecureElementWrapper"));
        v60 = v8;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v8));
        v62 = 0;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "selectByName:error:", v23, &v62));
        v25 = v62;

        if (v25 || objc_msgSend(v24, "status") != 36864)
        {
          if (objc_msgSend(v24, "status") != 36864)
          {
            v26 = objc_msgSend(v24, "status");
            v27 = objc_alloc((Class)NSError);
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[267], "stringWithUTF8String:", "nfcd"));
            if (v26 == 25392)
            {
              v69 = NSLocalizedDescriptionKey;
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[267], "stringWithUTF8String:", "Reader mode prohibit timer"));
              v70 = v29;
              v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
              v31 = objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 64, v30);
            }
            else
            {
              v67[0] = NSLocalizedDescriptionKey;
              v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6[267], "stringWithUTF8String:", "Commmand Error"));
              v33 = v6;
              v29 = (void *)v32;
              v67[1] = NSLocalizedFailureReasonErrorKey;
              v68[0] = v32;
              v34 = objc_alloc((Class)v33[267]);
              v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v24, "status")));
              v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringValue"));
              v36 = objc_msgSend(v34, "initWithFormat:", CFSTR("%@"), v35);
              v68[1] = v36;
              v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v68, v67, 2));
              v31 = objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 16, v37);

              a2 = sel;
              v25 = (id)v35;
              v5 = v56;
            }

            v25 = v31;
            self = v58;
            v6 = &AMFDRSealingMapCopyLocalData_ptr;
          }
          if (v25)
          {
            v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v39 = NFLogGetLogger(v38);
            if (v39)
            {
              v40 = (void (*)(uint64_t, const char *, ...))v39;
              v41 = object_getClass(self);
              v42 = class_isMetaClass(v41);
              v43 = object_getClassName(self);
              v55 = sel_getName(sel);
              v44 = 45;
              if (v42)
                v44 = 43;
              v40(3, "%c[%{public}s %{public}s]:%i Failed to select applet %{public}@", v44, v43, v55, 170, v60);
            }
            v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v46 = NFSharedLogGetLogger(v45);
            v47 = objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              v48 = object_getClass(self);
              if (class_isMetaClass(v48))
                v49 = 43;
              else
                v49 = 45;
              v50 = object_getClassName(self);
              v51 = sel_getName(sel);
              *(_DWORD *)buf = 67110146;
              v72 = v49;
              v73 = 2082;
              v74 = v50;
              v75 = 2082;
              v76 = v51;
              v77 = 1024;
              v78 = 170;
              v79 = 2114;
              v80 = v60;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet %{public}@", buf, 0x2Cu);
            }

            goto LABEL_36;
          }
        }

      }
      v61 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
      if (v61)
        continue;
      break;
    }
  }
  v25 = 0;
LABEL_36:

  return v25;
}

- (void)selectApplets:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, id);
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  uint64_t v15;
  OS_dispatch_queue *v16;
  NSObject *v17;
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
  const char *v30;
  const char *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  const char *Name;
  _QWORD block[5];
  id v41;
  void (**v42)(id, id);
  SEL v43;
  objc_super v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  _QWORD v50[4];
  uint8_t buf[4];
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  _BYTE v59[128];

  v7 = a3;
  v8 = (void (**)(id, id))a4;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        v15 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
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
            v20(3, "%c[%{public}s %{public}s]:%i Invalid applet type", v24, ClassName, Name, 183);
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
            *(_DWORD *)buf = 67109890;
            v52 = v29;
            v53 = 2082;
            v54 = v30;
            v55 = 2082;
            v56 = v31;
            v57 = 1024;
            v58 = 183;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid applet type", buf, 0x22u);
          }

          v32 = objc_alloc((Class)NSError);
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v49[0] = NSLocalizedDescriptionKey;
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
          v50[0] = v34;
          v50[1] = &off_1002FFAC8;
          v49[1] = CFSTR("Line");
          v49[2] = CFSTR("Method");
          v35 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v50[2] = v35;
          v49[3] = NSDebugDescriptionErrorKey;
          v36 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 184);
          v50[3] = v36;
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 4));
          v38 = objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 10, v37);
          v8[2](v8, v38);

          goto LABEL_20;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
      if (v11)
        continue;
      break;
    }
  }

  v44.receiver = self;
  v44.super_class = (Class)_NFSecureElementReaderSession;
  v16 = -[_NFSession workQueue](&v44, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue(v16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100140EE4;
  block[3] = &unk_1002E6268;
  block[4] = self;
  v43 = a2;
  v42 = v8;
  v41 = v9;
  dispatch_async(v17, block);

LABEL_20:
}

- (void)startSecureElementReaderWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFSecureElementReaderSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001414B8;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)stopSecureElementReaderWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFSecureElementReaderSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100141C24;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)transceive:(id)a3 completion:(id)a4
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
  v17.super_class = (Class)_NFSecureElementReaderSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100142350;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)startVASPolling:(id)a3 completion:(id)a4
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
  v17.super_class = (Class)_NFSecureElementReaderSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100142A68;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)stopVASPolling:(id)a3
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
  v12.super_class = (Class)_NFSecureElementReaderSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100143850;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)performSelectVASWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFSecureElementReaderSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014403C;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)performVAS:(id)a3 select:(BOOL)a4 completion:(id)a5
{
  id v9;
  id v10;
  OS_dispatch_queue *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  SEL v18;
  BOOL v19;
  objc_super v20;

  v9 = a3;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_NFSecureElementReaderSession;
  v11 = -[_NFSession workQueue](&v20, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100144AF8;
  block[3] = &unk_1002E8410;
  v17 = v10;
  v18 = a2;
  block[4] = self;
  v16 = v9;
  v19 = a4;
  v13 = v9;
  v14 = v10;
  dispatch_async(v12, block);

}

- (void)connect:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  SEL v21;
  objc_super v22;
  _QWORD v23[4];
  _QWORD v24[4];

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___NFTag) & 1) != 0)
  {
    v22.receiver = self;
    v22.super_class = (Class)_NFSecureElementReaderSession;
    v9 = -[_NFSession workQueue](&v22, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100145AC4;
    block[3] = &unk_1002E5D50;
    block[4] = self;
    v21 = a2;
    v19 = v7;
    v20 = v8;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = objc_alloc((Class)NSError);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v23[0] = NSLocalizedDescriptionKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
    v24[0] = v13;
    v24[1] = &off_1002FFB10;
    v23[1] = CFSTR("Line");
    v23[2] = CFSTR("Method");
    v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v24[2] = v14;
    v23[3] = NSDebugDescriptionErrorKey;
    v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 500);
    v24[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 4));
    v17 = objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 10, v16);
    (*((void (**)(id, id))v8 + 2))(v8, v17);

  }
}

- (void)disconnectWithCardRemoval:(BOOL)a3 completion:(id)a4
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
  v15.super_class = (Class)_NFSecureElementReaderSession;
  v8 = -[_NFSession workQueue](&v15, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100146150;
  v11[3] = &unk_1002E7E90;
  v12 = v7;
  v13 = a2;
  v11[4] = self;
  v14 = a3;
  v10 = v7;
  dispatch_async(v9, v11);

}

- (id)_disconnectWithCardRemoval:(BOOL)a3
{
  NFTagInternal *currentTag;
  unsigned int v6;
  NFTagInternal *v7;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *specific;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  id v29;
  id v30;
  const char *Name;
  NSErrorUserInfoKey v33;
  void *v34;
  NSErrorUserInfoKey v35;
  void *v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;

  currentTag = self->_currentTag;
  if (!currentTag)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v23 = 45;
      if (isMetaClass)
        v23 = 43;
      v19(3, "%c[%{public}s %{public}s]:%i Invalid tag state", v23, ClassName, Name, 555);
    }
    v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v25 = NFSharedLogGetLogger(v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = object_getClass(self);
      if (class_isMetaClass(v27))
        v28 = 43;
      else
        v28 = 45;
      *(_DWORD *)buf = 67109890;
      v38 = v28;
      v39 = 2082;
      v40 = object_getClassName(self);
      v41 = 2082;
      v42 = sel_getName(a2);
      v43 = 1024;
      v44 = 555;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid tag state", buf, 0x22u);
    }

    v29 = objc_alloc((Class)NSError);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v35 = NSLocalizedDescriptionKey;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v36 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
    v14 = v29;
    v15 = v9;
    v16 = 12;
    goto LABEL_17;
  }
  v6 = sub_10017EF78(self->_driverWrapper, currentTag, a3);
  v7 = self->_currentTag;
  self->_currentTag = 0;

  if (v6)
  {
    v8 = objc_alloc((Class)NSError);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v10 = v6;
    v33 = NSLocalizedDescriptionKey;
    if (v6 >= 0x47)
      v11 = 71;
    else
      v11 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E8DA8[v11]));
    v34 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    v14 = v8;
    v15 = v9;
    v16 = v10;
LABEL_17:
    v30 = objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, v16, v13);

    return v30;
  }
  return 0;
}

- (void)_cleanupVAS
{
  id v4;
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
  uint64_t v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  void *v34;
  unsigned __int8 v35;
  void *v36;
  uint64_t v37;
  void (*v38)(uint64_t, const char *, ...);
  objc_class *v39;
  _BOOL4 v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  objc_class *v46;
  int v47;
  const char *v48;
  const char *v49;
  void *v50;
  uint64_t v51;
  void (*v52)(uint64_t, const char *, ...);
  objc_class *v53;
  _BOOL4 v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  objc_class *v60;
  int v61;
  const char *v62;
  const char *v63;
  void *v64;
  void *v65;
  id v66;
  const char *Name;
  const char *v68;
  const char *v69;
  const char *v70;
  uint8_t buf[4];
  int v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  int v78;

  if (self->_currentTag)
    v4 = -[_NFSecureElementReaderSession _disconnectWithCardRemoval:](self, "_disconnectWithCardRemoval:", 0);
  if (self->_vasECP)
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
      v7(6, "%c[%{public}s %{public}s]:%i Stopping routing", v11, ClassName, Name, 578);
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
      v72 = v16;
      v73 = 2082;
      v74 = object_getClassName(self);
      v75 = 2082;
      v76 = sel_getName(a2);
      v77 = 1024;
      v78 = 578;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Stopping routing", buf, 0x22u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOffWithFD:](NFRoutingConfig, "routingOffWithFD:", 0));
    v19 = objc_msgSend(v17, "setRoutingConfig:", v18);

    v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v21 = NFLogGetLogger(v20);
    if (v21)
    {
      v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(self);
      v24 = class_isMetaClass(v23);
      v25 = object_getClassName(self);
      v68 = sel_getName(a2);
      v26 = 45;
      if (v24)
        v26 = 43;
      v22(6, "%c[%{public}s %{public}s]:%i Resetting ECP", v26, v25, v68, 583);
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
      *(_DWORD *)buf = 67109890;
      v72 = v31;
      v73 = 2082;
      v74 = v32;
      v75 = 2082;
      v76 = v33;
      v77 = 1024;
      v78 = 583;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Resetting ECP", buf, 0x22u);
    }

    self->_vasECP = 0;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v35 = objc_msgSend(v34, "configureECPPolling:", 0);

    if ((v35 & 1) == 0)
    {
      v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v37 = NFLogGetLogger(v36);
      if (v37)
      {
        v38 = (void (*)(uint64_t, const char *, ...))v37;
        v39 = object_getClass(self);
        v40 = class_isMetaClass(v39);
        v41 = object_getClassName(self);
        v69 = sel_getName(a2);
        v42 = 45;
        if (v40)
          v42 = 43;
        v38(3, "%c[%{public}s %{public}s]:%i Failed to restore ECP", v42, v41, v69, 587);
      }
      v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v44 = NFSharedLogGetLogger(v43);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = object_getClass(self);
        if (class_isMetaClass(v46))
          v47 = 43;
        else
          v47 = 45;
        v48 = object_getClassName(self);
        v49 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v72 = v47;
        v73 = 2082;
        v74 = v48;
        v75 = 2082;
        v76 = v49;
        v77 = 1024;
        v78 = 587;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to restore ECP", buf, 0x22u);
      }

    }
    v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v51 = NFLogGetLogger(v50);
    if (v51)
    {
      v52 = (void (*)(uint64_t, const char *, ...))v51;
      v53 = object_getClass(self);
      v54 = class_isMetaClass(v53);
      v55 = object_getClassName(self);
      v70 = sel_getName(a2);
      v56 = 45;
      if (v54)
        v56 = 43;
      v52(6, "%c[%{public}s %{public}s]:%i Restoring initial session routing", v56, v55, v70, 590);
    }
    v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v58 = NFSharedLogGetLogger(v57);
    v59 = objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      v60 = object_getClass(self);
      if (class_isMetaClass(v60))
        v61 = 43;
      else
        v61 = 45;
      v62 = object_getClassName(self);
      v63 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v72 = v61;
      v73 = 2082;
      v74 = v62;
      v75 = 2082;
      v76 = v63;
      v77 = 1024;
      v78 = 590;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Restoring initial session routing", buf, 0x22u);
    }

    v64 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementReaderSession initialRoutingConfig](self, "initialRoutingConfig"));
    v66 = objc_msgSend(v64, "setRoutingConfig:", v65);

  }
}

- (void)secureElementReaderStarted:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v5, "didStartSecureElementReader:", v4);

}

- (void)secureElementReaderStopped:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v4);

  if (self->_tooHot)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002FFB28, CFSTR("tooHot"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v5, "didEndSecureElementReader:", v6);

}

- (void)handleSecureElementTransactionData:(id)a3 appletIdentifier:(id)a4
{
  id v7;
  NFSecureElementWrapper *embeddedSecureElementWrapper;
  id v9;
  void *v10;
  id v11;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v15;
  const char *ClassName;
  const char *Name;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  uint64_t *v44;
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  int v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  void *v61;

  v41 = a3;
  v7 = a4;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = sub_100147454;
  v50 = sub_100147464;
  v51 = 0;
  embeddedSecureElementWrapper = self->_embeddedSecureElementWrapper;
  v45 = 0;
  v9 = sub_10022EE68(embeddedSecureElementWrapper, &v45);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v45;

  if (v10)
  {
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
      Logger(3, "%c[%{public}s %{public}s]:%i Failed to validate applets", v15, ClassName, Name, 618);
    }
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFSharedLogGetLogger(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = object_getClass(self);
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      v23 = object_getClassName(self);
      v24 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v53 = v22;
      v54 = 2082;
      v55 = v23;
      v56 = 2082;
      v57 = v24;
      v58 = 1024;
      v59 = 618;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to validate applets", buf, 0x22u);
    }

  }
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10014746C;
  v42[3] = &unk_1002E9018;
  v25 = v7;
  v43 = v25;
  v44 = &v46;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v42);
  if (v47[5])
  {
    v26 = objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    -[NSObject receivedSecureElementReaderData:forApplet:](v26, "receivedSecureElementReaderData:forApplet:", v41, v47[5]);
  }
  else
  {
    v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v27);
    if (v28)
    {
      v29 = object_getClass(self);
      if (class_isMetaClass(v29))
        v30 = 43;
      else
        v30 = 45;
      v31 = object_getClassName(self);
      v32 = sel_getName(a2);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "NF_asHexString"));
      v28(3, "%c[%{public}s %{public}s]:%i Failed to find applet %{public}@", v30, v31, v32, 631, v33);

    }
    v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v35 = NFSharedLogGetLogger(v34);
    v26 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v36 = object_getClass(self);
      if (class_isMetaClass(v36))
        v37 = 43;
      else
        v37 = 45;
      v38 = object_getClassName(self);
      v39 = sel_getName(a2);
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "NF_asHexString"));
      *(_DWORD *)buf = 67110146;
      v53 = v37;
      v54 = 2082;
      v55 = v38;
      v56 = 2082;
      v57 = v39;
      v58 = 1024;
      v59 = 631;
      v60 = 2114;
      v61 = v40;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to find applet %{public}@", buf, 0x2Cu);

    }
  }

  _Block_object_dispose(&v46, 8);
}

- (void)handleRemoteTagsDetected:(id)a3
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
  void *v20;
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
  id v32;

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
    v8(6, "%c[%{public}s %{public}s]:%i tags: %{public}@", v11, ClassName, Name, 638, v5);
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
    v30 = 638;
    v31 = 2114;
    v32 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i tags: %{public}@", buf, 0x2Cu);
  }

  v18 = NFSharedSignpostLog(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_NFSecureElementReaderSession+detect_tags", ", buf, 2u);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v20, "didDetectTags:", v5);

}

- (NFDriverWrapper)driverWrapper
{
  return (NFDriverWrapper *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDriverWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NFSystemPowerConsumptionMonitor)powerConsumptionReporter
{
  return (NFSystemPowerConsumptionMonitor *)objc_loadWeakRetained((id *)&self->_powerConsumptionReporter);
}

- (void)setPowerConsumptionReporter:(id)a3
{
  objc_storeWeak((id *)&self->_powerConsumptionReporter, a3);
}

- (NFSecureElementWrapper)embeddedSecureElementWrapper
{
  return self->_embeddedSecureElementWrapper;
}

- (void)setEmbeddedSecureElementWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_embeddedSecureElementWrapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedSecureElementWrapper, 0);
  objc_destroyWeak((id *)&self->_powerConsumptionReporter);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_vasReader, 0);
  objc_storeStrong((id *)&self->_currentTag, 0);
  objc_storeStrong((id *)&self->_applets, 0);
}

@end
