@implementation _NFACReaderSession

- (_NFACReaderSession)initWithRemoteObject:(id)a3 workQueue:(id)a4
{
  _NFACReaderSession *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_NFACReaderSession;
  result = -[_NFACSession initWithRemoteObject:workQueue:](&v5, "initWithRemoteObject:workQueue:", a3, a4);
  if (result)
  {
    result->_tagDataRate = 0;
    result->_continuousWaveEnabled = 0;
  }
  return result;
}

- (BOOL)willStartSession
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
  objc_super v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 111);
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
    v20 = v15;
    v21 = 2082;
    v22 = object_getClassName(self);
    v23 = 2082;
    v24 = sel_getName(a2);
    v25 = 1024;
    v26 = 111;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v18.receiver = self;
  v18.super_class = (Class)_NFACReaderSession;
  return -[_NFACSession willStartSession](&v18, "willStartSession");
}

- (void)didStartSession:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
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
  void *v23;
  id v24;
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
  const char *v37;
  const char *v38;
  void *v39;
  const char *Name;
  const char *v41;
  objc_super v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;

  v5 = a3;
  v6 = NFSharedSignpostLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_READER_SESSION_START", ", buf, 2u);
  }

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
    v10(6, "%c[%{public}s %{public}s]:%i ", v14, ClassName, Name, 118);
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
    v50 = 118;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v42.receiver = self;
  v42.super_class = (Class)_NFACReaderSession;
  -[_NFACSession didStartSession:](&v42, "didStartSession:", v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession driverWrapper](self, "driverWrapper"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig none](NFRoutingConfig, "none"));
  v24 = objc_msgSend(v22, "setRouting:", v23);

  v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v26 = NFLogGetLogger(v25);
  if (v26)
  {
    v27 = (void (*)(uint64_t, const char *, ...))v26;
    v28 = object_getClass(self);
    v29 = class_isMetaClass(v28);
    v30 = object_getClassName(self);
    v41 = sel_getName(a2);
    v31 = 45;
    if (v29)
      v31 = 43;
    v27(6, "%c[%{public}s %{public}s]:%i Invoking didStartSessioncallback", v31, v30, v41, 123);
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
    v37 = object_getClassName(self);
    v38 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v44 = v36;
    v45 = 2082;
    v46 = v37;
    v47 = 2082;
    v48 = v38;
    v49 = 1024;
    v50 = 123;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invoking didStartSessioncallback", buf, 0x22u);
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession remoteObject](self, "remoteObject"));
  objc_msgSend(v39, "didStartSession:", v5);

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
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  const char *Name;
  objc_super v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;

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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 129);
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
    v30 = v15;
    v31 = 2082;
    v32 = object_getClassName(self);
    v33 = 2082;
    v34 = sel_getName(a2);
    v35 = 1024;
    v36 = 129;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v17 = NFSharedSignpostLog(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFACReaderSession", buf, 2u);
  }

  if (-[_NFACSession needsCleanup](self, "needsCleanup"))
  {
    -[NFTimer stopTimer](self->_maxRFTimer, "stopTimer");
    if (self->_continuousWaveEnabled)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession driverWrapper](self, "driverWrapper"));
      v20 = objc_msgSend(v19, "enableContinuousWave:withFrequencySweep:", 0, 0);

      self->_continuousWaveEnabled = 0;
    }
    sub_10019D694((uint64_t)self->_powerConsumptionReporter, self);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession driverWrapper](self, "driverWrapper"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig none](NFRoutingConfig, "none"));
    v23 = objc_msgSend(v21, "setRouting:", v22);

  }
  v28.receiver = self;
  v28.super_class = (Class)_NFACReaderSession;
  v24 = -[_NFACSession cleanup](&v28, "cleanup");
  v25 = NFSharedSignpostLog(v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFACReaderSession", buf, 2u);
  }

}

- (void)handleRemoteTagsDetected:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
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
  const char *v22;
  const char *v23;
  void *v24;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;

  v5 = a3;
  v6 = NFSharedSignpostLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_READER_TAGS_DETECTED", ", buf, 2u);
  }

  if (self->_scanning)
  {
    self->_scanning = 0;
    v9 = NFSharedSignpostLog(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "scanningForTags", ", buf, 2u);
    }

  }
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
    v13(6, "%c[%{public}s %{public}s]:%i %{public}@", v16, ClassName, Name, 161, v5);
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
    *(_DWORD *)buf = 67110146;
    v28 = v21;
    v29 = 2082;
    v30 = v22;
    v31 = 2082;
    v32 = v23;
    v33 = 1024;
    v34 = 161;
    v35 = 2114;
    v36 = v5;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession remoteObject](self, "remoteObject"));
  objc_msgSend(v24, "didDetectTags:", v5);

}

- (void)handleFieldChanged:(BOOL)a3
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
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 167);
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
    v25 = 167;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

}

- (id)transceive:(id)a3 response:(id *)a4 maxTimeout:(double)a5
{
  id v8;
  void *v9;
  NFTagInternal *curTag;
  void *v11;
  id v12;
  id v14;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession driverWrapper](self, "driverWrapper"));
  curTag = self->_curTag;
  v14 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transceive:tag:maxTimeout:error:", v8, curTag, &v14, a5));

  v12 = v14;
  *a4 = v11;

  return v12;
}

- (void)enableContinuousWave:(BOOL)a3 withFrequencySweep:(BOOL)a4 callback:(id)a5
{
  id v9;
  OS_dispatch_queue *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
  BOOL v16;
  BOOL v17;
  objc_super v18;

  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_NFACReaderSession;
  v10 = -[_NFACSession workQueue](&v18, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100064500;
  v13[3] = &unk_1002E6358;
  v14 = v9;
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v13[4] = self;
  v12 = v9;
  dispatch_async(v11, v13);

}

- (void)startPolling:(id)a3
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
  OS_dispatch_queue *v18;
  NSObject *v19;
  id v20;
  const char *Name;
  _QWORD block[5];
  id v23;
  objc_super v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

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
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 207);
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
    v26 = v17;
    v27 = 2082;
    v28 = object_getClassName(self);
    v29 = 2082;
    v30 = sel_getName(a2);
    v31 = 1024;
    v32 = 207;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v24.receiver = self;
  v24.super_class = (Class)_NFACReaderSession;
  v18 = -[_NFACSession workQueue](&v24, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064BB8;
  block[3] = &unk_1002E6380;
  block[4] = self;
  v23 = v5;
  v20 = v5;
  dispatch_async(v19, block);

}

- (void)startPollingForTechnology:(unsigned int)a3 lpcd:(BOOL)a4 callback:(id)a5
{
  uint64_t v6;
  id v9;
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  OS_dispatch_queue *v21;
  NSObject *v22;
  id v23;
  const char *ClassName;
  const char *Name;
  _QWORD block[5];
  id v27;
  int v28;
  BOOL v29;
  objc_super v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;

  v6 = *(_QWORD *)&a3;
  v9 = a5;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v15 = 45;
    if (isMetaClass)
      v15 = 43;
    v12(6, "%c[%{public}s %{public}s]:%i tech = 0x%04x", v15, ClassName, Name, 220, v6);
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
    *(_DWORD *)buf = 67110146;
    v32 = v20;
    v33 = 2082;
    v34 = object_getClassName(self);
    v35 = 2082;
    v36 = sel_getName(a2);
    v37 = 1024;
    v38 = 220;
    v39 = 1024;
    v40 = v6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i tech = 0x%04x", buf, 0x28u);
  }

  v30.receiver = self;
  v30.super_class = (Class)_NFACReaderSession;
  v21 = -[_NFACSession workQueue](&v30, "workQueue");
  v22 = objc_claimAutoreleasedReturnValue(v21);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064EE4;
  block[3] = &unk_1002E63A8;
  v29 = a4;
  v28 = v6;
  block[4] = self;
  v27 = v9;
  v23 = v9;
  dispatch_async(v22, block);

}

- (void)stopPolling:(id)a3
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
  OS_dispatch_queue *v18;
  NSObject *v19;
  id v20;
  const char *Name;
  _QWORD block[5];
  id v23;
  objc_super v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

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
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 247);
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
    v26 = v17;
    v27 = 2082;
    v28 = object_getClassName(self);
    v29 = 2082;
    v30 = sel_getName(a2);
    v31 = 1024;
    v32 = 247;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v24.receiver = self;
  v24.super_class = (Class)_NFACReaderSession;
  v18 = -[_NFACSession workQueue](&v24, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006528C;
  block[3] = &unk_1002E6380;
  block[4] = self;
  v23 = v5;
  v20 = v5;
  dispatch_async(v19, block);

}

- (void)restartPolling:(id)a3
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
  OS_dispatch_queue *v18;
  NSObject *v19;
  id v20;
  const char *Name;
  _QWORD block[5];
  id v23;
  objc_super v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

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
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 261);
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
    v26 = v17;
    v27 = 2082;
    v28 = object_getClassName(self);
    v29 = 2082;
    v30 = sel_getName(a2);
    v31 = 1024;
    v32 = 261;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v24.receiver = self;
  v24.super_class = (Class)_NFACReaderSession;
  v18 = -[_NFACSession workQueue](&v24, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100065590;
  block[3] = &unk_1002E6380;
  block[4] = self;
  v23 = v5;
  v20 = v5;
  dispatch_async(v19, block);

}

- (void)connectTag:(id)a3 callback:(id)a4
{
  id v7;
  id v8;
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
  OS_dispatch_queue *v20;
  NSObject *v21;
  id v22;
  id v23;
  const char *ClassName;
  const char *Name;
  _QWORD block[5];
  id v27;
  id v28;
  SEL v29;
  objc_super v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  id v40;

  v7 = a3;
  v8 = a4;
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
    v11(6, "%c[%{public}s %{public}s]:%i tag: %{public}@", v14, ClassName, Name, 277, v7);
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
    v32 = v19;
    v33 = 2082;
    v34 = object_getClassName(self);
    v35 = 2082;
    v36 = sel_getName(a2);
    v37 = 1024;
    v38 = 277;
    v39 = 2114;
    v40 = v7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i tag: %{public}@", buf, 0x2Cu);
  }

  v30.receiver = self;
  v30.super_class = (Class)_NFACReaderSession;
  v20 = -[_NFACSession workQueue](&v30, "workQueue");
  v21 = objc_claimAutoreleasedReturnValue(v20);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000658D4;
  block[3] = &unk_1002E5D50;
  block[4] = self;
  v27 = v7;
  v28 = v8;
  v29 = a2;
  v22 = v8;
  v23 = v7;
  dispatch_async(v21, block);

}

- (void)disconnectTag:(id)a3
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
  OS_dispatch_queue *v18;
  NSObject *v19;
  id v20;
  const char *Name;
  _QWORD block[5];
  id v23;
  objc_super v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

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
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 329);
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
    v26 = v17;
    v27 = 2082;
    v28 = object_getClassName(self);
    v29 = 2082;
    v30 = sel_getName(a2);
    v31 = 1024;
    v32 = 329;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v24.receiver = self;
  v24.super_class = (Class)_NFACReaderSession;
  v18 = -[_NFACSession workQueue](&v24, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000660D0;
  block[3] = &unk_1002E6380;
  block[4] = self;
  v23 = v5;
  v20 = v5;
  dispatch_async(v19, block);

}

- (void)checkPresence:(id)a3
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
  OS_dispatch_queue *v18;
  NSObject *v19;
  id v20;
  const char *Name;
  _QWORD block[5];
  id v23;
  SEL v24;
  objc_super v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;

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
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 370);
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
    v27 = v17;
    v28 = 2082;
    v29 = object_getClassName(self);
    v30 = 2082;
    v31 = sel_getName(a2);
    v32 = 1024;
    v33 = 370;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v25.receiver = self;
  v25.super_class = (Class)_NFACReaderSession;
  v18 = -[_NFACSession workQueue](&v25, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066670;
  block[3] = &unk_1002E5D28;
  block[4] = self;
  v23 = v5;
  v24 = a2;
  v20 = v5;
  dispatch_async(v19, block);

}

- (void)checkNdefSupport:(id)a3
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
  OS_dispatch_queue *v18;
  NSObject *v19;
  id v20;
  const char *Name;
  _QWORD block[5];
  id v23;
  objc_super v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

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
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 391);
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
    v26 = v17;
    v27 = 2082;
    v28 = object_getClassName(self);
    v29 = 2082;
    v30 = sel_getName(a2);
    v31 = 1024;
    v32 = 391;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v24.receiver = self;
  v24.super_class = (Class)_NFACReaderSession;
  v18 = -[_NFACSession workQueue](&v24, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066C4C;
  block[3] = &unk_1002E6380;
  block[4] = self;
  v23 = v5;
  v20 = v5;
  dispatch_async(v19, block);

}

- (void)readRawNdef:(id)a3
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
  OS_dispatch_queue *v18;
  NSObject *v19;
  id v20;
  const char *Name;
  _QWORD block[5];
  id v23;
  objc_super v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

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
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 404);
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
    v26 = v17;
    v27 = 2082;
    v28 = object_getClassName(self);
    v29 = 2082;
    v30 = sel_getName(a2);
    v31 = 1024;
    v32 = 404;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v24.receiver = self;
  v24.super_class = (Class)_NFACReaderSession;
  v18 = -[_NFACSession workQueue](&v24, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066F34;
  block[3] = &unk_1002E6380;
  block[4] = self;
  v23 = v5;
  v20 = v5;
  dispatch_async(v19, block);

}

- (void)transceive:(id)a3 callback:(id)a4
{
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
  OS_dispatch_queue *v21;
  NSObject *v22;
  id v23;
  id v24;
  const char *Name;
  _QWORD block[4];
  id v27;
  _NFACReaderSession *v28;
  id v29;
  SEL v30;
  objc_super v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;

  v7 = a3;
  v8 = a4;
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
    v11(6, "%c[%{public}s %{public}s]:%i ", v15, ClassName, Name, 428);
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
    *(_DWORD *)buf = 67109890;
    v33 = v20;
    v34 = 2082;
    v35 = object_getClassName(self);
    v36 = 2082;
    v37 = sel_getName(a2);
    v38 = 1024;
    v39 = 428;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v31.receiver = self;
  v31.super_class = (Class)_NFACReaderSession;
  v21 = -[_NFACSession workQueue](&v31, "workQueue");
  v22 = objc_claimAutoreleasedReturnValue(v21);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067378;
  block[3] = &unk_1002E5D50;
  v27 = v7;
  v28 = self;
  v29 = v8;
  v30 = a2;
  v23 = v8;
  v24 = v7;
  dispatch_async(v22, block);

}

- (double)_getMaxRFTimeLimitOverride
{
  double v4;
  void *v5;
  unsigned int v6;
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
  const char *Name;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  double v30;

  v4 = 0.0;
  if (NFPlatformShouldLimitAccessoryReaderTime())
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_NFACHardwareManager sharedHardwareManager](_NFACHardwareManager, "sharedHardwareManager"));
    v6 = objc_msgSend(v5, "isWalletAttached");

    if (v6)
      v4 = 10.0;
    else
      v4 = 3.0;
  }
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
    v9(6, "%c[%{public}s %{public}s]:%i %f", v13, ClassName, Name, 466, *(_QWORD *)&v4);
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
    *(_DWORD *)buf = 67110146;
    v22 = v18;
    v23 = 2082;
    v24 = object_getClassName(self);
    v25 = 2082;
    v26 = sel_getName(a2);
    v27 = 1024;
    v28 = 466;
    v29 = 2048;
    v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %f", buf, 0x2Cu);
  }

  return v4;
}

- (void)_transceiveTypeAAccessoryCommand:(id)a3 callback:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  NFTagInternal *curTag;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
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
  uint64_t v38;
  NSObject *v39;
  const char *Name;
  id v42;
  __int16 v43;
  int v44;
  char v45;
  __int16 v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  NSErrorUserInfoKey v59;
  void *v60;

  v6 = (void (**)(id, void *, _QWORD))a4;
  v7 = a3;
  v8 = NFSharedSignpostLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transceiveToTypeS", ", buf, 2u);
  }

  v45 = 0;
  v44 = 43520;
  v46 = bswap32(objc_msgSend(v7, "length")) >> 16;
  v10 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithBytes:length:", &v44, 7);
  objc_msgSend(v10, "appendData:", v7);

  v43 = 0;
  objc_msgSend(v10, "appendBytes:length:", &v43, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession driverWrapper](self, "driverWrapper"));
  curTag = self->_curTag;
  v42 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transceive:tag:maxTimeout:error:", v10, curTag, &v42, 2.0));
  v14 = v42;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NFResponseAPDU responseWithData:](NFResponseAPDU, "responseWithData:", v13));
  v16 = v15;
  if (v15 && objc_msgSend(v15, "status") == 36864)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "response"));
    v6[2](v6, v17, 0);

    v19 = v14;
  }
  else
  {
    v20 = objc_alloc((Class)NSError);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v59 = NSLocalizedDescriptionKey;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
    v60 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
    v19 = objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 16, v23);

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
      v26(3, "%c[%{public}s %{public}s]:%i Command failed: %{public}@   error:%{public}@", v30, ClassName, Name, 498, v10, v19);
    }
    v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v32 = NFSharedLogGetLogger(v31);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = object_getClass(self);
      if (class_isMetaClass(v34))
        v35 = 43;
      else
        v35 = 45;
      v36 = object_getClassName(self);
      v37 = sel_getName(a2);
      *(_DWORD *)buf = 67110402;
      v48 = v35;
      v49 = 2082;
      v50 = v36;
      v51 = 2082;
      v52 = v37;
      v53 = 1024;
      v54 = 498;
      v55 = 2114;
      v56 = v10;
      v57 = 2114;
      v58 = v19;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Command failed: %{public}@   error:%{public}@", buf, 0x36u);
    }

    v18 = ((uint64_t (*)(id, _QWORD, id))v6[2])(v6, 0, v19);
  }
  v38 = NFSharedSignpostLog(v18);
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToTypeS", ", buf, 2u);
  }

}

- (void)_transceiveNTAG5VAccessoryCommand:(id)a3 callback:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, id);
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
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *v32;
  id v33;
  void *v34;
  void (**v35)(id, _QWORD, id);
  _BOOL4 v36;
  id v37;
  const char *v38;
  const char *v39;
  void *v40;
  BOOL v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  objc_class *v46;
  id v47;
  void *v48;
  void (**v49)(id, _QWORD, id);
  int v50;
  const char *v51;
  const char *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  NSObject *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void (*v66)(uint64_t, const char *, ...);
  objc_class *v67;
  _BOOL4 v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  objc_class *v73;
  int v74;
  const char *v75;
  const char *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void (*v86)(uint64_t, const char *, ...);
  objc_class *v87;
  _BOOL4 v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  NSObject *v92;
  objc_class *v93;
  int v94;
  const char *v95;
  const char *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  const char *v107;
  const char *v108;
  const char *Name;
  const char *v110;
  const char *v111;
  const char *sel;
  NSObject *v113;
  NSObject *v114;
  id v115;
  NSErrorUserInfoKey v116;
  void *v117;
  NSErrorUserInfoKey v118;
  void *v119;
  NSErrorUserInfoKey v120;
  void *v121;
  uint8_t buf[4];
  int v123;
  __int16 v124;
  const char *v125;
  __int16 v126;
  const char *v127;
  __int16 v128;
  int v129;
  __int16 v130;
  void *v131;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, id))a4;
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
    v11(6, "%c[%{public}s %{public}s]:%i ", v15, ClassName, Name, 510);
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
    *(_DWORD *)buf = 67109890;
    v123 = v20;
    v124 = 2082;
    v125 = object_getClassName(self);
    v126 = 2082;
    v127 = sel_getName(a2);
    v128 = 1024;
    v129 = 510;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v22 = NFSharedSignpostLog(v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c", ", buf, 2u);
  }

  v24 = objc_msgSend(objc_alloc((Class)NFAccessoryTagI2CBridge), "initWithType:delegate:", 0, self);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NFTagInternal tagID](self->_curTag, "tagID"));
  objc_msgSend(v24, "setTagUUID:", v25);

  objc_msgSend(v24, "setSelected:", self->_tagSelected);
  if (self->_tagSelected)
    goto LABEL_13;
  v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "selectTag"));
  if (!v63)
  {
    self->_tagSelected = 1;
LABEL_13:
    v115 = 0;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "writeToBridge:fragmentationSupport:response:", v7, 1, &v115));
    v27 = v115;
    v28 = v27;
    if (v26)
    {
      sel = a2;
      v113 = v27;
      v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v30 = NFLogGetLogger(v29);
      if (v30)
      {
        v31 = (void (*)(uint64_t, const char *, ...))v30;
        v32 = object_getClass(self);
        v33 = v24;
        v34 = v26;
        v35 = v8;
        v36 = class_isMetaClass(v32);
        v37 = v7;
        v38 = object_getClassName(self);
        v39 = sel_getName(sel);
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject NF_asHexString](v113, "NF_asHexString"));
        v106 = v38;
        v41 = !v36;
        v8 = v35;
        v26 = v34;
        v24 = v33;
        v42 = 45;
        if (!v41)
          v42 = 43;
        v7 = v37;
        v31(3, "%c[%{public}s %{public}s]:%i Failed to write payload, status=0x%{public}@", v42, v106, v39, 534, v40);

      }
      v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v44 = NFSharedLogGetLogger(v43);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = object_getClass(self);
        v47 = v24;
        v48 = v26;
        v49 = v8;
        if (class_isMetaClass(v46))
          v50 = 43;
        else
          v50 = 45;
        v51 = object_getClassName(self);
        v52 = sel_getName(sel);
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject NF_asHexString](v113, "NF_asHexString"));
        *(_DWORD *)buf = 67110146;
        v123 = v50;
        v8 = v49;
        v26 = v48;
        v24 = v47;
        v124 = 2082;
        v125 = v51;
        v126 = 2082;
        v127 = v52;
        v128 = 1024;
        v129 = 534;
        v130 = 2114;
        v131 = v53;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to write payload, status=0x%{public}@", buf, 0x2Cu);

      }
      v54 = objc_alloc((Class)NSError);
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v118 = NSLocalizedDescriptionKey;
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
      v119 = v56;
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1));
      v58 = objc_msgSend(v54, "initWithDomain:code:userInfo:", v55, 29, v57);
      v8[2](v8, 0, v58);

      v60 = NFSharedSignpostLog(v59);
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_signpost_enabled(v61))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v61, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c", ", buf, 2u);
      }
      v62 = v113;
    }
    else
    {
      v114 = v27;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "readFromBridge:fragmentationSupport:response:", 0, 1, &v114));
      v62 = v114;

      if (v26)
      {
        v84 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v85 = NFLogGetLogger(v84);
        if (v85)
        {
          v86 = (void (*)(uint64_t, const char *, ...))v85;
          v87 = object_getClass(self);
          v88 = class_isMetaClass(v87);
          v108 = object_getClassName(self);
          v111 = sel_getName(a2);
          v89 = 45;
          if (v88)
            v89 = 43;
          v86(3, "%c[%{public}s %{public}s]:%i Failed to read payload, error=%{public}@", v89, v108, v111, 542, v26);
        }
        v90 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v91 = NFSharedLogGetLogger(v90);
        v92 = objc_claimAutoreleasedReturnValue(v91);
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          v93 = object_getClass(self);
          if (class_isMetaClass(v93))
            v94 = 43;
          else
            v94 = 45;
          v95 = object_getClassName(self);
          v96 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          v123 = v94;
          v124 = 2082;
          v125 = v95;
          v126 = 2082;
          v127 = v96;
          v128 = 1024;
          v129 = 542;
          v130 = 2114;
          v131 = v26;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to read payload, error=%{public}@", buf, 0x2Cu);
        }

        v97 = objc_alloc((Class)NSError);
        v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v116 = NSLocalizedDescriptionKey;
        v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
        v117 = v99;
        v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1));
        v101 = objc_msgSend(v97, "initWithDomain:code:userInfo:", v98, 29, v100);
        v8[2](v8, 0, v101);

        v103 = NFSharedSignpostLog(v102);
        v61 = objc_claimAutoreleasedReturnValue(v103);
        if (os_signpost_enabled(v61))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v61, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c", ", buf, 2u);
        }
      }
      else
      {
        v104 = ((uint64_t (*)(id, NSObject *, _QWORD))v8[2])(v8, v62, 0);
        v105 = NFSharedSignpostLog(v104);
        v61 = objc_claimAutoreleasedReturnValue(v105);
        if (os_signpost_enabled(v61))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v61, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c", ", buf, 2u);
          v26 = 0;
        }
      }
    }

    goto LABEL_27;
  }
  v26 = (void *)v63;
  v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v65 = NFLogGetLogger(v64);
  if (v65)
  {
    v66 = (void (*)(uint64_t, const char *, ...))v65;
    v67 = object_getClass(self);
    v68 = class_isMetaClass(v67);
    v107 = object_getClassName(self);
    v110 = sel_getName(a2);
    v69 = 45;
    if (v68)
      v69 = 43;
    v66(3, "%c[%{public}s %{public}s]:%i Tag selection failed, status=0x%{public}@", v69, v107, v110, 523, v26);
  }
  v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v71 = NFSharedLogGetLogger(v70);
  v72 = objc_claimAutoreleasedReturnValue(v71);
  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
  {
    v73 = object_getClass(self);
    if (class_isMetaClass(v73))
      v74 = 43;
    else
      v74 = 45;
    v75 = object_getClassName(self);
    v76 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v123 = v74;
    v124 = 2082;
    v125 = v75;
    v126 = 2082;
    v127 = v76;
    v128 = 1024;
    v129 = 523;
    v130 = 2114;
    v131 = v26;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag selection failed, status=0x%{public}@", buf, 0x2Cu);
  }

  v77 = objc_alloc((Class)NSError);
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v120 = NSLocalizedDescriptionKey;
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
  v121 = v79;
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1));
  v81 = objc_msgSend(v77, "initWithDomain:code:userInfo:", v78, 29, v80);
  v8[2](v8, 0, v81);

  v83 = NFSharedSignpostLog(v82);
  v62 = objc_claimAutoreleasedReturnValue(v83);
  if (os_signpost_enabled(v62))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v62, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c", ", buf, 2u);
  }
LABEL_27:

}

- (void)transceiveAccessoryCommand:(id)a3 callback:(id)a4
{
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
  OS_dispatch_queue *v21;
  NSObject *v22;
  id v23;
  id v24;
  const char *Name;
  _QWORD block[5];
  id v27;
  id v28;
  SEL v29;
  objc_super v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;

  v7 = a3;
  v8 = a4;
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
    v11(6, "%c[%{public}s %{public}s]:%i ", v15, ClassName, Name, 559);
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
    *(_DWORD *)buf = 67109890;
    v32 = v20;
    v33 = 2082;
    v34 = object_getClassName(self);
    v35 = 2082;
    v36 = sel_getName(a2);
    v37 = 1024;
    v38 = 559;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v30.receiver = self;
  v30.super_class = (Class)_NFACReaderSession;
  v21 = -[_NFACSession workQueue](&v30, "workQueue");
  v22 = objc_claimAutoreleasedReturnValue(v21);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068938;
  block[3] = &unk_1002E6268;
  v28 = v8;
  v29 = a2;
  block[4] = self;
  v27 = v7;
  v23 = v7;
  v24 = v8;
  dispatch_async(v22, block);

}

- (id)_readTypeVTagId:(id *)a3
{
  void *v5;
  void *v6;
  NFTagInternal *curTag;
  void *v8;
  id v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void **v14;
  NSErrorUserInfoKey *v15;
  void *v16;
  void *v17;
  id v19;
  NSErrorUserInfoKey v20;
  void *v21;
  NSErrorUserInfoKey v22;
  void *v23;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", CFSTR("02230003")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession driverWrapper](self, "driverWrapper"));
  curTag = self->_curTag;
  v19 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transceive:tag:maxTimeout:error:", v5, curTag, &v19, 2.0));
  v9 = v19;

  if (v9)
    v10 = 1;
  else
    v10 = v8 == 0;
  if (v10 || (unint64_t)objc_msgSend(v8, "length") <= 0xF)
  {
    v11 = objc_alloc((Class)NSError);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v22 = NSLocalizedDescriptionKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
    v23 = v13;
    v14 = &v23;
    v15 = &v22;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v8, "length") >= 0x10)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subdataWithRange:", (char *)objc_msgSend(v8, "length") - 6, 4));
      goto LABEL_8;
    }
    v11 = objc_alloc((Class)NSError);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v20 = NSLocalizedDescriptionKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
    v21 = v13;
    v14 = &v21;
    v15 = &v20;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v15, 1));
  *a3 = objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 16, v16);

  v17 = 0;
LABEL_8:

  return v17;
}

- (id)_send7816Command:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *specific;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  id v32;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  NSErrorUserInfoKey v47;
  void *v48;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession driverWrapper](self, "driverWrapper"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transceive:tag:maxTimeout:error:", v7, self->_curTag, a4, 2.0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NFResponseAPDU responseWithData:](NFResponseAPDU, "responseWithData:", v9));
  v11 = v10;
  if (v10 && objc_msgSend(v10, "status") == 36864)
  {
    v12 = v11;
  }
  else
  {
    if (!*a4)
    {
      v13 = objc_alloc((Class)NSError);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v47 = NSLocalizedDescriptionKey;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
      v48 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));
      *a4 = objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 16, v16);

    }
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v24 = 45;
      if (isMetaClass)
        v24 = 43;
      v19(3, "%c[%{public}s %{public}s]:%i Command failed: %{public}@   error:%{public}@", v24, ClassName, Name, 627, v6, *a4);
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
      v32 = *a4;
      *(_DWORD *)buf = 67110402;
      v36 = v29;
      v37 = 2082;
      v38 = v30;
      v39 = 2082;
      v40 = v31;
      v41 = 1024;
      v42 = 627;
      v43 = 2114;
      v44 = v6;
      v45 = 2114;
      v46 = v32;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Command failed: %{public}@   error:%{public}@", buf, 0x36u);
    }

    v12 = 0;
  }

  return v12;
}

- (id)_readTypeATagId:(id *)a3
{
  id *v3;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *specific;
  uint64_t Logger;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  int v27;
  const char *ClassName;
  const char *Name;
  NSErrorUserInfoKey v30;
  void *v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  id *v41;

  v3 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[_NFACReaderSession _send7816Command:error:](self, "_send7816Command:error:", CFSTR("00A4040007D276000085010100"), a3));
  if (!v6
    || (v7 = (void *)v6,
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACReaderSession _send7816Command:error:](self, "_send7816Command:error:", CFSTR("00A4000C02E103"), v3)), v7, !v8)|| (v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACReaderSession _send7816Command:error:](self, "_send7816Command:error:", CFSTR("00B0000000"), v3)), v8, !v9))
  {
    v3 = 0;
    return v3;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "response"));
  if ((unint64_t)objc_msgSend(v10, "length") >= 2)
  {
    v11 = objc_retainAutorelease(v10);
    v12 = *((unsigned __int8 *)objc_msgSend(v11, "bytes") + 1);
    if (v12 >= 4 && (unint64_t)objc_msgSend(v11, "length") >= v12)
    {
      v3 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subdataWithRange:", (v12 - 4), 4));
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v20 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v23 = 45;
        if (isMetaClass)
          v23 = 43;
        v20(6, "%c[%{public}s %{public}s]:%i id: %{public}@", v23, ClassName, Name, 661, v3);
      }
      v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v25 = NFSharedLogGetLogger(v24);
      v14 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v26 = object_getClass(self);
        if (class_isMetaClass(v26))
          v27 = 43;
        else
          v27 = 45;
        *(_DWORD *)buf = 67110146;
        v33 = v27;
        v34 = 2082;
        v35 = object_getClassName(self);
        v36 = 2082;
        v37 = sel_getName(a2);
        v38 = 1024;
        v39 = 661;
        v40 = 2114;
        v41 = v3;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i id: %{public}@", buf, 0x2Cu);
      }
      goto LABEL_9;
    }
  }
  if (v3)
  {
    v13 = objc_alloc((Class)NSError);
    v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v30 = NSLocalizedDescriptionKey;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
    v31 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    *v3 = objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 16, v16);

    v3 = 0;
LABEL_9:

  }
  return v3;
}

- (void)readTypeIdentifier:(id)a3
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
  OS_dispatch_queue *v18;
  NSObject *v19;
  id v20;
  const char *Name;
  _QWORD block[5];
  id v23;
  SEL v24;
  objc_super v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;

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
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 674);
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
    v27 = v17;
    v28 = 2082;
    v29 = object_getClassName(self);
    v30 = 2082;
    v31 = sel_getName(a2);
    v32 = 1024;
    v33 = 674;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v25.receiver = self;
  v25.super_class = (Class)_NFACReaderSession;
  v18 = -[_NFACSession workQueue](&v25, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000696B0;
  block[3] = &unk_1002E5D28;
  v23 = v5;
  v24 = a2;
  block[4] = self;
  v20 = v5;
  dispatch_async(v19, block);

}

- (void)setTagDataRate:(int64_t)a3 callback:(id)a4
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
  OS_dispatch_queue *v20;
  NSObject *v21;
  id v22;
  const char *Name;
  _QWORD block[5];
  id v25;
  SEL v26;
  int64_t v27;
  objc_super v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;

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
    v10(6, "%c[%{public}s %{public}s]:%i ", v14, ClassName, Name, 703);
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
    v30 = v19;
    v31 = 2082;
    v32 = object_getClassName(self);
    v33 = 2082;
    v34 = sel_getName(a2);
    v35 = 1024;
    v36 = 703;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v28.receiver = self;
  v28.super_class = (Class)_NFACReaderSession;
  v20 = -[_NFACSession workQueue](&v28, "workQueue");
  v21 = objc_claimAutoreleasedReturnValue(v20);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069C24;
  block[3] = &unk_1002E6638;
  v26 = a2;
  v27 = a3;
  block[4] = self;
  v25 = v7;
  v22 = v7;
  dispatch_async(v21, block);

}

- (void)handleReaderBurnoutTimer
{
  OS_dispatch_queue *v3;
  NSObject *v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NFACReaderSession;
  v3 = -[_NFACSession workQueue](&v6, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069F84;
  block[3] = &unk_1002E5C58;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleReaderBurnoutCleared
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
    v6(6, "%c[%{public}s %{public}s]:%i Warning : message received - session should be gone.", v10, ClassName, Name, 736);
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
    v24 = 736;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Warning : message received - session should be gone.", buf, 0x22u);
  }

}

- (NFSystemPowerConsumptionMonitor)powerConsumptionReporter
{
  return (NFSystemPowerConsumptionMonitor *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPowerConsumptionReporter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerConsumptionReporter, 0);
  objc_storeStrong((id *)&self->_maxRFTimer, 0);
  objc_storeStrong((id *)&self->_curTag, 0);
}

@end
