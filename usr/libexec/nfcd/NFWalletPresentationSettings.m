@implementation NFWalletPresentationSettings

- (NFWalletPresentationSettings)initWithSuiteName:(id)a3
{
  id v5;
  NFWalletPresentationSettings *v6;
  NSUserDefaults *v7;
  NSUserDefaults *defaults;
  NFWalletPresentationSettings *v9;
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
  const char *ClassName;
  const char *Name;
  objc_super v26;
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
  v26.receiver = self;
  v26.super_class = (Class)NFWalletPresentationSettings;
  v6 = -[NFWalletPresentationSettings init](&v26, "init");
  if (!v6)
  {
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  v7 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", v5);
  defaults = v6->_defaults;
  v6->_defaults = v7;

  if (!v6->_defaults)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v6);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v6);
      Name = sel_getName(a2);
      v15 = 45;
      if (isMetaClass)
        v15 = 43;
      v12(3, "%c[%{public}s %{public}s]:%i Fail to initialize suite %@", v15, ClassName, Name, 25, v5);
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
      v22 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v28 = v20;
      v29 = 2082;
      v30 = v21;
      v31 = 2082;
      v32 = v22;
      v33 = 1024;
      v34 = 25;
      v35 = 2112;
      v36 = v5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Fail to initialize suite %@", buf, 0x2Cu);
    }

    goto LABEL_14;
  }
  v9 = v6;
LABEL_15:

  return v9;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
