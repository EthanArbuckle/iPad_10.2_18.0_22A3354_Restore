@implementation _NFTagSession

+ (id)validateEntitlements:(id)a3
{
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
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  const char *Name;
  _QWORD v26[4];
  _QWORD v27[4];
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;

  if ((objc_msgSend(a3, "readerInternalAccess") & 1) != 0)
    return 0;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(a1);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(a1);
    Name = sel_getName(a2);
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring internal reader access", v12, ClassName, Name, 30);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = object_getClass(a1);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    *(_DWORD *)buf = 67109890;
    v29 = v17;
    v30 = 2082;
    v31 = object_getClassName(a1);
    v32 = 2082;
    v33 = sel_getName(a2);
    v34 = 1024;
    v35 = 30;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring internal reader access", buf, 0x22u);
  }

  v18 = objc_alloc((Class)NSError);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v26[0] = NSLocalizedDescriptionKey;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
  v27[0] = v20;
  v27[1] = &off_1002FEDA8;
  v26[1] = CFSTR("Line");
  v26[2] = CFSTR("Method");
  v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v27[2] = v21;
  v26[3] = NSDebugDescriptionErrorKey;
  v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 31);
  v27[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 4));
  v24 = objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 32, v23);

  return v24;
}

- (_NFTagSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6
{
  _NFTagSession *v6;
  NFNdefTagAgent *v7;
  NFNdefTagAgent *tagAgent;
  NFNdefTagAgent *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_NFTagSession;
  v6 = -[_NFXPCSession initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:](&v11, "initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:", a3, a4, a5, a6);
  if (v6)
  {
    v7 = objc_alloc_init(NFNdefTagAgent);
    tagAgent = v6->_tagAgent;
    v6->_tagAgent = v7;

    v9 = v6->_tagAgent;
    if (v9)
      v9->_delegate = (NFNdefTagAgentDelegate *)v6;
  }
  return v6;
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
  const char *Name;
  objc_super v17;
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
    v6(6, "%c[%{public}s %{public}s]:%i Terminating session, flagging reads as interrupted.", v10, ClassName, Name, 53);
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
    v25 = 53;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Terminating session, flagging reads as interrupted.", buf, 0x22u);
  }

  v17.receiver = self;
  v17.super_class = (Class)_NFTagSession;
  -[_NFSession cleanup](&v17, "cleanup");
}

- (BOOL)willStartSession
{
  objc_super v4;

  sub_10023B69C((uint64_t)NFSecureElementWrapper);
  v4.receiver = self;
  v4.super_class = (Class)_NFTagSession;
  return -[_NFSession willStartSession](&v4, "willStartSession");
}

- (void)endSession:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NFTagSession;
  -[_NFXPCSession endSession:](&v3, "endSession:", a3);
}

- (void)prioritizeSessionWithCompletion:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NFTagSession;
  -[_NFXPCSession prioritizeSessionWithCompletion:](&v3, "prioritizeSessionWithCompletion:", a3);
}

- (void)didStartSession:(id)a3
{
  id v5;
  void *v6;
  NFHceTagReadCALogger *v7;
  NFHceTagReadCALogger *tagReadCALogger;
  void *v9;
  NSData *v10;
  void *v11;
  OS_dispatch_queue *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15[2];
  objc_super v16;
  id location;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_NFTagSession;
  -[_NFSession didStartSession:](&v18, "didStartSession:", v5);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v6, "didStartSession:", v5);

  }
  else
  {
    v7 = objc_alloc_init(NFHceTagReadCALogger);
    tagReadCALogger = self->_tagReadCALogger;
    self->_tagReadCALogger = v7;

    sub_10001D878((uint64_t)self->_tagReadCALogger);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v9, "didStartSession:", 0);

    v10 = sub_1000AA15C((id *)&self->_tagAgent->super.isa);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    if (v11)
    {
      objc_initWeak(&location, self);
      v16.receiver = self;
      v16.super_class = (Class)_NFTagSession;
      v12 = -[_NFSession workQueue](&v16, "workQueue");
      v13 = objc_claimAutoreleasedReturnValue(v12);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000D6F24;
      v14[3] = &unk_1002E5E80;
      objc_copyWeak(v15, &location);
      v14[4] = self;
      v15[1] = (id)a2;
      dispatch_async(v13, v14);

      objc_destroyWeak(v15);
      objc_destroyWeak(&location);
    }
  }

}

- (void)didEndSession:(id)a3
{
  id v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  void *v20;
  NFHceTagReadCALogger *tagReadCALogger;
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
  void *v32;

  v5 = a3;
  if (!-[_NFSession didEnd](self, "didEnd"))
  {
    Logger = NFLogGetLogger(2);
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v7(6, "%c[%{public}s %{public}s]:%i NFC emulation mode terminated: %@", v13, ClassName, Name, 109, v12);

    }
    v14 = NFSharedLogGetLogger(2);
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
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      *(_DWORD *)buf = 67110146;
      v24 = v17;
      v25 = 2082;
      v26 = v18;
      v27 = 2082;
      v28 = v19;
      v29 = 1024;
      v30 = 109;
      v31 = 2112;
      v32 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC emulation mode terminated: %@", buf, 0x2Cu);

    }
    sub_10001D5C4((uint64_t)self->_tagReadCALogger);
    sub_10001D8D4((uint64_t)self->_tagReadCALogger);
    tagReadCALogger = self->_tagReadCALogger;
    self->_tagReadCALogger = 0;

  }
  v22.receiver = self;
  v22.super_class = (Class)_NFTagSession;
  -[_NFSession didEndSession:](&v22, "didEndSession:", v5);

}

- (void)handleHostCardReaderDetected:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = kdebug_trace(724566200, 0, 0, 0, 0);
  v6 = NFSharedSignpostLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_READ_START", ", v8, 2u);
  }

  sub_10001D4E0((uint64_t)self->_tagReadCALogger);
  -[_NFTagSession _handleOneAPDU:](self, "_handleOneAPDU:", v4);

}

- (void)handleNdefTagRead
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NFNdefTagAgent *tagAgent;
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
  const char *v20;
  const char *v21;
  void *v22;
  const char *Name;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;

  v4 = kdebug_trace(724566204, 0, 0, 0, 0);
  v5 = NFSharedSignpostLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_READ_END", ", buf, 2u);
  }

  tagAgent = self->_tagAgent;
  if (tagAgent && tagAgent->_tagRead)
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
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v10(6, "%c[%{public}s %{public}s]:%i Tag is read", v14, ClassName, Name, 134);
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
      *(_DWORD *)buf = 67109890;
      v25 = v19;
      v26 = 2082;
      v27 = v20;
      v28 = 2082;
      v29 = v21;
      v30 = 1024;
      v31 = 134;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag is read", buf, 0x22u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v22, "didTagStateChange:", 2);

  }
}

- (unsigned)_hceComplete
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NFNdefTagAgent *tagAgent;
  void *v8;
  uint64_t v9;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *v11;
  _BOOL4 v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  void *v22;
  unsigned int v23;
  void *specific;
  uint64_t Logger;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  void *v38;
  void *v39;
  const char *v41;
  const char *Name;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;

  v4 = kdebug_trace(724566208, 0, 0, 0, 0);
  v5 = NFSharedSignpostLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_HCE_COMPLETE", ", buf, 2u);
  }

  tagAgent = self->_tagAgent;
  if (!tagAgent)
    return 0;
  if (!tagAgent->_tagWritten)
  {
    v23 = 0;
LABEL_17:
    if ((__int16)tagAgent->_lastStatus == -28672)
      goto LABEL_34;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v26 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v30 = 45;
      if (isMetaClass)
        v30 = 43;
      v26(6, "%c[%{public}s %{public}s]:%i Tag had error", v30, ClassName, Name, 152);
    }
    v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v32 = NFSharedLogGetLogger(v31);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = object_getClass(self);
      if (class_isMetaClass(v34))
        v35 = 43;
      else
        v35 = 45;
      v36 = object_getClassName(self);
      v37 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v44 = v35;
      v45 = 2082;
      v46 = v36;
      v47 = 2082;
      v48 = v37;
      v49 = 1024;
      v50 = 152;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag had error", buf, 0x22u);
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    v23 = 5;
    objc_msgSend(v38, "didTagStateChange:", 5);

    tagAgent = self->_tagAgent;
    if (tagAgent)
    {
LABEL_34:
      if (tagAgent->_isSelected)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
        v23 = 4;
        objc_msgSend(v39, "didTagStateChange:", 4);

      }
    }
    return v23;
  }
  v8 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v9 = NFLogGetLogger(v8);
  if (v9)
  {
    v10 = (void (*)(uint64_t, const char *, ...))v9;
    v11 = object_getClass(self);
    v12 = class_isMetaClass(v11);
    v13 = object_getClassName(self);
    v41 = sel_getName(a2);
    v14 = 45;
    if (v12)
      v14 = 43;
    v10(6, "%c[%{public}s %{public}s]:%i Tag was written", v14, v13, v41, 146);
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
    *(_DWORD *)buf = 67109890;
    v44 = v19;
    v45 = 2082;
    v46 = v20;
    v47 = 2082;
    v48 = v21;
    v49 = 1024;
    v50 = 146;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag was written", buf, 0x22u);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  v23 = 3;
  objc_msgSend(v22, "didTagStateChange:", 3);

  tagAgent = self->_tagAgent;
  if (tagAgent)
    goto LABEL_17;
  return v23;
}

- (void)_printHceCurrentState
{
  NFNdefTagAgent *tagAgent;
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
  uint64_t v18;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *v20;
  _BOOL4 v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
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
  const char *Name;
  const char *v46;
  const char *v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;

  tagAgent = self->_tagAgent;
  if (tagAgent)
  {
    if (!tagAgent->_tagWritten)
      goto LABEL_37;
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
      v7(6, "%c[%{public}s %{public}s]:%i Tag is written", v11, ClassName, Name, 168);
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
      v49 = v16;
      v50 = 2082;
      v51 = object_getClassName(self);
      v52 = 2082;
      v53 = sel_getName(a2);
      v54 = 1024;
      v55 = 168;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag is written", buf, 0x22u);
    }

    tagAgent = self->_tagAgent;
    if (tagAgent)
    {
LABEL_37:
      if (!tagAgent->_tagRead)
        goto LABEL_24;
      v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v18 = NFLogGetLogger(v17);
      if (v18)
      {
        v19 = (void (*)(uint64_t, const char *, ...))v18;
        v20 = object_getClass(self);
        v21 = class_isMetaClass(v20);
        v22 = object_getClassName(self);
        v46 = sel_getName(a2);
        v23 = 45;
        if (v21)
          v23 = 43;
        v19(6, "%c[%{public}s %{public}s]:%i Tag is read", v23, v22, v46, 176);
      }
      v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v25 = NFSharedLogGetLogger(v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = object_getClass(self);
        if (class_isMetaClass(v27))
          v28 = 43;
        else
          v28 = 45;
        v29 = object_getClassName(self);
        v30 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v49 = v28;
        v50 = 2082;
        v51 = v29;
        v52 = 2082;
        v53 = v30;
        v54 = 1024;
        v55 = 176;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag is read", buf, 0x22u);
      }

      tagAgent = self->_tagAgent;
      if (tagAgent)
      {
LABEL_24:
        if ((__int16)tagAgent->_lastStatus != -28672)
        {
          v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v32 = NFLogGetLogger(v31);
          if (v32)
          {
            v33 = (void (*)(uint64_t, const char *, ...))v32;
            v34 = object_getClass(self);
            v35 = class_isMetaClass(v34);
            v36 = object_getClassName(self);
            v47 = sel_getName(a2);
            v37 = 45;
            if (v35)
              v37 = 43;
            v33(6, "%c[%{public}s %{public}s]:%i Tag error", v37, v36, v47, 180);
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
            *(_DWORD *)buf = 67109890;
            v49 = v42;
            v50 = 2082;
            v51 = v43;
            v52 = 2082;
            v53 = v44;
            v54 = 1024;
            v55 = 180;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag error", buf, 0x22u);
          }

        }
      }
    }
  }
}

- (void)_handleOneAPDU:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v11;
  const char *ClassName;
  const char *Name;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  void *v43;
  void (*v44)(uint64_t, const char *, ...);
  objc_class *v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  objc_class *v53;
  int v54;
  const char *v55;
  const char *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  NFHceTagReadCALogger *tagReadCALogger;
  unsigned int v62;
  NFHceTagReadCALogger *v63;
  NFHceTagReadCALogger *v64;
  void *v65;
  unsigned int v66;
  OS_dispatch_queue *v67;
  NSObject *v68;
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
  void *v82;
  _BOOL4 v83;
  void *v84;
  uint64_t v85;
  void (*v86)(uint64_t, const char *, ...);
  objc_class *v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  void *v91;
  uint64_t v92;
  NSObject *v93;
  objc_class *v94;
  int v95;
  const char *v96;
  const char *v97;
  const char *v98;
  objc_class *v99;
  uint64_t v100;
  const char *v101;
  const char *v102;
  void *v103;
  uint64_t v104;
  objc_class *v105;
  int v106;
  const char *v107;
  const char *v108;
  void *v109;
  void (*v110)(uint64_t, const char *, ...);
  objc_class *v111;
  uint64_t v112;
  const char *v113;
  const char *v114;
  void *v115;
  uint64_t v116;
  NSObject *v117;
  objc_class *v118;
  int v119;
  const char *v120;
  const char *v121;
  void *v122;
  uint64_t v123;
  int v124;
  NSObject *v125;
  NSObject *v126;
  void *v128;
  _QWORD block[4];
  id v130;
  id v131;
  objc_super v132;
  id v133;
  id buf;
  __int16 v135;
  const char *v136;
  __int16 v137;
  const char *v138;
  __int16 v139;
  int v140;
  __int16 v141;
  _BYTE v142[10];
  __int16 v143;
  unsigned int v144;
  __int16 v145;
  unsigned int v146;
  __int16 v147;
  unsigned int v148;
  __int16 v149;
  unsigned int v150;

  v4 = a3;
  v128 = v4;
  if (-[_NFSession didEnd](self, "didEnd"))
  {
    v5 = kdebug_trace(724566204, 0, 0, 0, 0);
    v6 = NFSharedSignpostLog(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_signpost_enabled(v7))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_READ_END", ", (uint8_t *)&buf, 2u);
    }

    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class))
        v11 = 43;
      else
        v11 = 45;
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i Session terminated while reading. Exiting.", v11, ClassName, Name, 195);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = v16;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      v20 = object_getClassName(self);
      v21 = sel_getName(a2);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v19;
      v135 = 2082;
      v136 = v20;
      v137 = 2082;
      v138 = v21;
      v139 = 1024;
      v140 = 195;
      v17 = v16;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session terminated while reading. Exiting.", (uint8_t *)&buf, 0x22u);
    }
    goto LABEL_83;
  }
  v133 = 0;
  v126 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readApduAndReturnError:", &v133));
  v22 = v133;
  if (!v126)
  {
    v17 = v22;
    if (-[NSObject code](v22, "code") == (id)62)
    {
      v69 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v70 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v69);
      if (v70)
      {
        v71 = object_getClass(self);
        if (class_isMetaClass(v71))
          v72 = 43;
        else
          v72 = 45;
        v73 = object_getClassName(self);
        v74 = sel_getName(a2);
        v70(6, "%c[%{public}s %{public}s]:%i Tag halted", v72, v73, v74, 202);
      }
      v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v76 = NFSharedLogGetLogger(v75);
      v77 = objc_claimAutoreleasedReturnValue(v76);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        v78 = object_getClass(self);
        if (class_isMetaClass(v78))
          v79 = 43;
        else
          v79 = 45;
        v80 = object_getClassName(self);
        v81 = sel_getName(a2);
        LODWORD(buf) = 67109890;
        HIDWORD(buf) = v79;
        v135 = 2082;
        v136 = v80;
        v137 = 2082;
        v138 = v81;
        v139 = 1024;
        v140 = 202;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag halted", (uint8_t *)&buf, 0x22u);
      }

      v82 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
      objc_msgSend(v82, "didTagStateChange:", 6);

      goto LABEL_82;
    }
    v83 = -[NSObject code](v17, "code") == (id)28;
    v84 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v85 = NFLogGetLogger(v84);
    v86 = (void (*)(uint64_t, const char *, ...))v85;
    if (v83)
    {
      if (v85)
      {
        v87 = object_getClass(self);
        if (class_isMetaClass(v87))
          v88 = 43;
        else
          v88 = 45;
        v89 = object_getClassName(self);
        v90 = sel_getName(a2);
        v86(6, "%c[%{public}s %{public}s]:%i Connection lost", v88, v89, v90, 206);
      }
      v91 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v92 = NFSharedLogGetLogger(v91);
      v93 = objc_claimAutoreleasedReturnValue(v92);
      if (!os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        goto LABEL_81;
      v94 = object_getClass(self);
      if (class_isMetaClass(v94))
        v95 = 43;
      else
        v95 = 45;
      v96 = object_getClassName(self);
      v97 = sel_getName(a2);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v95;
      v135 = 2082;
      v136 = v96;
      v137 = 2082;
      v138 = v97;
      v139 = 1024;
      v140 = 206;
      v98 = "%c[%{public}s %{public}s]:%i Connection lost";
    }
    else
    {
      if (v85)
      {
        v99 = object_getClass(self);
        if (class_isMetaClass(v99))
          v100 = 43;
        else
          v100 = 45;
        v101 = object_getClassName(self);
        v102 = sel_getName(a2);
        v86(6, "%c[%{public}s %{public}s]:%i Failed to read from remote device, stopping", v100, v101, v102, 208);
      }
      v103 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v104 = NFSharedLogGetLogger(v103);
      v93 = objc_claimAutoreleasedReturnValue(v104);
      if (!os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        goto LABEL_81;
      v105 = object_getClass(self);
      if (class_isMetaClass(v105))
        v106 = 43;
      else
        v106 = 45;
      v107 = object_getClassName(self);
      v108 = sel_getName(a2);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v106;
      v135 = 2082;
      v136 = v107;
      v137 = 2082;
      v138 = v108;
      v139 = 1024;
      v140 = 208;
      v98 = "%c[%{public}s %{public}s]:%i Failed to read from remote device, stopping";
    }
    _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, v98, (uint8_t *)&buf, 0x22u);
LABEL_81:

    -[_NFTagSession _hceComplete](self, "_hceComplete");
LABEL_82:
    -[NFNdefTagAgent handleDeselect](self->_tagAgent, "handleDeselect");
    goto LABEL_83;
  }
  v125 = v22;
  v23 = objc_msgSend(objc_alloc((Class)NFCommandAPDU), "initWithData:", v126);
  v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v24);
  if (v25)
  {
    v26 = object_getClass(self);
    if (class_isMetaClass(v26))
      v27 = 43;
    else
      v27 = 45;
    v123 = v27;
    v28 = object_getClassName(self);
    v29 = sel_getName(a2);
    v25(6, "%c[%{public}s %{public}s]:%i class = %02x ins = %02x  p1 = %d p2 = %d, lc = %u, le = %u", v123, v28, v29, 219, objc_msgSend(v23, "clss"), objc_msgSend(v23, "instruction"), objc_msgSend(v23, "p1"), objc_msgSend(v23, "p2"), objc_msgSend(v23, "payloadLength"), objc_msgSend(v23, "lengthExpected"));
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
    v124 = v34;
    v35 = object_getClassName(self);
    v36 = sel_getName(a2);
    v37 = objc_msgSend(v23, "clss");
    v38 = objc_msgSend(v23, "instruction");
    v39 = objc_msgSend(v23, "p1");
    v40 = objc_msgSend(v23, "p2");
    v41 = objc_msgSend(v23, "payloadLength");
    v42 = objc_msgSend(v23, "lengthExpected");
    LODWORD(buf) = 67111426;
    HIDWORD(buf) = v124;
    v135 = 2082;
    v136 = v35;
    v137 = 2082;
    v138 = v36;
    v139 = 1024;
    v140 = 219;
    v141 = 1024;
    *(_DWORD *)v142 = v37;
    *(_WORD *)&v142[4] = 1024;
    *(_DWORD *)&v142[6] = v38;
    v143 = 1024;
    v144 = v39;
    v145 = 1024;
    v146 = v40;
    v147 = 1024;
    v148 = v41;
    v149 = 1024;
    v150 = v42;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i class = %02x ins = %02x  p1 = %d p2 = %d, lc = %u, le = %u", (uint8_t *)&buf, 0x46u);
  }

  v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v44 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v43);
  if (v44)
  {
    v45 = object_getClass(self);
    if (class_isMetaClass(v45))
      v46 = 43;
    else
      v46 = 45;
    v47 = object_getClassName(self);
    v48 = sel_getName(a2);
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "payload"));
    v44(6, "%c[%{public}s %{public}s]:%i payload: %{public}@", v46, v47, v48, 220, v49);

  }
  v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v51 = NFSharedLogGetLogger(v50);
  v52 = objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    v53 = object_getClass(self);
    if (class_isMetaClass(v53))
      v54 = 43;
    else
      v54 = 45;
    v55 = object_getClassName(self);
    v56 = sel_getName(a2);
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "payload"));
    LODWORD(buf) = 67110146;
    HIDWORD(buf) = v54;
    v135 = 2082;
    v136 = v55;
    v137 = 2082;
    v138 = v56;
    v139 = 1024;
    v140 = 220;
    v141 = 2114;
    *(_QWORD *)v142 = v57;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i payload: %{public}@", (uint8_t *)&buf, 0x2Cu);

  }
  if (objc_msgSend(v23, "instruction") == 164 && objc_msgSend(v23, "p1") == 4)
  {
    -[NFNdefTagAgent handleDeselect](self->_tagAgent, "handleDeselect");
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[NFNdefTagAgent handleSelect:](self->_tagAgent, "handleSelect:", v23));
    if (v58)
    {
      v59 = 0;
    }
    else
    {
      v109 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v110 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v109);
      if (v110)
      {
        v111 = object_getClass(self);
        if (class_isMetaClass(v111))
          v112 = 43;
        else
          v112 = 45;
        v113 = object_getClassName(self);
        v114 = sel_getName(a2);
        v110(6, "%c[%{public}s %{public}s]:%i Failed to find suitable applet", v112, v113, v114, 226);
      }
      v115 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v116 = NFSharedLogGetLogger(v115);
      v117 = objc_claimAutoreleasedReturnValue(v116);
      if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
      {
        v118 = object_getClass(self);
        if (class_isMetaClass(v118))
          v119 = 43;
        else
          v119 = 45;
        v120 = object_getClassName(self);
        v121 = sel_getName(a2);
        LODWORD(buf) = 67109890;
        HIDWORD(buf) = v119;
        v135 = 2082;
        v136 = v120;
        v137 = 2082;
        v138 = v121;
        v139 = 1024;
        v140 = 226;
        _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed to find suitable applet", (uint8_t *)&buf, 0x22u);
      }

      LOWORD(buf) = -32150;
      v59 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &buf, 2);
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NFResponseAPDU responseWithData:](NFResponseAPDU, "responseWithData:", v59));
    }
    if (objc_msgSend(v58, "status") == 36864)
    {
      v122 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
      objc_msgSend(v122, "didTagStateChange:", 1);

    }
  }
  else
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[NFNdefTagAgent handleAPDU:](self->_tagAgent, "handleAPDU:", v23));
    -[_NFTagSession _printHceCurrentState](self, "_printHceCurrentState");
    v59 = 0;
  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "data"));
  objc_msgSend(v128, "sendAPDU:", v60);

  tagReadCALogger = self->_tagReadCALogger;
  v62 = -[NSObject length](v126, "length");
  if (tagReadCALogger)
    tagReadCALogger->_rawBytesTx += v62;
  v63 = self->_tagReadCALogger;
  if (v63)
  {
    ++v63->_rawCommandCount;
    v64 = self->_tagReadCALogger;
  }
  else
  {
    v64 = 0;
  }
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "data"));
  v66 = objc_msgSend(v65, "length");
  if (v64)
  {
    v64->_rawBytesRx += v66;
    v64->_wasRead = 1;
  }

  objc_initWeak(&buf, self);
  v132.receiver = self;
  v132.super_class = (Class)_NFTagSession;
  v67 = -[_NFSession workQueue](&v132, "workQueue");
  v68 = objc_claimAutoreleasedReturnValue(v67);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D8C44;
  block[3] = &unk_1002E7E68;
  objc_copyWeak(&v131, &buf);
  v130 = v128;
  dispatch_async(v68, block);

  objc_destroyWeak(&v131);
  objc_destroyWeak(&buf);

  v17 = v126;
LABEL_83:

}

- (void)setInitialPayload:(id)a3
{
  sub_1000A9E0C((uint64_t)self->_tagAgent, a3);
}

- (void)startEmulation:(id)a3 withMessageType:(unsigned int)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  OS_dispatch_queue *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  SEL v20;
  objc_super v21;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  v10 = kdebug_trace(724566220, 0, 0, 0, 0);
  v11 = NFSharedSignpostLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_START_EMULATION_XPC", ", buf, 2u);
  }

  v21.receiver = self;
  v21.super_class = (Class)_NFTagSession;
  v13 = -[_NFSession workQueue](&v21, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000D8DE4;
  v17[3] = &unk_1002E6268;
  v19 = v9;
  v20 = a2;
  v17[4] = self;
  v18 = v8;
  v15 = v8;
  v16 = v9;
  dispatch_async(v14, v17);

}

- (void)stopEmulationWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFTagSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D95D0;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)setTagContent:(id)a3 completion:(id)a4
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
  v17.super_class = (Class)_NFTagSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000D9C34;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)getTagContentWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFTagSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DA0FC;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)enableWrite:(BOOL)a3 completion:(id)a4
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
  v15.super_class = (Class)_NFTagSession;
  v8 = -[_NFSession workQueue](&v15, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000DA5E4;
  v11[3] = &unk_1002E7E90;
  v12 = v7;
  v13 = a2;
  v11[4] = self;
  v14 = a3;
  v10 = v7;
  dispatch_async(v9, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagReadCALogger, 0);
  objc_storeStrong((id *)&self->_tagAgent, 0);
}

@end
