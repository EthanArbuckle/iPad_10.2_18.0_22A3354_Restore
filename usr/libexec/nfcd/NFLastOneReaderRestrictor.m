@implementation NFLastOneReaderRestrictor

- (NFLastOneReaderRestrictor)initWithThermalMonitor:(id)a3 delegate:(id)a4
{
  NFLastOneReaderRestrictor *v5;
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

  v22.receiver = self;
  v22.super_class = (Class)NFLastOneReaderRestrictor;
  v5 = -[NFReaderRestrictor initWithThermalMonitor:delegate:](&v22, "initWithThermalMonitor:delegate:", a3, a4);
  if (v5)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v5);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v5);
      Name = sel_getName(a2);
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v8(6, "%c[%{public}s %{public}s]:%i Using last one mechanism", v12, ClassName, Name, 22);
    }
    v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = object_getClass(v5);
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      v18 = object_getClassName(v5);
      v19 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v24 = v17;
      v25 = 2082;
      v26 = v18;
      v27 = 2082;
      v28 = v19;
      v29 = 1024;
      v30 = 22;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Using last one mechanism", buf, 0x22u);
    }

  }
  return v5;
}

- (double)maxOperationTimeSpan
{
  return 77.0;
}

- (double)maxReaderTime
{
  unsigned int v2;
  double result;

  v2 = -[NFLastOneReaderRestrictor _wasActiveTooLong](self, "_wasActiveTooLong");
  result = 20.0;
  if (v2)
    return 7.0;
  return result;
}

- (double)getCooloffTime
{
  NSDate *v4;
  void *v5;
  NSDate *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
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
  const char *v23;
  const char *v24;
  double v25;
  const char *Name;
  objc_super v28;
  objc_super v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  double v39;

  v29.receiver = self;
  v29.super_class = (Class)NFLastOneReaderRestrictor;
  v4 = -[NFReaderRestrictor currentTestTime](&v29, "currentTestTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v28.receiver = self;
    v28.super_class = (Class)NFLastOneReaderRestrictor;
    v6 = -[NFReaderRestrictor currentTestTime](&v28, "currentTestTime");
    v7 = objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 0.0));
  }
  v8 = (void *)v7;

  -[NFLastOneReaderRestrictor _getLastConnectionTime:](self, "_getLastConnectionTime:", v8);
  v10 = v9;
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
    v13(6, "%c[%{public}s %{public}s]:%i Last connection was for %f seconds", v17, ClassName, Name, 46, *(_QWORD *)&v10);
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
    v23 = object_getClassName(self);
    v24 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v31 = v22;
    v32 = 2082;
    v33 = v23;
    v34 = 2082;
    v35 = v24;
    v36 = 1024;
    v37 = 46;
    v38 = 2048;
    v39 = v10;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Last connection was for %f seconds", buf, 0x2Cu);
  }

  if (-[NFReaderRestrictor thermalPressureCritical](self, "thermalPressureCritical"))
  {
    v25 = 0.1;
  }
  else
  {
    v25 = 5.0;
    if ((!-[NFReaderRestrictor thermalPressureBackoff](self, "thermalPressureBackoff") || v10 <= 5.0)
      && (!-[NFLastOneReaderRestrictor _wasActiveTooLong](self, "_wasActiveTooLong") || v10 < 5.0))
    {
      if (v10 >= 19.0)
        v25 = 5.0;
      else
        v25 = 0.0;
    }
  }

  return v25;
}

- (BOOL)_wasActiveTooLong
{
  NSDate *v4;
  void *v5;
  NSDate *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  void *specific;
  uint64_t Logger;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  const char *Name;
  objc_super v30;
  objc_super v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  double v41;
  __int16 v42;
  _BOOL4 v43;

  v31.receiver = self;
  v31.super_class = (Class)NFLastOneReaderRestrictor;
  v4 = -[NFReaderRestrictor currentTestTime](&v31, "currentTestTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v30.receiver = self;
    v30.super_class = (Class)NFLastOneReaderRestrictor;
    v6 = -[NFReaderRestrictor currentTestTime](&v30, "currentTestTime");
    v7 = objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 0.0));
  }
  v8 = (void *)v7;

  -[NFLastOneReaderRestrictor _getLastConnectionTime:](self, "_getLastConnectionTime:", v8);
  v10 = v9;
  -[NFLastOneReaderRestrictor _getLastDisconnectionTime:](self, "_getLastDisconnectionTime:", v8);
  v12 = v11;
  if (v10 >= 20.0 || -[NFReaderRestrictor thermalPressureBackoff](self, "thermalPressureBackoff"))
  {
    v13 = 1;
  }
  else
  {
    if (v12 < 5.0)
      -[NFReaderRestrictor thermalPressureNominal](self, "thermalPressureNominal");
    v13 = 0;
  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v16 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v20 = 45;
    if (isMetaClass)
      v20 = 43;
    v16(6, "%c[%{public}s %{public}s]:%i Reader: last connection = %f seconds ago, active too long is %d", v20, ClassName, Name, 85, *(_QWORD *)&v10, v13);
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
    *(_DWORD *)buf = 67110402;
    v33 = v25;
    v34 = 2082;
    v35 = v26;
    v36 = 2082;
    v37 = v27;
    v38 = 1024;
    v39 = 85;
    v40 = 2048;
    v41 = v10;
    v42 = 1024;
    v43 = v13;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Reader: last connection = %f seconds ago, active too long is %d", buf, 0x32u);
  }

  return v13;
}

- (double)_getLastDisconnectionTime:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;
  unsigned int v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  id v21;
  unsigned int v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  double v27;
  void *specific;
  uint64_t Logger;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  objc_class *v38;
  int v39;
  const char *Name;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFReaderRestrictor readerOperations](self, "readerOperations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));

  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 0));
    v10 = (_QWORD *)v9;
    if (v9)
      v11 = *(void **)(v9 + 16);
    else
      v11 = 0;
    v12 = v11;
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("ReaderStopped"));

    if (v13)
    {
      if (v10)
        v14 = (void *)v10[1];
      else
        v14 = 0;
      v15 = v14;
      objc_msgSend(v5, "timeIntervalSinceDate:", v15);
      v17 = v16;

LABEL_29:
      goto LABEL_30;
    }
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 1));
      v19 = (_QWORD *)v18;
      if (v18)
        v20 = *(void **)(v18 + 16);
      else
        v20 = 0;
      v21 = v20;
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("ReaderStopped"));

      if (v22)
      {
        if (v19)
          v23 = (void *)v19[1];
        else
          v23 = 0;
        v24 = v23;
        if (v10)
          v25 = (void *)v10[1];
        else
          v25 = 0;
        v26 = v25;
        objc_msgSend(v24, "timeIntervalSinceDate:", v26);
        v17 = v27;

        goto LABEL_29;
      }

    }
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v30 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v34 = 45;
      if (isMetaClass)
        v34 = 43;
      v30(6, "%c[%{public}s %{public}s]:%i No stop reader operation stored", v34, ClassName, Name, 114);
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
      v43 = v39;
      v44 = 2082;
      v45 = object_getClassName(self);
      v46 = 2082;
      v47 = sel_getName(a2);
      v48 = 1024;
      v49 = 114;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No stop reader operation stored", buf, 0x22u);
    }

    v17 = 3.40282347e38;
    goto LABEL_29;
  }
  v17 = 0.0;
LABEL_30:

  return v17;
}

- (double)_getLastConnectionTime:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;
  unsigned int v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  id v21;
  unsigned int v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  double v27;
  void *specific;
  uint64_t Logger;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  objc_class *v38;
  int v39;
  const char *Name;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFReaderRestrictor readerOperations](self, "readerOperations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));

  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 0));
    v10 = (_QWORD *)v9;
    if (v9)
      v11 = *(void **)(v9 + 16);
    else
      v11 = 0;
    v12 = v11;
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("ReaderStarted"));

    if (v13)
    {
      if (v10)
        v14 = (void *)v10[1];
      else
        v14 = 0;
      v15 = v14;
      objc_msgSend(v5, "timeIntervalSinceDate:", v15);
      v17 = v16;

LABEL_29:
      goto LABEL_30;
    }
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 1));
      v19 = (_QWORD *)v18;
      if (v18)
        v20 = *(void **)(v18 + 16);
      else
        v20 = 0;
      v21 = v20;
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("ReaderStarted"));

      if (v22)
      {
        if (v19)
          v23 = (void *)v19[1];
        else
          v23 = 0;
        v24 = v23;
        if (v10)
          v25 = (void *)v10[1];
        else
          v25 = 0;
        v26 = v25;
        objc_msgSend(v24, "timeIntervalSinceDate:", v26);
        v17 = v27;

        goto LABEL_29;
      }

    }
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v30 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v34 = 45;
      if (isMetaClass)
        v34 = 43;
      v30(4, "%c[%{public}s %{public}s]:%i Unexpected state : No start reader operation stored", v34, ClassName, Name, 139);
    }
    v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v36 = NFSharedLogGetLogger(v35);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = object_getClass(self);
      if (class_isMetaClass(v38))
        v39 = 43;
      else
        v39 = 45;
      *(_DWORD *)buf = 67109890;
      v43 = v39;
      v44 = 2082;
      v45 = object_getClassName(self);
      v46 = 2082;
      v47 = sel_getName(a2);
      v48 = 1024;
      v49 = 139;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state : No start reader operation stored", buf, 0x22u);
    }

    v17 = 0.0;
    goto LABEL_29;
  }
  v17 = 0.0;
LABEL_30:

  return v17;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NFLastOneReaderRestrictor;
  v3 = -[NFReaderRestrictor description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v4));

  objc_msgSend(v5, "appendFormat:", CFSTR("\n"));
  if (-[NFReaderRestrictor thermalPressureCritical](self, "thermalPressureCritical"))
  {
    v6 = CFSTR("\t Current window = Critical\n");
  }
  else if (-[NFReaderRestrictor thermalPressureBackoff](self, "thermalPressureBackoff"))
  {
    v6 = CFSTR("\t Current window = Backoff\n");
  }
  else
  {
    v6 = CFSTR("\t Current window = Nominal\n");
  }
  objc_msgSend(v5, "appendFormat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFReaderRestrictor readerOperations](self, "readerOperations"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t Operations = %@"), v7);

  return v5;
}

@end
