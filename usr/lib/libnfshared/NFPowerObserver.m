@implementation NFPowerObserver

- (NFPowerObserver)initWithDelegate:(id)a3
{
  id v4;
  NFPowerObserver *v5;
  NFPowerObserver *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFPowerObserver;
  v5 = -[NFPowerObserver init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.stockholm.powerobserver", v7);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v8;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NFPowerObserver unregisterForEvents](self, "unregisterForEvents");
  v3.receiver = self;
  v3.super_class = (Class)NFPowerObserver;
  -[NFPowerObserver dealloc](&v3, sel_dealloc);
}

- (id)delegate
{
  NFPowerObserver *v2;
  id WeakRetained;

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return WeakRetained;
}

- (BOOL)registerForEvents
{
  io_connect_t v4;
  char *v6;
  void *specific;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  void *v13;
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
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_powerNotificationConnection)
    return 1;
  v4 = IORegisterForSystemPower(self, &self->_powerNotificationPort, (IOServiceInterestCallback)_NFPowerObserverSystemPowerChanged, &self->_powerNotificationNotifier);
  self->_powerNotificationConnection = v4;
  if (v4)
  {
    IONotificationPortSetDispatchQueue(self->_powerNotificationPort, (dispatch_queue_t)self->_workQueue);
    return 1;
  }
  v6 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)specific >= 4)
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  v8 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
  if (v8)
  {
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(3, "%c[%{public}s %{public}s]:%i Failed to register for PM notifications", v12, ClassName, Name, 67);
    v6 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v13 = dispatch_get_specific(v6);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v14 = (id)_NFSharedLogClient[(_QWORD)v13];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
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
    v25 = 67;
    _os_log_impl(&dword_1C34DB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to register for PM notifications", buf, 0x22u);
  }

  return 0;
}

- (void)unregisterForEvents
{
  char *v4;
  void *specific;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_powerNotificationConnection)
  {
    v4 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v6 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v6)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v6(6, "%c[%{public}s %{public}s]:%i Unregistering Power notifications", v10, ClassName, Name, 82);
      v4 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v11 = dispatch_get_specific(v4);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v12 = (id)_NFSharedLogClient[(_QWORD)v11];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = object_getClass(self);
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      *(_DWORD *)buf = 67109890;
      v17 = v14;
      v18 = 2082;
      v19 = object_getClassName(self);
      v20 = 2082;
      v21 = sel_getName(a2);
      v22 = 1024;
      v23 = 82;
      _os_log_impl(&dword_1C34DB000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unregistering Power notifications", buf, 0x22u);
    }

    IODeregisterForSystemPower(&self->_powerNotificationNotifier);
    IONotificationPortDestroy(self->_powerNotificationPort);
    IOServiceClose(self->_powerNotificationConnection);
    self->_powerNotificationConnection = 0;
  }
}

- (void)_powerNotificationMessage:(unsigned int)a3 argument:(void *)a4
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *specific;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  char *v20;
  void *v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  NSObject *v33;
  void *v34;
  char v35;
  void *v36;
  NSObject *v37;
  char *v38;
  void *v39;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *v41;
  _BOOL4 v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  objc_class *v46;
  int v47;
  char *v48;
  void *v49;
  void (*v50)(uint64_t, const char *, ...);
  objc_class *v51;
  _BOOL4 v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  objc_class *v56;
  int v57;
  const char *ClassName;
  const char *Name;
  const char *v60;
  const char *v61;
  const char *v62;
  uint8_t buf[8];
  _BYTE v64[10];
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  switch((v4 >> 4))
  {
    case 0u:
      v8 = IOAllowPowerChange(self->_powerNotificationConnection, (intptr_t)a4);
      if (!(_DWORD)v8)
        return;
      v9 = v8;
      v10 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific >= 4)
        break;
      v12 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v12)
      {
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v15 = 45;
        if (isMetaClass)
          v15 = 43;
        v12(4, "%c[%{public}s %{public}s]:%i Returned %x", v15, ClassName, Name, 99, v9);
        v10 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v16 = dispatch_get_specific(v10);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v17 = (id)_NFSharedLogClient[(_QWORD)v16];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = object_getClass(self);
        if (class_isMetaClass(v18))
          v19 = 43;
        else
          v19 = 45;
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = v19;
        *(_WORD *)v64 = 2082;
        *(_QWORD *)&v64[2] = object_getClassName(self);
        v65 = 2082;
        v66 = sel_getName(a2);
        v67 = 1024;
        v68 = 99;
        v69 = 1024;
        v70 = v9;
        _os_log_impl(&dword_1C34DB000, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Returned %x", buf, 0x28u);
      }

      return;
    case 1u:
      if (!self->_willSleep)
      {
        v37 = _os_activity_create(&dword_1C34DB000, "system will sleep", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
        *(_QWORD *)buf = 0;
        *(_QWORD *)v64 = 0;
        os_activity_scope_enter(v37, (os_activity_scope_state_t)buf);
        os_activity_scope_leave((os_activity_scope_state_t)buf);

        self->_willSleep = 1;
        self->_sleepMessageArgument = a4;
        -[NFPowerObserver delegate](self, "delegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "powerObserverSystemWillSleep:", self);
        goto LABEL_37;
      }
      v20 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v21 >= 4)
        break;
      v22 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v21);
      if (v22)
      {
        v23 = object_getClass(self);
        v24 = class_isMetaClass(v23);
        v25 = object_getClassName(self);
        v60 = sel_getName(a2);
        v26 = 45;
        if (v24)
          v26 = 43;
        v22(3, "%c[%{public}s %{public}s]:%i System already sent a will sleep message ! Ignoring will sleep.", v26, v25, v60, 106);
        v20 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v27 = dispatch_get_specific(v20);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v28 = (id)_NFSharedLogClient[(_QWORD)v27];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        goto LABEL_63;
      v29 = object_getClass(self);
      if (class_isMetaClass(v29))
        v30 = 43;
      else
        v30 = 45;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v30;
      *(_WORD *)v64 = 2082;
      *(_QWORD *)&v64[2] = object_getClassName(self);
      v65 = 2082;
      v66 = sel_getName(a2);
      v67 = 1024;
      v68 = 106;
      v31 = "%c[%{public}s %{public}s]:%i System already sent a will sleep message ! Ignoring will sleep.";
LABEL_62:
      _os_log_impl(&dword_1C34DB000, v28, OS_LOG_TYPE_ERROR, v31, buf, 0x22u);
LABEL_63:

      return;
    case 2u:
      if (self->_willSleep)
      {
        v32 = "system will not sleep";
LABEL_34:
        v33 = _os_activity_create(&dword_1C34DB000, v32, MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
        *(_QWORD *)buf = 0;
        *(_QWORD *)v64 = 0;
        os_activity_scope_enter(v33, (os_activity_scope_state_t)buf);
        os_activity_scope_leave((os_activity_scope_state_t)buf);

        self->_willSleep = 0;
        -[NFPowerObserver delegate](self, "delegate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_opt_respondsToSelector();

        if ((v35 & 1) == 0)
          return;
        -[NFPowerObserver delegate](self, "delegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "powerObserverSystemHasPoweredOn:", self);
LABEL_37:

        return;
      }
      v38 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v39 < 4)
      {
        v40 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v39);
        if (v40)
        {
          v41 = object_getClass(self);
          v42 = class_isMetaClass(v41);
          v43 = object_getClassName(self);
          v61 = sel_getName(a2);
          v44 = 45;
          if (v42)
            v44 = 43;
          v40(4, "%c[%{public}s %{public}s]:%i System never went to sleep ! Ignoring will not sleep message.", v44, v43, v61, 120);
          v38 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v45 = dispatch_get_specific(v38);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v28 = (id)_NFSharedLogClient[(_QWORD)v45];
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          goto LABEL_63;
        v46 = object_getClass(self);
        if (class_isMetaClass(v46))
          v47 = 43;
        else
          v47 = 45;
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v47;
        *(_WORD *)v64 = 2082;
        *(_QWORD *)&v64[2] = object_getClassName(self);
        v65 = 2082;
        v66 = sel_getName(a2);
        v67 = 1024;
        v68 = 120;
        v31 = "%c[%{public}s %{public}s]:%i System never went to sleep ! Ignoring will not sleep message.";
        goto LABEL_62;
      }
      break;
    case 9u:
      self->_willSleep = 0;
      return;
    case 0xBu:
      if (self->_willSleep)
      {
        v32 = "system will power on";
        goto LABEL_34;
      }
      v48 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v49 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v49 < 4)
      {
        v50 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v49);
        if (v50)
        {
          v51 = object_getClass(self);
          v52 = class_isMetaClass(v51);
          v53 = object_getClassName(self);
          v62 = sel_getName(a2);
          v54 = 45;
          if (v52)
            v54 = 43;
          v50(3, "%c[%{public}s %{public}s]:%i System never went to sleep ! Ignoring will power on message.", v54, v53, v62, 135);
          v48 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v55 = dispatch_get_specific(v48);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v28 = (id)_NFSharedLogClient[(_QWORD)v55];
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          goto LABEL_63;
        v56 = object_getClass(self);
        if (class_isMetaClass(v56))
          v57 = 43;
        else
          v57 = 45;
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v57;
        *(_WORD *)v64 = 2082;
        *(_QWORD *)&v64[2] = object_getClassName(self);
        v65 = 2082;
        v66 = sel_getName(a2);
        v67 = 1024;
        v68 = 135;
        v31 = "%c[%{public}s %{public}s]:%i System never went to sleep ! Ignoring will power on message.";
        goto LABEL_62;
      }
      break;
    default:
      return;
  }
  __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
}

- (void)allowSleep
{
  void *sleepMessageArgument;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *specific;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v12;
  void *v13;
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
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  sleepMessageArgument = self->_sleepMessageArgument;
  self->_sleepMessageArgument = 0;
  if (self->_willSleep)
  {
    v5 = IOAllowPowerChange(self->_powerNotificationConnection, (intptr_t)sleepMessageArgument);
    if ((_DWORD)v5)
    {
      v6 = v5;
      v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific >= 4)
        __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
      v9 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v9)
      {
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v12 = 45;
        if (isMetaClass)
          v12 = 43;
        v9(4, "%c[%{public}s %{public}s]:%i Returned %x", v12, ClassName, Name, 166, v6);
        v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v13 = dispatch_get_specific(v7);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v14 = (id)_NFSharedLogClient[(_QWORD)v13];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
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
        v26 = 166;
        v27 = 1024;
        v28 = v6;
        _os_log_impl(&dword_1C34DB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Returned %x", buf, 0x28u);
      }

    }
  }
}

- (BOOL)willSleep
{
  return self->_willSleep;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
