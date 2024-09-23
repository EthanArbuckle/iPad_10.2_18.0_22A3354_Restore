@implementation NFFieldNotificationECP2_0

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 odaRequired;
  id v5;
  objc_super v6;

  odaRequired = self->_odaRequired;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", odaRequired, CFSTR("odaRequired"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_terminalMode, CFSTR("terminalMode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_terminalType, CFSTR("terminalType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_terminalSubType, CFSTR("terminalSubType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tciArray, CFSTR("tciArray"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_openLoopSchemeBitfield, CFSTR("openLoopSchemeBitfield"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeKitSchemeDataPayload, CFSTR("homeKitSchemeDataPayload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_readerIdentifier, CFSTR("readerIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pairingMode, CFSTR("pairingMode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ignoreRFTechOnIsEqual, CFSTR("ignoreRFTechOnIsEqual"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("userInfo"));
  v6.receiver = self;
  v6.super_class = (Class)NFFieldNotificationECP2_0;
  -[NFFieldNotification encodeWithCoder:](&v6, "encodeWithCoder:", v5);

}

- (NFFieldNotificationECP2_0)initWithCoder:(id)a3
{
  id v4;
  NFFieldNotificationECP2_0 *v5;
  id v6;
  uint64_t v7;
  NSArray *tciArray;
  id v9;
  uint64_t v10;
  NSData *openLoopSchemeBitfield;
  id v12;
  uint64_t v13;
  NSData *homeKitSchemeDataPayload;
  id v15;
  uint64_t v16;
  NSData *readerIdentifier;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  NSMutableDictionary *userInfo;
  uint64_t v29;
  id v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)NFFieldNotificationECP2_0;
  v5 = -[NFFieldNotification initWithCoder:](&v31, "initWithCoder:", v4);
  if (v5)
  {
    v5->_odaRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("odaRequired"));
    v5->_terminalMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("terminalMode"));
    v5->_terminalType = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("terminalType"));
    v5->_terminalSubType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("terminalSubType"));
    v6 = +[NFNSCheckedDecoder coder:decodeArrayOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(NSData), CFSTR("tciArray"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    tciArray = v5->_tciArray;
    v5->_tciArray = (NSArray *)v7;

    v9 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(NSData), 0);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("openLoopSchemeBitfield")));
    openLoopSchemeBitfield = v5->_openLoopSchemeBitfield;
    v5->_openLoopSchemeBitfield = (NSData *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("homeKitSchemeDataPayload"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    homeKitSchemeDataPayload = v5->_homeKitSchemeDataPayload;
    v5->_homeKitSchemeDataPayload = (NSData *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("readerIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v16;

    v5->_pairingMode = objc_msgSend(v4, "decodeIntForKey:", CFSTR("pairingMode"));
    v5->_ignoreRFTechOnIsEqual = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreRFTechOnIsEqual"));
    v30 = objc_alloc((Class)NSSet);
    v29 = objc_opt_class(NSString);
    v18 = objc_opt_class(NSMutableString);
    v19 = objc_opt_class(NSNumber);
    v20 = objc_opt_class(NSData);
    v21 = objc_opt_class(NSMutableData);
    v22 = objc_opt_class(NSArray);
    v23 = objc_opt_class(NSMutableArray);
    v24 = objc_opt_class(NSDictionary);
    v25 = objc_msgSend(v30, "initWithObjects:", v29, v18, v19, v20, v21, v22, v23, v24, objc_opt_class(NSMutableDictionary), 0);
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("userInfo")));
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSMutableDictionary *)v26;

  }
  return v5;
}

- (NFFieldNotificationECP2_0)initWithDictionary:(id)a3
{
  id v5;
  NFFieldNotificationECP2_0 *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *v11;
  _BOOL4 v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  const char *v22;
  id v23;
  unsigned __int8 *v24;
  unsigned int v25;
  _BYTE *v26;
  void *v27;
  unint64_t terminalType;
  unsigned int v29;
  void *specific;
  uint64_t Logger;
  void (*v32)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  objc_class *v39;
  int v40;
  const char *v41;
  const char *v42;
  NFFieldNotificationECP2_0 *v43;
  void *v44;
  uint64_t v45;
  NSArray *tciArray;
  void *v47;
  void *v48;
  NSMutableDictionary *v49;
  NSMutableDictionary *userInfo;
  NSData *openLoopSchemeBitfield;
  NSData *homeKitSchemeDataPayload;
  unint64_t v53;
  uint64_t v54;
  NSObject *p_super;
  void *v56;
  uint64_t v57;
  void (*v58)(uint64_t, const char *, ...);
  objc_class *v59;
  _BOOL4 v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  objc_class *v66;
  int v67;
  const char *v68;
  const char *v69;
  id v70;
  const char *v71;
  NSObject *v72;
  uint32_t v73;
  NSData *v74;
  NSData *v75;
  unsigned int terminalSubType;
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
  uint64_t v90;
  NSData *v91;
  uint64_t v92;
  NSObject *v93;
  unsigned __int8 *v94;
  void *v96;
  uint64_t v97;
  void (*v98)(uint64_t, const char *, ...);
  objc_class *v99;
  _BOOL4 v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  NSObject *v105;
  objc_class *v106;
  int v107;
  const char *v108;
  const char *v109;
  void *v110;
  uint64_t v111;
  void (*v112)(uint64_t, const char *, ...);
  objc_class *v113;
  _BOOL4 v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  objc_class *v119;
  int v120;
  const char *v121;
  const char *v122;
  const char *v124;
  const char *Name;
  const char *v126;
  const char *v127;
  const char *v128;
  id v129;
  objc_super v130;
  uint8_t buf[4];
  int v132;
  __int16 v133;
  const char *v134;
  __int16 v135;
  const char *v136;
  __int16 v137;
  int v138;
  __int16 v139;
  id v140;
  void *v141;

  v5 = a3;
  v130.receiver = self;
  v130.super_class = (Class)NFFieldNotificationECP2_0;
  v6 = -[NFFieldNotification initWithDictionary:](&v130, "initWithDictionary:", v5);
  if (!v6)
    goto LABEL_101;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("ECPData")));
  if ((unint64_t)objc_msgSend(v7, "length") > 4)
  {
    -[NFFieldNotification setNotificationType:](v6, "setNotificationType:", 3);
    v23 = objc_retainAutorelease(v7);
    v24 = (unsigned __int8 *)objc_msgSend(v23, "bytes");
    v25 = v24[2];
    v26 = (_BYTE *)(v25 & 0xF);
    if ((char *)objc_msgSend(v23, "length") - 5 != v26)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v32 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v6);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v6);
        Name = sel_getName(a2);
        v36 = 45;
        if (isMetaClass)
          v36 = 43;
        v32(4, "%c[%{public}s %{public}s]:%i Invalid terminal type data length", v36, ClassName, Name, 532);
      }
      v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v38 = NFSharedLogGetLogger(v37);
      v17 = objc_claimAutoreleasedReturnValue(v38);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      v39 = object_getClass(v6);
      if (class_isMetaClass(v39))
        v40 = 43;
      else
        v40 = 45;
      v41 = object_getClassName(v6);
      v42 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v132 = v40;
      v133 = 2082;
      v134 = v41;
      v135 = 2082;
      v136 = v42;
      v137 = 1024;
      v138 = 532;
      v22 = "%c[%{public}s %{public}s]:%i Invalid terminal type data length";
      goto LABEL_25;
    }
    v6->_odaRequired = (v25 & 0x40) == 0;
    v6->_terminalType = v24[3];
    v6->_terminalMode = (v25 >> 5) & 4;
    v6->_terminalSubType = v24[4];
    v6->_pairingMode = 0;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("IgnoreRFTechOnIsEqual")));
    v6->_ignoreRFTechOnIsEqual = objc_msgSend(v27, "BOOLValue");

    -[NFFieldNotificationECP2_0 _initCategoryWithType:](v6, "_initCategoryWithType:", v6->_terminalType);
    terminalType = v6->_terminalType;
    if (terminalType == 2)
    {
      if ((v6->_terminalSubType - 8) > 3u)
        v29 = 0;
      else
        v29 = dword_10026ABC0[(char)(v6->_terminalSubType - 8)];
      v6->_pairingMode = v29;
      terminalType = v6->_terminalType;
    }
    if (terminalType > 2 || v26 < 3)
    {
      if (!(_DWORD)v26)
        goto LABEL_38;
    }
    else
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "subdataWithRange:", 5, 3));
      v141 = v44;
      v45 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v141, 1));
      tciArray = v6->_tciArray;
      v6->_tciArray = (NSArray *)v45;

      terminalType = v6->_terminalType;
    }
    if (terminalType == 5 && !v6->_terminalSubType)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "subdataWithRange:", 5, v26));
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 _parseCHTerminalTypeData:](v6, "_parseCHTerminalTypeData:", v47));

      if (objc_msgSend(v48, "count"))
      {
        v49 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v48);
        userInfo = v6->_userInfo;
        v6->_userInfo = v49;

      }
    }
LABEL_38:
    openLoopSchemeBitfield = v6->_openLoopSchemeBitfield;
    v6->_openLoopSchemeBitfield = 0;

    homeKitSchemeDataPayload = v6->_homeKitSchemeDataPayload;
    v6->_homeKitSchemeDataPayload = 0;

    v53 = v6->_terminalType;
    if (v53 == 1)
    {
      if (objc_msgSend(v23, "length") == (id)13)
      {
        v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "subdataWithRange:", 8, 5));
        p_super = &v6->_openLoopSchemeBitfield->super;
        v6->_openLoopSchemeBitfield = (NSData *)v54;
        goto LABEL_99;
      }
      v53 = v6->_terminalType;
    }
    if (v53 == 2 && v6->_terminalSubType == 4)
    {
      if ((unint64_t)objc_msgSend(v23, "length") <= 0xF)
      {
        v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v57 = NFLogGetLogger(v56);
        if (v57)
        {
          v58 = (void (*)(uint64_t, const char *, ...))v57;
          v59 = object_getClass(v6);
          v60 = class_isMetaClass(v59);
          v61 = object_getClassName(v6);
          v62 = sel_getName(a2);
          v129 = objc_msgSend(v23, "length");
          v63 = 45;
          if (v60)
            v63 = 43;
          v58(4, "%c[%{public}s %{public}s]:%i Invalid data length %lu", v63, v61, v62, 591, v129);
        }
        v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v65 = NFSharedLogGetLogger(v64);
        p_super = objc_claimAutoreleasedReturnValue(v65);
        if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          goto LABEL_99;
        v66 = object_getClass(v6);
        if (class_isMetaClass(v66))
          v67 = 43;
        else
          v67 = 45;
        v68 = object_getClassName(v6);
        v69 = sel_getName(a2);
        v70 = objc_msgSend(v23, "length");
        *(_DWORD *)buf = 67110146;
        v132 = v67;
        v133 = 2082;
        v134 = v68;
        v135 = 2082;
        v136 = v69;
        v137 = 1024;
        v138 = 591;
        v139 = 2048;
        v140 = v70;
        v71 = "%c[%{public}s %{public}s]:%i Invalid data length %lu";
        v72 = p_super;
        v73 = 44;
        goto LABEL_98;
      }
      v90 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "subdataWithRange:", 2, 14));
      v91 = v6->_homeKitSchemeDataPayload;
      v6->_homeKitSchemeDataPayload = (NSData *)v90;

      if ((_DWORD)v26 == 11)
      {
LABEL_68:
        v92 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "subdataWithRange:", 8, 8));
        p_super = &v6->_readerIdentifier->super;
        v6->_readerIdentifier = (NSData *)v92;
        goto LABEL_99;
      }
      v110 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v111 = NFLogGetLogger(v110);
      if (v111)
      {
        v112 = (void (*)(uint64_t, const char *, ...))v111;
        v113 = object_getClass(v6);
        v114 = class_isMetaClass(v113);
        v115 = object_getClassName(v6);
        v128 = sel_getName(a2);
        v116 = 45;
        if (v114)
          v116 = 43;
        v112(4, "%c[%{public}s %{public}s]:%i Expected reader identifier but ECP frame does not contain it.", v116, v115, v128, 601);
      }
      v117 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v118 = NFSharedLogGetLogger(v117);
      p_super = objc_claimAutoreleasedReturnValue(v118);
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        goto LABEL_99;
      v119 = object_getClass(v6);
      if (class_isMetaClass(v119))
        v120 = 43;
      else
        v120 = 45;
      v121 = object_getClassName(v6);
      v122 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v132 = v120;
      v133 = 2082;
      v134 = v121;
      v135 = 2082;
      v136 = v122;
      v137 = 1024;
      v138 = 601;
      v71 = "%c[%{public}s %{public}s]:%i Expected reader identifier but ECP frame does not contain it.";
    }
    else
    {
      v74 = objc_opt_new(NSData);
      v75 = v6->_openLoopSchemeBitfield;
      v6->_openLoopSchemeBitfield = v74;

      if (v6->_terminalType != 2)
        goto LABEL_100;
      terminalSubType = v6->_terminalSubType;
      if (terminalSubType > 0xB)
        goto LABEL_100;
      if (((1 << terminalSubType) & 0xCF0) == 0)
      {
        if (terminalSubType != 1 || !-[NSArray count](v6->_tciArray, "count"))
          goto LABEL_100;
        v93 = objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v6->_tciArray, "objectAtIndexedSubscript:", 0));
        p_super = v93;
        if (v93 && (unint64_t)-[NSObject length](v93, "length") >= 3)
        {
          p_super = objc_retainAutorelease(p_super);
          v94 = (unsigned __int8 *)-[NSObject bytes](p_super, "bytes");
          if (*(_WORD *)v94 == 3841 && v94[2] == 255)
          {
            v96 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v97 = NFLogGetLogger(v96);
            if (v97)
            {
              v98 = (void (*)(uint64_t, const char *, ...))v97;
              v99 = object_getClass(v6);
              v100 = class_isMetaClass(v99);
              v101 = object_getClassName(v6);
              v127 = sel_getName(a2);
              v102 = 45;
              if (v100)
                v102 = 43;
              v98(6, "%c[%{public}s %{public}s]:%i Charger TCI detected", v102, v101, v127, 629);
            }
            v103 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v104 = NFSharedLogGetLogger(v103);
            v105 = objc_claimAutoreleasedReturnValue(v104);
            if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
            {
              v106 = object_getClass(v6);
              if (class_isMetaClass(v106))
                v107 = 43;
              else
                v107 = 45;
              v108 = object_getClassName(v6);
              v109 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              v132 = v107;
              v133 = 2082;
              v134 = v108;
              v135 = 2082;
              v136 = v109;
              v137 = 1024;
              v138 = 629;
              _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Charger TCI detected", buf, 0x22u);
            }

            v6->_terminalType = 0;
            v6->_terminalSubType = 1;
            -[NFFieldNotification setCategory:](v6, "setCategory:", 5);
          }
        }
LABEL_99:

LABEL_100:
LABEL_101:
        v43 = v6;
        goto LABEL_102;
      }
      if ((_DWORD)v26 == 11)
        goto LABEL_68;
      v77 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v78 = NFLogGetLogger(v77);
      if (v78)
      {
        v79 = (void (*)(uint64_t, const char *, ...))v78;
        v80 = object_getClass(v6);
        v81 = class_isMetaClass(v80);
        v82 = object_getClassName(v6);
        v126 = sel_getName(a2);
        v83 = 45;
        if (v81)
          v83 = 43;
        v79(4, "%c[%{public}s %{public}s]:%i Expected reader identifier but ECP frame does not contain it.", v83, v82, v126, 621);
      }
      v84 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v85 = NFSharedLogGetLogger(v84);
      p_super = objc_claimAutoreleasedReturnValue(v85);
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        goto LABEL_99;
      v86 = object_getClass(v6);
      if (class_isMetaClass(v86))
        v87 = 43;
      else
        v87 = 45;
      v88 = object_getClassName(v6);
      v89 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v132 = v87;
      v133 = 2082;
      v134 = v88;
      v135 = 2082;
      v136 = v89;
      v137 = 1024;
      v138 = 621;
      v71 = "%c[%{public}s %{public}s]:%i Expected reader identifier but ECP frame does not contain it.";
    }
    v72 = p_super;
    v73 = 34;
LABEL_98:
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, v71, buf, v73);
    goto LABEL_99;
  }
  v8 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v9 = NFLogGetLogger(v8);
  if (v9)
  {
    v10 = (void (*)(uint64_t, const char *, ...))v9;
    v11 = object_getClass(v6);
    v12 = class_isMetaClass(v11);
    v13 = object_getClassName(v6);
    v124 = sel_getName(a2);
    v14 = 45;
    if (v12)
      v14 = 43;
    v10(4, "%c[%{public}s %{public}s]:%i Frame packet length shorter than expected", v14, v13, v124, 505);
  }
  v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v16 = NFSharedLogGetLogger(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    goto LABEL_26;
  v18 = object_getClass(v6);
  if (class_isMetaClass(v18))
    v19 = 43;
  else
    v19 = 45;
  v20 = object_getClassName(v6);
  v21 = sel_getName(a2);
  *(_DWORD *)buf = 67109890;
  v132 = v19;
  v133 = 2082;
  v134 = v20;
  v135 = 2082;
  v136 = v21;
  v137 = 1024;
  v138 = 505;
  v22 = "%c[%{public}s %{public}s]:%i Frame packet length shorter than expected";
LABEL_25:
  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v22, buf, 0x22u);
LABEL_26:

  v43 = 0;
LABEL_102:

  return v43;
}

- (NFFieldNotificationECP2_0)initWithNotificationType:(unint64_t)a3 rfTechnology:(unsigned int)a4 typeFSystemCode:(unsigned __int16)a5 creationDate:(id)a6 cachedBeforeRFReset:(BOOL)a7 odaRequired:(BOOL)a8 terminalMode:(unsigned int)a9 terminalType:(unint64_t)a10 terminalSubType:(unsigned __int8)a11 tciArray:(id)a12 openLoopSchemeBitfield:(id)a13 homeKitSchemeDataPayload:(id)a14 readerIdentifier:(id)a15 pairingMode:(unsigned int)a16 terminalTypeData:(id)a17 ignoreRFTechOnIsEqual:(BOOL)a18 userInfo:(id)a19
{
  uint64_t v19;
  uint64_t v20;
  id v23;
  id v24;
  NFFieldNotificationECP2_0 *v25;
  NFFieldNotificationECP2_0 *v26;
  NFFieldNotificationECP2_0 *v27;
  _BOOL4 v31;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v31 = a7;
  v19 = a5;
  v20 = *(_QWORD *)&a4;
  v35 = a12;
  v34 = a13;
  v33 = a14;
  v32 = a15;
  v23 = a17;
  v24 = a19;
  v36.receiver = self;
  v36.super_class = (Class)NFFieldNotificationECP2_0;
  v25 = -[NFFieldNotification initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:](&v36, "initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:", a3, v20, v19, a6, v31);
  v26 = v25;
  if (v25)
  {
    v25->_odaRequired = a8;
    v25->_terminalMode = a9;
    v25->_terminalType = a10;
    v25->_terminalSubType = a11;
    objc_storeStrong((id *)&v25->_tciArray, a12);
    objc_storeStrong((id *)&v26->_openLoopSchemeBitfield, a13);
    objc_storeStrong((id *)&v26->_homeKitSchemeDataPayload, a14);
    objc_storeStrong((id *)&v26->_readerIdentifier, a15);
    v26->_pairingMode = a16;
    objc_storeStrong((id *)&v26->_terminalTypeData, a17);
    v26->_ignoreRFTechOnIsEqual = a18;
    objc_storeStrong((id *)&v26->_userInfo, a19);
    -[NFFieldNotificationECP2_0 _initCategoryWithType:](v26, "_initCategoryWithType:", a10);
    v27 = v26;
  }

  return v26;
}

- (void)_initCategoryWithType:(unint64_t)a3
{
  unint64_t v3;

  if (a3 - 1 >= 5)
    v3 = 0;
  else
    v3 = a3 + 3;
  -[NFFieldNotification setCategory:](self, "setCategory:", v3);
}

- (id)description
{
  NSMutableString *v3;
  id v4;
  const char *ClassName;
  _BOOL8 odaRequired;
  uint64_t terminalMode;
  unint64_t terminalType;
  uint64_t terminalSubType;
  NSMutableDictionary *v10;
  const __CFString *v11;
  unsigned int v12;
  _BOOL8 v13;
  unint64_t v14;
  unint64_t v15;
  NSArray *v16;
  NSArray *tciArray;
  NSData *openLoopSchemeBitfield;
  const __CFString *v19;
  const char *v20;
  unsigned int v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  NSArray *v25;
  NSData *homeKitSchemeDataPayload;
  unsigned int v27;
  _BOOL8 v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  NSData *v32;
  void *v33;
  id v34;
  uint64_t pairingMode;
  const __CFString *v36;
  _BOOL8 v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSMutableDictionary *userInfo;
  id v42;
  _BOOL8 v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  NSArray *v47;
  NSData *readerIdentifier;
  const char *v50;
  NSMutableString *v51;
  _BOOL8 v52;
  uint64_t v53;
  uint64_t v54;
  _BOOL8 v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  NSMutableDictionary *v60;
  NSArray *v61;
  unint64_t v62;
  void *v63;
  uint64_t v64;
  NSData *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  const __CFString *v71;
  id v72;
  id v73;

  v3 = objc_opt_new(NSMutableString);
  if ((-[NFFieldNotification rfTechnology](self, "rfTechnology") & 1) != 0)
    -[NSMutableString appendString:](v3, "appendString:", CFSTR("A,"));
  if ((-[NFFieldNotification rfTechnology](self, "rfTechnology") & 2) != 0)
    -[NSMutableString appendString:](v3, "appendString:", CFSTR("B,"));
  if ((-[NFFieldNotification rfTechnology](self, "rfTechnology") & 4) != 0)
    -[NSMutableString appendString:](v3, "appendString:", CFSTR("F,"));
  if ((-[NFFieldNotification rfTechnology](self, "rfTechnology") & 0x10) != 0)
    -[NSMutableString appendString:](v3, "appendString:", CFSTR("V,"));
  if ((-[NFFieldNotification rfTechnology](self, "rfTechnology") & 8) != 0)
    -[NSMutableString appendString:](v3, "appendString:", CFSTR("ECP,"));
  if (!-[NSMutableString length](v3, "length"))
    -[NSMutableString appendString:](v3, "appendString:", CFSTR("None"));
  switch(self->_terminalType)
  {
    case 0uLL:
      v4 = objc_alloc((Class)NSString);
      ClassName = object_getClassName(self);
      odaRequired = self->_odaRequired;
      terminalMode = self->_terminalMode;
      terminalType = self->_terminalType;
      terminalSubType = self->_terminalSubType;
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification _creationDateString](self, "_creationDateString"));
      v60 = v10;
      v62 = -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset");
      v56 = terminalType;
      v58 = terminalSubType;
      v52 = odaRequired;
      v54 = terminalMode;
      v11 = CFSTR("<%s: tech=[%@], oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, date=%@, cached=%d>");
      goto LABEL_23;
    case 1uLL:
      v72 = objc_alloc((Class)NSString);
      v69 = object_getClassName(self);
      v12 = -[NFFieldNotification typeFSystemCode](self, "typeFSystemCode");
      v13 = self->_odaRequired;
      v14 = self->_terminalMode;
      v15 = self->_terminalType;
      v16 = (NSArray *)self->_terminalSubType;
      tciArray = self->_tciArray;
      openLoopSchemeBitfield = self->_openLoopSchemeBitfield;
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification _creationDateString](self, "_creationDateString"));
      v67 = (unint64_t)v10;
      v68 = -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset");
      v63 = tciArray;
      v65 = openLoopSchemeBitfield;
      v59 = v15;
      v61 = v16;
      v55 = v13;
      v57 = v14;
      v51 = v3;
      v53 = v12;
      v19 = CFSTR("<%s: tech=[%@] sc=0x%X, oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, tcis=%@, openLoop=%@, date=%@, cached=%d>");
      v50 = v69;
      goto LABEL_27;
    case 2uLL:
      if (self->_terminalSubType == 4)
      {
        v72 = objc_alloc((Class)NSString);
        v20 = object_getClassName(self);
        v21 = -[NFFieldNotification typeFSystemCode](self, "typeFSystemCode");
        v22 = self->_odaRequired;
        v23 = self->_terminalMode;
        v24 = self->_terminalType;
        v25 = (NSArray *)self->_terminalSubType;
        homeKitSchemeDataPayload = self->_homeKitSchemeDataPayload;
        v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification _creationDateString](self, "_creationDateString"));
        v65 = (NSData *)v10;
        v67 = -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset");
        v61 = v25;
        v63 = homeKitSchemeDataPayload;
        v57 = v23;
        v59 = v24;
        v53 = v21;
        v55 = v22;
        v19 = CFSTR("<%s: tech=%@ sc=0x%X, oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, homeKitPayload=%@, date=%@, cached=%d>");
      }
      else
      {
        pairingMode = (int)self->_pairingMode;
        if (pairingMode > 2)
          v36 = &stru_1002ED8A8;
        else
          v36 = *(&off_1002EC430 + pairingMode);
        v71 = v36;
        v72 = objc_alloc((Class)NSString);
        v20 = object_getClassName(self);
        v43 = self->_odaRequired;
        v44 = self->_terminalMode;
        v45 = self->_terminalType;
        v46 = self->_terminalSubType;
        v47 = self->_tciArray;
        readerIdentifier = self->_readerIdentifier;
        v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification _creationDateString](self, "_creationDateString"));
        v67 = (unint64_t)v10;
        v68 = -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset");
        v63 = (void *)v71;
        v65 = readerIdentifier;
        v59 = v46;
        v61 = v47;
        v55 = v44;
        v57 = v45;
        v53 = v43;
        v19 = CFSTR("<%s: tech=[%@], oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, tcis=%@, pairingMode=%@ readerIdentifier=%@, date=%@, cached=%d>");
      }
      v50 = v20;
      v51 = v3;
LABEL_27:
      v42 = objc_msgSend(v72, "initWithFormat:", v19, v50, v51, v53, v55, v57, v59, v61, v63, v65, v67, v68);
      goto LABEL_28;
    case 5uLL:
      if (self->_terminalSubType)
        goto LABEL_19;
      v4 = objc_alloc((Class)NSString);
      ClassName = object_getClassName(self);
      v37 = self->_odaRequired;
      v38 = self->_terminalMode;
      v39 = self->_terminalType;
      v40 = self->_terminalSubType;
      userInfo = self->_userInfo;
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification _creationDateString](self, "_creationDateString"));
      v62 = (unint64_t)v10;
      v64 = -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset");
      v58 = v40;
      v60 = userInfo;
      v54 = v38;
      v56 = v39;
      v52 = v37;
      v11 = CFSTR("<%s: tech=[%@], oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, userInfo=%@, date=%@, cached=%d>");
LABEL_23:
      v42 = objc_msgSend(v4, "initWithFormat:", v11, ClassName, v3, v52, v54, v56, v58, v60, v62, v64, v66, v68);
LABEL_28:
      v34 = v42;
      break;
    default:
LABEL_19:
      v73 = objc_alloc((Class)NSString);
      v70 = object_getClassName(self);
      v27 = -[NFFieldNotification typeFSystemCode](self, "typeFSystemCode");
      v28 = self->_odaRequired;
      v29 = self->_terminalMode;
      v30 = self->_terminalType;
      v31 = self->_terminalSubType;
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSData debugDescription](self->_terminalTypeData, "debugDescription"));
      v32 = self->_readerIdentifier;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification _creationDateString](self, "_creationDateString"));
      v34 = objc_msgSend(v73, "initWithFormat:", CFSTR("<%s: tech=[%@] sc=0x%X, oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, terminalTypeData=%@, readerIdentifier=%@, date=%@, cached=%d>"), v70, v3, v27, v28, v29, v30, v31, v10, v32, v33, -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset"));

      break;
  }

  return v34;
}

- (BOOL)isEqual:(id)a3
{
  NFFieldNotificationECP2_0 *v5;
  uint64_t v6;
  NFFieldNotificationECP2_0 *v7;
  unsigned int v8;
  id v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  BOOL v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  unsigned int v36;
  unsigned int v37;
  unsigned __int8 v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  unsigned int v46;
  unsigned __int8 v47;
  void *specific;
  uint64_t Logger;
  void (*v51)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  objc_class *v59;
  int v60;
  const char *Name;
  objc_super v62;
  objc_super v63;
  uint8_t buf[4];
  int v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  int v71;

  v5 = (NFFieldNotificationECP2_0 *)a3;
  if (v5 == self)
  {
    v20 = 1;
  }
  else
  {
    v6 = objc_opt_class(NFFieldNotificationECP2_0);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = -[NFFieldNotificationECP2_0 odaRequired](v7, "odaRequired");
      if (v8 != -[NFFieldNotificationECP2_0 odaRequired](self, "odaRequired"))
        goto LABEL_47;
      v9 = -[NFFieldNotificationECP2_0 terminalType](v7, "terminalType");
      if (v9 != (id)-[NFFieldNotificationECP2_0 terminalType](self, "terminalType"))
        goto LABEL_47;
      v10 = -[NFFieldNotificationECP2_0 terminalSubType](v7, "terminalSubType");
      if (v10 != -[NFFieldNotificationECP2_0 terminalSubType](self, "terminalSubType"))
        goto LABEL_47;
      v11 = -[NFFieldNotificationECP2_0 terminalMode](v7, "terminalMode");
      if (v11 != -[NFFieldNotificationECP2_0 terminalMode](self, "terminalMode"))
        goto LABEL_47;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 tciArray](v7, "tciArray"));
      v13 = objc_msgSend(v12, "count");
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 tciArray](self, "tciArray"));
      v15 = objc_msgSend(v14, "count");

      if (v13 != v15)
        goto LABEL_47;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 tciArray](v7, "tciArray"));
      if (objc_msgSend(v16, "count"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 tciArray](v7, "tciArray"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 tciArray](self, "tciArray"));
        v19 = objc_msgSend(v17, "isEqualToArray:", v18);

        if (!v19)
          goto LABEL_47;
      }
      else
      {

      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 openLoopSchemeBitfield](v7, "openLoopSchemeBitfield"));
      v22 = objc_msgSend(v21, "length");
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 openLoopSchemeBitfield](self, "openLoopSchemeBitfield"));
      v24 = objc_msgSend(v23, "length");

      if (v22 != v24)
        goto LABEL_47;
      v25 = objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 openLoopSchemeBitfield](v7, "openLoopSchemeBitfield"));
      if (v25)
      {
        v26 = (void *)v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 openLoopSchemeBitfield](v7, "openLoopSchemeBitfield"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 openLoopSchemeBitfield](self, "openLoopSchemeBitfield"));
        v29 = objc_msgSend(v27, "isEqualToData:", v28);

        if (!v29)
          goto LABEL_47;
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 readerIdentifier](v7, "readerIdentifier"));
      v31 = objc_msgSend(v30, "length");
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 readerIdentifier](self, "readerIdentifier"));
      v33 = objc_msgSend(v32, "length");

      if (v31 != v33)
        goto LABEL_47;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 readerIdentifier](v7, "readerIdentifier"));
      if (objc_msgSend(v34, "length"))
      {
        v31 = (id)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 readerIdentifier](v7, "readerIdentifier"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 readerIdentifier](self, "readerIdentifier"));
        v36 = objc_msgSend(v31, "isEqualToData:", v35);

        if (!v36)
          goto LABEL_47;
      }
      else
      {

      }
      v37 = -[NFFieldNotificationECP2_0 pairingMode](v7, "pairingMode");
      if (v37 != -[NFFieldNotificationECP2_0 pairingMode](self, "pairingMode"))
      {
LABEL_47:
        v20 = 0;
LABEL_48:

        goto LABEL_49;
      }
      if ((id)-[NFFieldNotificationECP2_0 terminalType](self, "terminalType") != (id)5
        || -[NFFieldNotificationECP2_0 terminalSubType](self, "terminalSubType"))
      {
LABEL_25:
        if (-[NFFieldNotificationECP2_0 ignoreRFTechOnIsEqual](self, "ignoreRFTechOnIsEqual"))
        {
          v63.receiver = self;
          v63.super_class = (Class)NFFieldNotificationECP2_0;
          v38 = -[NFFieldNotification isEqualWithoutRFTech:](&v63, "isEqualWithoutRFTech:", v7);
        }
        else
        {
          v62.receiver = self;
          v62.super_class = (Class)NFFieldNotificationECP2_0;
          v38 = -[NFFieldNotification isEqual:](&v62, "isEqual:", v7);
        }
        v20 = v38;
        goto LABEL_48;
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 userInfo](self, "userInfo"));
      v40 = objc_msgSend(v39, "count");
      if (v40
        || (v31 = (id)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 userInfo](v7, "userInfo")),
            !objc_msgSend(v31, "count")))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 userInfo](self, "userInfo"));
        if (objc_msgSend(v41, "count"))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 userInfo](v7, "userInfo"));
          v43 = objc_msgSend(v42, "count");

          if (!v40)
          if (!v43)
            goto LABEL_47;
        }
        else
        {

          if (!v40)
        }
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 userInfo](v7, "userInfo"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKey:", CFSTR("CHCfgBytes")));

        v45 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotificationECP2_0 userInfo](self, "userInfo"));
        v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKey:", CFSTR("CHCfgBytes")));

        if ((v39 || !v31) && (!v39 || v31))
        {
          v46 = objc_msgSend(v39, "unsignedShortValue");
          if (v46 != objc_msgSend(v31, "unsignedShortValue"))
          {
            v47 = objc_msgSend(v39, "unsignedShortValue");
            if (((objc_msgSend(v31, "unsignedShortValue") ^ v47) & 3) != 0)
              goto LABEL_46;
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            Logger = NFLogGetLogger(specific);
            if (Logger)
            {
              v51 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v55 = 45;
              if (isMetaClass)
                v55 = 43;
              v51(4, "%c[%{public}s %{public}s]:%i Contains undefined RFU bits but existing feature definition matches", v55, ClassName, Name, 869);
            }
            v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v57 = NFSharedLogGetLogger(v56);
            v58 = objc_claimAutoreleasedReturnValue(v57);
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              v59 = object_getClass(self);
              if (class_isMetaClass(v59))
                v60 = 43;
              else
                v60 = 45;
              *(_DWORD *)buf = 67109890;
              v65 = v60;
              v66 = 2082;
              v67 = object_getClassName(self);
              v68 = 2082;
              v69 = sel_getName(a2);
              v70 = 1024;
              v71 = 869;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Contains undefined RFU bits but existing feature definition matches", buf, 0x22u);
            }

          }
          goto LABEL_25;
        }
      }
LABEL_46:

      goto LABEL_47;
    }
    v20 = 0;
  }
LABEL_49:

  return v20;
}

- (id)_parseCHTerminalTypeData:(id)a3
{
  id v5;
  unsigned __int8 *v6;
  void *v7;
  uint64_t v8;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *v10;
  _BOOL4 v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  uint64_t v20;
  id v21;
  id v22;
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
  void *specific;
  uint64_t Logger;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  objc_class *v44;
  int v45;
  NSMutableDictionary *v46;
  void *v47;
  uint64_t v48;
  void (*v49)(uint64_t, const char *, ...);
  objc_class *v50;
  _BOOL4 v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  objc_class *v57;
  int v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  void (*v62)(uint64_t, const char *, ...);
  objc_class *v63;
  _BOOL4 v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  objc_class *v69;
  int v70;
  const char *v71;
  const char *v72;
  void *v73;
  uint64_t v74;
  void (*v75)(uint64_t, const char *, ...);
  objc_class *v76;
  _BOOL4 v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  NSObject *v82;
  objc_class *v83;
  int v84;
  const char *v85;
  const char *v86;
  const char *v88;
  const char *v89;
  const char *v90;
  const char *Name;
  const char *v92;
  const char *v93;
  const char *v94;
  uint8_t buf[4];
  int v96;
  __int16 v97;
  const char *v98;
  __int16 v99;
  const char *v100;
  __int16 v101;
  int v102;
  __int16 v103;
  int v104;

  v5 = objc_retainAutorelease(a3);
  v6 = (unsigned __int8 *)objc_msgSend(v5, "bytes");
  if ((unint64_t)objc_msgSend(v5, "length") > 2)
  {
    v20 = *v6;
    if (!*v6)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v37 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v41 = 45;
        if (isMetaClass)
          v41 = 43;
        v37(6, "%c[%{public}s %{public}s]:%i Minimal version not met", v41, ClassName, Name, 897);
      }
      v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v43 = NFSharedLogGetLogger(v42);
      v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v43);
      if (!os_log_type_enabled(&v16->super.super, OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      v44 = object_getClass(self);
      if (class_isMetaClass(v44))
        v45 = 43;
      else
        v45 = 45;
      *(_DWORD *)buf = 67109890;
      v96 = v45;
      v97 = 2082;
      v98 = object_getClassName(self);
      v99 = 2082;
      v100 = sel_getName(a2);
      v101 = 1024;
      v102 = 897;
      v19 = "%c[%{public}s %{public}s]:%i Minimal version not met";
      goto LABEL_31;
    }
    v16 = objc_opt_new(NSMutableDictionary);
    v21 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedChar:", v20);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v21, CFSTR("CHVersion"));

    v22 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v6 + 1)) >> 16);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v22, CFSTR("CHCfgBytes"));

    if ((unint64_t)objc_msgSend(v5, "length") > 8)
    {
      if ((unint64_t)objc_msgSend(v5, "length") >= 0xA)
      {
        v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v48 = NFLogGetLogger(v47);
        if (v48)
        {
          v49 = (void (*)(uint64_t, const char *, ...))v48;
          v50 = object_getClass(self);
          v51 = class_isMetaClass(v50);
          v52 = object_getClassName(self);
          v92 = sel_getName(a2);
          v53 = 45;
          if (v51)
            v53 = 43;
          v49(4, "%c[%{public}s %{public}s]:%i Truncates excess to expected data length", v53, v52, v92, 913);
        }
        v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v55 = NFSharedLogGetLogger(v54);
        v56 = objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v57 = object_getClass(self);
          if (class_isMetaClass(v57))
            v58 = 43;
          else
            v58 = 45;
          *(_DWORD *)buf = 67109890;
          v96 = v58;
          v97 = 2082;
          v98 = object_getClassName(self);
          v99 = 2082;
          v100 = sel_getName(a2);
          v101 = 1024;
          v102 = 913;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Truncates excess to expected data length", buf, 0x22u);
        }

      }
      v59 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v6 + 3, 6);
      if (v59)
      {
        v32 = v59;
        if ((_DWORD)v20 != 1)
        {
          v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v61 = NFLogGetLogger(v60);
          if (v61)
          {
            v62 = (void (*)(uint64_t, const char *, ...))v61;
            v63 = object_getClass(self);
            v64 = class_isMetaClass(v63);
            v88 = object_getClassName(self);
            v93 = sel_getName(a2);
            v65 = 45;
            if (v64)
              v65 = 43;
            v62(4, "%c[%{public}s %{public}s]:%i Assume random in detected version %{public}d", v65, v88, v93, 925, v20);
          }
          v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v67 = NFSharedLogGetLogger(v66);
          v68 = objc_claimAutoreleasedReturnValue(v67);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            v69 = object_getClass(self);
            if (class_isMetaClass(v69))
              v70 = 43;
            else
              v70 = 45;
            v71 = object_getClassName(self);
            v72 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            v96 = v70;
            v97 = 2082;
            v98 = v71;
            v99 = 2082;
            v100 = v72;
            v101 = 1024;
            v102 = 925;
            v103 = 1026;
            v104 = v20;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Assume random in detected version %{public}d", buf, 0x28u);
          }

        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v32, CFSTR("CHRemoteRandom"));
        v46 = v16;
        goto LABEL_68;
      }
      v73 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v74 = NFLogGetLogger(v73);
      if (v74)
      {
        v75 = (void (*)(uint64_t, const char *, ...))v74;
        v76 = object_getClass(self);
        v77 = class_isMetaClass(v76);
        v78 = object_getClassName(self);
        v94 = sel_getName(a2);
        v79 = 45;
        if (v77)
          v79 = 43;
        v75(3, "%c[%{public}s %{public}s]:%i out of resource", v79, v78, v94, 918);
      }
      v80 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v81 = NFSharedLogGetLogger(v80);
      v82 = objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      {
        v83 = object_getClass(self);
        if (class_isMetaClass(v83))
          v84 = 43;
        else
          v84 = 45;
        v85 = object_getClassName(self);
        v86 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v96 = v84;
        v97 = 2082;
        v98 = v85;
        v99 = 2082;
        v100 = v86;
        v101 = 1024;
        v102 = 918;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i out of resource", buf, 0x22u);
      }

      v32 = 0;
    }
    else
    {
      v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v24 = NFLogGetLogger(v23);
      if (v24)
      {
        v25 = (void (*)(uint64_t, const char *, ...))v24;
        v26 = object_getClass(self);
        v27 = class_isMetaClass(v26);
        v28 = object_getClassName(self);
        v90 = sel_getName(a2);
        v29 = 45;
        if (v27)
          v29 = 43;
        v25(6, "%c[%{public}s %{public}s]:%i Missing random", v29, v28, v90, 907);
      }
      v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v31 = NFSharedLogGetLogger(v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = object_getClass(self);
        if (class_isMetaClass(v33))
          v34 = 43;
        else
          v34 = 45;
        *(_DWORD *)buf = 67109890;
        v96 = v34;
        v97 = 2082;
        v98 = object_getClassName(self);
        v99 = 2082;
        v100 = sel_getName(a2);
        v101 = 1024;
        v102 = 907;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing random", buf, 0x22u);
      }
    }
    v46 = 0;
LABEL_68:

    goto LABEL_69;
  }
  v7 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v8 = NFLogGetLogger(v7);
  if (v8)
  {
    v9 = (void (*)(uint64_t, const char *, ...))v8;
    v10 = object_getClass(self);
    v11 = class_isMetaClass(v10);
    v12 = object_getClassName(self);
    v89 = sel_getName(a2);
    v13 = 45;
    if (v11)
      v13 = 43;
    v9(6, "%c[%{public}s %{public}s]:%i Missing minimum required length", v13, v12, v89, 889);
  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v15);
  if (!os_log_type_enabled(&v16->super.super, OS_LOG_TYPE_DEFAULT))
    goto LABEL_32;
  v17 = object_getClass(self);
  if (class_isMetaClass(v17))
    v18 = 43;
  else
    v18 = 45;
  *(_DWORD *)buf = 67109890;
  v96 = v18;
  v97 = 2082;
  v98 = object_getClassName(self);
  v99 = 2082;
  v100 = sel_getName(a2);
  v101 = 1024;
  v102 = 889;
  v19 = "%c[%{public}s %{public}s]:%i Missing minimum required length";
LABEL_31:
  _os_log_impl((void *)&_mh_execute_header, &v16->super.super, OS_LOG_TYPE_DEFAULT, v19, buf, 0x22u);
LABEL_32:
  v46 = 0;
LABEL_69:

  return v46;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NFFieldNotificationECP2_0 *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  NFFieldNotificationECP2_0 *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = [NFFieldNotificationECP2_0 alloc];
  v5 = -[NFFieldNotification notificationType](self, "notificationType");
  v6 = -[NFFieldNotification rfTechnology](self, "rfTechnology");
  v7 = -[NFFieldNotification typeFSystemCode](self, "typeFSystemCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification creationDate](self, "creationDate"));
  v9 = -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset");
  LOBYTE(v15) = self->_ignoreRFTechOnIsEqual;
  LODWORD(v14) = self->_pairingMode;
  LOBYTE(v13) = self->_terminalSubType;
  LODWORD(v12) = self->_terminalMode;
  v10 = -[NFFieldNotificationECP2_0 initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:odaRequired:terminalMode:terminalType:terminalSubType:tciArray:openLoopSchemeBitfield:homeKitSchemeDataPayload:readerIdentifier:pairingMode:terminalTypeData:ignoreRFTechOnIsEqual:userInfo:](v4, "initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:odaRequired:terminalMode:terminalType:terminalSubType:tciArray:openLoopSchemeBitfield:homeKitSchemeDataPayload:readerIdentifier:pairingMode:terminalTypeData:ignoreRFTechOnIsEqual:userInfo:", v5, v6, v7, v8, v9, self->_odaRequired, v12, self->_terminalType, v13, self->_tciArray, self->_openLoopSchemeBitfield, self->_homeKitSchemeDataPayload, self->_readerIdentifier, v14, self->_terminalTypeData,
          v15,
          self->_userInfo);

  return v10;
}

- (BOOL)odaRequired
{
  return self->_odaRequired;
}

- (unsigned)terminalMode
{
  return self->_terminalMode;
}

- (unint64_t)terminalType
{
  return self->_terminalType;
}

- (unsigned)terminalSubType
{
  return self->_terminalSubType;
}

- (NSArray)tciArray
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSData)openLoopSchemeBitfield
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (NSData)homeKitSchemeDataPayload
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (NSData)readerIdentifier
{
  return self->_readerIdentifier;
}

- (unsigned)pairingMode
{
  return self->_pairingMode;
}

- (NSData)terminalTypeData
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)ignoreRFTechOnIsEqual
{
  return self->_ignoreRFTechOnIsEqual;
}

- (void)setIgnoreRFTechOnIsEqual:(BOOL)a3
{
  self->_ignoreRFTechOnIsEqual = a3;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_terminalTypeData, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitSchemeDataPayload, 0);
  objc_storeStrong((id *)&self->_openLoopSchemeBitfield, 0);
  objc_storeStrong((id *)&self->_tciArray, 0);
}

@end
