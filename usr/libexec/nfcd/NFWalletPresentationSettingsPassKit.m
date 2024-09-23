@implementation NFWalletPresentationSettingsPassKit

+ (id)defaultSetting
{
  return -[NFWalletPresentationSettingsPassKit initWithSuiteName:]([NFWalletPresentationSettingsPassKit alloc], "initWithSuiteName:", CFSTR("com.apple.passd.class-d"));
}

- (NFWalletPresentationSettingsPassKit)initWithSuiteName:(id)a3
{
  NFWalletPresentationSettingsPassKit *v3;
  NFWalletPresentationSettingsPassKit *v4;
  void *v5;
  NFWalletPresentationSettingsPassKit *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NFWalletPresentationSettingsPassKit;
  v3 = -[NFWalletPresentationSettings initWithSuiteName:](&v8, "initWithSuiteName:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFWalletPresentationSettings defaults](v3, "defaults"));
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v4, CFSTR("pre-arm-available"), 5, off_10032A388);

    v6 = v4;
  }

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFWalletPresentationSettings defaults](self, "defaults"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("pre-arm-available"));

  v4.receiver = self;
  v4.super_class = (Class)NFWalletPresentationSettingsPassKit;
  -[NFWalletPresentationSettingsPassKit dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v8;
  uint64_t v9;
  id v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *v28;
  _BOOL4 v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  objc_class *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  objc_super v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  unsigned int v49;
  __int16 v50;
  int v51;

  if (off_10032A388 != a6)
  {
    v39.receiver = self;
    v39.super_class = (Class)NFWalletPresentationSettingsPassKit;
    -[NFWalletPresentationSettingsPassKit observeValueForKeyPath:ofObject:change:context:](&v39, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
    return;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey, a4));
  v9 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = objc_msgSend(v8, "BOOLValue");
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v37 = -[NFWalletPresentationSettingsPassKit isEligible](self, "isEligible");
      v18 = 45;
      if (isMetaClass)
        v18 = 43;
      v13(6, "%c[%{public}s %{public}s]:%i existing=%{public}d, new=%{public}d", v18, ClassName, Name, 221, v37, v10);
    }
    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFSharedLogGetLogger(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v22 = object_getClass(self);
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    *(_DWORD *)buf = 67110402;
    v41 = v23;
    v42 = 2082;
    v43 = object_getClassName(self);
    v44 = 2082;
    v45 = sel_getName(a2);
    v46 = 1024;
    v47 = 221;
    v48 = 1026;
    v49 = -[NFWalletPresentationSettingsPassKit isEligible](self, "isEligible");
    v50 = 1026;
    v51 = (int)v10;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i existing=%{public}d, new=%{public}d", buf, 0x2Eu);
LABEL_24:

    -[NFWalletPresentationSettingsPassKit setIsEligible:](self, "setIsEligible:", v10);
    goto LABEL_25;
  }
  v24 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v8, v24) & 1) != 0)
  {
    v10 = objc_msgSend(v8, "BOOLValue");
    v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v26 = NFLogGetLogger(v25);
    if (v26)
    {
      v27 = (void (*)(uint64_t, const char *, ...))v26;
      v28 = object_getClass(self);
      v29 = class_isMetaClass(v28);
      v30 = object_getClassName(self);
      v31 = sel_getName(a2);
      v38 = -[NFWalletPresentationSettingsPassKit isEligible](self, "isEligible");
      v32 = 45;
      if (v29)
        v32 = 43;
      v27(6, "%c[%{public}s %{public}s]:%i existing=%{public}d, new=%{public}d", v32, v30, v31, 225, v38, v10);
    }
    v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v34 = NFSharedLogGetLogger(v33);
    v21 = objc_claimAutoreleasedReturnValue(v34);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v35 = object_getClass(self);
    if (class_isMetaClass(v35))
      v36 = 43;
    else
      v36 = 45;
    *(_DWORD *)buf = 67110402;
    v41 = v36;
    v42 = 2082;
    v43 = object_getClassName(self);
    v44 = 2082;
    v45 = sel_getName(a2);
    v46 = 1024;
    v47 = 225;
    v48 = 1026;
    v49 = -[NFWalletPresentationSettingsPassKit isEligible](self, "isEligible");
    v50 = 1026;
    v51 = (int)v10;
    goto LABEL_23;
  }
LABEL_25:

}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v3;
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___NFWalletPresentationSettingsPassKit;
  v3 = a3;
  v4 = objc_msgSendSuper2(&v9, "keyPathsForValuesAffectingValueForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("isEligibleForDoubleClick"), v9.receiver, v9.super_class);

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setByAddingObject:", CFSTR("isEligible")));

    v5 = (void *)v7;
  }
  return v5;
}

- (BOOL)isEligible
{
  return self->_isEligible;
}

- (void)setIsEligible:(BOOL)a3
{
  self->_isEligible = a3;
}

@end
