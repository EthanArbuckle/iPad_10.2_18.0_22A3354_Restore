@implementation NFWalletPresentationEventPublisher

- (unint64_t)walletDomain
{
  os_unfair_lock_s *p_updateLock;
  _QWORD *v3;
  unint64_t v4;
  _QWORD v6[2];
  uint64_t (*v7)(uint64_t);
  void *v8;
  NFWalletPresentationEventPublisher *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  p_updateLock = &self->_updateLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v7 = sub_100008540;
  v8 = &unk_1002E5EA8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_updateLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_updateLock);

  v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (NFWalletPresentationEventPublisher)init
{
  NFWalletPresentationEventPublisher *v3;
  uint64_t v4;
  NFWalletPresentationSettingsPassKit *passkitDefaults;
  NFWalletPresentationSettingsPassKit *v6;
  uint64_t v7;
  NFWalletPresentationSettingsSESD *sesdDefaults;
  NFWalletPresentationSettingsSESD *v9;
  BOOL v10;
  uint64_t Logger;
  NSObject *v12;
  NSUserDefaults *v13;
  NSUserDefaults *publishDefaults;
  void *v15;
  void *specific;
  uint64_t v17;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  NFWalletPresentationEventPublisher *v30;
  const char *Name;
  objc_super v33;
  uint8_t buf[4];
  _BOOL4 v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;

  v33.receiver = self;
  v33.super_class = (Class)NFWalletPresentationEventPublisher;
  v3 = -[NFWalletPresentationEventPublisher init](&v33, "init");
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NFWalletPresentationSettingsPassKit defaultSetting](NFWalletPresentationSettingsPassKit, "defaultSetting"));
    passkitDefaults = v3->_passkitDefaults;
    v3->_passkitDefaults = (NFWalletPresentationSettingsPassKit *)v4;

    v6 = v3->_passkitDefaults;
    v7 = objc_claimAutoreleasedReturnValue(+[NFWalletPresentationSettingsSESD defaultSetting](NFWalletPresentationSettingsSESD, "defaultSetting"));
    sesdDefaults = v3->_sesdDefaults;
    v3->_sesdDefaults = (NFWalletPresentationSettingsSESD *)v7;

    v9 = v3->_sesdDefaults;
    if (v6)
      v10 = v9 == 0;
    else
      v10 = 1;
    if (v10)
    {
      Logger = NFSharedLogGetLogger(0);
      v12 = objc_claimAutoreleasedReturnValue(Logger);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67240448;
        v35 = v6 == 0;
        v36 = 1026;
        LODWORD(v37) = v9 == 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "default is nil: PassKit=%{public}d, SESD=%{public}d", buf, 0xEu);
      }

    }
    v13 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.stockholm.wallet.presentation"));
    publishDefaults = v3->_publishDefaults;
    v3->_publishDefaults = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v3->_publishDefaults, "objectForKey:", CFSTR("walletDoubleButtonPressedConsumerAvailable")));
    if (!v15)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v17 = NFLogGetLogger(specific);
      if (v17)
      {
        v18 = (void (*)(uint64_t, const char *, ...))v17;
        Class = object_getClass(v3);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v3);
        Name = sel_getName(a2);
        v22 = 45;
        if (isMetaClass)
          v22 = 43;
        v18(5, "%c[%{public}s %{public}s]:%i Init default", v22, ClassName, Name, 87);
      }
      v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v24 = NFSharedLogGetLogger(v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = object_getClass(v3);
        if (class_isMetaClass(v26))
          v27 = 43;
        else
          v27 = 45;
        v28 = object_getClassName(v3);
        v29 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v35 = v27;
        v36 = 2082;
        v37 = v28;
        v38 = 2082;
        v39 = v29;
        v40 = 1024;
        v41 = 87;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Init default", buf, 0x22u);
      }

      -[NSUserDefaults setBool:forKey:](v3->_publishDefaults, "setBool:forKey:", 0, CFSTR("walletDoubleButtonPressedConsumerAvailable"));
    }
    v3->_updateLock._os_unfair_lock_opaque = 0;
    -[NFWalletPresentationSettingsPassKit addObserver:forKeyPath:options:context:](v3->_passkitDefaults, "addObserver:forKeyPath:options:context:", v3, CFSTR("isEligibleForDoubleClick"), 5, off_1003283C8);
    -[NFWalletPresentationSettingsSESD addObserver:forKeyPath:options:context:](v3->_sesdDefaults, "addObserver:forKeyPath:options:context:", v3, CFSTR("isEligibleForDoubleClick"), 5, off_1003283D0);
    -[NFWalletPresentationSettingsSESD addObserver:forKeyPath:options:context:](v3->_sesdDefaults, "addObserver:forKeyPath:options:context:", v3, CFSTR("walletDomain"), 5, off_1003283D8);
    v30 = v3;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NFWalletPresentationSettingsPassKit removeObserver:forKeyPath:](self->_passkitDefaults, "removeObserver:forKeyPath:", self, CFSTR("isEligibleForDoubleClick"));
  -[NFWalletPresentationSettingsSESD removeObserver:forKeyPath:](self->_sesdDefaults, "removeObserver:forKeyPath:", self, CFSTR("isEligibleForDoubleClick"));
  -[NFWalletPresentationSettingsSESD removeObserver:forKeyPath:](self->_sesdDefaults, "removeObserver:forKeyPath:", self, CFSTR("walletDomain"));
  v3.receiver = self;
  v3.super_class = (Class)NFWalletPresentationEventPublisher;
  -[NFWalletPresentationEventPublisher dealloc](&v3, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11;
  id v12;
  void *v13;
  void *specific;
  uint64_t Logger;
  const char *v17;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v20;
  const char *ClassName;
  const char *v22;
  const char *Name;
  NFWalletPresentationSettingsSESD *sesdDefaults;
  NFWalletPresentationSettingsSESD *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  const char *v34;
  NFWalletPresentationSettingsSESD *v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  os_unfair_lock_s *p_updateLock;
  id v42;
  const char *v43;
  void *v44;
  uint64_t v45;
  void (*v46)(uint64_t, const char *, ...);
  objc_class *v47;
  _BOOL4 isMetaClass;
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
  uint64_t v62;
  const char *v63;
  const char *v64;
  _BOOL8 presenterAvailable;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  objc_class *v69;
  int v70;
  const char *v71;
  const char *v72;
  _BOOL4 v73;
  void *v74;
  uint64_t v75;
  unsigned int v76;
  unint64_t v77;
  const char *v78;
  id v79;
  id v80;
  objc_super v81;
  _QWORD v82[7];
  _QWORD v83[6];
  uint8_t buf[4];
  int v85;
  __int16 v86;
  const char *v87;
  __int16 v88;
  const char *v89;
  __int16 v90;
  int v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  unint64_t v97;

  v80 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (off_1003283D0 == a6 || off_1003283C8 == a6)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    v17 = "PK";
    if (Logger)
    {
      v18 = (void (*)(uint64_t, const char *, ...))Logger;
      v79 = v11;
      Class = object_getClass(self);
      if (class_isMetaClass(Class))
        v20 = 43;
      else
        v20 = 45;
      ClassName = object_getClassName(self);
      v22 = a2;
      Name = sel_getName(a2);
      if (off_1003283D0 == a6)
        v17 = "SESD";
      if (self)
        sesdDefaults = self->_sesdDefaults;
      else
        sesdDefaults = 0;
      v25 = sesdDefaults;
      v18(6, "%c[%{public}s %{public}s]:%i %{public}sDoubleClick changed=%{public}@, domain=%{public}lu", v20, ClassName, Name, 175, v17, v13, -[NFWalletPresentationSettingsSESD walletDomain](v25, "walletDomain"));

      v11 = v79;
      a2 = v22;
      v17 = "PK";
    }
    v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v27 = NFSharedLogGetLogger(v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v11;
      v30 = object_getClass(self);
      if (class_isMetaClass(v30))
        v31 = 43;
      else
        v31 = 45;
      v32 = object_getClassName(self);
      v33 = a2;
      v34 = sel_getName(a2);
      if (off_1003283D0 == a6)
        v17 = "SESD";
      if (self)
        v35 = self->_sesdDefaults;
      else
        v35 = 0;
      v36 = -[NFWalletPresentationSettingsSESD walletDomain](v35, "walletDomain");
      *(_DWORD *)buf = 67110658;
      v85 = v31;
      v86 = 2082;
      v87 = v32;
      v88 = 2082;
      v89 = v34;
      v90 = 1024;
      v91 = 175;
      v92 = 2082;
      v93 = v17;
      v94 = 2114;
      v95 = v13;
      v96 = 2050;
      v97 = v36;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}sDoubleClick changed=%{public}@, domain=%{public}lu", buf, 0x40u);
      a2 = v33;
      v11 = v29;
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    v38 = objc_opt_class(NSNull);
    if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0)
    {
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 3221225472;
      v83[2] = sub_100054948;
      v83[3] = &unk_1002E5C30;
      v83[4] = self;
      v83[5] = a2;
      os_unfair_lock_lock(&self->_updateLock);
      sub_100054948((uint64_t)v83);
      os_unfair_lock_unlock(&self->_updateLock);
    }
    else
    {
      v39 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v37, v39) & 1) != 0)
      {
        sub_100053E34((os_unfair_lock_s *)self);
      }
      else
      {
        v43 = a2;
        v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v45 = NFLogGetLogger(v44);
        if (v45)
        {
          v46 = (void (*)(uint64_t, const char *, ...))v45;
          v47 = object_getClass(self);
          isMetaClass = class_isMetaClass(v47);
          v49 = object_getClassName(self);
          v78 = sel_getName(v43);
          v50 = 45;
          if (isMetaClass)
            v50 = 43;
          v46(3, "%c[%{public}s %{public}s]:%i Unexpected state; dropping update", v50, v49, v78, 189);
        }
        v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v52 = NFSharedLogGetLogger(v51);
        v53 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v54 = object_getClass(self);
          if (class_isMetaClass(v54))
            v55 = 43;
          else
            v55 = 45;
          v56 = object_getClassName(self);
          v57 = sel_getName(v43);
          *(_DWORD *)buf = 67109890;
          v85 = v55;
          v86 = 2082;
          v87 = v56;
          v88 = 2082;
          v89 = v57;
          v90 = 1024;
          v91 = 189;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state; dropping update",
            buf,
            0x22u);
        }

      }
    }
    goto LABEL_43;
  }
  if (off_1003283E0 == a6)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    v40 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v37, v40) & 1) != 0)
    {
      p_updateLock = &self->_updateLock;
      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472;
      v82[2] = sub_100054AF0;
      v82[3] = &unk_1002E5C80;
      v82[4] = self;
      v82[5] = v37;
      v82[6] = a2;
      v42 = v37;
      os_unfair_lock_lock(p_updateLock);
      sub_100054AF0((uint64_t)v82);
      os_unfair_lock_unlock(p_updateLock);

      goto LABEL_44;
    }
LABEL_43:

    goto LABEL_44;
  }
  if (off_1003283D8 == a6)
  {
    v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v59 = NFLogGetLogger(v58);
    if (v59)
    {
      v60 = (void (*)(uint64_t, const char *, ...))v59;
      v61 = object_getClass(self);
      if (class_isMetaClass(v61))
        v62 = 43;
      else
        v62 = 45;
      v63 = object_getClassName(self);
      v64 = sel_getName(a2);
      if (self)
        presenterAvailable = self->_presenterAvailable;
      else
        presenterAvailable = 0;
      v60(6, "%c[%{public}s %{public}s]:%i walletDomain updated, change=%{public}@, presenterAvailable=%{public}d", v62, v63, v64, 216, v13, presenterAvailable);
    }
    v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v67 = NFSharedLogGetLogger(v66);
    v68 = objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v69 = object_getClass(self);
      if (class_isMetaClass(v69))
        v70 = 43;
      else
        v70 = 45;
      v71 = object_getClassName(self);
      v72 = sel_getName(a2);
      if (self)
        v73 = self->_presenterAvailable;
      else
        v73 = 0;
      *(_DWORD *)buf = 67110402;
      v85 = v70;
      v86 = 2082;
      v87 = v71;
      v88 = 2082;
      v89 = v72;
      v90 = 1024;
      v91 = 216;
      v92 = 2114;
      v93 = (const char *)v13;
      v94 = 1026;
      LODWORD(v95) = v73;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i walletDomain updated, change=%{public}@, presenterAvailable=%{public}d", buf, 0x32u);
    }

    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    v75 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v74, v75) & 1) != 0)
    {
      v76 = objc_msgSend(v74, "unsignedIntValue");
      if (self)
      {
        v77 = v76;
        os_unfair_lock_lock(&self->_updateLock);
        self->_walletDomain = v77;
        os_unfair_lock_unlock(&self->_updateLock);
      }
      sub_100053E34((os_unfair_lock_s *)self);
    }

  }
  else
  {
    v81.receiver = self;
    v81.super_class = (Class)NFWalletPresentationEventPublisher;
    -[NFWalletPresentationEventPublisher observeValueForKeyPath:ofObject:change:context:](&v81, "observeValueForKeyPath:ofObject:change:context:", v80, v11, v12, a6);
  }
LABEL_44:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishDefaults, 0);
  objc_storeStrong((id *)&self->_sesdDefaults, 0);
  objc_storeStrong((id *)&self->_passkitDefaults, 0);
  objc_storeStrong((id *)&self->_uiService, 0);
}

@end
