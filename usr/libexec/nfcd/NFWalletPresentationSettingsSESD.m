@implementation NFWalletPresentationSettingsSESD

- (NSString)defaultAppIdentifier
{
  return self->_defaultAppIdentifier;
}

+ (id)defaultSetting
{
  return -[NFWalletPresentationSettingsSESD initWithSuiteName:]([NFWalletPresentationSettingsSESD alloc], "initWithSuiteName:", CFSTR("com.apple.seserviced.contactlessCredential.settings"));
}

- (NFWalletPresentationSettingsSESD)initWithSuiteName:(id)a3
{
  NFWalletPresentationSettingsSESD *v3;
  NFWalletPresentationSettingsSESD *v4;
  void *v5;
  void *v6;
  void *v7;
  NFWalletPresentationSettingsSESD *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NFWalletPresentationSettingsSESD;
  v3 = -[NFWalletPresentationSettings initWithSuiteName:](&v10, "initWithSuiteName:", a3);
  v4 = v3;
  if (v3)
  {
    -[NFWalletPresentationSettingsSESD setWalletDomain:](v3, "setWalletDomain:", -1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFWalletPresentationSettings defaults](v4, "defaults"));
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v4, CFSTR("defaultAppIdentifier"), 5, off_10032A390);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFWalletPresentationSettings defaults](v4, "defaults"));
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v4, CFSTR("domain"), 5, off_10032A398);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFWalletPresentationSettings defaults](v4, "defaults"));
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v4, CFSTR("doubleClickEnabled"), 5, off_10032A3A0);

    v8 = v4;
  }

  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFWalletPresentationSettings defaults](self, "defaults"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("defaultAppIdentifier"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFWalletPresentationSettings defaults](self, "defaults"));
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("domain"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFWalletPresentationSettings defaults](self, "defaults"));
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("doubleClickEnabled"));

  v6.receiver = self;
  v6.super_class = (Class)NFWalletPresentationSettingsSESD;
  -[NFWalletPresentationSettingsSESD dealloc](&v6, "dealloc");
}

- (BOOL)isEligibleForDoubleClick
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFWalletPresentationSettingsSESD defaultAppIdentifier](self, "defaultAppIdentifier"));
  if (objc_msgSend(v3, "lengthOfBytesUsingEncoding:", 4)
    && ((id)-[NFWalletPresentationSettingsSESD walletDomain](self, "walletDomain") == (id)1
     || (id)-[NFWalletPresentationSettingsSESD walletDomain](self, "walletDomain") == (id)2))
  {
    v4 = -[NFWalletPresentationSettingsSESD doubleClickEnable](self, "doubleClickEnable");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
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
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  int isKindOfClass;
  uint64_t v34;
  int v35;
  uint64_t v36;
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
  NSObject *v50;
  uint32_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void (*v55)(uint64_t, const char *, ...);
  objc_class *v56;
  _BOOL4 v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  objc_class *v63;
  int v64;
  const char *v65;
  NSObject *v66;
  uint32_t v67;
  void *v68;
  uint64_t v69;
  void (*v70)(uint64_t, const char *, ...);
  objc_class *v71;
  _BOOL4 v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  objc_class *v77;
  int v78;
  NSObject *v79;
  uint64_t v80;
  id v81;
  void *specific;
  uint64_t Logger;
  void (*v84)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *Name;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  NSObject *v92;
  objc_class *v93;
  int v94;
  const char *v95;
  const char *v96;
  void *v97;
  __CFString *v98;
  uint64_t v99;
  id v100;
  void *v101;
  uint64_t v102;
  void (*v103)(uint64_t, const char *, ...);
  objc_class *v104;
  _BOOL4 v105;
  id v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  NSObject *v111;
  objc_class *v112;
  int v113;
  NFWalletPresentationSettingsSESD *v114;
  id v115;
  void *v116;
  uint64_t v117;
  void (*v118)(uint64_t, const char *, ...);
  objc_class *v119;
  _BOOL4 v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  objc_class *v124;
  int v125;
  void *v126;
  uint64_t v127;
  void (*v128)(uint64_t, const char *, ...);
  objc_class *v129;
  _BOOL4 v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  objc_class *v134;
  int v135;
  void *v136;
  uint64_t v137;
  void (*v138)(uint64_t, const char *, ...);
  objc_class *v139;
  _BOOL4 v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  objc_class *v144;
  int v145;
  __CFString *v146;
  void *v147;
  uint64_t v148;
  void (*v149)(uint64_t, const char *, ...);
  objc_class *v150;
  _BOOL4 v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  NSObject *v156;
  objc_class *v157;
  int v158;
  void *v159;
  uint64_t v160;
  void (*v161)(uint64_t, const char *, ...);
  objc_class *v162;
  _BOOL4 v163;
  const char *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  uint64_t v168;
  NSObject *v169;
  objc_class *v170;
  int v171;
  const char *v172;
  const char *v173;
  unint64_t v174;
  objc_class *v175;
  _BOOL4 v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  objc_class *v181;
  int v182;
  const char *v183;
  const char *v184;
  const char *v185;
  const char *v186;
  const char *v187;
  const char *v188;
  const char *v189;
  const char *v190;
  const char *v191;
  const char *v192;
  const char *v193;
  const char *v194;
  const char *v195;
  uint64_t v196;
  unint64_t v197;
  const char *ClassName;
  id v199;
  const char *v200;
  objc_super v201;
  uint8_t buf[4];
  int v203;
  __int16 v204;
  const char *v205;
  __int16 v206;
  const char *v207;
  __int16 v208;
  int v209;
  __int16 v210;
  const __CFString *v211;
  __int16 v212;
  _BYTE v213[10];
  __CFString *v214;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (off_10032A390 == a6)
  {
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    if (v15)
    {
      v16 = objc_opt_class(NSNull);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
      {
        v199 = v11;
        v80 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v15, v80) & 1) != 0)
        {
          v81 = -[__CFString lengthOfBytesUsingEncoding:](v15, "lengthOfBytesUsingEncoding:", 4);
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          v84 = (void (*)(uint64_t, const char *, ...))Logger;
          if (v81)
          {
            if (Logger)
            {
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v88 = (void *)objc_claimAutoreleasedReturnValue(-[NFWalletPresentationSettingsSESD defaultAppIdentifier](self, "defaultAppIdentifier"));
              v89 = 43;
              if (!isMetaClass)
                v89 = 45;
              v84(6, "%c[%{public}s %{public}s]:%i %@ existing=%{public}@, new=%{public}@", v89, ClassName, Name, 112, CFSTR("defaultAppIdentifier"), v88, v15);

            }
            v90 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v91 = NFSharedLogGetLogger(v90);
            v92 = objc_claimAutoreleasedReturnValue(v91);
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
            {
              v93 = object_getClass(self);
              if (class_isMetaClass(v93))
                v94 = 43;
              else
                v94 = 45;
              v95 = object_getClassName(self);
              v96 = sel_getName(a2);
              v97 = (void *)objc_claimAutoreleasedReturnValue(-[NFWalletPresentationSettingsSESD defaultAppIdentifier](self, "defaultAppIdentifier"));
              *(_DWORD *)buf = 67110658;
              v203 = v94;
              v204 = 2082;
              v205 = v95;
              v206 = 2082;
              v207 = v96;
              v208 = 1024;
              v209 = 112;
              v210 = 2112;
              v211 = CFSTR("defaultAppIdentifier");
              v212 = 2114;
              *(_QWORD *)v213 = v97;
              *(_WORD *)&v213[8] = 2114;
              v214 = v15;
              _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %@ existing=%{public}@, new=%{public}@", buf, 0x40u);

            }
            -[NFWalletPresentationSettingsSESD setDefaultAppIdentifier:](self, "setDefaultAppIdentifier:", v15);
            goto LABEL_131;
          }
          if (Logger)
          {
            v175 = object_getClass(self);
            v176 = class_isMetaClass(v175);
            v177 = object_getClassName(self);
            v195 = sel_getName(a2);
            v178 = 45;
            if (v176)
              v178 = 43;
            v84(4, "%c[%{public}s %{public}s]:%i Invalid appId; 0 length", v178, v177, v195, 108);
          }
          v179 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v180 = NFSharedLogGetLogger(v179);
          v79 = objc_claimAutoreleasedReturnValue(v180);
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            v181 = object_getClass(self);
            if (class_isMetaClass(v181))
              v182 = 43;
            else
              v182 = 45;
            *(_DWORD *)buf = 67109890;
            v203 = v182;
            v204 = 2082;
            v205 = object_getClassName(self);
            v206 = 2082;
            v207 = sel_getName(a2);
            v208 = 1024;
            v209 = 108;
            _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid appId; 0 length",
              buf,
              0x22u);
          }
LABEL_47:

LABEL_107:
          goto LABEL_108;
        }
        v116 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v117 = NFLogGetLogger(v116);
        if (v117)
        {
          v118 = (void (*)(uint64_t, const char *, ...))v117;
          v119 = object_getClass(self);
          v120 = class_isMetaClass(v119);
          v183 = object_getClassName(self);
          v191 = sel_getName(a2);
          v121 = 45;
          if (v120)
            v121 = 43;
          v118(4, "%c[%{public}s %{public}s]:%i Unexpected data type for appId: %@", v121, v183, v191, 103, v15);
        }
        v122 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v123 = NFSharedLogGetLogger(v122);
        v26 = objc_claimAutoreleasedReturnValue(v123);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v124 = object_getClass(self);
          if (class_isMetaClass(v124))
            v125 = 43;
          else
            v125 = 45;
          *(_DWORD *)buf = 67110146;
          v203 = v125;
          v204 = 2082;
          v205 = object_getClassName(self);
          v206 = 2082;
          v207 = sel_getName(a2);
          v208 = 1024;
          v209 = 103;
          v210 = 2112;
          v211 = v15;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected data type for appId: %@", buf, 0x2Cu);
        }
LABEL_46:

        v79 = objc_opt_new(NSString);
        -[NFWalletPresentationSettingsSESD setDefaultAppIdentifier:](self, "setDefaultAppIdentifier:", v79);
        goto LABEL_47;
      }
      v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v18 = NFLogGetLogger(v17);
      if (v18)
      {
        v19 = (void (*)(uint64_t, const char *, ...))v18;
        v20 = object_getClass(self);
        v21 = class_isMetaClass(v20);
        v22 = object_getClassName(self);
        v186 = sel_getName(a2);
        v23 = 45;
        if (v21)
          v23 = 43;
        v19(4, "%c[%{public}s %{public}s]:%i No settings found; init to default empty id", v23, v22, v186, 98);
      }
      v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v25 = NFSharedLogGetLogger(v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        goto LABEL_46;
      v27 = object_getClass(self);
      if (class_isMetaClass(v27))
        v28 = 43;
      else
        v28 = 45;
      *(_DWORD *)buf = 67109890;
      v203 = v28;
      v204 = 2082;
      v205 = object_getClassName(self);
      v206 = 2082;
      v207 = sel_getName(a2);
      v208 = 1024;
      v209 = 98;
      v29 = "%c[%{public}s %{public}s]:%i No settings found; init to default empty id";
      v30 = v26;
      v31 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v69 = NFLogGetLogger(v68);
      if (v69)
      {
        v70 = (void (*)(uint64_t, const char *, ...))v69;
        v71 = object_getClass(self);
        v72 = class_isMetaClass(v71);
        v73 = object_getClassName(self);
        v189 = sel_getName(a2);
        v74 = 45;
        if (v72)
          v74 = 43;
        v70(5, "%c[%{public}s %{public}s]:%i Invalid setting, default to none", v74, v73, v189, 93);
      }
      v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v76 = NFSharedLogGetLogger(v75);
      v26 = objc_claimAutoreleasedReturnValue(v76);
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        goto LABEL_46;
      v77 = object_getClass(self);
      if (class_isMetaClass(v77))
        v78 = 43;
      else
        v78 = 45;
      *(_DWORD *)buf = 67109890;
      v203 = v78;
      v204 = 2082;
      v205 = object_getClassName(self);
      v206 = 2082;
      v207 = sel_getName(a2);
      v208 = 1024;
      v209 = 93;
      v29 = "%c[%{public}s %{public}s]:%i Invalid setting, default to none";
      v30 = v26;
      v31 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl((void *)&_mh_execute_header, v30, v31, v29, buf, 0x22u);
    goto LABEL_46;
  }
  if (off_10032A398 == a6)
  {
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    v32 = objc_opt_class(NSString);
    isKindOfClass = objc_opt_isKindOfClass(v15, v32);
    v34 = objc_opt_class(NSNumber);
    v35 = objc_opt_isKindOfClass(v15, v34);
    v36 = objc_opt_class(NSNull);
    if ((objc_opt_isKindOfClass(v15, v36) & 1) != 0)
    {
      v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v38 = NFLogGetLogger(v37);
      if (v38)
      {
        v39 = (void (*)(uint64_t, const char *, ...))v38;
        v40 = object_getClass(self);
        v41 = class_isMetaClass(v40);
        v42 = object_getClassName(self);
        v187 = sel_getName(a2);
        v43 = 45;
        if (v41)
          v43 = 43;
        v39(4, "%c[%{public}s %{public}s]:%i No settings found; init to default domain", v43, v42, v187, 120);
      }
      v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v45 = NFSharedLogGetLogger(v44);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        goto LABEL_94;
      v47 = object_getClass(self);
      if (class_isMetaClass(v47))
        v48 = 43;
      else
        v48 = 45;
      *(_DWORD *)buf = 67109890;
      v203 = v48;
      v204 = 2082;
      v205 = object_getClassName(self);
      v206 = 2082;
      v207 = sel_getName(a2);
      v208 = 1024;
      v209 = 120;
      v49 = "%c[%{public}s %{public}s]:%i No settings found; init to default domain";
      v50 = v46;
      v51 = 34;
LABEL_93:
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, v49, buf, v51);
LABEL_94:

      -[NFWalletPresentationSettingsSESD setWalletDomain:](self, "setWalletDomain:", 0);
      goto LABEL_107;
    }
    if (((isKindOfClass | v35) & 1) == 0)
    {
      v126 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v127 = NFLogGetLogger(v126);
      if (v127)
      {
        v128 = (void (*)(uint64_t, const char *, ...))v127;
        v129 = object_getClass(self);
        v130 = class_isMetaClass(v129);
        v184 = object_getClassName(self);
        v192 = sel_getName(a2);
        v131 = 45;
        if (v130)
          v131 = 43;
        v128(4, "%c[%{public}s %{public}s]:%i Unexpected data type for domain: %@", v131, v184, v192, 125, v15);
      }
      v132 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v133 = NFSharedLogGetLogger(v132);
      v46 = objc_claimAutoreleasedReturnValue(v133);
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        goto LABEL_94;
      v134 = object_getClass(self);
      if (class_isMetaClass(v134))
        v135 = 43;
      else
        v135 = 45;
      *(_DWORD *)buf = 67110146;
      v203 = v135;
      v204 = 2082;
      v205 = object_getClassName(self);
      v206 = 2082;
      v207 = sel_getName(a2);
      v208 = 1024;
      v209 = 125;
      v210 = 2112;
      v211 = v15;
      v49 = "%c[%{public}s %{public}s]:%i Unexpected data type for domain: %@";
      v50 = v46;
      v51 = 44;
      goto LABEL_93;
    }
    if ((isKindOfClass & 1) != 0)
      v98 = (__CFString *)-[__CFString integerValue](v15, "integerValue");
    else
      v98 = (__CFString *)-[__CFString unsignedIntegerValue](v15, "unsignedIntegerValue");
    v146 = v98;
    v199 = v11;
    if ((unint64_t)v98 >= 5)
    {
      v147 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v148 = NFLogGetLogger(v147);
      if (v148)
      {
        v149 = (void (*)(uint64_t, const char *, ...))v148;
        v150 = object_getClass(self);
        v151 = class_isMetaClass(v150);
        v152 = object_getClassName(self);
        v194 = sel_getName(a2);
        v153 = 45;
        if (v151)
          v153 = 43;
        v149(5, "%c[%{public}s %{public}s]:%i Invalid setting, default to unknown", v153, v152, v194, 133);
      }
      v154 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v155 = NFSharedLogGetLogger(v154);
      v156 = objc_claimAutoreleasedReturnValue(v155);
      if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
      {
        v157 = object_getClass(self);
        if (class_isMetaClass(v157))
          v158 = 43;
        else
          v158 = 45;
        *(_DWORD *)buf = 67109890;
        v203 = v158;
        v204 = 2082;
        v205 = object_getClassName(self);
        v206 = 2082;
        v207 = sel_getName(a2);
        v208 = 1024;
        v209 = 133;
        _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid setting, default to unknown", buf, 0x22u);
      }

      v146 = 0;
    }
    v159 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v160 = NFLogGetLogger(v159);
    if (v160)
    {
      v161 = (void (*)(uint64_t, const char *, ...))v160;
      v162 = object_getClass(self);
      v163 = class_isMetaClass(v162);
      v164 = object_getClassName(self);
      v165 = sel_getName(a2);
      v197 = -[NFWalletPresentationSettingsSESD walletDomain](self, "walletDomain");
      v166 = 43;
      if (!v163)
        v166 = 45;
      v161(6, "%c[%{public}s %{public}s]:%i %@ existing=%{public}lu, new=%{public}lu", v166, v164, v165, 137, CFSTR("domain"), v197, v146);
    }
    v167 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v168 = NFSharedLogGetLogger(v167);
    v169 = objc_claimAutoreleasedReturnValue(v168);
    if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
    {
      v170 = object_getClass(self);
      if (class_isMetaClass(v170))
        v171 = 43;
      else
        v171 = 45;
      v172 = object_getClassName(self);
      v173 = sel_getName(a2);
      v174 = -[NFWalletPresentationSettingsSESD walletDomain](self, "walletDomain");
      *(_DWORD *)buf = 67110658;
      v203 = v171;
      v204 = 2082;
      v205 = v172;
      v206 = 2082;
      v207 = v173;
      v208 = 1024;
      v209 = 137;
      v210 = 2112;
      v211 = CFSTR("domain");
      v212 = 2050;
      *(_QWORD *)v213 = v174;
      *(_WORD *)&v213[8] = 2050;
      v214 = v146;
      _os_log_impl((void *)&_mh_execute_header, v169, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %@ existing=%{public}lu, new=%{public}lu", buf, 0x40u);
    }

    -[NFWalletPresentationSettingsSESD setWalletDomain:](self, "setWalletDomain:", v146);
LABEL_131:

    v11 = v199;
    goto LABEL_108;
  }
  if (off_10032A3A0 == a6)
  {
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    v52 = objc_opt_class(NSNull);
    if ((objc_opt_isKindOfClass(v15, v52) & 1) != 0)
    {
      v53 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v54 = NFLogGetLogger(v53);
      if (v54)
      {
        v55 = (void (*)(uint64_t, const char *, ...))v54;
        v56 = object_getClass(self);
        v57 = class_isMetaClass(v56);
        v58 = object_getClassName(self);
        v188 = sel_getName(a2);
        v59 = 45;
        if (v57)
          v59 = 43;
        v55(4, "%c[%{public}s %{public}s]:%i No settings found; init to default dbl click", v59, v58, v188, 143);
      }
      v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v61 = NFSharedLogGetLogger(v60);
      v62 = objc_claimAutoreleasedReturnValue(v61);
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        goto LABEL_105;
      v63 = object_getClass(self);
      if (class_isMetaClass(v63))
        v64 = 43;
      else
        v64 = 45;
      *(_DWORD *)buf = 67109890;
      v203 = v64;
      v204 = 2082;
      v205 = object_getClassName(self);
      v206 = 2082;
      v207 = sel_getName(a2);
      v208 = 1024;
      v209 = 143;
      v65 = "%c[%{public}s %{public}s]:%i No settings found; init to default dbl click";
      v66 = v62;
      v67 = 34;
    }
    else
    {
      v99 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v15, v99) & 1) != 0)
      {
        v100 = -[__CFString BOOLValue](v15, "BOOLValue");
        v101 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v102 = NFLogGetLogger(v101);
        if (v102)
        {
          v103 = (void (*)(uint64_t, const char *, ...))v102;
          v104 = object_getClass(self);
          v105 = class_isMetaClass(v104);
          v200 = object_getClassName(self);
          v106 = v11;
          v107 = sel_getName(a2);
          v196 = -[NFWalletPresentationSettingsSESD doubleClickEnable](self, "doubleClickEnable");
          v190 = v107;
          v11 = v106;
          v108 = 45;
          if (v105)
            v108 = 43;
          v103(6, "%c[%{public}s %{public}s]:%i %@ existing=%{public}d, new=%{public}d", v108, v200, v190, 155, CFSTR("doubleClickEnabled"), v196, v100);
        }
        v109 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v110 = NFSharedLogGetLogger(v109);
        v111 = objc_claimAutoreleasedReturnValue(v110);
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          v112 = object_getClass(self);
          if (class_isMetaClass(v112))
            v113 = 43;
          else
            v113 = 45;
          *(_DWORD *)buf = 67110658;
          v203 = v113;
          v204 = 2082;
          v205 = object_getClassName(self);
          v206 = 2082;
          v207 = sel_getName(a2);
          v208 = 1024;
          v209 = 155;
          v210 = 2112;
          v211 = CFSTR("doubleClickEnabled");
          v212 = 1026;
          *(_DWORD *)v213 = -[NFWalletPresentationSettingsSESD doubleClickEnable](self, "doubleClickEnable");
          *(_WORD *)&v213[4] = 1026;
          *(_DWORD *)&v213[6] = (_DWORD)v100;
          _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %@ existing=%{public}d, new=%{public}d", buf, 0x38u);
        }

        v114 = self;
        v115 = v100;
        goto LABEL_106;
      }
      v136 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v137 = NFLogGetLogger(v136);
      if (v137)
      {
        v138 = (void (*)(uint64_t, const char *, ...))v137;
        v139 = object_getClass(self);
        v140 = class_isMetaClass(v139);
        v185 = object_getClassName(self);
        v193 = sel_getName(a2);
        v141 = 45;
        if (v140)
          v141 = 43;
        v138(4, "%c[%{public}s %{public}s]:%i Unexpected data type for dbl click: %@", v141, v185, v193, 148, v15);
      }
      v142 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v143 = NFSharedLogGetLogger(v142);
      v62 = objc_claimAutoreleasedReturnValue(v143);
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
LABEL_105:

        v114 = self;
        v115 = 0;
LABEL_106:
        -[NFWalletPresentationSettingsSESD setDoubleClickEnable:](v114, "setDoubleClickEnable:", v115);
        goto LABEL_107;
      }
      v144 = object_getClass(self);
      if (class_isMetaClass(v144))
        v145 = 43;
      else
        v145 = 45;
      *(_DWORD *)buf = 67110146;
      v203 = v145;
      v204 = 2082;
      v205 = object_getClassName(self);
      v206 = 2082;
      v207 = sel_getName(a2);
      v208 = 1024;
      v209 = 148;
      v210 = 2112;
      v211 = v15;
      v65 = "%c[%{public}s %{public}s]:%i Unexpected data type for dbl click: %@";
      v66 = v62;
      v67 = 44;
    }
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, v65, buf, v67);
    goto LABEL_105;
  }
  v201.receiver = self;
  v201.super_class = (Class)NFWalletPresentationSettingsSESD;
  -[NFWalletPresentationSettingsSESD observeValueForKeyPath:ofObject:change:context:](&v201, "observeValueForKeyPath:ofObject:change:context:", v11, v12, v13, a6);
LABEL_108:

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
  v9.super_class = (Class)&OBJC_METACLASS___NFWalletPresentationSettingsSESD;
  v3 = a3;
  v4 = objc_msgSendSuper2(&v9, "keyPathsForValuesAffectingValueForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("isEligibleForDoubleClick"), v9.receiver, v9.super_class);

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setByAddingObjectsFromArray:", &off_100305FE0));

    v5 = (void *)v7;
  }
  return v5;
}

- (void)setDefaultAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAppIdentifier, a3);
}

- (unint64_t)walletDomain
{
  return self->_walletDomain;
}

- (void)setWalletDomain:(unint64_t)a3
{
  self->_walletDomain = a3;
}

- (BOOL)doubleClickEnable
{
  return self->_doubleClickEnable;
}

- (void)setDoubleClickEnable:(BOOL)a3
{
  self->_doubleClickEnable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAppIdentifier, 0);
}

@end
