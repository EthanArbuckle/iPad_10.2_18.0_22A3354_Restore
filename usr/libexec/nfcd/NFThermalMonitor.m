@implementation NFThermalMonitor

- (void)thermalStateChanged:(unint64_t)a3
{
  NFThermalMonitor *v5;
  uint64_t v6;
  void (**temperaturePollingHandler)(void);
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
  unint64_t state;
  void (**handler)(id, unint64_t);
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

  v5 = self;
  v6 = objc_sync_enter(v5);
  switch(a3)
  {
    case 2uLL:
      if (v5->_state != 4)
      {
        if (NFThermalMonitorProvidedBySMC(v6))
        {
          temperaturePollingHandler = (void (**)(void))v5->_temperaturePollingHandler;
          if (temperaturePollingHandler)
            temperaturePollingHandler[2]();
        }
      }
      v8 = 4;
      goto LABEL_11;
    case 1uLL:
      v8 = 2;
LABEL_11:
      v5->_state = v8;
      break;
    case 0uLL:
      v5->_state = 0;
      break;
  }
  objc_sync_exit(v5);

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(v5);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(v5);
    Name = sel_getName(a2);
    v16 = 45;
    if (isMetaClass)
      v16 = 43;
    v11(6, "%c[%{public}s %{public}s]:%i New state : %lx", v16, ClassName, Name, 202, v5->_state);
  }
  v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = NFSharedLogGetLogger(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = object_getClass(v5);
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    v22 = object_getClassName(v5);
    v23 = sel_getName(a2);
    state = v5->_state;
    *(_DWORD *)buf = 67110146;
    v27 = v21;
    v28 = 2082;
    v29 = v22;
    v30 = 2082;
    v31 = v23;
    v32 = 1024;
    v33 = 202;
    v34 = 2048;
    v35 = state;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i New state : %lx", buf, 0x2Cu);
  }

  handler = (void (**)(id, unint64_t))v5->_handler;
  if (handler)
    handler[2](handler, v5->_state);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_temperaturePollingHandler, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_powerMonitor, 0);
}

@end
