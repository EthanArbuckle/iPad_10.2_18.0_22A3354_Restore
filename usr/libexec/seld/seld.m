void sub_100008188(uint64_t a1, void *a2)
{
  id v3;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
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
  id v28;

  v3 = a2;
  if (v3)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v9 = 45;
      if (isMetaClass)
        v9 = 43;
      v6(3, "%c[%{public}s %{public}s]:%i Error %{public}@", v9, ClassName, Name, 864, v3);
    }
    v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v11 = NFSharedLogGetLogger(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      v15 = object_getClassName(*(id *)(a1 + 32));
      v16 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v20 = v14;
      v21 = 2082;
      v22 = v15;
      v23 = 2082;
      v24 = v16;
      v25 = 1024;
      v26 = 864;
      v27 = 2114;
      v28 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error %{public}@", buf, 0x2Cu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_100008424(uint64_t a1, void *a2)
{
  id v3;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
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
  id v28;

  v3 = a2;
  if (v3)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v9 = 45;
      if (isMetaClass)
        v9 = 43;
      v6(3, "%c[%{public}s %{public}s]:%i Error %{public}@", v9, ClassName, Name, 888, v3);
    }
    v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v11 = NFSharedLogGetLogger(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      v15 = object_getClassName(*(id *)(a1 + 32));
      v16 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v20 = v14;
      v21 = 2082;
      v22 = v15;
      v23 = 2082;
      v24 = v16;
      v25 = 1024;
      v26 = 888;
      v27 = 2114;
      v28 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error %{public}@", buf, 0x2Cu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_10000875C(uint64_t a1, void *a2)
{
  id v3;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
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
  id v28;

  v3 = a2;
  if (v3)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v9 = 45;
      if (isMetaClass)
        v9 = 43;
      v6(3, "%c[%{public}s %{public}s]:%i Error %{public}@", v9, ClassName, Name, 949, v3);
    }
    v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v11 = NFSharedLogGetLogger(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      v15 = object_getClassName(*(id *)(a1 + 32));
      v16 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v20 = v14;
      v21 = 2082;
      v22 = v15;
      v23 = 2082;
      v24 = v16;
      v25 = 1024;
      v26 = 949;
      v27 = 2114;
      v28 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error %{public}@", buf, 0x2Cu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_1000089F0(uint64_t a1, void *a2)
{
  id v3;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
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
  id v28;

  v3 = a2;
  if (v3)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v9 = 45;
      if (isMetaClass)
        v9 = 43;
      v6(3, "%c[%{public}s %{public}s]:%i Error %{public}@", v9, ClassName, Name, 973, v3);
    }
    v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v11 = NFSharedLogGetLogger(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      v15 = object_getClassName(*(id *)(a1 + 32));
      v16 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v20 = v14;
      v21 = 2082;
      v22 = v15;
      v23 = 2082;
      v24 = v16;
      v25 = 1024;
      v26 = 973;
      v27 = 2114;
      v28 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error %{public}@", buf, 0x2Cu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_100009708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000978C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000979C(uint64_t a1)
{

}

void sub_1000097A4(uint64_t a1, uint64_t a2, void *a3)
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
  const char *v18;
  const char *v19;
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
  const char *v33;
  const char *Name;
  const char *v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  id v45;

  v5 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i reader session started", v12, ClassName, Name, 1010);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    v18 = object_getClassName(*(id *)(a1 + 32));
    v19 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v37 = v17;
    v38 = 2082;
    v39 = v18;
    v40 = 2082;
    v41 = v19;
    v42 = 1024;
    v43 = 1010;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i reader session started", buf, 0x22u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (v5)
  {
    v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v21 = NFLogGetLogger(v20);
    if (v21)
    {
      v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(*(id *)(a1 + 32));
      v24 = class_isMetaClass(v23);
      v33 = object_getClassName(*(id *)(a1 + 32));
      v35 = sel_getName(*(SEL *)(a1 + 48));
      v25 = 45;
      if (v24)
        v25 = 43;
      v22(3, "%c[%{public}s %{public}s]:%i %{public}@", v25, v33, v35, 1014, v5);
    }
    v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v27 = NFSharedLogGetLogger(v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v29))
        v30 = 43;
      else
        v30 = 45;
      v31 = object_getClassName(*(id *)(a1 + 32));
      v32 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v37 = v30;
      v38 = 2082;
      v39 = v31;
      v40 = 2082;
      v41 = v32;
      v42 = 1024;
      v43 = 1014;
      v44 = 2114;
      v45 = v5;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 104));

}

void sub_10000EDE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010C3C(void *a1, int a2, double a3)
{
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  if (a1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "redirectState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "performanceMetrics"));
    objc_msgSend(v7, "totalNetworkResponseTime");
    objc_msgSend(v7, "setTotalNetworkResponseTime:", v8 + a3);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "redirectState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "performanceMetrics"));
    objc_msgSend(v10, "maxNetworkResponseTime");
    v12 = v11;

    if (v12 < a3)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "redirectState"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "performanceMetrics"));
      objc_msgSend(v14, "setMaxNetworkResponseTime:", a3);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "redirectState"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "performanceMetrics"));
      v17 = objc_msgSend(v16, "totalResponsesWithBody");
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "redirectState"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "performanceMetrics"));
      objc_msgSend(v19, "setTransferWithMaxResponseTime:", v17);

    }
    if (a2)
    {
      v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "redirectState"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "performanceMetrics"));
      objc_msgSend(v20, "setTotalResponsesWithBody:", objc_msgSend(v20, "totalResponsesWithBody") + 1);

    }
  }
}

void sub_100011DBC(_DWORD *a1, uint64_t a2)
{
  int v3;
  void *v4;
  const __CFString *v5;
  id v6;
  void *v7;
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
  id v20;
  void *v21;
  uint64_t v22;
  const char *Name;
  id v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

  v3 = a1[9];
  if (v3 <= 27)
  {
    switch(v3)
    {
      case 9:
      case 16:
        goto LABEL_8;
      case 13:
      case 15:
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "redirectState"));
        v5 = CFSTR("SEAccessError");
        goto LABEL_10;
      default:
        goto LABEL_12;
    }
  }
  switch(v3)
  {
    case 66:
LABEL_8:
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "redirectState"));
      v5 = CFSTR("ScriptExecutionError");
      goto LABEL_10;
    case 65:
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "redirectState"));
      v5 = CFSTR("AIDNotFound");
      goto LABEL_10;
    case 28:
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "redirectState"));
      v5 = CFSTR("CardNotFound");
LABEL_10:
      v24 = v4;
      objc_msgSend(v4, "setIncompleteReason:", v5);
LABEL_11:

      return;
  }
LABEL_12:
  if (a2 == 16 || v3 == 7)
  {
    v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@(reason=%ld)"), CFSTR("Cancel"), 5);
LABEL_19:
    v24 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "redirectState"));
    objc_msgSend(v7, "setIncompleteReason:", v24);

    goto LABEL_11;
  }
  if (a2 != 1 && v3 != 3)
  {
    switch(a2)
    {
      case 0:
      case 3:
      case 8:
        return;
      case 1:
      case 4:
      case 5:
      case 6:
      case 7:
        goto LABEL_32;
      case 2:
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "redirectState"));
        v5 = CFSTR("NetworkUnavailable");
        goto LABEL_10;
      default:
        if (a2 == 15)
        {
          v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "redirectState"));
          v5 = CFSTR("NetworkError");
          goto LABEL_10;
        }
LABEL_32:
        v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown error:%d"), a1[9], v22);
        break;
    }
    goto LABEL_19;
  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(a1);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(a1);
    Name = sel_getName("_processRedirectInProgressResult:");
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v10(6, "%c[%{public}s %{public}s]:%i connection aborted", v14, ClassName, Name, 510);
  }
  v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v16 = NFSharedLogGetLogger(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = object_getClass(a1);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    *(_DWORD *)buf = 67109890;
    v26 = v19;
    v27 = 2082;
    v28 = object_getClassName(a1);
    v29 = 2082;
    v30 = sel_getName("_processRedirectInProgressResult:");
    v31 = 1024;
    v32 = 510;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i connection aborted", buf, 0x22u);
  }

  v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@(reason=%d)"), CFSTR("Cancel"), objc_msgSend(a1, "abortedReason"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "redirectState"));
  objc_msgSend(v21, "setIncompleteReason:", v20);

}

void sub_100013B70(uint64_t a1, void *a2, void *a3)
{
  id v6;
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
  const char *v19;
  const char *v20;
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

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 697, v7);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      v19 = object_getClassName(*(id *)(a1 + 32));
      v20 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v24 = v18;
      v25 = 2082;
      v26 = v19;
      v27 = 2082;
      v28 = v20;
      v29 = 1024;
      v30 = 697;
      v31 = 2114;
      v32 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "aborted") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_1000144A8(id a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NFRemoteAdminManagerInterface));
  v2 = (void *)qword_10005C368;
  qword_10005C368 = v1;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NFRemoteAdminManagerCallbacks interface](NFRemoteAdminManagerCallbacks, "interface"));
  objc_msgSend((id)qword_10005C368, "setInterface:forSelector:argumentIndex:ofReply:", v10, "registerForCallbacks:", 0, 0);
  objc_msgSend((id)qword_10005C368, "setInterface:forSelector:argumentIndex:ofReply:", v10, "unregisterForCallbacks:", 0, 0);
  v3 = (void *)qword_10005C368;
  v4 = objc_alloc((Class)NSSet);
  v5 = objc_opt_class(NSArray);
  v6 = objc_opt_class(NSNumber);
  v7 = objc_opt_class(NSString);
  v8 = objc_opt_class(NSDictionary);
  v9 = objc_msgSend(v4, "initWithObjects:", v5, v6, v7, v8, objc_opt_class(NSData), 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v9, "getSELDInfoForBrokerWithCompletion:", 0, 1);

}

void sub_10001462C(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NFRemoteAdminManagerCallbacks));
  v2 = (void *)qword_10005C378;
  qword_10005C378 = v1;

}

uint64_t start()
{
  void *v0;
  uint64_t i;
  uintptr_t v2;
  dispatch_source_t v3;
  dispatch_source_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  CFRunLoopRef Current;
  int v10;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;

  v0 = objc_autoreleasePoolPush();
  for (i = 0; i != 5; ++i)
  {
    v2 = dword_1000411C0[i];
    signal(dword_1000411C0[i], (void (__cdecl *)(int))1);
    v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v2, 0, 0);
    v4 = qword_10005C388[i];
    qword_10005C388[i] = v3;

    dispatch_set_context(qword_10005C388[i], (void *)v2);
    dispatch_source_set_event_handler_f(qword_10005C388[i], (dispatch_function_t)sub_1000162FC);
    dispatch_resume(qword_10005C388[i]);
  }
  +[NSError _setFileNameLocalizationEnabled:](NSError, "_setFileNameLocalizationEnabled:", 0);
  NFSetThreadPriority(50);
  v5 = objc_alloc_init((Class)NFPreferenceObserver);
  objc_msgSend(v5, "start:", &stru_100054840);
  v6 = sub_1000180C8();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_10001B45C(v7);

  objc_autoreleasePoolPop(v0);
  do
  {
    v8 = objc_autoreleasePoolPush();
    Current = CFRunLoopGetCurrent();
    v10 = CFRunLoopRunSpecific(Current, kCFRunLoopDefaultMode, 1, 1.0e10);
    objc_autoreleasePoolPop(v8);
  }
  while ((v10 - 3) < 0xFFFFFFFE);
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
    Logger(6, "%s:%i Exiting", "main", 141);
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v18 = "main";
    v19 = 1024;
    v20 = 141;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Exiting", buf, 0x12u);
  }

  return 0;
}

void sub_1000162FC(uint64_t a1)
{
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  __CFRunLoop *Main;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
    Logger(5, "%s:%i Received signal: %lu", "signalHandler", 87, a1);
  v4 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v5 = NFSharedLogGetLogger(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v11 = "signalHandler";
    v12 = 1024;
    v13 = 87;
    v14 = 2048;
    v15 = a1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Received signal: %lu", buf, 0x1Cu);
  }

  v7 = sub_1000180C8();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  sub_10001BCDC(v8);

  Main = CFRunLoopGetMain();
  CFRunLoopStop(Main);
}

void sub_10001642C(id a1)
{
  id v1;
  id v2;

  v1 = sub_1000180C8();
  v2 = (id)objc_claimAutoreleasedReturnValue(v1);
  sub_10001CFE0((uint64_t)v2);

}

void sub_100016734(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000167C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1000168F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100016F6C(uint64_t a1)
{
  uint64_t v2;
  void *specific;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *Name;
  const char *v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const char *v43;

  objc_msgSend(*(id *)(a1 + 128), "lock");
  v2 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 120) = v2 + 1;
  if (!v2)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass((id)a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName((id)a1);
      Name = sel_getName("_keepAliveTransactionRetain");
      v9 = 45;
      if (isMetaClass)
        v9 = 43;
      v5(5, "%c[%{public}s %{public}s]:%i creating SELD keep alive transaction", v9, ClassName, Name, 818);
    }
    v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v11 = NFSharedLogGetLogger(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = object_getClass((id)a1);
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      *(_DWORD *)buf = 67109890;
      v35 = v14;
      v36 = 2082;
      v37 = object_getClassName((id)a1);
      v38 = 2082;
      v39 = sel_getName("_keepAliveTransactionRetain");
      v40 = 1024;
      v41 = 818;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i creating SELD keep alive transaction", buf, 0x22u);
    }

    if (*(_QWORD *)(a1 + 112))
    {
      v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v19 = NFLogGetLogger(v18);
      if (v19)
      {
        v20 = (void (*)(uint64_t, const char *, ...))v19;
        v21 = object_getClass((id)a1);
        v22 = class_isMetaClass(v21);
        v31 = object_getClassName((id)a1);
        v33 = sel_getName("_keepAliveTransactionRetain");
        v23 = 45;
        if (v22)
          v23 = 43;
        v20(3, "%c[%{public}s %{public}s]:%i FAILED: %s", v23, v31, v33, 819, "_keepAliveTransaction == ((void *)0)");
      }
      v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v25 = NFSharedLogGetLogger(v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = object_getClass((id)a1);
        if (class_isMetaClass(v27))
          v28 = 43;
        else
          v28 = 45;
        v29 = object_getClassName((id)a1);
        v30 = sel_getName("_keepAliveTransactionRetain");
        *(_DWORD *)buf = 67110146;
        v35 = v28;
        v36 = 2082;
        v37 = v29;
        v38 = 2082;
        v39 = v30;
        v40 = 1024;
        v41 = 819;
        v42 = 2080;
        v43 = "_keepAliveTransaction == ((void *)0)";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i FAILED: %s", buf, 0x2Cu);
      }

      abort();
    }
    v15 = os_transaction_create("com.apple.seld.keepAlive");
    v16 = *(void **)(a1 + 112);
    *(_QWORD *)(a1 + 112) = v15;

  }
  return objc_msgSend(*(id *)(a1 + 128), "unlock");
}

void sub_100017260(uint64_t a1)
{
  NSObject *v2;
  _BYTE *WeakRetained;
  _BYTE *v4;
  os_activity_scope_state_s v5;

  v2 = _os_activity_create((void *)&_mh_execute_header, "_NFRemoteAdminManager NotifyBatteryChange", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v2, &v5);
  os_activity_scope_leave(&v5);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[155])
    {
      sub_100017AAC(WeakRetained);
      if (!v4[155])
        sub_1000172F4(v4);
    }
  }

}

void sub_1000172F4(unsigned __int8 *a1)
{
  unsigned __int8 *v2;
  unsigned __int8 v3;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *v7;
  _BOOL4 v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *Name;
  _QWORD v27[5];
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;

  if (a1)
  {
    v2 = a1 + 154;
    do
      v3 = __ldaxr(v2);
    while (__stlxr(1u, v2));
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    if ((v3 & 1) != 0)
    {
      if (Logger)
      {
        Class = object_getClass(a1);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName("_queueStartNextSession");
        v19 = 45;
        if (isMetaClass)
          v19 = 43;
        v6(6, "%c[%{public}s %{public}s]:%i _startNextSession is already in queued up.", v19, ClassName, Name, 2212);
      }
      v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v21 = NFSharedLogGetLogger(v20);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = object_getClass(a1);
        if (class_isMetaClass(v23))
          v24 = 43;
        else
          v24 = 45;
        *(_DWORD *)buf = 67109890;
        v29 = v24;
        v30 = 2082;
        v31 = object_getClassName(a1);
        v32 = 2082;
        v33 = sel_getName("_queueStartNextSession");
        v34 = 1024;
        v35 = 2212;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i _startNextSession is already in queued up.", buf, 0x22u);
      }

    }
    else
    {
      if (Logger)
      {
        v7 = object_getClass(a1);
        v8 = class_isMetaClass(v7);
        v9 = object_getClassName(a1);
        v25 = sel_getName("_queueStartNextSession");
        v10 = 45;
        if (v8)
          v10 = 43;
        v6(6, "%c[%{public}s %{public}s]:%i Adding _startNextSession to SessionQueue.", v10, v9, v25, 2207);
      }
      v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v12 = NFSharedLogGetLogger(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = object_getClass(a1);
        if (class_isMetaClass(v14))
          v15 = 43;
        else
          v15 = 45;
        *(_DWORD *)buf = 67109890;
        v29 = v15;
        v30 = 2082;
        v31 = object_getClassName(a1);
        v32 = 2082;
        v33 = sel_getName("_queueStartNextSession");
        v34 = 1024;
        v35 = 2207;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Adding _startNextSession to SessionQueue.", buf, 0x22u);
      }

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10002CADC;
      v27[3] = &unk_100054990;
      v27[4] = a1;
      sub_10001B1E8((uint64_t)a1, v27);
    }
  }
}

void sub_1000175D0(uint64_t a1)
{
  NSObject *v2;
  _BYTE *WeakRetained;
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
  const char *v16;
  const char *v17;
  const char *Name;
  _BYTE state[18];
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;

  v2 = _os_activity_create((void *)&_mh_execute_header, "_NFRemoteAdminManager NotifyAdapterChange", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v2, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(WeakRetained);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(WeakRetained);
    Name = sel_getName(*(SEL *)(a1 + 40));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Charging state changed", v10, ClassName, Name, 178);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(WeakRetained);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    v16 = object_getClassName(WeakRetained);
    v17 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v15;
    *(_WORD *)&state[8] = 2082;
    *(_QWORD *)&state[10] = v16;
    v20 = 2082;
    v21 = v17;
    v22 = 1024;
    v23 = 178;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Charging state changed", state, 0x22u);
  }

  if (WeakRetained)
  {
    if (WeakRetained[155])
    {
      sub_100017AAC(WeakRetained);
      if (!WeakRetained[155])
        sub_1000172F4(WeakRetained);
    }
  }

}

id *sub_1000177B8(id *result)
{
  id *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *v7;
  _BOOL4 v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  id v16;
  void *specific;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *ClassName;
  const char *v29;
  const char *Name;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;

  if (result)
  {
    v1 = result;
    objc_msgSend(result[16], "lock");
    v2 = (uint64_t)v1[15];
    if (v2 <= 0)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v19 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v1);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v1);
        Name = sel_getName("_keepAliveTransactionRelease");
        v22 = 45;
        if (isMetaClass)
          v22 = 43;
        v19(3, "%c[%{public}s %{public}s]:%i FAILED: %s", v22, ClassName, Name, 829, "_keepAliveTransactionCount > 0");
      }
      v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v24 = NFSharedLogGetLogger(v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = object_getClass(v1);
        if (class_isMetaClass(v26))
          v27 = 43;
        else
          v27 = 45;
        *(_DWORD *)buf = 67110146;
        v32 = v27;
        v33 = 2082;
        v34 = object_getClassName(v1);
        v35 = 2082;
        v36 = sel_getName("_keepAliveTransactionRelease");
        v37 = 1024;
        v38 = 829;
        v39 = 2080;
        v40 = "_keepAliveTransactionCount > 0";
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i FAILED: %s", buf, 0x2Cu);
      }

      abort();
    }
    v3 = v2 - 1;
    v1[15] = (id)v3;
    if (!v3)
    {
      v4 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v5 = NFLogGetLogger(v4);
      if (v5)
      {
        v6 = (void (*)(uint64_t, const char *, ...))v5;
        v7 = object_getClass(v1);
        v8 = class_isMetaClass(v7);
        v9 = object_getClassName(v1);
        v29 = sel_getName("_keepAliveTransactionRelease");
        v10 = 45;
        if (v8)
          v10 = 43;
        v6(6, "%c[%{public}s %{public}s]:%i releasing SELD keep alive transaction", v10, v9, v29, 832);
      }
      v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v12 = NFSharedLogGetLogger(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = object_getClass(v1);
        if (class_isMetaClass(v14))
          v15 = 43;
        else
          v15 = 45;
        *(_DWORD *)buf = 67109890;
        v32 = v15;
        v33 = 2082;
        v34 = object_getClassName(v1);
        v35 = 2082;
        v36 = sel_getName("_keepAliveTransactionRelease");
        v37 = 1024;
        v38 = 832;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i releasing SELD keep alive transaction", buf, 0x22u);
      }

      v16 = v1[14];
      v1[14] = 0;

    }
    return (id *)objc_msgSend(v1[16], "unlock");
  }
  return result;
}

void sub_100017AAC(uint64_t a1)
{
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v5;
  const char *ClassName;
  const char *Name;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  NSObject *v15;
  int *v16;
  void *v17;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  int v33;
  int v34;
  _DWORD *v35;
  void *v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  char v49;
  int v50;
  _QWORD handler[4];
  id v52;
  id location;
  uint8_t buf[8];
  _BYTE v55[26];
  __int16 v56;
  int v57;
  const char *v58;

  if (!a1)
    return;
  v50 = 100;
  v49 = 0;
  if ((NFProductIsDevBoard() & 1) != 0 || IOPSGetPercentRemaining(&v50, &v49, 0))
    return;
  if (v50 <= 2 && !v49)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass((id)a1);
      if (class_isMetaClass(Class))
        v5 = 43;
      else
        v5 = 45;
      ClassName = object_getClassName((id)a1);
      Name = sel_getName("updateBrownoutPrevention");
      Logger(6, "%c[%{public}s %{public}s]:%i Device is too low on battery : %d", v5, ClassName, Name, 222, v50);
    }
    v8 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v9 = NFSharedLogGetLogger(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = object_getClass((id)a1);
      if (class_isMetaClass(v11))
        v12 = 43;
      else
        v12 = 45;
      v13 = object_getClassName((id)a1);
      v14 = sel_getName("updateBrownoutPrevention");
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = v12;
      *(_WORD *)v55 = 2082;
      *(_QWORD *)&v55[2] = v13;
      *(_WORD *)&v55[10] = 2082;
      *(_QWORD *)&v55[12] = v14;
      *(_WORD *)&v55[20] = 1024;
      *(_DWORD *)&v55[22] = 222;
      v56 = 1024;
      v57 = v50;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Device is too low on battery : %d", buf, 0x28u);
    }

    *(_BYTE *)(a1 + 155) = 1;
    v15 = _os_activity_create((void *)&_mh_execute_header, "listenForBatteryChanges", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    *(_QWORD *)buf = 0;
    *(_QWORD *)v55 = 0;
    os_activity_scope_enter(v15, (os_activity_scope_state_t)buf);
    os_activity_scope_leave((os_activity_scope_state_t)buf);

    if (*(_DWORD *)(a1 + 156) == -1)
    {
      v16 = (int *)(a1 + 160);
      if (*(_DWORD *)(a1 + 160) == -1)
      {
        v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v17);
        if (v18)
        {
          v19 = object_getClass((id)a1);
          if (class_isMetaClass(v19))
            v20 = 43;
          else
            v20 = 45;
          v21 = object_getClassName((id)a1);
          v22 = sel_getName("listenForBatteryChanges");
          v18(6, "%c[%{public}s %{public}s]:%i Listening for battery notifications", v20, v21, v22, 155);
        }
        v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v24 = NFSharedLogGetLogger(v23);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = object_getClass((id)a1);
          if (class_isMetaClass(v26))
            v27 = 43;
          else
            v27 = 45;
          v28 = object_getClassName((id)a1);
          v29 = sel_getName("listenForBatteryChanges");
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v27;
          *(_WORD *)v55 = 2082;
          *(_QWORD *)&v55[2] = v28;
          *(_WORD *)&v55[10] = 2082;
          *(_QWORD *)&v55[12] = v29;
          *(_WORD *)&v55[20] = 1024;
          *(_DWORD *)&v55[22] = 155;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Listening for battery notifications", buf, 0x22u);
        }

        sub_100016F6C(a1);
        objc_initWeak(&location, (id)a1);
        v30 = *(NSObject **)(a1 + 104);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_100017260;
        handler[3] = &unk_100054868;
        objc_copyWeak(&v52, &location);
        notify_register_dispatch("com.apple.system.powersources.percent", (int *)(a1 + 156), v30, handler);
        v31 = *(NSObject **)(a1 + 104);
        *(_QWORD *)buf = _NSConcreteStackBlock;
        *(_QWORD *)v55 = 3221225472;
        *(_QWORD *)&v55[8] = sub_1000175D0;
        *(_QWORD *)&v55[16] = &unk_100054890;
        objc_copyWeak((id *)&v55[24], &location);
        v58 = "listenForBatteryChanges";
        notify_register_dispatch("com.apple.system.powermanagement.poweradapter", v16, v31, buf);
        objc_destroyWeak((id *)&v55[24]);
        objc_destroyWeak(&v52);
        objc_destroyWeak(&location);
      }
    }
    return;
  }
  *(_BYTE *)(a1 + 155) = 0;
  v32 = _os_activity_create((void *)&_mh_execute_header, "stopListeningForBatteryChanges", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)buf = 0;
  *(_QWORD *)v55 = 0;
  os_activity_scope_enter(v32, (os_activity_scope_state_t)buf);
  os_activity_scope_leave((os_activity_scope_state_t)buf);

  v33 = *(_DWORD *)(a1 + 156);
  if (v33 == -1)
  {
    v35 = (_DWORD *)(a1 + 160);
    v34 = *(_DWORD *)(a1 + 160);
    if (v34 == -1)
      return;
  }
  else
  {
    notify_cancel(v33);
    v35 = (_DWORD *)(a1 + 160);
    v34 = *(_DWORD *)(a1 + 160);
    *(_DWORD *)(a1 + 156) = -1;
    if (v34 == -1)
      goto LABEL_34;
  }
  notify_cancel(v34);
  *v35 = -1;
LABEL_34:
  v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v36);
  if (v37)
  {
    v38 = object_getClass((id)a1);
    if (class_isMetaClass(v38))
      v39 = 43;
    else
      v39 = 45;
    v40 = object_getClassName((id)a1);
    v41 = sel_getName("stopListeningForBatteryChanges");
    v37(6, "%c[%{public}s %{public}s]:%i Stopped listening for battery notifications", v39, v40, v41, 209);
  }
  v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v43 = NFSharedLogGetLogger(v42);
  v44 = objc_claimAutoreleasedReturnValue(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45 = object_getClass((id)a1);
    if (class_isMetaClass(v45))
      v46 = 43;
    else
      v46 = 45;
    v47 = object_getClassName((id)a1);
    v48 = sel_getName("stopListeningForBatteryChanges");
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v46;
    *(_WORD *)v55 = 2082;
    *(_QWORD *)&v55[2] = v47;
    *(_WORD *)&v55[10] = 2082;
    *(_QWORD *)&v55[12] = v48;
    *(_WORD *)&v55[20] = 1024;
    *(_DWORD *)&v55[22] = 209;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Stopped listening for battery notifications", buf, 0x22u);
  }

  sub_1000177B8((id *)a1);
}

void sub_100018094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v20);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000180C8()
{
  objc_opt_self();
  if (qword_10005C3C0 != -1)
    dispatch_once(&qword_10005C3C0, &stru_1000548B0);
  return (id)qword_10005C3B8;
}

void sub_10001810C(id a1)
{
  _NFRemoteAdminManager *v1;
  void *v2;

  v1 = objc_alloc_init(_NFRemoteAdminManager);
  v2 = (void *)qword_10005C3B8;
  qword_10005C3B8 = (uint64_t)v1;

}

void sub_100018CD0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 184));
  _Unwind_Resume(a1);
}

void sub_100018CF4(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  _QWORD *WeakRetained;
  const char *v7;
  nw_path_status_t status;
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
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
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
  uint64_t v48;
  objc_class *v49;
  _BOOL4 v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  objc_class *v55;
  int v56;
  const char *v57;
  const char *v58;
  const char *ClassName;
  const char *v60;
  const char *v61;
  const char *v62;
  const char *Name;
  const char *v64;
  const char *v65;
  const char *v66;
  uint8_t buf[4];
  int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  const char *v76;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    switch(a3)
    {
      case 1:
        v7 = "WiFi";
        break;
      case 2:
        v7 = "Cellular";
        break;
      case 4:
        v7 = "Wired";
        break;
      case 8:
        v7 = "Other";
        break;
      default:
        v7 = "Unknown";
        break;
    }
    status = nw_path_get_status(v5);
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    v11 = (void (*)(uint64_t, const char *, ...))Logger;
    if (status == nw_path_status_satisfied)
    {
      if (Logger)
      {
        Class = object_getClass(WeakRetained);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(WeakRetained);
        Name = sel_getName(*(SEL *)(a1 + 40));
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v11(6, "%c[%{public}s %{public}s]:%i %s is enabled", v14, ClassName, Name, 347, v7);
      }
      v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v16 = NFSharedLogGetLogger(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = object_getClass(WeakRetained);
        if (class_isMetaClass(v18))
          v19 = 43;
        else
          v19 = 45;
        v20 = object_getClassName(WeakRetained);
        v21 = sel_getName(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 67110146;
        v68 = v19;
        v69 = 2082;
        v70 = v20;
        v71 = 2082;
        v72 = v21;
        v73 = 1024;
        v74 = 347;
        v75 = 2080;
        v76 = v7;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %s is enabled", buf, 0x2Cu);
      }

      if (nw_path_is_constrained(v5))
      {
        v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v23 = NFLogGetLogger(v22);
        if (v23)
        {
          v24 = (void (*)(uint64_t, const char *, ...))v23;
          v25 = object_getClass(WeakRetained);
          v26 = class_isMetaClass(v25);
          v60 = object_getClassName(WeakRetained);
          v64 = sel_getName(*(SEL *)(a1 + 40));
          v27 = 45;
          if (v26)
            v27 = 43;
          v24(6, "%c[%{public}s %{public}s]:%i %s network is constrained", v27, v60, v64, 350, v7);
        }
        v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v29 = NFSharedLogGetLogger(v28);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = object_getClass(WeakRetained);
          if (class_isMetaClass(v31))
            v32 = 43;
          else
            v32 = 45;
          v33 = object_getClassName(WeakRetained);
          v34 = sel_getName(*(SEL *)(a1 + 40));
          *(_DWORD *)buf = 67110146;
          v68 = v32;
          v69 = 2082;
          v70 = v33;
          v71 = 2082;
          v72 = v34;
          v73 = 1024;
          v74 = 350;
          v75 = 2080;
          v76 = v7;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %s network is constrained", buf, 0x2Cu);
        }

      }
      if (nw_path_is_expensive(v5))
      {
        v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v36 = NFLogGetLogger(v35);
        if (v36)
        {
          v37 = (void (*)(uint64_t, const char *, ...))v36;
          v38 = object_getClass(WeakRetained);
          v39 = class_isMetaClass(v38);
          v61 = object_getClassName(WeakRetained);
          v65 = sel_getName(*(SEL *)(a1 + 40));
          v40 = 45;
          if (v39)
            v40 = 43;
          v37(6, "%c[%{public}s %{public}s]:%i %s network is expensive", v40, v61, v65, 354, v7);
        }
        v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v42 = NFSharedLogGetLogger(v41);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = object_getClass(WeakRetained);
          if (class_isMetaClass(v44))
            v45 = 43;
          else
            v45 = 45;
          v46 = object_getClassName(WeakRetained);
          v47 = sel_getName(*(SEL *)(a1 + 40));
          *(_DWORD *)buf = 67110146;
          v68 = v45;
          v69 = 2082;
          v70 = v46;
          v71 = 2082;
          v72 = v47;
          v73 = 1024;
          v74 = 354;
          v75 = 2080;
          v76 = v7;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %s network is expensive", buf, 0x2Cu);
        }

      }
      v48 = WeakRetained[27];
      WeakRetained[27] = v48 | a3;
      if ((v48 & a3) == 0)
        sub_1000172F4((unsigned __int8 *)WeakRetained);
    }
    else
    {
      if (Logger)
      {
        v49 = object_getClass(WeakRetained);
        v50 = class_isMetaClass(v49);
        v62 = object_getClassName(WeakRetained);
        v66 = sel_getName(*(SEL *)(a1 + 40));
        v51 = 45;
        if (v50)
          v51 = 43;
        v11(6, "%c[%{public}s %{public}s]:%i %s is disabled", v51, v62, v66, 366, v7);
      }
      v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v53 = NFSharedLogGetLogger(v52);
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = object_getClass(WeakRetained);
        if (class_isMetaClass(v55))
          v56 = 43;
        else
          v56 = 45;
        v57 = object_getClassName(WeakRetained);
        v58 = sel_getName(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 67110146;
        v68 = v56;
        v69 = 2082;
        v70 = v57;
        v71 = 2082;
        v72 = v58;
        v73 = 1024;
        v74 = 366;
        v75 = 2080;
        v76 = v7;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %s is disabled", buf, 0x2Cu);
      }

      WeakRetained[27] &= ~a3;
    }
  }

}

void sub_1000192AC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_activity_scope_state_s v5;

  v3 = a2;
  v4 = _os_activity_create((void *)&_mh_execute_header, "wifiMonitorUpdate", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v4, &v5);
  os_activity_scope_leave(&v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100019334(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_activity_scope_state_s v5;

  v3 = a2;
  v4 = _os_activity_create((void *)&_mh_execute_header, "cellularMonitorUpdate", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v4, &v5);
  os_activity_scope_leave(&v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000193BC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_activity_scope_state_s v5;

  v3 = a2;
  v4 = _os_activity_create((void *)&_mh_execute_header, "wiredMonitorUpdate", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v4, &v5);
  os_activity_scope_leave(&v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100019444(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_activity_scope_state_s v5;

  v3 = a2;
  v4 = _os_activity_create((void *)&_mh_execute_header, "otherMonitorUpdate", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v4, &v5);
  os_activity_scope_leave(&v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000194CC(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
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
  const char *v16;
  const char *v17;
  const char *Name;
  _BYTE state[18];
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;

  v2 = _os_activity_create((void *)&_mh_execute_header, "com.apple.seld.apsInitTimer", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v2, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(WeakRetained);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(WeakRetained);
    Name = sel_getName(*(SEL *)(a1 + 40));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(4, "%c[%{public}s %{public}s]:%i Timeout waiting for APS, initializing APS anyways.", v10, ClassName, Name, 423);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = object_getClass(WeakRetained);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    v16 = object_getClassName(WeakRetained);
    v17 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v15;
    *(_WORD *)&state[8] = 2082;
    *(_QWORD *)&state[10] = v16;
    v20 = 2082;
    v21 = v17;
    v22 = 1024;
    v23 = 423;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Timeout waiting for APS, initializing APS anyways.", state, 0x22u);
  }

  sub_100019698(WeakRetained);
}

void sub_100019698(void *a1)
{
  NSObject *v2;
  id *v3;
  int v4;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v8;
  const char *ClassName;
  const char *Name;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  char v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  id v34;
  int v35;
  void *v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  void (*v49)(uint64_t, const char *, ...);
  objc_class *v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  void *v54;
  uint64_t v55;
  objc_class *v56;
  int v57;
  const char *v58;
  const char *v59;
  _BYTE state[18];
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;

  if (a1)
  {
    v2 = _os_activity_create((void *)&_mh_execute_header, "initAPSCompletionHandler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    *(_QWORD *)state = 0;
    *(_QWORD *)&state[8] = 0;
    os_activity_scope_enter(v2, (os_activity_scope_state_t)state);
    os_activity_scope_leave((os_activity_scope_state_t)state);

    v3 = a1;
    objc_sync_enter(v3);
    v4 = *((unsigned __int8 *)v3 + 56);
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if (v4)
    {
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(v3);
        if (class_isMetaClass(Class))
          v8 = 43;
        else
          v8 = 45;
        ClassName = object_getClassName(v3);
        Name = sel_getName("initAPSCompletionHandler");
        Logger(6, "%c[%{public}s %{public}s]:%i APS has initialized", v8, ClassName, Name, 454);
      }
      v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v12 = NFSharedLogGetLogger(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      v14 = object_getClass(v3);
      if (class_isMetaClass(v14))
        v15 = 43;
      else
        v15 = 45;
      v16 = object_getClassName(v3);
      v17 = sel_getName("initAPSCompletionHandler");
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v15;
      *(_WORD *)&state[8] = 2082;
      *(_QWORD *)&state[10] = v16;
      v61 = 2082;
      v62 = v17;
      v63 = 1024;
      v64 = 454;
      v18 = "%c[%{public}s %{public}s]:%i APS has initialized";
      v19 = v13;
      v20 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (v22)
      {
        v23 = object_getClass(v3);
        if (class_isMetaClass(v23))
          v24 = 43;
        else
          v24 = 45;
        v25 = object_getClassName(v3);
        v26 = sel_getName("initAPSCompletionHandler");
        v22(6, "%c[%{public}s %{public}s]:%i Initializing APS", v24, v25, v26, 458);
      }
      v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v28 = NFSharedLogGetLogger(v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = object_getClass(v3);
        if (class_isMetaClass(v30))
          v31 = 43;
        else
          v31 = 45;
        v32 = object_getClassName(v3);
        v33 = sel_getName("initAPSCompletionHandler");
        *(_DWORD *)state = 67109890;
        *(_DWORD *)&state[4] = v31;
        *(_WORD *)&state[8] = 2082;
        *(_QWORD *)&state[10] = v32;
        v61 = 2082;
        v62 = v33;
        v63 = 1024;
        v64 = 458;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Initializing APS", state, 0x22u);
      }

      *((_BYTE *)v3 + 56) = 1;
      objc_msgSend(v3[8], "stopTimer");
      v34 = v3[8];
      v3[8] = 0;

      v35 = *((unsigned __int8 *)v3 + 8);
      v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if (v35)
      {
        v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v36);
        if (v37)
        {
          v38 = object_getClass(v3);
          if (class_isMetaClass(v38))
            v39 = 43;
          else
            v39 = 45;
          v40 = object_getClassName(v3);
          v41 = sel_getName("initAPSCompletionHandler");
          v37(6, "%c[%{public}s %{public}s]:%i Runnning through delayed XPCs", v39, v40, v41, 464);
        }
        v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v43 = NFSharedLogGetLogger(v42);
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = object_getClass(v3);
          if (class_isMetaClass(v45))
            v46 = 43;
          else
            v46 = 45;
          v47 = object_getClassName(v3);
          v48 = sel_getName("initAPSCompletionHandler");
          *(_DWORD *)state = 67109890;
          *(_DWORD *)&state[4] = v46;
          *(_WORD *)&state[8] = 2082;
          *(_QWORD *)&state[10] = v47;
          v61 = 2082;
          v62 = v48;
          v63 = 1024;
          v64 = 464;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Runnning through delayed XPCs", state, 0x22u);
        }

        objc_msgSend(v3[21], "enumerateObjectsUsingBlock:", &stru_100054968);
        objc_msgSend(v3[21], "removeAllObjects");
        v21 = 0;
        goto LABEL_37;
      }
      v49 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v36);
      if (v49)
      {
        v50 = object_getClass(v3);
        if (class_isMetaClass(v50))
          v51 = 43;
        else
          v51 = 45;
        v52 = object_getClassName(v3);
        v53 = sel_getName("initAPSCompletionHandler");
        v49(4, "%c[%{public}s %{public}s]:%i Skipped delayXPCs processing.", v51, v52, v53, 472);
      }
      v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v55 = NFSharedLogGetLogger(v54);
      v13 = objc_claimAutoreleasedReturnValue(v55);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        v21 = 1;
LABEL_37:
        objc_sync_exit(v3);

        if (!((v4 != 0) | v21 & 1))
          sub_1000172F4((unsigned __int8 *)v3);
        return;
      }
      v56 = object_getClass(v3);
      if (class_isMetaClass(v56))
        v57 = 43;
      else
        v57 = 45;
      v58 = object_getClassName(v3);
      v59 = sel_getName("initAPSCompletionHandler");
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v57;
      *(_WORD *)&state[8] = 2082;
      *(_QWORD *)&state[10] = v58;
      v61 = 2082;
      v62 = v59;
      v63 = 1024;
      v64 = 472;
      v18 = "%c[%{public}s %{public}s]:%i Skipped delayXPCs processing.";
      v19 = v13;
      v20 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, state, 0x22u);
    goto LABEL_14;
  }
}

void sub_100019BE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100019C34(void **a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  NSMutableArray *v9;
  uint64_t v10;
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
  uint64_t v25;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *v27;
  _BOOL4 v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  void *v38;
  uint64_t v39;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *v41;
  _BOOL4 v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  int v48;
  const char *v49;
  const char *v50;
  const char *ClassName;
  const char *v52;
  const char *Name;
  const char *v54;
  const char *v55;
  NSMutableArray *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  NSMutableArray *v70;
  _BYTE v71[128];

  v56 = objc_opt_new(NSMutableArray);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v2 = sub_100036110(a1[3]);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v58 != v7)
          objc_enumerationMutation(v4);
        v9 = *(NSMutableArray **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
        v10 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          -[NSMutableArray addObject:](v56, "addObject:", v9);
        }
        else
        {
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          if (Logger)
          {
            v13 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(a1);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(a1);
            Name = sel_getName("_subscribeToPushTopics");
            v16 = 45;
            if (isMetaClass)
              v16 = 43;
            v13(4, "%c[%{public}s %{public}s]:%i Discarding invalid entry (%{public}@) in registration dictionary", v16, ClassName, Name, 1920, v9);
          }
          v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v18 = NFSharedLogGetLogger(v17);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = object_getClass(a1);
            if (class_isMetaClass(v20))
              v21 = 43;
            else
              v21 = 45;
            v22 = object_getClassName(a1);
            v23 = sel_getName("_subscribeToPushTopics");
            *(_DWORD *)buf = 67110146;
            v62 = v21;
            v63 = 2082;
            v64 = v22;
            v65 = 2082;
            v66 = v23;
            v67 = 1024;
            v68 = 1920;
            v69 = 2114;
            v70 = v9;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Discarding invalid entry (%{public}@) in registration dictionary", buf, 0x2Cu);
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
    }
    while (v6);
  }

  if (!-[NSMutableArray count](v56, "count"))
  {
    v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v25 = NFLogGetLogger(v24);
    if (v25)
    {
      v26 = (void (*)(uint64_t, const char *, ...))v25;
      v27 = object_getClass(a1);
      v28 = class_isMetaClass(v27);
      v29 = object_getClassName(a1);
      v54 = sel_getName("_subscribeToPushTopics");
      v30 = 45;
      if (v28)
        v30 = 43;
      v26(6, "%c[%{public}s %{public}s]:%i No push topics registered, setting fake topic", v30, v29, v54, 1926);
    }
    v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v32 = NFSharedLogGetLogger(v31);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = object_getClass(a1);
      if (class_isMetaClass(v34))
        v35 = 43;
      else
        v35 = 45;
      v36 = object_getClassName(a1);
      v37 = sel_getName("_subscribeToPushTopics");
      *(_DWORD *)buf = 67109890;
      v62 = v35;
      v63 = 2082;
      v64 = v36;
      v65 = 2082;
      v66 = v37;
      v67 = 1024;
      v68 = 1926;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No push topics registered, setting fake topic", buf, 0x22u);
    }

    -[NSMutableArray addObject:](v56, "addObject:", CFSTR("com.apple.seld.fake"));
  }
  v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v39 = NFLogGetLogger(v38);
  if (v39)
  {
    v40 = (void (*)(uint64_t, const char *, ...))v39;
    v41 = object_getClass(a1);
    v42 = class_isMetaClass(v41);
    v52 = object_getClassName(a1);
    v55 = sel_getName("_subscribeToPushTopics");
    v43 = 45;
    if (v42)
      v43 = 43;
    v40(6, "%c[%{public}s %{public}s]:%i Subscribing to push topics: %{public}@", v43, v52, v55, 1930, v56);
  }
  v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v45 = NFSharedLogGetLogger(v44);
  v46 = objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v47 = object_getClass(a1);
    if (class_isMetaClass(v47))
      v48 = 43;
    else
      v48 = 45;
    v49 = object_getClassName(a1);
    v50 = sel_getName("_subscribeToPushTopics");
    *(_DWORD *)buf = 67110146;
    v62 = v48;
    v63 = 2082;
    v64 = v49;
    v65 = 2082;
    v66 = v50;
    v67 = 1024;
    v68 = 1930;
    v69 = 2114;
    v70 = v56;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Subscribing to push topics: %{public}@", buf, 0x2Cu);
  }

  objc_msgSend(a1[6], "_setEnabledTopics:", v56);
}

void sub_10001A14C(id a1, id a2)
{
  (*((void (**)(id))a2 + 2))(a2);
}

id sub_10001A158(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSDateFormatter *v4;
  id v5;
  unsigned int v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];
  _QWORD v19[3];

  v3 = a2;
  if (a1)
  {
    v4 = objc_opt_new(NSDateFormatter);
    v5 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", CFSTR("en_US"));
    -[NSDateFormatter setLocale:](v4, "setLocale:", v5);

    -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss z"));
    v18[0] = CFSTR("APNClientConnected");
    v6 = objc_msgSend(*(id *)(a1 + 48), "isConnected");
    v7 = &off_1000572C8;
    if (v6)
      v7 = &off_1000572B0;
    v19[0] = v7;
    v18[1] = CFSTR("APNTopicsRegistered");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "enabledTopics"));
    if (v8)
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "enabledTopics"));
    else
      v9 = &__NSArray0__struct;
    v19[1] = v9;
    v18[2] = CFSTR("CheckIn");
    if (v3)
      v10 = v3;
    else
      v10 = CFSTR("manual");
    v16[0] = CFSTR("Reason");
    v16[1] = CFSTR("PushRxTime");
    v17[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v4, "stringFromDate:", v11));
    v17[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
    v19[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 3));

    if (v8)
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void sub_10001A420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10001A438(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD handler[6];

  if (a1)
  {
    *(_BYTE *)(a1 + 153) = 1;
    sub_10001A5A4((void *)a1);
    sub_10001A660(a1, 0.0);
    sub_10001A718((void *)a1, (uint64_t)"com.apple.seld.alarm");
    sub_10001A718((void *)a1, (uint64_t)"com.apple.seld.processing");
    sub_10001A718((void *)a1, (uint64_t)"com.apple.seld.osupdate");
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001AA3C;
    handler[3] = &unk_1000549B8;
    handler[4] = a1;
    handler[5] = "_NFLoadSuccess";
    xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
    v2 = *(_QWORD *)(a1 + 104);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10001B2AC;
    v4[3] = &unk_1000549E0;
    v4[4] = a1;
    *(_QWORD *)(a1 + 144) = os_state_add_handler(v2, v4);
    nw_path_monitor_start(*(nw_path_monitor_t *)(a1 + 184));
    nw_path_monitor_start(*(nw_path_monitor_t *)(a1 + 192));
    nw_path_monitor_start(*(nw_path_monitor_t *)(a1 + 200));
    nw_path_monitor_start(*(nw_path_monitor_t *)(a1 + 208));
    sub_1000172F4((unsigned __int8 *)a1);
    *(_BYTE *)(a1 + 8) = 1;
    v3 = *(void **)(a1 + 176);
    *(_QWORD *)(a1 + 176) = 0;

  }
}

void sub_10001A570(_QWORD *a1)
{
  void *v2;

  if (a1)
  {
    v2 = (void *)a1[22];
    a1[22] = 0;

    sub_10001A5A4(a1);
  }
}

void sub_10001A5A4(void *a1)
{
  id v1;
  id v2;
  id *obj;

  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    if (!obj[4])
    {
      v1 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.seld.tsmmanager"));
      v2 = obj[4];
      obj[4] = v1;

      objc_msgSend(obj[4], "setDelegate:");
      objc_msgSend(obj[4], "_setQueue:", obj[9]);
      objc_msgSend(obj[4], "resume");
    }
    objc_sync_exit(obj);

  }
}

void sub_10001A64C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10001A660(uint64_t a1, double a2)
{
  _QWORD *v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD v7[6];

  if (a1)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001D034;
    v7[3] = &unk_100054AA0;
    v7[4] = a1;
    v7[5] = "_initializeWhenSEManagerIsReady:";
    v4 = objc_retainBlock(v7);
    v5 = v4;
    if (a2 == 0.0)
    {
      ((void (*)(_QWORD *))v4[2])(v4);
    }
    else
    {
      v6 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
      dispatch_after(v6, *(dispatch_queue_t *)(a1 + 72), v5);
    }

  }
}

void sub_10001A718(void *a1, uint64_t a2)
{
  void *v3;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  const char *ClassName;
  const char *Name;
  const char *v34;
  id v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;

  if (a1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a2, 4));
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName("cancelNetworkActivityWithName:");
      v9 = 45;
      if (isMetaClass)
        v9 = 43;
      v6(6, "%c[%{public}s %{public}s]:%i Canceling activity [%@]", v9, ClassName, Name, 791, v3);
    }
    v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v11 = NFSharedLogGetLogger(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = object_getClass(a1);
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      *(_DWORD *)buf = 67110146;
      v37 = v14;
      v38 = 2082;
      v39 = object_getClassName(a1);
      v40 = 2082;
      v41 = sel_getName("cancelNetworkActivityWithName:");
      v42 = 1024;
      v43 = 791;
      v44 = 2112;
      v45 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Canceling activity [%@]", buf, 0x2Cu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
    v35 = 0;
    v16 = objc_msgSend(v15, "cancelTaskRequestWithIdentifier:error:", v3, &v35);
    v17 = v35;

    if ((v16 & 1) == 0)
    {
      v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v19 = NFLogGetLogger(v18);
      if (v19)
      {
        v20 = (void (*)(uint64_t, const char *, ...))v19;
        v21 = object_getClass(a1);
        v22 = class_isMetaClass(v21);
        v23 = object_getClassName(a1);
        v34 = sel_getName("cancelNetworkActivityWithName:");
        v24 = 45;
        if (v22)
          v24 = 43;
        v20(3, "%c[%{public}s %{public}s]:%i Error : Failed to cancel task named %@ : %@", v24, v23, v34, 793, v3, v17);
      }
      v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v26 = NFSharedLogGetLogger(v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = object_getClass(a1);
        if (class_isMetaClass(v28))
          v29 = 43;
        else
          v29 = 45;
        v30 = object_getClassName(a1);
        v31 = sel_getName("cancelNetworkActivityWithName:");
        *(_DWORD *)buf = 67110402;
        v37 = v29;
        v38 = 2082;
        v39 = v30;
        v40 = 2082;
        v41 = v31;
        v42 = 1024;
        v43 = 793;
        v44 = 2112;
        v45 = v3;
        v46 = 2112;
        v47 = v17;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error : Failed to cancel task named %@ : %@", buf, 0x36u);
      }

    }
  }
}

void sub_10001AA3C(uint64_t a1, xpc_object_t xdict)
{
  const char *string;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  const char *v23;
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
  uint64_t v34;
  void (*v35)(uint64_t, const char *, ...);
  objc_class *v36;
  _BOOL4 v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  objc_class *v43;
  int v44;
  const char *v45;
  const char *v46;
  void *v47;
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
  const char *ClassName;
  const char *Name;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  _QWORD v80[5];
  uint8_t buf[8];
  _BYTE v82[36];

  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  v6 = (void (*)(uint64_t, const char *, ...))Logger;
  if (string)
  {
    if (Logger)
    {
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      v9 = 45;
      if (isMetaClass)
        v9 = 43;
      v6(6, "%c[%{public}s %{public}s]:%i notif: %s", v9, ClassName, Name, 567, string);
    }
    v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v11 = NFSharedLogGetLogger(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      v15 = object_getClassName(*(id *)(a1 + 32));
      v16 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = v14;
      *(_WORD *)v82 = 2082;
      *(_QWORD *)&v82[2] = v15;
      *(_WORD *)&v82[10] = 2082;
      *(_QWORD *)&v82[12] = v16;
      *(_WORD *)&v82[20] = 1024;
      *(_DWORD *)&v82[22] = 567;
      *(_WORD *)&v82[26] = 2080;
      *(_QWORD *)&v82[28] = string;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i notif: %s", buf, 0x2Cu);
    }

    if (!strncmp("com.apple.nfcd.se.restricted", string, 0x1CuLL))
    {
      v17 = *(void **)(a1 + 32);
      if (v17)
      {
        v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v19 = NFLogGetLogger(v18);
        if (v19)
        {
          v20 = (void (*)(uint64_t, const char *, ...))v19;
          v21 = object_getClass(v17);
          v22 = class_isMetaClass(v21);
          v23 = object_getClassName(v17);
          v76 = sel_getName("restrictedModeEntered:");
          v24 = 45;
          if (v22)
            v24 = 43;
          v20(6, "%c[%{public}s %{public}s]:%i ", v24, v23, v76, 1936);
        }
        v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v26 = NFSharedLogGetLogger(v25);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = object_getClass(v17);
          if (class_isMetaClass(v28))
            v29 = 43;
          else
            v29 = 45;
          v30 = object_getClassName(v17);
          v31 = sel_getName("restrictedModeEntered:");
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v29;
          *(_WORD *)v82 = 2082;
          *(_QWORD *)&v82[2] = v30;
          *(_WORD *)&v82[10] = 2082;
          *(_QWORD *)&v82[12] = v31;
          *(_WORD *)&v82[20] = 1024;
          *(_DWORD *)&v82[22] = 1936;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
        }

        *(_QWORD *)buf = _NSConcreteStackBlock;
        *(_QWORD *)v82 = 3221225472;
        *(_QWORD *)&v82[8] = sub_100029E34;
        *(_QWORD *)&v82[16] = &unk_100054990;
        *(_QWORD *)&v82[24] = v17;
        sub_10001B1E8((uint64_t)v17, buf);
      }
    }
    if (!strncmp("com.apple.nfcd.se.restricted.exit", string, 0x21uLL))
    {
      v32 = *(void **)(a1 + 32);
      if (v32)
      {
        v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v34 = NFLogGetLogger(v33);
        if (v34)
        {
          v35 = (void (*)(uint64_t, const char *, ...))v34;
          v36 = object_getClass(v32);
          v37 = class_isMetaClass(v36);
          v38 = object_getClassName(v32);
          v77 = sel_getName("restrictedModeExited");
          v39 = 45;
          if (v37)
            v39 = 43;
          v35(6, "%c[%{public}s %{public}s]:%i ", v39, v38, v77, 1948);
        }
        v40 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v41 = NFSharedLogGetLogger(v40);
        v42 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = object_getClass(v32);
          if (class_isMetaClass(v43))
            v44 = 43;
          else
            v44 = 45;
          v45 = object_getClassName(v32);
          v46 = sel_getName("restrictedModeExited");
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v44;
          *(_WORD *)v82 = 2082;
          *(_QWORD *)&v82[2] = v45;
          *(_WORD *)&v82[10] = 2082;
          *(_QWORD *)&v82[12] = v46;
          *(_WORD *)&v82[20] = 1024;
          *(_DWORD *)&v82[22] = 1948;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
        }

        *(_QWORD *)buf = _NSConcreteStackBlock;
        *(_QWORD *)v82 = 3221225472;
        *(_QWORD *)&v82[8] = sub_100029E94;
        *(_QWORD *)&v82[16] = &unk_100054990;
        *(_QWORD *)&v82[24] = v32;
        sub_10001B1E8((uint64_t)v32, buf);
      }
    }
    if (!strncmp("com.apple.nfcd.se.restrictedperformance", string, 0x27uLL))
    {
      v47 = *(void **)(a1 + 32);
      if (v47)
      {
        v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v49 = NFLogGetLogger(v48);
        if (v49)
        {
          v50 = (void (*)(uint64_t, const char *, ...))v49;
          v51 = object_getClass(v47);
          v52 = class_isMetaClass(v51);
          v53 = object_getClassName(v47);
          v78 = sel_getName("restrictedPerformanceModeEntered:");
          v54 = 45;
          if (v52)
            v54 = 43;
          v50(6, "%c[%{public}s %{public}s]:%i ", v54, v53, v78, 1961);
        }
        v55 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v56 = NFSharedLogGetLogger(v55);
        v57 = objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          v58 = object_getClass(v47);
          if (class_isMetaClass(v58))
            v59 = 43;
          else
            v59 = 45;
          v60 = object_getClassName(v47);
          v61 = sel_getName("restrictedPerformanceModeEntered:");
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v59;
          *(_WORD *)v82 = 2082;
          *(_QWORD *)&v82[2] = v60;
          *(_WORD *)&v82[10] = 2082;
          *(_QWORD *)&v82[12] = v61;
          *(_WORD *)&v82[20] = 1024;
          *(_DWORD *)&v82[22] = 1961;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
        }

        *(_QWORD *)buf = _NSConcreteStackBlock;
        *(_QWORD *)v82 = 3221225472;
        *(_QWORD *)&v82[8] = sub_100029EF0;
        *(_QWORD *)&v82[16] = &unk_100054990;
        *(_QWORD *)&v82[24] = v47;
        sub_10001B1E8((uint64_t)v47, buf);
      }
    }
    if (!strncmp("com.apple.system.powermanagement.poweradapter", string, 0x2DuLL))
    {
      v62 = *(_QWORD *)(a1 + 32);
      v80[0] = _NSConcreteStackBlock;
      v80[1] = 3221225472;
      v80[2] = sub_10001B1A0;
      v80[3] = &unk_100054990;
      v80[4] = v62;
      sub_10001B1E8(v62, v80);
    }
  }
  else
  {
    if (Logger)
    {
      v63 = object_getClass(*(id *)(a1 + 32));
      v64 = class_isMetaClass(v63);
      v65 = object_getClassName(*(id *)(a1 + 32));
      v79 = sel_getName(*(SEL *)(a1 + 40));
      v66 = 45;
      if (v64)
        v66 = 43;
      v6(6, "%c[%{public}s %{public}s]:%i No event name: skipping", v66, v65, v79, 564);
    }
    v67 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v68 = NFSharedLogGetLogger(v67);
    v69 = objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v70))
        v71 = 43;
      else
        v71 = 45;
      v72 = object_getClassName(*(id *)(a1 + 32));
      v73 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v71;
      *(_WORD *)v82 = 2082;
      *(_QWORD *)&v82[2] = v72;
      *(_WORD *)&v82[10] = 2082;
      *(_QWORD *)&v82[12] = v73;
      *(_WORD *)&v82[20] = 1024;
      *(_DWORD *)&v82[22] = 564;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No event name: skipping", buf, 0x22u);
    }

  }
}

void sub_10001B1A0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 155))
  {
    sub_100017AAC(*(_QWORD *)(a1 + 32));
    if (!*(_BYTE *)(v1 + 155))
      sub_1000172F4(*(unsigned __int8 **)(a1 + 32));
  }
}

void sub_10001B1E8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  if (a1)
  {
    sub_100016F6C(a1);
    sub_10001CC7C(a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v5 = *(NSObject **)(a1 + 104);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002C99C;
    block[3] = &unk_100054D48;
    v8 = v4;
    v9 = a1;
    v10 = v3;
    v6 = v4;
    dispatch_async(v5, block);

  }
}

_DWORD *sub_10001B2AC(uint64_t a1)
{
  void *v1;
  NSMutableDictionary *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;
  _DWORD *v11;
  id v12;

  v1 = *(void **)(a1 + 32);
  if (!v1)
    return 0;
  v2 = objc_opt_new(NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryRepresentation"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v4, CFSTR("seldSettings"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NFPowerAssertion sharedPowerAssertion](NFPowerAssertion, "sharedPowerAssertion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dumpState"));
  -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", v6);

  v7 = v1;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7[21], "count")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v8, CFSTR("QueuedXPC"));

  objc_sync_exit(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v2, 200, 0, 0));
  v10 = objc_msgSend(v9, "length");
  v11 = malloc_type_calloc(1uLL, (size_t)v10 + 200, 0xDFF089CuLL);
  *v11 = 1;
  v11[1] = (_DWORD)v10;
  __strlcpy_chk(v11 + 34, "seld_state", 64, 64);
  v12 = objc_retainAutorelease(v9);
  memcpy(v11 + 50, objc_msgSend(v12, "bytes"), (size_t)v10);

  return v11;
}

void sub_10001B448(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001B45C(void *a1)
{
  NSObject *v2;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v6;
  const char *ClassName;
  const char *Name;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  id *v16;
  void *v17;
  void *v18;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  _QWORD v31[6];
  _BYTE state[18];
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;

  if (a1)
  {
    v2 = _os_activity_create((void *)&_mh_execute_header, "start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    *(_QWORD *)state = 0;
    *(_QWORD *)&state[8] = 0;
    os_activity_scope_enter(v2, (os_activity_scope_state_t)state);
    os_activity_scope_leave((os_activity_scope_state_t)state);

    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(a1);
      if (class_isMetaClass(Class))
        v6 = 43;
      else
        v6 = 45;
      ClassName = object_getClassName(a1);
      Name = sel_getName("start");
      Logger(6, "%c[%{public}s %{public}s]:%i Seld started", v6, ClassName, Name, 610);
    }
    v9 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v10 = NFSharedLogGetLogger(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = object_getClass(a1);
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(a1);
      v15 = sel_getName("start");
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v13;
      *(_WORD *)&state[8] = 2082;
      *(_QWORD *)&state[10] = v14;
      v33 = 2082;
      v34 = v15;
      v35 = 1024;
      v36 = 610;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Seld started", state, 0x22u);
    }

    v16 = a1;
    objc_sync_enter(v16);
    if (!*((_BYTE *)v16 + 8))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NFPowerAssertion sharedPowerAssertion](NFPowerAssertion, "sharedPowerAssertion"));
      objc_msgSend(v17, "setEnableDebug:", NFIsInternalBuild());

      if ((objc_msgSend(v16[5], "registerForEvents") & 1) == 0)
      {
        v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v18);
        if (v19)
        {
          v20 = object_getClass(v16);
          if (class_isMetaClass(v20))
            v21 = 43;
          else
            v21 = 45;
          v22 = object_getClassName(v16);
          v23 = sel_getName("start");
          v19(3, "%c[%{public}s %{public}s]:%i Failed to register for power events", v21, v22, v23, 618);
        }
        v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v25 = NFSharedLogGetLogger(v24);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = object_getClass(v16);
          if (class_isMetaClass(v27))
            v28 = 43;
          else
            v28 = 45;
          v29 = object_getClassName(v16);
          v30 = sel_getName("start");
          *(_DWORD *)state = 67109890;
          *(_DWORD *)&state[4] = v28;
          *(_WORD *)&state[8] = 2082;
          *(_QWORD *)&state[10] = v29;
          v33 = 2082;
          v34 = v30;
          v35 = 1024;
          v36 = 618;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to register for power events", state, 0x22u);
        }

      }
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10001B7E0;
      v31[3] = &unk_100054A08;
      v31[4] = v16;
      v31[5] = "start";
      +[NFHardwareManager sharedHardwareManager:](NFHardwareManager, "sharedHardwareManager:", v31);
    }
    objc_sync_exit(v16);

  }
}

void sub_10001B7B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001B7E0(uint64_t a1, void *a2)
{
  id v3;
  unsigned int v4;
  int i;
  _BYTE *v6;
  void *v7;
  id v8;
  void *v9;
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
  const char *v21;
  const char *v22;
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
  uint64_t v51;
  uint64_t v52;
  void *v53;
  unsigned __int8 v54;
  unsigned __int8 v55;
  const char *ClassName;
  const char *Name;
  const char *v58;
  const char *v59;
  id v60;
  id v61;
  uint8_t buf[4];
  int v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  int v69;
  __int16 v70;
  id v71;

  v3 = a2;
  v4 = objc_msgSend(v3, "getHwSupport");
  if (v4 != 4)
  {
    if (v4 != 2)
    {
      objc_msgSend(v3, "registerEventListener:", *(_QWORD *)(a1 + 32));
      v51 = os_transaction_create("com.apple.seld.pendingInit");
      v52 = *(_QWORD *)(a1 + 32);
      v53 = *(void **)(v52 + 176);
      *(_QWORD *)(v52 + 176) = v51;

      goto LABEL_48;
    }
    v60 = v3;
    for (i = 29; ; --i)
    {
      v6 = *(_BYTE **)(a1 + 32);
      if (v6)
      {
        v61 = 0;
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", &v61));
        v8 = v61;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info"));

        if (v9)
        {
          if (v6[9])
            v54 = 1;
          else
            v54 = objc_msgSend(v9, "restrictedMode");
          v3 = v60;
          v6[9] = v54;
          if (v6[10])
            v55 = 1;
          else
            v55 = objc_msgSend(v9, "restrictedPerformanceMode");
          v6[10] = v55;

          sub_10001A438(*(_QWORD *)(a1 + 32));
          goto LABEL_48;
        }
        if (v8)
        {
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          if (Logger)
          {
            v12 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(v6);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(v6);
            Name = sel_getName("_validateESE");
            v15 = 45;
            if (isMetaClass)
              v15 = 43;
            v12(4, "%c[%{public}s %{public}s]:%i Failed to be eSE - %{public}@", v15, ClassName, Name, 849, v8);
          }
          v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v17 = NFSharedLogGetLogger(v16);
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = object_getClass(v6);
            if (class_isMetaClass(v19))
              v20 = 43;
            else
              v20 = 45;
            v21 = object_getClassName(v6);
            v22 = sel_getName("_validateESE");
            *(_DWORD *)buf = 67110146;
            v63 = v20;
            v64 = 2082;
            v65 = v21;
            v66 = 2082;
            v67 = v22;
            v68 = 1024;
            v69 = 849;
            v70 = 2114;
            v71 = v8;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to be eSE - %{public}@", buf, 0x2Cu);
          }

        }
      }
      if (!i)
      {
        sub_10001A570(*(_QWORD **)(a1 + 32));
        v3 = v60;
        goto LABEL_48;
      }
      v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v24 = NFLogGetLogger(v23);
      if (v24)
      {
        v25 = (void (*)(uint64_t, const char *, ...))v24;
        v26 = object_getClass(*(id *)(a1 + 32));
        v27 = class_isMetaClass(v26);
        v28 = object_getClassName(*(id *)(a1 + 32));
        v58 = sel_getName(*(SEL *)(a1 + 40));
        v29 = 45;
        if (v27)
          v29 = 43;
        v25(3, "%c[%{public}s %{public}s]:%i Failed to query JCOP, delaying check by %d seconds", v29, v28, v58, 636, 2);
      }
      v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v31 = NFSharedLogGetLogger(v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v33))
          v34 = 43;
        else
          v34 = 45;
        v35 = object_getClassName(*(id *)(a1 + 32));
        v36 = sel_getName(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 67110146;
        v63 = v34;
        v64 = 2082;
        v65 = v35;
        v66 = 2082;
        v67 = v36;
        v68 = 1024;
        v69 = 636;
        v70 = 1024;
        LODWORD(v71) = 2;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to query JCOP, delaying check by %d seconds", buf, 0x28u);
      }

      sleep(2u);
    }
  }
  v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v38 = NFLogGetLogger(v37);
  if (v38)
  {
    v39 = (void (*)(uint64_t, const char *, ...))v38;
    v40 = object_getClass(*(id *)(a1 + 32));
    v41 = class_isMetaClass(v40);
    v42 = object_getClassName(*(id *)(a1 + 32));
    v59 = sel_getName(*(SEL *)(a1 + 40));
    v43 = 45;
    if (v41)
      v43 = 43;
    v39(3, "%c[%{public}s %{public}s]:%i nfc not supported, bailing.", v43, v42, v59, 625);
  }
  v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v45 = NFSharedLogGetLogger(v44);
  v46 = objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    v47 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v47))
      v48 = 43;
    else
      v48 = 45;
    v49 = object_getClassName(*(id *)(a1 + 32));
    v50 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67109890;
    v63 = v48;
    v64 = 2082;
    v65 = v49;
    v66 = 2082;
    v67 = v50;
    v68 = 1024;
    v69 = 625;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i nfc not supported, bailing.", buf, 0x22u);
  }

  sub_10001A570(*(_QWORD **)(a1 + 32));
LABEL_48:

}

void sub_10001BCDC(void *a1)
{
  NSObject *v2;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v6;
  const char *ClassName;
  const char *Name;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  id *v30;
  id v31;
  _BYTE state[18];
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;

  if (!a1)
    return;
  v2 = _os_activity_create((void *)&_mh_execute_header, "stop", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v2, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
  {
    Class = object_getClass(a1);
    if (class_isMetaClass(Class))
      v6 = 43;
    else
      v6 = 45;
    ClassName = object_getClassName(a1);
    Name = sel_getName("stop");
    Logger(6, "%c[%{public}s %{public}s]:%i Seld stopping", v6, ClassName, Name, 655);
  }
  v9 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v10 = NFSharedLogGetLogger(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = object_getClass(a1);
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(a1);
    v15 = sel_getName("stop");
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v13;
    *(_WORD *)&state[8] = 2082;
    *(_QWORD *)&state[10] = v14;
    v33 = 2082;
    v34 = v15;
    v35 = 1024;
    v36 = 655;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Seld stopping", state, 0x22u);
  }

  v16 = a1;
  objc_sync_enter(v16);
  v17 = sub_10001C04C(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  if (v18)
  {
    if (objc_msgSend(v18, "pendingImmediateRetry"))
      goto LABEL_21;
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "retryInterval"));
    v21 = (void *)v20;
    if (v20)
      v22 = *(void **)(v20 + 16);
    else
      v22 = 0;
    v23 = v22;

    if (!v23)
      goto LABEL_22;
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "retryInterval"));
    v25 = (void *)v24;
    v26 = v24 ? *(void **)(v24 + 16) : 0;
    v27 = v26;
    objc_msgSend(v27, "timeIntervalSinceNow");
    v29 = v28;

    if (v29 <= 120.0)
LABEL_21:
      sub_10001C4C0(v16, (uint64_t)"com.apple.seld.processing", 120.0);
    else
      sub_10001C9A0(v16, v19);
  }
LABEL_22:
  if (*((_BYTE *)v16 + 8))
  {
    nw_path_monitor_cancel(*((nw_path_monitor_t *)v16 + 23));
    nw_path_monitor_cancel(*((nw_path_monitor_t *)v16 + 24));
    nw_path_monitor_cancel(*((nw_path_monitor_t *)v16 + 25));
    nw_path_monitor_cancel(*((nw_path_monitor_t *)v16 + 26));
    objc_msgSend(*((id *)v16 + 5), "unregisterForEvents");
    objc_msgSend(*((id *)v16 + 12), "abort:", 3);
    v30 = (id *)v16;
    objc_sync_enter(v30);
    objc_msgSend(v30[4], "suspend");
    objc_msgSend(v30[4], "invalidate");
    objc_msgSend(v30[4], "setDelegate:", 0);
    v31 = v30[4];
    v30[4] = 0;

    objc_sync_exit(v30);
    *((_BYTE *)v16 + 8) = 0;
  }

  objc_sync_exit(v16);
}

void sub_10001C018(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10001C04C(void *a1)
{
  void **v1;
  id v2;
  void *v3;
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _BOOL4 v14;
  const char *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _BOOL4 v21;
  id v22;
  _QWORD *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  BOOL v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  _BOOL4 v45;
  id v46;
  _QWORD *v47;
  id v48;
  id v49;
  void **v51;
  id obj;
  id obja;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];

  v1 = a1;
  objc_sync_enter(v1);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v51 = v1;
  v2 = sub_10003956C(v1[3]);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v59;
    obj = v3;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v59 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)v9);
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "retryInterval", v51));

        v6 = (_QWORD *)v11;
        if ((objc_msgSend(v10, "pendingImmediateRetry") & 1) != 0)
        {
          v25 = v10;

          goto LABEL_31;
        }
        if (v11)
          v12 = *(void **)(v11 + 16);
        else
          v12 = 0;
        v13 = v12;
        v14 = v13 == 0;

        if (v14)
        {
          if (v11)
            *(_QWORD *)(v11 + 8) = 0;
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          if (v6)
            objc_setProperty_nonatomic_copy(v6, v15, v16, 16);

          objc_msgSend(v10, "updateNextRetryInterval:", v6);
          objc_msgSend(v10, "save");
        }
        if (!v7
          || (!v5 ? (v17 = 0) : (v17 = (void *)v5[2]),
              (v18 = v17, !v6) ? (v19 = 0) : (v19 = (void *)v6[2]),
              v20 = v19,
              v21 = objc_msgSend(v18, "compare:", v20) == (id)1,
              v20,
              v18,
              v21))
        {
          v22 = v10;

          v23 = v6;
          v5 = v23;
          v7 = v22;
        }
        v9 = (char *)v9 + 1;
      }
      while (v4 != v9);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      v4 = v24;
    }
    while (v24);

    if (!v7)
      goto LABEL_33;
    v7 = v7;
    v25 = v7;
LABEL_31:
    objc_sync_exit(v51);

  }
  else
  {

    v6 = 0;
    v5 = 0;
LABEL_33:
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v26 = sub_1000388B4(v51[3]);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = 0;
    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v55;
      obja = v27;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v55 != v30)
            objc_enumerationMutation(obja);
          v32 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v31);
          v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "retryInterval", v51));

          v6 = (_QWORD *)v33;
          if (objc_msgSend(v32, "pendingImmediateRetry"))
          {
            v49 = v32;

            v28 = v49;
            v27 = obja;
            goto LABEL_58;
          }
          if (v33)
            v34 = *(void **)(v33 + 16);
          else
            v34 = 0;
          v35 = v34;
          v36 = v35 == 0;

          if (!v36)
          {
            v37 = v51[3];
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "serverIdentifier"));
            v39 = sub_100037538(v37, v38);
            v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
            LOBYTE(v37) = v40 == 0;

            if ((v37 & 1) == 0)
            {
              if (!v28
                || (!v5 ? (v41 = 0) : (v41 = (void *)v5[2]),
                    (v42 = v41, !v6) ? (v43 = 0) : (v43 = (void *)v6[2]),
                    v44 = v43,
                    v45 = objc_msgSend(v42, "compare:", v44) == (id)1,
                    v44,
                    v42,
                    v45))
              {
                v46 = v32;

                v47 = v6;
                v5 = v47;
                v28 = v46;
              }
            }
          }
          v31 = (char *)v31 + 1;
        }
        while (v29 != v31);
        v27 = obja;
        v48 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        v29 = v48;
      }
      while (v48);
    }
LABEL_58:

    objc_sync_exit(v51);
    v7 = v28;
    v25 = v7;
  }

  return v25;
}

void sub_10001C490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10001C4C0(void *a1, uint64_t a2, double a3)
{
  void *v5;
  unint64_t v6;
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
  void *v19;
  void *v20;
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
  const char *v33;
  const char *v34;
  id v35;
  id v36;
  void *v37;
  unsigned __int8 v38;
  void *v39;
  uint64_t v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  _BOOL4 v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  const char *Name;
  const char *v53;
  const char *v54;
  id v55;
  uint8_t buf[4];
  int v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  unint64_t v67;

  if (a1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a2, 4));
    v6 = vcvtpd_u64_f64(a3);
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName("scheduleForNetworkActivityWithName:timeDelayInSeconds:");
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v9(6, "%c[%{public}s %{public}s]:%i Scheduling [%@] for %lld seconds ", v13, ClassName, Name, 764, v5, v6);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = object_getClass(a1);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67110402;
      v57 = v18;
      v58 = 2082;
      v59 = object_getClassName(a1);
      v60 = 2082;
      v61 = sel_getName("scheduleForNetworkActivityWithName:timeDelayInSeconds:");
      v62 = 1024;
      v63 = 764;
      v64 = 2112;
      v65 = v5;
      v66 = 2048;
      v67 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Scheduling [%@] for %lld seconds ", buf, 0x36u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "taskRequestForIdentifier:", v5));

    if (v20)
    {
      v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v22 = NFLogGetLogger(v21);
      if (v22)
      {
        v23 = (void (*)(uint64_t, const char *, ...))v22;
        v24 = object_getClass(a1);
        v25 = class_isMetaClass(v24);
        v26 = object_getClassName(a1);
        v53 = sel_getName("scheduleForNetworkActivityWithName:timeDelayInSeconds:");
        v27 = 45;
        if (v25)
          v27 = 43;
        v23(4, "%c[%{public}s %{public}s]:%i Warning : activity already scheduled..", v27, v26, v53, 769);
      }
      v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v29 = NFSharedLogGetLogger(v28);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = object_getClass(a1);
        if (class_isMetaClass(v31))
          v32 = 43;
        else
          v32 = 45;
        v33 = object_getClassName(a1);
        v34 = sel_getName("scheduleForNetworkActivityWithName:timeDelayInSeconds:");
        *(_DWORD *)buf = 67109890;
        v57 = v32;
        v58 = 2082;
        v59 = v33;
        v60 = 2082;
        v61 = v34;
        v62 = 1024;
        v63 = 769;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Warning : activity already scheduled..", buf, 0x22u);
      }
      v35 = 0;
      v36 = 0;
    }
    else
    {
      v36 = objc_msgSend(objc_alloc((Class)BGNonRepeatingSystemTaskRequest), "initWithIdentifier:", v5);
      objc_msgSend(v36, "setRequiresNetworkConnectivity:", 1);
      objc_msgSend(v36, "setRequiresExternalPower:", 0);
      objc_msgSend(v36, "setScheduleAfter:", a3);
      objc_msgSend(v36, "setRequiresProtectionClass:", 4);
      objc_msgSend(v36, "setPriority:", 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
      v55 = 0;
      v38 = objc_msgSend(v37, "submitTaskRequest:error:", v36, &v55);
      v35 = v55;

      if ((v38 & 1) != 0)
        goto LABEL_23;
      v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v40 = NFLogGetLogger(v39);
      if (v40)
      {
        v41 = (void (*)(uint64_t, const char *, ...))v40;
        v42 = object_getClass(a1);
        v43 = class_isMetaClass(v42);
        v44 = object_getClassName(a1);
        v54 = sel_getName("scheduleForNetworkActivityWithName:timeDelayInSeconds:");
        v45 = 45;
        if (v43)
          v45 = 43;
        v41(3, "%c[%{public}s %{public}s]:%i Error : Failed to schedule task named %@ : %@", v45, v44, v54, 781, v5, v35);
      }
      v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v47 = NFSharedLogGetLogger(v46);
      v30 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v48 = object_getClass(a1);
        if (class_isMetaClass(v48))
          v49 = 43;
        else
          v49 = 45;
        v50 = object_getClassName(a1);
        v51 = sel_getName("scheduleForNetworkActivityWithName:timeDelayInSeconds:");
        *(_DWORD *)buf = 67110402;
        v57 = v49;
        v58 = 2082;
        v59 = v50;
        v60 = 2082;
        v61 = v51;
        v62 = 1024;
        v63 = 781;
        v64 = 2112;
        v65 = v5;
        v66 = 2112;
        v67 = (unint64_t)v35;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error : Failed to schedule task named %@ : %@", buf, 0x36u);
      }
    }

LABEL_23:
  }
}

void sub_10001C9A0(void *a1, void *a2)
{
  id v3;
  id v4;
  void *specific;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v9;
  const char *ClassName;
  const char *Name;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  double v33;
  uint64_t v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  void *v46;

  v3 = a2;
  v4 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v4, "setDateFormat:", CFSTR("dd.MM.YY HH:mm:ss"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(a1);
    if (class_isMetaClass(Class))
      v9 = 43;
    else
      v9 = 45;
    v34 = v9;
    ClassName = object_getClassName(a1);
    Name = sel_getName("scheduleCheckIn:");
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "retryInterval"));
    v13 = (void *)v12;
    if (v12)
      v14 = *(void **)(v12 + 16);
    else
      v14 = 0;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate:", v15));
    v7(6, "%c[%{public}s %{public}s]:%i Scheduling retry alarm (%s) for: %{public}@", v34, ClassName, Name, 802, "com.apple.seld.alarm", v16);

  }
  v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = NFSharedLogGetLogger(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = object_getClass(a1);
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    v22 = object_getClassName(a1);
    v23 = sel_getName("scheduleCheckIn:");
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "retryInterval"));
    v25 = (void *)v24;
    if (v24)
      v26 = *(void **)(v24 + 16);
    else
      v26 = 0;
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate:", v27));
    *(_DWORD *)buf = 67110402;
    v36 = v21;
    v37 = 2082;
    v38 = v22;
    v39 = 2082;
    v40 = v23;
    v41 = 1024;
    v42 = 802;
    v43 = 2080;
    v44 = "com.apple.seld.alarm";
    v45 = 2114;
    v46 = v28;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Scheduling retry alarm (%s) for: %{public}@", buf, 0x36u);

  }
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "retryInterval"));
  v30 = (void *)v29;
  if (v29)
    v31 = *(void **)(v29 + 16);
  else
    v31 = 0;
  v32 = v31;
  objc_msgSend(v32, "timeIntervalSinceNow");
  sub_10001C4C0(a1, (uint64_t)"com.apple.seld.alarm", v33);

}

void sub_10001CC7C(uint64_t a1)
{
  id v1;

  if (a1)
  {
    v1 = (id)objc_claimAutoreleasedReturnValue(+[NFPowerAssertion sharedPowerAssertion](NFPowerAssertion, "sharedPowerAssertion"));
    objc_msgSend(v1, "holdPowerAssertion:", CFSTR("RemoteAdmin"));

  }
}

void sub_10001CCC0(uint64_t a1)
{
  id v1;

  if (a1)
  {
    v1 = (id)objc_claimAutoreleasedReturnValue(+[NFPowerAssertion sharedPowerAssertion](NFPowerAssertion, "sharedPowerAssertion"));
    objc_msgSend(v1, "releasePowerAssertion:", CFSTR("RemoteAdmin"));

  }
}

void sub_10001CD04(void *a1)
{
  if (a1)
  {
    sub_10001A718(a1, (uint64_t)"com.apple.seld.processing");
    sub_10001C4C0(a1, (uint64_t)"com.apple.seld.processing", 120.0);
  }
}

void sub_10001CD48(uint64_t a1)
{
  NSObject *v2;
  unsigned __int8 *v3;
  os_activity_scope_state_s v4;

  v2 = _os_activity_create((void *)&_mh_execute_header, "com.apple.seld.alarmtriggered", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  sub_10001A718(*(void **)(a1 + 32), (uint64_t)"com.apple.seld.alarm");
  v3 = *(unsigned __int8 **)(a1 + 32);
  if (v3[8])
    sub_1000172F4(v3);
}

id sub_10001CDC8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v8 = *(_QWORD *)(a1 + 104);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001CF8C;
  v12[3] = &unk_100054A50;
  v9 = v5;
  v13 = v9;
  v10 = objc_msgSend(v7, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v6, v8, v12);

  return v10;
}

void sub_10001CE8C(uint64_t a1)
{
  NSObject *v2;
  unsigned __int8 *v3;
  os_activity_scope_state_s v4;

  v2 = _os_activity_create((void *)&_mh_execute_header, "com.apple.seld.processingtriggered", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  sub_10001A718(*(void **)(a1 + 32), (uint64_t)"com.apple.seld.processing");
  v3 = *(unsigned __int8 **)(a1 + 32);
  if (v3[8])
    sub_1000172F4(v3);
}

void sub_10001CF0C(uint64_t a1)
{
  NSObject *v2;
  unsigned __int8 *v3;
  os_activity_scope_state_s v4;

  v2 = _os_activity_create((void *)&_mh_execute_header, "com.apple.seld.osupdatetriggered", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  sub_10001A718(*(void **)(a1 + 32), (uint64_t)"com.apple.seld.osupdate");
  v3 = *(unsigned __int8 **)(a1 + 32);
  if (v3[8])
    sub_1000172F4(v3);
}

void sub_10001CF8C(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setExpirationHandler:", &stru_100054A28);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v3, "setTaskCompleted");

}

void sub_10001CFE0(uint64_t a1)
{
  id v1;

  if (a1)
  {
    v1 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.stockholm"));
    byte_10005C3E8 = objc_msgSend(v1, "BOOLForKey:", CFSTR("LogTSM"));

  }
}

void sub_10001D034(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001D0B4;
  v4[3] = &unk_100054A78;
  v5 = *(_OWORD *)(a1 + 32);
  v3 = objc_msgSend(v2, "startSecureElementManagerSessionWithPriority:", v4);

}

void sub_10001D0B4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
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
  const char *v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  void *specific;
  uint64_t Logger;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  int v48;
  const char *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  const char *Name;
  _QWORD block[5];
  uint8_t buf[4];
  int v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  void *v65;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "code") == (id)32)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v39 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(*(id *)(a1 + 32));
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 40));
        v43 = 45;
        if (isMetaClass)
          v43 = 43;
        v39(3, "%c[%{public}s %{public}s]:%i Unexpected entitlement issue", v43, ClassName, Name, 887);
      }
      v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v45 = NFSharedLogGetLogger(v44);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v47))
          v48 = 43;
        else
          v48 = 45;
        v49 = object_getClassName(*(id *)(a1 + 32));
        v50 = sel_getName(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 67109890;
        v57 = v48;
        v58 = 2082;
        v59 = v49;
        v60 = 2082;
        v61 = v50;
        v62 = 1024;
        v63 = 887;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected entitlement issue", buf, 0x22u);
      }

      exit(1);
    }
    if (objc_msgSend(v7, "code") == (id)7 || objc_msgSend(v7, "code") == (id)13)
    {
      sub_10001A660(*(_QWORD *)(a1 + 32), 5.0);
      goto LABEL_26;
    }
    v8 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v9 = NFLogGetLogger(v8);
    if (v9)
    {
      v10 = (void (*)(uint64_t, const char *, ...))v9;
      v11 = object_getClass(*(id *)(a1 + 32));
      v12 = class_isMetaClass(v11);
      v51 = object_getClassName(*(id *)(a1 + 32));
      v52 = sel_getName(*(SEL *)(a1 + 40));
      v13 = 45;
      if (v12)
        v13 = 43;
      v10(4, "%c[%{public}s %{public}s]:%i Permissible error: %{public}@", v13, v51, v52, 899, v7);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      v19 = object_getClassName(*(id *)(a1 + 32));
      v20 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67110146;
      v57 = v18;
      v58 = 2082;
      v59 = v19;
      v60 = 2082;
      v61 = v20;
      v62 = 1024;
      v63 = 899;
      v64 = 2114;
      v65 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Permissible error: %{public}@", buf, 0x2Cu);
    }

  }
  objc_msgSend(v5, "endSession");
  v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v22 = NFLogGetLogger(v21);
  if (v22)
  {
    v23 = (void (*)(uint64_t, const char *, ...))v22;
    v24 = object_getClass(*(id *)(a1 + 32));
    v25 = class_isMetaClass(v24);
    v26 = object_getClassName(*(id *)(a1 + 32));
    v53 = sel_getName(*(SEL *)(a1 + 40));
    v27 = 45;
    if (v25)
      v27 = 43;
    v23(6, "%c[%{public}s %{public}s]:%i secure element session is ready, initializing APS", v27, v26, v53, 903);
  }
  v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v29 = NFSharedLogGetLogger(v28);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v31))
      v32 = 43;
    else
      v32 = 45;
    v33 = object_getClassName(*(id *)(a1 + 32));
    v34 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67109890;
    v57 = v32;
    v58 = 2082;
    v59 = v33;
    v60 = 2082;
    v61 = v34;
    v62 = 1024;
    v63 = 903;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i secure element session is ready, initializing APS", buf, 0x22u);
  }

  v35 = *(_QWORD *)(a1 + 32);
  v36 = *(NSObject **)(v35 + 80);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D524;
  block[3] = &unk_100054990;
  block[4] = v35;
  dispatch_async(v36, block);
LABEL_26:

}

void sub_10001D524(uint64_t a1)
{
  uint64_t v1;
  void *specific;
  uint64_t Logger;
  void (*v4)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void (*v22)(uint64_t, const char *, ...);
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  objc_class *v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  const char *Name;
  id location;
  uint8_t v36[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  uint8_t buf[8];
  _BYTE v45[26];
  const char *v46;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v4 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass((id)v1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName((id)v1);
      Name = sel_getName("initAPS");
      v8 = 45;
      if (isMetaClass)
        v8 = 43;
      v4(6, "%c[%{public}s %{public}s]:%i APS init", v8, ClassName, Name, 415);
    }
    v9 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v10 = NFSharedLogGetLogger(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = object_getClass((id)v1);
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v13;
      *(_WORD *)v45 = 2082;
      *(_QWORD *)&v45[2] = object_getClassName((id)v1);
      *(_WORD *)&v45[10] = 2082;
      *(_QWORD *)&v45[12] = sel_getName("initAPS");
      *(_WORD *)&v45[20] = 1024;
      *(_DWORD *)&v45[22] = 415;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i APS init", buf, 0x22u);
    }

    objc_initWeak(&location, (id)v1);
    *(_BYTE *)(v1 + 56) = 0;
    v14 = objc_alloc((Class)NFTimer);
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)v45 = 3221225472;
    *(_QWORD *)&v45[8] = sub_1000194CC;
    *(_QWORD *)&v45[16] = &unk_100054928;
    objc_copyWeak((id *)&v45[24], &location);
    v46 = "initAPS";
    v15 = objc_msgSend(v14, "initWithCallback:queue:", buf, *(_QWORD *)(v1 + 104));
    v16 = *(void **)(v1 + 64);
    *(_QWORD *)(v1 + 64) = v15;

    objc_msgSend(*(id *)(v1 + 64), "startTimer:", 12.0);
    v17 = objc_alloc((Class)APSConnection);
    v18 = objc_msgSend(v17, "initWithEnvironmentName:namedDelegatePort:queue:", APSEnvironmentProduction, CFSTR("com.apple.seld.aps"), *(_QWORD *)(v1 + 104));
    v19 = *(void **)(v1 + 48);
    *(_QWORD *)(v1 + 48) = v18;

    v20 = *(void **)(v1 + 48);
    if (!v20)
    {
      v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v21);
      if (v22)
      {
        v30 = object_getClass((id)v1);
        if (class_isMetaClass(v30))
          v31 = 43;
        else
          v31 = 45;
        v32 = object_getClassName((id)v1);
        v33 = sel_getName("initAPS");
        v22(3, "%c[%{public}s %{public}s]:%i Unexpected result, exiting", v31, v32, v33, 436);
      }
      v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v24 = NFSharedLogGetLogger(v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = object_getClass((id)v1);
        if (class_isMetaClass(v26))
          v27 = 43;
        else
          v27 = 45;
        v28 = object_getClassName((id)v1);
        v29 = sel_getName("initAPS");
        *(_DWORD *)v36 = 67109890;
        v37 = v27;
        v38 = 2082;
        v39 = v28;
        v40 = 2082;
        v41 = v29;
        v42 = 1024;
        v43 = 436;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected result, exiting", v36, 0x22u);
      }

      exit(1);
    }
    objc_msgSend(v20, "setDelegate:", v1);
    sub_100019C34((void **)v1);
    objc_destroyWeak((id *)&v45[24]);
    objc_destroyWeak(&location);
  }
}

void sub_10001D8BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001DBFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001E414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001E434(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001E444(uint64_t a1)
{

}

void sub_10001E44C(uint64_t a1)
{
  sub_10001E460(*(void **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_10001E460(void *a1, void *a2)
{
  id v3;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;

  v3 = a2;
  if (a1)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName("didCloseXPCConnection:");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "NF_userInfo"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v6(6, "%c[%{public}s %{public}s]:%i Removing connection for %{public}@ - %{public}@", v13, ClassName, Name, 1015, v12, v3);

    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = object_getClass(a1);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      v19 = object_getClassName(a1);
      v20 = sel_getName("didCloseXPCConnection:");
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "NF_userInfo"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ClientName")));
      *(_DWORD *)buf = 67110402;
      v26 = v18;
      v27 = 2082;
      v28 = v19;
      v29 = 2082;
      v30 = v20;
      v31 = 1024;
      v32 = 1015;
      v33 = 2114;
      v34 = v22;
      v35 = 2114;
      v36 = v3;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Removing connection for %{public}@ - %{public}@", buf, 0x36u);

    }
    sub_10001E6C8((uint64_t)a1, v3);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "NF_userInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ProxyObjects")));
    objc_msgSend(v24, "removeAllObjects");

  }
}

void sub_10001E6B4(uint64_t a1)
{
  sub_10001E460(*(void **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_10001E6C8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = *(id *)(a1 + 16);
    objc_sync_enter(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (int)objc_msgSend(v6, "processIdentifier")));
    objc_msgSend(*(id *)(a1 + 16), "removeObjectForKey:", v5);

    objc_sync_exit(v4);
    v3 = v6;
  }

}

void sub_10001E754(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001E768(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  const char *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001E7F8;
    v5[3] = &unk_100054AF0;
    v6 = v3;
    v7 = a1;
    v8 = "_queueNFRemoteAdminStateForServerIdentifiers:";
    sub_10001B1E8(a1, v5);

  }
}

void sub_10001E7F8(uint64_t a1)
{
  uint64_t v1;
  id v2;
  char v3;
  void *v4;
  void *v5;
  NFRemoteAdminState *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v14;
  const char *ClassName;
  const char *Name;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  _QWORD *v34;
  void *v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  void (*v59)(uint64_t, const char *, ...);
  objc_class *v60;
  _BOOL4 isMetaClass;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  objc_class *v66;
  int v67;
  const char *v68;
  const char *v69;
  id v70;
  const char *v71;
  const char *v72;
  id obj;
  uint64_t v74;
  id v75;
  void *v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t buf[4];
  int v83;
  __int16 v84;
  const char *v85;
  __int16 v86;
  const char *v87;
  __int16 v88;
  int v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  id v95;
  _BYTE v96[128];

  v1 = a1;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v2 = *(id *)(a1 + 32);
  v75 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
  if (v75)
  {
    v3 = 0;
    v74 = *(_QWORD *)v79;
    v77 = v1;
    obj = v2;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v79 != v74)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)v4);
        v6 = sub_100038214(*(void **)(*(_QWORD *)(v1 + 40) + 24), v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        v8 = v7;
        if (v7)
        {
          v9 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "retryInterval"));
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          v76 = v5;
          if (Logger)
          {
            v12 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(*(id *)(v1 + 40));
            if (class_isMetaClass(Class))
              v14 = 43;
            else
              v14 = 45;
            ClassName = object_getClassName(*(id *)(v1 + 40));
            Name = sel_getName(*(SEL *)(v1 + 48));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverIdentifier"));
            if (v9)
            {
              v19 = v9[1];
              v18 = (void *)v9[2];
            }
            else
            {
              v19 = 0;
              v18 = 0;
            }
            v20 = v18;
            v12(6, "%c[%{public}s %{public}s]:%i serverState id = %{public}@, retryCount = %lu, retryAfter = %{public}@", v14, ClassName, Name, 1038, v17, v19, v20);

            v5 = v76;
            v1 = v77;
          }
          v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v22 = NFSharedLogGetLogger(v21);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = object_getClass(*(id *)(v1 + 40));
            if (class_isMetaClass(v24))
              v25 = 43;
            else
              v25 = 45;
            v26 = object_getClassName(*(id *)(v1 + 40));
            v27 = sel_getName(*(SEL *)(v1 + 48));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverIdentifier"));
            if (v9)
            {
              v30 = v9[1];
              v29 = (void *)v9[2];
            }
            else
            {
              v30 = 0;
              v29 = 0;
            }
            v31 = v29;
            *(_DWORD *)buf = 67110658;
            v83 = v25;
            v84 = 2082;
            v85 = v26;
            v86 = 2082;
            v87 = v27;
            v88 = 1024;
            v89 = 1038;
            v90 = 2114;
            v91 = v28;
            v92 = 2048;
            v93 = v30;
            v94 = 2114;
            v95 = v31;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i serverState id = %{public}@, retryCount = %lu, retryAfter = %{public}@", buf, 0x40u);

            v5 = v76;
            v1 = v77;
          }

          v3 = 1;
          objc_msgSend(v8, "setPendingImmediateRetry:", 1);
          objc_msgSend(v8, "save");
        }
        else
        {
          v9 = 0;
        }
        v32 = sub_1000399D8(*(void **)(*(_QWORD *)(v1 + 40) + 24), v5);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

        if (v33)
        {
          v34 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "retryInterval"));

          v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v36 = NFLogGetLogger(v35);
          if (v36)
          {
            v37 = (void (*)(uint64_t, const char *, ...))v36;
            v38 = object_getClass(*(id *)(v1 + 40));
            if (class_isMetaClass(v38))
              v39 = 43;
            else
              v39 = 45;
            v40 = object_getClassName(*(id *)(v1 + 40));
            v41 = sel_getName(*(SEL *)(v1 + 48));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "serverIdentifier"));
            if (v34)
            {
              v44 = v34[1];
              v43 = (void *)v34[2];
            }
            else
            {
              v44 = 0;
              v43 = 0;
            }
            v45 = v43;
            v37(6, "%c[%{public}s %{public}s]:%i redirectState id = %{public}@, retryCount = %lu, retryAfter = %{public}@", v39, v40, v41, 1051, v42, v44, v45);

            v1 = v77;
          }
          v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v47 = NFSharedLogGetLogger(v46);
          v48 = objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            v49 = object_getClass(*(id *)(v1 + 40));
            if (class_isMetaClass(v49))
              v50 = 43;
            else
              v50 = 45;
            v51 = object_getClassName(*(id *)(v1 + 40));
            v52 = sel_getName(*(SEL *)(v1 + 48));
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "serverIdentifier"));
            if (v34)
            {
              v55 = v34[1];
              v54 = (void *)v34[2];
            }
            else
            {
              v55 = 0;
              v54 = 0;
            }
            v56 = v54;
            *(_DWORD *)buf = 67110658;
            v83 = v50;
            v84 = 2082;
            v85 = v51;
            v86 = 2082;
            v87 = v52;
            v88 = 1024;
            v89 = 1051;
            v90 = 2114;
            v91 = v53;
            v92 = 2048;
            v93 = v55;
            v94 = 2114;
            v95 = v56;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i redirectState id = %{public}@, retryCount = %lu, retryAfter = %{public}@", buf, 0x40u);

            v1 = v77;
          }

          v3 = 1;
          objc_msgSend(v33, "setPendingImmediateRetry:", 1);
          objc_msgSend(v33, "save");
        }
        else
        {
          if (!v8)
          {
            v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v58 = NFLogGetLogger(v57);
            if (v58)
            {
              v59 = (void (*)(uint64_t, const char *, ...))v58;
              v60 = object_getClass(*(id *)(v1 + 40));
              isMetaClass = class_isMetaClass(v60);
              v71 = object_getClassName(*(id *)(v1 + 40));
              v72 = sel_getName(*(SEL *)(v1 + 48));
              v62 = 45;
              if (isMetaClass)
                v62 = 43;
              v59(3, "%c[%{public}s %{public}s]:%i Unable to find state for registration: %{public}@", v62, v71, v72, 1058, v5);
            }
            v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v64 = NFSharedLogGetLogger(v63);
            v65 = objc_claimAutoreleasedReturnValue(v64);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              v66 = object_getClass(*(id *)(v1 + 40));
              if (class_isMetaClass(v66))
                v67 = 43;
              else
                v67 = 45;
              v68 = object_getClassName(*(id *)(v77 + 40));
              v69 = sel_getName(*(SEL *)(v77 + 48));
              *(_DWORD *)buf = 67110146;
              v83 = v67;
              v1 = v77;
              v84 = 2082;
              v85 = v68;
              v86 = 2082;
              v87 = v69;
              v88 = 1024;
              v89 = 1058;
              v90 = 2114;
              v91 = v5;
              _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to find state for registration: %{public}@", buf, 0x2Cu);
            }

          }
          v34 = v9;
        }

        v4 = (char *)v4 + 1;
      }
      while (v75 != v4);
      v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
      v75 = v70;
    }
    while (v70);

    if ((v3 & 1) != 0)
      sub_1000172F4(*(unsigned __int8 **)(v1 + 40));
  }
  else
  {

  }
}

void sub_10001F108(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001F344(void *a1, void *a2)
{
  void (**v3)(id, _QWORD);
  id v4;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v8;
  const char *ClassName;
  const char *Name;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  void *v16;
  _QWORD *v17;
  _QWORD v18[4];
  void (**v19)(id, _QWORD);
  id v20[2];
  id buf;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  v3 = a2;
  if (a1)
  {
    v4 = a1;
    objc_sync_enter(v4);
    if (*((_BYTE *)v4 + 56))
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(v4);
        if (class_isMetaClass(Class))
          v8 = 43;
        else
          v8 = 45;
        ClassName = object_getClassName(v4);
        Name = sel_getName("_executeNowOrDelayIfNotInitiatlized:");
        Logger(6, "%c[%{public}s %{public}s]:%i APS already initialized", v8, ClassName, Name, 1148);
      }
      v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v12 = NFSharedLogGetLogger(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = object_getClass(v4);
        if (class_isMetaClass(v14))
          v15 = 43;
        else
          v15 = 45;
        LODWORD(buf) = 67109890;
        HIDWORD(buf) = v15;
        v22 = 2082;
        v23 = object_getClassName(v4);
        v24 = 2082;
        v25 = sel_getName("_executeNowOrDelayIfNotInitiatlized:");
        v26 = 1024;
        v27 = 1148;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i APS already initialized", (uint8_t *)&buf, 0x22u);
      }

      objc_sync_exit(v4);
      v3[2](v3, 0);
    }
    else
    {
      objc_initWeak(&buf, v4);
      v16 = (void *)*((_QWORD *)v4 + 21);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10001F5E4;
      v18[3] = &unk_100054B18;
      objc_copyWeak(v20, &buf);
      v20[1] = "_executeNowOrDelayIfNotInitiatlized:";
      v19 = v3;
      v17 = objc_retainBlock(v18);
      objc_msgSend(v16, "addObject:", v17);

      objc_destroyWeak(v20);
      objc_destroyWeak(&buf);
      objc_sync_exit(v4);

    }
  }

}

void sub_10001F5A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  void *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_sync_exit(v21);
  _Unwind_Resume(a1);
}

void sub_10001F5E4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
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
  const char *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
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
  id v40;
  id v41;
  const char *Name;
  const char *v43;
  NSErrorUserInfoKey v44;
  void *v45;
  NSErrorUserInfoKey v46;
  void *v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(0);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(0);
      Name = sel_getName(*(SEL *)(a1 + 48));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v6(3, "%c[%{public}s %{public}s]:%i \"self\" no longer exists.", v10, ClassName, Name, 1155);
    }
    v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFSharedLogGetLogger(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = object_getClass(0);
      if (class_isMetaClass(v14))
        v15 = 43;
      else
        v15 = 45;
      v16 = object_getClassName(0);
      v17 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v49 = v15;
      v50 = 2082;
      v51 = v16;
      v52 = 2082;
      v53 = v17;
      v54 = 1024;
      v55 = 1155;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i \"self\" no longer exists.", buf, 0x22u);
    }

    v18 = *(_QWORD *)(a1 + 32);
    v19 = objc_alloc((Class)NSError);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v46 = NSLocalizedDescriptionKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
    v47 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
    v23 = v19;
    v24 = v20;
    v25 = 6;
    goto LABEL_24;
  }
  if (!*((_BYTE *)WeakRetained + 56))
  {
    v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v27 = NFLogGetLogger(v26);
    if (v27)
    {
      v28 = (void (*)(uint64_t, const char *, ...))v27;
      v29 = object_getClass(v3);
      v30 = class_isMetaClass(v29);
      v31 = object_getClassName(v3);
      v43 = sel_getName(*(SEL *)(a1 + 48));
      v32 = 45;
      if (v30)
        v32 = 43;
      v28(3, "%c[%{public}s %{public}s]:%i APS not initialized", v32, v31, v43, 1158);
    }
    v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v34 = NFSharedLogGetLogger(v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = object_getClass(v3);
      if (class_isMetaClass(v36))
        v37 = 43;
      else
        v37 = 45;
      v38 = object_getClassName(v3);
      v39 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v49 = v37;
      v50 = 2082;
      v51 = v38;
      v52 = 2082;
      v53 = v39;
      v54 = 1024;
      v55 = 1158;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i APS not initialized", buf, 0x22u);
    }

    v18 = *(_QWORD *)(a1 + 32);
    v40 = objc_alloc((Class)NSError);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v44 = NSLocalizedDescriptionKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Timeout"));
    v45 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    v23 = v40;
    v24 = v20;
    v25 = 5;
LABEL_24:
    v41 = objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, v25, v22);
    (*(void (**)(uint64_t, id))(v18 + 16))(v18, v41);

    goto LABEL_25;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_25:

}

void sub_10001FCE8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  void *v3;
  id v4;
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
  void *v18;
  id v19;
  void *v20;
  void *v21;
  const char *Name;
  uint8_t buf[8];
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  if (!a2)
  {
    v2 = *(_QWORD **)(a1 + 32);
    v3 = *(void **)(a1 + 48);
    v4 = *(id *)(a1 + 40);
    v5 = v3;
    if (v2)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v8 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v2);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v2);
        Name = sel_getName("_setRegistrationInfo:primaryRegionTopic:");
        v12 = 45;
        if (isMetaClass)
          v12 = 43;
        v8(6, "%c[%{public}s %{public}s]:%i theInfo=%{public}@, thePrimaryRegionTopic=%{public}@", v12, ClassName, Name, 1176, v4, v5);
      }
      v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v14 = NFSharedLogGetLogger(v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = object_getClass(v2);
        if (class_isMetaClass(v16))
          v17 = 43;
        else
          v17 = 45;
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = v17;
        v24 = 2082;
        v25 = object_getClassName(v2);
        v26 = 2082;
        v27 = sel_getName("_setRegistrationInfo:primaryRegionTopic:");
        v28 = 1024;
        v29 = 1176;
        v30 = 2114;
        v31 = v4;
        v32 = 2114;
        v33 = v5;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i theInfo=%{public}@, thePrimaryRegionTopic=%{public}@", buf, 0x36u);
      }

      sub_100019C34((void **)v2);
      if (v4 && v5)
      {
        if (v2[6])
        {
          v18 = (void *)v2[3];
          v19 = sub_10001A158((uint64_t)v2, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          sub_100037DF0(v18, v20);

          *(_QWORD *)buf = v5;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", buf, 1));
          sub_10001E768((uint64_t)v2, v21);

        }
      }
    }

  }
}

void sub_10001FFE4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  id v20;
  id *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *v27;
  _BOOL4 v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  const char *ClassName;
  const char *Name;
  const char *v45;
  NSErrorUserInfoKey v46;
  const __CFString *v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  id v57;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 1232, v6);
    }
    v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      v18 = object_getClassName(*(id *)(a1 + 32));
      v19 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v49 = v17;
      v50 = 2082;
      v51 = v18;
      v52 = 2082;
      v53 = v19;
      v54 = 1024;
      v55 = 1232;
      v56 = 2114;
      v57 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v20 = sub_100033D5C();
    v21 = (id *)objc_claimAutoreleasedReturnValue(v20);
    v22 = sub_100038918(v21, *(void **)(a1 + 40), v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    if (v23)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v25 = NFLogGetLogger(v24);
      if (v25)
      {
        v26 = (void (*)(uint64_t, const char *, ...))v25;
        v27 = object_getClass(*(id *)(a1 + 32));
        v28 = class_isMetaClass(v27);
        v29 = object_getClassName(*(id *)(a1 + 32));
        v45 = sel_getName(*(SEL *)(a1 + 56));
        v30 = 45;
        if (v28)
          v30 = 43;
        v26(3, "%c[%{public}s %{public}s]:%i Failed to get next request", v30, v29, v45, 1239);
      }
      v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v32 = NFSharedLogGetLogger(v31);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v34))
          v35 = 43;
        else
          v35 = 45;
        v36 = object_getClassName(*(id *)(a1 + 32));
        v37 = sel_getName(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 67109890;
        v49 = v35;
        v50 = 2082;
        v51 = v36;
        v52 = 2082;
        v53 = v37;
        v54 = 1024;
        v55 = 1239;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get next request", buf, 0x22u);
      }

      v38 = *(_QWORD *)(a1 + 48);
      v39 = objc_alloc((Class)NSError);
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
      v46 = NSLocalizedDescriptionKey;
      v47 = CFSTR("Failed to get next request.");
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
      v42 = objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 12, v41);
      (*(void (**)(uint64_t, _QWORD, id))(v38 + 16))(v38, 0, v42);

    }
    objc_msgSend(v5, "endSession");

  }
}

void sub_10002045C(uint64_t a1, uint64_t a2)
{
  void **v2;
  void *v3;
  id v4;
  void (**v5)(id, _QWORD, id);
  id v6;
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
  const char *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  objc_class *v30;
  int v31;
  void *v32;
  void (**v33)(id, _QWORD, id);
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  const char *ClassName;
  const char *v40;
  const char *Name;
  const char *v42;
  uint8_t buf[8];
  _BYTE v44[40];
  id v45;
  const char *v46;
  NSErrorUserInfoKey v47;

  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, a2);
    return;
  }
  v2 = *(void ***)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v5 = v3;
  if (v2)
  {
    v6 = v4;
    if (v6)
    {
      v7 = v6;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v2);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v2);
        Name = sel_getName("_nextRequestForServer:completion:");
        v13 = 45;
        if (isMetaClass)
          v13 = 43;
        v10(6, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 1220, v7);
      }
      v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v15 = NFSharedLogGetLogger(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      v17 = object_getClass(v2);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = v18;
      *(_WORD *)v44 = 2082;
      *(_QWORD *)&v44[2] = object_getClassName(v2);
      *(_WORD *)&v44[10] = 2082;
      *(_QWORD *)&v44[12] = sel_getName("_nextRequestForServer:completion:");
      *(_WORD *)&v44[20] = 1024;
      *(_DWORD *)&v44[22] = 1220;
      *(_WORD *)&v44[26] = 2114;
      *(_QWORD *)&v44[28] = v7;
      v19 = "%c[%{public}s %{public}s]:%i %{public}@";
    }
    else
    {
      v20 = sub_10003758C(v2[3]);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (!v21)
      {
        v36 = objc_alloc((Class)NSError);
        v34 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
        v47 = NSLocalizedDescriptionKey;
        *(_QWORD *)buf = CFSTR("No registration info.");
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v47, 1));
        v38 = objc_msgSend(v36, "initWithDomain:code:userInfo:", v34, 39, v37);
        v5[2](v5, 0, v38);

        goto LABEL_26;
      }
      v7 = (void *)v21;
      v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v23 = NFLogGetLogger(v22);
      if (v23)
      {
        v24 = (void (*)(uint64_t, const char *, ...))v23;
        v25 = object_getClass(v2);
        v26 = class_isMetaClass(v25);
        v40 = object_getClassName(v2);
        v42 = sel_getName("_nextRequestForServer:completion:");
        v27 = 45;
        if (v26)
          v27 = 43;
        v24(6, "%c[%{public}s %{public}s]:%i default = %{public}@", v27, v40, v42, 1223, v7);
      }
      v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v29 = NFSharedLogGetLogger(v28);
      v16 = objc_claimAutoreleasedReturnValue(v29);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:

        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
        *(_QWORD *)buf = _NSConcreteStackBlock;
        *(_QWORD *)v44 = 3221225472;
        *(_QWORD *)&v44[8] = sub_10001FFE4;
        *(_QWORD *)&v44[16] = &unk_100054B68;
        *(_QWORD *)&v44[24] = v2;
        v46 = "_nextRequestForServer:completion:";
        v33 = v5;
        *(_QWORD *)&v44[32] = v7;
        v45 = v33;
        v34 = v7;
        v35 = objc_msgSend(v32, "startSecureElementManagerSession:", buf);

LABEL_26:
        goto LABEL_27;
      }
      v30 = object_getClass(v2);
      if (class_isMetaClass(v30))
        v31 = 43;
      else
        v31 = 45;
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = v31;
      *(_WORD *)v44 = 2082;
      *(_QWORD *)&v44[2] = object_getClassName(v2);
      *(_WORD *)&v44[10] = 2082;
      *(_QWORD *)&v44[12] = sel_getName("_nextRequestForServer:completion:");
      *(_WORD *)&v44[20] = 1024;
      *(_DWORD *)&v44[22] = 1223;
      *(_WORD *)&v44[26] = 2114;
      *(_QWORD *)&v44[28] = v7;
      v19 = "%c[%{public}s %{public}s]:%i default = %{public}@";
    }
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0x2Cu);
    goto LABEL_25;
  }
LABEL_27:

}

void sub_1000208C0(uint64_t a1)
{
  id v2;
  void *v3;
  BOOL v4;
  NFRemoteAdminState *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  NFRemoteAdminState *v15;
  void *v16;
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
  const char *v29;
  const char *v30;
  BOOL v31;
  uint64_t v32;
  id v33;
  id v34;
  const char *Name;
  char v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  NSErrorUserInfoKey v45;
  const __CFString *v46;

  v2 = sub_1000399D8(*(void **)(*(_QWORD *)(a1 + 32) + 24), *(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = v3 == 0;
  if (!v3)
  {
    v5 = sub_100038214(*(void **)(*(_QWORD *)(a1 + 32) + 24), *(void **)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (!v6)
    {
      v32 = *(_QWORD *)(a1 + 56);
      v33 = objc_alloc((Class)NSError);
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
      v45 = NSLocalizedDescriptionKey;
      v46 = CFSTR("Unable to create server state");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
      v34 = objc_msgSend(v33, "initWithDomain:code:userInfo:", v3, 34, v12);
      (*(void (**)(uint64_t, id))(v32 + 16))(v32, v34);

      goto LABEL_28;
    }
    v3 = v6;
    objc_msgSend(v6, "setInitialClientRequestInfo:", *(_QWORD *)(a1 + 48));
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 24);
  v9 = sub_10001A158(v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  sub_100037DF0(v8, v10);

  v36 = 0;
  do
  {
    v11 = sub_100020C0C(*(void **)(a1 + 32), v3, 1, 0, &v36);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v36)
    {
      v13 = sub_1000399D8(*(void **)(*(_QWORD *)(a1 + 32) + 24), *(void **)(a1 + 40));
      v14 = objc_claimAutoreleasedReturnValue(v13);

      if (v14)
      {
        v3 = (void *)v14;
      }
      else
      {
        v15 = sub_100038214(*(void **)(*(_QWORD *)(a1 + 32) + 24), *(void **)(a1 + 40));
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v3 = v16;
        if (v16 == 0 || v4)
        {
          if (!v16)
          {
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            Logger = NFLogGetLogger(specific);
            if (Logger)
            {
              v19 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(*(id *)(a1 + 32));
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(*(id *)(a1 + 32));
              Name = sel_getName(*(SEL *)(a1 + 64));
              if (isMetaClass)
                v23 = 43;
              else
                v23 = 45;
              v19(4, "%c[%{public}s %{public}s]:%i Missing expected state info", v23, ClassName, Name, 1324);
            }
            v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v25 = NFSharedLogGetLogger(v24);
            v26 = objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v27 = object_getClass(*(id *)(a1 + 32));
              if (class_isMetaClass(v27))
                v28 = 43;
              else
                v28 = 45;
              v29 = object_getClassName(*(id *)(a1 + 32));
              v30 = sel_getName(*(SEL *)(a1 + 64));
              *(_DWORD *)buf = 67109890;
              v38 = v28;
              v39 = 2082;
              v40 = v29;
              v41 = 2082;
              v42 = v30;
              v43 = 1024;
              v44 = 1324;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing expected state info", buf, 0x22u);
            }

            v3 = 0;
            v36 = 0;
          }
        }
        else
        {
          objc_msgSend(v16, "setInitialClientRequestInfo:", *(_QWORD *)(a1 + 48));
          v4 = 0;
        }
      }
    }
    if (v12)
      v31 = 1;
    else
      v31 = v36 == 0;
  }
  while (!v31);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  sub_1000172F4(*(unsigned __int8 **)(a1 + 32));
LABEL_28:

}

id sub_100020C0C(void *a1, void *a2, uint64_t a3, void *a4, _BYTE *a5)
{
  void *v5;
  id v9;
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v14;
  const char *ClassName;
  const char *Name;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  id *v27;
  uint64_t v28;
  NFRemoteAdminReaderSession *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  NFRemoteAdminRedirectSession *v34;
  id v35;
  uint64_t v36;
  id *v37;
  id v38;
  void *v39;
  void *v40;
  BOOL v41;
  _QWORD *v42;
  uint64_t v43;
  void (**v44)(_QWORD, _QWORD, _QWORD);
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  BOOL v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void (*v55)(uint64_t, const char *, ...);
  objc_class *v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  objc_class *v63;
  int v64;
  const char *v65;
  const char *v66;
  const char *v67;
  id v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v73;
  id v74;
  void *v75;
  void (*v76)(uint64_t, const char *, ...);
  objc_class *v77;
  uint64_t v78;
  const char *v79;
  const char *v80;
  void *v81;
  uint64_t v82;
  objc_class *v83;
  int v84;
  const char *v85;
  const char *v86;
  void *v87;
  void (*v88)(uint64_t, const char *, ...);
  objc_class *v89;
  uint64_t v90;
  const char *v91;
  const char *v92;
  void *v93;
  uint64_t v94;
  objc_class *v95;
  int v96;
  const char *v97;
  const char *v98;
  void *v99;
  void (*v100)(uint64_t, const char *, ...);
  objc_class *v101;
  uint64_t v102;
  const char *v103;
  const char *v104;
  void *v105;
  uint64_t v106;
  objc_class *v107;
  int v108;
  const char *v109;
  const char *v110;
  void *v111;
  void (*v112)(uint64_t, const char *, ...);
  objc_class *v113;
  uint64_t v114;
  const char *v115;
  const char *v116;
  void *v117;
  uint64_t v118;
  objc_class *v119;
  int v120;
  const char *v121;
  const char *v122;
  void *v123;
  void (*v124)(uint64_t, const char *, ...);
  objc_class *v125;
  uint64_t v126;
  const char *v127;
  const char *v128;
  void *v129;
  uint64_t v130;
  objc_class *v131;
  int v132;
  const char *v133;
  const char *v134;
  void *v135;
  void (*v136)(uint64_t, const char *, ...);
  objc_class *v137;
  uint64_t v138;
  const char *v139;
  const char *v140;
  void *v141;
  uint64_t v142;
  objc_class *v143;
  int v144;
  const char *v145;
  const char *v146;
  void *v147;
  void (*v148)(uint64_t, const char *, ...);
  objc_class *v149;
  uint64_t v150;
  const char *v151;
  const char *v152;
  void *v153;
  uint64_t v154;
  objc_class *v155;
  int v156;
  const char *v157;
  const char *v158;
  void *v159;
  void (*v160)(uint64_t, const char *, ...);
  objc_class *v161;
  uint64_t v162;
  const char *v163;
  const char *v164;
  void *v165;
  uint64_t v166;
  objc_class *v167;
  int v168;
  const char *v169;
  const char *v170;
  void *v171;
  void (*v172)(uint64_t, const char *, ...);
  objc_class *v173;
  uint64_t v174;
  const char *v175;
  const char *v176;
  void *v177;
  uint64_t v178;
  objc_class *v179;
  int v180;
  const char *v181;
  const char *v182;
  void *v183;
  void (*v184)(uint64_t, const char *, ...);
  objc_class *v185;
  uint64_t v186;
  const char *v187;
  const char *v188;
  void *v189;
  uint64_t v190;
  objc_class *v191;
  int v192;
  const char *v193;
  const char *v194;
  void *v195;
  void (*v196)(uint64_t, const char *, ...);
  objc_class *v197;
  uint64_t v198;
  const char *v199;
  const char *v200;
  void *v201;
  uint64_t v202;
  objc_class *v203;
  int v204;
  const char *v205;
  const char *v206;
  void *v207;
  void (*v208)(uint64_t, const char *, ...);
  objc_class *v209;
  uint64_t v210;
  const char *v211;
  const char *v212;
  void *v213;
  uint64_t v214;
  objc_class *v215;
  int v216;
  const char *v217;
  const char *v218;
  void *v219;
  void (*v220)(uint64_t, const char *, ...);
  objc_class *v221;
  uint64_t v222;
  const char *v223;
  const char *v224;
  void *v225;
  uint64_t v226;
  objc_class *v227;
  int v228;
  const char *v229;
  const char *v230;
  id v231;
  uint64_t v232;
  id v234;
  id v235;
  NSErrorUserInfoKey v236;
  uint8_t buf[8];
  __int16 v238;
  const char *v239;
  __int16 v240;
  const char *v241;
  __int16 v242;
  int v243;
  __int16 v244;
  uint64_t v245;

  v9 = a2;
  v235 = a4;
  if (!a1)
  {
LABEL_68:
    v33 = 0;
    goto LABEL_69;
  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(a1);
    if (class_isMetaClass(Class))
      v14 = 43;
    else
      v14 = 45;
    ClassName = object_getClassName(a1);
    Name = sel_getName("_processRemoteAdminState:oneTime:secureElementManagerSession:outStateStorageUpdated:");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverIdentifier"));
    v12(6, "%c[%{public}s %{public}s]:%i serverIdentifier=%{public}@", v14, ClassName, Name, 2088, v17);

  }
  v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v19 = NFSharedLogGetLogger(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = object_getClass(a1);
    if (class_isMetaClass(v21))
      v22 = 43;
    else
      v22 = 45;
    v23 = object_getClassName(a1);
    v24 = sel_getName("_processRemoteAdminState:oneTime:secureElementManagerSession:outStateStorageUpdated:");
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverIdentifier"));
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&buf[4] = v22;
    v238 = 2082;
    v239 = v23;
    v240 = 2082;
    v241 = v24;
    v242 = 1024;
    v243 = 2088;
    v244 = 2114;
    v245 = (uint64_t)v25;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i serverIdentifier=%{public}@", buf, 0x2Cu);

  }
  if (a5)
    *a5 = 0;
  v26 = objc_opt_class(NFRemoteAdminRedirectState);
  if ((objc_opt_isKindOfClass(v9, v26) & 1) == 0)
  {
    v32 = sub_10002B18C((uint64_t)a1, v9, a3, v235);
    v33 = (id)objc_claimAutoreleasedReturnValue(v32);
    goto LABEL_62;
  }
  v234 = v9;
  v231 = v235;
  PLLogRegisteredEvent(47, CFSTR("TSMCommunication"), &off_100057410, 0);
  v27 = a1;
  objc_sync_enter(v27);
  v28 = objc_opt_class(NFRemoteAdminReaderState);
  if ((objc_opt_isKindOfClass(v234, v28) & 1) != 0)
  {
    v29 = -[NFRemoteAdminReaderSession initWithState:oneTimeConnection:secureElementManagerSession:]([NFRemoteAdminReaderSession alloc], "initWithState:oneTimeConnection:secureElementManagerSession:", v234, a3, v231);
    if (v29)
      v29->_delegate = (NFRemoteAdminSessionDelegate *)v27;
    v30 = v27[12];
    v27[12] = v29;

    v31 = v234;
  }
  else
  {
    v34 = -[NFRemoteAdminRedirectSession initWithState:oneTimeConnection:secureElementManagerSession:]([NFRemoteAdminRedirectSession alloc], "initWithState:oneTimeConnection:secureElementManagerSession:", v234, a3, v231);
    v35 = v27[12];
    v27[12] = v34;

    v31 = 0;
  }
  objc_sync_exit(v27);

  sub_100017AAC((uint64_t)v27);
  if (*((_BYTE *)v27 + 155))
    v36 = 1;
  else
    v36 = (uint64_t)objc_msgSend(v27[12], "run");
  v37 = v27;
  objc_sync_enter(v37);
  v232 = v36;
  if (objc_msgSend(v234, "isComplete"))
  {
    v38 = sub_100033D5C();
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    sub_10003964C(v39, v234);

  }
  if (v31)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stateUpdateOnSessionEndedCallback"));
    v41 = v40 == 0;

    if (!v41)
    {
      v42 = v37[12];
      if (v42)
        v43 = v42[19];
      else
        v43 = 0;
      v44 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stateUpdateOnSessionEndedCallback"));
      ((void (**)(_QWORD, id, uint64_t))v44)[2](v44, v31, v43);

      objc_msgSend(v31, "setStateUpdateOnSessionEndedCallback:", 0);
    }
  }
  v45 = v37[12];
  v37[12] = 0;

  objc_sync_exit(v37);
  PLLogRegisteredEvent(47, CFSTR("TSMCommunication"), &off_100057438, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "spStatusCode"));
  if (v46)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "spStatusCode"));
    if (!objc_msgSend(v5, "unsignedIntegerValue"))
    {
LABEL_33:

      goto LABEL_34;
    }
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "spStatusCode"));
  if (v51)
  {

    if (!v46)
      goto LABEL_45;
    goto LABEL_39;
  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "httpStatus"));
  if (!v52)
  {
    if (!v46)
      goto LABEL_45;
LABEL_39:

    goto LABEL_45;
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "httpStatus"));
  if (objc_msgSend(v53, "unsignedIntegerValue") == (id)200)
  {

    if (!v46)
      goto LABEL_34;
    goto LABEL_33;
  }
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "httpStatus"));
  v74 = objc_msgSend(v73, "unsignedIntegerValue");

  if (v46)
  {

    if (v74 != (id)204)
      goto LABEL_45;
  }
  else if (v74 != (id)204)
  {
    goto LABEL_45;
  }
LABEL_34:
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "parameters"));
  if (!v47
    || (v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "parameters")),
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("cardSessionToken"))),
        v50 = v49 == 0,
        v49,
        v48,
        v47,
        v50))
  {
    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &off_100057488);
  }
  else
  {
    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &off_100057460);
  }
LABEL_45:
  switch(v232)
  {
    case 0:
      if (byte_10005C3E8)
      {
        v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v76 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v75);
        if (v76)
        {
          v77 = object_getClass(v37);
          if (class_isMetaClass(v77))
            v78 = 43;
          else
            v78 = 45;
          v79 = object_getClassName(v37);
          v80 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
          v76(6, "%c[%{public}s %{public}s]:%i [TSM] Success", v78, v79, v80, 2622);
        }
        v81 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v82 = NFSharedLogGetLogger(v81);
        v69 = objc_claimAutoreleasedReturnValue(v82);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          v83 = object_getClass(v37);
          if (class_isMetaClass(v83))
            v84 = 43;
          else
            v84 = 45;
          v85 = object_getClassName(v37);
          v86 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v84;
          v238 = 2082;
          v239 = v85;
          v240 = 2082;
          v241 = v86;
          v242 = 1024;
          v243 = 2622;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Success", buf, 0x22u);
        }
        v33 = 0;
        goto LABEL_60;
      }
      v33 = 0;
      goto LABEL_61;
    case 1:
      if (!byte_10005C3E8)
      {
        v67 = "Session aborted";
        goto LABEL_59;
      }
      v87 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v88 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v87);
      if (v88)
      {
        v89 = object_getClass(v37);
        if (class_isMetaClass(v89))
          v90 = 43;
        else
          v90 = 45;
        v91 = object_getClassName(v37);
        v92 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v88(6, "%c[%{public}s %{public}s]:%i [TSM] Session aborted", v90, v91, v92, 2651);
      }
      v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v94 = NFSharedLogGetLogger(v93);
      v62 = objc_claimAutoreleasedReturnValue(v94);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v95 = object_getClass(v37);
        if (class_isMetaClass(v95))
          v96 = 43;
        else
          v96 = 45;
        v97 = object_getClassName(v37);
        v98 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v96;
        v238 = 2082;
        v239 = v97;
        v240 = 2082;
        v241 = v98;
        v242 = 1024;
        v243 = 2651;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Session aborted", buf, 0x22u);
      }
      v67 = "Session aborted";
      goto LABEL_58;
    case 2:
      if (!byte_10005C3E8)
      {
        v67 = "Network unavailable";
        goto LABEL_59;
      }
      v99 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v100 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v99);
      if (v100)
      {
        v101 = object_getClass(v37);
        if (class_isMetaClass(v101))
          v102 = 43;
        else
          v102 = 45;
        v103 = object_getClassName(v37);
        v104 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v100(6, "%c[%{public}s %{public}s]:%i [TSM] Network Unavailable", v102, v103, v104, 2636);
      }
      v105 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v106 = NFSharedLogGetLogger(v105);
      v62 = objc_claimAutoreleasedReturnValue(v106);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v107 = object_getClass(v37);
        if (class_isMetaClass(v107))
          v108 = 43;
        else
          v108 = 45;
        v109 = object_getClassName(v37);
        v110 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v108;
        v238 = 2082;
        v239 = v109;
        v240 = 2082;
        v241 = v110;
        v242 = 1024;
        v243 = 2636;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Network Unavailable", buf, 0x22u);
      }
      v67 = "Network unavailable";
      goto LABEL_58;
    case 3:
    case 6:
    case 11:
    case 13:
      if (!byte_10005C3E8)
      {
        v67 = "Unexpected result.";
        goto LABEL_59;
      }
      v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v55 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v54);
      if (v55)
      {
        v56 = object_getClass(v37);
        if (class_isMetaClass(v56))
          v57 = 43;
        else
          v57 = 45;
        v58 = object_getClassName(v37);
        v59 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v55(6, "%c[%{public}s %{public}s]:%i [TSM] Unexpected error %lu", v57, v58, v59, 2679, v232);
      }
      v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v61 = NFSharedLogGetLogger(v60);
      v62 = objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = object_getClass(v37);
        if (class_isMetaClass(v63))
          v64 = 43;
        else
          v64 = 45;
        v65 = object_getClassName(v37);
        v66 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = v64;
        v238 = 2082;
        v239 = v65;
        v240 = 2082;
        v241 = v66;
        v242 = 1024;
        v243 = 2679;
        v244 = 2048;
        v245 = v232;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Unexpected error %lu", buf, 0x2Cu);
      }
      v67 = "Unexpected result.";
      goto LABEL_58;
    case 4:
      if (!byte_10005C3E8)
      {
        v67 = "Unable to connect. Long retry cycle";
        goto LABEL_59;
      }
      v111 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v112 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v111);
      if (v112)
      {
        v113 = object_getClass(v37);
        if (class_isMetaClass(v113))
          v114 = 43;
        else
          v114 = 45;
        v115 = object_getClassName(v37);
        v116 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v112(6, "%c[%{public}s %{public}s]:%i [TSM] Long retry", v114, v115, v116, 2626);
      }
      v117 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v118 = NFSharedLogGetLogger(v117);
      v62 = objc_claimAutoreleasedReturnValue(v118);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v119 = object_getClass(v37);
        if (class_isMetaClass(v119))
          v120 = 43;
        else
          v120 = 45;
        v121 = object_getClassName(v37);
        v122 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v120;
        v238 = 2082;
        v239 = v121;
        v240 = 2082;
        v241 = v122;
        v242 = 1024;
        v243 = 2626;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Long retry", buf, 0x22u);
      }
      v67 = "Unable to connect. Long retry cycle";
      goto LABEL_58;
    case 5:
      if (!byte_10005C3E8)
      {
        v67 = "Invalid parameter";
        goto LABEL_59;
      }
      v123 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v124 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v123);
      if (v124)
      {
        v125 = object_getClass(v37);
        if (class_isMetaClass(v125))
          v126 = 43;
        else
          v126 = 45;
        v127 = object_getClassName(v37);
        v128 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v124(6, "%c[%{public}s %{public}s]:%i [TSM] Invalid parameter", v126, v127, v128, 2656);
      }
      v129 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v130 = NFSharedLogGetLogger(v129);
      v62 = objc_claimAutoreleasedReturnValue(v130);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v131 = object_getClass(v37);
        if (class_isMetaClass(v131))
          v132 = 43;
        else
          v132 = 45;
        v133 = object_getClassName(v37);
        v134 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v132;
        v238 = 2082;
        v239 = v133;
        v240 = 2082;
        v241 = v134;
        v242 = 1024;
        v243 = 2656;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Invalid parameter", buf, 0x22u);
      }
      v67 = "Invalid parameter";
      goto LABEL_58;
    case 7:
      if (!byte_10005C3E8)
      {
        v67 = "External Tag Unavailable";
        goto LABEL_59;
      }
      v135 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v136 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v135);
      if (v136)
      {
        v137 = object_getClass(v37);
        if (class_isMetaClass(v137))
          v138 = 43;
        else
          v138 = 45;
        v139 = object_getClassName(v37);
        v140 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v136(6, "%c[%{public}s %{public}s]:%i [TSM] External Tag Unavailable", v138, v139, v140, 2631);
      }
      v141 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v142 = NFSharedLogGetLogger(v141);
      v62 = objc_claimAutoreleasedReturnValue(v142);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v143 = object_getClass(v37);
        if (class_isMetaClass(v143))
          v144 = 43;
        else
          v144 = 45;
        v145 = object_getClassName(v37);
        v146 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v144;
        v238 = 2082;
        v239 = v145;
        v240 = 2082;
        v241 = v146;
        v242 = 1024;
        v243 = 2631;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] External Tag Unavailable", buf, 0x22u);
      }
      v67 = "External Tag Unavailable";
      goto LABEL_58;
    case 8:
      if (!byte_10005C3E8)
      {
        v67 = "Session Error";
        goto LABEL_59;
      }
      v147 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v148 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v147);
      if (v148)
      {
        v149 = object_getClass(v37);
        if (class_isMetaClass(v149))
          v150 = 43;
        else
          v150 = 45;
        v151 = object_getClassName(v37);
        v152 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v148(6, "%c[%{public}s %{public}s]:%i [TSM] Session error", v150, v151, v152, 2661);
      }
      v153 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v154 = NFSharedLogGetLogger(v153);
      v62 = objc_claimAutoreleasedReturnValue(v154);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v155 = object_getClass(v37);
        if (class_isMetaClass(v155))
          v156 = 43;
        else
          v156 = 45;
        v157 = object_getClassName(v37);
        v158 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v156;
        v238 = 2082;
        v239 = v157;
        v240 = 2082;
        v241 = v158;
        v242 = 1024;
        v243 = 2661;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Session error", buf, 0x22u);
      }
      v67 = "Session Error";
      goto LABEL_58;
    case 9:
      if (!byte_10005C3E8)
      {
        v67 = "Unsupported tag";
        goto LABEL_59;
      }
      v159 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v160 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v159);
      if (v160)
      {
        v161 = object_getClass(v37);
        if (class_isMetaClass(v161))
          v162 = 43;
        else
          v162 = 45;
        v163 = object_getClassName(v37);
        v164 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v160(6, "%c[%{public}s %{public}s]:%i [TSM] Unsupported tag", v162, v163, v164, 2666);
      }
      v165 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v166 = NFSharedLogGetLogger(v165);
      v62 = objc_claimAutoreleasedReturnValue(v166);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v167 = object_getClass(v37);
        if (class_isMetaClass(v167))
          v168 = 43;
        else
          v168 = 45;
        v169 = object_getClassName(v37);
        v170 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v168;
        v238 = 2082;
        v239 = v169;
        v240 = 2082;
        v241 = v170;
        v242 = 1024;
        v243 = 2666;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Unsupported tag", buf, 0x22u);
      }
      v67 = "Unsupported tag";
      goto LABEL_58;
    case 10:
      if (!byte_10005C3E8)
      {
        v67 = "Bad Command error";
        goto LABEL_59;
      }
      v171 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v172 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v171);
      if (v172)
      {
        v173 = object_getClass(v37);
        if (class_isMetaClass(v173))
          v174 = 43;
        else
          v174 = 45;
        v175 = object_getClassName(v37);
        v176 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v172(6, "%c[%{public}s %{public}s]:%i [TSM] Bad Communication Error", v174, v175, v176, 2671);
      }
      v177 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v178 = NFSharedLogGetLogger(v177);
      v62 = objc_claimAutoreleasedReturnValue(v178);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v179 = object_getClass(v37);
        if (class_isMetaClass(v179))
          v180 = 43;
        else
          v180 = 45;
        v181 = object_getClassName(v37);
        v182 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v180;
        v238 = 2082;
        v239 = v181;
        v240 = 2082;
        v241 = v182;
        v242 = 1024;
        v243 = 2671;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Bad Communication Error", buf, 0x22u);
      }
      v67 = "Bad Command error";
      goto LABEL_58;
    case 12:
      if (!byte_10005C3E8)
      {
        v67 = "Start new session";
        goto LABEL_59;
      }
      v183 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v184 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v183);
      if (v184)
      {
        v185 = object_getClass(v37);
        if (class_isMetaClass(v185))
          v186 = 43;
        else
          v186 = 45;
        v187 = object_getClassName(v37);
        v188 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v184(6, "%c[%{public}s %{public}s]:%i [TSM] Start new session", v186, v187, v188, 2684);
      }
      v189 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v190 = NFSharedLogGetLogger(v189);
      v62 = objc_claimAutoreleasedReturnValue(v190);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v191 = object_getClass(v37);
        if (class_isMetaClass(v191))
          v192 = 43;
        else
          v192 = 45;
        v193 = object_getClassName(v37);
        v194 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v192;
        v238 = 2082;
        v239 = v193;
        v240 = 2082;
        v241 = v194;
        v242 = 1024;
        v243 = 2684;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Start new session", buf, 0x22u);
      }
      v67 = "Start new session";
      goto LABEL_58;
    case 14:
      if (!byte_10005C3E8)
      {
        v67 = "SE is not available";
        goto LABEL_59;
      }
      v195 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v196 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v195);
      if (v196)
      {
        v197 = object_getClass(v37);
        if (class_isMetaClass(v197))
          v198 = 43;
        else
          v198 = 45;
        v199 = object_getClassName(v37);
        v200 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v196(6, "%c[%{public}s %{public}s]:%i [TSM] SE is not avaliable", v198, v199, v200, 2646);
      }
      v201 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v202 = NFSharedLogGetLogger(v201);
      v62 = objc_claimAutoreleasedReturnValue(v202);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v203 = object_getClass(v37);
        if (class_isMetaClass(v203))
          v204 = 43;
        else
          v204 = 45;
        v205 = object_getClassName(v37);
        v206 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v204;
        v238 = 2082;
        v239 = v205;
        v240 = 2082;
        v241 = v206;
        v242 = 1024;
        v243 = 2646;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] SE is not avaliable", buf, 0x22u);
      }
      v67 = "SE is not available";
      goto LABEL_58;
    case 15:
      if (!byte_10005C3E8)
      {
        v67 = "Other network error";
        goto LABEL_59;
      }
      v207 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v208 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v207);
      if (v208)
      {
        v209 = object_getClass(v37);
        if (class_isMetaClass(v209))
          v210 = 43;
        else
          v210 = 45;
        v211 = object_getClassName(v37);
        v212 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        v208(6, "%c[%{public}s %{public}s]:%i [TSM] Other network error", v210, v211, v212, 2641);
      }
      v213 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v214 = NFSharedLogGetLogger(v213);
      v62 = objc_claimAutoreleasedReturnValue(v214);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v215 = object_getClass(v37);
        if (class_isMetaClass(v215))
          v216 = 43;
        else
          v216 = 45;
        v217 = object_getClassName(v37);
        v218 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v216;
        v238 = 2082;
        v239 = v217;
        v240 = 2082;
        v241 = v218;
        v242 = 1024;
        v243 = 2641;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Other network error", buf, 0x22u);
      }
      v67 = "Other network error";
      goto LABEL_58;
    case 16:
      if (byte_10005C3E8)
      {
        v219 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v220 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v219);
        if (v220)
        {
          v221 = object_getClass(v37);
          if (class_isMetaClass(v221))
            v222 = 43;
          else
            v222 = 45;
          v223 = object_getClassName(v37);
          v224 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
          v220(6, "%c[%{public}s %{public}s]:%i [TSM] XPC related error", v222, v223, v224, 2689);
        }
        v225 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v226 = NFSharedLogGetLogger(v225);
        v62 = objc_claimAutoreleasedReturnValue(v226);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          v227 = object_getClass(v37);
          if (class_isMetaClass(v227))
            v228 = 43;
          else
            v228 = 45;
          v229 = object_getClassName(v37);
          v230 = sel_getName("_processRedirect:oneTimeConnection:secureElementManagerSession:");
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v228;
          v238 = 2082;
          v239 = v229;
          v240 = 2082;
          v241 = v230;
          v242 = 1024;
          v243 = 2689;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] XPC related error", buf, 0x22u);
        }
        v67 = "XPC related error";
LABEL_58:

      }
      else
      {
        v67 = "XPC related error";
      }
LABEL_59:
      v68 = objc_alloc((Class)NSError);
      v69 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
      v236 = NSLocalizedDescriptionKey;
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v67));
      *(_QWORD *)buf = v70;
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v236, 1));
      v33 = objc_msgSend(v68, "initWithDomain:code:userInfo:", v69, v232, v71);

LABEL_60:
LABEL_61:

      break;
    default:
      v67 = 0;
      v33 = 0;
      if (!v232)
        goto LABEL_61;
      goto LABEL_59;
  }
LABEL_62:
  if (v33 && (objc_msgSend(v33, "code") == (id)11 || objc_msgSend(v33, "code") == (id)12))
  {
    if (a5)
      *a5 = 1;

    goto LABEL_68;
  }
LABEL_69:

  return v33;
}

void sub_100022424(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022730(uint64_t a1, void *a2)
{
  id v3;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  void **v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
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
  const char *v42;
  const char *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void (*v48)(uint64_t, const char *, ...);
  objc_class *v49;
  _BOOL4 v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  objc_class *v55;
  int v56;
  const char *v57;
  const char *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void (*v67)(uint64_t, const char *, ...);
  objc_class *v68;
  _BOOL4 v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  objc_class *v74;
  int v75;
  const char *v76;
  const char *v77;
  id v78;
  void *v79;
  id v80;
  const char *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  const char *v86;
  void *v87;
  uint8_t buf[8];
  _BYTE v89[40];
  id v90;
  id v91;
  const char *v92;
  NSErrorUserInfoKey v93;

  v3 = a2;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 72));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v13 = 45;
    if (isMetaClass)
      v13 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Processing server connection request from %{public}@", v13, ClassName, Name, 1343, v12);

  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    v19 = object_getClassName(*(id *)(a1 + 32));
    v20 = sel_getName(*(SEL *)(a1 + 72));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&buf[4] = v18;
    *(_WORD *)v89 = 2082;
    *(_QWORD *)&v89[2] = v19;
    *(_WORD *)&v89[10] = 2082;
    *(_QWORD *)&v89[12] = v20;
    *(_WORD *)&v89[20] = 1024;
    *(_DWORD *)&v89[22] = 1343;
    *(_WORD *)&v89[26] = 2114;
    *(_QWORD *)&v89[28] = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing server connection request from %{public}@", buf, 0x2Cu);

  }
  if (!v3)
  {
    v23 = *(void ***)(a1 + 32);
    v24 = *(void **)(a1 + 56);
    v25 = *(void **)(a1 + 64);
    v26 = *(id *)(a1 + 48);
    v27 = v24;
    v28 = v25;
    if (!v23)
    {
LABEL_47:

      goto LABEL_48;
    }
    v29 = v26;
    if (v29)
    {
      v30 = v29;
      v87 = v27;
      v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v32 = NFLogGetLogger(v31);
      if (v32)
      {
        v33 = (void (*)(uint64_t, const char *, ...))v32;
        v34 = object_getClass(v23);
        v35 = class_isMetaClass(v34);
        v81 = object_getClassName(v23);
        v84 = sel_getName("_connectToServer:initialClientRequestInfo:completion:");
        v36 = 45;
        if (v35)
          v36 = 43;
        v33(6, "%c[%{public}s %{public}s]:%i %{public}@", v36, v81, v84, 1267, v30);
      }
      v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v38 = NFSharedLogGetLogger(v37);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = object_getClass(v23);
        if (class_isMetaClass(v40))
          v41 = 43;
        else
          v41 = 45;
        v42 = object_getClassName(v23);
        v43 = sel_getName("_connectToServer:initialClientRequestInfo:completion:");
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = v41;
        *(_WORD *)v89 = 2082;
        *(_QWORD *)&v89[2] = v42;
        *(_WORD *)&v89[10] = 2082;
        *(_QWORD *)&v89[12] = v43;
        *(_WORD *)&v89[20] = 1024;
        *(_DWORD *)&v89[22] = 1267;
        *(_WORD *)&v89[26] = 2114;
        *(_QWORD *)&v89[28] = v30;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
      }

      v44 = sub_100037538(v23[3], v30);
      v45 = (void *)objc_claimAutoreleasedReturnValue(v44);

      if (!v45)
      {
        v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v47 = NFLogGetLogger(v46);
        if (v47)
        {
          v48 = (void (*)(uint64_t, const char *, ...))v47;
          v49 = object_getClass(v23);
          v50 = class_isMetaClass(v49);
          v82 = object_getClassName(v23);
          v85 = sel_getName("_connectToServer:initialClientRequestInfo:completion:");
          v51 = 45;
          if (v50)
            v51 = 43;
          v48(4, "%c[%{public}s %{public}s]:%i No registered URL for %{public}@", v51, v82, v85, 1269, v30);
        }
        v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v53 = NFSharedLogGetLogger(v52);
        v54 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          v55 = object_getClass(v23);
          if (class_isMetaClass(v55))
            v56 = 43;
          else
            v56 = 45;
          v57 = object_getClassName(v23);
          v58 = sel_getName("_connectToServer:initialClientRequestInfo:completion:");
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&buf[4] = v56;
          *(_WORD *)v89 = 2082;
          *(_QWORD *)&v89[2] = v57;
          *(_WORD *)&v89[10] = 2082;
          *(_QWORD *)&v89[12] = v58;
          *(_WORD *)&v89[20] = 1024;
          *(_DWORD *)&v89[22] = 1269;
          *(_WORD *)&v89[26] = 2114;
          *(_QWORD *)&v89[28] = v30;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No registered URL for %{public}@", buf, 0x2Cu);
        }

        v59 = objc_alloc((Class)NSError);
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
        v93 = NSLocalizedDescriptionKey;
        *(_QWORD *)buf = CFSTR("No registered URL.");
        v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v93, 1));
        v62 = objc_msgSend(v59, "initWithDomain:code:userInfo:", v60, 39, v61);
        (*((void (**)(id, id))v28 + 2))(v28, v62);

        goto LABEL_46;
      }
    }
    else
    {
      v63 = sub_10003758C(v23[3]);
      v64 = objc_claimAutoreleasedReturnValue(v63);
      if (!v64)
      {
        v78 = objc_alloc((Class)NSError);
        v30 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
        v93 = NSLocalizedDescriptionKey;
        *(_QWORD *)buf = CFSTR("No registration info.");
        v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v93, 1));
        v80 = objc_msgSend(v78, "initWithDomain:code:userInfo:", v30, 39, v79);
        (*((void (**)(id, id))v28 + 2))(v28, v80);

        goto LABEL_46;
      }
      v30 = (id)v64;
      v87 = v27;
      v65 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v66 = NFLogGetLogger(v65);
      if (v66)
      {
        v67 = (void (*)(uint64_t, const char *, ...))v66;
        v68 = object_getClass(v23);
        v69 = class_isMetaClass(v68);
        v83 = object_getClassName(v23);
        v86 = sel_getName("_connectToServer:initialClientRequestInfo:completion:");
        v70 = 45;
        if (v69)
          v70 = 43;
        v67(6, "%c[%{public}s %{public}s]:%i default = %{public}@", v70, v83, v86, 1275, v30);
      }
      v71 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v72 = NFSharedLogGetLogger(v71);
      v73 = objc_claimAutoreleasedReturnValue(v72);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        v74 = object_getClass(v23);
        if (class_isMetaClass(v74))
          v75 = 43;
        else
          v75 = 45;
        v76 = object_getClassName(v23);
        v77 = sel_getName("_connectToServer:initialClientRequestInfo:completion:");
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = v75;
        *(_WORD *)v89 = 2082;
        *(_QWORD *)&v89[2] = v76;
        *(_WORD *)&v89[10] = 2082;
        *(_QWORD *)&v89[12] = v77;
        *(_WORD *)&v89[20] = 1024;
        *(_DWORD *)&v89[22] = 1275;
        *(_WORD *)&v89[26] = 2114;
        *(_QWORD *)&v89[28] = v30;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i default = %{public}@", buf, 0x2Cu);
      }

    }
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)v89 = 3221225472;
    *(_QWORD *)&v89[8] = sub_1000208C0;
    *(_QWORD *)&v89[16] = &unk_100054BB8;
    *(_QWORD *)&v89[24] = v23;
    *(_QWORD *)&v89[32] = v30;
    v27 = v87;
    v90 = v87;
    v91 = v28;
    v92 = "_connectToServer:initialClientRequestInfo:completion:";
    v30 = v30;
    sub_10001B1E8((uint64_t)v23, buf);

LABEL_46:
    goto LABEL_47;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_48:

}

void sub_100022F00(void **a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, id);
  id v7;
  void *v8;
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
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *v44;
  _BOOL4 v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  objc_class *v50;
  int v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  const char *ClassName;
  const char *v61;
  const char *v62;
  const char *Name;
  const char *v64;
  const char *v65;
  void *v66;
  NSErrorUserInfoKey v67;
  const __CFString *v68;
  NSErrorUserInfoKey v69;
  const __CFString *v70;
  uint8_t buf[4];
  int v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  int v78;
  __int16 v79;
  void *v80;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = v5;
    if (v7)
    {
      v8 = v7;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(a1);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName("_queueServerConnection:callback:");
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v11(6, "%c[%{public}s %{public}s]:%i %{public}@", v14, ClassName, Name, 1358, v8);
      }
      v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v16 = NFSharedLogGetLogger(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = object_getClass(a1);
        if (class_isMetaClass(v18))
          v19 = 43;
        else
          v19 = 45;
        *(_DWORD *)buf = 67110146;
        v72 = v19;
        v73 = 2082;
        v74 = object_getClassName(a1);
        v75 = 2082;
        v76 = sel_getName("_queueServerConnection:callback:");
        v77 = 1024;
        v78 = 1358;
        v79 = 2114;
        v80 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
      }

      v20 = sub_100037538(a1[3], v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

      if (!v21)
      {
        v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v23 = NFLogGetLogger(v22);
        if (v23)
        {
          v24 = (void (*)(uint64_t, const char *, ...))v23;
          v25 = object_getClass(a1);
          v26 = class_isMetaClass(v25);
          v61 = object_getClassName(a1);
          v64 = sel_getName("_queueServerConnection:callback:");
          v27 = 45;
          if (v26)
            v27 = 43;
          v24(4, "%c[%{public}s %{public}s]:%i No registered URL for %{public}@", v27, v61, v64, 1360, v8);
        }
        v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v29 = NFSharedLogGetLogger(v28);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = object_getClass(a1);
          if (class_isMetaClass(v31))
            v32 = 43;
          else
            v32 = 45;
          v33 = object_getClassName(a1);
          v34 = sel_getName("_queueServerConnection:callback:");
          *(_DWORD *)buf = 67110146;
          v72 = v32;
          v73 = 2082;
          v74 = v33;
          v75 = 2082;
          v76 = v34;
          v77 = 1024;
          v78 = 1360;
          v79 = 2114;
          v80 = v8;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No registered URL for %{public}@", buf, 0x2Cu);
        }

        if (v6)
        {
          v35 = objc_alloc((Class)NSError);
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
          v69 = NSLocalizedDescriptionKey;
          v70 = CFSTR("No registered URL.");
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
          v38 = objc_msgSend(v35, "initWithDomain:code:userInfo:", v36, 39, v37);
          v6[2](v6, v38);

        }
LABEL_40:

        goto LABEL_41;
      }
    }
    else
    {
      v39 = sub_10003758C(a1[3]);
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (!v40)
      {
        if (v6)
        {
          v56 = objc_alloc((Class)NSError);
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
          v67 = NSLocalizedDescriptionKey;
          v68 = CFSTR("No registration info.");
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));
          v59 = objc_msgSend(v56, "initWithDomain:code:userInfo:", v57, 39, v58);
          v6[2](v6, v59);

        }
        v8 = 0;
        goto LABEL_40;
      }
      v8 = (void *)v40;
      v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v42 = NFLogGetLogger(v41);
      if (v42)
      {
        v43 = (void (*)(uint64_t, const char *, ...))v42;
        v44 = object_getClass(a1);
        v45 = class_isMetaClass(v44);
        v62 = object_getClassName(a1);
        v65 = sel_getName("_queueServerConnection:callback:");
        v46 = 45;
        if (v45)
          v46 = 43;
        v43(6, "%c[%{public}s %{public}s]:%i default = %{public}@", v46, v62, v65, 1366, v8);
      }
      v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v48 = NFSharedLogGetLogger(v47);
      v49 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = object_getClass(a1);
        if (class_isMetaClass(v50))
          v51 = 43;
        else
          v51 = 45;
        *(_DWORD *)buf = 67110146;
        v72 = v51;
        v73 = 2082;
        v74 = object_getClassName(a1);
        v75 = 2082;
        v76 = sel_getName("_queueServerConnection:callback:");
        v77 = 1024;
        v78 = 1366;
        v79 = 2114;
        v80 = v8;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i default = %{public}@", buf, 0x2Cu);
      }

    }
    v52 = a1[3];
    v53 = sub_10001A158((uint64_t)a1, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    sub_100037DF0(v52, v54);

    v66 = v8;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v66, 1));
    sub_10001E768((uint64_t)a1, v55);

    if (v6)
      v6[2](v6, 0);
    goto LABEL_40;
  }
LABEL_41:

}

void sub_1000237FC(uint64_t a1, uint64_t a2)
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
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

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v13 = 45;
    if (isMetaClass)
      v13 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v13, ClassName, Name, 1394, v12);

  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    v19 = object_getClassName(*(id *)(a1 + 32));
    v20 = sel_getName(*(SEL *)(a1 + 56));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v24 = v18;
    v25 = 2082;
    v26 = v19;
    v27 = 2082;
    v28 = v20;
    v29 = 1024;
    v30 = 1394;
    v31 = 2114;
    v32 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);

  }
  if (!a2)
    sub_100022F00(*(void ***)(a1 + 32), *(void **)(a1 + 48), 0);
}

void sub_100023A0C(void *a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, id);
  void **v7;
  int v8;
  id v9;
  id v10;
  void *i;
  NSObject *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *specific;
  uint64_t Logger;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  id v29;
  uint64_t v30;
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
  void *v44;
  uint64_t v45;
  void (*v46)(uint64_t, const char *, ...);
  objc_class *v47;
  _BOOL4 v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  objc_class *v54;
  int v55;
  const char *v56;
  const char *v57;
  void *v58;
  uint64_t v59;
  void (*v60)(uint64_t, const char *, ...);
  objc_class *v61;
  _BOOL4 v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  objc_class *v66;
  int v67;
  const char *v68;
  const char *v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  const char *ClassName;
  const char *v83;
  const char *v84;
  const char *Name;
  const char *v86;
  const char *v87;
  const char *v88;
  void (**v89)(id, id);
  NSMutableArray *v90;
  id obj;
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint8_t buf[4];
  int v98;
  __int16 v99;
  const char *v100;
  __int16 v101;
  const char *v102;
  __int16 v103;
  int v104;
  __int16 v105;
  NSObject *v106;
  __int16 v107;
  NSObject *v108;
  NSErrorUserInfoKey v109;
  const __CFString *v110;
  _BYTE v111[128];
  NSErrorUserInfoKey v112;
  void *v113;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v90 = objc_opt_new(NSMutableArray);
    v7 = a1;
    objc_sync_enter(v7);
    v8 = *((unsigned __int8 *)v7 + 56);
    objc_sync_exit(v7);

    if (v8)
    {
      v89 = v6;
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      obj = v5;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v111, 16);
      if (v9)
      {
        v10 = v9;
        v92 = *(_QWORD *)v94;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v94 != v92)
              objc_enumerationMutation(obj);
            v12 = *(NSObject **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)i);
            v13 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
            {
              v14 = sub_1000375F8(v7[3], v12);
              v15 = objc_claimAutoreleasedReturnValue(v14);
              if (!v15)
              {
                specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                Logger = NFLogGetLogger(specific);
                if (Logger)
                {
                  v18 = (void (*)(uint64_t, const char *, ...))Logger;
                  Class = object_getClass(v7);
                  isMetaClass = class_isMetaClass(Class);
                  ClassName = object_getClassName(v7);
                  Name = sel_getName("_queueServerConnectionForApplets:completion:");
                  v21 = 45;
                  if (isMetaClass)
                    v21 = 43;
                  v18(4, "%c[%{public}s %{public}s]:%i No server for applet: %{public}@", v21, ClassName, Name, 1425, v12);
                }
                v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v23 = NFSharedLogGetLogger(v22);
                v24 = objc_claimAutoreleasedReturnValue(v23);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  v25 = object_getClass(v7);
                  if (class_isMetaClass(v25))
                    v26 = 43;
                  else
                    v26 = 45;
                  v27 = object_getClassName(v7);
                  v28 = sel_getName("_queueServerConnectionForApplets:completion:");
                  *(_DWORD *)buf = 67110146;
                  v98 = v26;
                  v99 = 2082;
                  v100 = v27;
                  v101 = 2082;
                  v102 = v28;
                  v103 = 1024;
                  v104 = 1425;
                  v105 = 2114;
                  v106 = v12;
                  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No server for applet: %{public}@", buf, 0x2Cu);
                }

                v29 = sub_10003758C(v7[3]);
                v30 = objc_claimAutoreleasedReturnValue(v29);
                if (!v30)
                {
                  v6 = v89;
                  if (v89)
                  {
                    v78 = objc_alloc((Class)NSError);
                    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
                    v109 = NSLocalizedDescriptionKey;
                    v110 = CFSTR("No registration info.");
                    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1));
                    v81 = objc_msgSend(v78, "initWithDomain:code:userInfo:", v79, 39, v80);
                    v89[2](v89, v81);

                  }
                  goto LABEL_58;
                }
                v15 = v30;
                v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v32 = NFLogGetLogger(v31);
                if (v32)
                {
                  v33 = (void (*)(uint64_t, const char *, ...))v32;
                  v34 = object_getClass(v7);
                  v35 = class_isMetaClass(v34);
                  v83 = object_getClassName(v7);
                  v86 = sel_getName("_queueServerConnectionForApplets:completion:");
                  v36 = 45;
                  if (v35)
                    v36 = 43;
                  v33(6, "%c[%{public}s %{public}s]:%i default = %{public}@", v36, v83, v86, 1427, v15);
                }
                v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v38 = NFSharedLogGetLogger(v37);
                v39 = objc_claimAutoreleasedReturnValue(v38);
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                {
                  v40 = object_getClass(v7);
                  if (class_isMetaClass(v40))
                    v41 = 43;
                  else
                    v41 = 45;
                  v42 = object_getClassName(v7);
                  v43 = sel_getName("_queueServerConnectionForApplets:completion:");
                  *(_DWORD *)buf = 67110146;
                  v98 = v41;
                  v99 = 2082;
                  v100 = v42;
                  v101 = 2082;
                  v102 = v43;
                  v103 = 1024;
                  v104 = 1427;
                  v105 = 2114;
                  v106 = v15;
                  _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i default = %{public}@", buf, 0x2Cu);
                }

              }
              v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v45 = NFLogGetLogger(v44);
              if (v45)
              {
                v46 = (void (*)(uint64_t, const char *, ...))v45;
                v47 = object_getClass(v7);
                v48 = class_isMetaClass(v47);
                v49 = object_getClassName(v7);
                v87 = sel_getName("_queueServerConnectionForApplets:completion:");
                v50 = 45;
                if (v48)
                  v50 = 43;
                v46(6, "%c[%{public}s %{public}s]:%i %{public}@ => %{public}@", v50, v49, v87, 1436, v12, v15);
              }
              v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v52 = NFSharedLogGetLogger(v51);
              v53 = objc_claimAutoreleasedReturnValue(v52);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                v54 = object_getClass(v7);
                if (class_isMetaClass(v54))
                  v55 = 43;
                else
                  v55 = 45;
                v56 = object_getClassName(v7);
                v57 = sel_getName("_queueServerConnectionForApplets:completion:");
                *(_DWORD *)buf = 67110402;
                v98 = v55;
                v99 = 2082;
                v100 = v56;
                v101 = 2082;
                v102 = v57;
                v103 = 1024;
                v104 = 1436;
                v105 = 2114;
                v106 = v12;
                v107 = 2114;
                v108 = v15;
                _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ => %{public}@", buf, 0x36u);
              }

              -[NSMutableArray addObject:](v90, "addObject:", v15);
            }
            else
            {
              v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v59 = NFLogGetLogger(v58);
              if (v59)
              {
                v60 = (void (*)(uint64_t, const char *, ...))v59;
                v61 = object_getClass(v7);
                v62 = class_isMetaClass(v61);
                v84 = object_getClassName(v7);
                v88 = sel_getName("_queueServerConnectionForApplets:completion:");
                v63 = 45;
                if (v62)
                  v63 = 43;
                v60(4, "%c[%{public}s %{public}s]:%i Skipping invalid aid string (%{public}@)", v63, v84, v88, 1420, v12);
              }
              v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v65 = NFSharedLogGetLogger(v64);
              v15 = objc_claimAutoreleasedReturnValue(v65);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                v66 = object_getClass(v7);
                if (class_isMetaClass(v66))
                  v67 = 43;
                else
                  v67 = 45;
                v68 = object_getClassName(v7);
                v69 = sel_getName("_queueServerConnectionForApplets:completion:");
                *(_DWORD *)buf = 67110146;
                v98 = v67;
                v99 = 2082;
                v100 = v68;
                v101 = 2082;
                v102 = v69;
                v103 = 1024;
                v104 = 1420;
                v105 = 2114;
                v106 = v12;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Skipping invalid aid string (%{public}@)", buf, 0x2Cu);
              }
            }

          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v111, 16);
          if (v10)
            continue;
          break;
        }
      }

      v70 = v7[3];
      v71 = sub_10001A158((uint64_t)v7, 0);
      v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
      sub_100037DF0(v70, v72);

      sub_10001E768((uint64_t)v7, v90);
      v6 = v89;
      if (v89)
        v89[2](v89, 0);
    }
    else if (v6)
    {
      v73 = objc_alloc((Class)NSError);
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v112 = NSLocalizedDescriptionKey;
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Timeout"));
      v113 = v75;
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1));
      v77 = objc_msgSend(v73, "initWithDomain:code:userInfo:", v74, 5, v76);
      v6[2](v6, v77);

    }
LABEL_58:

  }
}

void sub_10002451C(uint64_t a1, uint64_t a2)
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
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

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v13 = 45;
    if (isMetaClass)
      v13 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v13, ClassName, Name, 1461, v12);

  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    v19 = object_getClassName(*(id *)(a1 + 32));
    v20 = sel_getName(*(SEL *)(a1 + 56));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v24 = v18;
    v25 = 2082;
    v26 = v19;
    v27 = 2082;
    v28 = v20;
    v29 = 1024;
    v30 = 1461;
    v31 = 2114;
    v32 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);

  }
  if (!a2)
    sub_100023A0C(*(void **)(a1 + 32), *(void **)(a1 + 48), 0);
}

void sub_10002472C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
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
  const char *v22;
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
  id v37;
  void *v38;
  uint64_t v39;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *v41;
  _BOOL4 v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  objc_class *v47;
  int v48;
  const char *v49;
  const char *v50;
  void *v51;
  uint64_t v52;
  void (*v53)(uint64_t, const char *, ...);
  objc_class *v54;
  _BOOL4 v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  objc_class *v60;
  int v61;
  const char *v62;
  const char *v63;
  void *v64;
  uint64_t v65;
  void (*v66)(uint64_t, const char *, ...);
  objc_class *v67;
  _BOOL4 v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  objc_class *v73;
  int v74;
  const char *v75;
  const char *v76;
  void *v77;
  uint64_t v78;
  void (*v79)(uint64_t, const char *, ...);
  objc_class *v80;
  _BOOL4 v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  objc_class *v86;
  int v87;
  const char *v88;
  const char *v89;
  void *v90;
  uint64_t v91;
  void (*v92)(uint64_t, const char *, ...);
  objc_class *v93;
  _BOOL4 v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
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
  objc_class *v112;
  int v113;
  const char *v114;
  const char *v115;
  void *v116;
  uint64_t v117;
  void (*v118)(uint64_t, const char *, ...);
  objc_class *v119;
  _BOOL4 v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  objc_class *v125;
  int v126;
  const char *v127;
  const char *v128;
  id v129;
  void *v130;
  void *v131;
  const char *Name;
  const char *v133;
  const char *v134;
  const char *v135;
  const char *v136;
  const char *v137;
  const char *v138;
  const char *v139;
  const char *v140;
  NSErrorUserInfoKey v141;
  void *v142;
  uint8_t buf[4];
  int v144;
  __int16 v145;
  const char *v146;
  __int16 v147;
  const char *v148;
  __int16 v149;
  int v150;

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "spStatusCode"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "spStatusCode"));
    objc_msgSend(v7, "unsignedIntegerValue");

  }
  switch(a3)
  {
    case -1:
      if (!byte_10005C3E8)
      {
        v22 = "Unknown error";
        goto LABEL_105;
      }
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(*(id *)(a1 + 32));
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 48));
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v10(6, "%c[%{public}s %{public}s]:%i [TSM] Unknown error", v14, ClassName, Name, 1563);
      }
      v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v16 = NFSharedLogGetLogger(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v18))
          v19 = 43;
        else
          v19 = 45;
        v20 = object_getClassName(*(id *)(a1 + 32));
        v21 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 67109890;
        v144 = v19;
        v145 = 2082;
        v146 = v20;
        v147 = 2082;
        v148 = v21;
        v149 = 1024;
        v150 = 1563;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Unknown error", buf, 0x22u);
      }
      v22 = "Unknown error";
      goto LABEL_104;
    case 0:
      if (!byte_10005C3E8)
      {
        v37 = 0;
        goto LABEL_107;
      }
      v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v24 = NFLogGetLogger(v23);
      if (v24)
      {
        v25 = (void (*)(uint64_t, const char *, ...))v24;
        v26 = object_getClass(*(id *)(a1 + 32));
        v27 = class_isMetaClass(v26);
        v28 = object_getClassName(*(id *)(a1 + 32));
        v133 = sel_getName(*(SEL *)(a1 + 48));
        v29 = 45;
        if (v27)
          v29 = 43;
        v25(6, "%c[%{public}s %{public}s]:%i [TSM] Success", v29, v28, v133, 1534);
      }
      v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v31 = NFSharedLogGetLogger(v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v33))
          v34 = 43;
        else
          v34 = 45;
        v35 = object_getClassName(*(id *)(a1 + 32));
        v36 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 67109890;
        v144 = v34;
        v145 = 2082;
        v146 = v35;
        v147 = 2082;
        v148 = v36;
        v149 = 1024;
        v150 = 1534;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Success", buf, 0x22u);
      }
      v37 = 0;
      goto LABEL_106;
    case 1:
      if (!byte_10005C3E8)
      {
        v22 = "Session aborted";
        goto LABEL_105;
      }
      v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v39 = NFLogGetLogger(v38);
      if (v39)
      {
        v40 = (void (*)(uint64_t, const char *, ...))v39;
        v41 = object_getClass(*(id *)(a1 + 32));
        v42 = class_isMetaClass(v41);
        v43 = object_getClassName(*(id *)(a1 + 32));
        v134 = sel_getName(*(SEL *)(a1 + 48));
        v44 = 45;
        if (v42)
          v44 = 43;
        v40(6, "%c[%{public}s %{public}s]:%i [TSM] Session aborted", v44, v43, v134, 1548);
      }
      v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v46 = NFSharedLogGetLogger(v45);
      v17 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v47 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v47))
          v48 = 43;
        else
          v48 = 45;
        v49 = object_getClassName(*(id *)(a1 + 32));
        v50 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 67109890;
        v144 = v48;
        v145 = 2082;
        v146 = v49;
        v147 = 2082;
        v148 = v50;
        v149 = 1024;
        v150 = 1548;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Session aborted", buf, 0x22u);
      }
      v22 = "Session aborted";
      goto LABEL_104;
    case 2:
      if (!byte_10005C3E8)
      {
        v22 = "Network Error";
        goto LABEL_105;
      }
      v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v52 = NFLogGetLogger(v51);
      if (v52)
      {
        v53 = (void (*)(uint64_t, const char *, ...))v52;
        v54 = object_getClass(*(id *)(a1 + 32));
        v55 = class_isMetaClass(v54);
        v56 = object_getClassName(*(id *)(a1 + 32));
        v135 = sel_getName(*(SEL *)(a1 + 48));
        v57 = 45;
        if (v55)
          v57 = 43;
        v53(6, "%c[%{public}s %{public}s]:%i [TSM] Network Error", v57, v56, v135, 1543);
      }
      v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v59 = NFSharedLogGetLogger(v58);
      v17 = objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v60 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v60))
          v61 = 43;
        else
          v61 = 45;
        v62 = object_getClassName(*(id *)(a1 + 32));
        v63 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 67109890;
        v144 = v61;
        v145 = 2082;
        v146 = v62;
        v147 = 2082;
        v148 = v63;
        v149 = 1024;
        v150 = 1543;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Network Error", buf, 0x22u);
      }
      v22 = "Network Error";
      goto LABEL_104;
    case 3:
      if (!byte_10005C3E8)
      {
        v22 = "External Tag Unavailable";
        goto LABEL_105;
      }
      v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v65 = NFLogGetLogger(v64);
      if (v65)
      {
        v66 = (void (*)(uint64_t, const char *, ...))v65;
        v67 = object_getClass(*(id *)(a1 + 32));
        v68 = class_isMetaClass(v67);
        v69 = object_getClassName(*(id *)(a1 + 32));
        v136 = sel_getName(*(SEL *)(a1 + 48));
        v70 = 45;
        if (v68)
          v70 = 43;
        v66(6, "%c[%{public}s %{public}s]:%i [TSM] External Tag Unavailable", v70, v69, v136, 1538);
      }
      v71 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v72 = NFSharedLogGetLogger(v71);
      v17 = objc_claimAutoreleasedReturnValue(v72);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v73 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v73))
          v74 = 43;
        else
          v74 = 45;
        v75 = object_getClassName(*(id *)(a1 + 32));
        v76 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 67109890;
        v144 = v74;
        v145 = 2082;
        v146 = v75;
        v147 = 2082;
        v148 = v76;
        v149 = 1024;
        v150 = 1538;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] External Tag Unavailable", buf, 0x22u);
      }
      v22 = "External Tag Unavailable";
      goto LABEL_104;
    case 4:
      if (!byte_10005C3E8)
      {
        v22 = "Unsupported tag";
        goto LABEL_105;
      }
      v77 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v78 = NFLogGetLogger(v77);
      if (v78)
      {
        v79 = (void (*)(uint64_t, const char *, ...))v78;
        v80 = object_getClass(*(id *)(a1 + 32));
        v81 = class_isMetaClass(v80);
        v82 = object_getClassName(*(id *)(a1 + 32));
        v137 = sel_getName(*(SEL *)(a1 + 48));
        v83 = 45;
        if (v81)
          v83 = 43;
        v79(6, "%c[%{public}s %{public}s]:%i [TSM] Unsupported tag", v83, v82, v137, 1553);
      }
      v84 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v85 = NFSharedLogGetLogger(v84);
      v17 = objc_claimAutoreleasedReturnValue(v85);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v86 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v86))
          v87 = 43;
        else
          v87 = 45;
        v88 = object_getClassName(*(id *)(a1 + 32));
        v89 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 67109890;
        v144 = v87;
        v145 = 2082;
        v146 = v88;
        v147 = 2082;
        v148 = v89;
        v149 = 1024;
        v150 = 1553;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Unsupported tag", buf, 0x22u);
      }
      v22 = "Unsupported tag";
      goto LABEL_104;
    case 5:
      if (!byte_10005C3E8)
      {
        v22 = "Tag access error";
        goto LABEL_105;
      }
      v90 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v91 = NFLogGetLogger(v90);
      if (v91)
      {
        v92 = (void (*)(uint64_t, const char *, ...))v91;
        v93 = object_getClass(*(id *)(a1 + 32));
        v94 = class_isMetaClass(v93);
        v95 = object_getClassName(*(id *)(a1 + 32));
        v138 = sel_getName(*(SEL *)(a1 + 48));
        v96 = 45;
        if (v94)
          v96 = 43;
        v92(6, "%c[%{public}s %{public}s]:%i [TSM] Tag access error", v96, v95, v138, 1568);
      }
      v97 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v98 = NFSharedLogGetLogger(v97);
      v17 = objc_claimAutoreleasedReturnValue(v98);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v99 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v99))
          v100 = 43;
        else
          v100 = 45;
        v101 = object_getClassName(*(id *)(a1 + 32));
        v102 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 67109890;
        v144 = v100;
        v145 = 2082;
        v146 = v101;
        v147 = 2082;
        v148 = v102;
        v149 = 1024;
        v150 = 1568;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Tag access error", buf, 0x22u);
      }
      v22 = "Tag access error";
      goto LABEL_104;
    case 6:
      if (!byte_10005C3E8)
      {
        v22 = "Bad Command error";
        goto LABEL_105;
      }
      v103 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v104 = NFLogGetLogger(v103);
      if (v104)
      {
        v105 = (void (*)(uint64_t, const char *, ...))v104;
        v106 = object_getClass(*(id *)(a1 + 32));
        v107 = class_isMetaClass(v106);
        v108 = object_getClassName(*(id *)(a1 + 32));
        v139 = sel_getName(*(SEL *)(a1 + 48));
        v109 = 45;
        if (v107)
          v109 = 43;
        v105(6, "%c[%{public}s %{public}s]:%i [TSM] Bad Communication Error", v109, v108, v139, 1558);
      }
      v110 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v111 = NFSharedLogGetLogger(v110);
      v17 = objc_claimAutoreleasedReturnValue(v111);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v112 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v112))
          v113 = 43;
        else
          v113 = 45;
        v114 = object_getClassName(*(id *)(a1 + 32));
        v115 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 67109890;
        v144 = v113;
        v145 = 2082;
        v146 = v114;
        v147 = 2082;
        v148 = v115;
        v149 = 1024;
        v150 = 1558;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Bad Communication Error", buf, 0x22u);
      }
      v22 = "Bad Command error";
      goto LABEL_104;
    case 7:
      if (byte_10005C3E8)
      {
        v116 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v117 = NFLogGetLogger(v116);
        if (v117)
        {
          v118 = (void (*)(uint64_t, const char *, ...))v117;
          v119 = object_getClass(*(id *)(a1 + 32));
          v120 = class_isMetaClass(v119);
          v121 = object_getClassName(*(id *)(a1 + 32));
          v140 = sel_getName(*(SEL *)(a1 + 48));
          v122 = 45;
          if (v120)
            v122 = 43;
          v118(6, "%c[%{public}s %{public}s]:%i [TSM] Reader mode protection enabled", v122, v121, v140, 1573);
        }
        v123 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v124 = NFSharedLogGetLogger(v123);
        v17 = objc_claimAutoreleasedReturnValue(v124);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v125 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v125))
            v126 = 43;
          else
            v126 = 45;
          v127 = object_getClassName(*(id *)(a1 + 32));
          v128 = sel_getName(*(SEL *)(a1 + 48));
          *(_DWORD *)buf = 67109890;
          v144 = v126;
          v145 = 2082;
          v146 = v127;
          v147 = 2082;
          v148 = v128;
          v149 = 1024;
          v150 = 1573;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Reader mode protection enabled", buf, 0x22u);
        }
        v22 = "Reader mode protection enabled";
LABEL_104:

      }
      else
      {
        v22 = "Reader mode protection enabled";
      }
LABEL_105:
      v129 = objc_alloc((Class)NSError);
      v32 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
      v141 = NSLocalizedDescriptionKey;
      v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v22));
      v142 = v130;
      v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1));
      v37 = objc_msgSend(v129, "initWithDomain:code:userInfo:", v32, a3, v131);

LABEL_106:
LABEL_107:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      return;
    default:
      v22 = 0;
      goto LABEL_105;
  }
}

void sub_1000253A8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v13;
  void *v14;
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
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  NSErrorUserInfoKey v32;
  const __CFString *v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;

  v5 = a2;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "step")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v15 = 45;
    if (isMetaClass)
      v15 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i state=%{public}@, spSessionStatus=%{public}@", v15, ClassName, Name, 1602, v13, v14);

  }
  v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v17 = NFSharedLogGetLogger(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v19))
      v20 = 43;
    else
      v20 = 45;
    v21 = object_getClassName(*(id *)(a1 + 32));
    v22 = sel_getName(*(SEL *)(a1 + 56));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "step")));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    *(_DWORD *)buf = 67110402;
    v35 = v20;
    v36 = 2082;
    v37 = v21;
    v38 = 2082;
    v39 = v22;
    v40 = 1024;
    v41 = 1602;
    v42 = 2114;
    v43 = v23;
    v44 = 2114;
    v45 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i state=%{public}@, spSessionStatus=%{public}@", buf, 0x36u);

  }
  if (objc_msgSend(v5, "isComplete"))
  {
    v25 = sub_100033D5C();
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    sub_1000395D8(v26, *(void **)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "handleCardIngestionStatus:", 11);
    sub_1000172F4(*(unsigned __int8 **)(a1 + 32));
  }
  else
  {
    v27 = *(_QWORD *)(a1 + 48);
    v28 = objc_alloc((Class)NSError);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
    v32 = NSLocalizedDescriptionKey;
    v33 = CFSTR("Pending card ingestion exist");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    v31 = objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2, v30);
    (*(void (**)(uint64_t, id, uint64_t))(v27 + 16))(v27, v31, -1);

  }
}

void sub_100025984(uint64_t a1, void *a2)
{
  id v3;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v8;
  const char *ClassName;
  const char *Name;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  void *v20;
  void *v21;
  void **v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  id v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void (*v44)(uint64_t, const char *, ...);
  objc_class *v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  objc_class *v52;
  int v53;
  const char *v54;
  const char *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void (*v62)(uint64_t, const char *, ...);
  objc_class *v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  objc_class *v70;
  int v71;
  const char *v72;
  const char *v73;
  void *v74;
  _BOOL4 v75;
  void **v76;
  void *v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  id v81;
  int v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void (*v93)(uint64_t, const char *, ...);
  objc_class *v94;
  uint64_t v95;
  const char *v96;
  const char *v97;
  void *v98;
  uint64_t v99;
  NSObject *v100;
  objc_class *v101;
  int v102;
  const char *v103;
  const char *v104;
  id v105;
  uint64_t v106;
  id v107;
  id v108;
  id v109;
  void *v110;
  void *v111;
  void (*v112)(uint64_t, const char *, ...);
  objc_class *v113;
  uint64_t v114;
  const char *v115;
  const char *v116;
  void *v117;
  uint64_t v118;
  NSObject *v119;
  objc_class *v120;
  int v121;
  const char *v122;
  const char *v123;
  NFRemoteAdminReaderState *v124;
  NSDictionary *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void (*v134)(uint64_t, const char *, ...);
  objc_class *v135;
  uint64_t v136;
  const char *v137;
  const char *v138;
  void *v139;
  uint64_t v140;
  NSObject *v141;
  objc_class *v142;
  int v143;
  const char *v144;
  const char *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  id v151;
  void *v152;
  id v153;
  void *v154;
  id v155;
  void *v156;
  id v157;
  uint64_t v158;
  void *i;
  void *v160;
  uint64_t v161;
  id v162;
  void *v163;
  void *v164;
  id v165;
  void *v166;
  void *v167;
  id v168;
  id v169;
  void *v170;
  void *v171;
  NSMutableDictionary *v172;
  id v173;
  NFRemoteAdminReaderState *v174;
  id v175;
  void *v176;
  id v177;
  id v178;
  _QWORD v179[5];
  id v180;
  const char *v181;
  id v182;
  _QWORD v183[5];
  NFRemoteAdminReaderState *v184;
  id v185;
  const char *v186;
  NSErrorUserInfoKey v187;
  uint8_t buf[8];
  __int16 v189;
  const char *v190;
  __int16 v191;
  const char *v192;
  __int16 v193;
  int v194;
  __int16 v195;
  id v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;

  v3 = a2;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(Class))
      v8 = 43;
    else
      v8 = 45;
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 64));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v6(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v8, ClassName, Name, 1630, v12);

  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    v18 = object_getClassName(*(id *)(a1 + 32));
    v19 = sel_getName(*(SEL *)(a1 + 64));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&buf[4] = v17;
    v189 = 2082;
    v190 = v18;
    v191 = 2082;
    v192 = v19;
    v193 = 1024;
    v194 = 1630;
    v195 = 2114;
    v196 = v21;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);

  }
  if (!v3)
  {
    v22 = *(void ***)(a1 + 32);
    v23 = *(void **)(a1 + 48);
    v24 = *(void **)(a1 + 56);
    v178 = v23;
    v177 = v24;
    if (!v22)
    {
LABEL_119:

      goto LABEL_120;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "serverIdentifier"));
    v26 = objc_msgSend(v25, "hasPrefix:", CFSTR("http"));
    if (v25)
    {
      v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v27);
      if (v28)
      {
        v29 = object_getClass(v22);
        if (class_isMetaClass(v29))
          v30 = 43;
        else
          v30 = 45;
        v31 = object_getClassName(v22);
        v32 = sel_getName("_ingestCard:callback:");
        v28(6, "%c[%{public}s %{public}s]:%i identifier : %{public}@", v30, v31, v32, 1477, v25);
      }
      v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v34 = NFSharedLogGetLogger(v33);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = object_getClass(v22);
        if (class_isMetaClass(v36))
          v37 = 43;
        else
          v37 = 45;
        v38 = object_getClassName(v22);
        v39 = sel_getName("_ingestCard:callback:");
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = v37;
        v189 = 2082;
        v190 = v38;
        v191 = 2082;
        v192 = v39;
        v193 = 1024;
        v194 = 1477;
        v195 = 2114;
        v196 = v25;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i identifier : %{public}@", buf, 0x2Cu);
      }

      if ((v26 & 1) == 0)
      {
        v40 = sub_100037538(v22[3], v25);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        v42 = v41 == 0;

        if (v42)
        {
          v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v44 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v43);
          if (v44)
          {
            v45 = object_getClass(v22);
            if (class_isMetaClass(v45))
              v46 = 43;
            else
              v46 = 45;
            v47 = object_getClassName(v22);
            v48 = sel_getName("_ingestCard:callback:");
            v44(4, "%c[%{public}s %{public}s]:%i No registered URL for %{public}@", v46, v47, v48, 1479, v25);
          }
          v49 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v50 = NFSharedLogGetLogger(v49);
          v51 = objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            v52 = object_getClass(v22);
            if (class_isMetaClass(v52))
              v53 = 43;
            else
              v53 = 45;
            v54 = object_getClassName(v22);
            v55 = sel_getName("_ingestCard:callback:");
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)&buf[4] = v53;
            v189 = 2082;
            v190 = v54;
            v191 = 2082;
            v192 = v55;
            v193 = 1024;
            v194 = 1479;
            v195 = 2114;
            v196 = v25;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No registered URL for %{public}@", buf, 0x2Cu);
          }

          v56 = objc_alloc((Class)NSError);
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
          *(_QWORD *)&v197 = NSLocalizedDescriptionKey;
          *(_QWORD *)buf = CFSTR("No registered URL.");
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v197, 1));
          v59 = objc_msgSend(v56, "initWithDomain:code:userInfo:", v57, 39, v58);
          (*((void (**)(id, id, uint64_t))v177 + 2))(v177, v59, -1);

          goto LABEL_118;
        }
      }
    }
    else
    {
      v60 = sub_10003758C(v22[3]);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v60);
      if (!v25)
      {
        v88 = objc_alloc((Class)NSError);
        v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
        *(_QWORD *)&v197 = NSLocalizedDescriptionKey;
        *(_QWORD *)buf = CFSTR("No registration info.");
        v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v197, 1));
        v91 = objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 39, v90);
        (*((void (**)(id, id, uint64_t))v177 + 2))(v177, v91, -1);

        v25 = 0;
LABEL_118:

        goto LABEL_119;
      }
      v61 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v62 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v61);
      if (v62)
      {
        v63 = object_getClass(v22);
        if (class_isMetaClass(v63))
          v64 = 43;
        else
          v64 = 45;
        v65 = object_getClassName(v22);
        v66 = sel_getName("_ingestCard:callback:");
        v62(6, "%c[%{public}s %{public}s]:%i default = %{public}@", v64, v65, v66, 1485, v25);
      }
      v67 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v68 = NFSharedLogGetLogger(v67);
      v69 = objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        v70 = object_getClass(v22);
        if (class_isMetaClass(v70))
          v71 = 43;
        else
          v71 = 45;
        v72 = object_getClassName(v22);
        v73 = sel_getName("_ingestCard:callback:");
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = v71;
        v189 = 2082;
        v190 = v72;
        v191 = 2082;
        v192 = v73;
        v193 = 1024;
        v194 = 1485;
        v195 = 2114;
        v196 = v25;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i default = %{public}@", buf, 0x2Cu);
      }

    }
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "uri"));
    v75 = v74 == 0;

    if (v75)
    {
      v83 = objc_alloc((Class)NSError);
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
      *(_QWORD *)&v197 = NSLocalizedDescriptionKey;
      *(_QWORD *)buf = CFSTR("Missing parameter");
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v197, 1));
      v86 = objc_msgSend(v83, "initWithDomain:code:userInfo:", v84, 9, v85);
      (*((void (**)(id, id, uint64_t))v177 + 2))(v177, v86, -1);

    }
    else
    {
      v76 = v22;
      objc_sync_enter(v76);
      v77 = v76[12];
      v78 = objc_opt_class(NFRemoteAdminReaderSession);
      if ((objc_opt_isKindOfClass(v77, v78) & 1) != 0)
      {
        v79 = objc_alloc((Class)NSError);
        v80 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
        *(_QWORD *)&v197 = NSLocalizedDescriptionKey;
        *(_QWORD *)buf = CFSTR("Card ingestion is in progress");
        v176 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v197, 1));
        v81 = objc_msgSend(v79, "initWithDomain:code:userInfo:", v80, 2, v176);
        (*((void (**)(id, id, uint64_t))v177 + 2))(v177, v81, -1);
        v175 = (id)v80;
        v82 = 1;
      }
      else
      {
        v182 = 0;
        v87 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", &v182));
        v175 = v182;
        v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "serialNumber"));

        if (v176)
        {
          if (v26)
          {
            v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v25));
          }
          else
          {
            v108 = sub_100037538(v76[3], v25);
            v171 = (void *)objc_claimAutoreleasedReturnValue(v108);
          }
          v109 = objc_alloc((Class)NSString);
          v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "uri"));
          v173 = objc_msgSend(v109, "initWithFormat:", CFSTR("v2/%@/%@"), v176, v110);

          v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "URLByAppendingPathComponent:", v173));
          v111 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v112 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v111);
          if (v112)
          {
            v113 = object_getClass(v76);
            if (class_isMetaClass(v113))
              v114 = 43;
            else
              v114 = 45;
            v115 = object_getClassName(v76);
            v116 = sel_getName("_ingestCard:callback:");
            v112(6, "%c[%{public}s %{public}s]:%i url: %{public}@", v114, v115, v116, 1519, v170);
          }
          v117 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v118 = NFSharedLogGetLogger(v117);
          v119 = objc_claimAutoreleasedReturnValue(v118);
          if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
          {
            v120 = object_getClass(v76);
            if (class_isMetaClass(v120))
              v121 = 43;
            else
              v121 = 45;
            v122 = object_getClassName(v76);
            v123 = sel_getName("_ingestCard:callback:");
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)&buf[4] = v121;
            v189 = 2082;
            v190 = v122;
            v191 = 2082;
            v192 = v123;
            v193 = 1024;
            v194 = 1519;
            v195 = 2114;
            v196 = v170;
            _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i url: %{public}@", buf, 0x2Cu);
          }

          v124 = [NFRemoteAdminReaderState alloc];
          v125 = objc_opt_new(NSDictionary);
          v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "absoluteString"));
          v174 = -[NFRemoteAdminReaderState initWithDictionary:sourceURL:originator:](v124, "initWithDictionary:sourceURL:originator:", v125, v126, v25);

          -[NFRemoteAdminState setPendingImmediateRetry:](v174, "setPendingImmediateRetry:", 1);
          -[NFRemoteAdminReaderState setRequestInfo:](v174, "setRequestInfo:", v178);
          v179[0] = _NSConcreteStackBlock;
          v179[1] = 3221225472;
          v179[2] = sub_10002472C;
          v179[3] = &unk_100054C30;
          v179[4] = v76;
          v181 = "_ingestCard:callback:";
          v169 = v177;
          v180 = v169;
          -[NFRemoteAdminReaderState setStateUpdateOnSessionEndedCallback:](v174, "setStateUpdateOnSessionEndedCallback:", v179);
          v127 = v178;
          v172 = objc_opt_new(NSMutableDictionary);
          v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "sessionToken"));
          v129 = v128;
          if (v128 && objc_msgSend(v128, "length"))
            -[NSMutableDictionary setObject:forKeyedSubscript:](v172, "setObject:forKeyedSubscript:", v129, CFSTR("cardSessionToken"));
          v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "cardServiceInfo"));
          v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "objectForKey:", CFSTR("technology")));

          if (v131)
          {
            v132 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v131, v132) & 1) != 0 && objc_msgSend(v131, "length"))
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](v172, "setObject:forKeyedSubscript:", v131, CFSTR("technology"));
            }
            else
            {
              v133 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v134 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v133);
              if (v134)
              {
                v135 = object_getClass(v76);
                if (class_isMetaClass(v135))
                  v136 = 43;
                else
                  v136 = 45;
                v137 = object_getClassName(v76);
                v138 = sel_getName("_generateReaderParamsFromRequest:");
                v134(4, "%c[%{public}s %{public}s]:%i Unexpected technology object type", v136, v137, v138, 1085);
              }
              v139 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v140 = NFSharedLogGetLogger(v139);
              v141 = objc_claimAutoreleasedReturnValue(v140);
              if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
              {
                v142 = object_getClass(v76);
                if (class_isMetaClass(v142))
                  v143 = 43;
                else
                  v143 = 45;
                v144 = object_getClassName(v76);
                v145 = sel_getName("_generateReaderParamsFromRequest:");
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)&buf[4] = v143;
                v189 = 2082;
                v190 = v144;
                v191 = 2082;
                v192 = v145;
                v193 = 1024;
                v194 = 1085;
                _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected technology object type", buf, 0x22u);
              }

            }
          }
          v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "cardServiceInfo"));
          v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "objectForKey:", CFSTR("version")));

          if (!v147 || (v148 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v147, v148) & 1) == 0))
          {
            v149 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));

            v147 = (void *)v149;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v172, "setObject:forKeyedSubscript:", v147, CFSTR("version"));

          -[NFRemoteAdminReaderState setParameters:](v174, "setParameters:", v172);
          v150 = v76[3];
          v151 = sub_10001A158((uint64_t)v76, CFSTR("seld"));
          v152 = (void *)objc_claimAutoreleasedReturnValue(v151);
          sub_100037DF0(v150, v152);

          v199 = 0u;
          v200 = 0u;
          v197 = 0u;
          v198 = 0u;
          v153 = sub_100033D5C();
          v154 = (void *)objc_claimAutoreleasedReturnValue(v153);
          v155 = sub_10003956C(v154);
          v156 = (void *)objc_claimAutoreleasedReturnValue(v155);

          v157 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v197, buf, 16);
          if (v157)
          {
            v158 = *(_QWORD *)v198;
            while (2)
            {
              for (i = 0; i != v157; i = (char *)i + 1)
              {
                if (*(_QWORD *)v198 != v158)
                  objc_enumerationMutation(v156);
                v160 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * (_QWORD)i);
                v161 = objc_opt_class(NFRemoteAdminReaderState);
                if ((objc_opt_isKindOfClass(v160, v161) & 1) != 0)
                {
                  v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "stateUpdateOnSessionEndedCallback"));

                  if (v164)
                  {
                    v165 = objc_alloc((Class)NSError);
                    v166 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
                    v187 = NSLocalizedDescriptionKey;
                    v183[0] = CFSTR("Pending card ingestion exist");
                    v167 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v183, &v187, 1));
                    v168 = objc_msgSend(v165, "initWithDomain:code:userInfo:", v166, 2, v167);
                    (*((void (**)(id, id, uint64_t))v169 + 2))(v169, v168, -1);

                  }
                  else
                  {
                    objc_msgSend(v160, "setPendingImmediateRetry:", 1);
                    v183[0] = _NSConcreteStackBlock;
                    v183[1] = 3221225472;
                    v183[2] = sub_1000253A8;
                    v183[3] = &unk_100054C58;
                    v183[4] = v76;
                    v186 = "_ingestCard:callback:";
                    v184 = v174;
                    v185 = v169;
                    objc_msgSend(v160, "setStateUpdateOnSessionEndedCallback:", v183);
                    sub_1000172F4((unsigned __int8 *)v76);

                  }
                  v82 = 1;
                  goto LABEL_114;
                }
              }
              v157 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v197, buf, 16);
              if (v157)
                continue;
              break;
            }
          }

          v162 = sub_100033D5C();
          v163 = (void *)objc_claimAutoreleasedReturnValue(v162);
          sub_1000395D8(v163, v174);

          objc_msgSend(v76, "handleCardIngestionStatus:", 11);
          v82 = 0;
LABEL_114:

          v107 = v170;
        }
        else
        {
          v92 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v93 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v92);
          if (v93)
          {
            v94 = object_getClass(v76);
            if (class_isMetaClass(v94))
              v95 = 43;
            else
              v95 = 45;
            v96 = object_getClassName(v76);
            v97 = sel_getName("_ingestCard:callback:");
            v93(3, "%c[%{public}s %{public}s]:%i Missing primary SEID - %{public}@", v95, v96, v97, 1505, v175);
          }
          v98 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v99 = NFSharedLogGetLogger(v98);
          v100 = objc_claimAutoreleasedReturnValue(v99);
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            v101 = object_getClass(v76);
            if (class_isMetaClass(v101))
              v102 = 43;
            else
              v102 = 45;
            v103 = object_getClassName(v76);
            v104 = sel_getName("_ingestCard:callback:");
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)&buf[4] = v102;
            v189 = 2082;
            v190 = v103;
            v191 = 2082;
            v192 = v104;
            v193 = 1024;
            v194 = 1505;
            v195 = 2114;
            v196 = v175;
            _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing primary SEID - %{public}@", buf, 0x2Cu);
          }

          v105 = objc_alloc((Class)NSError);
          v106 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
          *(_QWORD *)&v197 = NSLocalizedDescriptionKey;
          *(_QWORD *)buf = CFSTR("Missing SEID");
          v173 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v197, 1));
          v107 = objc_msgSend(v105, "initWithDomain:code:userInfo:", v106, 15, v173);
          (*((void (**)(id, id, uint64_t))v177 + 2))(v177, v107, -1);
          v171 = (void *)v106;
          v82 = 1;
        }

        v81 = v171;
      }

      objc_sync_exit(v76);
      if (!v82)
        sub_1000172F4((unsigned __int8 *)v76);
    }
    goto LABEL_118;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_120:

}

void sub_100026C1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100026F08(uint64_t a1, void *a2)
{
  id v3;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v8;
  const char *ClassName;
  const char *Name;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(id, _QWORD);
  id *v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  NSErrorUserInfoKey v44;
  const __CFString *v45;
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

  v3 = a2;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(Class))
      v8 = 43;
    else
      v8 = 45;
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v6(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v8, ClassName, Name, 1675, v12);

  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    v18 = object_getClassName(*(id *)(a1 + 32));
    v19 = sel_getName(*(SEL *)(a1 + 56));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v47 = v17;
    v48 = 2082;
    v49 = v18;
    v50 = 2082;
    v51 = v19;
    v52 = 1024;
    v53 = 1675;
    v54 = 2114;
    v55 = v21;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);

  }
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v22 = *(void **)(a1 + 32);
    v23 = (void (**)(id, _QWORD))*(id *)(a1 + 48);
    if (v22)
    {
      v24 = v22;
      objc_sync_enter(v24);
      v25 = v24[12];
      v26 = objc_opt_class(NFRemoteAdminReaderSession);
      if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
      {
        objc_msgSend(v24[12], "abort:", 1);
LABEL_26:
        objc_sync_exit(v24);

        v23[2](v23, 0);
      }
      else
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v27 = sub_100033D5C();
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        v29 = sub_10003956C(v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, buf, 16);
        if (v31)
        {
          v32 = *(_QWORD *)v41;
          while (2)
          {
            v33 = 0;
            do
            {
              if (*(_QWORD *)v41 != v32)
                objc_enumerationMutation(v30);
              v34 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v33);
              v35 = objc_opt_class(NFRemoteAdminReaderState);
              if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0)
              {
                objc_msgSend(v34, "setStep:", 4);
                objc_msgSend(v34, "save");

                goto LABEL_26;
              }
              v33 = (char *)v33 + 1;
            }
            while (v31 != v33);
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, buf, 16);
            if (v31)
              continue;
            break;
          }
        }

        objc_sync_exit(v24);
        v36 = objc_alloc((Class)NSError);
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
        v44 = NSLocalizedDescriptionKey;
        v45 = CFSTR("No pending ReaderSession");
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
        v39 = objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 12, v38);
        ((void (**)(id, id))v23)[2](v23, v39);

      }
    }

  }
}

void sub_100027314(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002733C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  id v20;
  id *v21;
  NSMutableDictionary *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
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
  const char *v40;
  const char *v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  const char *ClassName;
  const char *Name;
  const char *v52;
  NSErrorUserInfoKey v53;
  const __CFString *v54;
  NSErrorUserInfoKey v55;
  const __CFString *v56;
  uint8_t buf[4];
  int v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  id v66;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 1691, v6);
    }
    v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      v18 = object_getClassName(*(id *)(a1 + 32));
      v19 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v58 = v17;
      v59 = 2082;
      v60 = v18;
      v61 = 2082;
      v62 = v19;
      v63 = 1024;
      v64 = 1691;
      v65 = 2114;
      v66 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v20 = sub_100033D5C();
    v21 = (id *)objc_claimAutoreleasedReturnValue(v20);
    v22 = sub_100038918(v21, &stru_100055418, v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    if (v23)
    {
      v24 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "publicToken"));
      if (v25)
      {
        v26 = v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "NF_asHexString"));
        objc_msgSend(v24, "setObject:forKey:", v27, CFSTR("APNTokenUpdateInfo"));

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      else
      {
        v45 = *(_QWORD *)(a1 + 40);
        v46 = objc_alloc((Class)NSError);
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
        v53 = NSLocalizedDescriptionKey;
        v54 = CFSTR("Failed getting token info");
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
        v49 = objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 40, v48);
        (*(void (**)(uint64_t, _QWORD, id))(v45 + 16))(v45, 0, v49);

        v26 = 0;
      }
    }
    else
    {
      v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v29 = NFLogGetLogger(v28);
      if (v29)
      {
        v30 = (void (*)(uint64_t, const char *, ...))v29;
        v31 = object_getClass(*(id *)(a1 + 32));
        v32 = class_isMetaClass(v31);
        v33 = object_getClassName(*(id *)(a1 + 32));
        v52 = sel_getName(*(SEL *)(a1 + 48));
        v34 = 45;
        if (v32)
          v34 = 43;
        v30(3, "%c[%{public}s %{public}s]:%i Failed getting SELD info", v34, v33, v52, 1698);
      }
      v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v36 = NFSharedLogGetLogger(v35);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v38))
          v39 = 43;
        else
          v39 = 45;
        v40 = object_getClassName(*(id *)(a1 + 32));
        v41 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 67109890;
        v58 = v39;
        v59 = 2082;
        v60 = v40;
        v61 = 2082;
        v62 = v41;
        v63 = 1024;
        v64 = 1698;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed getting SELD info", buf, 0x22u);
      }

      v42 = *(_QWORD *)(a1 + 40);
      v43 = objc_alloc((Class)NSError);
      v24 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
      v55 = NSLocalizedDescriptionKey;
      v56 = CFSTR("Failed getting SELD info");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
      v44 = objc_msgSend(v43, "initWithDomain:code:userInfo:", v24, 12, v26);
      (*(void (**)(uint64_t, _QWORD, id))(v42 + 16))(v42, 0, v44);

    }
    objc_msgSend(v5, "endSession");

  }
}

void sub_100027AA8(uint64_t a1, void *a2)
{
  id v3;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint8_t buf[8];
  _BYTE v28[40];
  const char *v29;

  v3 = a2;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v13 = 45;
    if (isMetaClass)
      v13 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v13, ClassName, Name, 1722, v12);

  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    v19 = object_getClassName(*(id *)(a1 + 32));
    v20 = sel_getName(*(SEL *)(a1 + 56));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&buf[4] = v18;
    *(_WORD *)v28 = 2082;
    *(_QWORD *)&v28[2] = v19;
    *(_WORD *)&v28[10] = 2082;
    *(_QWORD *)&v28[12] = v20;
    *(_WORD *)&v28[20] = 1024;
    *(_DWORD *)&v28[22] = 1722;
    *(_WORD *)&v28[26] = 2114;
    *(_QWORD *)&v28[28] = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);

  }
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(id *)(a1 + 48);
    if (v23)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)v28 = 3221225472;
      *(_QWORD *)&v28[8] = sub_10002733C;
      *(_QWORD *)&v28[16] = &unk_100054CD0;
      *(_QWORD *)&v28[24] = v23;
      v29 = "_getSELDInfoForBrokerWithCompletion:";
      *(_QWORD *)&v28[32] = v24;
      v26 = objc_msgSend(v25, "startSecureElementManagerSession:", buf);

    }
  }

}

void sub_100027D58(void **a1, int a2, void *a3)
{
  dispatch_semaphore_t v4;
  void *v5;
  id v6;
  char v7;
  dispatch_time_t v8;
  intptr_t v9;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v13;
  const char *ClassName;
  const char *Name;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  void *v40;
  void *v41;
  id *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void (*v50)(uint64_t, const char *, ...);
  objc_class *v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  void *v55;
  uint64_t v56;
  objc_class *v57;
  int v58;
  const char *v59;
  const char *v60;
  void *v61;
  void (*v62)(uint64_t, const char *, ...);
  objc_class *v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  objc_class *v70;
  int v71;
  const char *v72;
  const char *v73;
  id v74;
  id v75;
  uint64_t v76;
  void *i;
  NFRemoteAdminState *v78;
  void *v79;
  id v80;
  void *j;
  void *v82;
  NFRemoteAdminState *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  uint64_t v88;
  NFRemoteAdminState *v89;
  void *v90;
  void (*v91)(uint64_t, const char *, ...);
  objc_class *v92;
  uint64_t v93;
  const char *v94;
  const char *v95;
  void *v96;
  uint64_t v97;
  NSObject *v98;
  objc_class *v99;
  int v100;
  const char *v101;
  const char *v102;
  BOOL v103;
  id v104;
  id v105;
  void (**v106)(id, _QWORD);
  dispatch_semaphore_t dsema;
  id obj;
  uint64_t v109;
  id v110;
  id v112;
  char v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint64_t v122;
  uint64_t v123;
  _QWORD v124[4];
  dispatch_semaphore_t v125;
  uint64_t *v126;
  uint64_t *v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t (*v131)(uint64_t, uint64_t);
  void (*v132)(uint64_t);
  id v133;
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t (*v137)(uint64_t, uint64_t);
  void (*v138)(uint64_t);
  id v139;
  _BYTE v140[128];
  _BYTE v141[128];
  int buf;
  int v143;
  __int16 v144;
  const char *v145;
  __int16 v146;
  const char *v147;
  __int16 v148;
  int v149;
  __int16 v150;
  void *v151;

  v106 = a3;
  if (a1)
  {
    v134 = 0;
    v135 = &v134;
    v136 = 0x3032000000;
    v137 = sub_10001E434;
    v138 = sub_10001E444;
    v139 = 0;
    v128 = 0;
    v129 = &v128;
    v130 = 0x3032000000;
    v131 = sub_10001E434;
    v132 = sub_10001E444;
    v133 = 0;
    v4 = dispatch_semaphore_create(0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
    v124[0] = _NSConcreteStackBlock;
    v124[1] = 3221225472;
    v124[2] = sub_1000288CC;
    v124[3] = &unk_100054CF8;
    v126 = &v134;
    v127 = &v128;
    dsema = v4;
    v125 = dsema;
    v6 = objc_msgSend(v5, "startSecureElementManagerSession:", v124);

    v7 = 0;
    do
    {
      while (1)
      {
        v8 = dispatch_time(0, 300000000000);
        v9 = dispatch_semaphore_wait(dsema, v8);
        if (v7 & 1 | (v9 == 0))
          break;
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
        if (Logger)
        {
          Class = object_getClass(a1);
          if (class_isMetaClass(Class))
            v13 = 43;
          else
            v13 = 45;
          ClassName = object_getClassName(a1);
          Name = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
          Logger(3, "%c[%{public}s %{public}s]:%i Exceeded session acquisition time expectation.", v13, ClassName, Name, 1755);
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
          v21 = object_getClassName(a1);
          v22 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
          buf = 67109890;
          v143 = v20;
          v144 = 2082;
          v145 = v21;
          v146 = 2082;
          v147 = v22;
          v148 = 1024;
          v149 = 1755;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Exceeded session acquisition time expectation.", (uint8_t *)&buf, 0x22u);
        }

        v23 = sub_1000180C8();
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        sub_10001CCC0((uint64_t)v24);

        v7 = 1;
      }
    }
    while (v9);
    if ((v7 & 1) != 0)
    {
      v25 = sub_1000180C8();
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      sub_10001CC7C((uint64_t)v26);

    }
    if (v135[5] || (v41 = (void *)v129[5]) == 0)
    {
      v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v27);
      if (v28)
      {
        v29 = object_getClass(a1);
        if (class_isMetaClass(v29))
          v30 = 43;
        else
          v30 = 45;
        v31 = object_getClassName(a1);
        v32 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
        v28(3, "%c[%{public}s %{public}s]:%i Unable to start session: %{public}@", v30, v31, v32, 1767, v135[5]);
      }
      v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v34 = NFSharedLogGetLogger(v33);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = object_getClass(a1);
        if (class_isMetaClass(v36))
          v37 = 43;
        else
          v37 = 45;
        v38 = object_getClassName(a1);
        v39 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
        v40 = (void *)v135[5];
        buf = 67110146;
        v143 = v37;
        v144 = 2082;
        v145 = v38;
        v146 = 2082;
        v147 = v39;
        v148 = 1024;
        v149 = 1767;
        v150 = 2114;
        v151 = v40;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to start session: %{public}@", (uint8_t *)&buf, 0x2Cu);
      }

      v106[2](v106, v135[5]);
    }
    else
    {
      if (a2 == 8 || a2 == 4)
      {
        v123 = 0;
        v42 = (id *)&v123;
        objc_msgSend(v41, "deleteAllAppletsOfType:queueConnection:error:");
      }
      else
      {
        v122 = 0;
        v42 = (id *)&v122;
        objc_msgSend(v41, "deleteAllApplets:error:", 0, &v122);
      }
      v105 = *v42;
      v43 = sub_100036110(a1[3]);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "allKeys"));

      if (objc_msgSend(v45, "count"))
      {
        v46 = a1[3];
        v47 = sub_10001A158((uint64_t)a1, 0);
        v48 = objc_claimAutoreleasedReturnValue(v47);
        sub_100037DF0(v46, v48);
      }
      else
      {
        v49 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v50 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v49);
        if (v50)
        {
          v51 = object_getClass(a1);
          if (class_isMetaClass(v51))
            v52 = 43;
          else
            v52 = 45;
          v53 = object_getClassName(a1);
          v54 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
          v50(5, "%c[%{public}s %{public}s]:%i No registered server identifiers", v52, v53, v54, 1783);
        }
        v55 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v56 = NFSharedLogGetLogger(v55);
        v48 = objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v57 = object_getClass(a1);
          if (class_isMetaClass(v57))
            v58 = 43;
          else
            v58 = 45;
          v59 = object_getClassName(a1);
          v60 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
          buf = 67109890;
          v143 = v58;
          v144 = 2082;
          v145 = v59;
          v146 = 2082;
          v147 = v60;
          v148 = 1024;
          v149 = 1783;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No registered server identifiers", (uint8_t *)&buf, 0x22u);
        }
      }

      v61 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v62 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v61);
      if (v62)
      {
        v63 = object_getClass(a1);
        if (class_isMetaClass(v63))
          v64 = 43;
        else
          v64 = 45;
        v65 = object_getClassName(a1);
        v66 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
        v62(6, "%c[%{public}s %{public}s]:%i registeredIdArray=%{public}@", v64, v65, v66, 1789, v45);
      }
      v67 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v68 = NFSharedLogGetLogger(v67);
      v69 = objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        v70 = object_getClass(a1);
        if (class_isMetaClass(v70))
          v71 = 43;
        else
          v71 = 45;
        v72 = object_getClassName(a1);
        v73 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
        buf = 67110146;
        v143 = v71;
        v144 = 2082;
        v145 = v72;
        v146 = 2082;
        v147 = v73;
        v148 = 1024;
        v149 = 1789;
        v150 = 2114;
        v151 = v45;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i registeredIdArray=%{public}@", (uint8_t *)&buf, 0x2Cu);
      }

      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      v74 = v45;
      v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v118, v141, 16);
      if (v75)
      {
        v76 = *(_QWORD *)v119;
        do
        {
          for (i = 0; i != v75; i = (char *)i + 1)
          {
            if (*(_QWORD *)v119 != v76)
              objc_enumerationMutation(v74);
            v78 = sub_100038214(a1[3], *(void **)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)i));
            v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
            objc_msgSend(v79, "setPendingImmediateRetry:", 1);
            objc_msgSend(v79, "save");

          }
          v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v118, v141, 16);
        }
        while (v75);
      }

      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      obj = v74;
      v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v140, 16);
      if (v80)
      {
        v112 = 0;
        v109 = *(_QWORD *)v115;
        do
        {
          v110 = v80;
          for (j = 0; j != v110; j = (char *)j + 1)
          {
            if (*(_QWORD *)v115 != v109)
              objc_enumerationMutation(obj);
            v82 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * (_QWORD)j);
            v83 = sub_100038214(a1[3], v82);
            v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
            v113 = 0;
            do
            {
              v85 = sub_100020C0C(a1, v84, 1, (void *)v129[5], &v113);
              v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
              if (v113)
              {
                v87 = sub_1000399D8(a1[3], v82);
                v88 = objc_claimAutoreleasedReturnValue(v87);

                v84 = (void *)v88;
                if (!v88)
                {
                  v89 = sub_100038214(a1[3], v82);
                  v84 = (void *)objc_claimAutoreleasedReturnValue(v89);
                  if (!v84)
                  {
                    v90 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v91 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v90);
                    if (v91)
                    {
                      v92 = object_getClass(a1);
                      if (class_isMetaClass(v92))
                        v93 = 43;
                      else
                        v93 = 45;
                      v94 = object_getClassName(a1);
                      v95 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
                      v91(4, "%c[%{public}s %{public}s]:%i Missing expected state info", v93, v94, v95, 1813);
                    }
                    v96 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v97 = NFSharedLogGetLogger(v96);
                    v98 = objc_claimAutoreleasedReturnValue(v97);
                    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                    {
                      v99 = object_getClass(a1);
                      if (class_isMetaClass(v99))
                        v100 = 43;
                      else
                        v100 = 45;
                      v101 = object_getClassName(a1);
                      v102 = sel_getName("_sync_deleteAllAppletsAndCleanupWithTSM:completion:");
                      buf = 67109890;
                      v143 = v100;
                      v144 = 2082;
                      v145 = v101;
                      v146 = 2082;
                      v147 = v102;
                      v148 = 1024;
                      v149 = 1813;
                      _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing expected state info", (uint8_t *)&buf, 0x22u);
                    }

                    v84 = 0;
                    v113 = 0;
                  }
                }
              }
              if (v86)
                v103 = 1;
              else
                v103 = v113 == 0;
            }
            while (!v103);
            if (v86)
            {
              v104 = v86;

              v112 = v104;
            }

          }
          v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v140, 16);
        }
        while (v80);
      }
      else
      {
        v112 = 0;
      }

      objc_msgSend((id)v129[5], "endSession");
      if (!v112 && v105)
        v112 = v105;
      ((void (**)(id, id))v106)[2](v106, v112);

    }
    _Block_object_dispose(&v128, 8);

    _Block_object_dispose(&v134, 8);
  }

}

void sub_10002882C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

void sub_1000288CC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100028BE4(uint64_t a1, void *a2)
{
  id v3;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
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

  v3 = a2;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v13 = 45;
    if (isMetaClass)
      v13 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v13, ClassName, Name, 1836, v12);

  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    v19 = object_getClassName(*(id *)(a1 + 32));
    v20 = sel_getName(*(SEL *)(a1 + 56));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v27 = v18;
    v28 = 2082;
    v29 = v19;
    v30 = 2082;
    v31 = v20;
    v32 = 1024;
    v33 = 1836;
    v34 = 2114;
    v35 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);

  }
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v23 = *(_QWORD *)(a1 + 32);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100028E54;
    v24[3] = &unk_100054D20;
    v24[4] = v23;
    v25 = *(id *)(a1 + 48);
    sub_10001B1E8(v23, v24);

  }
}

void sub_100028E54(uint64_t a1)
{
  sub_100027D58(*(void ***)(a1 + 32), 1, *(void **)(a1 + 40));
}

void sub_1000290FC(uint64_t a1, void *a2)
{
  id v3;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
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

  v3 = a2;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v13 = 45;
    if (isMetaClass)
      v13 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v13, ClassName, Name, 1854, v12);

  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    v19 = object_getClassName(*(id *)(a1 + 32));
    v20 = sel_getName(*(SEL *)(a1 + 56));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v27 = v18;
    v28 = 2082;
    v29 = v19;
    v30 = 2082;
    v31 = v20;
    v32 = 1024;
    v33 = 1854;
    v34 = 2114;
    v35 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);

  }
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v23 = *(_QWORD *)(a1 + 32);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10002936C;
    v24[3] = &unk_100054D20;
    v24[4] = v23;
    v25 = *(id *)(a1 + 48);
    sub_10001B1E8(v23, v24);

  }
}

void sub_10002936C(uint64_t a1)
{
  sub_100027D58(*(void ***)(a1 + 32), 4, *(void **)(a1 + 40));
}

void sub_100029614(uint64_t a1, void *a2)
{
  id v3;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
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

  v3 = a2;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v13 = 45;
    if (isMetaClass)
      v13 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v13, ClassName, Name, 1873, v12);

  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    v19 = object_getClassName(*(id *)(a1 + 32));
    v20 = sel_getName(*(SEL *)(a1 + 56));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v27 = v18;
    v28 = 2082;
    v29 = v19;
    v30 = 2082;
    v31 = v20;
    v32 = 1024;
    v33 = 1873;
    v34 = 2114;
    v35 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);

  }
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v23 = *(_QWORD *)(a1 + 32);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100029884;
    v24[3] = &unk_100054D20;
    v24[4] = v23;
    v25 = *(id *)(a1 + 48);
    sub_10001B1E8(v23, v24);

  }
}

void sub_100029884(uint64_t a1)
{
  sub_100027D58(*(void ***)(a1 + 32), 8, *(void **)(a1 + 40));
}

void sub_100029B2C(uint64_t a1, void *a2)
{
  id v3;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void (**v24)(id, void *, _QWORD);
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[8];
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  NSErrorUserInfoKey v39;

  v3 = a2;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v13 = 45;
    if (isMetaClass)
      v13 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Processing %{public}@", v13, ClassName, Name, 1904, v12);

  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    v19 = object_getClassName(*(id *)(a1 + 32));
    v20 = sel_getName(*(SEL *)(a1 + 56));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "NF_userInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&buf[4] = v18;
    v31 = 2082;
    v32 = v19;
    v33 = 2082;
    v34 = v20;
    v35 = 1024;
    v36 = 1904;
    v37 = 2114;
    v38 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@", buf, 0x2Cu);

  }
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v23 = *(_QWORD *)(a1 + 32);
    v24 = (void (**)(id, void *, _QWORD))*(id *)(a1 + 48);
    if (v23)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v23 + 48), "publicToken"));
      if (v25)
      {
        v24[2](v24, v25, 0);
      }
      else
      {
        v26 = objc_alloc((Class)NSError);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
        v39 = NSLocalizedDescriptionKey;
        *(_QWORD *)buf = CFSTR("Missing default token");
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v39, 1));
        v29 = objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 40, v28);
        ((void (**)(id, void *, id))v24)[2](v24, 0, v29);

      }
    }

  }
}

void sub_100029E34(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  v4 = sub_10001A158(v2, CFSTR("seld"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100037DF0(v3, v5);

  sub_1000172F4(*(unsigned __int8 **)(a1 + 32));
}

void sub_100029E94(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  v4 = sub_10001A158(v2, CFSTR("seld"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100037DF0(v3, v5);

  sub_1000172F4(*(unsigned __int8 **)(a1 + 32));
}

void sub_100029EF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 10))
  {
    *(_BYTE *)(v1 + 10) = 1;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 24);
    v5 = sub_10001A158(v3, CFSTR("seld"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    sub_100037DF0(v4, v6);

    sub_1000172F4(*(unsigned __int8 **)(a1 + 32));
  }
}

void sub_10002AA00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002AB40(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_10002ADFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002B168(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10002B18C(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  char *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  NFRemoteAdminSession *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  _QWORD *v43;
  _QWORD *v44;
  void *v45;
  void (*v46)(uint64_t, const char *, ...);
  objc_class *v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  objc_class *v55;
  int v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  unsigned int v60;
  uint64_t v61;
  SEL v62;
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
  void *v76;
  void (*v77)(uint64_t, const char *, ...);
  objc_class *v78;
  uint64_t v79;
  const char *v80;
  const char *v81;
  void *v82;
  uint64_t v83;
  NSObject *v84;
  objc_class *v85;
  int v86;
  const char *v87;
  const char *v88;
  unsigned int v89;
  void *v90;
  void (*v91)(uint64_t, const char *, ...);
  objc_class *v92;
  uint64_t v93;
  const char *v94;
  const char *v95;
  void *v96;
  uint64_t v97;
  NSObject *v98;
  objc_class *v99;
  int v100;
  const char *v101;
  const char *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void (*v107)(uint64_t, const char *, ...);
  objc_class *v108;
  uint64_t v109;
  const char *v110;
  const char *v111;
  void *v112;
  uint64_t v113;
  NSObject *v114;
  objc_class *v115;
  int v116;
  const char *v117;
  const char *v118;
  void *v119;
  void (*v120)(uint64_t, const char *, ...);
  objc_class *v121;
  uint64_t v122;
  const char *v123;
  const char *v124;
  void *v125;
  uint64_t v126;
  NSObject *v127;
  objc_class *v128;
  int v129;
  const char *v130;
  const char *v131;
  id v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  void (*v141)(uint64_t, const char *, ...);
  objc_class *v142;
  uint64_t v143;
  const char *v144;
  const char *v145;
  void *v146;
  uint64_t v147;
  NSObject *v148;
  objc_class *v149;
  int v150;
  const char *v151;
  const char *v152;
  uint64_t v153;
  unint64_t v154;
  void *v155;
  unint64_t v156;
  void *v157;
  void (*v158)(uint64_t, const char *, ...);
  objc_class *v159;
  uint64_t v160;
  const char *v161;
  const char *v162;
  void *v163;
  uint64_t v164;
  NSObject *v165;
  objc_class *v166;
  int v167;
  const char *v168;
  const char *v169;
  double v170;
  void *v171;
  void (*v172)(uint64_t, const char *, ...);
  objc_class *v173;
  uint64_t v174;
  const char *v175;
  const char *v176;
  void *v177;
  uint64_t v178;
  NSObject *v179;
  objc_class *v180;
  int v181;
  const char *v182;
  const char *v183;
  const char *v184;
  void *v185;
  id v186;
  void *v187;
  void *v188;
  id v189;
  void *v191;
  void (*v192)(uint64_t, const char *, ...);
  objc_class *v193;
  uint64_t v194;
  const char *v195;
  const char *v196;
  void *v197;
  uint64_t v198;
  NSObject *v199;
  objc_class *v200;
  int v201;
  const char *v202;
  const char *v203;
  id v204;
  void *v205;
  void *v206;
  id v207;
  void *v208;
  void *v209;
  id v210;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  void *v213;
  uint64_t v214;
  NSObject *v215;
  objc_class *v216;
  int v217;
  const char *v218;
  const char *v219;
  objc_class *Class;
  uint64_t v221;
  const char *ClassName;
  const char *Name;
  uint64_t v224;
  id v225;
  id v226;
  NSErrorUserInfoKey v227;
  const __CFString *v228;
  NSErrorUserInfoKey v229;
  const __CFString *v230;
  NSErrorUserInfoKey v231;
  const __CFString *v232;
  NSErrorUserInfoKey v233;
  const __CFString *v234;
  NSErrorUserInfoKey v235;
  const __CFString *v236;
  NSErrorUserInfoKey v237;
  const __CFString *v238;
  NSErrorUserInfoKey v239;
  const __CFString *v240;
  NSErrorUserInfoKey v241;
  const __CFString *v242;
  uint8_t buf[4];
  int v244;
  __int16 v245;
  const char *v246;
  __int16 v247;
  const char *v248;
  __int16 v249;
  int v250;
  __int16 v251;
  const char *v252;

  v7 = a2;
  v225 = a4;
  PLLogRegisteredEvent(47, CFSTR("TSMCommunication"), &off_1000573C0, 0);
  v8 = (id)a1;
  objc_sync_enter(v8);
  if (*(_QWORD *)(a1 + 96))
  {
LABEL_189:
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(v8);
      if (class_isMetaClass(Class))
        v221 = 43;
      else
        v221 = 45;
      ClassName = object_getClassName(v8);
      Name = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
      Logger(3, "%c[%{public}s %{public}s]:%i FAILED: %s", v221, ClassName, Name, 2400, "_activeSession == ((void *)0)");
    }
    v213 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v214 = NFSharedLogGetLogger(v213);
    v215 = objc_claimAutoreleasedReturnValue(v214);
    if (os_log_type_enabled(v215, OS_LOG_TYPE_ERROR))
    {
      v216 = object_getClass(v8);
      if (class_isMetaClass(v216))
        v217 = 43;
      else
        v217 = 45;
      v218 = object_getClassName(v8);
      v219 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
      *(_DWORD *)buf = 67110146;
      v244 = v217;
      v245 = 2082;
      v246 = v218;
      v247 = 2082;
      v248 = v219;
      v249 = 1024;
      v250 = 2400;
      v251 = 2080;
      v252 = "_activeSession == ((void *)0)";
      _os_log_impl((void *)&_mh_execute_header, v215, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i FAILED: %s", buf, 0x2Cu);
    }

    abort();
  }
  v226 = 0;
  v9 = 0;
  v224 = 0;
  while (1)
  {
    while (1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sourceUrl"));
      v11 = v10 == 0;

      if (v11)
      {
        v12 = *(void **)(a1 + 24);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serverIdentifier"));
        v14 = sub_100037538(v12, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));
          objc_msgSend(v7, "setSourceUrl:", v16);
        }
        else
        {
          v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v17);
          if (v18)
          {
            v19 = object_getClass(v8);
            if (class_isMetaClass(v19))
              v20 = 43;
            else
              v20 = 45;
            v21 = object_getClassName(v8);
            v22 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serverIdentifier"));
            v18(6, "%c[%{public}s %{public}s]:%i Unknown server identifier:%{public}@", v20, v21, v22, 2409, v23);

          }
          v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v25 = NFSharedLogGetLogger(v24);
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = object_getClass(v8);
            if (class_isMetaClass(v27))
              v28 = 43;
            else
              v28 = 45;
            v29 = object_getClassName(v8);
            v30 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
            v31 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serverIdentifier"));
            *(_DWORD *)buf = 67110146;
            v244 = v28;
            v245 = 2082;
            v246 = v29;
            v247 = 2082;
            v248 = v30;
            v249 = 1024;
            v250 = 2409;
            v251 = 2114;
            v252 = v31;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unknown server identifier:%{public}@", buf, 0x2Cu);

          }
          v32 = objc_alloc((Class)NSError);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
          v241 = NSLocalizedDescriptionKey;
          v242 = CFSTR("Unknown server identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v242, &v241, 1));
          v34 = objc_msgSend(v32, "initWithDomain:code:userInfo:", v16, 5, v33);

          v9 = 5;
          v226 = v34;
        }

      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sourceUrl"));
      if (v35)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sourceUrl"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v36));

        if (v37)
        {
          v38 = objc_alloc_init(NFRemoteAdminSession);
          v39 = (uint64_t)v38;
          if (v38)
            v38->_delegate = (NFRemoteAdminSessionDelegate *)v8;
          sub_100033CDC((uint64_t)v38, v7);
          sub_100033CEC(v39, v37);
          sub_10002E20C(v39, v225);
          v40 = *(void **)(a1 + 96);
          *(_QWORD *)(a1 + 96) = v39;

        }
      }
      objc_sync_exit(v8);

      if (*(_QWORD *)(a1 + 96))
      {
        sub_100017AAC((uint64_t)v8);
        if (*(_BYTE *)(a1 + 155))
          v9 = 1;
        else
          v9 = (uint64_t)objc_msgSend(*(id *)(a1 + 96), "run");
        v41 = v8;
        objc_sync_enter(v41);
        v42 = *(void **)(a1 + 96);
        *(_QWORD *)(a1 + 96) = 0;

        objc_sync_exit(v41);
      }
      if (v9 != 3)
      {
        switch(v9)
        {
          case 0:
          case 11:
            if (byte_10005C3E8)
            {
              v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v64 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v63);
              if (v64)
              {
                v65 = object_getClass(v8);
                if (class_isMetaClass(v65))
                  v66 = 43;
                else
                  v66 = 45;
                v67 = object_getClassName(v8);
                v68 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
                v64(6, "%c[%{public}s %{public}s]:%i [TSM] Success", v66, v67, v68, 2514);
              }
              v69 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v70 = NFSharedLogGetLogger(v69);
              v71 = objc_claimAutoreleasedReturnValue(v70);
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                v72 = object_getClass(v8);
                if (class_isMetaClass(v72))
                  v73 = 43;
                else
                  v73 = 45;
                v74 = object_getClassName(v8);
                v75 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
                *(_DWORD *)buf = 67109890;
                v244 = v73;
                v245 = 2082;
                v246 = v74;
                v247 = 2082;
                v248 = v75;
                v249 = 1024;
                v250 = 2514;
                _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Success", buf, 0x22u);
              }

            }
            sub_10002DC34(v7);
            objc_msgSend(v7, "save");
            if (v9 != 11)
              goto LABEL_68;
            v207 = objc_alloc((Class)NSError);
            v208 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
            v231 = NSLocalizedDescriptionKey;
            v232 = CFSTR("Need to proceed with redirect");
            v209 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v232, &v231, 1));
            v210 = objc_msgSend(v207, "initWithDomain:code:userInfo:", v208, 11, v209);

            break;
          case 1:
            if (byte_10005C3E8)
            {
              v90 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v91 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v90);
              if (v91)
              {
                v92 = object_getClass(v8);
                if (class_isMetaClass(v92))
                  v93 = 43;
                else
                  v93 = 45;
                v94 = object_getClassName(v8);
                v95 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
                v91(6, "%c[%{public}s %{public}s]:%i [TSM] Aborted", v93, v94, v95, 2446);
              }
              v96 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v97 = NFSharedLogGetLogger(v96);
              v98 = objc_claimAutoreleasedReturnValue(v97);
              if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
              {
                v99 = object_getClass(v8);
                if (class_isMetaClass(v99))
                  v100 = 43;
                else
                  v100 = 45;
                v101 = object_getClassName(v8);
                v102 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
                *(_DWORD *)buf = 67109890;
                v244 = v100;
                v245 = 2082;
                v246 = v101;
                v247 = 2082;
                v248 = v102;
                v249 = 1024;
                v250 = 2446;
                _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Aborted", buf, 0x22u);
              }

            }
            objc_msgSend(v7, "save");
            v103 = objc_alloc((Class)NSError);
            v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
            v239 = NSLocalizedDescriptionKey;
            v240 = CFSTR("Aborted");
            v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v240, &v239, 1));
            v210 = objc_msgSend(v103, "initWithDomain:code:userInfo:", v104, 1, v105);

            goto LABEL_126;
          case 2:
            if (byte_10005C3E8)
            {
              v119 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v120 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v119);
              if (v120)
              {
                v121 = object_getClass(v8);
                if (class_isMetaClass(v121))
                  v122 = 43;
                else
                  v122 = 45;
                v123 = object_getClassName(v8);
                v124 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
                v120(6, "%c[%{public}s %{public}s]:%i [TSM] Network unavailable", v122, v123, v124, 2452);
              }
              v125 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v126 = NFSharedLogGetLogger(v125);
              v127 = objc_claimAutoreleasedReturnValue(v126);
              if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
              {
                v128 = object_getClass(v8);
                if (class_isMetaClass(v128))
                  v129 = 43;
                else
                  v129 = 45;
                v130 = object_getClassName(v8);
                v131 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
                *(_DWORD *)buf = 67109890;
                v244 = v129;
                v245 = 2082;
                v246 = v130;
                v247 = 2082;
                v248 = v131;
                v249 = 1024;
                v250 = 2452;
                _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Network unavailable", buf, 0x22u);
              }

            }
            objc_msgSend(v7, "setPendingImmediateRetry:", 1);
            objc_msgSend(v7, "save");
            v132 = objc_alloc((Class)NSError);
            v133 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
            v237 = NSLocalizedDescriptionKey;
            v238 = CFSTR("Network unavailable.");
            v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v238, &v237, 1));
            v210 = objc_msgSend(v132, "initWithDomain:code:userInfo:", v133, 2, v134);

            goto LABEL_126;
          case 4:
            if ((a3 & 1) != 0)
              goto LABEL_68;
            goto LABEL_141;
          case 5:
            if (byte_10005C3E8)
            {
              v106 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v107 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v106);
              if (v107)
              {
                v108 = object_getClass(v8);
                if (class_isMetaClass(v108))
                  v109 = 43;
                else
                  v109 = 45;
                v110 = object_getClassName(v8);
                v111 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
                v107(6, "%c[%{public}s %{public}s]:%i [TSM] Invalid remote admin state", v109, v110, v111, 2440);
              }
              v112 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v113 = NFSharedLogGetLogger(v112);
              v114 = objc_claimAutoreleasedReturnValue(v113);
              if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
              {
                v115 = object_getClass(v8);
                if (class_isMetaClass(v115))
                  v116 = 43;
                else
                  v116 = 45;
                v117 = object_getClassName(v8);
                v118 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
                *(_DWORD *)buf = 67109890;
                v244 = v116;
                v245 = 2082;
                v246 = v117;
                v247 = 2082;
                v248 = v118;
                v249 = 1024;
                v250 = 2440;
                _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Invalid remote admin state", buf, 0x22u);
              }

            }
            sub_10002DC34(v7);
            objc_msgSend(v7, "save");
            goto LABEL_177;
          case 14:
            goto LABEL_129;
          default:
            v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
            objc_msgSend(v135, "handleFailureInMethod:object:file:lineNumber:description:", "_connectToServer:oneTimeConnection:secureElementManagerSession:", v8, CFSTR("_NFRemoteAdminManager.m"), 2525, CFSTR("Unknown result: %lu"), v9);

            v136 = objc_alloc((Class)NSError);
            v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
            v229 = NSLocalizedDescriptionKey;
            v230 = CFSTR("Unexpected result.");
            v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v230, &v229, 1));
            v139 = objc_msgSend(v136, "initWithDomain:code:userInfo:", v137, v9, v138);

            sub_10002DC34(v7);
            objc_msgSend(v7, "save");
            goto LABEL_176;
        }
        goto LABEL_126;
      }
      if ((a3 & 1) == 0)
        break;
LABEL_68:
      if ((unint64_t)(v9 - 3) > 1 || (a3 & 1) == 0)
        goto LABEL_177;
      if (v224 == 3)
      {
        v191 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v192 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v191);
        if (v192)
        {
          v193 = object_getClass(v8);
          if (class_isMetaClass(v193))
            v194 = 43;
          else
            v194 = 45;
          v195 = object_getClassName(v8);
          v196 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
          v192(3, "%c[%{public}s %{public}s]:%i Out of short retry attempts", v194, v195, v196, 2540);
        }
        v197 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v198 = NFSharedLogGetLogger(v197);
        v199 = objc_claimAutoreleasedReturnValue(v198);
        if (os_log_type_enabled(v199, OS_LOG_TYPE_ERROR))
        {
          v200 = object_getClass(v8);
          if (class_isMetaClass(v200))
            v201 = 43;
          else
            v201 = 45;
          v202 = object_getClassName(v8);
          v203 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
          *(_DWORD *)buf = 67109890;
          v244 = v201;
          v245 = 2082;
          v246 = v202;
          v247 = 2082;
          v248 = v203;
          v249 = 1024;
          v250 = 2540;
          _os_log_impl((void *)&_mh_execute_header, v199, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Out of short retry attempts", buf, 0x22u);
        }

        v204 = objc_alloc((Class)NSError);
        v205 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
        v227 = NSLocalizedDescriptionKey;
        v228 = CFSTR("Short retry attempts failed");
        v206 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v228, &v227, 1));
        v210 = objc_msgSend(v204, "initWithDomain:code:userInfo:", v205, 3, v206);

LABEL_126:
        v226 = v210;
        goto LABEL_177;
      }
      if (byte_10005C3E8)
      {
        v76 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v77 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v76);
        if (v77)
        {
          v78 = object_getClass(v8);
          if (class_isMetaClass(v78))
            v79 = 43;
          else
            v79 = 45;
          v80 = object_getClassName(v8);
          v81 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
          v77(6, "%c[%{public}s %{public}s]:%i [TSM] Retrying in %d seconds", v79, v80, v81, 2536, dword_100041254[v224]);
        }
        v82 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v83 = NFSharedLogGetLogger(v82);
        v84 = objc_claimAutoreleasedReturnValue(v83);
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          v85 = object_getClass(v8);
          if (class_isMetaClass(v85))
            v86 = 43;
          else
            v86 = 45;
          v87 = object_getClassName(v8);
          v88 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
          v89 = dword_100041254[v224];
          *(_DWORD *)buf = 67110146;
          v244 = v86;
          v245 = 2082;
          v246 = v87;
          v247 = 2082;
          v248 = v88;
          v249 = 1024;
          v250 = 2536;
          v251 = 1024;
          LODWORD(v252) = v89;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Retrying in %d seconds", buf, 0x28u);
        }

      }
      sleep(dword_100041254[v224++]);
      objc_sync_enter(v8);
      a3 = 1;
      if (*(_QWORD *)(a1 + 96))
        goto LABEL_189;
    }
    v43 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "retryInterval"));
    v44 = v43;
    if (v43)
    {
      if (v43[1] >= 3uLL)
        break;
    }
    if (byte_10005C3E8)
    {
      v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v46 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v45);
      if (v46)
      {
        v47 = object_getClass(v8);
        if (class_isMetaClass(v47))
          v48 = 43;
        else
          v48 = 45;
        v49 = object_getClassName(v8);
        v50 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
        if (v44)
          v51 = v44[1];
        else
          v51 = 0;
        v46(6, "%c[%{public}s %{public}s]:%i [TSM] Retrying in %d seconds", v48, v49, v50, 2465, dword_100041254[v51]);
      }
      v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v53 = NFSharedLogGetLogger(v52);
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = object_getClass(v8);
        if (class_isMetaClass(v55))
          v56 = 43;
        else
          v56 = 45;
        v57 = object_getClassName(v8);
        v58 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
        if (v44)
          v59 = v44[1];
        else
          v59 = 0;
        v60 = dword_100041254[v59];
        *(_DWORD *)buf = 67110146;
        v244 = v56;
        v245 = 2082;
        v246 = v57;
        v247 = 2082;
        v248 = v58;
        v249 = 1024;
        v250 = 2465;
        v251 = 1024;
        LODWORD(v252) = v60;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Retrying in %d seconds", buf, 0x28u);
      }

    }
    if (v44)
    {
      v61 = v44[1];
      v44[1] = v61 + 1;
      sleep(dword_100041254[v61]);
      objc_setProperty_nonatomic_copy(v44, v62, 0, 16);
    }
    else
    {
      sleep(2u);
    }
    objc_msgSend(v7, "updateNextRetryInterval:", v44);

    objc_sync_enter(v8);
    a3 = 0;
    v9 = 3;
    if (*(_QWORD *)(a1 + 96))
      goto LABEL_189;
  }

LABEL_129:
  if (byte_10005C3E8)
  {
    v140 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v141 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v140);
    if (v141)
    {
      v142 = object_getClass(v8);
      if (class_isMetaClass(v142))
        v143 = 43;
      else
        v143 = 45;
      v144 = object_getClassName(v8);
      v145 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
      v141(6, "%c[%{public}s %{public}s]:%i [TSM] SE is unavailable", v143, v144, v145, 2476);
    }
    v146 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v147 = NFSharedLogGetLogger(v146);
    v148 = objc_claimAutoreleasedReturnValue(v147);
    if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
    {
      v149 = object_getClass(v8);
      if (class_isMetaClass(v149))
        v150 = 43;
      else
        v150 = 45;
      v151 = object_getClassName(v8);
      v152 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
      *(_DWORD *)buf = 67109890;
      v244 = v150;
      v245 = 2082;
      v246 = v151;
      v247 = 2082;
      v248 = v152;
      v249 = 1024;
      v250 = 2476;
      _os_log_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] SE is unavailable", buf, 0x22u);
    }

  }
LABEL_141:
  objc_msgSend(v7, "setPendingImmediateRetry:", 0);
  v153 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "retryInterval"));
  v155 = (void *)v153;
  if (v153)
  {
    v156 = *(_QWORD *)(v153 + 8);
    if (v156)
    {
      if (v156 > 0x1B)
      {
        v157 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v158 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v157);
        if (v158)
        {
          v159 = object_getClass(v8);
          if (class_isMetaClass(v159))
            v160 = 43;
          else
            v160 = 45;
          v161 = object_getClassName(v8);
          v162 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
          v158(3, "%c[%{public}s %{public}s]:%i Retried too many times.  Giving up.", v160, v161, v162, 2499);
        }
        v163 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v164 = NFSharedLogGetLogger(v163);
        v165 = objc_claimAutoreleasedReturnValue(v164);
        if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
        {
          v166 = object_getClass(v8);
          if (class_isMetaClass(v166))
            v167 = 43;
          else
            v167 = 45;
          v168 = object_getClassName(v8);
          v169 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
          *(_DWORD *)buf = 67109890;
          v244 = v167;
          v245 = 2082;
          v246 = v168;
          v247 = 2082;
          v248 = v169;
          v249 = 1024;
          v250 = 2499;
          _os_log_impl((void *)&_mh_execute_header, v165, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Retried too many times.  Giving up.", buf, 0x22u);
        }

        sub_10002DC34(v7);
        goto LABEL_172;
      }
    }
    else
    {
      v156 = 3;
      *(_QWORD *)(v153 + 8) = 3;
    }
    *(_QWORD *)(v153 + 8) = v156 + 1;
  }
  else
  {
    v156 = 0;
  }
  LODWORD(v154) = dword_100041254[v156];
  v170 = (double)v154;
  if (byte_10005C3E8)
  {
    v171 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v172 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v171);
    if (v172)
    {
      v173 = object_getClass(v8);
      if (class_isMetaClass(v173))
        v174 = 43;
      else
        v174 = 45;
      v175 = object_getClassName(v8);
      v176 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
      v172(6, "%c[%{public}s %{public}s]:%i [TSM] Retrying in %d minute(s)", v174, v175, v176, 2495, (int)(v170 / 60.0));
    }
    v177 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v178 = NFSharedLogGetLogger(v177);
    v179 = objc_claimAutoreleasedReturnValue(v178);
    if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
    {
      v180 = object_getClass(v8);
      if (class_isMetaClass(v180))
        v181 = 43;
      else
        v181 = 45;
      v182 = object_getClassName(v8);
      v183 = sel_getName("_connectToServer:oneTimeConnection:secureElementManagerSession:");
      *(_DWORD *)buf = 67110146;
      v244 = v181;
      v245 = 2082;
      v246 = v182;
      v247 = 2082;
      v248 = v183;
      v249 = 1024;
      v250 = 2495;
      v251 = 1024;
      LODWORD(v252) = (int)(v170 / 60.0);
      _os_log_impl((void *)&_mh_execute_header, v179, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Retrying in %d minute(s)", buf, 0x28u);
    }

  }
  v185 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v170));
  if (v155)
    objc_setProperty_nonatomic_copy(v155, v184, v185, 16);

  objc_msgSend(v7, "updateNextRetryInterval:", v155);
LABEL_172:
  objc_msgSend(v7, "save");
  v186 = objc_alloc((Class)NSError);
  v187 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
  if (v9 == 14)
  {
    v235 = NSLocalizedDescriptionKey;
    v236 = CFSTR("SE is unavailable.");
    v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v236, &v235, 1));
    v189 = objc_msgSend(v186, "initWithDomain:code:userInfo:", v187, 14, v188);
  }
  else
  {
    v233 = NSLocalizedDescriptionKey;
    v234 = CFSTR("Unable to connect.");
    v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v234, &v233, 1));
    v189 = objc_msgSend(v186, "initWithDomain:code:userInfo:", v187, v9, v188);
  }
  v139 = v189;

LABEL_176:
  v226 = v139;
LABEL_177:
  PLLogRegisteredEvent(47, CFSTR("TSMCommunication"), &off_1000573E8, 0);

  return v226;
}

void sub_10002C958(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id *sub_10002C99C(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  uint64_t Logger;
  NSObject *v6;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  void *v14;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v3 = v2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  if (v3 < -300.0 || v4 < -300.0)
  {
    Logger = NFSharedLogGetLogger(0);
    v6 = objc_claimAutoreleasedReturnValue(Logger);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v9 = 136315650;
      v10 = "-[_NFRemoteAdminManager _dispatchOnSessionQueue:]_block_invoke";
      v11 = 1024;
      v12 = v3 < -300.0;
      v13 = 2112;
      v14 = v8;
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "%s: beforeBlockExec=%d\n%@", (uint8_t *)&v9, 0x1Cu);

    }
  }
  sub_10001CCC0(*(_QWORD *)(a1 + 40));
  return sub_1000177B8(*(id **)(a1 + 40));
}

void sub_10002CADC(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  unsigned int v3;
  id v4;
  void *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  double v9;
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  _BOOL4 v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  int v41;
  void *v42;
  id v43;
  int v44;
  void *v45;
  uint64_t v46;
  void (*v47)(uint64_t, const char *, ...);
  objc_class *v48;
  _BOOL4 v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  objc_class *v54;
  int v55;
  const char *v56;
  const char *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  int v62;
  int v63;
  void *v64;
  void *v65;
  char v66;
  id v67;
  char v68;
  void *v69;
  uint64_t v70;
  void (*v71)(uint64_t, const char *, ...);
  objc_class *v72;
  _BOOL4 v73;
  const char *v74;
  BOOL v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  objc_class *v80;
  int v81;
  const char *v82;
  const char *v83;
  void *v84;
  uint64_t v85;
  void (*v86)(uint64_t, const char *, ...);
  objc_class *v87;
  _BOOL4 v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  NSObject *v93;
  objc_class *v94;
  int v95;
  const char *v96;
  const char *v97;
  void *v98;
  uint64_t v99;
  void (*v100)(uint64_t, const char *, ...);
  objc_class *v101;
  _BOOL4 v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  NSObject *v107;
  objc_class *v108;
  int v109;
  const char *v110;
  const char *v111;
  void *v112;
  uint64_t v113;
  void (*v114)(uint64_t, const char *, ...);
  objc_class *v115;
  _BOOL4 v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  NSObject *v121;
  objc_class *v122;
  int v123;
  const char *v124;
  const char *v125;
  void *v126;
  uint64_t v127;
  void (*v128)(uint64_t, const char *, ...);
  objc_class *v129;
  _BOOL4 v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  NSObject *v135;
  objc_class *v136;
  int v137;
  const char *v138;
  const char *v139;
  id v140;
  void *v141;
  NFRemoteAdminState *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void (*v146)(uint64_t, const char *, ...);
  objc_class *v147;
  _BOOL4 v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  NSObject *v152;
  objc_class *v153;
  int v154;
  const char *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  id v160;
  double v161;
  double v162;
  void *v163;
  uint64_t v164;
  void (*v165)(uint64_t, const char *, ...);
  objc_class *v166;
  _BOOL4 v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  NSObject *v172;
  objc_class *v173;
  int v174;
  const char *v175;
  const char *v176;
  id v177;
  double v178;
  void *v179;
  uint64_t v180;
  void (*v181)(uint64_t, const char *, ...);
  objc_class *v182;
  _BOOL4 v183;
  const char *v184;
  uint64_t v185;
  void *v186;
  uint64_t v187;
  NSObject *v188;
  objc_class *v189;
  int v190;
  const char *v191;
  const char *v192;
  const char *v193;
  const char *v194;
  const char *v195;
  const char *v196;
  const char *v197;
  const char *Name;
  const char *v199;
  const char *v200;
  const char *v201;
  const char *v202;
  const char *v203;
  const char *v204;
  const char *v205;
  const char *v206;
  const char *v207;
  const char *v208;
  int v209;
  void *v210;
  void *v211;
  id v212;
  uint8_t buf[4];
  int v214;
  __int16 v215;
  const char *v216;
  __int16 v217;
  const char *v218;
  __int16 v219;
  int v220;
  __int16 v221;
  double v222;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if (*(_BYTE *)(v1 + 136))
    {
      *(_BYTE *)(v1 + 136) = 0;
      sub_1000177B8((id *)v1);
    }
    atomic_store(0, (unsigned __int8 *)(v1 + 154));
    if (*(_BYTE *)(v1 + 8))
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
      v3 = objc_msgSend(v2, "areSessionsAllowed");

      if (v3)
      {
        if (!*(_QWORD *)(v1 + 216))
        {
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          if (Logger)
          {
            v12 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass((id)v1);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName((id)v1);
            Name = sel_getName("_startNextSession");
            v16 = 45;
            if (isMetaClass)
              v16 = 43;
            v12(5, "%c[%{public}s %{public}s]:%i Network is not available.  A session will not be started.", v16, ClassName, Name, 2241);
          }
          v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v18 = NFSharedLogGetLogger(v17);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = object_getClass((id)v1);
            if (class_isMetaClass(v20))
              v21 = 43;
            else
              v21 = 45;
            *(_DWORD *)buf = 67109890;
            v214 = v21;
            v215 = 2082;
            v216 = object_getClassName((id)v1);
            v217 = 2082;
            v218 = sel_getName("_startNextSession");
            v219 = 1024;
            v220 = 2241;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Network is not available.  A session will not be started.", buf, 0x22u);
          }
          goto LABEL_178;
        }
        v4 = sub_10001C04C((void *)v1);
        v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
        v6 = &unk_10005C000;
        v7 = (_BYTE *)&unk_10005C000;
        if ((byte_10005C3B0 & 1) != 0)
        {
          v8 = 0;
          v9 = 0.0;
          goto LABEL_125;
        }
        v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v23 = NFLogGetLogger(v22);
        if (v23)
        {
          v24 = (void (*)(uint64_t, const char *, ...))v23;
          v25 = object_getClass((id)v1);
          v26 = class_isMetaClass(v25);
          v27 = object_getClassName((id)v1);
          v199 = sel_getName("_startNextSession");
          v28 = 45;
          if (v26)
            v28 = 43;
          v24(6, "%c[%{public}s %{public}s]:%i Perform OS update system check", v28, v27, v199, 2257);
        }
        v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v30 = NFSharedLogGetLogger(v29);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = object_getClass((id)v1);
          if (class_isMetaClass(v32))
            v33 = 43;
          else
            v33 = 45;
          *(_DWORD *)buf = 67109890;
          v214 = v33;
          v215 = 2082;
          v216 = object_getClassName((id)v1);
          v217 = 2082;
          v218 = sel_getName("_startNextSession");
          v219 = 1024;
          v220 = 2257;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Perform OS update system check", buf, 0x22u);
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
        objc_msgSend(v34, "refreshSecureElementsWithError:", 0);

        v35 = sub_100033D5C();
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v37 = sub_10003758C(v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

        if (!v38)
        {
          v8 = 0;
          v9 = 0.0;
LABEL_124:

LABEL_125:
          if (v5)
          {
            if (v7[1000])
            {
              v144 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v145 = NFLogGetLogger(v144);
              if (v145)
              {
                v146 = (void (*)(uint64_t, const char *, ...))v145;
                v147 = object_getClass((id)v1);
                v148 = class_isMetaClass(v147);
                v197 = object_getClassName((id)v1);
                v206 = sel_getName("_startNextSession");
                v149 = 45;
                if (v148)
                  v149 = 43;
                v146(6, "%c[%{public}s %{public}s]:%i [TSM] NextState=%@", v149, v197, v206, 2313, v5);
              }
              v150 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v151 = NFSharedLogGetLogger(v150);
              v152 = objc_claimAutoreleasedReturnValue(v151);
              if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
              {
                v153 = object_getClass((id)v1);
                if (class_isMetaClass(v153))
                  v154 = 43;
                else
                  v154 = 45;
                v155 = object_getClassName((id)v1);
                v156 = sel_getName("_startNextSession");
                *(_DWORD *)buf = 67110146;
                v214 = v154;
                v215 = 2082;
                v216 = v155;
                v217 = 2082;
                v218 = v156;
                v219 = 1024;
                v220 = 2313;
                v221 = 2112;
                v222 = *(double *)&v5;
                _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] NextState=%@", buf, 0x2Cu);
              }

            }
            if ((objc_msgSend(v5, "pendingImmediateRetry") & 1) != 0)
              goto LABEL_151;
            v157 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "retryInterval"));
            v158 = (void *)v157;
            v159 = v157 ? *(void **)(v157 + 16) : 0;
            v160 = v159;
            objc_msgSend(v160, "timeIntervalSinceNow");
            v162 = v161;

            if (v162 <= 0.0)
            {
LABEL_151:
              objc_msgSend(v5, "refreshRetryInterval");
              sub_10001C4C0((void *)v1, (uint64_t)"com.apple.seld.processing", 120.0);
              v177 = sub_100020C0C((void *)v1, v5, v8, 0, 0);
              v19 = objc_claimAutoreleasedReturnValue(v177);
              sub_10001A718((void *)v1, (uint64_t)"com.apple.seld.processing");
              if (v19)
              {
                if (-[NSObject code](v19, "code") == (id)2)
                {
                  *(_BYTE *)(v1 + 136) = 1;
                  sub_100016F6C(v1);
                }
                if ((v8 & 1) != 0)
                {
                  sub_10001A718((void *)v1, (uint64_t)"com.apple.seld.osupdate");
                  v6[944] = 0;
                  v178 = 86400.0;
                  if (v9 != 0.0)
                    v178 = v9;
                  sub_10001C4C0((void *)v1, (uint64_t)"com.apple.seld.osupdate", v178);
                  v6[944] = 1;
                }
                if (-[NSObject code](v19, "code") == (id)1
                  || -[NSObject code](v19, "code") == (id)2
                  || -[NSObject code](v19, "code") == (id)5)
                {
                  goto LABEL_177;
                }
              }
              else if ((_DWORD)v8)
              {
                sub_10001A718((void *)v1, (uint64_t)"com.apple.seld.osupdate");
                v6[944] = 0;
              }
              sub_1000172F4(v1);
LABEL_177:

LABEL_178:
              return;
            }
            v163 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v164 = NFLogGetLogger(v163);
            if (v164)
            {
              v165 = (void (*)(uint64_t, const char *, ...))v164;
              v166 = object_getClass((id)v1);
              v167 = class_isMetaClass(v166);
              v168 = object_getClassName((id)v1);
              v207 = sel_getName("_startNextSession");
              v169 = 45;
              if (v167)
                v169 = 43;
              v165(6, "%c[%{public}s %{public}s]:%i Handling internal retry delay of %f seconds", v169, v168, v207, 2320, *(_QWORD *)&v162);
            }
            v170 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v171 = NFSharedLogGetLogger(v170);
            v172 = objc_claimAutoreleasedReturnValue(v171);
            if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
            {
              v173 = object_getClass((id)v1);
              if (class_isMetaClass(v173))
                v174 = 43;
              else
                v174 = 45;
              v175 = object_getClassName((id)v1);
              v176 = sel_getName("_startNextSession");
              *(_DWORD *)buf = 67110146;
              v214 = v174;
              v215 = 2082;
              v216 = v175;
              v217 = 2082;
              v218 = v176;
              v219 = 1024;
              v220 = 2320;
              v221 = 2048;
              v222 = v162;
              _os_log_impl((void *)&_mh_execute_header, v172, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Handling internal retry delay of %f seconds", buf, 0x2Cu);
            }

            sub_10001C9A0((void *)v1, v5);
          }
          else if (v7[1000])
          {
            v179 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v180 = NFLogGetLogger(v179);
            if (v180)
            {
              v181 = (void (*)(uint64_t, const char *, ...))v180;
              v182 = object_getClass((id)v1);
              v183 = class_isMetaClass(v182);
              v184 = object_getClassName((id)v1);
              v208 = sel_getName("_startNextSession");
              v185 = 45;
              if (v183)
                v185 = 43;
              v181(6, "%c[%{public}s %{public}s]:%i [TSM] No remaining sessions.", v185, v184, v208, 2309);
            }
            v186 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v187 = NFSharedLogGetLogger(v186);
            v188 = objc_claimAutoreleasedReturnValue(v187);
            if (os_log_type_enabled(v188, OS_LOG_TYPE_DEFAULT))
            {
              v189 = object_getClass((id)v1);
              if (class_isMetaClass(v189))
                v190 = 43;
              else
                v190 = 45;
              v191 = object_getClassName((id)v1);
              v192 = sel_getName("_startNextSession");
              *(_DWORD *)buf = 67109890;
              v214 = v190;
              v215 = 2082;
              v216 = v191;
              v217 = 2082;
              v218 = v192;
              v219 = 1024;
              v220 = 2309;
              _os_log_impl((void *)&_mh_execute_header, v188, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] No remaining sessions.", buf, 0x22u);
            }

          }
          v19 = 0;
          goto LABEL_177;
        }
        v39 = sub_100033D5C();
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        v41 = sub_1000379D0((uint64_t)v40);

        if (v41)
        {
          v212 = 0;
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", &v212));
          v43 = v212;

          v210 = v43;
          if (v42)
          {
            v44 = 1;
            goto LABEL_44;
          }
          v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v46 = NFLogGetLogger(v45);
          if (v46)
          {
            v47 = (void (*)(uint64_t, const char *, ...))v46;
            v48 = object_getClass((id)v1);
            v49 = class_isMetaClass(v48);
            v193 = object_getClassName((id)v1);
            v200 = sel_getName("_startNextSession");
            v50 = 45;
            if (v49)
              v50 = 43;
            v47(4, "%c[%{public}s %{public}s]:%i SE not present but JCOP update info available - %{public}@", v50, v193, v200, 2265, v43);
          }
          v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v52 = NFSharedLogGetLogger(v51);
          v53 = objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v54 = object_getClass((id)v1);
            if (class_isMetaClass(v54))
              v55 = 43;
            else
              v55 = 45;
            v56 = object_getClassName((id)v1);
            v57 = sel_getName("_startNextSession");
            *(_DWORD *)buf = 67110146;
            v214 = v55;
            v215 = 2082;
            v216 = v56;
            v217 = 2082;
            v218 = v57;
            v219 = 1024;
            v220 = 2265;
            v221 = 2114;
            v222 = *(double *)&v43;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i SE not present but JCOP update info available - %{public}@", buf, 0x2Cu);
          }

        }
        else
        {
          v210 = 0;
        }
        v44 = 0;
LABEL_44:
        v58 = sub_100033D5C();
        v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
        v60 = sub_100037CD0(v59);
        v61 = (void *)objc_claimAutoreleasedReturnValue(v60);

        v62 = *(unsigned __int8 *)(v1 + 9);
        v63 = *(unsigned __int8 *)(v1 + 10);
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", 0));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "info"));

        v211 = v65;
        if (objc_msgSend(v65, "migrationState") == (id)1)
        {
          if (v61)
            v66 = 1;
          else
            v66 = v44;
          v7 = (_BYTE *)&unk_10005C000;
          if ((v66 & 1) != 0 || v63 | v62)
          {
LABEL_71:
            if (v44 && v7[1000])
            {
              v84 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v85 = NFLogGetLogger(v84);
              if (v85)
              {
                v86 = (void (*)(uint64_t, const char *, ...))v85;
                v87 = object_getClass((id)v1);
                v88 = class_isMetaClass(v87);
                v89 = object_getClassName((id)v1);
                v202 = sel_getName("_startNextSession");
                v75 = !v88;
                v7 = (_BYTE *)&unk_10005C000;
                v90 = 45;
                if (!v75)
                  v90 = 43;
                v86(6, "%c[%{public}s %{public}s]:%i [TSM] Reporting SE version change to TSM", v90, v89, v202, 2286);
              }
              v91 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v92 = NFSharedLogGetLogger(v91);
              v93 = objc_claimAutoreleasedReturnValue(v92);
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
              {
                v94 = object_getClass((id)v1);
                if (class_isMetaClass(v94))
                  v95 = 43;
                else
                  v95 = 45;
                v96 = object_getClassName((id)v1);
                v97 = sel_getName("_startNextSession");
                *(_DWORD *)buf = 67109890;
                v214 = v95;
                v215 = 2082;
                v216 = v96;
                v7 = &unk_10005C000;
                v217 = 2082;
                v218 = v97;
                v219 = 1024;
                v220 = 2286;
                _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Reporting SE version change to TSM", buf, 0x22u);
              }

            }
            if (v61)
            {
              v9 = 1800.0;
              v6 = (_BYTE *)&unk_10005C000;
              if (v7[1000])
              {
                v98 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v99 = NFLogGetLogger(v98);
                if (v99)
                {
                  v100 = (void (*)(uint64_t, const char *, ...))v99;
                  v101 = object_getClass((id)v1);
                  v102 = class_isMetaClass(v101);
                  v103 = object_getClassName((id)v1);
                  v203 = sel_getName("_startNextSession");
                  v104 = 45;
                  if (v102)
                    v104 = 43;
                  v194 = v103;
                  v7 = (_BYTE *)&unk_10005C000;
                  v100(6, "%c[%{public}s %{public}s]:%i [TSM] Reporting APN token change to TSM", v104, v194, v203, 2289);
                }
                v105 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v106 = NFSharedLogGetLogger(v105);
                v107 = objc_claimAutoreleasedReturnValue(v106);
                if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
                {
                  v108 = object_getClass((id)v1);
                  if (class_isMetaClass(v108))
                    v109 = 43;
                  else
                    v109 = 45;
                  v110 = object_getClassName((id)v1);
                  v111 = sel_getName("_startNextSession");
                  *(_DWORD *)buf = 67109890;
                  v214 = v109;
                  v7 = (_BYTE *)&unk_10005C000;
                  v215 = 2082;
                  v216 = v110;
                  v217 = 2082;
                  v218 = v111;
                  v219 = 1024;
                  v220 = 2289;
                  _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Reporting APN token change to TSM", buf, 0x22u);
                }

              }
            }
            else
            {
              v9 = 0.0;
              v6 = &unk_10005C000;
            }
            if (v62)
            {
              if (v7[1000])
              {
                v112 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v113 = NFLogGetLogger(v112);
                if (v113)
                {
                  v114 = (void (*)(uint64_t, const char *, ...))v113;
                  v115 = object_getClass((id)v1);
                  v116 = class_isMetaClass(v115);
                  v117 = object_getClassName((id)v1);
                  v204 = sel_getName("_startNextSession");
                  v118 = 45;
                  if (v116)
                    v118 = 43;
                  v195 = v117;
                  v7 = &unk_10005C000;
                  v114(6, "%c[%{public}s %{public}s]:%i [TSM] Reporting restricted mode to TSM", v118, v195, v204, 2293);
                }
                v119 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v120 = NFSharedLogGetLogger(v119);
                v121 = objc_claimAutoreleasedReturnValue(v120);
                if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
                {
                  v122 = object_getClass((id)v1);
                  if (class_isMetaClass(v122))
                    v123 = 43;
                  else
                    v123 = 45;
                  v124 = object_getClassName((id)v1);
                  v125 = sel_getName("_startNextSession");
                  *(_DWORD *)buf = 67109890;
                  v214 = v123;
                  v215 = 2082;
                  v216 = v124;
                  v217 = 2082;
                  v218 = v125;
                  v219 = 1024;
                  v220 = 2293;
                  _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Reporting restricted mode to TSM", buf, 0x22u);
                }

              }
              *(_BYTE *)(v1 + 9) = 0;
            }
            if (v63)
            {
              if (v7[1000])
              {
                v126 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v127 = NFLogGetLogger(v126);
                if (v127)
                {
                  v128 = (void (*)(uint64_t, const char *, ...))v127;
                  v129 = object_getClass((id)v1);
                  v130 = class_isMetaClass(v129);
                  v131 = object_getClassName((id)v1);
                  v205 = sel_getName("_startNextSession");
                  v132 = 45;
                  if (v130)
                    v132 = 43;
                  v196 = v131;
                  v7 = &unk_10005C000;
                  v128(6, "%c[%{public}s %{public}s]:%i [TSM] Reporting performance mode to TSM", v132, v196, v205, 2297);
                }
                v133 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v134 = NFSharedLogGetLogger(v133);
                v135 = objc_claimAutoreleasedReturnValue(v134);
                if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
                {
                  v136 = object_getClass((id)v1);
                  if (class_isMetaClass(v136))
                    v137 = 43;
                  else
                    v137 = 45;
                  v138 = object_getClassName((id)v1);
                  v139 = sel_getName("_startNextSession");
                  *(_DWORD *)buf = 67109890;
                  v214 = v137;
                  v215 = 2082;
                  v216 = v138;
                  v217 = 2082;
                  v218 = v139;
                  v219 = 1024;
                  v220 = 2297;
                  _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Reporting performance mode to TSM", buf, 0x22u);
                }

              }
              *(_BYTE *)(v1 + 10) = 0;
            }
            v140 = sub_100033D5C();
            v141 = (void *)objc_claimAutoreleasedReturnValue(v140);
            v142 = sub_100038214(v141, v38);
            v143 = (void *)objc_claimAutoreleasedReturnValue(v142);

            v8 = 1;
            objc_msgSend(v143, "setPendingImmediateRetry:", 1);
            v5 = v143;
            goto LABEL_123;
          }
        }
        else
        {
          v67 = objc_msgSend(v65, "migrationState");
          if (v61)
            v68 = 1;
          else
            v68 = v44;
          v7 = &unk_10005C000;
          if (v63 || (v68 & 1) != 0 || v62 || v67)
          {
            if (v67 && byte_10005C3E8)
            {
              v209 = v63;
              v69 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v70 = NFLogGetLogger(v69);
              if (v70)
              {
                v71 = (void (*)(uint64_t, const char *, ...))v70;
                v72 = object_getClass((id)v1);
                v73 = class_isMetaClass(v72);
                v74 = object_getClassName((id)v1);
                v201 = sel_getName("_startNextSession");
                v75 = !v73;
                v7 = (_BYTE *)&unk_10005C000;
                v76 = 45;
                if (!v75)
                  v76 = 43;
                v71(6, "%c[%{public}s %{public}s]:%i [TSM] Reaching out to TSM when eSE migation state is not IDLE", v76, v74, v201, 2283);
              }
              v77 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v78 = NFSharedLogGetLogger(v77);
              v79 = objc_claimAutoreleasedReturnValue(v78);
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
              {
                v80 = object_getClass((id)v1);
                if (class_isMetaClass(v80))
                  v81 = 43;
                else
                  v81 = 45;
                v82 = object_getClassName((id)v1);
                v83 = sel_getName("_startNextSession");
                *(_DWORD *)buf = 67109890;
                v214 = v81;
                v215 = 2082;
                v216 = v82;
                v7 = &unk_10005C000;
                v217 = 2082;
                v218 = v83;
                v219 = 1024;
                v220 = 2283;
                _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Reaching out to TSM when eSE migation state is not IDLE", buf, 0x22u);
              }

              v63 = v209;
            }
            goto LABEL_71;
          }
        }
        v8 = 0;
        v9 = 0.0;
        v6 = (_BYTE *)&unk_10005C000;
LABEL_123:

        goto LABEL_124;
      }
    }
  }
}

void sub_10002DC34(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "setPendingImmediateRetry:", 0);
  objc_msgSend(v1, "clearRetryInterval");
  objc_msgSend(v1, "setSourceUrl:", 0);
  objc_msgSend(v1, "setInitialClientRequestInfo:", 0);

}

void sub_10002DD88(const char *a1, void *a2)
{
  size_t v4;
  void *v5;
  size_t v6;
  unint64_t v7;
  size_t v8;
  void *v9;
  char *v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;

  v4 = strlen(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description"));
  v6 = (size_t)objc_msgSend(v5, "length");
  if (objc_msgSend(v5, "length"))
  {
    v7 = 0;
    v8 = 951 - v4;
    do
    {
      if (v6 > v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
        v10 = (char *)objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", v9, 4, v7, v8);

        if (v10 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v6 = 951 - v4;
        }
        else
        {
          v6 = (size_t)&v10[-v7];
          if (!v6)
          {
            ++v7;
            v6 = 950 - v4;
          }
        }
      }
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v13 = (void (*)(uint64_t, const char *, ...))Logger;
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", v7, v6)));
        v13(6, "%s:%i %s %s", "NFLogLargeTSMDescription", 67, a1, (const char *)objc_msgSend(v14, "UTF8String"));

      }
      v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v16 = NFSharedLogGetLogger(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", v7, v6)));
        v19 = objc_msgSend(v18, "UTF8String");
        *(_DWORD *)buf = 136446978;
        v21 = "NFLogLargeTSMDescription";
        v22 = 1024;
        v23 = 67;
        v24 = 2080;
        v25 = a1;
        v26 = 2080;
        v27 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s %s", buf, 0x26u);

      }
      v7 += v6;
      v6 = (size_t)objc_msgSend(v5, "length") - v7;
    }
    while (v7 < (unint64_t)objc_msgSend(v5, "length"));
  }

}

void sub_10002E1E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002E20C(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 24) = v4 == 0;
    v5 = v4;
    objc_storeStrong((id *)(a1 + 16), a2);
    v4 = v5;
  }

}

void sub_100033004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  void *v29;

  objc_sync_exit(v29);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100033058(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100033068(uint64_t a1)
{

}

void sub_100033070(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v12;
  const char *ClassName;
  const char *Name;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
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

  v6 = a2;
  v7 = a3;
  v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_sync_enter(v8);
  if (v7 || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if (v7 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(Class))
          v12 = 43;
        else
          v12 = 45;
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 64));
        Logger(3, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 601, v7);
      }
      v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v16 = NFSharedLogGetLogger(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v18))
          v19 = 43;
        else
          v19 = 45;
        v20 = object_getClassName(*(id *)(a1 + 32));
        v21 = sel_getName(*(SEL *)(a1 + 64));
        *(_DWORD *)buf = 67110146;
        v23 = v19;
        v24 = 2082;
        v25 = v20;
        v26 = 2082;
        v27 = v21;
        v28 = 1024;
        v29 = 601;
        v30 = 2114;
        v31 = v7;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
      }

    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
  }
  objc_sync_exit(v8);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100033278(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100033C98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100033CDC(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

void sub_100033CEC(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

id sub_100033D5C()
{
  objc_opt_self();
  if (qword_10005C3D0 != -1)
    dispatch_once(&qword_10005C3D0, &stru_100055010);
  return (id)qword_10005C3C8;
}

void sub_100033DA0(id a1)
{
  NFRemoteAdminStorage *v1;
  void *v2;

  v1 = objc_opt_new(NFRemoteAdminStorage);
  v2 = (void *)qword_10005C3C8;
  qword_10005C3C8 = (uint64_t)v1;

}

void sub_10003512C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,SEL sel,id a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int buf,int a44,__int16 a45,int a46,__int16 a47,__int16 a48,__int16 a49,int a50,int a51,__int16 a52,__int16 a53,__int16 a54,__int16 a55)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_100035518(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  objc_class *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *v29;
  _BOOL4 v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  Class v40;
  Class v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  Class v51;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      v40 = object_getClass(v5);
      v16 = 45;
      if (isMetaClass)
        v16 = 43;
      v11(4, "%c[%{public}s %{public}s]:%i Invalid key: %{public}@", v16, ClassName, Name, 83, v40);
    }
    v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = NFSharedLogGetLogger(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    v20 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    v22 = object_getClassName(*(id *)(a1 + 32));
    v23 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v43 = v21;
    v44 = 2082;
    v45 = v22;
    v46 = 2082;
    v47 = v23;
    v48 = 1024;
    v49 = 83;
    v50 = 2114;
    v51 = object_getClass(v5);
    v24 = v51;
    v25 = "%c[%{public}s %{public}s]:%i Invalid key: %{public}@";
    goto LABEL_22;
  }
  v8 = objc_opt_class(NFRemoteAdminState);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v27 = NFLogGetLogger(v26);
    if (v27)
    {
      v28 = (void (*)(uint64_t, const char *, ...))v27;
      v29 = object_getClass(*(id *)(a1 + 32));
      v30 = class_isMetaClass(v29);
      v31 = object_getClassName(*(id *)(a1 + 32));
      v32 = sel_getName(*(SEL *)(a1 + 40));
      v41 = object_getClass(v6);
      v33 = 45;
      if (v30)
        v33 = 43;
      v28(4, "%c[%{public}s %{public}s]:%i Invalid admin state: %{public}@", v33, v31, v32, 85, v41);
    }
    v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v35 = NFSharedLogGetLogger(v34);
    v19 = objc_claimAutoreleasedReturnValue(v35);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    v36 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v36))
      v37 = 43;
    else
      v37 = 45;
    v38 = object_getClassName(*(id *)(a1 + 32));
    v39 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v43 = v37;
    v44 = 2082;
    v45 = v38;
    v46 = 2082;
    v47 = v39;
    v48 = 1024;
    v49 = 85;
    v50 = 2114;
    v51 = object_getClass(v6);
    v24 = v51;
    v25 = "%c[%{public}s %{public}s]:%i Invalid admin state: %{public}@";
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v25, buf, 0x2Cu);

LABEL_23:
    goto LABEL_24;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v6, v5);
LABEL_24:

}

void sub_10003586C(id *a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void (*v32)(uint64_t, const char *, ...);
  objc_class *v33;
  _BOOL4 v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  objc_class *v39;
  int v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  NSMutableArray *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];

  v46 = objc_opt_new(NSMutableArray);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[3], "allKeys"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
        v8 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          v9 = objc_msgSend(a1[3], "NF_objectForKey:expectedClass:", v7, objc_opt_class(NFRemoteAdminState));
          v10 = objc_claimAutoreleasedReturnValue(v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sourceUrl](v10, "sourceUrl"));
          if (v11)
          {

          }
          else
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject serverIdentifier](v10, "serverIdentifier"));
            v28 = sub_100036428(a1, v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

            if (!v29)
              -[NSMutableArray addObject:](v46, "addObject:", v7);
          }
        }
        else
        {
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          if (Logger)
          {
            v14 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(a1);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(a1);
            Name = sel_getName("_fixupAdminStates");
            v45 = objc_opt_class(v7);
            v19 = 45;
            if (isMetaClass)
              v19 = 43;
            v14(3, "%c[%{public}s %{public}s]:%i Unexpected element, %{public}@", v19, ClassName, Name, 177, v45);
          }
          v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v21 = NFSharedLogGetLogger(v20);
          v10 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v22 = object_getClass(a1);
            if (class_isMetaClass(v22))
              v23 = 43;
            else
              v23 = 45;
            v24 = object_getClassName(a1);
            v25 = sel_getName("_fixupAdminStates");
            v26 = objc_opt_class(v7);
            *(_DWORD *)buf = 67110146;
            v52 = v23;
            v53 = 2082;
            v54 = v24;
            v55 = 2082;
            v56 = v25;
            v57 = 1024;
            v58 = 177;
            v59 = 2114;
            v60 = v26;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected element, %{public}@", buf, 0x2Cu);
          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    }
    while (v4);
  }

  if (-[NSMutableArray count](v46, "count"))
  {
    v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v31 = NFLogGetLogger(v30);
    if (v31)
    {
      v32 = (void (*)(uint64_t, const char *, ...))v31;
      v33 = object_getClass(a1);
      v34 = class_isMetaClass(v33);
      v43 = object_getClassName(a1);
      v44 = sel_getName("_fixupAdminStates");
      v35 = 45;
      if (v34)
        v35 = 43;
      v32(5, "%c[%{public}s %{public}s]:%i Removing ghost admin states: %{public}@", v35, v43, v44, 189, v46);
    }
    v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v37 = NFSharedLogGetLogger(v36);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = object_getClass(a1);
      if (class_isMetaClass(v39))
        v40 = 43;
      else
        v40 = 45;
      v41 = object_getClassName(a1);
      v42 = sel_getName("_fixupAdminStates");
      *(_DWORD *)buf = 67110146;
      v52 = v40;
      v53 = 2082;
      v54 = v41;
      v55 = 2082;
      v56 = v42;
      v57 = 1024;
      v58 = 189;
      v59 = 2114;
      v60 = (uint64_t)v46;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Removing ghost admin states: %{public}@", buf, 0x2Cu);
    }

    objc_msgSend(a1[3], "removeObjectsForKeys:", v46);
    sub_10003617C(a1);
  }

}

void sub_100035CC4(id *a1)
{
  id v2;
  NSObject *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void (*v17)(uint64_t, const char *, ...);
  objc_class *v18;
  _BOOL4 v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *specific;
  uint64_t Logger;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  objc_class *v41;
  int v42;
  const char *Name;
  uint64_t v44;
  char v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];

  v2 = sub_100036110(a1);
  v46 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (!v46)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v34 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName("_updateAdminStatesURL");
      v38 = 45;
      if (isMetaClass)
        v38 = 43;
      v34(4, "%c[%{public}s %{public}s]:%i Empty registration info", v38, ClassName, Name, 142);
    }
    v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v40 = NFSharedLogGetLogger(v39);
    v3 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v41 = object_getClass(a1);
      if (class_isMetaClass(v41))
        v42 = 43;
      else
        v42 = 45;
      *(_DWORD *)buf = 67109890;
      v52 = v42;
      v53 = 2082;
      v54 = object_getClassName(a1);
      v55 = 2082;
      v56 = sel_getName("_updateAdminStatesURL");
      v57 = 1024;
      v58 = 142;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Empty registration info", buf, 0x22u);
    }
    goto LABEL_38;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[3], "allValues"));
  v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (!v4)
  {
LABEL_38:

    goto LABEL_39;
  }
  v5 = v4;
  v45 = 0;
  v6 = *(_QWORD *)v48;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v48 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
      v9 = objc_opt_class(NFRemoteAdminState);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverIdentifier"));
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "NF_stringForKey:", v10));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sourceUrl"));
        v13 = v12;
        if (v12)
          v14 = v11 == 0;
        else
          v14 = 1;
        if (v14)
        {

        }
        else
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sourceUrl"));
          v31 = -[NSObject compare:](v11, "compare:", v30);

          if (v31)
          {
            objc_msgSend(v8, "setSourceUrl:", v11);
            v45 = 1;
          }
        }
      }
      else
      {
        v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v16 = NFLogGetLogger(v15);
        if (v16)
        {
          v17 = (void (*)(uint64_t, const char *, ...))v16;
          v18 = object_getClass(a1);
          v19 = class_isMetaClass(v18);
          v20 = object_getClassName(a1);
          v21 = sel_getName("_updateAdminStatesURL");
          v44 = objc_opt_class(v8);
          v22 = 45;
          if (v19)
            v22 = 43;
          v17(3, "%c[%{public}s %{public}s]:%i Unexpected element, %{public}@", v22, v20, v21, 152, v44);
        }
        v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v24 = NFSharedLogGetLogger(v23);
        v11 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v25 = object_getClass(a1);
          if (class_isMetaClass(v25))
            v26 = 43;
          else
            v26 = 45;
          v27 = object_getClassName(a1);
          v28 = sel_getName("_updateAdminStatesURL");
          v29 = objc_opt_class(v8);
          *(_DWORD *)buf = 67110146;
          v52 = v26;
          v53 = 2082;
          v54 = v27;
          v55 = 2082;
          v56 = v28;
          v57 = 1024;
          v58 = 152;
          v59 = 2114;
          v60 = v29;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected element, %{public}@", buf, 0x2Cu);
        }
      }

    }
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  }
  while (v5);

  if ((v45 & 1) != 0)
    sub_10003617C(a1);
LABEL_39:

}

id sub_100036110(void *a1)
{
  id *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[1], "dictionaryForKey:", CFSTR("RegistrationInfo")));
    objc_sync_exit(v1);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void sub_100036168(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003617C(void *a1)
{
  id *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v1[3], 1, 0));
    if (v2)
    {
      objc_msgSend(v1[1], "setObject:forKey:", v2, CFSTR("ServerStates"));
      objc_msgSend(v1[1], "synchronize");
    }

    objc_sync_exit(v1);
  }
}

void sub_100036248(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, SEL sel, int buf, int a16, __int128 a17, int a18, int a19, __int128 a20)
{
  void *v20;
  const char *v21;
  id v22;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *ClassName;
  const char *Name;
  void *v33;
  void *v34;
  const char *sela;

  sela = v21;
  if (a2)
  {
    if (a2 == 2)
    {
      v22 = objc_begin_catch(exception_object);
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(v20);
        class_isMetaClass(Class);
        object_getClassName(v20);
        sel_getName(sela);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "description"));
        Logger(3, "%c[%{public}s %{public}s]:%i archive failed:%{public}@");

      }
      v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v27 = NFSharedLogGetLogger(v26);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = object_getClass(v20);
        if (class_isMetaClass(v29))
          v30 = 43;
        else
          v30 = 45;
        ClassName = object_getClassName(v20);
        Name = sel_getName(sela);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "description"));
        buf = 67110146;
        a16 = v30;
        LOWORD(a17) = 2082;
        *(_QWORD *)((char *)&a17 + 2) = ClassName;
        WORD5(a17) = 2082;
        *(_QWORD *)((char *)&a17 + 12) = Name;
        LOWORD(a19) = 1024;
        *(int *)((char *)&a19 + 2) = 553;
        WORD1(a20) = 2114;
        *(_QWORD *)((char *)&a20 + 4) = v33;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i archive failed:%{public}@", (uint8_t *)&buf, 0x2Cu);

      }
      objc_end_catch();
      JUMPOUT(0x100036200);
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

id sub_100036428(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
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

  v3 = a2;
  v4 = sub_100036110(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_stringForKey:", v3));

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName("serverURLStringForIdentifier:");
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i No URL for %{public}@", v13, ClassName, Name, 368, v3);
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
      v23 = v18;
      v24 = 2082;
      v25 = object_getClassName(a1);
      v26 = 2082;
      v27 = sel_getName("serverURLStringForIdentifier:");
      v28 = 1024;
      v29 = 368;
      v30 = 2114;
      v31 = v3;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No URL for %{public}@", buf, 0x2Cu);
    }

  }
  return v6;
}

void sub_100036604(void *a1)
{
  id *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v1[4], 1, 0));
    if (v2)
    {
      objc_msgSend(v1[1], "setObject:forKey:", v2, CFSTR("RedirectStates"));
      objc_msgSend(v1[1], "synchronize");
    }

    objc_sync_exit(v1);
  }
}

void sub_1000366D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, SEL sel, int buf, int a16, __int128 a17, int a18, int a19, __int128 a20)
{
  void *v20;
  const char *v21;
  id v22;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *ClassName;
  const char *Name;
  void *v33;
  void *v34;
  const char *sela;

  sela = v21;
  if (a2)
  {
    if (a2 == 2)
    {
      v22 = objc_begin_catch(exception_object);
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(v20);
        class_isMetaClass(Class);
        object_getClassName(v20);
        sel_getName(sela);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "description"));
        Logger(3, "%c[%{public}s %{public}s]:%i archive failed:%{public}@");

      }
      v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v27 = NFSharedLogGetLogger(v26);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = object_getClass(v20);
        if (class_isMetaClass(v29))
          v30 = 43;
        else
          v30 = 45;
        ClassName = object_getClassName(v20);
        Name = sel_getName(sela);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "description"));
        buf = 67110146;
        a16 = v30;
        LOWORD(a17) = 2082;
        *(_QWORD *)((char *)&a17 + 2) = ClassName;
        WORD5(a17) = 2082;
        *(_QWORD *)((char *)&a17 + 12) = Name;
        LOWORD(a19) = 1024;
        *(int *)((char *)&a19 + 2) = 672;
        WORD1(a20) = 2114;
        *(_QWORD *)((char *)&a20 + 4) = v33;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i archive failed:%{public}@", (uint8_t *)&buf, 0x2Cu);

      }
      objc_end_catch();
      JUMPOUT(0x100036688);
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1000368B0(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);

}

uint64_t sub_1000368F4(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v11;
  const char *ClassName;
  const char *Name;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  NSObject *v19;
  id v20;
  int v21;
  uint64_t v22;
  void *i;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  objc_class *v42;
  int v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  void (*v48)(uint64_t, const char *, ...);
  objc_class *v49;
  uint64_t v50;
  const char *v51;
  const char *v52;
  void *v53;
  uint64_t v54;
  objc_class *v55;
  int v56;
  const char *v57;
  const char *v58;
  void *v60;
  void (*v61)(uint64_t, const char *, ...);
  objc_class *v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  objc_class *v69;
  int v70;
  const char *v71;
  const char *v72;
  const char *v73;
  void *v74;
  void (*v75)(uint64_t, const char *, ...);
  objc_class *v76;
  uint64_t v77;
  const char *v78;
  const char *v79;
  void *v80;
  uint64_t v81;
  objc_class *v82;
  int v83;
  const char *v84;
  const char *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  uint8_t v95[128];
  uint8_t buf[4];
  int v97;
  __int16 v98;
  const char *v99;
  __int16 v100;
  const char *v101;
  __int16 v102;
  int v103;
  __int16 v104;
  id v105;
  __int16 v106;
  id v107;

  v5 = a2;
  v6 = a3;
  if (!a1)
  {
    v46 = 0;
    goto LABEL_58;
  }
  v7 = a1;
  objc_sync_enter(v7);
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
  {
    Class = object_getClass(v7);
    if (class_isMetaClass(Class))
      v11 = 43;
    else
      v11 = 45;
    ClassName = object_getClassName(v7);
    Name = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
    Logger(6, "%c[%{public}s %{public}s]:%i %{public}@ %{public}@", v11, ClassName, Name, 314, v5, v6);
  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(v7);
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    *(_DWORD *)buf = 67110402;
    v97 = v18;
    v98 = 2082;
    v99 = object_getClassName(v7);
    v100 = 2082;
    v101 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
    v102 = 1024;
    v103 = 314;
    v104 = 2114;
    v105 = v5;
    v106 = 2114;
    v107 = v6;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ %{public}@", buf, 0x36u);
  }

  if (!v5)
  {
    objc_msgSend(v7[1], "removeObjectForKey:", CFSTR("RegistrationInfo"));
    objc_msgSend(v7[1], "removeObjectForKey:", CFSTR("PrimaryRegionTopic"));
    sub_10003586C(v7);
    goto LABEL_44;
  }
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
  if (!v20)
  {

    goto LABEL_46;
  }
  v21 = 0;
  v22 = *(_QWORD *)v91;
  do
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(_QWORD *)v91 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)i);
      v25 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v24, v25) & 1) == 0)
      {
        v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v33);
        if (v34)
        {
          v35 = object_getClass(v7);
          if (class_isMetaClass(v35))
            v36 = 43;
          else
            v36 = 45;
          v37 = object_getClassName(v7);
          v38 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
          v34(3, "%c[%{public}s %{public}s]:%i Invalid type for info dictionary key", v36, v37, v38, 320);
        }
        v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v40 = NFSharedLogGetLogger(v39);
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = object_getClass(v7);
          if (class_isMetaClass(v42))
            v43 = 43;
          else
            v43 = 45;
          v44 = object_getClassName(v7);
          v45 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
          *(_DWORD *)buf = 67109890;
          v97 = v43;
          v98 = 2082;
          v99 = v44;
          v100 = 2082;
          v101 = v45;
          v102 = 1024;
          v103 = 320;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid type for info dictionary key", buf, 0x22u);
        }

        goto LABEL_56;
      }
      v21 |= objc_msgSend(v24, "isEqualToString:", v6);
    }
    v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
  }
  while (v20);

  if ((v21 & 1) == 0)
  {
LABEL_46:
    v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v48 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v47);
    if (v48)
    {
      v49 = object_getClass(v7);
      if (class_isMetaClass(v49))
        v50 = 43;
      else
        v50 = 45;
      v51 = object_getClassName(v7);
      v52 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
      v48(3, "%c[%{public}s %{public}s]:%i Registration info does not contain %{public}@", v50, v51, v52, 329, v6);
    }
    v53 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v54 = NFSharedLogGetLogger(v53);
    v19 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v55 = object_getClass(v7);
      if (class_isMetaClass(v55))
        v56 = 43;
      else
        v56 = 45;
      v57 = object_getClassName(v7);
      v58 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
      *(_DWORD *)buf = 67110146;
      v97 = v56;
      v98 = 2082;
      v99 = v57;
      v100 = 2082;
      v101 = v58;
      v102 = 1024;
      v103 = 329;
      v104 = 2114;
      v105 = v6;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Registration info does not contain %{public}@", buf, 0x2Cu);
    }
LABEL_56:

    v46 = 0;
    goto LABEL_57;
  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
  v26 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
  if (!v26)
    goto LABEL_31;
  v27 = *(_QWORD *)v87;
  while (2)
  {
    v28 = 0;
    while (2)
    {
      if (*(_QWORD *)v87 != v27)
        objc_enumerationMutation(v19);
      v29 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v28);
      v30 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v29, v30) & 1) == 0)
      {
        v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v61 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v60);
        if (v61)
        {
          v62 = object_getClass(v7);
          if (class_isMetaClass(v62))
            v63 = 43;
          else
            v63 = 45;
          v64 = object_getClassName(v7);
          v65 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
          v61(3, "%c[%{public}s %{public}s]:%i Invalid type for info dictionary value", v63, v64, v65, 335);
        }
        v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v67 = NFSharedLogGetLogger(v66);
        v68 = objc_claimAutoreleasedReturnValue(v67);
        if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          goto LABEL_80;
        v69 = object_getClass(v7);
        if (class_isMetaClass(v69))
          v70 = 43;
        else
          v70 = 45;
        v71 = object_getClassName(v7);
        v72 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
        *(_DWORD *)buf = 67109890;
        v97 = v70;
        v98 = 2082;
        v99 = v71;
        v100 = 2082;
        v101 = v72;
        v102 = 1024;
        v103 = 335;
        v73 = "%c[%{public}s %{public}s]:%i Invalid type for info dictionary value";
        goto LABEL_79;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v29));
      v32 = v31 == 0;

      if (v32)
      {
        v74 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v75 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v74);
        if (v75)
        {
          v76 = object_getClass(v7);
          if (class_isMetaClass(v76))
            v77 = 43;
          else
            v77 = 45;
          v78 = object_getClassName(v7);
          v79 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
          v75(3, "%c[%{public}s %{public}s]:%i Invalid URL value", v77, v78, v79, 339);
        }
        v80 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v81 = NFSharedLogGetLogger(v80);
        v68 = objc_claimAutoreleasedReturnValue(v81);
        if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          goto LABEL_80;
        v82 = object_getClass(v7);
        if (class_isMetaClass(v82))
          v83 = 43;
        else
          v83 = 45;
        v84 = object_getClassName(v7);
        v85 = sel_getName("setRegistrationInfo:defaultServerIdentifier:");
        *(_DWORD *)buf = 67109890;
        v97 = v83;
        v98 = 2082;
        v99 = v84;
        v100 = 2082;
        v101 = v85;
        v102 = 1024;
        v103 = 339;
        v73 = "%c[%{public}s %{public}s]:%i Invalid URL value";
LABEL_79:
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, v73, buf, 0x22u);
LABEL_80:

        goto LABEL_56;
      }
      if (v26 != (id)++v28)
        continue;
      break;
    }
    v26 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
    if (v26)
      continue;
    break;
  }
LABEL_31:

  objc_msgSend(v7[1], "setObject:forKey:", v5, CFSTR("RegistrationInfo"));
  objc_msgSend(v7[1], "setObject:forKey:", v6, CFSTR("PrimaryRegionTopic"));
  sub_100035CC4(v7);
LABEL_44:
  objc_msgSend(v7[1], "synchronize");
  v46 = 1;
LABEL_57:
  objc_sync_exit(v7);

LABEL_58:
  return v46;
}

void sub_100037170(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000371E0(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *v14;
  _BOOL4 v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  objc_class *v26;
  const char *v27;
  void *specific;
  uint64_t Logger;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  objc_class *v38;
  int v39;
  const char *v40;
  const char *v41;
  Class v42;
  Class v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  Class v53;

  v7 = a2;
  v8 = a3;
  v9 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v30 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v43 = object_getClass(v7);
      v35 = 45;
      if (isMetaClass)
        v35 = 43;
      v30(4, "%c[%{public}s %{public}s]:%i Invalid AID type: %{public}@", v35, ClassName, Name, 268, v43);
    }
    v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v37 = NFSharedLogGetLogger(v36);
    v21 = objc_claimAutoreleasedReturnValue(v37);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    v38 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v38))
      v39 = 43;
    else
      v39 = 45;
    v40 = object_getClassName(*(id *)(a1 + 32));
    v41 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v45 = v39;
    v46 = 2082;
    v47 = v40;
    v48 = 2082;
    v49 = v41;
    v50 = 1024;
    v51 = 268;
    v52 = 2114;
    v53 = object_getClass(v7);
    v26 = v53;
    v27 = "%c[%{public}s %{public}s]:%i Invalid AID type: %{public}@";
    goto LABEL_21;
  }
  v10 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) == 0)
  {
    v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFLogGetLogger(v11);
    if (v12)
    {
      v13 = (void (*)(uint64_t, const char *, ...))v12;
      v14 = object_getClass(*(id *)(a1 + 32));
      v15 = class_isMetaClass(v14);
      v16 = object_getClassName(*(id *)(a1 + 32));
      v17 = sel_getName(*(SEL *)(a1 + 48));
      v42 = object_getClass(v8);
      v18 = 45;
      if (v15)
        v18 = 43;
      v13(4, "%c[%{public}s %{public}s]:%i Invalid Topic type: %{public}@", v18, v16, v17, 272, v42);
    }
    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFSharedLogGetLogger(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    v22 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    v24 = object_getClassName(*(id *)(a1 + 32));
    v25 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v45 = v23;
    v46 = 2082;
    v47 = v24;
    v48 = 2082;
    v49 = v25;
    v50 = 1024;
    v51 = 272;
    v52 = 2114;
    v53 = object_getClass(v8);
    v26 = v53;
    v27 = "%c[%{public}s %{public}s]:%i Invalid Topic type: %{public}@";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v27, buf, 0x2Cu);

LABEL_22:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

id sub_100037538(void *a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = sub_100036428(a1, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id sub_10003758C(void *a1)
{
  id *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[1], "stringForKey:", CFSTR("PrimaryRegionTopic")));
    objc_sync_exit(v1);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void sub_1000375E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000375F8(void *a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;

  v3 = a2;
  if (a1)
  {
    v4 = a1;
    objc_sync_enter(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4[2], "objectForKey:", v3));
    objc_sync_exit(v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_100037664(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100037678(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v12;
  const char *ClassName;
  const char *Name;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  Class isa;
  void *v21;
  uint64_t v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  _BOOL4 isMetaClass;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v6)
    {
      v8 = a1;
      objc_sync_enter(v8);
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(v8);
        if (class_isMetaClass(Class))
          v12 = 43;
        else
          v12 = 45;
        ClassName = object_getClassName(v8);
        Name = sel_getName("setServerIdentifier:forAppletID:");
        Logger(6, "%c[%{public}s %{public}s]:%i %{public}@ = %{public}@", v12, ClassName, Name, 399, v5, v7);
      }
      v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v16 = NFSharedLogGetLogger(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = object_getClass(v8);
        if (class_isMetaClass(v18))
          v19 = 43;
        else
          v19 = 45;
        *(_DWORD *)buf = 67110402;
        v34 = v19;
        v35 = 2082;
        v36 = object_getClassName(v8);
        v37 = 2082;
        v38 = sel_getName("setServerIdentifier:forAppletID:");
        v39 = 1024;
        v40 = 399;
        v41 = 2114;
        v42 = v5;
        v43 = 2114;
        v44 = v7;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ = %{public}@", buf, 0x36u);
      }

      isa = v8[2].isa;
      if (v5)
        -[objc_class setObject:forKey:](isa, "setObject:forKey:", v5, v7);
      else
        -[objc_class removeObjectForKey:](isa, "removeObjectForKey:", v7);
      -[objc_class setObject:forKey:](v8[1].isa, "setObject:forKey:", v8[2].isa, CFSTR("ServersForApplets"));
      -[objc_class synchronize](v8[1].isa, "synchronize");
      objc_sync_exit(v8);
    }
    else
    {
      v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v22 = NFLogGetLogger(v21);
      if (v22)
      {
        v23 = (void (*)(uint64_t, const char *, ...))v22;
        v24 = object_getClass(a1);
        isMetaClass = class_isMetaClass(v24);
        v31 = object_getClassName(a1);
        v32 = sel_getName("setServerIdentifier:forAppletID:");
        v26 = 45;
        if (isMetaClass)
          v26 = 43;
        v23(3, "%c[%{public}s %{public}s]:%i Invalid ID, %{public}@", v26, v31, v32, 394, 0);
      }
      v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v28 = NFSharedLogGetLogger(v27);
      v8 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v29 = object_getClass(a1);
        if (class_isMetaClass(v29))
          v30 = 43;
        else
          v30 = 45;
        *(_DWORD *)buf = 67110146;
        v34 = v30;
        v35 = 2082;
        v36 = object_getClassName(a1);
        v37 = 2082;
        v38 = sel_getName("setServerIdentifier:forAppletID:");
        v39 = 1024;
        v40 = 394;
        v41 = 2114;
        v42 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid ID, %{public}@", buf, 0x2Cu);
      }
    }

  }
}

void sub_1000379A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000379D0(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", 0));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "info"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sequenceCounter"));
      v1 = objc_msgSend(v4, "unsignedIntegerValue") != *(id *)(v1 + 48);

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

void sub_100037A58(_QWORD *a1, char a2)
{
  void *v3;
  void *v4;
  void *specific;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  unsigned int v39;

  if (a1 && (a2 & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "info"));

    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName("setHasJCOPUpdated:");
      v12 = a1[6];
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sequenceCounter"));
      v27 = objc_msgSend(v13, "unsignedIntValue");
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v7(6, "%c[%{public}s %{public}s]:%i Update counter changed %d => %d", v14, ClassName, Name, 429, v12, v27);

    }
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = object_getClass(a1);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      v20 = object_getClassName(a1);
      v21 = sel_getName("setHasJCOPUpdated:");
      v22 = a1[6];
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sequenceCounter"));
      *(_DWORD *)buf = 67110402;
      v29 = v19;
      v30 = 2082;
      v31 = v20;
      v32 = 2082;
      v33 = v21;
      v34 = 1024;
      v35 = 429;
      v36 = 1024;
      v37 = v22;
      v38 = 1024;
      v39 = objc_msgSend(v23, "unsignedIntValue");
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Update counter changed %d => %d", buf, 0x2Eu);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sequenceCounter"));
    objc_msgSend(v24, "setInteger:forKey:", objc_msgSend(v25, "unsignedIntegerValue"), CFSTR("SecureElementSequenceCounter"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sequenceCounter"));
    a1[6] = objc_msgSend(v26, "unsignedIntegerValue");

  }
}

id sub_100037CD0(void *a1)
{
  id *v1;
  id v2;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = v1[5];
    objc_sync_exit(v1);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void sub_100037D1C(void *a1, void *a2)
{
  _QWORD *v3;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    v4 = objc_msgSend(v6, "copy");
    v5 = (void *)v3[5];
    v3[5] = v4;

    objc_sync_exit(v3);
  }

}

void sub_100037D7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100037D90(void *a1)
{
  id *v1;
  void *v2;

  v1 = a1;
  objc_sync_enter(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[1], "dictionaryForKey:", CFSTR("APNConnectionRequestManual")));
  objc_sync_exit(v1);

  return v2;
}

void sub_100037DDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100037DF0(void *a1, void *a2)
{
  id v3;
  id *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v7 = v3;
    v4 = a1;
    objc_sync_enter(v4);
    v5 = v4[1];
    if (v7)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("APNConnectionRequestManual")));

      if (!v6)
        objc_msgSend(v4[1], "setObject:forKey:", v7, CFSTR("APNConnectionRequestManual"));
    }
    else
    {
      objc_msgSend(v5, "removeObjectForKey:", CFSTR("APNConnectionRequestManual"));
    }
    objc_msgSend(v4[1], "synchronize");
    objc_sync_exit(v4);

    v3 = v7;
  }

}

void sub_100037E90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100037EA4(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NFRemoteAdminState *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  int v21;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v25;
  const char *ClassName;
  const char *Name;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  id v42;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = a1;
    objc_sync_enter(v7);
    if (v6)
    {
      v8 = sub_100038214(v7, v6);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      v10 = v9;
      if (v9)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject APNConnectionRequesterFirst](v9, "APNConnectionRequesterFirst"));

        if (v11)
          -[NSObject setAPNConnectionRequesterLatest:](v10, "setAPNConnectionRequesterLatest:", v5);
        else
          -[NSObject setAPNConnectionRequesterFirst:](v10, "setAPNConnectionRequesterFirst:", v5);
      }
      else
      {
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
        if (Logger)
        {
          Class = object_getClass(v7);
          if (class_isMetaClass(Class))
            v25 = 43;
          else
            v25 = 45;
          ClassName = object_getClassName(v7);
          Name = sel_getName("setAPNConnectionRequesterPush:forIdentifier:");
          Logger(4, "%c[%{public}s %{public}s]:%i No state for topic %{public}@", v25, ClassName, Name, 501, v6);
        }
        v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v29 = NFSharedLogGetLogger(v28);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = object_getClass(v7);
          if (class_isMetaClass(v31))
            v32 = 43;
          else
            v32 = 45;
          *(_DWORD *)buf = 67110146;
          v34 = v32;
          v35 = 2082;
          v36 = object_getClassName(v7);
          v37 = 2082;
          v38 = sel_getName("setAPNConnectionRequesterPush:forIdentifier:");
          v39 = 1024;
          v40 = 501;
          v41 = 2114;
          v42 = v6;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No state for topic %{public}@", buf, 0x2Cu);
        }

        v10 = 0;
      }
    }
    else
    {
      v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v12);
      if (v13)
      {
        v14 = object_getClass(v7);
        if (class_isMetaClass(v14))
          v15 = 43;
        else
          v15 = 45;
        v16 = object_getClassName(v7);
        v17 = sel_getName("setAPNConnectionRequesterPush:forIdentifier:");
        v13(6, "%c[%{public}s %{public}s]:%i No identifier", v15, v16, v17, 489);
      }
      v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v19 = NFSharedLogGetLogger(v18);
      v10 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v20 = object_getClass(v7);
        if (class_isMetaClass(v20))
          v21 = 43;
        else
          v21 = 45;
        *(_DWORD *)buf = 67109890;
        v34 = v21;
        v35 = 2082;
        v36 = object_getClassName(v7);
        v37 = 2082;
        v38 = sel_getName("setAPNConnectionRequesterPush:forIdentifier:");
        v39 = 1024;
        v40 = 489;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No identifier", buf, 0x22u);
      }
    }

    objc_sync_exit(v7);
  }

}

void sub_1000381E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NFRemoteAdminState *sub_100038214(void *a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  id v6;
  NFRemoteAdminState *v7;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v11;
  const char *ClassName;
  const char *Name;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
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
  void *v30;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", "serverStateForIdentifier:", a1, CFSTR("NFRemoteAdminStorage.m"), 533, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("theIdentifier != nil"));

    }
    v5 = a1;
    objc_sync_enter(v5);
    v6 = objc_msgSend(v5[3], "NF_objectForKey:expectedClass:", v4, objc_opt_class(NFRemoteAdminState));
    v7 = (NFRemoteAdminState *)objc_claimAutoreleasedReturnValue(v6);
    if (!v7)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(v5);
        if (class_isMetaClass(Class))
          v11 = 43;
        else
          v11 = 45;
        ClassName = object_getClassName(v5);
        Name = sel_getName("serverStateForIdentifier:");
        Logger(6, "%c[%{public}s %{public}s]:%i Init state for %{public}@", v11, ClassName, Name, 538, v4);
      }
      v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v15 = NFSharedLogGetLogger(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = object_getClass(v5);
        if (class_isMetaClass(v17))
          v18 = 43;
        else
          v18 = 45;
        *(_DWORD *)buf = 67110146;
        v22 = v18;
        v23 = 2082;
        v24 = object_getClassName(v5);
        v25 = 2082;
        v26 = sel_getName("serverStateForIdentifier:");
        v27 = 1024;
        v28 = 538;
        v29 = 2114;
        v30 = v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Init state for %{public}@", buf, 0x2Cu);
      }

      v7 = -[NFRemoteAdminState initWithIdentifier:sourceURL:retryDate:]([NFRemoteAdminState alloc], "initWithIdentifier:sourceURL:retryDate:", v4, 0, 0);
      objc_msgSend(v5[3], "setObject:forKey:", v7, v4);
    }
    objc_sync_exit(v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_100038480(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000384A8(void *a1)
{
  id *v1;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v5;
  const char *ClassName;
  const char *Name;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  void *v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  uint64_t v47;
  _BYTE v48[128];

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(v1);
      if (class_isMetaClass(Class))
        v5 = 43;
      else
        v5 = 45;
      ClassName = object_getClassName(v1);
      Name = sel_getName("resetAPNConnectionRequest");
      Logger(6, "%c[%{public}s %{public}s]:%i Resetting all APN connection states", v5, ClassName, Name, 509);
    }
    v8 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v9 = NFSharedLogGetLogger(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = object_getClass(v1);
      if (class_isMetaClass(v11))
        v12 = 43;
      else
        v12 = 45;
      *(_DWORD *)buf = 67109890;
      v39 = v12;
      v40 = 2082;
      v41 = object_getClassName(v1);
      v42 = 2082;
      v43 = sel_getName("resetAPNConnectionRequest");
      v44 = 1024;
      v45 = 509;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Resetting all APN connection states", buf, 0x22u);
    }

    sub_100037DF0(v1, 0);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[3], "allValues"));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          v18 = objc_opt_class(NFRemoteAdminState);
          if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
          {
            objc_msgSend(v17, "setAPNConnectionRequesterFirst:", 0);
            objc_msgSend(v17, "setAPNConnectionRequesterLatest:", 0);
          }
          else
          {
            v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v19);
            if (v20)
            {
              v21 = object_getClass(v1);
              if (class_isMetaClass(v21))
                v22 = 43;
              else
                v22 = 45;
              v23 = object_getClassName(v1);
              v24 = sel_getName("resetAPNConnectionRequest");
              v25 = objc_opt_class(v17);
              v20(4, "%c[%{public}s %{public}s]:%i Unexpected state object, %{public}@", v22, v23, v24, 515, v25);
            }
            v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v27 = NFSharedLogGetLogger(v26);
            v28 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              v29 = object_getClass(v1);
              if (class_isMetaClass(v29))
                v30 = 43;
              else
                v30 = 45;
              v31 = object_getClassName(v1);
              v32 = sel_getName("resetAPNConnectionRequest");
              v33 = objc_opt_class(v17);
              *(_DWORD *)buf = 67110146;
              v39 = v30;
              v40 = 2082;
              v41 = v31;
              v42 = 2082;
              v43 = v32;
              v44 = 1024;
              v45 = 515;
              v46 = 2114;
              v47 = v33;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state object, %{public}@", buf, 0x2Cu);
            }

          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
      }
      while (v14);
    }

    objc_sync_exit(v1);
  }
}

void sub_100038874(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000388B4(void *a1)
{
  id *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[3], "allValues"));
    objc_sync_exit(v1);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void sub_100038904(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSMutableDictionary *sub_100038918(id *a1, void *a2, void *a3)
{
  id v5;
  _UNKNOWN **v6;
  NSMutableDictionary *v7;
  NFRemoteAdminState *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *specific;
  uint64_t Logger;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  objc_class *v38;
  int v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  NSMutableDictionary *v44;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  void (*v53)(uint64_t, const char *, ...);
  objc_class *v54;
  void *v55;
  _BOOL4 v56;
  const char *v57;
  BOOL v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  objc_class *v63;
  int v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  id *v73;
  id v74;
  const __CFString *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  uint64_t v87;
  void (*v88)(uint64_t, const char *, ...);
  objc_class *v89;
  _BOOL4 v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  NSObject *v95;
  objc_class *v96;
  int v97;
  const char *v98;
  const char *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  id v103;
  void *v104;
  uint64_t v105;
  void (*v106)(uint64_t, const char *, ...);
  objc_class *v107;
  _BOOL4 v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  NSObject *v112;
  objc_class *v113;
  int v114;
  const char *v115;
  const char *v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  id v124;
  const char *v125;
  const char *v126;
  const char *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  NSMutableDictionary *v131;
  NSMutableDictionary *v132;
  id v133;
  void *v134;
  void *v135;
  uint64_t v136;
  NSMutableArray *v137;
  id v138;
  id v139;
  void *v140;
  id obj;
  id obja;
  id *v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  id v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  const __CFString *v153;
  id v154;
  uint8_t v155[128];
  uint8_t buf[8];
  _BYTE v157[10];
  __int16 v158;
  const char *v159;
  __int16 v160;
  int v161;
  __int16 v162;
  uint64_t v163;
  _BYTE v164[128];
  _QWORD v165[2];

  v5 = a2;
  v138 = a3;
  v143 = a1;
  if (!a1)
  {
    v44 = 0;
    goto LABEL_35;
  }
  v6 = &APSEnvironmentProduction_ptr;
  v7 = objc_opt_new(NSMutableDictionary);
  if (objc_msgSend(v5, "length"))
  {
    v8 = sub_100038214(a1, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "unsentScriptResponse"));

  v11 = &APSEnvironmentProduction_ptr;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "unsentScriptResponse"));
    -[NSMutableDictionary addEntriesFromDictionary:](v7, "addEntriesFromDictionary:", v12);

LABEL_7:
    obj = (id)objc_opt_new(v11[54]);
    if (obj)
    {
      v134 = v9;
      v131 = v7;
      v13 = sub_100037D90(v143);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

      if (v14)
      {
        v15 = sub_100037D90(v143);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        objc_msgSend(obj, "addObject:", v16);

      }
      v146 = 0u;
      v147 = 0u;
      v144 = 0u;
      v145 = 0u;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143[3], "allValues"));
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v144, v155, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v145;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(_QWORD *)v145 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * (_QWORD)i);
            v23 = objc_opt_class(NFRemoteAdminState);
            if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
            {
              specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              Logger = NFLogGetLogger(specific);
              if (Logger)
              {
                v30 = (void (*)(uint64_t, const char *, ...))Logger;
                Class = object_getClass(v143);
                isMetaClass = class_isMetaClass(Class);
                ClassName = object_getClassName(v143);
                Name = sel_getName("nextRequestForServer:session:");
                v129 = objc_opt_class(v22);
                v35 = 45;
                if (isMetaClass)
                  v35 = 43;
                v30(4, "%c[%{public}s %{public}s]:%i Unexected state object, %{public}@", v35, ClassName, Name, 646, v129);
              }
              v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v37 = NFSharedLogGetLogger(v36);
              v27 = objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                v38 = object_getClass(v143);
                if (class_isMetaClass(v38))
                  v39 = 43;
                else
                  v39 = 45;
                v40 = object_getClassName(v143);
                v41 = sel_getName("nextRequestForServer:session:");
                v42 = objc_opt_class(v22);
                *(_DWORD *)buf = 67110146;
                *(_DWORD *)&buf[4] = v39;
                *(_WORD *)v157 = 2082;
                *(_QWORD *)&v157[2] = v40;
                v158 = 2082;
                v159 = v41;
                v160 = 1024;
                v161 = 646;
                v162 = 2114;
                v163 = v42;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexected state object, %{public}@", buf, 0x2Cu);
              }
              goto LABEL_29;
            }
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "APNConnectionRequesterFirst"));

            if (v24)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "APNConnectionRequesterFirst"));
              objc_msgSend(obj, "addObject:", v25);

            }
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "APNConnectionRequesterLatest"));

            if (v26)
            {
              v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "APNConnectionRequesterLatest"));
              objc_msgSend(obj, "addObject:", v27);
LABEL_29:

              continue;
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v144, v155, 16);
        }
        while (v19);
      }

      v153 = CFSTR("APNState");
      v154 = obj;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v154, &v153, 1));
      v7 = v131;
      -[NSMutableDictionary addEntriesFromDictionary:](v131, "addEntriesFromDictionary:", v43);

      v9 = v134;
    }
    v44 = v7;
    goto LABEL_34;
  }
  if (!v138)
    goto LABEL_7;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "stateInformation"));
  if (objc_msgSend(obj, "count"))
  {
    v135 = v9;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", 0));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "info"));

    v132 = v7;
    v133 = v5;
    if (v47
      && (v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "sequenceCounter")),
          v49 = objc_msgSend(v48, "unsignedIntegerValue"),
          v50 = v143[6],
          v48,
          v49 != v50))
    {
      v165[0] = CFSTR("osUpdateInfo");
      v65 = objc_alloc((Class)NSString);
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "sequenceCounter"));
      v67 = objc_msgSend(v65, "initWithFormat:", CFSTR("%04X"), objc_msgSend(v66, "unsignedIntValue"));
      *(_QWORD *)buf = v67;
      v165[1] = CFSTR("seAppletStateMap");
      v68 = objc_alloc((Class)NSString);
      v124 = objc_msgSend(v47, "appletMap");
      v69 = v68;
      v6 = &APSEnvironmentProduction_ptr;
      v70 = objc_msgSend(v69, "initWithFormat:", CFSTR("%04X"), v124);
      *(_QWORD *)v157 = v70;
      v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v165, 2));

    }
    else
    {
      v140 = 0;
    }

    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 2));
    v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v71, CFSTR("kVersion")));

    v137 = objc_opt_new(NSMutableArray);
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    obja = obj;
    v72 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v149, v164, 16);
    v73 = v143;
    if (v72)
    {
      v74 = v72;
      v75 = CFSTR("secureElementType");
      v76 = *(_QWORD *)v150;
      v136 = *(_QWORD *)v150;
      do
      {
        v77 = 0;
        v139 = v74;
        do
        {
          if (*(_QWORD *)v150 != v76)
            objc_enumerationMutation(obja);
          v78 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * (_QWORD)v77);
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "NF_stringForKey:", v75));
          if (objc_msgSend(v79, "isEqualToString:", CFSTR("JCOP")))
          {
            v80 = objc_msgSend(objc_alloc((Class)v6[55]), "initWithDictionary:", v78);
            v81 = v80;
            if (v140)
            {
              objc_msgSend(v80, "addEntriesFromDictionary:", v140);
              v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "NF_stringForKey:", CFSTR("osUpdateInfo")));
              v83 = v82;
              if (v82)
              {
                v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "uppercaseString"));
                objc_msgSend(v81, "setObject:forKeyedSubscript:", v84, CFSTR("osUpdateInfo"));

              }
            }
            v85 = v75;
            v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v87 = NFLogGetLogger(v86);
            if (v87)
            {
              v88 = (void (*)(uint64_t, const char *, ...))v87;
              v89 = object_getClass(v73);
              v90 = class_isMetaClass(v89);
              v91 = object_getClassName(v73);
              v127 = sel_getName("nextRequestForServer:session:");
              v92 = 45;
              if (v90)
                v92 = 43;
              v88(6, "%c[%{public}s %{public}s]:%i Calling into SES to get PT key information", v92, v91, v127, 610);
            }
            v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v94 = NFSharedLogGetLogger(v93);
            v95 = objc_claimAutoreleasedReturnValue(v94);
            if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
            {
              v96 = object_getClass(v73);
              if (class_isMetaClass(v96))
                v97 = 43;
              else
                v97 = 45;
              v98 = object_getClassName(v143);
              v99 = sel_getName("nextRequestForServer:session:");
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)&buf[4] = v97;
              v73 = v143;
              *(_WORD *)v157 = 2082;
              *(_QWORD *)&v157[2] = v98;
              v158 = 2082;
              v159 = v99;
              v160 = 1024;
              v161 = 610;
              _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Calling into SES to get PT key information", buf, 0x22u);
            }

            v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("SEID")));
            v148 = 0;
            v101 = SESEndPointTSMDictionary(v138, v100, &v148);
            v102 = (void *)objc_claimAutoreleasedReturnValue(v101);
            v103 = v148;

            if (v103 || !v102)
            {
              v104 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v105 = NFLogGetLogger(v104);
              if (v105)
              {
                v106 = (void (*)(uint64_t, const char *, ...))v105;
                v107 = object_getClass(v73);
                v108 = class_isMetaClass(v107);
                v125 = object_getClassName(v73);
                v128 = sel_getName("nextRequestForServer:session:");
                v109 = 45;
                if (v108)
                  v109 = 43;
                v6 = &APSEnvironmentProduction_ptr;
                v106(3, "%c[%{public}s %{public}s]:%i Failed to get PT Key Info from SESD? %{public}@", v109, v125, v128, 614, v103);
              }
              v110 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v111 = NFSharedLogGetLogger(v110);
              v112 = objc_claimAutoreleasedReturnValue(v111);
              if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
              {
                v113 = object_getClass(v73);
                if (class_isMetaClass(v113))
                  v114 = 43;
                else
                  v114 = 45;
                v115 = object_getClassName(v143);
                v116 = sel_getName("nextRequestForServer:session:");
                *(_DWORD *)buf = 67110146;
                *(_DWORD *)&buf[4] = v114;
                v73 = v143;
                *(_WORD *)v157 = 2082;
                *(_QWORD *)&v157[2] = v115;
                v158 = 2082;
                v159 = v116;
                v160 = 1024;
                v161 = 614;
                v162 = 2114;
                v163 = (uint64_t)v103;
                _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get PT Key Info from SESD? %{public}@", buf, 0x2Cu);
              }

              v75 = v85;
            }
            else
            {
              objc_msgSend(v81, "addEntriesFromDictionary:", v102);
              v75 = v85;
            }
            -[NSMutableArray addObject:](v137, "addObject:", v81);

            v74 = v139;
            v76 = v136;
          }

          v77 = (char *)v77 + 1;
        }
        while (v74 != v77);
        v74 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v149, v164, 16);
      }
      while (v74);
    }

    objc_msgSend(v130, "setObject:forKey:", v137, CFSTR("SEStateInformation"));
    v117 = sub_100037CD0(v73);
    v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
    v119 = v118;
    if (v118)
    {
      v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "NF_asHexString"));
      objc_msgSend(v130, "setObject:forKey:", v120, CFSTR("APNTokenUpdateInfo"));

    }
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "initialClientRequestInfo"));
    v122 = objc_msgSend(v121, "count");

    v9 = v135;
    v7 = v132;
    v5 = v133;
    v11 = &APSEnvironmentProduction_ptr;
    if (v122)
    {
      v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "initialClientRequestInfo"));
      objc_msgSend(v130, "setObject:forKey:", v123, CFSTR("ClientRequestInfo"));

      v9 = v135;
      objc_msgSend(v135, "setInitialClientRequestInfo:", 0);
    }
    -[NSMutableDictionary addEntriesFromDictionary:](v132, "addEntriesFromDictionary:", v130);

    goto LABEL_7;
  }
  v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v52 = NFLogGetLogger(v51);
  if (v52)
  {
    v53 = (void (*)(uint64_t, const char *, ...))v52;
    v54 = object_getClass(v143);
    v55 = v9;
    v56 = class_isMetaClass(v54);
    v57 = object_getClassName(v143);
    v126 = sel_getName("nextRequestForServer:session:");
    v58 = !v56;
    v9 = v55;
    v59 = 45;
    if (!v58)
      v59 = 43;
    v53(3, "%c[%{public}s %{public}s]:%i Failed to get state info", v59, v57, v126, 581);
  }
  v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v61 = NFSharedLogGetLogger(v60);
  v62 = objc_claimAutoreleasedReturnValue(v61);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
  {
    v63 = object_getClass(v143);
    if (class_isMetaClass(v63))
      v64 = 43;
    else
      v64 = 45;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v64;
    *(_WORD *)v157 = 2082;
    *(_QWORD *)&v157[2] = object_getClassName(v143);
    v158 = 2082;
    v159 = sel_getName("nextRequestForServer:session:");
    v160 = 1024;
    v161 = 581;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get state info", buf, 0x22u);
  }

  v44 = 0;
LABEL_34:

LABEL_35:
  return v44;
}

id sub_10003956C(void *a1)
{
  _QWORD *v1;
  id v2;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v1[4]);
    objc_sync_exit(v1);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void sub_1000395C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000395D8(void *a1, void *a2)
{
  id *v3;
  id v4;

  v4 = a2;
  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    objc_msgSend(v3[4], "addObject:", v4);
    objc_sync_exit(v3);

    sub_100036604(v3);
  }

}

void sub_100039638(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003964C(void *a1, void *a2)
{
  id *v3;
  id v4;

  v4 = a2;
  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    objc_msgSend(v3[4], "removeObject:", v4);
    objc_sync_exit(v3);

    sub_100036604(v3);
  }

}

void sub_1000396AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000396C0(void *a1, void *a2)
{
  id v3;
  id *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v15;
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
  uint64_t v26;
  id v27;
  id obj;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];

  v3 = a2;
  v30 = v3;
  if (a1 && v3)
  {
    v4 = a1;
    objc_sync_enter(v4);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v4[4];
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v9 = objc_opt_class(NFRemoteAdminRedirectState);
          if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "taskId"));
            v11 = objc_msgSend(v30, "isEqualToString:", v10);

            if ((v11 & 1) != 0)
            {
              v27 = v8;
              goto LABEL_26;
            }
          }
          else
          {
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
            if (Logger)
            {
              Class = object_getClass(v4);
              if (class_isMetaClass(Class))
                v15 = 43;
              else
                v15 = 45;
              ClassName = object_getClassName(v4);
              Name = sel_getName("redirectStateForTaskID:");
              v18 = objc_opt_class(v8);
              Logger(4, "%c[%{public}s %{public}s]:%i Unexpected state object, %{public}@", v15, ClassName, Name, 714, v18);
            }
            v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v20 = NFSharedLogGetLogger(v19);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v22 = object_getClass(v4);
              if (class_isMetaClass(v22))
                v23 = 43;
              else
                v23 = 45;
              v24 = object_getClassName(v4);
              v25 = sel_getName("redirectStateForTaskID:");
              v26 = objc_opt_class(v8);
              *(_DWORD *)buf = 67110146;
              v36 = v23;
              v37 = 2082;
              v38 = v24;
              v39 = 2082;
              v40 = v25;
              v41 = 1024;
              v42 = 714;
              v43 = 2114;
              v44 = v26;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state object, %{public}@", buf, 0x2Cu);
            }

          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
      }
      while (v5);
    }
    v27 = 0;
LABEL_26:

    objc_sync_exit(v4);
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

void sub_1000399A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000399D8(void *a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v13;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", "redirectStateForIdentifier:", a1, CFSTR("NFRemoteAdminStorage.m"), 728, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("theIdentifier != nil"));

    }
    v5 = a1;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[4], "objectEnumerator"));
    v7 = 0;
    while (1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject"));

      if (!v8)
        break;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverIdentifier"));
      v10 = objc_msgSend(v9, "isEqualToString:", v4);

      v7 = v8;
      if (v10)
      {
        v11 = v8;
        break;
      }
    }

    objc_sync_exit(v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_100039AF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100039B6C(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  NSOperationQueue *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
  objc_msgSend(v3, "setTimeoutIntervalForRequest:", 30.0);
  objc_msgSend(v3, "setTimeoutIntervalForResource:", 120.0);
  objc_msgSend(v3, "setHTTPCookieAcceptPolicy:", 0);
  objc_msgSend(v3, "setHTTPShouldSetCookies:", 1);
  objc_msgSend(v3, "setAllowsCellularAccess:", 1);
  objc_msgSend(v3, "setRequestCachePolicy:", 1);
  objc_msgSend(v3, "setWaitsForConnectivity:", 0);
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = dispatch_queue_create("com.apple.seld.network", v5);

  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("NFRemoteAdminConnectionHTTP.m"), 78, CFSTR("networkCallbackQueue is nil"));

  }
  v7 = objc_opt_new(NSOperationQueue);
  -[NSOperationQueue setUnderlyingQueue:](v7, "setUnderlyingQueue:", v6);
  v8 = objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v3, *(_QWORD *)(a1 + 32), v7));
  v9 = (void *)qword_10005C3E0;
  qword_10005C3E0 = v8;

  objc_autoreleasePoolPop(v2);
}

void sub_100039FD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003AA70(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,SEL sel,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  uint64_t v45;
  id v47;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  objc_class *v54;
  int v55;
  const char *ClassName;
  const char *Name;
  uint64_t v58;

  if (a2 == 1)
  {
    v47 = objc_begin_catch(exc_buf);
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(a30);
      class_isMetaClass(Class);
      object_getClassName(a30);
      sel_getName(sel);
      Logger(3, "%c[%{public}s %{public}s]:%i JSON serialization failed: %{public}@");
    }
    v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v52 = NFSharedLogGetLogger(v51);
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v54 = object_getClass(a30);
      if (class_isMetaClass(v54))
        v55 = 43;
      else
        v55 = 45;
      ClassName = object_getClassName(a30);
      Name = sel_getName(sel);
      *(_DWORD *)(v45 - 224) = 67110146;
      *(_DWORD *)(v45 - 220) = v55;
      *(_WORD *)(v45 - 216) = 2082;
      v58 = v45 - 224;
      *(_QWORD *)(v58 + 10) = ClassName;
      *(_WORD *)(v45 - 206) = 2082;
      *(_QWORD *)(v58 + 20) = Name;
      *(_WORD *)(v45 - 196) = 1024;
      *(_DWORD *)(v58 + 30) = 277;
      *(_WORD *)(v45 - 190) = 2114;
      *(_QWORD *)(v58 + 36) = v47;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i JSON serialization failed: %{public}@", (uint8_t *)(v45 - 224), 0x2Cu);
    }

    objc_end_catch();
    JUMPOUT(0x10003A82CLL);
  }
  _Block_object_dispose((const void *)(v45 - 176), 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v45 - 256), 8);
  _Unwind_Resume(exc_buf);
}

uint64_t sub_10003AC74(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10003AC84(uint64_t a1)
{

}

void sub_10003AC8C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v13;
  const char *ClassName;
  const char *Name;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *i;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  objc_class *v46;
  int v47;
  const char *v48;
  const char *v49;
  void *v50;
  void *v51;
  void (*v52)(uint64_t, const char *, ...);
  objc_class *v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  objc_class *v62;
  int v63;
  const char *v64;
  const char *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  void (*v70)(uint64_t, const char *, ...);
  objc_class *v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  objc_class *v80;
  int v81;
  const char *v82;
  const char *v83;
  void *v84;
  void *v85;
  void *v86;
  void (*v87)(uint64_t, const char *, ...);
  objc_class *v88;
  uint64_t v89;
  const char *v90;
  const char *v91;
  void *v92;
  uint64_t v93;
  NSObject *v94;
  objc_class *v95;
  int v96;
  const char *v97;
  const char *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void (*v103)(uint64_t, const char *, ...);
  objc_class *v104;
  uint64_t v105;
  const char *v106;
  const char *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  NSObject *v111;
  objc_class *v112;
  int v113;
  const char *v114;
  const char *v115;
  void *v116;
  int v117;
  void *v118;
  void (*v119)(uint64_t, const char *, ...);
  objc_class *v120;
  uint64_t v121;
  const char *v122;
  const char *v123;
  void *v124;
  uint64_t v125;
  NSObject *v126;
  objc_class *v127;
  int v128;
  const char *v129;
  const char *v130;
  void *v131;
  void (*v132)(uint64_t, const char *, ...);
  objc_class *v133;
  uint64_t v134;
  const char *v135;
  const char *v136;
  void *v137;
  uint64_t v138;
  NSObject *v139;
  objc_class *v140;
  int v141;
  const char *v142;
  const char *v143;
  void *v144;
  void (*v145)(uint64_t, const char *, ...);
  objc_class *v146;
  uint64_t v147;
  const char *v148;
  const char *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  NSObject *v153;
  objc_class *v154;
  int v155;
  const char *v156;
  const char *v157;
  void *v158;
  id v159;
  void *v160;
  void *v161;
  id v162;
  uint64_t v163;
  void *v164;
  id v165;
  uint64_t v166;
  id v167;
  id v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  NSErrorUserInfoKey v173;
  const __CFString *v174;
  uint8_t buf[4];
  int v176;
  __int16 v177;
  const char *v178;
  __int16 v179;
  const char *v180;
  __int16 v181;
  int v182;
  __int16 v183;
  uint64_t v184;
  __int16 v185;
  void *v186;
  _BYTE v187[128];

  v165 = a2;
  v7 = a3;
  v167 = a4;
  v8 = v7;
  v166 = (uint64_t)objc_msgSend(v8, "statusCode");
  if (byte_10005C3E8)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(Class))
        v13 = 43;
      else
        v13 = 45;
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 88));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allHeaderFields"));
      v11(6, "%c[%{public}s %{public}s]:%i [TSM] Response Header: %@", v13, ClassName, Name, 315, v16);

    }
    v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = NFSharedLogGetLogger(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      v22 = object_getClassName(*(id *)(a1 + 32));
      v23 = sel_getName(*(SEL *)(a1 + 88));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allHeaderFields"));
      *(_DWORD *)buf = 67110146;
      v176 = v21;
      v177 = 2082;
      v178 = v22;
      v179 = 2082;
      v180 = v23;
      v181 = 1024;
      v182 = 315;
      v183 = 2112;
      v184 = (uint64_t)v24;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Response Header: %@", buf, 0x2Cu);

    }
  }
  v171 = 0u;
  v172 = 0u;
  v169 = 0u;
  v170 = 0u;
  v25 = objc_msgSend(&off_1000574B0, "countByEnumeratingWithState:objects:count:", &v169, v187, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v170;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v170 != v26)
          objc_enumerationMutation(&off_1000574B0);
        v28 = *(_QWORD *)(*((_QWORD *)&v169 + 1) + 8 * (_QWORD)i);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allHeaderFields"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "valueForKey:", v28));

        v31 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0 && objc_msgSend(v30, "length"))
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v30, v28);

      }
      v25 = objc_msgSend(&off_1000574B0, "countByEnumeratingWithState:objects:count:", &v169, v187, 16);
    }
    while (v25);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = mach_continuous_time();
  v32 = *(uint64_t **)(a1 + 96);
  if (v32)
    *v32 = v166;
  v33 = objc_msgSend(v167, "copy");
  v34 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v35 = *(void **)(v34 + 40);
  *(_QWORD *)(v34 + 40) = v33;

  if (v167)
  {
    if (byte_10005C3E8)
    {
      v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v36);
      if (v37)
      {
        v38 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v38))
          v39 = 43;
        else
          v39 = 45;
        v40 = object_getClassName(*(id *)(a1 + 32));
        v41 = sel_getName(*(SEL *)(a1 + 88));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                           + 40), "description"));
        v37(6, "%c[%{public}s %{public}s]:%i [TSM] URL: %@", v39, v40, v41, 336, v42);

      }
      v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v44 = NFSharedLogGetLogger(v43);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v46))
          v47 = 43;
        else
          v47 = 45;
        v48 = object_getClassName(*(id *)(a1 + 32));
        v49 = sel_getName(*(SEL *)(a1 + 88));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                           + 40), "description"));
        *(_DWORD *)buf = 67110146;
        v176 = v47;
        v177 = 2082;
        v178 = v48;
        v179 = 2082;
        v180 = v49;
        v181 = 1024;
        v182 = 336;
        v183 = 2112;
        v184 = (uint64_t)v50;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] URL: %@", buf, 0x2Cu);

      }
    }
    v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v52 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v51);
    if (v52)
    {
      v53 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v53))
        v54 = 43;
      else
        v54 = 45;
      v55 = object_getClassName(*(id *)(a1 + 32));
      v56 = sel_getName(*(SEL *)(a1 + 88));
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v167, "code")));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "localizedDescription"));
      v52(3, "%c[%{public}s %{public}s]:%i Client error: %{public}@ - %{public}@", v54, v55, v56, 337, v57, v58);

    }
    v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v60 = NFSharedLogGetLogger(v59);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      v62 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v62))
        v63 = 43;
      else
        v63 = 45;
      v64 = object_getClassName(*(id *)(a1 + 32));
      v65 = sel_getName(*(SEL *)(a1 + 88));
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v167, "code")));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "localizedDescription"));
      *(_DWORD *)buf = 67110402;
      v176 = v63;
      v177 = 2082;
      v178 = v64;
      v179 = 2082;
      v180 = v65;
      v181 = 1024;
      v182 = 337;
      v183 = 2114;
      v184 = (uint64_t)v66;
      v185 = 2114;
      v186 = v67;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Client error: %{public}@ - %{public}@", buf, 0x36u);

    }
    if (objc_msgSend(v167, "code") == (id)-1009)
      v68 = 25;
    else
      v68 = 17;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v68;
    goto LABEL_125;
  }
  if (byte_10005C3E8)
  {
    v69 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v70 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v69);
    if (v70)
    {
      v71 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v71))
        v72 = 43;
      else
        v72 = 45;
      v73 = object_getClassName(*(id *)(a1 + 32));
      v74 = sel_getName(*(SEL *)(a1 + 88));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "description"));
      v70(6, "%c[%{public}s %{public}s]:%i [TSM] URL: %@", v72, v73, v74, 349, v76);

    }
    v77 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v78 = NFSharedLogGetLogger(v77);
    v79 = objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      v80 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v80))
        v81 = 43;
      else
        v81 = 45;
      v82 = object_getClassName(*(id *)(a1 + 32));
      v83 = sel_getName(*(SEL *)(a1 + 88));
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "description"));
      *(_DWORD *)buf = 67110146;
      v176 = v81;
      v177 = 2082;
      v178 = v82;
      v179 = 2082;
      v180 = v83;
      v181 = 1024;
      v182 = 349;
      v183 = 2112;
      v184 = (uint64_t)v85;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] URL: %@", buf, 0x2Cu);

    }
  }
  if (byte_10005C3E8)
  {
    v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v87 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v86);
    if (v87)
    {
      v88 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v88))
        v89 = 43;
      else
        v89 = 45;
      v90 = object_getClassName(*(id *)(a1 + 32));
      v91 = sel_getName(*(SEL *)(a1 + 88));
      v87(6, "%c[%{public}s %{public}s]:%i [TSM] Server response HTTP status: %ld", v89, v90, v91, 350, v166);
    }
    v92 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v93 = NFSharedLogGetLogger(v92);
    v94 = objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
    {
      v95 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v95))
        v96 = 43;
      else
        v96 = 45;
      v97 = object_getClassName(*(id *)(a1 + 32));
      v98 = sel_getName(*(SEL *)(a1 + 88));
      *(_DWORD *)buf = 67110146;
      v176 = v96;
      v177 = 2082;
      v178 = v97;
      v179 = 2082;
      v180 = v98;
      v181 = 1024;
      v182 = 350;
      v183 = 2048;
      v184 = v166;
      _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Server response HTTP status: %ld", buf, 0x2Cu);
    }

  }
  if (v166 != 200)
  {
    v102 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v103 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v102);
    if (v103)
    {
      v104 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v104))
        v105 = 43;
      else
        v105 = 45;
      v106 = object_getClassName(*(id *)(a1 + 32));
      v107 = sel_getName(*(SEL *)(a1 + 88));
      v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v166));
      v103(6, "%c[%{public}s %{public}s]:%i HTTP status: %{public}@", v105, v106, v107, 354, v108);

    }
    v109 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v110 = NFSharedLogGetLogger(v109);
    v111 = objc_claimAutoreleasedReturnValue(v110);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      v112 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v112))
        v113 = 43;
      else
        v113 = 45;
      v114 = object_getClassName(*(id *)(a1 + 32));
      v115 = sel_getName(*(SEL *)(a1 + 88));
      v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v166));
      *(_DWORD *)buf = 67110146;
      v176 = v113;
      v177 = 2082;
      v178 = v114;
      v179 = 2082;
      v180 = v115;
      v181 = 1024;
      v182 = 354;
      v183 = 2114;
      v184 = (uint64_t)v116;
      _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i HTTP status: %{public}@", buf, 0x2Cu);

    }
    if (v166 <= 411)
    {
      v117 = 0;
      if (v166 == 204 || v166 == 404)
        goto LABEL_124;
    }
    else
    {
      switch(v166)
      {
        case 503:
          v117 = 19;
          goto LABEL_124;
        case 500:
          v117 = 20;
          goto LABEL_124;
        case 412:
          v117 = 3;
LABEL_124:
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v117;
LABEL_125:
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 24));
          goto LABEL_126;
      }
    }
    v117 = 18;
    goto LABEL_124;
  }
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "MIMEType"));
  if ((objc_msgSend(v99, "isEqualToString:", CFSTR("application/json")) & 1) != 0)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    if (objc_msgSend(v165, "length"))
    {
      v168 = 0;
      v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v165, 0, &v168));
      v101 = v168;
      if (v100)
      {
        objc_msgSend(*(id *)(a1 + 48), "addEntriesFromDictionary:", v100);
      }
      else
      {
        v144 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v145 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v144);
        if (v145)
        {
          v146 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v146))
            v147 = 43;
          else
            v147 = 45;
          v148 = object_getClassName(*(id *)(a1 + 32));
          v149 = sel_getName(*(SEL *)(a1 + 88));
          v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "description"));
          v145(3, "%c[%{public}s %{public}s]:%i JSON parsing error: %{public}@", v147, v148, v149, 401, v150);

        }
        v151 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v152 = NFSharedLogGetLogger(v151);
        v153 = objc_claimAutoreleasedReturnValue(v152);
        if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
        {
          v154 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v154))
            v155 = 43;
          else
            v155 = 45;
          v156 = object_getClassName(*(id *)(a1 + 32));
          v157 = sel_getName(*(SEL *)(a1 + 88));
          v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "description"));
          *(_DWORD *)buf = 67110146;
          v176 = v155;
          v177 = 2082;
          v178 = v156;
          v179 = 2082;
          v180 = v157;
          v181 = 1024;
          v182 = 401;
          v183 = 2114;
          v184 = (uint64_t)v158;
          _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i JSON parsing error: %{public}@", buf, 0x2Cu);

        }
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 23;
        v159 = objc_alloc((Class)NSError);
        v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
        v173 = NSLocalizedDescriptionKey;
        v174 = CFSTR("Decoding Error");
        v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v174, &v173, 1));
        v162 = objc_msgSend(v159, "initWithDomain:code:userInfo:", v160, 23, v161);
        v163 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v164 = *(void **)(v163 + 40);
        *(_QWORD *)(v163 + 40) = v162;

      }
    }
    else if (byte_10005C3E8)
    {
      v131 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v132 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v131);
      if (v132)
      {
        v133 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v133))
          v134 = 43;
        else
          v134 = 45;
        v135 = object_getClassName(*(id *)(a1 + 32));
        v136 = sel_getName(*(SEL *)(a1 + 88));
        v132(6, "%c[%{public}s %{public}s]:%i [TSM] Received 0 bytes, empty body.", v134, v135, v136, 417);
      }
      v137 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v138 = NFSharedLogGetLogger(v137);
      v139 = objc_claimAutoreleasedReturnValue(v138);
      if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
      {
        v140 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v140))
          v141 = 43;
        else
          v141 = 45;
        v142 = object_getClassName(*(id *)(a1 + 32));
        v143 = sel_getName(*(SEL *)(a1 + 88));
        *(_DWORD *)buf = 67109890;
        v176 = v141;
        v177 = 2082;
        v178 = v142;
        v179 = 2082;
        v180 = v143;
        v181 = 1024;
        v182 = 417;
        _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Received 0 bytes, empty body.", buf, 0x22u);
      }

    }
  }
  else
  {
    v118 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v119 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v118);
    if (v119)
    {
      v120 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v120))
        v121 = 43;
      else
        v121 = 45;
      v122 = object_getClassName(*(id *)(a1 + 32));
      v123 = sel_getName(*(SEL *)(a1 + 88));
      v119(3, "%c[%{public}s %{public}s]:%i Unexpected content type: %{public}@", v121, v122, v123, 387, v99);
    }
    v124 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v125 = NFSharedLogGetLogger(v124);
    v126 = objc_claimAutoreleasedReturnValue(v125);
    if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
    {
      v127 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v127))
        v128 = 43;
      else
        v128 = 45;
      v129 = object_getClassName(*(id *)(a1 + 32));
      v130 = sel_getName(*(SEL *)(a1 + 88));
      *(_DWORD *)buf = 67110146;
      v176 = v128;
      v177 = 2082;
      v178 = v129;
      v179 = 2082;
      v180 = v130;
      v181 = 1024;
      v182 = 387;
      v183 = 2114;
      v184 = (uint64_t)v99;
      _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected content type: %{public}@", buf, 0x2Cu);
    }

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 18;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 24));

LABEL_126:
}

void sub_10003BD38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,NSErrorUserInfoKey a27,const __CFString *a28,uint64_t a29,uint64_t a30,int buf,int a32,__int128 a33,int a34,int a35,__int128 a36)
{
  uint64_t v36;
  id v37;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  int v45;
  const char *ClassName;
  const char *Name;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;

  if (a2 == 1)
  {
    v37 = objc_begin_catch(exception_object);
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(*(id *)(v36 + 32));
      class_isMetaClass(Class);
      object_getClassName(*(id *)(v36 + 32));
      sel_getName(*(SEL *)(v36 + 88));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "description"));
      Logger(3, "%c[%{public}s %{public}s]:%i JSON parsing error: %{public}@");

    }
    v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v42 = NFSharedLogGetLogger(v41);
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = object_getClass(*(id *)(v36 + 32));
      if (class_isMetaClass(v44))
        v45 = 43;
      else
        v45 = 45;
      ClassName = object_getClassName(*(id *)(v36 + 32));
      Name = sel_getName(*(SEL *)(v36 + 88));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "description"));
      buf = 67110146;
      a32 = v45;
      LOWORD(a33) = 2082;
      *(_QWORD *)((char *)&a33 + 2) = ClassName;
      WORD5(a33) = 2082;
      *(_QWORD *)((char *)&a33 + 12) = Name;
      LOWORD(a35) = 1024;
      *(int *)((char *)&a35 + 2) = 410;
      WORD1(a36) = 2114;
      *(_QWORD *)((char *)&a36 + 4) = v48;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i JSON parsing error: %{public}@", (uint8_t *)&buf, 0x2Cu);

    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v36 + 80) + 8) + 24) = 23;
    v49 = objc_alloc((Class)NSError);
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
    a27 = NSLocalizedDescriptionKey;
    a28 = CFSTR("Decoding Error");
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &a28, &a27, 1));
    v52 = objc_msgSend(v49, "initWithDomain:code:userInfo:", v50, 23, v51);
    v53 = *(_QWORD *)(*(_QWORD *)(v36 + 64) + 8);
    v54 = *(void **)(v53 + 40);
    *(_QWORD *)(v53 + 40) = v52;

    objc_end_catch();
    JUMPOUT(0x10003BD20);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10003BF9C(uint64_t a1, int a2, char a3, CFErrorRef err)
{
  CFStringRef v7;
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
  const char *v19;
  const char *v20;
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
  const char *v33;
  const char *v34;
  void *v35;
  _BOOL4 v36;
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
  void *v51;
  uint64_t v52;
  void (*v53)(uint64_t, const char *, ...);
  objc_class *v54;
  _BOOL4 v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  objc_class *v61;
  int v62;
  const char *v63;
  const char *v64;
  const char *v65;
  void *v66;
  uint64_t v67;
  void (*v68)(uint64_t, const char *, ...);
  objc_class *v69;
  _BOOL4 v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  objc_class *v75;
  int v76;
  const char *v77;
  const char *v78;
  const char *ClassName;
  const char *Name;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  uint8_t buf[4];
  int v87;
  __int16 v88;
  const char *v89;
  __int16 v90;
  const char *v91;
  __int16 v92;
  int v93;
  __int16 v94;
  CFErrorRef v95;

  if (err)
  {
    v7 = CFErrorCopyDescription(err);
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i Not trusted, error=%{public}@", v13, ClassName, Name, 503, err);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      v19 = object_getClassName(*(id *)(a1 + 32));
      v20 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v87 = v18;
      v88 = 2082;
      v89 = v19;
      v90 = 2082;
      v91 = v20;
      v92 = 1024;
      v93 = 503;
      v94 = 2114;
      v95 = err;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Not trusted, error=%{public}@", buf, 0x2Cu);
    }

    CFRelease(v7);
  }
  if ((a3 & 1) == 0)
  {
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v22 = NFLogGetLogger(v21);
    if (v22)
    {
      v23 = (void (*)(uint64_t, const char *, ...))v22;
      v24 = object_getClass(*(id *)(a1 + 32));
      v25 = class_isMetaClass(v24);
      v26 = object_getClassName(*(id *)(a1 + 32));
      v82 = sel_getName(*(SEL *)(a1 + 48));
      v27 = 45;
      if (v25)
        v27 = 43;
      v23(3, "%c[%{public}s %{public}s]:%i Not trusted", v27, v26, v82, 519);
    }
    v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v29 = NFSharedLogGetLogger(v28);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v31))
        v32 = 43;
      else
        v32 = 45;
      v33 = object_getClassName(*(id *)(a1 + 32));
      v34 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v87 = v32;
      v88 = 2082;
      v89 = v33;
      v90 = 2082;
      v91 = v34;
      v92 = 1024;
      v93 = 519;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Not trusted", buf, 0x22u);
    }

    v35 = *(void **)(a1 + 32);
    if (v35
      && os_variant_has_internal_content("com.apple.nfc")
      && (v36 = CFPreferencesGetAppBooleanValue(CFSTR("PKBypassCertValidation"), kCFPreferencesAnyApplication, 0) != 0,
          CFPreferencesGetAppBooleanValue(CFSTR("PKBypassEVCertValidation"), kCFPreferencesAnyApplication, 0) | v36))
    {
      v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v38 = NFLogGetLogger(v37);
      if (v38)
      {
        v39 = (void (*)(uint64_t, const char *, ...))v38;
        v40 = object_getClass(v35);
        v41 = class_isMetaClass(v40);
        v42 = object_getClassName(v35);
        v83 = sel_getName("_canBypassTrustExtendedValidation");
        v43 = 45;
        if (v41)
          v43 = 43;
        v39(6, "%c[%{public}s %{public}s]:%i Allowing bypass of extended trust validation by preference on internal build", v43, v42, v83, 485);
      }
      v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v45 = NFSharedLogGetLogger(v44);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = object_getClass(v35);
        if (class_isMetaClass(v47))
          v48 = 43;
        else
          v48 = 45;
        v49 = object_getClassName(v35);
        v50 = sel_getName("_canBypassTrustExtendedValidation");
        *(_DWORD *)buf = 67109890;
        v87 = v48;
        v88 = 2082;
        v89 = v49;
        v90 = 2082;
        v91 = v50;
        v92 = 1024;
        v93 = 485;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Allowing bypass of extended trust validation by preference on internal build", buf, 0x22u);
      }

      v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v52 = NFLogGetLogger(v51);
      if (v52)
      {
        v53 = (void (*)(uint64_t, const char *, ...))v52;
        v54 = object_getClass(*(id *)(a1 + 32));
        v55 = class_isMetaClass(v54);
        v56 = object_getClassName(*(id *)(a1 + 32));
        v84 = sel_getName(*(SEL *)(a1 + 48));
        v57 = 45;
        if (v55)
          v57 = 43;
        v53(6, "%c[%{public}s %{public}s]:%i Internal trust bypass", v57, v56, v84, 523);
      }
      v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v59 = NFSharedLogGetLogger(v58);
      v60 = objc_claimAutoreleasedReturnValue(v59);
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        goto LABEL_54;
      v61 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v61))
        v62 = 43;
      else
        v62 = 45;
      v63 = object_getClassName(*(id *)(a1 + 32));
      v64 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v87 = v62;
      v88 = 2082;
      v89 = v63;
      v90 = 2082;
      v91 = v64;
      v92 = 1024;
      v93 = 523;
      v65 = "%c[%{public}s %{public}s]:%i Internal trust bypass";
    }
    else
    {
      if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49))
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v67 = NFLogGetLogger(v66);
      if (v67)
      {
        v68 = (void (*)(uint64_t, const char *, ...))v67;
        v69 = object_getClass(*(id *)(a1 + 32));
        v70 = class_isMetaClass(v69);
        v71 = object_getClassName(*(id *)(a1 + 32));
        v85 = sel_getName(*(SEL *)(a1 + 48));
        v72 = 45;
        if (v70)
          v72 = 43;
        v68(6, "%c[%{public}s %{public}s]:%i Override EV trust validation", v72, v71, v85, 530);
      }
      v73 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v74 = NFSharedLogGetLogger(v73);
      v60 = objc_claimAutoreleasedReturnValue(v74);
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        goto LABEL_54;
      v75 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v75))
        v76 = 43;
      else
        v76 = 45;
      v77 = object_getClassName(*(id *)(a1 + 32));
      v78 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v87 = v76;
      v88 = 2082;
      v89 = v77;
      v90 = 2082;
      v91 = v78;
      v92 = 1024;
      v93 = 530;
      v65 = "%c[%{public}s %{public}s]:%i Override EV trust validation";
    }
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, v65, buf, 0x22u);
LABEL_54:

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_10003CAB4(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", objc_msgSend(*(id *)(a1 + 32), "serverTrust")));
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), 2, 0);
  }
}

id objc_msgSend_APNConnectionRequesterFirst(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "APNConnectionRequesterFirst");
}

id objc_msgSend_APNConnectionRequesterLatest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "APNConnectionRequesterLatest");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_MIMEType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MIMEType");
}

id objc_msgSend_NF_arrayForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NF_arrayForKey:");
}

id objc_msgSend_NF_asHexString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NF_asHexString");
}

id objc_msgSend_NF_dataWithHexString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NF_dataWithHexString:");
}

id objc_msgSend_NF_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NF_dictionaryForKey:");
}

id objc_msgSend_NF_numberForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NF_numberForKey:");
}

id objc_msgSend_NF_objectForKey_expectedClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NF_objectForKey:expectedClass:");
}

id objc_msgSend_NF_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NF_stringForKey:");
}

id objc_msgSend_NF_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NF_userInfo");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__checkForCathayIngestion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkForCathayIngestion");
}

id objc_msgSend__checkForMercuryIngestion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkForMercuryIngestion");
}

id objc_msgSend__closeSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_closeSession");
}

id objc_msgSend__deactiveAllAppletsOnSE_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deactiveAllAppletsOnSE:");
}

id objc_msgSend__doFinalTSMCheckIn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_doFinalTSMCheckIn");
}

id objc_msgSend__doInitialRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_doInitialRequest");
}

id objc_msgSend__doReaderModeRedirect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_doReaderModeRedirect");
}

id objc_msgSend__executePreCheckScripts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_executePreCheckScripts:");
}

id objc_msgSend__extractAidsFromStringArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extractAidsFromStringArray:");
}

id objc_msgSend__fireCardIngestionStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fireCardIngestionStatus:");
}

id objc_msgSend__gatherCardStateInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_gatherCardStateInfo");
}

id objc_msgSend__generateRandomNumber_endingWith_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generateRandomNumber:endingWith:");
}

id objc_msgSend__getRequireServiceV1List(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getRequireServiceV1List");
}

id objc_msgSend__getSessionSystemCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getSessionSystemCode");
}

id objc_msgSend__openSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openSession");
}

id objc_msgSend__openSessionWithTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openSessionWithTimeout:");
}

id objc_msgSend__performReaderModeRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performReaderModeRequest");
}

id objc_msgSend__postProcessNotification_executionStatus_regionIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_postProcessNotification:executionStatus:regionIdentifier:");
}

id objc_msgSend__preValidateCardForCathay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preValidateCardForCathay");
}

id objc_msgSend__preValidateCardForMercury(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preValidateCardForMercury");
}

id objc_msgSend__preprocessNotification_withTaskID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preprocessNotification:withTaskID:");
}

id objc_msgSend__redirectResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_redirectResult");
}

id objc_msgSend__restoreRFSettingForCathayIngestion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restoreRFSettingForCathayIngestion");
}

id objc_msgSend__restoreRFSettingForMercuryIngestion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restoreRFSettingForMercuryIngestion");
}

id objc_msgSend__setEnabledTopics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEnabledTopics:");
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setFileNameLocalizationEnabled:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__validateCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateCard");
}

id objc_msgSend__validateCardForFelica(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateCardForFelica");
}

id objc_msgSend__validateCardForMercury_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateCardForMercury:");
}

id objc_msgSend__validateCardForMiFare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateCardForMiFare:");
}

id objc_msgSend_abort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "abort:");
}

id objc_msgSend_aborted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aborted");
}

id objc_msgSend_abortedReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "abortedReason");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allHeaderFields");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allSystemCodes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allSystemCodes");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allowSleep(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowSleep");
}

id objc_msgSend_appletMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appletMap");
}

id objc_msgSend_appletStateChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appletStateChange:");
}

id objc_msgSend_appletWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appletWithIdentifier:");
}

id objc_msgSend_appletsDeleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appletsDeleted:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_areSessionsAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "areSessionsAllowed");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_asDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asDictionary");
}

id objc_msgSend_atqa(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atqa");
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationMethod");
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "available");
}

id objc_msgSend_batchId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batchId");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callStackSymbols");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelTaskRequestWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelTaskRequestWithIdentifier:error:");
}

id objc_msgSend_cardServiceInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cardServiceInfo");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_clearRetryInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearRetryInterval");
}

id objc_msgSend_clientName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientName");
}

id objc_msgSend_closeConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeConnection");
}

id objc_msgSend_closeSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeSession");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_coder_decodeArrayOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coder:decodeArrayOfClass:forKey:");
}

id objc_msgSend_coder_decodeDictOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coder:decodeDictOfClass:forKey:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_configureReaderModeRFForTransitPartner_transitPartner_callback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureReaderModeRFForTransitPartner:transitPartner:callback:");
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connect");
}

id objc_msgSend_connectTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectTag:");
}

id objc_msgSend_connectTagWithTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectTagWithTimeout:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_credentialForTrust_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "credentialForTrust:");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_dataForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataForKey:");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_delegateQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegateQueue");
}

id objc_msgSend_deleteAllApplets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAllApplets:");
}

id objc_msgSend_deleteAllApplets_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAllApplets:error:");
}

id objc_msgSend_deleteAllAppletsOfType_queueConnection_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAllAppletsOfType:queueConnection:error:");
}

id objc_msgSend_deleteApplets_queueServerConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteApplets:queueServerConnection:");
}

id objc_msgSend_deleteFidoKeyFor_usingSession_withSessionSEID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteFidoKeyFor:usingSession:withSessionSEID:error:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didExitRestrictedMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didExitRestrictedMode:");
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnect");
}

id objc_msgSend_disconnectTag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnectTag");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_dumpState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpState");
}

id objc_msgSend_embeddedSecureElementWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "embeddedSecureElementWithError:");
}

id objc_msgSend_enabledTopics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enabledTopics");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endSession");
}

id objc_msgSend_endSessionWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endSessionWithCompletion:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ephemeralSessionConfiguration");
}

id objc_msgSend_executeHttpRequest_httpHeader_response_responseHeader_duration_sessionError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeHttpRequest:httpHeader:response:responseHeader:duration:sessionError:");
}

id objc_msgSend_executeScript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeScript:");
}

id objc_msgSend_felicaRequestService_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "felicaRequestService:error:");
}

id objc_msgSend_felicaRequestService_forSystemCode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "felicaRequestService:forSystemCode:error:");
}

id objc_msgSend_felicaStateForSystemCode_withRequestService_withBlockReadList_performSearchServiceCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "felicaStateForSystemCode:withRequestService:withBlockReadList:performSearchServiceCode:");
}

id objc_msgSend_flushWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flushWithCompletionHandler:");
}

id objc_msgSend_forwardDataToSP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forwardDataToSP");
}

id objc_msgSend_generateUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateUUID");
}

id objc_msgSend_getHwSupport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHwSupport");
}

id objc_msgSend_getNextRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNextRequest");
}

id objc_msgSend_getTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTimestamp");
}

id objc_msgSend_handleAppletStateChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleAppletStateChange:");
}

id objc_msgSend_handleAppletsDeleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleAppletsDeleted:");
}

id objc_msgSend_handleCardIngestionStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleCardIngestionStatus:");
}

id objc_msgSend_handleCardSessionToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleCardSessionToken:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_historicalBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "historicalBytes");
}

id objc_msgSend_holdPowerAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "holdPowerAssertion:");
}

id objc_msgSend_httpHeaderInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "httpHeaderInfo");
}

id objc_msgSend_httpStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "httpStatus");
}

id objc_msgSend_incrementLongRetry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incrementLongRetry");
}

id objc_msgSend_incrementStep(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incrementStep");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "info");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoDictionary");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithCallback_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCallback:queue:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionary_sourceURL_originator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:sourceURL:originator:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEnvironmentName:namedDelegatePort:queue:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_sourceURL_retryDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:sourceURL:retryDate:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithState_oneTimeConnection_secureElementManagerSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithState:oneTimeConnection:secureElementManagerSession:");
}

id objc_msgSend_initWithStreamName_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStreamName:queue:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithURL_SEID_showProprietaryHeaders_disableEVTrustValidation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:SEID:showProprietaryHeaders:disableEVTrustValidation:");
}

id objc_msgSend_initialClientRequestInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialClientRequestInfo");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interface");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isComplete");
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConnected");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isProductionSigned(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isProductionSigned");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lock");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_maxDetectionTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxDetectionTimeout");
}

id objc_msgSend_maxNetworkResponseTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxNetworkResponseTime");
}

id objc_msgSend_migrationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrationState");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newlineCharacterSet");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openConnection:");
}

id objc_msgSend_openSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSession");
}

id objc_msgSend_outFailureResponseDetected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outFailureResponseDetected");
}

id objc_msgSend_outFinalSWStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outFinalSWStatus");
}

id objc_msgSend_outIncompleteExecution(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outIncompleteExecution");
}

id objc_msgSend_outTotalAPDUExecutionDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outTotalAPDUExecutionDuration");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameters");
}

id objc_msgSend_pendingImmediateRetry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingImmediateRetry");
}

id objc_msgSend_performCheckIn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performCheckIn");
}

id objc_msgSend_performRedirect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performRedirect");
}

id objc_msgSend_performRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performRequest");
}

id objc_msgSend_performRequest_body_header_response_responseHeader_httpStatus_duration_sessionError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performRequest:body:header:response:responseHeader:httpStatus:duration:sessionError:");
}

id objc_msgSend_performanceMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performanceMetrics");
}

id objc_msgSend_postAnalyticsReaderModeCardIngestionSession_prepOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postAnalyticsReaderModeCardIngestionSession:prepOnly:");
}

id objc_msgSend_postAnalyticsTSMConnectivityException_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postAnalyticsTSMConnectivityException:");
}

id objc_msgSend_processAppletChanged_regionIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processAppletChanged:regionIdentifier:");
}

id objc_msgSend_processAppletsDeleted_regionIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processAppletsDeleted:regionIdentifier:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processNotification:");
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protectionSpace");
}

id objc_msgSend_publicToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publicToken");
}

id objc_msgSend_rangeOfCharacterFromSet_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:");
}

id objc_msgSend_readerModeCardIngestionStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readerModeCardIngestionStatus:");
}

id objc_msgSend_readerModeCardSessionToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readerModeCardSessionToken:");
}

id objc_msgSend_reconnectTag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reconnectTag");
}

id objc_msgSend_redirectResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "redirectResponse");
}

id objc_msgSend_redirectState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "redirectState");
}

id objc_msgSend_redirectStepError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "redirectStepError");
}

id objc_msgSend_redirectUrl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "redirectUrl");
}

id objc_msgSend_refreshRetryInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshRetryInterval");
}

id objc_msgSend_refreshSecureElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshSecureElement:");
}

id objc_msgSend_refreshSecureElementsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshSecureElementsWithError:");
}

id objc_msgSend_registerEventListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerEventListener:");
}

id objc_msgSend_registerForEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForEvents");
}

id objc_msgSend_registerForTaskWithIdentifier_usingQueue_launchHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForTaskWithIdentifier:usingQueue:launchHandler:");
}

id objc_msgSend_releasePowerAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releasePowerAssertion:");
}

id objc_msgSend_remoteAdminAccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteAdminAccess");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_requestInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestInfo");
}

id objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithURL:cachePolicy:timeoutInterval:");
}

id objc_msgSend_restrictedMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictedMode");
}

id objc_msgSend_restrictedPerformanceMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictedPerformanceMode");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_retryInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retryInterval");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_runScript_parameters_outputResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runScript:parameters:outputResults:");
}

id objc_msgSend_runScript_parameters_results_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runScript:parameters:results:");
}

id objc_msgSend_sak(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sak");
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "save");
}

id objc_msgSend_seid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seid");
}

id objc_msgSend_sendXpcNotificationEventWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendXpcNotificationEventWithDictionary:");
}

id objc_msgSend_sequenceCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sequenceCounter");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_serverIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverIdentifier");
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverTrust");
}

id objc_msgSend_sessionCardServiceInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionCardServiceInfo");
}

id objc_msgSend_sessionToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionToken");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_setAIDAllowList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAIDAllowList:");
}

id objc_msgSend_setAPNConnectionRequesterFirst_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAPNConnectionRequesterFirst:");
}

id objc_msgSend_setAPNConnectionRequesterLatest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAPNConnectionRequesterLatest:");
}

id objc_msgSend_setAllHTTPHeaderFields_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllHTTPHeaderFields:");
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setBatchId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBatchId:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setCheckAIDAllowList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCheckAIDAllowList:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDeactivateAllApps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeactivateAllApps:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEnableDebug_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableDebug:");
}

id objc_msgSend_setExpirationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExpirationHandler:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setForwardDataToSMP_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForwardDataToSMP:");
}

id objc_msgSend_setForwardDataToSP_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForwardDataToSP:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPCookieAcceptPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPCookieAcceptPolicy:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHTTPShouldSetCookies_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPShouldSetCookies:");
}

id objc_msgSend_setHttpHeaderInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHttpHeaderInfo:");
}

id objc_msgSend_setHttpStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHttpStatus:");
}

id objc_msgSend_setIncludeAPDUDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncludeAPDUDuration:");
}

id objc_msgSend_setIncompleteReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncompleteReason:");
}

id objc_msgSend_setInitialClientRequestInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialClientRequestInfo:");
}

id objc_msgSend_setInitialSelectBeforeRun_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialSelectBeforeRun:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterface:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setMaxNetworkResponseTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxNetworkResponseTime:");
}

id objc_msgSend_setNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotification:");
}

id objc_msgSend_setNsUrlSessionError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNsUrlSessionError:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setParameters:");
}

id objc_msgSend_setPendingImmediateRetry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingImmediateRetry:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setRedirectStepError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRedirectStepError:");
}

id objc_msgSend_setRedirectUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRedirectUrl:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRequestCachePolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestCachePolicy:");
}

id objc_msgSend_setRequestInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestInfo:");
}

id objc_msgSend_setRequiresExternalPower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequiresExternalPower:");
}

id objc_msgSend_setRequiresNetworkConnectivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequiresNetworkConnectivity:");
}

id objc_msgSend_setRequiresProtectionClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequiresProtectionClass:");
}

id objc_msgSend_setScheduleAfter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScheduleAfter:");
}

id objc_msgSend_setSeid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeid:");
}

id objc_msgSend_setSourceUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceUrl:");
}

id objc_msgSend_setSpStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpStatusCode:");
}

id objc_msgSend_setStateUpdateOnSessionEndedCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateUpdateOnSessionEndedCallback:");
}

id objc_msgSend_setStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStep:");
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskCompleted");
}

id objc_msgSend_setTaskId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskId:");
}

id objc_msgSend_setTimeoutIntervalForRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutIntervalForRequest:");
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutIntervalForResource:");
}

id objc_msgSend_setToSystemOS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setToSystemOS:");
}

id objc_msgSend_setTotalAPDUTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotalAPDUTime:");
}

id objc_msgSend_setTotalNetworkResponseTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotalNetworkResponseTime:");
}

id objc_msgSend_setTotalResponsesWithBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotalResponsesWithBody:");
}

id objc_msgSend_setTotalSessionTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotalSessionTime:");
}

id objc_msgSend_setTransferWithMaxResponseTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransferWithMaxResponseTime:");
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnderlyingQueue:");
}

id objc_msgSend_setUnsentScriptResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnsentScriptResponse:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setWaitsForConnectivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWaitsForConnectivity:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedCALogger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedCALogger");
}

id objc_msgSend_sharedHardwareManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedHardwareManager");
}

id objc_msgSend_sharedHardwareManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedHardwareManager:");
}

id objc_msgSend_sharedPowerAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPowerAssertion");
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedScheduler");
}

id objc_msgSend_skipMifareClassification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipMifareClassification");
}

id objc_msgSend_sourceUrl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceUrl");
}

id objc_msgSend_spStatusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spStatusCode");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start:");
}

id objc_msgSend_startNewSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startNewSession");
}

id objc_msgSend_startPollingForTechnology_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startPollingForTechnology:error:");
}

id objc_msgSend_startPollingWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startPollingWithError:");
}

id objc_msgSend_startReaderSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startReaderSession:");
}

id objc_msgSend_startSecureElementManagerSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSecureElementManagerSession:");
}

id objc_msgSend_startSecureElementManagerSessionWithPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSecureElementManagerSessionWithPriority:");
}

id objc_msgSend_startTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTimer:");
}

id objc_msgSend_stateInformation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateInformation");
}

id objc_msgSend_stateInformationWithRedirectInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateInformationWithRedirectInfo:error:");
}

id objc_msgSend_stateUpdateOnSessionEndedCallback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateUpdateOnSessionEndedCallback");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_step(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "step");
}

id objc_msgSend_stopPolling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopPolling");
}

id objc_msgSend_stopTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopTimer");
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_submitTaskRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitTaskRequest:error:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suspend");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_tagID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tagID");
}

id objc_msgSend_targetSEID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetSEID");
}

id objc_msgSend_targetTagType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetTagType");
}

id objc_msgSend_taskId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskId");
}

id objc_msgSend_taskRequestForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskRequestForIdentifier:");
}

id objc_msgSend_technology(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "technology");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_totalAPDUTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalAPDUTime");
}

id objc_msgSend_totalNetworkResponseTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalNetworkResponseTime");
}

id objc_msgSend_totalResponsesWithBody(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalResponsesWithBody");
}

id objc_msgSend_totalSessionTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalSessionTime");
}

id objc_msgSend_transceive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transceive:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_underlyingQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "underlyingQueue");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlock");
}

id objc_msgSend_unregisterEventListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterEventListener:");
}

id objc_msgSend_unregisterForEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterForEvents");
}

id objc_msgSend_unsentScriptResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsentScriptResponse");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedShortValue");
}

id objc_msgSend_updateAnalyticsGeneralTransactionStatistics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAnalyticsGeneralTransactionStatistics:");
}

id objc_msgSend_updateNextRetryInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateNextRetryInterval:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_uri(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uri");
}

id objc_msgSend_urlString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlString");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "version");
}

id objc_msgSend_whitelistedInstances(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitelistedInstances");
}

id objc_msgSend_withRelyingParty_relyingPartyAccountHash_fidoKeyHash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "withRelyingParty:relyingPartyAccountHash:fidoKeyHash:");
}
