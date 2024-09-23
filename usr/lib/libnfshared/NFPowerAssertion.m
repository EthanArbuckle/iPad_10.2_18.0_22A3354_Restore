@implementation NFPowerAssertion

- (void)holdPowerAssertion:(id)a3
{
  -[NFPowerAssertion holdPowerAssertion:onBehalfOf:](self, "holdPowerAssertion:onBehalfOf:", a3, 0xFFFFFFFFLL);
}

- (void)holdPowerAssertion:(id)a3 onBehalfOf:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void (*v17)(uint64_t, const char *, ...);
  objc_class *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  OS_os_transaction *v28;
  OS_os_transaction *powerAssertTransaction;
  char *v30;
  void *specific;
  void (*v32)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v34;
  const char *ClassName;
  const char *Name;
  void *v37;
  NSObject *v38;
  objc_class *v39;
  int v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  char *v44;
  void *v45;
  void (*v46)(uint64_t, const char *, ...);
  objc_class *v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  objc_class *v55;
  int v56;
  const char *v57;
  const char *v58;
  void *v59;
  void *v60;
  void *v61;
  NSMutableDictionary *obj;
  void *v64;
  IOPMAssertionID AssertionID;
  uint8_t buf[4];
  int v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  int v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  id v77;
  _QWORD v78[3];
  _QWORD v79[5];

  v4 = *(_QWORD *)&a4;
  v79[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  obj = self->_assertionHolders;
  objc_sync_enter(obj);
  -[NSMutableDictionary objectForKey:](self->_assertionHolders, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_opt_new();
  AssertionID = 0;
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "processName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@[%@]"), v10, v6);

  v11 = (void *)objc_opt_new();
  v78[0] = CFSTR("AssertType");
  v78[1] = CFSTR("AssertName");
  v79[0] = CFSTR("PreventUserIdleSystemSleep");
  v79[1] = v64;
  v78[2] = CFSTR("AssertLevel");
  v79[2] = &unk_1E7D886B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEntriesFromDictionary:", v12);

  if ((_DWORD)v4 != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v13, CFSTR("AssertionOnBehalfOfPID"));

  }
  v14 = IOPMAssertionCreateWithProperties((CFDictionaryRef)v11, &AssertionID);
  if (!(_DWORD)v14)
  {
    if (!-[NSMutableDictionary count](self->_assertionHolders, "count"))
    {
      v28 = (OS_os_transaction *)os_transaction_create();
      powerAssertTransaction = self->_powerAssertTransaction;
      self->_powerAssertTransaction = v28;

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", AssertionID);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v61);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assertionHolders, "setObject:forKeyedSubscript:", v7, v6);
    if (self->_enableDebug)
    {
      v30 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific >= 4)
        goto LABEL_52;
      v32 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v32)
      {
        Class = object_getClass(self);
        if (class_isMetaClass(Class))
          v34 = 43;
        else
          v34 = 45;
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v32(6, "%c[%{public}s %{public}s]:%i opened assertion: counter: %lu id: %{public}@", v34, ClassName, Name, 113, objc_msgSend(v7, "count"), v6);
        v30 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v37 = dispatch_get_specific(v30);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v38 = (id)_NFSharedLogClient[(_QWORD)v37];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = object_getClass(self);
        if (class_isMetaClass(v39))
          v40 = 43;
        else
          v40 = 45;
        v41 = object_getClassName(self);
        v42 = sel_getName(a2);
        v43 = objc_msgSend(v7, "count");
        *(_DWORD *)buf = 67110402;
        v67 = v40;
        v68 = 2082;
        v69 = v41;
        v70 = 2082;
        v71 = v42;
        v72 = 1024;
        v73 = 113;
        v74 = 2048;
        v75 = v43;
        v76 = 2114;
        v77 = v6;
        _os_log_impl(&dword_1C34DB000, v38, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i opened assertion: counter: %lu id: %{public}@", buf, 0x36u);
      }

      v44 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v45 >= 4)
LABEL_52:
        __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
      v46 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v45);
      if (v46)
      {
        v47 = object_getClass(self);
        if (class_isMetaClass(v47))
          v48 = 43;
        else
          v48 = 45;
        v49 = object_getClassName(self);
        v50 = sel_getName(a2);
        -[NFPowerAssertion dumpState](self, "dumpState");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "description");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v46(6, "%c[%{public}s %{public}s]:%i all assertions: %{public}@", v48, v49, v50, 114, v52);

        v44 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v53 = dispatch_get_specific(v44);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v54 = (id)_NFSharedLogClient[(_QWORD)v53];
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = object_getClass(self);
        if (class_isMetaClass(v55))
          v56 = 43;
        else
          v56 = 45;
        v57 = object_getClassName(self);
        v58 = sel_getName(a2);
        -[NFPowerAssertion dumpState](self, "dumpState");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "description");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110146;
        v67 = v56;
        v68 = 2082;
        v69 = v57;
        v70 = 2082;
        v71 = v58;
        v72 = 1024;
        v73 = 114;
        v74 = 2114;
        v75 = (uint64_t)v60;
        _os_log_impl(&dword_1C34DB000, v54, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i all assertions: %{public}@", buf, 0x2Cu);

      }
    }

    goto LABEL_51;
  }
  v15 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v16 >= 4)
    goto LABEL_52;
  v17 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v16);
  if (v17)
  {
    v18 = object_getClass(self);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    v20 = object_getClassName(self);
    v21 = sel_getName(a2);
    v17(3, "%c[%{public}s %{public}s]:%i Failed with 0x%x", v19, v20, v21, 97, v14);
    v15 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v22 = dispatch_get_specific(v15);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v23 = (id)_NFSharedLogClient[(_QWORD)v22];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = object_getClass(self);
    if (class_isMetaClass(v24))
      v25 = 43;
    else
      v25 = 45;
    v26 = object_getClassName(self);
    v27 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v67 = v25;
    v68 = 2082;
    v69 = v26;
    v70 = 2082;
    v71 = v27;
    v72 = 1024;
    v73 = 97;
    v74 = 1024;
    LODWORD(v75) = v14;
    _os_log_impl(&dword_1C34DB000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed with 0x%x", buf, 0x28u);
  }

  NFSimulateCrash(57005, (uint64_t)"PM assertion create failure");
LABEL_51:

  objc_sync_exit(obj);
}

- (void)releasePowerAssertion:(id)a3
{
  -[NFPowerAssertion releasePowerAssertion:logFaultOnOverRelease:](self, "releasePowerAssertion:logFaultOnOverRelease:", a3, 1);
}

+ (id)sharedPowerAssertion
{
  if (qword_1ECFF6A58 != -1)
    dispatch_once(&qword_1ECFF6A58, &__block_literal_global_2);
  return (id)_MergedGlobals_3;
}

void __40__NFPowerAssertion_sharedPowerAssertion__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = v0;

}

- (NFPowerAssertion)init
{
  NFPowerAssertion *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *assertionHolders;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NFPowerAssertion;
  v2 = -[NFPowerAssertion init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assertionHolders = v2->_assertionHolders;
    v2->_assertionHolders = v3;

  }
  return v2;
}

- (void)releasePowerAssertion:(id)a3 logFaultOnOverRelease:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  char *v23;
  void *v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  void *v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  char *v37;
  void *v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  void *v52;
  void *v53;
  char *v54;
  void *specific;
  void (*v56)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v58;
  const char *ClassName;
  const char *Name;
  void *v61;
  objc_class *v62;
  int v63;
  char *v64;
  void *v65;
  void (*v66)(uint64_t, const char *, ...);
  objc_class *v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  void *v71;
  objc_class *v72;
  int v73;
  OS_os_transaction *powerAssertTransaction;
  const char *sel;
  NSMutableDictionary *obj;
  uint8_t buf[4];
  _BYTE v78[14];
  __int16 v79;
  const char *v80;
  __int16 v81;
  int v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  id v86;
  uint64_t v87;

  v4 = a4;
  v87 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  obj = self->_assertionHolders;
  objc_sync_enter(obj);
  -[NSMutableDictionary objectForKey:](self->_assertionHolders, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    if (NFIsInternalBuild_onceToken != -1)
      dispatch_once(&NFIsInternalBuild_onceToken, &__block_literal_global_49);
    if (NFIsInternalBuild_bVal && v4)
    {
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v10 = (id)_NFSharedLogClient[0];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        goto LABEL_92;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v78 = v7;
LABEL_64:
      _os_log_fault_impl(&dword_1C34DB000, v10, OS_LOG_TYPE_FAULT, "%{public}@ does not hold assertion", buf, 0xCu);
      goto LABEL_92;
    }
    v54 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      goto LABEL_96;
    v56 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v56)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class))
        v58 = 43;
      else
        v58 = 45;
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v56(3, "%c[%{public}s %{public}s]:%i %{public}@ does not hold assertion", v58, ClassName, Name, 141, v7);
      v54 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v61 = dispatch_get_specific(v54);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v10 = (id)_NFSharedLogClient[(_QWORD)v61];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_92;
    v62 = object_getClass(self);
    if (class_isMetaClass(v62))
      v63 = 43;
    else
      v63 = 45;
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v78 = v63;
    *(_WORD *)&v78[4] = 2082;
    *(_QWORD *)&v78[6] = object_getClassName(self);
    v79 = 2082;
    v80 = sel_getName(a2);
    v81 = 1024;
    v82 = 141;
    v83 = 2114;
    v84 = (uint64_t)v7;
LABEL_91:
    _os_log_impl(&dword_1C34DB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ does not hold assertion", buf, 0x2Cu);
    goto LABEL_92;
  }
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v9, "lastObject");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = IOPMAssertionRelease(-[NSObject unsignedLongValue](v10, "unsignedLongValue"));
    sel = a2;
    if ((_DWORD)v11)
    {
      v12 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v13 >= 4)
        goto LABEL_96;
      v14 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v13);
      if (v14)
      {
        v15 = object_getClass(self);
        if (class_isMetaClass(v15))
          v16 = 43;
        else
          v16 = 45;
        v17 = object_getClassName(self);
        v18 = sel_getName(a2);
        v14(3, "%c[%{public}s %{public}s]:%i Failed with 0x%x", v16, v17, v18, 162, v11);
        v12 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v19 = dispatch_get_specific(v12);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v20 = (id)_NFSharedLogClient[(_QWORD)v19];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = object_getClass(self);
        if (class_isMetaClass(v21))
          v22 = 43;
        else
          v22 = 45;
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v78 = v22;
        *(_WORD *)&v78[4] = 2082;
        *(_QWORD *)&v78[6] = object_getClassName(self);
        v79 = 2082;
        v80 = sel_getName(a2);
        v81 = 1024;
        v82 = 162;
        v83 = 1024;
        LODWORD(v84) = v11;
        _os_log_impl(&dword_1C34DB000, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed with 0x%x", buf, 0x28u);
      }

      NFSimulateCrash(57005, (uint64_t)"PM assertion release failure");
    }
    objc_msgSend(v9, "removeLastObject");
    if (!objc_msgSend(v9, "count"))
      -[NSMutableDictionary removeObjectForKey:](self->_assertionHolders, "removeObjectForKey:", v7);
    if (self->_enableDebug)
    {
      v23 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v24 < 4)
      {
        v25 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v24);
        if (v25)
        {
          v26 = object_getClass(self);
          if (class_isMetaClass(v26))
            v27 = 43;
          else
            v27 = 45;
          v28 = object_getClassName(self);
          v29 = sel_getName(a2);
          v25(6, "%c[%{public}s %{public}s]:%i released assertion: counter: %lu id: %{public}@", v27, v28, v29, 174, objc_msgSend(v9, "count"), v7);
          v23 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v30 = dispatch_get_specific(v23);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v31 = (id)_NFSharedLogClient[(_QWORD)v30];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = object_getClass(self);
          if (class_isMetaClass(v32))
            v33 = 43;
          else
            v33 = 45;
          v34 = object_getClassName(self);
          v35 = sel_getName(a2);
          v36 = objc_msgSend(v9, "count");
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)v78 = v33;
          *(_WORD *)&v78[4] = 2082;
          *(_QWORD *)&v78[6] = v34;
          v79 = 2082;
          v80 = v35;
          v81 = 1024;
          v82 = 174;
          v83 = 2048;
          v84 = v36;
          v85 = 2114;
          v86 = v7;
          _os_log_impl(&dword_1C34DB000, v31, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i released assertion: counter: %lu id: %{public}@", buf, 0x36u);
        }

        v37 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v38 < 4)
        {
          v39 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v38);
          if (v39)
          {
            v40 = object_getClass(self);
            if (class_isMetaClass(v40))
              v41 = 43;
            else
              v41 = 45;
            v42 = object_getClassName(self);
            v43 = sel_getName(sel);
            -[NFPowerAssertion dumpState](self, "dumpState");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "description");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v39(6, "%c[%{public}s %{public}s]:%i all assertions: %{public}@", v41, v42, v43, 175, v45);

            v37 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v46 = dispatch_get_specific(v37);
          if (NFSharedLogInitialize_onceToken != -1)
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          v47 = (id)_NFSharedLogClient[(_QWORD)v46];
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v48 = object_getClass(self);
            if (class_isMetaClass(v48))
              v49 = 43;
            else
              v49 = 45;
            v50 = object_getClassName(self);
            v51 = sel_getName(sel);
            -[NFPowerAssertion dumpState](self, "dumpState");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "description");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)v78 = v49;
            *(_WORD *)&v78[4] = 2082;
            *(_QWORD *)&v78[6] = v50;
            v79 = 2082;
            v80 = v51;
            v81 = 1024;
            v82 = 175;
            v83 = 2114;
            v84 = (uint64_t)v53;
            _os_log_impl(&dword_1C34DB000, v47, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i all assertions: %{public}@", buf, 0x2Cu);

          }
          goto LABEL_92;
        }
      }
LABEL_96:
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    goto LABEL_92;
  }
  -[NSMutableDictionary removeObjectForKey:](self->_assertionHolders, "removeObjectForKey:", v7);
  if (NFIsInternalBuild_onceToken != -1)
    dispatch_once(&NFIsInternalBuild_onceToken, &__block_literal_global_49);
  if (NFIsInternalBuild_bVal && v4)
  {
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v10 = (id)_NFSharedLogClient[0];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_92;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v78 = v7;
    goto LABEL_64;
  }
  v64 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v65 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v65 >= 4)
    goto LABEL_96;
  v66 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v65);
  if (v66)
  {
    v67 = object_getClass(self);
    if (class_isMetaClass(v67))
      v68 = 43;
    else
      v68 = 45;
    v69 = object_getClassName(self);
    v70 = sel_getName(a2);
    v66(3, "%c[%{public}s %{public}s]:%i %{public}@ does not hold assertion", v68, v69, v70, 150, v7);
    v64 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v71 = dispatch_get_specific(v64);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v10 = (id)_NFSharedLogClient[(_QWORD)v71];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v72 = object_getClass(self);
    if (class_isMetaClass(v72))
      v73 = 43;
    else
      v73 = 45;
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v78 = v73;
    *(_WORD *)&v78[4] = 2082;
    *(_QWORD *)&v78[6] = object_getClassName(self);
    v79 = 2082;
    v80 = sel_getName(a2);
    v81 = 1024;
    v82 = 150;
    v83 = 2114;
    v84 = (uint64_t)v7;
    goto LABEL_91;
  }
LABEL_92:

  if (self->_powerAssertTransaction && !-[NSMutableDictionary count](self->_assertionHolders, "count"))
  {
    powerAssertTransaction = self->_powerAssertTransaction;
    self->_powerAssertTransaction = 0;

  }
  objc_sync_exit(obj);

}

- (id)assertionHolders
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = self->_assertionHolders;
  objc_sync_enter(v3);
  -[NFPowerAssertion dumpState](self, "dumpState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v4;
}

- (id)dumpState
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *assertionHolders;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  const __CFString *v15;
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = self->_assertionHolders;
  objc_sync_enter(v4);
  assertionHolders = self->_assertionHolders;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __29__NFPowerAssertion_dumpState__block_invoke;
  v13 = &unk_1E7D7F860;
  v6 = v3;
  v14 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](assertionHolders, "enumerateKeysAndObjectsUsingBlock:", &v10);

  objc_sync_exit(v4);
  v16 = v6;
  v17 = CFSTR("NFPowerAssertion");
  v15 = CFSTR("holders");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __29__NFPowerAssertion_dumpState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (BOOL)enableDebug
{
  return self->_enableDebug;
}

- (void)setEnableDebug:(BOOL)a3
{
  self->_enableDebug = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assertionHolders, 0);
  objc_storeStrong((id *)&self->_powerAssertTransaction, 0);
}

@end
