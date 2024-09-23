@implementation NFLoyaltyAgent

- (NFLoyaltyAgent)init
{
  NFLoyaltyAgent *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *sessionData;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NFLoyaltyAgent;
  v2 = -[NFLoyaltyAgent init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sessionData = v2->_sessionData;
    v2->_sessionData = v3;

    v2->_mobileCaps = 30;
    v2->_state = 0;
    v2->_lastStatus = -28672;
  }
  return v2;
}

- (void)supportPayment:(BOOL)a3
{
  _BOOL4 v3;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  int v17;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _BOOL4 v29;

  v3 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i enable = %d", v11, ClassName, Name, 74, v3);
  }
  v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v13 = NFSharedLogGetLogger(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15))
      v16 = 43;
    else
      v16 = 45;
    *(_DWORD *)buf = 67110146;
    v21 = v16;
    v22 = 2082;
    v23 = object_getClassName(self);
    v24 = 2082;
    v25 = sel_getName(a2);
    v26 = 1024;
    v27 = 74;
    v28 = 1024;
    v29 = v3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i enable = %d", buf, 0x28u);
  }

  if (v3)
    v17 = 48;
  else
    v17 = 16;
  self->_mobileCaps = self->_mobileCaps & 0xFFFFFFCF | v17;
}

- (void)requireEncryption:(BOOL)a3
{
  self->_mobileCaps = self->_mobileCaps & 0xFFFFFFFC | !a3;
}

- (BOOL)hasError
{
  return self->_state == 4;
}

- (BOOL)isComplete
{
  return self->_state == 3;
}

- (id)getTransactionEvent
{
  NFValueAddedServiceTransaction *v3;
  NSMutableDictionary *v4;
  void *v5;
  NFValueAddedServiceTransaction *v6;

  v3 = [NFValueAddedServiceTransaction alloc];
  v4 = sub_100070334((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[NFValueAddedServiceTransaction initWithDictionary:](v3, "initWithDictionary:", v5);

  return v6;
}

- (void)authorize:(id)a3 withToken:(id)a4
{
  id v6;
  NSMutableDictionary *sessionData;
  NSData *v8;
  NSMutableDictionary *v9;
  NSData *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  sessionData = self->_sessionData;
  if (v11)
  {
    -[NSMutableDictionary setObject:forKey:](self->_sessionData, "setObject:forKey:", v11, CFSTR("PassData"));
  }
  else
  {
    v8 = objc_opt_new(NSData);
    -[NSMutableDictionary setObject:forKey:](sessionData, "setObject:forKey:", v8, CFSTR("PassData"));

  }
  v9 = self->_sessionData;
  if (v6)
  {
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v6, CFSTR("Token"));
  }
  else
  {
    v10 = objc_opt_new(NSData);
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, CFSTR("Token"));

  }
}

- (void)setHostCards:(id)a3
{
  objc_storeStrong((id *)&self->_cardInfo, a3);
}

- (id)hostCards
{
  return self->_cardInfo;
}

- (id)handleSelect:(id)a3
{
  id v4;
  unsigned int *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (sub_100072748((_BOOL8)self, v4))
  {
    self->_state = 0;
    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &off_1003061F0);
    v5 = sub_10006FDD8((NSMutableData *)self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NFResponseAPDU responseWithData:](NFResponseAPDU, "responseWithData:", v6));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)handleAPDU:(id)a3
{
  id v5;
  unsigned int *v6;
  void *v7;
  void *v8;
  id v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *v14;
  _BOOL4 v15;
  const char *v16;
  const char *v17;
  NSMutableDictionary *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  NSMutableDictionary *v28;
  void *v29;
  void *v30;
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
  NSArray *v58;
  id v59;
  void *v60;
  id v61;
  uint64_t v62;
  BOOL v63;
  int v64;
  void *i;
  void *v66;
  void *v67;
  unsigned int v68;
  void *v69;
  uint64_t v70;
  void (*v71)(uint64_t, const char *, ...);
  objc_class *v72;
  _BOOL4 v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  objc_class *v79;
  int v80;
  const char *v81;
  const char *v82;
  unsigned int v83;
  unsigned int v84;
  id v85;
  void *specific;
  uint64_t Logger;
  void (*v88)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  NSObject *v95;
  objc_class *v96;
  int v97;
  NSMutableData *v98;
  unsigned int v99;
  void *v100;
  uint64_t v101;
  void (*v102)(uint64_t, const char *, ...);
  objc_class *v103;
  _BOOL4 v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  NSObject *v109;
  objc_class *v110;
  int v111;
  NSMutableData *v112;
  NSMutableData *v113;
  uint64_t lastStatus;
  NSMutableDictionary *sessionData;
  void *v116;
  NSMutableData *v117;
  unsigned int v118;
  void *v119;
  uint64_t v120;
  void (*v121)(uint64_t, const char *, ...);
  objc_class *v122;
  _BOOL4 v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  NSObject *v127;
  objc_class *v128;
  int v129;
  const char *v130;
  const char *v131;
  NSMutableData *v132;
  unsigned __int16 v133;
  void *v134;
  unsigned int v135;
  void *v136;
  uint64_t v137;
  void (*v138)(uint64_t, const char *, ...);
  objc_class *v139;
  _BOOL4 v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  NSObject *v145;
  objc_class *v146;
  int v147;
  const char *v148;
  const char *v149;
  NSMutableData *v150;
  void *v151;
  uint64_t v152;
  void (*v153)(uint64_t, const char *, ...);
  objc_class *v154;
  _BOOL4 v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  NSObject *v160;
  objc_class *v161;
  int v162;
  const char *v163;
  const char *v164;
  objc_class *v166;
  _BOOL4 v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  NSObject *v171;
  objc_class *v172;
  int v173;
  const char *v174;
  const char *v175;
  void *v176;
  void *v177;
  void *v178;
  id v179;
  NSMutableArray *v180;
  void *v181;
  void *v182;
  id v183;
  unint64_t v184;
  uint64_t v185;
  id v186;
  id v187;
  id v188;
  uint64_t v189;
  void *v190;
  NSMutableData *v191;
  unsigned __int8 v192;
  const char *v193;
  const char *v194;
  const char *v195;
  const char *v196;
  const char *v197;
  const char *v198;
  const char *v199;
  const char *Name;
  const char *v201;
  const char *v202;
  const char *v203;
  const char *v204;
  const char *v205;
  id v206;
  id v207;
  int v208;
  void *v209;
  void *v210;
  void *v211;
  SEL sel;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  uint8_t v217[4];
  int v218;
  __int16 v219;
  const char *v220;
  __int16 v221;
  const char *v222;
  __int16 v223;
  int v224;
  uint8_t buf[4];
  int v226;
  __int16 v227;
  const char *v228;
  __int16 v229;
  const char *v230;
  __int16 v231;
  int v232;
  __int16 v233;
  id v234;
  __int16 v235;
  void *v236;

  v5 = a3;
  self->_lastStatus = -28672;
  if (!sub_100072748((_BOOL8)self, v5))
  {
    if (!objc_msgSend(v5, "isGetVasDataCommand"))
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v88 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v92 = 45;
        if (isMetaClass)
          v92 = 43;
        v88(4, "%c[%{public}s %{public}s]:%i Unrecognized VAS command", v92, ClassName, Name, 655);
      }
      v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v94 = NFSharedLogGetLogger(v93);
      v95 = objc_claimAutoreleasedReturnValue(v94);
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      {
        v96 = object_getClass(self);
        if (class_isMetaClass(v96))
          v97 = 43;
        else
          v97 = 45;
        *(_DWORD *)buf = 67109890;
        v226 = v97;
        v227 = 2082;
        v228 = object_getClassName(self);
        v229 = 2082;
        v230 = sel_getName(a2);
        v231 = 1024;
        v232 = 655;
        _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unrecognized VAS command", buf, 0x22u);
      }

      *(_WORD *)buf = -32406;
      v98 = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", buf, 2);
      goto LABEL_138;
    }
    -[NSMutableDictionary removeObjectsForKeys:](self->_sessionData, "removeObjectsForKeys:", &off_100305DA0);
    self->_state = 1;
    v9 = v5;
    v10 = sub_1000706D4((uint64_t)self, v9);
    self->_lastStatus = v10;
    if (v10 != 36864)
    {
      v99 = v10;
      v100 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v101 = NFLogGetLogger(v100);
      if (v101)
      {
        v102 = (void (*)(uint64_t, const char *, ...))v101;
        v103 = object_getClass(self);
        v104 = class_isMetaClass(v103);
        v105 = object_getClassName(self);
        v201 = sel_getName("_handleGetVasData:");
        v106 = 45;
        if (v104)
          v106 = 43;
        v102(3, "%c[%{public}s %{public}s]:%i Get Vas Data request validation failed", v106, v105, v201, 436);
      }
      v107 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v108 = NFSharedLogGetLogger(v107);
      v109 = objc_claimAutoreleasedReturnValue(v108);
      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
      {
        v110 = object_getClass(self);
        if (class_isMetaClass(v110))
          v111 = 43;
        else
          v111 = 45;
        *(_DWORD *)buf = 67109890;
        v226 = v111;
        v227 = 2082;
        v228 = object_getClassName(self);
        v229 = 2082;
        v230 = sel_getName("_handleGetVasData:");
        v231 = 1024;
        v232 = 436;
        _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Get Vas Data request validation failed", buf, 0x22u);
      }

      v112 = objc_opt_new(NSMutableData);
      v113 = v112;
      if (v112)
      {
        *(_WORD *)buf = __rev16(v99);
        -[NSMutableData appendBytes:length:](v112, "appendBytes:length:", buf, 2);
      }
      self->_state = 4;
      lastStatus = self->_lastStatus;
      goto LABEL_136;
    }
    if (!objc_msgSend(v9, "p2"))
    {
      sessionData = self->_sessionData;
      v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", 1));
      -[NSMutableDictionary setObject:forKey:](sessionData, "setObject:forKey:", v116, CFSTR("TerminalMode"));

      v117 = objc_opt_new(NSMutableData);
      v113 = v117;
      if (v117)
      {
        *(_WORD *)buf = 144;
        -[NSMutableData appendBytes:length:](v117, "appendBytes:length:", buf, 2);
      }
      self->_state = 3;
      +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &off_1003061C8);
LABEL_135:
      lastStatus = self->_lastStatus;
      if ((_DWORD)lastStatus == 36864)
      {
LABEL_137:
        v98 = v113;

LABEL_138:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NFResponseAPDU responseWithData:](NFResponseAPDU, "responseWithData:", v98));

        goto LABEL_139;
      }
LABEL_136:
      +[NFExceptionsCALogger postAnalyticsVASTransactionException:withSWStatus:](NFExceptionsCALogger, "postAnalyticsVASTransactionException:withSWStatus:", 1, lastStatus);
      goto LABEL_137;
    }
    if (objc_msgSend(v9, "p2") != 1)
    {
      v113 = 0;
      goto LABEL_135;
    }
    v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFLogGetLogger(v11);
    if (v12)
    {
      v13 = (void (*)(uint64_t, const char *, ...))v12;
      v14 = object_getClass(self);
      v15 = class_isMetaClass(v14);
      v16 = object_getClassName(self);
      v17 = sel_getName("_handleGetVasData:");
      v18 = sub_100070334((uint64_t)self);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = 45;
      if (v15)
        v20 = 43;
      v13(6, "%c[%{public}s %{public}s]:%i Get Vas Data requested: %{public}@", v20, v16, v17, 457, v19);

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
      v27 = sel_getName("_handleGetVasData:");
      v28 = sub_100070334((uint64_t)self);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      *(_DWORD *)buf = 67110146;
      v226 = v25;
      v227 = 2082;
      v228 = v26;
      v229 = 2082;
      v230 = v27;
      v231 = 1024;
      v232 = 457;
      v233 = 2114;
      v234 = v29;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Get Vas Data requested: %{public}@", buf, 0x2Cu);

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessionData, "objectForKey:", CFSTR("MerchantId")));
    v210 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessionData, "objectForKey:", CFSTR("Filter")));
    v211 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessionData, "objectForKey:", CFSTR("FilterType")));
    v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v32 = NFLogGetLogger(v31);
    if (v32)
    {
      v33 = (void (*)(uint64_t, const char *, ...))v32;
      v34 = object_getClass(self);
      v35 = class_isMetaClass(v34);
      v193 = object_getClassName(self);
      v197 = sel_getName("_lookupHostCardForRequest");
      v36 = 45;
      if (v35)
        v36 = 43;
      v33(6, "%c[%{public}s %{public}s]:%i Requested merchant id = %{public}@", v36, v193, v197, 392, v30);
    }
    v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v38 = NFSharedLogGetLogger(v37);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = object_getClass(self);
      if (class_isMetaClass(v40))
        v41 = 43;
      else
        v41 = 45;
      v42 = object_getClassName(self);
      v43 = sel_getName("_lookupHostCardForRequest");
      *(_DWORD *)buf = 67110146;
      v226 = v41;
      v227 = 2082;
      v228 = v42;
      v229 = 2082;
      v230 = v43;
      v231 = 1024;
      v232 = 392;
      v233 = 2114;
      v234 = v30;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Requested merchant id = %{public}@", buf, 0x2Cu);
    }

    v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v45 = NFLogGetLogger(v44);
    if (v45)
    {
      v46 = (void (*)(uint64_t, const char *, ...))v45;
      v47 = object_getClass(self);
      v48 = class_isMetaClass(v47);
      v49 = object_getClassName(self);
      v198 = sel_getName("_lookupHostCardForRequest");
      v50 = 45;
      if (v48)
        v50 = 43;
      v46(6, "%c[%{public}s %{public}s]:%i Filter %{public}@  FilterType %{public}@", v50, v49, v198, 393, v210, v211);
    }
    v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v52 = NFSharedLogGetLogger(v51);
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = object_getClass(self);
      if (class_isMetaClass(v54))
        v55 = 43;
      else
        v55 = 45;
      v56 = object_getClassName(self);
      v57 = sel_getName("_lookupHostCardForRequest");
      *(_DWORD *)buf = 67110402;
      v226 = v55;
      v227 = 2082;
      v228 = v56;
      v229 = 2082;
      v230 = v57;
      v231 = 1024;
      v232 = 393;
      v233 = 2114;
      v234 = v210;
      v235 = 2114;
      v236 = v211;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Filter %{public}@  FilterType %{public}@", buf, 0x36u);
    }

    v215 = 0u;
    v216 = 0u;
    v213 = 0u;
    v214 = 0u;
    v58 = self->_cardInfo;
    v59 = -[NSArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v213, buf, 16);
    v209 = v30;
    v60 = v211;
    if (v59)
    {
      v61 = v59;
      v206 = v9;
      v62 = *(_QWORD *)v214;
      if (v210)
        v63 = v211 == 0;
      else
        v63 = 1;
      v64 = !v63;
      v208 = v64;
      while (2)
      {
        for (i = 0; i != v61; i = (char *)i + 1)
        {
          if (*(_QWORD *)v214 != v62)
            objc_enumerationMutation(v58);
          v66 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * (_QWORD)i);
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "identifier"));
          v68 = objc_msgSend(v30, "isEqualToData:", v67);

          if (v68)
          {
            v69 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v70 = NFLogGetLogger(v69);
            if (v70)
            {
              v71 = (void (*)(uint64_t, const char *, ...))v70;
              v72 = object_getClass(self);
              v73 = class_isMetaClass(v72);
              v74 = object_getClassName(self);
              v199 = sel_getName("_lookupHostCardForRequest");
              v75 = 45;
              if (v73)
                v75 = 43;
              v194 = v74;
              v30 = v209;
              v71(6, "%c[%{public}s %{public}s]:%i merchant id match", v75, v194, v199, 398);
            }
            v76 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v77 = NFSharedLogGetLogger(v76);
            v78 = objc_claimAutoreleasedReturnValue(v77);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              v79 = object_getClass(self);
              if (class_isMetaClass(v79))
                v80 = 43;
              else
                v80 = 45;
              v81 = object_getClassName(self);
              v82 = sel_getName("_lookupHostCardForRequest");
              *(_DWORD *)v217 = 67109890;
              v218 = v80;
              v219 = 2082;
              v220 = v81;
              v30 = v209;
              v221 = 2082;
              v222 = v82;
              v223 = 1024;
              v224 = 398;
              _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i merchant id match", v217, 0x22u);
            }

            if (!v208)
            {
LABEL_90:
              v85 = v66;
              goto LABEL_91;
            }
            if (objc_msgSend(v211, "intValue") == 1)
            {
              v83 = objc_msgSend(v210, "intValue");
              if (v83 == objc_msgSend(v66, "type"))
                goto LABEL_90;
            }
            else
            {
              if (objc_msgSend(v211, "intValue") != 2)
                goto LABEL_90;
              v84 = objc_msgSend(v210, "intValue");
              if ((objc_msgSend(v66, "type") & v84) != 0)
                goto LABEL_90;
            }
          }
        }
        v61 = -[NSArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v213, buf, 16);
        if (v61)
          continue;
        break;
      }
      v85 = 0;
LABEL_91:
      v9 = v206;
      v60 = v211;
    }
    else
    {
      v85 = 0;
    }

    if (self->_cardInfo)
    {
      if (v85)
      {
        v118 = objc_msgSend(v85, "userInterventionRequired");
        v119 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v120 = NFLogGetLogger(v119);
        v121 = (void (*)(uint64_t, const char *, ...))v120;
        if (!v118)
        {
          if (v120)
          {
            v166 = object_getClass(self);
            v167 = class_isMetaClass(v166);
            v196 = object_getClassName(self);
            v205 = sel_getName("_handleGetVasData:");
            v168 = 45;
            if (v167)
              v168 = 43;
            v121(6, "%c[%{public}s %{public}s]:%i Found HostCard for transaction: %{public}@", v168, v196, v205, 484, v85);
          }
          v207 = v9;
          v169 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v170 = NFSharedLogGetLogger(v169);
          v171 = objc_claimAutoreleasedReturnValue(v170);
          if (os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT))
          {
            v172 = object_getClass(self);
            if (class_isMetaClass(v172))
              v173 = 43;
            else
              v173 = 45;
            v174 = object_getClassName(self);
            v175 = sel_getName("_handleGetVasData:");
            *(_DWORD *)buf = 67110146;
            v226 = v173;
            v227 = 2082;
            v228 = v174;
            v229 = 2082;
            v230 = v175;
            v231 = 1024;
            v232 = 484;
            v233 = 2114;
            v234 = v85;
            _os_log_impl((void *)&_mh_execute_header, v171, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found HostCard for transaction: %{public}@", buf, 0x2Cu);
          }

          v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "data"));
          v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "token"));
          -[NFLoyaltyAgent authorize:withToken:](self, "authorize:withToken:", v176, v177);

          v178 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessionData, "objectForKey:", CFSTR("PassData")));
          sel = (SEL)objc_msgSend(v178, "length");
          v179 = v178;
          v180 = objc_opt_new(NSMutableArray);
          v181 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessionData, "objectForKey:", CFSTR("Token")));
          v182 = (void *)objc_claimAutoreleasedReturnValue(+[NFTLV TLVWithTag:value:](NFTLV, "TLVWithTag:value:", 40746, v181));
          -[NSMutableArray addObject:](v180, "addObject:", v182);
          v183 = objc_msgSend(v179, "length");
          v184 = (unint64_t)v183;
          if ((unint64_t)v183 >= 0xC0)
            v185 = 192;
          else
            v185 = (uint64_t)v183;
          v186 = objc_retainAutorelease(v179);
          v187 = objc_msgSend(v186, "bytes");

          if (v185)
          {
            if (v184 >= 0x80)
              v185 = 128;
            else
              v185 = v184;
            v188 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v187, v185);

            v189 = objc_claimAutoreleasedReturnValue(+[NFTLV TLVWithTag:value:](NFTLV, "TLVWithTag:value:", 40743, v188));
            -[NSMutableArray addObject:](v180, "addObject:", v189);
            v182 = (void *)v189;
            v181 = v188;
          }
          v190 = (void *)objc_claimAutoreleasedReturnValue(+[NFTLV TLVWithTag:children:](NFTLV, "TLVWithTag:children:", 112, v180));

          v191 = (NSMutableData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "asMutableData"));
          v113 = v191;
          if (sel == (SEL)v185)
          {
            v9 = v207;
            if (v191)
            {
              *(_WORD *)buf = 144;
              -[NSMutableData appendBytes:length:](v191, "appendBytes:length:", buf, 2);
            }
            v192 = 3;
          }
          else
          {
            v9 = v207;
            if (v191)
            {
              *(_WORD *)buf = __rev16(((_BYTE)sel - v185) | 0x6100);
              -[NSMutableData appendBytes:length:](v191, "appendBytes:length:", buf, 2);
            }
            v192 = 2;
          }
          self->_state = v192;

          goto LABEL_134;
        }
        if (v120)
        {
          v122 = object_getClass(self);
          v123 = class_isMetaClass(v122);
          v195 = object_getClassName(self);
          v202 = sel_getName("_handleGetVasData:");
          v124 = 45;
          if (v123)
            v124 = 43;
          v121(6, "%c[%{public}s %{public}s]:%i HostCard requires user intervention: %{public}@", v124, v195, v202, 477, v85);
        }
        v125 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v126 = NFSharedLogGetLogger(v125);
        v127 = objc_claimAutoreleasedReturnValue(v126);
        if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
        {
          v128 = object_getClass(self);
          if (class_isMetaClass(v128))
            v129 = 43;
          else
            v129 = 45;
          v130 = object_getClassName(self);
          v131 = sel_getName("_handleGetVasData:");
          *(_DWORD *)buf = 67110146;
          v226 = v129;
          v227 = 2082;
          v228 = v130;
          v229 = 2082;
          v230 = v131;
          v231 = 1024;
          v232 = 477;
          v233 = 2114;
          v234 = v85;
          _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i HostCard requires user intervention: %{public}@", buf, 0x2Cu);
        }

        v132 = objc_opt_new(NSMutableData);
        v113 = v132;
        if (v132)
        {
          *(_WORD *)buf = -31639;
          -[NSMutableData appendBytes:length:](v132, "appendBytes:length:", buf, 2);
        }
        v133 = 27012;
LABEL_133:
        self->_lastStatus = v133;
        self->_state = 4;
LABEL_134:

        goto LABEL_135;
      }
      v151 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v152 = NFLogGetLogger(v151);
      if (v152)
      {
        v153 = (void (*)(uint64_t, const char *, ...))v152;
        v154 = object_getClass(self);
        v155 = class_isMetaClass(v154);
        v156 = object_getClassName(self);
        v204 = sel_getName("_handleGetVasData:");
        v157 = 45;
        if (v155)
          v157 = 43;
        v153(6, "%c[%{public}s %{public}s]:%i No matching loyalty card found", v157, v156, v204, 489);
      }
      v158 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v159 = NFSharedLogGetLogger(v158);
      v160 = objc_claimAutoreleasedReturnValue(v159);
      if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
      {
        v161 = object_getClass(self);
        if (class_isMetaClass(v161))
          v162 = 43;
        else
          v162 = 45;
        v163 = object_getClassName(self);
        v164 = sel_getName("_handleGetVasData:");
        *(_DWORD *)buf = 67109890;
        v226 = v162;
        v227 = 2082;
        v228 = v163;
        v229 = 2082;
        v230 = v164;
        v231 = 1024;
        v232 = 489;
        _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No matching loyalty card found", buf, 0x22u);
      }

      v113 = objc_opt_new(NSMutableData);
      if (!v113)
      {
LABEL_132:
        v133 = 27267;
        goto LABEL_133;
      }
    }
    else
    {
      v134 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessionData, "objectForKey:", CFSTR("LastRequest")));
      v135 = objc_msgSend(v134, "BOOLValue");

      v136 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v137 = NFLogGetLogger(v136);
      if (v137)
      {
        v138 = (void (*)(uint64_t, const char *, ...))v137;
        v139 = object_getClass(self);
        v140 = class_isMetaClass(v139);
        v141 = object_getClassName(self);
        v203 = sel_getName("_handleGetVasData:");
        v142 = 45;
        if (v140)
          v142 = 43;
        v138(6, "%c[%{public}s %{public}s]:%i No loyalty cards authorized", v142, v141, v203, 464);
      }
      v143 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v144 = NFSharedLogGetLogger(v143);
      v145 = objc_claimAutoreleasedReturnValue(v144);
      if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
      {
        v146 = object_getClass(self);
        if (class_isMetaClass(v146))
          v147 = 43;
        else
          v147 = 45;
        v148 = object_getClassName(self);
        v149 = sel_getName("_handleGetVasData:");
        *(_DWORD *)buf = 67109890;
        v226 = v147;
        v227 = 2082;
        v228 = v148;
        v229 = 2082;
        v230 = v149;
        v231 = 1024;
        v232 = 464;
        _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No loyalty cards authorized", buf, 0x22u);
      }

      v150 = objc_opt_new(NSMutableData);
      v113 = v150;
      if (v135)
      {
        if (v150)
        {
          *(_WORD *)buf = -30878;
          -[NSMutableData appendBytes:length:](v150, "appendBytes:length:", buf, 2);
        }
        v133 = 25223;
        goto LABEL_133;
      }
      if (!v150)
        goto LABEL_132;
    }
    *(_WORD *)buf = -31894;
    -[NSMutableData appendBytes:length:](v113, "appendBytes:length:", buf, 2);
    goto LABEL_132;
  }
  self->_state = 0;
  v6 = sub_10006FDD8((NSMutableData *)self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NFResponseAPDU responseWithData:](NFResponseAPDU, "responseWithData:", v7));

LABEL_139:
  return v8;
}

- (void)handleDeselect
{
  if (self->_state == 3)
    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &off_100306218);
  self->_state = 0;
  self->_isSelected = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionData, 0);
  objc_storeStrong((id *)&self->_cardInfo, 0);
}

@end
