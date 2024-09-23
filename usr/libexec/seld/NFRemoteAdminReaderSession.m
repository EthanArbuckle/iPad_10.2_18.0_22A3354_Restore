@implementation NFRemoteAdminReaderSession

- (NFRemoteAdminReaderSession)initWithState:(id)a3 oneTimeConnection:(BOOL)a4 secureElementManagerSession:(id)a5
{
  NFRemoteAdminReaderSession *v5;
  dispatch_semaphore_t v6;
  OS_dispatch_semaphore *tagSem;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *sessionStartSem;
  NSMutableDictionary *v10;
  NSMutableDictionary *cardContents;
  void *v12;
  uint64_t v13;
  NSData *sessionUUID;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NFRemoteAdminReaderSession;
  v5 = -[NFRemoteAdminRedirectSession initWithState:oneTimeConnection:secureElementManagerSession:](&v16, "initWithState:oneTimeConnection:secureElementManagerSession:", a3, a4, a5);
  if (v5)
  {
    v6 = dispatch_semaphore_create(0);
    tagSem = v5->_tagSem;
    v5->_tagSem = (OS_dispatch_semaphore *)v6;

    v8 = dispatch_semaphore_create(0);
    sessionStartSem = v5->_sessionStartSem;
    v5->_sessionStartSem = (OS_dispatch_semaphore *)v8;

    v10 = objc_opt_new(NSMutableDictionary);
    cardContents = v5->_cardContents;
    v5->_cardContents = v10;

    v5->_cardValidationStatus = 7;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "generateUUID"));
    sessionUUID = v5->_sessionUUID;
    v5->_sessionUUID = (NSData *)v13;

    v5->_cathayIngestionSessionInProgress = 0;
    v5->_mercuryIngestionSessionInProgress = 0;
    v5->_cardIngestionStatus = -1;
  }
  return v5;
}

- (id)sessionCardServiceInfo
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "requestInfo"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cardServiceInfo"));
  return v4;
}

- (unsigned)targetTagType
{
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  int v9;
  unsigned int v10;
  void *v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *Name;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession sessionCardServiceInfo](self, "sessionCardServiceInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version")));
  v6 = objc_opt_class(NSNumber);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"))),
        v9 = objc_msgSend(v8, "intValue"),
        v8,
        v9 >= 3))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NF_stringForKey:", CFSTR("technology")));
    if (objc_msgSend(v11, "length"))
    {
      v10 = objc_msgSend(v11, "containsString:", CFSTR("A"));
      if (objc_msgSend(v11, "containsString:", CFSTR("B")))
        v10 |= 2u;
      if (objc_msgSend(v11, "containsString:", CFSTR("F")))
        v10 |= 4u;
    }
    else
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v14 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v18 = 45;
        if (isMetaClass)
          v18 = 43;
        v14(4, "%c[%{public}s %{public}s]:%i Missing technology field.  Forcing TypeA", v18, ClassName, Name, 105);
      }
      v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v20 = NFSharedLogGetLogger(v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = object_getClass(self);
        if (class_isMetaClass(v22))
          v23 = 43;
        else
          v23 = 45;
        *(_DWORD *)buf = 67109890;
        v27 = v23;
        v28 = 2082;
        v29 = object_getClassName(self);
        v30 = 2082;
        v31 = sel_getName(a2);
        v32 = 1024;
        v33 = 105;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing technology field.  Forcing TypeA", buf, 0x22u);
      }

      v10 = 1;
    }

  }
  else
  {
    v10 = 4;
  }

  return v10;
}

- (unsigned)_generateRandomNumber:(unsigned int)a3 endingWith:(unsigned int)a4
{
  unsigned int v4;
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
  unsigned int v20;
  const char *Name;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;

  v4 = a4;
  if (a3 <= a4)
  {
    v20 = a4;
    v4 = a3;
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v10(4, "%c[%{public}s %{public}s]:%i startingNumber > endingNumber. Swaping them!", v14, ClassName, Name, 115);
    }
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      *(_DWORD *)buf = 67109890;
      v24 = v19;
      v25 = 2082;
      v26 = object_getClassName(self);
      v27 = 2082;
      v28 = sel_getName(a2);
      v29 = 1024;
      v30 = 115;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i startingNumber > endingNumber. Swaping them!", buf, 0x22u);
    }

    v20 = a3;
  }
  return arc4random_uniform(v20 - v4) + v4;
}

- (id)_gatherCardStateInfo
{
  NFRemoteAdminReaderSession *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NFReaderSession *readerSession;
  void *v10;
  uint64_t v11;
  NFRemoteAdminReaderSession *v12;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  void *v16;
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
  void *v30;
  void *specific;
  uint64_t Logger;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  objc_class *v41;
  int v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void (*v52)(uint64_t, const char *, ...);
  objc_class *v53;
  _BOOL4 v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  objc_class *v61;
  int v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  void *v74;
  _BOOL4 v75;
  void *v76;
  char *v77;
  void *v78;
  uint64_t v79;
  void (*v80)(uint64_t, const char *, ...);
  objc_class *v81;
  _BOOL4 v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  objc_class *v88;
  int v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  unint64_t v95;
  char *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  uint64_t v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  uint64_t v112;
  void (*v113)(uint64_t, const char *, ...);
  objc_class *v114;
  _BOOL4 v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  NSObject *v120;
  objc_class *v121;
  int v122;
  const char *v123;
  const char *v124;
  void *v125;
  uint64_t v126;
  void (*v127)(uint64_t, const char *, ...);
  objc_class *v128;
  _BOOL4 v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  NSObject *v134;
  objc_class *v135;
  int v136;
  const char *v137;
  const char *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void (*v142)(uint64_t, const char *, ...);
  objc_class *v143;
  _BOOL4 v144;
  const char *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  NSObject *v150;
  NSMutableArray *v151;
  objc_class *v152;
  int v153;
  const char *v154;
  const char *v155;
  id v156;
  void *v157;
  uint64_t v158;
  void (*v159)(uint64_t, const char *, ...);
  objc_class *v160;
  _BOOL4 v161;
  const char *v162;
  const char *v163;
  uint64_t v164;
  char *v165;
  void *v166;
  uint64_t v167;
  objc_class *v168;
  int v169;
  const char *v170;
  const char *v171;
  id v172;
  void *v174;
  uint64_t v175;
  void (*v176)(uint64_t, const char *, ...);
  objc_class *v177;
  _BOOL4 v178;
  const char *v179;
  uint64_t v180;
  void *v181;
  uint64_t v182;
  NSObject *v183;
  objc_class *v184;
  int v185;
  const char *v186;
  const char *v187;
  const char *v188;
  const char *v189;
  const char *v190;
  const char *Name;
  const char *v192;
  const char *v193;
  const char *v194;
  const char *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  id v199;
  id v200;
  uint64_t v201;
  id v202;
  void *v203;
  uint64_t v204;
  void *v205;
  void *v206;
  NSMutableArray *v207;
  char *v208;
  uint64_t v209;
  char *v210;
  id obj;
  id *p_isa;
  void *v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  const __CFString *v223;
  NSMutableArray *v224;
  _QWORD v225[2];
  _QWORD v226[2];
  uint8_t buf[4];
  int v228;
  __int16 v229;
  const char *v230;
  __int16 v231;
  const char *v232;
  __int16 v233;
  int v234;
  __int16 v235;
  uint64_t v236;
  __int16 v237;
  char *v238;
  __int16 v239;
  id v240;
  _BYTE v241[128];
  _BYTE v242[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession sessionCardServiceInfo](self, "sessionCardServiceInfo"));
  v4 = v3;
  p_isa = (id *)&v2->super.super.isa;
  if (v2->_cardValidationStatus == 14)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "NF_arrayForKey:", CFSTR("areaCodeList")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NF_arrayForKey:", CFSTR("blockDataList")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cardServiceId")));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cardServiceId")));
      objc_msgSend(p_isa[10], "setObject:forKeyedSubscript:", v8, CFSTR("cardServiceId"));

      v2 = (NFRemoteAdminReaderSession *)p_isa;
    }
    readerSession = v2->_readerSession;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession _getSessionSystemCode](v2, "_getSessionSystemCode"));
    v11 = objc_claimAutoreleasedReturnValue(-[NFReaderSession felicaStateForSystemCode:withRequestService:withBlockReadList:performSearchServiceCode:](readerSession, "felicaStateForSystemCode:withRequestService:withBlockReadList:performSearchServiceCode:", v10, v5, v6, 0));
    v12 = v2;
    v13 = (void *)v11;

    v12->_cardValidationStatus = 0;
  }
  else
  {
    v14 = objc_opt_new(NSMutableArray);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NF_arrayForKey:", CFSTR("stateGenerationScript")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("stateGenerationScript")));

    if (!v16 || v15)
    {
      if (!objc_msgSend(v15, "count"))
      {
        v30 = v15;
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v33 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(v2);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(v2);
          Name = sel_getName(a2);
          v37 = 45;
          if (isMetaClass)
            v37 = 43;
          v33(4, "%c[%{public}s %{public}s]:%i Script is empty", v37, ClassName, Name, 160);
        }
        v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v39 = NFSharedLogGetLogger(v38);
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v41 = object_getClass(v2);
          if (class_isMetaClass(v41))
            v42 = 43;
          else
            v42 = 45;
          *(_DWORD *)buf = 67109890;
          v228 = v42;
          v229 = 2082;
          v230 = object_getClassName(v2);
          v231 = 2082;
          v232 = sel_getName(a2);
          v233 = 1024;
          v234 = 160;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Script is empty", buf, 0x22u);
        }

        v15 = v30;
      }
      v221 = 0u;
      v222 = 0u;
      v219 = 0u;
      v220 = 0u;
      v43 = v15;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v219, v242, 16);
      if (v44)
      {
        v45 = *(_QWORD *)v220;
        v206 = v43;
        v207 = v14;
        v205 = v4;
        v203 = v15;
        v201 = *(_QWORD *)v220;
        while (2)
        {
          v46 = 0;
          v202 = v44;
          do
          {
            if (*(_QWORD *)v220 != v45)
            {
              v47 = v46;
              objc_enumerationMutation(v43);
              v46 = v47;
            }
            v204 = v46;
            v48 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * v46);
            v49 = objc_opt_class(NSDictionary);
            if ((objc_opt_isKindOfClass(v48, v49) & 1) == 0)
            {
              v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v51 = NFLogGetLogger(v50);
              if (v51)
              {
                v52 = (void (*)(uint64_t, const char *, ...))v51;
                v53 = object_getClass(v2);
                v54 = class_isMetaClass(v53);
                v55 = object_getClassName(v2);
                v56 = sel_getName(a2);
                v197 = objc_opt_class(v48);
                v57 = 45;
                if (v54)
                  v57 = 43;
                v52(3, "%c[%{public}s %{public}s]:%i Skipping invalid entry %{public}@", v57, v55, v56, 167, v197);
              }
              v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v59 = NFSharedLogGetLogger(v58);
              v60 = objc_claimAutoreleasedReturnValue(v59);
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
              {
                v61 = object_getClass(v2);
                if (class_isMetaClass(v61))
                  v62 = 43;
                else
                  v62 = 45;
                v63 = object_getClassName(v2);
                v64 = sel_getName(a2);
                v65 = objc_opt_class(v48);
                *(_DWORD *)buf = 67110146;
                v228 = v62;
                v229 = 2082;
                v230 = v63;
                v231 = 2082;
                v232 = v64;
                v233 = 1024;
                v234 = 167;
                v235 = 2114;
                v236 = v65;
                _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Skipping invalid entry %{public}@", buf, 0x2Cu);
              }

            }
            v214 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "NF_stringForKey:", CFSTR("command")));
            if (!v214)
            {
              v174 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v175 = NFLogGetLogger(v174);
              if (v175)
              {
                v176 = (void (*)(uint64_t, const char *, ...))v175;
                v177 = object_getClass(v2);
                v178 = class_isMetaClass(v177);
                v179 = object_getClassName(v2);
                v196 = sel_getName(a2);
                v180 = 45;
                if (v178)
                  v180 = 43;
                v176(3, "%c[%{public}s %{public}s]:%i Invalid Command APDU. Bailing out now.", v180, v179, v196, 172);
              }
              v181 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v182 = NFSharedLogGetLogger(v181);
              v183 = objc_claimAutoreleasedReturnValue(v182);
              if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
              {
                v184 = object_getClass(v2);
                if (class_isMetaClass(v184))
                  v185 = 43;
                else
                  v185 = 45;
                v186 = object_getClassName(v2);
                v187 = sel_getName(a2);
                *(_DWORD *)buf = 67109890;
                v228 = v185;
                v229 = 2082;
                v230 = v186;
                v231 = 2082;
                v232 = v187;
                v233 = 1024;
                v234 = 172;
                _os_log_impl((void *)&_mh_execute_header, v183, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid Command APDU. Bailing out now.", buf, 0x22u);
              }

              v2->_cardValidationStatus = 4;
LABEL_128:

              v17 = v203;
              goto LABEL_129;
            }
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "NF_arrayForKey:", CFSTR("commandModifier")));
            v215 = 0u;
            v216 = 0u;
            v217 = 0u;
            v218 = 0u;
            obj = v66;
            v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v215, v241, 16);
            if (v67)
            {
              v68 = v67;
              v209 = *(_QWORD *)v216;
              while (2)
              {
                v69 = 0;
                v70 = v209;
                do
                {
                  if (*(_QWORD *)v216 != v70)
                    objc_enumerationMutation(obj);
                  v71 = *(void **)(*((_QWORD *)&v215 + 1) + 8 * (_QWORD)v69);
                  v72 = objc_opt_class(NSDictionary);
                  if ((objc_opt_isKindOfClass(v71, v72) & 1) != 0)
                  {
                    v73 = objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "NF_dictionaryForKey:", CFSTR("random")));
                    if (-[NSObject count](v73, "count"))
                    {
                      v74 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject NF_numberForKey:](v73, "NF_numberForKey:", CFSTR("length")));

                      v75 = v74 == 0;
                      if (v74)
                      {
                        v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v73, "objectForKey:", CFSTR("length")));
                        v77 = (char *)objc_msgSend(v76, "integerValue");

                      }
                      else
                      {
                        v77 = 0;
                      }
                      v93 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject NF_numberForKey:](v73, "NF_numberForKey:", CFSTR("offset")));

                      if (v93)
                      {
                        v94 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v73, "objectForKey:", CFSTR("offset")));
                        v95 = (unint64_t)objc_msgSend(v94, "integerValue");

                        if ((v95 & 0x8000000000000000) != 0)
                        {
                          v96 = (char *)objc_msgSend(v214, "length") + v95;
                          if ((uint64_t)v96 < 0)
                            goto LABEL_117;
                        }
                        else
                        {
                          v96 = (char *)v95;
                        }
                      }
                      else
                      {
                        v96 = 0;
                        v95 = 0;
                        v75 = 1;
                      }
                      if (&v77[(_QWORD)v96] > objc_msgSend(v214, "length"))
                      {
LABEL_117:
                        v210 = v77;
                        v157 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        v158 = NFLogGetLogger(v157);
                        v141 = v214;
                        if (v158)
                        {
                          v159 = (void (*)(uint64_t, const char *, ...))v158;
                          v160 = object_getClass(v2);
                          v161 = class_isMetaClass(v160);
                          v162 = object_getClassName(v2);
                          v163 = sel_getName(a2);
                          v200 = objc_msgSend(v214, "length");
                          v195 = v163;
                          v2 = (NFRemoteAdminReaderSession *)p_isa;
                          v164 = 43;
                          if (!v161)
                            v164 = 45;
                          v159(3, "%c[%{public}s %{public}s]:%i Validation Error: Invalid commandModificaiton length or offset: startingOffset = %ld, length = %ld, [theStateGenerationScriptApdus length] = %lu", v164, v162, v195, 238, v96, v77, v200);
                        }
                        v165 = v96;
                        v166 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        v167 = NFSharedLogGetLogger(v166);
                        v150 = objc_claimAutoreleasedReturnValue(v167);
                        v4 = v205;
                        v151 = v207;
                        if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                        {
                          v168 = object_getClass(v2);
                          if (class_isMetaClass(v168))
                            v169 = 43;
                          else
                            v169 = 45;
                          v170 = object_getClassName(p_isa);
                          v171 = sel_getName(a2);
                          v172 = objc_msgSend(v214, "length");
                          *(_DWORD *)buf = 67110658;
                          v228 = v169;
                          v2 = (NFRemoteAdminReaderSession *)p_isa;
                          v229 = 2082;
                          v230 = v170;
                          v231 = 2082;
                          v232 = v171;
                          v233 = 1024;
                          v234 = 238;
                          v235 = 2048;
                          v236 = (uint64_t)v165;
                          v237 = 2048;
                          v238 = v210;
                          v239 = 2048;
                          v240 = v172;
LABEL_126:
                          _os_log_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Validation Error: Invalid commandModificaiton length or offset: startingOffset = %ld, length = %ld, [theStateGenerationScriptApdus length] = %lu", buf, 0x40u);
                        }
LABEL_127:

                        v2->_cardValidationStatus = 4;
                        v14 = v151;
                        goto LABEL_128;
                      }
                      v97 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject NF_numberForKey:](v73, "NF_numberForKey:", CFSTR("min")));

                      v208 = v96;
                      if (v97)
                      {
                        v98 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v73, "objectForKey:", CFSTR("min")));
                        v99 = objc_msgSend(v98, "intValue");

                      }
                      else
                      {
                        v99 = 0;
                        v75 = 1;
                      }
                      v100 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject NF_numberForKey:](v73, "NF_numberForKey:", CFSTR("max")));

                      if (!v100
                        || (v101 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v73, "objectForKey:", CFSTR("max"))),
                            v102 = objc_msgSend(v101, "intValue"),
                            v101,
                            v2 = (NFRemoteAdminReaderSession *)p_isa,
                            v75))
                      {
                        v139 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        v140 = NFLogGetLogger(v139);
                        v141 = v214;
                        if (v140)
                        {
                          v142 = (void (*)(uint64_t, const char *, ...))v140;
                          v143 = object_getClass(v2);
                          v144 = class_isMetaClass(v143);
                          v145 = object_getClassName(v2);
                          v146 = sel_getName(a2);
                          v199 = objc_msgSend(v214, "length");
                          v194 = v146;
                          v2 = (NFRemoteAdminReaderSession *)p_isa;
                          v147 = 43;
                          if (!v144)
                            v147 = 45;
                          v142(3, "%c[%{public}s %{public}s]:%i Validation Error: Invalid commandModificaiton length or offset: startingOffset = %ld, length = %ld, [theStateGenerationScriptApdus length] = %lu", v147, v145, v194, 227, v96, v77, v199);
                        }
                        v148 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        v149 = NFSharedLogGetLogger(v148);
                        v150 = objc_claimAutoreleasedReturnValue(v149);
                        v4 = v205;
                        v151 = v207;
                        if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                        {
                          v152 = object_getClass(v2);
                          if (class_isMetaClass(v152))
                            v153 = 43;
                          else
                            v153 = 45;
                          v154 = object_getClassName(p_isa);
                          v155 = sel_getName(a2);
                          v156 = objc_msgSend(v214, "length");
                          *(_DWORD *)buf = 67110658;
                          v228 = v153;
                          v2 = (NFRemoteAdminReaderSession *)p_isa;
                          v229 = 2082;
                          v230 = v154;
                          v231 = 2082;
                          v232 = v155;
                          v233 = 1024;
                          v234 = 227;
                          v235 = 2048;
                          v236 = (uint64_t)v208;
                          v237 = 2048;
                          v238 = v77;
                          v239 = 2048;
                          v240 = v156;
                          goto LABEL_126;
                        }
                        goto LABEL_127;
                      }
                      v103 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%04X"), objc_msgSend(p_isa, "_generateRandomNumber:endingWith:", v99, v102));
                      v104 = objc_claimAutoreleasedReturnValue(objc_msgSend(v214, "stringByReplacingCharactersInRange:withString:", v95, v77, v103));

                      v214 = (void *)v104;
                      v70 = v209;
                    }
                  }
                  else
                  {
                    v78 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v79 = NFLogGetLogger(v78);
                    if (v79)
                    {
                      v80 = (void (*)(uint64_t, const char *, ...))v79;
                      v81 = object_getClass(v2);
                      v82 = class_isMetaClass(v81);
                      v83 = object_getClassName(v2);
                      v84 = sel_getName(a2);
                      v198 = objc_opt_class(v71);
                      v85 = 45;
                      if (v82)
                        v85 = 43;
                      v80(3, "%c[%{public}s %{public}s]:%i Element expected to be Dictionary, got %{public}@", v85, v83, v84, 184, v198);
                    }
                    v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v87 = NFSharedLogGetLogger(v86);
                    v73 = objc_claimAutoreleasedReturnValue(v87);
                    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                    {
                      v88 = object_getClass(v2);
                      if (class_isMetaClass(v88))
                        v89 = 43;
                      else
                        v89 = 45;
                      v90 = object_getClassName(v2);
                      v91 = sel_getName(a2);
                      v92 = objc_opt_class(v71);
                      *(_DWORD *)buf = 67110146;
                      v228 = v89;
                      v229 = 2082;
                      v230 = v90;
                      v231 = 2082;
                      v232 = v91;
                      v233 = 1024;
                      v234 = 184;
                      v235 = 2114;
                      v236 = v92;
                      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Element expected to be Dictionary, got %{public}@", buf, 0x2Cu);
                    }
                  }

                  v69 = (char *)v69 + 1;
                }
                while (v68 != v69);
                v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v215, v241, 16);
                v14 = v207;
                if (v68)
                  continue;
                break;
              }
            }

            v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v214));
            v4 = v205;
            if (objc_msgSend(v105, "length"))
            {
              v106 = (void *)objc_claimAutoreleasedReturnValue(-[NFReaderSession transceive:](v2->_readerSession, "transceive:", v105));
              v107 = objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "NF_asHexString"));
              v108 = (void *)v107;
              if (v107)
              {
                if (v214)
                {
                  v225[0] = CFSTR("command");
                  v225[1] = CFSTR("response");
                  v226[0] = v214;
                  v226[1] = v107;
                  v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v226, v225, 2));
                  -[NSMutableArray addObject:](v207, "addObject:", v109);

                }
                v110 = 0;
              }
              else
              {
                v125 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v126 = NFLogGetLogger(v125);
                if (v126)
                {
                  v127 = (void (*)(uint64_t, const char *, ...))v126;
                  v128 = object_getClass(v2);
                  v129 = class_isMetaClass(v128);
                  v130 = object_getClassName(v2);
                  v193 = sel_getName(a2);
                  v131 = 45;
                  if (v129)
                    v131 = 43;
                  v189 = v130;
                  v2 = (NFRemoteAdminReaderSession *)p_isa;
                  v127(3, "%c[%{public}s %{public}s]:%i Invalid Response APDU. Bailing out now.", v131, v189, v193, 255);
                }
                v132 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v133 = NFSharedLogGetLogger(v132);
                v134 = objc_claimAutoreleasedReturnValue(v133);
                if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
                {
                  v135 = object_getClass(v2);
                  if (class_isMetaClass(v135))
                    v136 = 43;
                  else
                    v136 = 45;
                  v137 = object_getClassName(v2);
                  v138 = sel_getName(a2);
                  *(_DWORD *)buf = 67109890;
                  v228 = v136;
                  v229 = 2082;
                  v230 = v137;
                  v231 = 2082;
                  v232 = v138;
                  v233 = 1024;
                  v234 = 255;
                  _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid Response APDU. Bailing out now.", buf, 0x22u);
                }

                v2->_cardValidationStatus = 5;
                v110 = 1;
              }

              v14 = v207;
            }
            else
            {
              v111 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v112 = NFLogGetLogger(v111);
              if (v112)
              {
                v113 = (void (*)(uint64_t, const char *, ...))v112;
                v114 = object_getClass(v2);
                v115 = class_isMetaClass(v114);
                v116 = object_getClassName(v2);
                v192 = sel_getName(a2);
                v117 = 45;
                if (v115)
                  v117 = 43;
                v188 = v116;
                v2 = (NFRemoteAdminReaderSession *)p_isa;
                v113(3, "%c[%{public}s %{public}s]:%i Invalid Command APDU. Bailing out now.", v117, v188, v192, 247);
              }
              v118 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v119 = NFSharedLogGetLogger(v118);
              v120 = objc_claimAutoreleasedReturnValue(v119);
              if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
              {
                v121 = object_getClass(v2);
                if (class_isMetaClass(v121))
                  v122 = 43;
                else
                  v122 = 45;
                v123 = object_getClassName(v2);
                v124 = sel_getName(a2);
                *(_DWORD *)buf = 67109890;
                v228 = v122;
                v229 = 2082;
                v230 = v123;
                v231 = 2082;
                v232 = v124;
                v233 = 1024;
                v234 = 247;
                _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid Command APDU. Bailing out now.", buf, 0x22u);
              }

              v2->_cardValidationStatus = 4;
              v110 = 1;
            }

            if (v110)
              goto LABEL_128;
            v46 = v204 + 1;
            v45 = v201;
            v43 = v206;
          }
          while ((id)(v204 + 1) != v202);
          v44 = objc_msgSend(v206, "countByEnumeratingWithState:objects:count:", &v219, v242, 16);
          if (v44)
            continue;
          break;
        }
      }

      v223 = CFSTR("data");
      v224 = v14;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v224, &v223, 1));

    }
    else
    {
      v17 = 0;
      v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v19 = NFLogGetLogger(v18);
      if (v19)
      {
        v20 = (void (*)(uint64_t, const char *, ...))v19;
        v21 = object_getClass(v2);
        v22 = class_isMetaClass(v21);
        v23 = object_getClassName(v2);
        v190 = sel_getName(a2);
        v24 = 45;
        if (v22)
          v24 = 43;
        v20(3, "%c[%{public}s %{public}s]:%i Invalid Command APDU. Bailing out now.", v24, v23, v190, 156);
      }
      v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v26 = NFSharedLogGetLogger(v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = object_getClass(v2);
        if (class_isMetaClass(v28))
          v29 = 43;
        else
          v29 = 45;
        *(_DWORD *)buf = 67109890;
        v228 = v29;
        v229 = 2082;
        v230 = object_getClassName(v2);
        v231 = 2082;
        v232 = sel_getName(a2);
        v233 = 1024;
        v234 = 156;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid Command APDU. Bailing out now.", buf, 0x22u);
      }

      v2->_cardValidationStatus = 4;
LABEL_129:

      v13 = 0;
    }
  }

  return v13;
}

- (BOOL)_validateCardForFelica
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *v13;
  _BOOL4 v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  BOOL v24;
  unint64_t v25;
  void *specific;
  uint64_t Logger;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  objc_class *v37;
  int v38;
  const char *v39;
  const char *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  NFReaderSession *readerSession;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void *k;
  void *v52;
  uint64_t v53;
  void (*v54)(uint64_t, const char *, ...);
  objc_class *v55;
  _BOOL4 v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  objc_class *v62;
  int v63;
  const char *v64;
  const char *v65;
  NFReaderSession *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  void *j;
  void *v73;
  uint64_t v74;
  void (*v75)(uint64_t, const char *, ...);
  objc_class *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  NSObject *v81;
  objc_class *v82;
  int v83;
  const char *v84;
  const char *v86;
  const char *v87;
  const char *v88;
  id v89;
  _BOOL4 v90;
  const char *v91;
  void *v92;
  void *v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  _BYTE v110[128];
  uint8_t v111[128];
  uint8_t buf[4];
  int v113;
  __int16 v114;
  const char *v115;
  __int16 v116;
  const char *v117;
  __int16 v118;
  int v119;
  __int16 v120;
  unsigned int v121;

  if (-[NFTag technology](self->_tag, "technology") != 4)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v28 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v89 = -[NFTag technology](self->_tag, "technology");
      v33 = 45;
      if (isMetaClass)
        v33 = 43;
      v28(4, "%c[%{public}s %{public}s]:%i Unsupported tag, technology=%d", v33, ClassName, Name, 280, v89);
    }
    v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v35 = NFSharedLogGetLogger(v34);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = object_getClass(self);
      if (class_isMetaClass(v37))
        v38 = 43;
      else
        v38 = 45;
      v39 = object_getClassName(self);
      v40 = sel_getName(a2);
      v41 = -[NFTag technology](self->_tag, "technology");
      *(_DWORD *)buf = 67110146;
      v113 = v38;
      v114 = 2082;
      v115 = v39;
      v116 = 2082;
      v117 = v40;
      v118 = 1024;
      v119 = 280;
      v120 = 1024;
      v121 = v41;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unsupported tag, technology=%d", buf, 0x28u);
    }

    v24 = 0;
    self->_cardValidationStatus = 2;
    return v24;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession _getSessionSystemCode](self, "_getSessionSystemCode"));
  if (!v4)
  {
    v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v53 = NFLogGetLogger(v52);
    if (v53)
    {
      v54 = (void (*)(uint64_t, const char *, ...))v53;
      v55 = object_getClass(self);
      v56 = class_isMetaClass(v55);
      v57 = object_getClassName(self);
      v87 = sel_getName(a2);
      v58 = 45;
      if (v56)
        v58 = 43;
      v54(4, "%c[%{public}s %{public}s]:%i Missing system code definition", v58, v57, v87, 287);
    }
    v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v60 = NFSharedLogGetLogger(v59);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      v62 = object_getClass(self);
      if (class_isMetaClass(v62))
        v63 = 43;
      else
        v63 = 45;
      v64 = object_getClassName(self);
      v65 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v113 = v63;
      v114 = 2082;
      v115 = v64;
      v116 = 2082;
      v117 = v65;
      v118 = 1024;
      v119 = 287;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing system code definition", buf, 0x22u);
    }

    v24 = 0;
    v25 = 10;
    goto LABEL_52;
  }
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFTag allSystemCodes](self->_tag, "allSystemCodes"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v105, v111, 16);
  if (!v6)
    goto LABEL_11;
  v7 = v6;
  v8 = *(_QWORD *)v106;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v106 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)i), "isEqualToData:", v4) & 1) != 0)
      {

        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", CFSTR("FFFF")));
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession _getRequireServiceV1List](self, "_getRequireServiceV1List"));
        if (!objc_msgSend(v43, "count"))
        {
LABEL_67:
          self->_cardValidationStatus = 14;
          v24 = 1;
LABEL_79:

          goto LABEL_80;
        }
        readerSession = self->_readerSession;
        v104 = 0;
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[NFReaderSession felicaRequestService:error:](readerSession, "felicaRequestService:error:", v43, &v104));
        v46 = v104;
        if (v46)
        {
LABEL_54:
          v66 = self->_readerSession;
          v99 = v46;
          v67 = (void *)objc_claimAutoreleasedReturnValue(-[NFReaderSession felicaRequestService:forSystemCode:error:](v66, "felicaRequestService:forSystemCode:error:", v43, v4, &v99));
          v68 = v99;

          if (v68)
          {
            self->_cardValidationStatus = 12;
LABEL_78:

            v24 = 0;
            goto LABEL_79;
          }
          v93 = v43;
          v94 = v45;
          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          v92 = v67;
          v47 = v67;
          v69 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
          if (v69)
          {
            v70 = v69;
            v71 = *(_QWORD *)v96;
            while (2)
            {
              for (j = 0; j != v70; j = (char *)j + 1)
              {
                if (*(_QWORD *)v96 != v71)
                  objc_enumerationMutation(v47);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)j), "isEqualToData:", v42))
                {
                  v73 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  v74 = NFLogGetLogger(v73);
                  if (v74)
                  {
                    v75 = (void (*)(uint64_t, const char *, ...))v74;
                    v76 = object_getClass(self);
                    v90 = class_isMetaClass(v76);
                    v77 = object_getClassName(self);
                    v88 = sel_getName(a2);
                    v78 = 45;
                    if (v90)
                      v78 = 43;
                    v75(4, "%c[%{public}s %{public}s]:%i Require service not found", v78, v77, v88, 336);
                  }
                  v79 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  v80 = NFSharedLogGetLogger(v79);
                  v81 = objc_claimAutoreleasedReturnValue(v80);
                  v67 = v92;
                  if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                  {
                    v82 = object_getClass(self);
                    if (class_isMetaClass(v82))
                      v83 = 43;
                    else
                      v83 = 45;
                    v91 = object_getClassName(self);
                    v84 = sel_getName(a2);
                    *(_DWORD *)buf = 67109890;
                    v113 = v83;
                    v114 = 2082;
                    v115 = v91;
                    v116 = 2082;
                    v117 = v84;
                    v118 = 1024;
                    v119 = 336;
                    _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Require service not found", buf, 0x22u);
                  }

                  self->_cardValidationStatus = 13;
                  v43 = v93;
                  v45 = v94;
                  goto LABEL_78;
                }
              }
              v70 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
              if (v70)
                continue;
              break;
            }
          }

        }
        else
        {
          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
          v94 = v45;
          v47 = v45;
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
          if (!v48)
          {
LABEL_66:

            goto LABEL_67;
          }
          v49 = v48;
          v93 = v43;
          v50 = *(_QWORD *)v101;
          while (2)
          {
            for (k = 0; k != v49; k = (char *)k + 1)
            {
              if (*(_QWORD *)v101 != v50)
                objc_enumerationMutation(v47);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)k), "isEqualToData:", v42) & 1) != 0)
              {

                v43 = v93;
                v45 = v94;
                goto LABEL_54;
              }
            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
            if (v49)
              continue;
            break;
          }
        }
        v43 = v93;
        goto LABEL_66;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v105, v111, 16);
    if (v7)
      continue;
    break;
  }
LABEL_11:

  v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v11 = NFLogGetLogger(v10);
  if (v11)
  {
    v12 = (void (*)(uint64_t, const char *, ...))v11;
    v13 = object_getClass(self);
    v14 = class_isMetaClass(v13);
    v15 = object_getClassName(self);
    v86 = sel_getName(a2);
    v16 = 45;
    if (v14)
      v16 = 43;
    v12(4, "%c[%{public}s %{public}s]:%i Card system code mismatch for the session", v16, v15, v86, 301);
  }
  v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = NFSharedLogGetLogger(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = object_getClass(self);
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    v22 = object_getClassName(self);
    v23 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v113 = v21;
    v114 = 2082;
    v115 = v22;
    v116 = 2082;
    v117 = v23;
    v118 = 1024;
    v119 = 301;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Card system code mismatch for the session", buf, 0x22u);
  }

  v24 = 0;
  v25 = 11;
LABEL_52:
  self->_cardValidationStatus = v25;
LABEL_80:

  return v24;
}

- (BOOL)_executePreCheckScripts:(id)a3
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
  void *v21;
  uint64_t v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  _BOOL4 v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  objc_class *v30;
  int v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *i;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  char *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  uint64_t v58;
  void (*v59)(uint64_t, const char *, ...);
  objc_class *v60;
  _BOOL4 v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  objc_class *v68;
  int v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
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
  void *v87;
  uint64_t v88;
  void (*v89)(uint64_t, const char *, ...);
  objc_class *v90;
  _BOOL4 v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  NSObject *v97;
  objc_class *v98;
  int v99;
  const char *v100;
  id v101;
  NFRemoteAdminReaderSession *v102;
  void *v103;
  uint64_t v104;
  void (*v105)(uint64_t, const char *, ...);
  objc_class *v106;
  _BOOL4 v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  NSObject *v113;
  objc_class *v114;
  int v115;
  const char *v116;
  const char *v117;
  void *v118;
  id v119;
  void *v120;
  uint64_t v121;
  void (*v122)(uint64_t, const char *, ...);
  objc_class *v123;
  _BOOL4 v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  NSObject *v129;
  objc_class *v130;
  int v131;
  const char *v132;
  const char *v133;
  BOOL v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  void (*v139)(uint64_t, const char *, ...);
  objc_class *v140;
  _BOOL4 v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  NSObject *v145;
  objc_class *v146;
  int v147;
  const char *v148;
  const char *v149;
  const char *v151;
  const char *Name;
  const char *v153;
  const char *v154;
  const char *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  id v159;
  id v160;
  const char *v161;
  void *v162;
  NFRemoteAdminReaderSession *v163;
  const char *sel;
  void *v165;
  id obj;
  void *v167;
  uint64_t v168;
  id v169;
  id v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  uint8_t buf[4];
  int v180;
  __int16 v181;
  const char *v182;
  __int16 v183;
  const char *v184;
  __int16 v185;
  int v186;
  __int16 v187;
  uint64_t v188;
  __int16 v189;
  char *v190;
  __int16 v191;
  id v192;
  _BYTE v193[128];
  _BYTE v194[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_arrayForKey:", CFSTR("validateCardScript")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("validateCardScript")));

  if (v7 && !v6)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i Invalid check script", v14, ClassName, Name, 356);
    }
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    v18 = object_getClass(self);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    *(_DWORD *)buf = 67109890;
    v180 = v19;
    v181 = 2082;
    v182 = object_getClassName(self);
    v183 = 2082;
    v184 = sel_getName(a2);
    v185 = 1024;
    v186 = 356;
    v20 = "%c[%{public}s %{public}s]:%i Invalid check script";
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v20, buf, 0x22u);
LABEL_23:

    goto LABEL_24;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v22 = NFLogGetLogger(v21);
    if (v22)
    {
      v23 = (void (*)(uint64_t, const char *, ...))v22;
      v24 = object_getClass(self);
      v25 = class_isMetaClass(v24);
      v26 = object_getClassName(self);
      v153 = sel_getName(a2);
      v27 = 45;
      if (v25)
        v27 = 43;
      v23(4, "%c[%{public}s %{public}s]:%i Script is empty", v27, v26, v153, 358);
    }
    v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v29 = NFSharedLogGetLogger(v28);
    v17 = objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    v30 = object_getClass(self);
    if (class_isMetaClass(v30))
      v31 = 43;
    else
      v31 = 45;
    *(_DWORD *)buf = 67109890;
    v180 = v31;
    v181 = 2082;
    v182 = object_getClassName(self);
    v183 = 2082;
    v184 = sel_getName(a2);
    v185 = 1024;
    v186 = 358;
    v20 = "%c[%{public}s %{public}s]:%i Script is empty";
    goto LABEL_22;
  }
LABEL_24:
  v177 = 0u;
  v178 = 0u;
  v175 = 0u;
  v176 = 0u;
  obj = v6;
  v169 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, v194, 16);
  if (!v169)
  {
    v134 = 1;
    goto LABEL_122;
  }
  v160 = v5;
  v168 = *(_QWORD *)v176;
  v163 = self;
  sel = a2;
LABEL_26:
  v32 = 0;
  while (1)
  {
    if (*(_QWORD *)v176 != v168)
      objc_enumerationMutation(obj);
    v33 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * v32);
    v34 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v33, v34) & 1) == 0)
    {
      v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v58 = NFLogGetLogger(v57);
      if (v58)
      {
        v59 = (void (*)(uint64_t, const char *, ...))v58;
        v60 = object_getClass(self);
        v61 = class_isMetaClass(v60);
        v62 = object_getClassName(self);
        v63 = sel_getName(a2);
        v157 = objc_opt_class(v33);
        v64 = 45;
        if (v61)
          v64 = 43;
        v59(3, "%c[%{public}s %{public}s]:%i Invalid element type in array, got %{public}@", v64, v62, v63, 363, v157);
      }
      v65 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v66 = NFSharedLogGetLogger(v65);
      v67 = objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        v68 = object_getClass(self);
        if (class_isMetaClass(v68))
          v69 = 43;
        else
          v69 = 45;
        v70 = object_getClassName(self);
        v71 = sel_getName(a2);
        v72 = objc_opt_class(v33);
        *(_DWORD *)buf = 67110146;
        v180 = v69;
        v181 = 2082;
        v182 = v70;
        v183 = 2082;
        v184 = v71;
        v185 = 1024;
        v186 = 363;
        v187 = 2114;
        v188 = v72;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid element type in array, got %{public}@", buf, 0x2Cu);
      }

      goto LABEL_106;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "NF_stringForKey:", CFSTR("command")));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v35));
    if (!objc_msgSend(v36, "length"))
      break;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NFReaderSession transceive:](self->_readerSession, "transceive:", v36));
    v167 = v37;
    if (v37)
    {
      v165 = v36;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "NF_asHexString"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "NF_arrayForKey:", CFSTR("filter")));
      v171 = 0u;
      v172 = 0u;
      v173 = 0u;
      v174 = 0u;
      v170 = v39;
      v40 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v171, v193, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v172;
        v162 = v35;
        while (2)
        {
          for (i = 0; i != v41; i = (char *)i + 1)
          {
            if (*(_QWORD *)v172 != v42)
              objc_enumerationMutation(v170);
            v44 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * (_QWORD)i);
            v45 = objc_opt_class(NSDictionary);
            if ((objc_opt_isKindOfClass(v44, v45) & 1) == 0)
            {
              v103 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v104 = NFLogGetLogger(v103);
              if (v104)
              {
                v105 = (void (*)(uint64_t, const char *, ...))v104;
                v106 = object_getClass(v163);
                v107 = class_isMetaClass(v106);
                v108 = object_getClassName(v163);
                v109 = sel_getName(sel);
                v158 = objc_opt_class(v44);
                v110 = 45;
                if (v107)
                  v110 = 43;
                v105(3, "%c[%{public}s %{public}s]:%i Invalid type in de-serialization %{public}@", v110, v108, v109, 392, v158);
              }
              v111 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v112 = NFSharedLogGetLogger(v111);
              v113 = objc_claimAutoreleasedReturnValue(v112);
              v35 = v162;
              if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
              {
                v114 = object_getClass(v163);
                if (class_isMetaClass(v114))
                  v115 = 43;
                else
                  v115 = 45;
                v116 = object_getClassName(v163);
                v117 = sel_getName(sel);
                v118 = (void *)objc_opt_class(v44);
                *(_DWORD *)buf = 67110146;
                v180 = v115;
                v181 = 2082;
                v182 = v116;
                v183 = 2082;
                v184 = v117;
                v185 = 1024;
                v186 = 392;
                v187 = 2114;
                v188 = (uint64_t)v118;
                v119 = v118;
                _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid type in de-serialization %{public}@", buf, 0x2Cu);

              }
              self = v163;
              v163->_cardValidationStatus = 9;
              v56 = 1;
              goto LABEL_104;
            }
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "NF_numberForKey:", CFSTR("length")));

            if (v46)
            {
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKey:", CFSTR("length")));
              v48 = (char *)objc_msgSend(v47, "integerValue");

            }
            else
            {
              v48 = 0;
            }
            v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "NF_numberForKey:", CFSTR("offset")));

            if (v49)
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKey:", CFSTR("offset")));
              v49 = (uint64_t)objc_msgSend(v50, "integerValue");

            }
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "NF_arrayForKey:", CFSTR("value")));
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "valueForKey:", CFSTR("uppercaseString")));
            v53 = objc_opt_class(NSArray);
            if ((objc_opt_isKindOfClass(v52, v53) & 1) == 0)
            {

              v52 = 0;
            }
            if (v49 < 0 && (v49 += (uint64_t)objc_msgSend(v38, "length"), v49 < 0)
              || &v48[v49] > objc_msgSend(v38, "length"))
            {
              v87 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v88 = NFLogGetLogger(v87);
              if (v88)
              {
                v89 = (void (*)(uint64_t, const char *, ...))v88;
                v90 = object_getClass(v163);
                v91 = class_isMetaClass(v90);
                v92 = object_getClassName(v163);
                v93 = sel_getName(sel);
                v159 = objc_msgSend(v38, "length");
                v94 = 45;
                if (v91)
                  v94 = 43;
                v89(3, "%c[%{public}s %{public}s]:%i Validation Error: Invalid filter length or offset: startingOffset = %ld, length = %ld, [rResponse length] = %lu", v94, v92, v93, 436, v49, v48, v159);
              }
              v95 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v96 = NFSharedLogGetLogger(v95);
              v97 = objc_claimAutoreleasedReturnValue(v96);
              v35 = v162;
              if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
              {
                v98 = object_getClass(v163);
                if (class_isMetaClass(v98))
                  v99 = 43;
                else
                  v99 = 45;
                v161 = object_getClassName(v163);
                v100 = sel_getName(sel);
                v101 = objc_msgSend(v38, "length");
                *(_DWORD *)buf = 67110658;
                v180 = v99;
                v181 = 2082;
                v182 = v161;
                v183 = 2082;
                v184 = v100;
                v185 = 1024;
                v186 = 436;
                v187 = 2048;
                v188 = v49;
                v189 = 2048;
                v190 = v48;
                v191 = 2048;
                v192 = v101;
                _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Validation Error: Invalid filter length or offset: startingOffset = %ld, length = %ld, [rResponse length] = %lu", buf, 0x40u);
              }

              v102 = v163;
              v163->_cardValidationStatus = 6;
              goto LABEL_103;
            }
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "substringWithRange:", v49, v48));
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "uppercaseString"));

            if ((objc_msgSend(v52, "containsObject:", v55) & 1) == 0)
            {
              v120 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v121 = NFLogGetLogger(v120);
              if (v121)
              {
                v122 = (void (*)(uint64_t, const char *, ...))v121;
                v123 = object_getClass(v163);
                v124 = class_isMetaClass(v123);
                v125 = object_getClassName(v163);
                v155 = sel_getName(sel);
                v126 = 45;
                if (v124)
                  v126 = 43;
                v122(3, "%c[%{public}s %{public}s]:%i Validation Error: retrieved Value not found in the allowed list", v126, v125, v155, 429);
              }
              v127 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v128 = NFSharedLogGetLogger(v127);
              v129 = objc_claimAutoreleasedReturnValue(v128);
              v35 = v162;
              if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
              {
                v130 = object_getClass(v163);
                if (class_isMetaClass(v130))
                  v131 = 43;
                else
                  v131 = 45;
                v132 = object_getClassName(v163);
                v133 = sel_getName(sel);
                *(_DWORD *)buf = 67109890;
                v180 = v131;
                v181 = 2082;
                v182 = v132;
                v183 = 2082;
                v184 = v133;
                v185 = 1024;
                v186 = 429;
                _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Validation Error: retrieved Value not found in the allowed list", buf, 0x22u);
              }

              v102 = v163;
              v163->_cardValidationStatus = 3;

LABEL_103:
              self = v102;

              v56 = 1;
              goto LABEL_104;
            }

          }
          v41 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v171, v193, 16);
          v56 = 0;
          v35 = v162;
          self = v163;
          if (v41)
            continue;
          break;
        }
      }
      else
      {
        v56 = 0;
      }
LABEL_104:

      a2 = sel;
      v36 = v165;
    }
    else
    {
      v73 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v74 = NFLogGetLogger(v73);
      if (v74)
      {
        v75 = (void (*)(uint64_t, const char *, ...))v74;
        v76 = object_getClass(self);
        v77 = class_isMetaClass(v76);
        v78 = object_getClassName(self);
        v154 = sel_getName(a2);
        v79 = 45;
        if (v77)
          v79 = 43;
        v75(3, "%c[%{public}s %{public}s]:%i Invalid Response APDU. Bailing out now.", v79, v78, v154, 379);
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
        v180 = v84;
        v181 = 2082;
        v182 = v85;
        v183 = 2082;
        v184 = v86;
        v185 = 1024;
        v186 = 379;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid Response APDU. Bailing out now.", buf, 0x22u);
      }

      self->_cardValidationStatus = 5;
      v56 = 1;
    }

    if (v56)
    {
      v134 = 0;
LABEL_121:
      v5 = v160;
      goto LABEL_122;
    }
LABEL_106:
    if ((id)++v32 == v169)
    {
      v169 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, v194, 16);
      if (v169)
        goto LABEL_26;
      v134 = 1;
      goto LABEL_121;
    }
  }
  v135 = v36;
  v136 = v35;
  v137 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v138 = NFLogGetLogger(v137);
  if (v138)
  {
    v139 = (void (*)(uint64_t, const char *, ...))v138;
    v140 = object_getClass(self);
    v141 = class_isMetaClass(v140);
    v151 = object_getClassName(self);
    v156 = sel_getName(a2);
    v142 = 45;
    if (v141)
      v142 = 43;
    v139(3, "%c[%{public}s %{public}s]:%i Validation Error: Invalid command apdu %{public}@. Bailing out", v142, v151, v156, 372, v135);
  }
  v143 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v144 = NFSharedLogGetLogger(v143);
  v145 = objc_claimAutoreleasedReturnValue(v144);
  v5 = v160;
  if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
  {
    v146 = object_getClass(self);
    if (class_isMetaClass(v146))
      v147 = 43;
    else
      v147 = 45;
    v148 = object_getClassName(self);
    v149 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v180 = v147;
    v181 = 2082;
    v182 = v148;
    v183 = 2082;
    v184 = v149;
    v185 = 1024;
    v186 = 372;
    v187 = 2114;
    v188 = (uint64_t)v135;
    _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Validation Error: Invalid command apdu %{public}@. Bailing out", buf, 0x2Cu);
  }

  self->_cardValidationStatus = 4;
  v134 = 0;
LABEL_122:

  return v134;
}

- (BOOL)_validateCardForMercury:(id)a3
{
  id v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  unsigned __int8 v9;
  unint64_t v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *Name;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  const __CFString *v36;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_stringForKey:", CFSTR("technology")));
  if (v6)
    v7 = (__CFString *)v6;
  else
    v7 = &stru_100055418;
  if ((-[NFTag technology](self->_tag, "technology") & 1) != 0)
  {
    v8 = CFSTR("A");
  }
  else if ((-[NFTag technology](self->_tag, "technology") & 2) != 0)
  {
    v8 = CFSTR("B");
  }
  else if ((-[NFTag technology](self->_tag, "technology") & 4) != 0)
  {
    v8 = CFSTR("F");
  }
  else
  {
    v8 = &stru_100055418;
  }
  v9 = -[__CFString containsString:](v7, "containsString:", v8);
  if ((v9 & 1) != 0)
  {
    if (!-[NFRemoteAdminReaderSession _executePreCheckScripts:](self, "_executePreCheckScripts:", v5))
    {
      v9 = 0;
      goto LABEL_26;
    }
    v10 = 0;
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v17 = 45;
      if (isMetaClass)
        v17 = 43;
      v13(3, "%c[%{public}s %{public}s]:%i Server supplied technology %{public}@ does not match with the Tag Technology %{public}@. Exiting now!", v17, ClassName, Name, 463, v7, v8);
    }
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFSharedLogGetLogger(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = object_getClass(self);
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      *(_DWORD *)buf = 67110402;
      v26 = v22;
      v27 = 2082;
      v28 = object_getClassName(self);
      v29 = 2082;
      v30 = sel_getName(a2);
      v31 = 1024;
      v32 = 463;
      v33 = 2114;
      v34 = v7;
      v35 = 2114;
      v36 = v8;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Server supplied technology %{public}@ does not match with the Tag Technology %{public}@. Exiting now!", buf, 0x36u);
    }

    v10 = 2;
  }
  self->_cardValidationStatus = v10;
LABEL_26:

  return v9;
}

- (BOOL)_validateCardForMiFare:(id)a3
{
  id v4;
  __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *v12;
  _BOOL4 v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  unsigned int v24;
  const __CFString *v25;
  void *specific;
  uint64_t Logger;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  objc_class *v36;
  int v37;
  BOOL v38;
  unsigned int v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void (*v48)(uint64_t, const char *, ...);
  objc_class *v49;
  _BOOL4 v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  objc_class *v57;
  int v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void (*v64)(uint64_t, const char *, ...);
  objc_class *v65;
  _BOOL4 v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  objc_class *v71;
  int v72;
  const char *v73;
  const char *v74;
  unint64_t v75;
  const char *v78;
  const char *v79;
  const char *Name;
  const char *v81;
  id v82;
  uint64_t v83;
  id v84;
  __CFString *v85;
  const __CFString *v86;
  id obj;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint8_t v93[128];
  uint8_t buf[4];
  int v95;
  __int16 v96;
  const char *v97;
  __int16 v98;
  const char *v99;
  __int16 v100;
  int v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  const __CFString *v105;

  v4 = a3;
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NF_stringForKey:", CFSTR("technology")));
  if (v5)
  {
    v6 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
    {

      v5 = &stru_100055418;
    }
  }
  if ((-[NFTag technology](self->_tag, "technology") & 1) != 0)
    v7 = CFSTR("A");
  else
    v7 = &stru_100055418;
  v85 = v5;
  if ((-[__CFString containsString:](v5, "containsString:", v7) & 1) == 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v28 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v32 = 45;
      if (isMetaClass)
        v32 = 43;
      v78 = ClassName;
      v5 = v85;
      v28(3, "%c[%{public}s %{public}s]:%i Server supplied technology %{public}@ does not match with the Tag Technology %{public}@. Exiting now!", v32, v78, Name, 492, v85, v7);
    }
    v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v34 = NFSharedLogGetLogger(v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = object_getClass(self);
      if (class_isMetaClass(v36))
        v37 = 43;
      else
        v37 = 45;
      *(_DWORD *)buf = 67110402;
      v95 = v37;
      v96 = 2082;
      v97 = object_getClassName(self);
      v98 = 2082;
      v99 = sel_getName(a2);
      v100 = 1024;
      v101 = 492;
      v102 = 2114;
      v103 = (uint64_t)v5;
      v104 = 2114;
      v105 = v7;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Server supplied technology %{public}@ does not match with the Tag Technology %{public}@. Exiting now!", buf, 0x36u);
    }

    v38 = 0;
    self->_cardValidationStatus = 2;
    goto LABEL_66;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NF_arrayForKey:", CFSTR("tagType")));
  v9 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v10 = NFLogGetLogger(v9);
  v84 = v4;
  if (v10)
  {
    v11 = (void (*)(uint64_t, const char *, ...))v10;
    v12 = object_getClass(self);
    v13 = class_isMetaClass(v12);
    v14 = object_getClassName(self);
    v15 = sel_getName(a2);
    v82 = -[NFTag type](self->_tag, "type");
    v16 = 45;
    if (v13)
      v16 = 43;
    v11(6, "%c[%{public}s %{public}s]:%i Tag Type %d found", v16, v14, v15, 499, v82);
  }
  v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = NFSharedLogGetLogger(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = object_getClass(self);
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    v22 = object_getClassName(self);
    v23 = sel_getName(a2);
    v24 = -[NFTag type](self->_tag, "type");
    *(_DWORD *)buf = 67110146;
    v95 = v21;
    v96 = 2082;
    v97 = v22;
    v98 = 2082;
    v99 = v23;
    v100 = 1024;
    v101 = 499;
    v102 = 1024;
    LODWORD(v103) = v24;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag Type %d found", buf, 0x28u);
  }

  if (-[NFTag type](self->_tag, "type") == 15)
  {
    v25 = CFSTR("MiFarePlus");
  }
  else
  {
    v39 = -[NFTag type](self->_tag, "type");
    v25 = CFSTR("Unknown");
    if (v39 == 16)
      v25 = CFSTR("DesFire");
  }
  v86 = v25;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v8;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
  if (!v40)
  {
LABEL_51:

    v62 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v63 = NFLogGetLogger(v62);
    if (v63)
    {
      v64 = (void (*)(uint64_t, const char *, ...))v63;
      v65 = object_getClass(self);
      v66 = class_isMetaClass(v65);
      v79 = object_getClassName(self);
      v81 = sel_getName(a2);
      v67 = 45;
      if (v66)
        v67 = 43;
      v64(6, "%c[%{public}s %{public}s]:%i Unsupported Tag Type %{public}@ found", v67, v79, v81, 521, v86);
    }
    v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v69 = NFSharedLogGetLogger(v68);
    v70 = objc_claimAutoreleasedReturnValue(v69);
    v5 = v85;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      v71 = object_getClass(self);
      if (class_isMetaClass(v71))
        v72 = 43;
      else
        v72 = 45;
      v73 = object_getClassName(self);
      v74 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v95 = v72;
      v96 = 2082;
      v97 = v73;
      v98 = 2082;
      v99 = v74;
      v100 = 1024;
      v101 = 521;
      v102 = 2114;
      v103 = (uint64_t)v86;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unsupported Tag Type %{public}@ found", buf, 0x2Cu);
    }

    v38 = 0;
    v75 = 15;
    v4 = v84;
LABEL_63:
    self->_cardValidationStatus = v75;
    goto LABEL_65;
  }
  v41 = v40;
  v42 = *(_QWORD *)v90;
LABEL_33:
  v43 = 0;
  while (1)
  {
    if (*(_QWORD *)v90 != v42)
      objc_enumerationMutation(obj);
    v44 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v43);
    v45 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v44, v45) & 1) == 0)
    {
      v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v47 = NFLogGetLogger(v46);
      if (v47)
      {
        v48 = (void (*)(uint64_t, const char *, ...))v47;
        v49 = object_getClass(self);
        v50 = class_isMetaClass(v49);
        v51 = object_getClassName(self);
        v52 = sel_getName(a2);
        v83 = objc_opt_class(v44);
        v53 = 45;
        if (v50)
          v53 = 43;
        v48(3, "%c[%{public}s %{public}s]:%i Invalid type string, got %{public}@", v53, v51, v52, 513, v83);
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
        v59 = object_getClassName(self);
        v60 = sel_getName(a2);
        v61 = objc_opt_class(v44);
        *(_DWORD *)buf = 67110146;
        v95 = v58;
        v96 = 2082;
        v97 = v59;
        v98 = 2082;
        v99 = v60;
        v100 = 1024;
        v101 = 513;
        v102 = 2114;
        v103 = v61;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid type string, got %{public}@", buf, 0x2Cu);
      }

      goto LABEL_49;
    }
    if (!objc_msgSend(v44, "caseInsensitiveCompare:", v86))
      break;
LABEL_49:
    if (v41 == (id)++v43)
    {
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
      if (v41)
        goto LABEL_33;
      goto LABEL_51;
    }
  }

  v4 = v84;
  if (-[NFRemoteAdminReaderSession _executePreCheckScripts:](self, "_executePreCheckScripts:", v84))
  {
    v75 = 0;
    v38 = 1;
    v5 = v85;
    goto LABEL_63;
  }
  v38 = 0;
  v5 = v85;
LABEL_65:

LABEL_66:
  return v38;
}

- (BOOL)_validateCard
{
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  id v9;
  unsigned __int8 v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *v15;
  _BOOL4 v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  void *specific;
  uint64_t Logger;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  const char *ClassName;
  const char *v37;
  const char *Name;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;

  if (self->_readerSession)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession sessionCardServiceInfo](self, "sessionCardServiceInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version")));
    v6 = objc_opt_class(NSNumber);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    if ((isKindOfClass & 1) != 0
      && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"))),
          v9 = objc_msgSend(v8, "intValue"),
          v8,
          (int)v9 > 2))
    {
      if ((_DWORD)v9 == 4)
      {
        v10 = -[NFRemoteAdminReaderSession _validateCardForMiFare:](self, "_validateCardForMiFare:", v4);
      }
      else
      {
        if ((_DWORD)v9 != 3)
        {
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          if (Logger)
          {
            v27 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            v30 = 45;
            if (isMetaClass)
              v30 = 43;
            v27(3, "%c[%{public}s %{public}s]:%i cardServiceInfo.version: %d is > 4. Invalid version.", v30, ClassName, Name, 570, v9);
          }
          v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v32 = NFSharedLogGetLogger(v31);
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v34 = object_getClass(self);
            if (class_isMetaClass(v34))
              v35 = 43;
            else
              v35 = 45;
            *(_DWORD *)buf = 67110146;
            v40 = v35;
            v41 = 2082;
            v42 = object_getClassName(self);
            v43 = 2082;
            v44 = sel_getName(a2);
            v45 = 1024;
            v46 = 570;
            v47 = 1024;
            v48 = (int)v9;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i cardServiceInfo.version: %d is > 4. Invalid version.", buf, 0x28u);
          }

          v11 = 0;
          goto LABEL_6;
        }
        v10 = -[NFRemoteAdminReaderSession _validateCardForMercury:](self, "_validateCardForMercury:", v4);
      }
    }
    else
    {
      v10 = -[NFRemoteAdminReaderSession _validateCardForFelica](self, "_validateCardForFelica");
    }
    v11 = v10;
LABEL_6:

    return v11;
  }
  v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v13 = NFLogGetLogger(v12);
  if (v13)
  {
    v14 = (void (*)(uint64_t, const char *, ...))v13;
    v15 = object_getClass(self);
    v16 = class_isMetaClass(v15);
    v17 = object_getClassName(self);
    v37 = sel_getName(a2);
    v18 = 45;
    if (v16)
      v18 = 43;
    v14(3, "%c[%{public}s %{public}s]:%i Reader Session does not exist. Exiting now!", v18, v17, v37, 544);
  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFSharedLogGetLogger(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = object_getClass(self);
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    *(_DWORD *)buf = 67109890;
    v40 = v23;
    v41 = 2082;
    v42 = object_getClassName(self);
    v43 = 2082;
    v44 = sel_getName(a2);
    v45 = 1024;
    v46 = 544;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Reader Session does not exist. Exiting now!", buf, 0x22u);
  }

  v11 = 0;
  self->_cardValidationStatus = 8;
  return v11;
}

- (id)_getRequireServiceV1List
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  _UNKNOWN **v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *v20;
  _BOOL4 v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  Class v31;
  objc_class *v32;
  void *specific;
  uint64_t Logger;
  void (*v35)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  objc_class *v43;
  int v44;
  const char *v45;
  const char *v46;
  id v47;
  const char *v49;
  const char *Name;
  Class v51;
  void *v52;
  NSMutableArray *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  int v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  Class v68;
  _BYTE v69[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession sessionCardServiceInfo](self, "sessionCardServiceInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "NF_arrayForKey:", CFSTR("requiredServicesV1")));
  if (v4
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "NF_arrayForKey:", CFSTR("areaCodeList")))) != 0)
  {
    v52 = v3;
    v54 = objc_opt_new(NSMutableArray);
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    if (v6)
    {
      v7 = (unint64_t)v6;
      v8 = 0;
      v9 = &APSEnvironmentProduction_ptr;
      v10 = *(_QWORD *)v56;
      for (i = *(_QWORD *)v56; ; i = *(_QWORD *)v56)
      {
        if (i != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v8);
        v13 = objc_opt_class(v9[62]);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0 && objc_msgSend(v12, "length") == (id)4)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v12));
          if (v14)
          {
            -[NSMutableArray addObject:](v54, "addObject:", v14);
          }
          else
          {
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            Logger = NFLogGetLogger(specific);
            if (Logger)
            {
              v35 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v39 = 45;
              if (isMetaClass)
                v39 = 43;
              v35(4, "%c[%{public}s %{public}s]:%i Node data is null", v39, ClassName, Name, 597);
            }
            v40 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v41 = NFSharedLogGetLogger(v40);
            v42 = objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              v43 = object_getClass(self);
              if (class_isMetaClass(v43))
                v44 = 43;
              else
                v44 = 45;
              v45 = object_getClassName(self);
              v46 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              v60 = v44;
              v9 = &APSEnvironmentProduction_ptr;
              v61 = 2082;
              v62 = v45;
              v63 = 2082;
              v64 = v46;
              v65 = 1024;
              v66 = 597;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Node data is null", buf, 0x22u);
            }

          }
        }
        else
        {
          v15 = objc_opt_class(NSNumber);
          if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0)
          {
            *(_WORD *)buf = 0;
            *(_WORD *)buf = __rev16(objc_msgSend(v12, "unsignedShortValue"));
            v16 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", buf, 2);
            -[NSMutableArray addObject:](v54, "addObject:", v16);
          }
          else
          {
            v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v18 = NFLogGetLogger(v17);
            if (v18)
            {
              v19 = (void (*)(uint64_t, const char *, ...))v18;
              v20 = object_getClass(self);
              v21 = class_isMetaClass(v20);
              v22 = object_getClassName(self);
              v23 = sel_getName(a2);
              v51 = object_getClass(v12);
              v49 = v23;
              v9 = &APSEnvironmentProduction_ptr;
              v24 = 45;
              if (v21)
                v24 = 43;
              v19(3, "%c[%{public}s %{public}s]:%i Unexpected type, %{public}@", v24, v22, v49, 603, v51);
            }
            v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v26 = NFSharedLogGetLogger(v25);
            v16 = objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v27 = object_getClass(self);
              if (class_isMetaClass(v27))
                v28 = 43;
              else
                v28 = 45;
              v29 = object_getClassName(self);
              v30 = sel_getName(a2);
              v31 = object_getClass(v12);
              *(_DWORD *)buf = 67110146;
              v60 = v28;
              v61 = 2082;
              v62 = v29;
              v63 = 2082;
              v64 = v30;
              v9 = &APSEnvironmentProduction_ptr;
              v65 = 1024;
              v66 = 603;
              v67 = 2114;
              v68 = v31;
              v32 = v31;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected type, %{public}@", buf, 0x2Cu);

            }
          }

        }
        if (++v8 >= v7)
        {
          v47 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
          if (!v47)
            break;
          v7 = (unint64_t)v47;
          v8 = 0;
        }
      }
    }

    v3 = v52;
  }
  else
  {
    v54 = objc_opt_new(NSArray);
  }

  return v54;
}

- (id)_getSessionSystemCode
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  objc_class *v23;
  Class v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  Class v35;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession sessionCardServiceInfo](self, "sessionCardServiceInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemCode")));
  if (!v5)
    goto LABEL_17;
  v6 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v8 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
    {
      *(_WORD *)buf = __rev16(objc_msgSend(v5, "unsignedShortValue"));
      v7 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", buf, 2);
      goto LABEL_6;
    }
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v25 = object_getClass(v5);
      v17 = 45;
      if (isMetaClass)
        v17 = 43;
      v12(3, "%c[%{public}s %{public}s]:%i Unexpected type, %{public}@", v17, ClassName, Name, 625, v25);
    }
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFSharedLogGetLogger(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = object_getClass(self);
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      *(_DWORD *)buf = 67110146;
      v27 = v22;
      v28 = 2082;
      v29 = object_getClassName(self);
      v30 = 2082;
      v31 = sel_getName(a2);
      v32 = 1024;
      v33 = 625;
      v34 = 2114;
      v35 = object_getClass(v5);
      v23 = v35;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected type, %{public}@", buf, 0x2Cu);

    }
LABEL_17:
    v9 = 0;
    goto LABEL_18;
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v5));
LABEL_6:
  v9 = v7;
LABEL_18:

  return v9;
}

- (void)abort:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t cardIngestionStatus;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NFRemoteAdminReaderSession;
  -[NFRemoteAdminRedirectSession abort:](&v19, "abort:");
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sessionStartSem);
  -[NFRemoteAdminReaderSession _fireCardIngestionStatus:](self, "_fireCardIngestionStatus:", 5);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_tagSem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v6 = v5;
  if (a3 == 6)
  {
    cardIngestionStatus = 7;
    self->_cardIngestionStatus = 7;
  }
  else
  {
    cardIngestionStatus = self->_cardIngestionStatus;
    if (cardIngestionStatus == -1)
      cardIngestionStatus = 1;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stateUpdateOnSessionEndedCallback"));

  if (v8)
  {
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stateUpdateOnSessionEndedCallback"));
    ((void (**)(_QWORD, void *, unint64_t))v9)[2](v9, v6, cardIngestionStatus);

    objc_msgSend(v6, "setStateUpdateOnSessionEndedCallback:", 0);
  }
  v10 = objc_alloc((Class)NSMutableDictionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[NFRemoteAdminReaderSession targetTagType](self, "targetTagType")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_cardValidationStatus));
  v13 = objc_msgSend(v10, "initWithObjectsAndKeys:", &off_100057220, CFSTR("state"), v11, CFSTR("technology"), v12, CFSTR("cardValidationStatus"), 0);

  if (self->_cardIngestionStatus != -1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("sessionStatus"));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "spStatusCode"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "spStatusCode"));
    objc_msgSend(v13, "setObject:forKey:", v18, CFSTR("spStatus"));

  }
  +[NFReaderModeCardIngestionCALogger postAnalyticsReaderModeCardIngestionSession:prepOnly:](NFReaderModeCardIngestionCALogger, "postAnalyticsReaderModeCardIngestionSession:prepOnly:", v13, 0);

}

- (void)_fireCardIngestionStatus:(unint64_t)a3
{
  NFRemoteAdminReaderSession *v4;
  NFRemoteAdminSessionDelegate *delegate;

  v4 = self;
  if (self)
    self = (NFRemoteAdminReaderSession *)self->_delegate;
  if ((objc_opt_respondsToSelector(self, "handleCardIngestionStatus:") & 1) != 0)
  {
    if (v4)
      delegate = v4->_delegate;
    else
      delegate = 0;
    -[NFRemoteAdminSessionDelegate handleCardIngestionStatus:](delegate, "handleCardIngestionStatus:", a3);
  }
}

- (void)processNotification:(id)a3
{
  id v5;
  void *v6;
  NFRemoteAdminSessionDelegate *delegate;
  NFRemoteAdminSessionDelegate *v8;
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
  const char *ClassName;
  const char *Name;
  objc_super v25;
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

  v25.receiver = self;
  v25.super_class = (Class)NFRemoteAdminReaderSession;
  v5 = a3;
  -[NFRemoteAdminRedirectSession processNotification:](&v25, "processNotification:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_stringForKey:", CFSTR("tokenValue")));

  if (objc_msgSend(v6, "length"))
  {
    if (self)
      delegate = self->_delegate;
    else
      delegate = 0;
    if ((objc_opt_respondsToSelector(delegate, "handleCardSessionToken:") & 1) != 0)
    {
      if (self)
        v8 = self->_delegate;
      else
        v8 = 0;
      -[NFRemoteAdminSessionDelegate handleCardSessionToken:](v8, "handleCardSessionToken:", v6);
    }
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v11(3, "%c[%{public}s %{public}s]:%i Invalid token, %{public}@", v14, ClassName, Name, 683, v6);
    }
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      v20 = object_getClassName(self);
      v21 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v27 = v19;
      v28 = 2082;
      v29 = v20;
      v30 = 2082;
      v31 = v21;
      v32 = 1024;
      v33 = 683;
      v34 = 2114;
      v35 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid token, %{public}@", buf, 0x2Cu);
    }

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  objc_msgSend(v22, "setNotification:", 0);

}

- (id)getNextRequest
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableDictionary *v28;
  NSMutableDictionary *cardContents;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  _QWORD v40[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession sessionCardServiceInfo](self, "sessionCardServiceInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("version")));
  v5 = objc_opt_class(NSNumber);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  v7 = 2;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("version")));
    v9 = objc_msgSend(v8, "intValue");

    if (v9 <= 3)
      v7 = 2;
    else
      v7 = v9;
  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v11 = objc_msgSend(v10, "step");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v13 = v12;
  if (!v11)
  {
    v16 = objc_opt_new(NSMutableDictionary);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v17, CFSTR("kVersion"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parameters"));
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parameters"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v19, CFSTR("readerModeParameters"));

    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", &__NSDictionary0__struct, CFSTR("readerModeParameters"));
    }

    goto LABEL_15;
  }
  v14 = objc_msgSend(v12, "step");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v13 = v15;
  if (v14 == (id)2)
  {
    v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "redirectResponse"));
LABEL_15:

    goto LABEL_16;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "unsentScriptResponse"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "unsentScriptResponse"));

  }
  else
  {
    v16 = objc_opt_new(NSMutableDictionary);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v23, CFSTR("kVersion"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "forwardDataToSP"));

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "forwardDataToSP"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v27, CFSTR("forwardData"));

    }
    v28 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", CFSTR("external"), CFSTR("secureElementType"));
    cardContents = self->_cardContents;
    if (cardContents)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", cardContents, CFSTR("cardContents"));
    if (v9 == 4)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NFTag tagID](self->_tag, "tagID"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "NF_asHexString"));

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NFTag sak](self->_tag, "sak"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "NF_asHexString"));

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NFTag atqa](self->_tag, "atqa"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "NF_asHexString"));

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NFTag historicalBytes](self->_tag, "historicalBytes"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "NF_asHexString"));

      if (v31 && v33 && v35 && v37)
      {
        v39[0] = CFSTR("UID");
        v39[1] = CFSTR("SAK");
        v40[0] = v31;
        v40[1] = v33;
        v39[2] = CFSTR("ATQA");
        v39[3] = CFSTR("historicalBytes");
        v40[2] = v35;
        v40[3] = v37;
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 4));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v38, CFSTR("cardTypeAParams"));

      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v28, CFSTR("SEStateInfo"));

  }
LABEL_16:

  return v16;
}

- (unint64_t)executeScript:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *v9;
  _BOOL4 v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  unint64_t v18;
  void *v19;
  NFReaderSession *readerSession;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *specific;
  uint64_t Logger;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  objc_class *v38;
  int v39;
  const char *v40;
  const char *v41;
  void *v43;
  uint64_t v44;
  void (*v45)(uint64_t, const char *, ...);
  objc_class *v46;
  _BOOL4 v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  objc_class *v52;
  int v53;
  const char *v54;
  const char *v55;
  void *v56;
  uint64_t v57;
  void (*v58)(uint64_t, const char *, ...);
  objc_class *v59;
  _BOOL4 v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  objc_class *v65;
  int v66;
  const char *v67;
  const char *v68;
  void *v69;
  const char *v70;
  const char *Name;
  const char *v72;
  const char *v73;
  id v74;
  uint8_t buf[4];
  int v76;
  __int16 v77;
  const char *v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  int v82;

  v5 = a3;
  if (!-[NFRemoteAdminRedirectSession aborted](self, "aborted"))
  {
    -[NFRemoteAdminReaderSession _fireCardIngestionStatus:](self, "_fireCardIngestionStatus:", 4);
    v19 = (void *)objc_opt_new(NFRunScriptParameters);
    if (!v19)
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFRemoteAdminReaderSession.m"), 777, CFSTR("Out of resources"));

    }
    readerSession = self->_readerSession;
    v74 = 0;
    v21 = -[NFReaderSession runScript:parameters:results:](readerSession, "runScript:parameters:results:", v5, v19, &v74);
    v15 = v74;
    -[NFRemoteAdminRedirectSession setRedirectStepError:](self, "setRedirectStepError:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    objc_msgSend(v22, "setUnsentScriptResponse:", v15);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "performanceMetrics"));
    objc_msgSend(v19, "outTotalAPDUExecutionDuration");
    v26 = v25;
    objc_msgSend(v24, "totalAPDUTime");
    objc_msgSend(v24, "setTotalAPDUTime:", v26 + v27);

    if (v15)
    {
      if (-[NFRemoteAdminRedirectSession redirectStepError](self, "redirectStepError") == 28
        || -[NFRemoteAdminRedirectSession redirectStepError](self, "redirectStepError") == 29)
      {
        -[NFRemoteAdminReaderSession _fireCardIngestionStatus:](self, "_fireCardIngestionStatus:", 7);
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v30 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          v34 = 45;
          if (isMetaClass)
            v34 = 43;
          v30(3, "%c[%{public}s %{public}s]:%i C-APDU execution failure", v34, ClassName, Name, 790);
        }
        v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v36 = NFSharedLogGetLogger(v35);
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = object_getClass(self);
          if (class_isMetaClass(v38))
            v39 = 43;
          else
            v39 = 45;
          v40 = object_getClassName(self);
          v41 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v76 = v39;
          v77 = 2082;
          v78 = v40;
          v79 = 2082;
          v80 = v41;
          v81 = 1024;
          v82 = 790;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i C-APDU execution failure", buf, 0x22u);
        }
        v18 = 6;
      }
      else if (-[NFRemoteAdminRedirectSession redirectStepError](self, "redirectStepError") == 3)
      {
        v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v44 = NFLogGetLogger(v43);
        if (v44)
        {
          v45 = (void (*)(uint64_t, const char *, ...))v44;
          v46 = object_getClass(self);
          v47 = class_isMetaClass(v46);
          v48 = object_getClassName(self);
          v72 = sel_getName(a2);
          v49 = 45;
          if (v47)
            v49 = 43;
          v45(3, "%c[%{public}s %{public}s]:%i Reader session aborted", v49, v48, v72, 792);
        }
        v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v51 = NFSharedLogGetLogger(v50);
        v37 = objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v52 = object_getClass(self);
          if (class_isMetaClass(v52))
            v53 = 43;
          else
            v53 = 45;
          v54 = object_getClassName(self);
          v55 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v76 = v53;
          v77 = 2082;
          v78 = v54;
          v79 = 2082;
          v80 = v55;
          v81 = 1024;
          v82 = 792;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Reader session aborted", buf, 0x22u);
        }
        v18 = 1;
      }
      else
      {
        if (-[NFRemoteAdminRedirectSession redirectStepError](self, "redirectStepError") != 47)
        {
          v18 = 6;
          goto LABEL_29;
        }
        v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v57 = NFLogGetLogger(v56);
        if (v57)
        {
          v58 = (void (*)(uint64_t, const char *, ...))v57;
          v59 = object_getClass(self);
          v60 = class_isMetaClass(v59);
          v61 = object_getClassName(self);
          v73 = sel_getName(a2);
          v62 = 45;
          if (v60)
            v62 = 43;
          v58(3, "%c[%{public}s %{public}s]:%i Reader protection mode enabled", v62, v61, v73, 795);
        }
        v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v64 = NFSharedLogGetLogger(v63);
        v37 = objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v65 = object_getClass(self);
          if (class_isMetaClass(v65))
            v66 = 43;
          else
            v66 = 45;
          v67 = object_getClassName(self);
          v68 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v76 = v66;
          v77 = 2082;
          v78 = v67;
          v79 = 2082;
          v80 = v68;
          v81 = 1024;
          v82 = 795;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Reader protection mode enabled", buf, 0x22u);
        }
        v18 = 13;
      }

    }
    else
    {
      v18 = 5;
    }
LABEL_29:

    goto LABEL_30;
  }
  v6 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v7 = NFLogGetLogger(v6);
  if (v7)
  {
    v8 = (void (*)(uint64_t, const char *, ...))v7;
    v9 = object_getClass(self);
    v10 = class_isMetaClass(v9);
    v11 = object_getClassName(self);
    v70 = sel_getName(a2);
    v12 = 45;
    if (v10)
      v12 = 43;
    v8(3, "%c[%{public}s %{public}s]:%i Reader session aborted", v12, v11, v70, 767);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    *(_DWORD *)buf = 67109890;
    v76 = v17;
    v77 = 2082;
    v78 = object_getClassName(self);
    v79 = 2082;
    v80 = sel_getName(a2);
    v81 = 1024;
    v82 = 767;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Reader session aborted", buf, 0x22u);
  }
  v18 = 1;
LABEL_30:

  return v18;
}

- (BOOL)startNewSession
{
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
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 805);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v19 = v15;
    v20 = 2082;
    v21 = object_getClassName(self);
    v22 = 2082;
    v23 = sel_getName(a2);
    v24 = 1024;
    v25 = 805;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  return -[NFRemoteAdminReaderSession reconnectTag](self, "reconnectTag");
}

- (BOOL)_preValidateCardForCathay
{
  int v4;
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
  void *v19;
  uint64_t v20;
  char isKindOfClass;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
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
  const char *Name;
  const char *v44;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;

  v4 = NFGetProductType();
  if ((v4 - 11) > 0x38 || ((1 << (v4 - 11)) & 0x100000000000007) == 0)
  {
    v27 = 0;
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v8(6, "%c[%{public}s %{public}s]:%i Found device that needs dynamic RF settings update", v12, ClassName, Name, 831);
    }
    v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = object_getClass(self);
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      *(_DWORD *)buf = 67109890;
      v46 = v17;
      v47 = 2082;
      v48 = object_getClassName(self);
      v49 = 2082;
      v50 = sel_getName(a2);
      v51 = 1024;
      v52 = 831;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found device that needs dynamic RF settings update", buf, 0x22u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession sessionCardServiceInfo](self, "sessionCardServiceInfo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("version")));
    v20 = objc_opt_class(NSNumber);
    isKindOfClass = objc_opt_isKindOfClass(v19, v20);

    if ((isKindOfClass & 1) != 0
      && (v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("version"))),
          v23 = objc_msgSend(v22, "intValue"),
          v22,
          v23 > 2))
    {
      v27 = 0;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession _getSessionSystemCode](self, "_getSessionSystemCode"));
      v25 = v24;
      if (v24)
      {
        v26 = objc_retainAutorelease(v24);
        if (*(_WORD *)objc_msgSend(v26, "bytes") == 2176)
        {
          v25 = v26;
          v27 = -1;
        }
        else
        {
          v27 = 0;
        }
      }
      else
      {
        v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v29 = NFLogGetLogger(v28);
        if (v29)
        {
          v30 = (void (*)(uint64_t, const char *, ...))v29;
          v31 = object_getClass(self);
          v32 = class_isMetaClass(v31);
          v33 = object_getClassName(self);
          v44 = sel_getName(a2);
          v34 = 45;
          if (v32)
            v34 = 43;
          v30(4, "%c[%{public}s %{public}s]:%i Missing system code definition", v34, v33, v44, 843);
        }
        v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v36 = NFSharedLogGetLogger(v35);
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = object_getClass(self);
          if (class_isMetaClass(v38))
            v39 = 43;
          else
            v39 = 45;
          v40 = object_getClassName(self);
          v41 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v46 = v39;
          v47 = 2082;
          v48 = v40;
          v49 = 2082;
          v50 = v41;
          v51 = 1024;
          v52 = 843;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing system code definition", buf, 0x22u);
        }

        v27 = 0;
      }

    }
  }
  return v27 & 1;
}

- (void)_restoreRFSettingForCathayIngestion
{
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  dispatch_semaphore_t v8;
  SEL v9;

  v4 = dispatch_semaphore_create(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008188;
  v7[3] = &unk_1000546B0;
  v8 = v4;
  v9 = a2;
  v7[4] = self;
  v6 = v4;
  objc_msgSend(v5, "configureReaderModeRFForTransitPartner:transitPartner:callback:", 0, 2, v7);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  self->_cathayIngestionSessionInProgress = 0;

}

- (BOOL)_checkForCathayIngestion
{
  _BOOL4 v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v9[5];
  dispatch_semaphore_t v10;
  SEL v11;

  v4 = -[NFRemoteAdminReaderSession _preValidateCardForCathay](self, "_preValidateCardForCathay");
  if (v4)
  {
    if (self->_cathayIngestionSessionInProgress)
      -[NFRemoteAdminReaderSession _restoreRFSettingForCathayIngestion](self, "_restoreRFSettingForCathayIngestion");
    v5 = dispatch_semaphore_create(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100008424;
    v9[3] = &unk_1000546B0;
    v10 = v5;
    v11 = a2;
    v9[4] = self;
    v7 = v5;
    objc_msgSend(v6, "configureReaderModeRFForTransitPartner:transitPartner:callback:", 1, 2, v9);

    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    self->_cathayIngestionSessionInProgress = 1;

  }
  else
  {
    self->_cathayIngestionSessionInProgress = 0;
  }
  return v4;
}

- (BOOL)_preValidateCardForMercury
{
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  unsigned int v9;

  v3 = NFGetProductType(self, a2);
  if (v3 <= 0x18 && ((1 << v3) & 0x100C000) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession sessionCardServiceInfo](self, "sessionCardServiceInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version")));
    v6 = objc_opt_class(NSNumber);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    if ((isKindOfClass & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version")));
      v9 = objc_msgSend(v8, "intValue");

      if (v9 == 3)
        return 1;
    }
    else
    {

    }
  }
  return 0;
}

- (void)_restoreRFSettingForMercuryIngestion
{
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  dispatch_semaphore_t v8;
  SEL v9;

  v4 = dispatch_semaphore_create(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000875C;
  v7[3] = &unk_1000546B0;
  v8 = v4;
  v9 = a2;
  v7[4] = self;
  v6 = v4;
  objc_msgSend(v5, "configureReaderModeRFForTransitPartner:transitPartner:callback:", 0, 1, v7);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  self->_mercuryIngestionSessionInProgress = 0;

}

- (void)_checkForMercuryIngestion
{
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  dispatch_semaphore_t v8;
  SEL v9;

  if (-[NFRemoteAdminReaderSession _preValidateCardForMercury](self, "_preValidateCardForMercury"))
  {
    if (self->_mercuryIngestionSessionInProgress)
      -[NFRemoteAdminReaderSession _restoreRFSettingForMercuryIngestion](self, "_restoreRFSettingForMercuryIngestion");
    v4 = dispatch_semaphore_create(0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000089F0;
    v7[3] = &unk_1000546B0;
    v8 = v4;
    v9 = a2;
    v7[4] = self;
    v6 = v4;
    objc_msgSend(v5, "configureReaderModeRFForTransitPartner:transitPartner:callback:", 1, 1, v7);

    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    self->_mercuryIngestionSessionInProgress = 1;

  }
  else
  {
    self->_mercuryIngestionSessionInProgress = 0;
  }
}

- (unint64_t)_openSession
{
  NFReaderSession **p_readerSession;
  unint64_t v3;
  void *v6;
  void *v7;
  void *v8;
  Block_layout *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  void *v18;
  unsigned int v19;
  id v20;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v24;
  const char *ClassName;
  const char *Name;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void (*v57)(uint64_t, const char *, ...);
  objc_class *v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  objc_class *v65;
  int v66;
  const char *v67;
  const char *v68;
  NFTag *tag;
  void *v70;
  void (*v71)(uint64_t, const char *, ...);
  objc_class *v72;
  uint64_t v73;
  const char *v74;
  const char *v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  objc_class *v79;
  int v80;
  const char *v81;
  const char *v82;
  void *v83;
  void (*v84)(uint64_t, const char *, ...);
  objc_class *v85;
  uint64_t v86;
  const char *v87;
  const char *v88;
  void *v89;
  uint64_t v90;
  NSObject *v91;
  objc_class *v92;
  int v93;
  const char *v94;
  const char *v95;
  unint64_t cardValidationStatus;
  void *v97;
  void (*v98)(uint64_t, const char *, ...);
  objc_class *v99;
  uint64_t v100;
  const char *v101;
  const char *v102;
  void *v103;
  uint64_t v104;
  NSObject *v105;
  objc_class *v106;
  int v107;
  const char *v108;
  const char *v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  objc_super v113;
  _QWORD v114[7];
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  uint8_t buf[4];
  int v122;
  __int16 v123;
  const char *v124;
  __int16 v125;
  const char *v126;
  __int16 v127;
  int v128;
  __int16 v129;
  unint64_t v130;
  const __CFString *v131;
  void *v132;

  p_readerSession = &self->_readerSession;
  if (!self->_readerSession)
  {
    if (!-[NFRemoteAdminReaderSession _checkForCathayIngestion](self, "_checkForCathayIngestion"))
      -[NFRemoteAdminReaderSession _checkForMercuryIngestion](self, "_checkForMercuryIngestion");
    v115 = 0;
    v116 = &v115;
    v117 = 0x3032000000;
    v118 = sub_10000978C;
    v119 = sub_10000979C;
    v120 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
    v114[0] = _NSConcreteStackBlock;
    v114[1] = 3221225472;
    v114[2] = sub_1000097A4;
    v114[3] = &unk_1000546D8;
    v114[5] = &v115;
    v114[6] = a2;
    v114[4] = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startReaderSession:", v114));

    dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionStartSem, 0xFFFFFFFFFFFFFFFFLL);
    v8 = (void *)v116[5];
    if (v8)
    {
      if (objc_msgSend(v8, "code") == (id)47)
      {
        v113.receiver = self;
        v113.super_class = (Class)NFRemoteAdminReaderSession;
        -[NFRemoteAdminRedirectSession abort:](&v113, "abort:", 6);
      }
      v9 = &stru_1000546F8;
      goto LABEL_11;
    }
    if (-[NFRemoteAdminRedirectSession aborted](self, "aborted"))
    {
      v9 = &stru_100054718;
LABEL_11:
      objc_msgSend(v7, "endSessionWithCompletion:", v9);
LABEL_12:
      v3 = 5;
LABEL_13:

      _Block_object_dispose(&v115, 8);
      return v3;
    }
    objc_storeStrong((id *)p_readerSession, v7);
    -[NFReaderSession setDelegate:](*p_readerSession, "setDelegate:", self);
    if (!*p_readerSession)
      goto LABEL_12;
    -[NFRemoteAdminReaderSession _fireCardIngestionStatus:](self, "_fireCardIngestionStatus:", 10);
    if (self->_sessionUUID)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger"));
      self->_sessionStartTime = (unint64_t)objc_msgSend(v11, "getTimestamp");

      v131 = CFSTR("sessionStartTime");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v132 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1));

      +[NFReaderModeCardIngestionCALogger postAnalyticsReaderModeCardIngestionSession:prepOnly:](NFReaderModeCardIngestionCALogger, "postAnalyticsReaderModeCardIngestionSession:prepOnly:", v13, 1);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession sessionCardServiceInfo](self, "sessionCardServiceInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("version")));
    v16 = objc_opt_class(NSNumber);
    isKindOfClass = objc_opt_isKindOfClass(v15, v16);

    if ((isKindOfClass & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("version")));
      v19 = objc_msgSend(v18, "intValue");

      if (v19 == 3)
        v20 = -[NFReaderSession skipMifareClassification](*p_readerSession, "skipMifareClassification");
    }
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class))
        v24 = 43;
      else
        v24 = 45;
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i Waiting for tag", v24, ClassName, Name, 1066);
    }
    v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v28 = NFSharedLogGetLogger(v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = object_getClass(self);
      if (class_isMetaClass(v30))
        v31 = 43;
      else
        v31 = 45;
      v32 = object_getClassName(self);
      v33 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v122 = v31;
      v123 = 2082;
      v124 = v32;
      v125 = 2082;
      v126 = v33;
      v127 = 1024;
      v128 = 1066;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Waiting for tag", buf, 0x22u);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "requestInfo"));
    v36 = objc_msgSend(v35, "maxDetectionTimeout");

    v37 = objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession connectTagWithTimeout:](self, "connectTagWithTimeout:", v36));
    v38 = (void *)v116[5];
    v116[5] = v37;

    if (v116[5])
    {
      v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v40 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v39);
      if (v40)
      {
        v41 = object_getClass(self);
        if (class_isMetaClass(v41))
          v42 = 43;
        else
          v42 = 45;
        v43 = object_getClassName(self);
        v44 = sel_getName(a2);
        v40(3, "%c[%{public}s %{public}s]:%i Failed to connect a tag : %@", v42, v43, v44, 1070, v116[5]);
      }
      v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v46 = NFSharedLogGetLogger(v45);
      v47 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = object_getClass(self);
        if (class_isMetaClass(v48))
          v49 = 43;
        else
          v49 = 45;
        v50 = object_getClassName(self);
        v51 = sel_getName(a2);
        v52 = v116[5];
        *(_DWORD *)buf = 67110146;
        v122 = v49;
        v123 = 2082;
        v124 = v50;
        v125 = 2082;
        v126 = v51;
        v127 = 1024;
        v128 = 1070;
        v129 = 2112;
        v130 = v52;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect a tag : %@", buf, 0x2Cu);
      }

      -[NFRemoteAdminReaderSession _closeSession](self, "_closeSession");
      if (objc_msgSend((id)v116[5], "code") == (id)47)
      {
        v3 = 13;
        -[NFRemoteAdminReaderSession _fireCardIngestionStatus:](self, "_fireCardIngestionStatus:", 13);
      }
      else
      {
        v3 = 6;
        -[NFRemoteAdminReaderSession _fireCardIngestionStatus:](self, "_fireCardIngestionStatus:", 6);
      }
LABEL_101:

      goto LABEL_13;
    }
    if (-[NFRemoteAdminReaderSession _validateCard](self, "_validateCard"))
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("cardServiceId")));

      if (v53)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("cardServiceId")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cardContents, "setObject:forKeyedSubscript:", v54, CFSTR("cardServiceId"));

      }
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession _gatherCardStateInfo](self, "_gatherCardStateInfo"));
      if (v55)
      {
        -[NSMutableDictionary addEntriesFromDictionary:](self->_cardContents, "addEntriesFromDictionary:", v55);
LABEL_49:

        if (byte_10005C3E8)
        {
          v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v57 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v56);
          if (v57)
          {
            v58 = object_getClass(self);
            if (class_isMetaClass(v58))
              v59 = 43;
            else
              v59 = 45;
            v60 = object_getClassName(self);
            v61 = sel_getName(a2);
            v57(6, "%c[%{public}s %{public}s]:%i [TSM] connected tag: %@", v59, v60, v61, 1114, self->_tag);
          }
          v62 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v63 = NFSharedLogGetLogger(v62);
          v64 = objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            v65 = object_getClass(self);
            if (class_isMetaClass(v65))
              v66 = 43;
            else
              v66 = 45;
            v67 = object_getClassName(self);
            v68 = sel_getName(a2);
            tag = self->_tag;
            *(_DWORD *)buf = 67110146;
            v122 = v66;
            v123 = 2082;
            v124 = v67;
            v125 = 2082;
            v126 = v68;
            v127 = 1024;
            v128 = 1114;
            v129 = 2112;
            v130 = (unint64_t)tag;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] connected tag: %@", buf, 0x2Cu);
          }

        }
        v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v71 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v70);
        if (v71)
        {
          v72 = object_getClass(self);
          if (class_isMetaClass(v72))
            v73 = 43;
          else
            v73 = 45;
          v74 = object_getClassName(self);
          v75 = sel_getName(a2);
          v71(6, "%c[%{public}s %{public}s]:%i connected tag", v73, v74, v75, 1115);
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
          v82 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v122 = v80;
          v123 = 2082;
          v124 = v81;
          v125 = 2082;
          v126 = v82;
          v127 = 1024;
          v128 = 1115;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i connected tag", buf, 0x22u);
        }

        v3 = 2;
        -[NFRemoteAdminReaderSession _fireCardIngestionStatus:](self, "_fireCardIngestionStatus:", 2);
        goto LABEL_101;
      }
      if (!self->_cardValidationStatus)
        goto LABEL_49;
      v83 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v84 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v83);
      if (v84)
      {
        v85 = object_getClass(self);
        if (class_isMetaClass(v85))
          v86 = 43;
        else
          v86 = 45;
        v87 = object_getClassName(self);
        v88 = sel_getName(a2);
        v84(3, "%c[%{public}s %{public}s]:%i returnStatus of stateInfo: %lu", v86, v87, v88, 1093, self->_cardValidationStatus);
      }
      v89 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v90 = NFSharedLogGetLogger(v89);
      v91 = objc_claimAutoreleasedReturnValue(v90);
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        v92 = object_getClass(self);
        if (class_isMetaClass(v92))
          v93 = 43;
        else
          v93 = 45;
        v94 = object_getClassName(self);
        v95 = sel_getName(a2);
        cardValidationStatus = self->_cardValidationStatus;
        *(_DWORD *)buf = 67110146;
        v122 = v93;
        v123 = 2082;
        v124 = v94;
        v125 = 2082;
        v126 = v95;
        v127 = 1024;
        v128 = 1093;
        v129 = 2048;
        v130 = cardValidationStatus;
        _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i returnStatus of stateInfo: %lu", buf, 0x2Cu);
      }

    }
    v97 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v98 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v97);
    if (v98)
    {
      v99 = object_getClass(self);
      if (class_isMetaClass(v99))
        v100 = 43;
      else
        v100 = 45;
      v101 = object_getClassName(self);
      v102 = sel_getName(a2);
      v98(3, "%c[%{public}s %{public}s]:%i _validateCard Failed with status %lu", v100, v101, v102, 1099, self->_cardValidationStatus);
    }
    v103 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v104 = NFSharedLogGetLogger(v103);
    v105 = objc_claimAutoreleasedReturnValue(v104);
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
    {
      v106 = object_getClass(self);
      if (class_isMetaClass(v106))
        v107 = 43;
      else
        v107 = 45;
      v108 = object_getClassName(self);
      v109 = sel_getName(a2);
      v110 = self->_cardValidationStatus;
      *(_DWORD *)buf = 67110146;
      v122 = v107;
      v123 = 2082;
      v124 = v108;
      v125 = 2082;
      v126 = v109;
      v127 = 1024;
      v128 = 1099;
      v129 = 2048;
      v130 = v110;
      _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i _validateCard Failed with status %lu", buf, 0x2Cu);
    }

    -[NFRemoteAdminReaderSession _closeSession](self, "_closeSession");
    v111 = self->_cardValidationStatus;
    v112 = 9;
    if (v111 == 5)
      v112 = 7;
    if (v111 == 4)
      v3 = 12;
    else
      v3 = v112;
    -[NFRemoteAdminReaderSession _fireCardIngestionStatus:](self, "_fireCardIngestionStatus:", v3);
    goto LABEL_101;
  }
  return 2;
}

- (BOOL)_closeSession
{
  NFReaderSession *readerSession;
  NFReaderSession *v4;
  NFReaderSession *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;

  readerSession = self->_readerSession;
  if (readerSession)
  {
    if (self->_tag)
    {
      -[NFReaderSession disconnectTag](self->_readerSession, "disconnectTag");
      v4 = self->_readerSession;
    }
    else
    {
      v4 = self->_readerSession;
    }
    -[NFReaderSession stopPolling](v4, "stopPolling");
    if (self->_cathayIngestionSessionInProgress)
      -[NFRemoteAdminReaderSession _restoreRFSettingForCathayIngestion](self, "_restoreRFSettingForCathayIngestion");
    if (self->_mercuryIngestionSessionInProgress)
      -[NFRemoteAdminReaderSession _restoreRFSettingForMercuryIngestion](self, "_restoreRFSettingForMercuryIngestion");
    -[NFReaderSession endSessionWithCompletion:](self->_readerSession, "endSessionWithCompletion:", &stru_100054738);
    v5 = self->_readerSession;
    self->_readerSession = 0;

    if (self->_sessionUUID)
    {
      v9 = CFSTR("sessionEndTime");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v10 = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

      +[NFReaderModeCardIngestionCALogger postAnalyticsReaderModeCardIngestionSession:prepOnly:](NFReaderModeCardIngestionCALogger, "postAnalyticsReaderModeCardIngestionSession:prepOnly:", v7, 1);
    }
  }
  return readerSession != 0;
}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  id v6;
  NFTag *v7;
  NFTag *tag;
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
  NFTag *v24;
  void *v25;
  uint64_t v26;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *v28;
  _BOOL4 v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  objc_class *v35;
  int v36;
  const char *v37;
  const char *v38;
  void *v39;
  uint64_t v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  _BOOL4 v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  objc_class *v50;
  int v51;
  const char *v52;
  const char *v53;
  NFTag *v54;
  NFTag *v55;
  void *v56;
  uint64_t v57;
  void (*v58)(uint64_t, const char *, ...);
  objc_class *v59;
  _BOOL4 v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  objc_class *v66;
  int v67;
  const char *v68;
  const char *v69;
  uint8_t buf[4];
  int v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  int v77;
  __int16 v78;
  NFTag *v79;

  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (NFTag *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 0));
    tag = self->_tag;
    self->_tag = v7;

    if (byte_10005C3E8)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v16 = 45;
        if (isMetaClass)
          v16 = 43;
        v11(6, "%c[%{public}s %{public}s]:%i [TSM] Detected tag: %@", v16, ClassName, Name, 1163, self->_tag);
      }
      v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v18 = NFSharedLogGetLogger(v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = object_getClass(self);
        if (class_isMetaClass(v20))
          v21 = 43;
        else
          v21 = 45;
        v22 = object_getClassName(self);
        v23 = sel_getName(a2);
        v24 = self->_tag;
        *(_DWORD *)buf = 67110146;
        v71 = v21;
        v72 = 2082;
        v73 = v22;
        v74 = 2082;
        v75 = v23;
        v76 = 1024;
        v77 = 1163;
        v78 = 2112;
        v79 = v24;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Detected tag: %@", buf, 0x2Cu);
      }

    }
    v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v26 = NFLogGetLogger(v25);
    if (v26)
    {
      v27 = (void (*)(uint64_t, const char *, ...))v26;
      v28 = object_getClass(self);
      v29 = class_isMetaClass(v28);
      v30 = object_getClassName(self);
      v68 = sel_getName(a2);
      v31 = 45;
      if (v29)
        v31 = 43;
      v27(6, "%c[%{public}s %{public}s]:%i Detected tag", v31, v30, v68, 1164);
    }
    v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v33 = NFSharedLogGetLogger(v32);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = object_getClass(self);
      if (class_isMetaClass(v35))
        v36 = 43;
      else
        v36 = 45;
      v37 = object_getClassName(self);
      v38 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v71 = v36;
      v72 = 2082;
      v73 = v37;
      v74 = 2082;
      v75 = v38;
      v76 = 1024;
      v77 = 1164;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Detected tag", buf, 0x22u);
    }

    if ((-[NFReaderSession connectTag:](self->_readerSession, "connectTag:", self->_tag) & 1) == 0)
    {
      v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v40 = NFLogGetLogger(v39);
      if (v40)
      {
        v41 = (void (*)(uint64_t, const char *, ...))v40;
        v42 = object_getClass(self);
        v43 = class_isMetaClass(v42);
        v44 = object_getClassName(self);
        v45 = sel_getName(a2);
        v46 = 45;
        if (v43)
          v46 = 43;
        v41(3, "%c[%{public}s %{public}s]:%i Failed to connect tag: %{public}@", v46, v44, v45, 1166, self->_tag);
      }
      v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v48 = NFSharedLogGetLogger(v47);
      v49 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = object_getClass(self);
        if (class_isMetaClass(v50))
          v51 = 43;
        else
          v51 = 45;
        v52 = object_getClassName(self);
        v53 = sel_getName(a2);
        v54 = self->_tag;
        *(_DWORD *)buf = 67110146;
        v71 = v51;
        v72 = 2082;
        v73 = v52;
        v74 = 2082;
        v75 = v53;
        v76 = 1024;
        v77 = 1166;
        v78 = 2114;
        v79 = v54;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect tag: %{public}@", buf, 0x2Cu);
      }

      v55 = self->_tag;
      self->_tag = 0;

    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_tagSem);
  }
  else
  {
    v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v57 = NFLogGetLogger(v56);
    if (v57)
    {
      v58 = (void (*)(uint64_t, const char *, ...))v57;
      v59 = object_getClass(self);
      v60 = class_isMetaClass(v59);
      v61 = object_getClassName(self);
      v69 = sel_getName(a2);
      v62 = 45;
      if (v60)
        v62 = 43;
      v58(3, "%c[%{public}s %{public}s]:%i No tags found", v62, v61, v69, 1176);
    }
    v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v64 = NFSharedLogGetLogger(v63);
    v65 = objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v66 = object_getClass(self);
      if (class_isMetaClass(v66))
        v67 = 43;
      else
        v67 = 45;
      *(_DWORD *)buf = 67109890;
      v71 = v67;
      v72 = 2082;
      v73 = object_getClassName(self);
      v74 = 2082;
      v75 = sel_getName(a2);
      v76 = 1024;
      v77 = 1176;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No tags found", buf, 0x22u);
    }

  }
}

- (void)readerSessionDidEndUnexpectedly:(id)a3 reason:(id)a4
{
  void *specific;
  id v8;
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
  uint64_t v21;
  const char *Name;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v8 = a4;
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v10(3, "%c[%{public}s %{public}s]:%i Lost reader session", v14, ClassName, Name, 1181);
  }
  v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v16 = NFSharedLogGetLogger(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = object_getClass(self);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    *(_DWORD *)buf = 67109890;
    v24 = v19;
    v25 = 2082;
    v26 = object_getClassName(self);
    v27 = 2082;
    v28 = sel_getName(a2);
    v29 = 1024;
    v30 = 1181;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Lost reader session", buf, 0x22u);
  }

  v20 = objc_msgSend(v8, "code");
  if (v20 == (id)47)
    v21 = 6;
  else
    v21 = 2;
  -[NFRemoteAdminReaderSession abort:](self, "abort:", v21);
}

- (id)connectTagWithTimeout:(unint64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  unsigned int v15;
  __CFString *v16;
  int64_t v17;
  NFReaderSession *readerSession;
  id *v19;
  void **v20;
  uint64_t v21;
  NFReaderSession *v22;
  __CFString *v23;
  BOOL v24;
  dispatch_time_t v25;
  void *specific;
  uint64_t Logger;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  objc_class *v38;
  int v39;
  const char *v40;
  const char *v41;
  const __CFString *v42;
  __CFString *v43;
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
  id v58;
  void *v59;
  void *v60;
  const char *v62;
  const char *v63;
  void *v64;
  __CFString *v65;
  __CFString *v66;
  __CFString *v67;
  NSErrorUserInfoKey v68;
  const __CFString *v69;
  uint8_t buf[4];
  int v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  int v77;
  __int16 v78;
  const __CFString *v79;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v63 = a2;
  v64 = v6;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parameters"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("technology")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uppercaseString"));
  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession sessionCardServiceInfo](self, "sessionCardServiceInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("version")));
  v12 = objc_opt_class(NSNumber);
  isKindOfClass = objc_opt_isKindOfClass(v11, v12);

  if ((isKindOfClass & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("version")));
    v15 = objc_msgSend(v14, "intValue");

  }
  else
  {
    v15 = 0;
  }
  v16 = 0;
  v17 = a3;
  do
  {
    if (v15 == 2)
    {
      readerSession = self->_readerSession;
      v67 = v16;
      v19 = (id *)&v67;
      v20 = (void **)&v67;
      v21 = 4;
      goto LABEL_13;
    }
    if (v15 == 3 && objc_msgSend(v9, "containsString:", CFSTR("A")))
    {
      readerSession = self->_readerSession;
      v66 = v16;
      v19 = (id *)&v66;
      v20 = (void **)&v66;
      v21 = 1;
LABEL_13:
      -[NFReaderSession startPollingForTechnology:error:](readerSession, "startPollingForTechnology:error:", v21, v20);
      goto LABEL_15;
    }
    v22 = self->_readerSession;
    v65 = v16;
    v19 = (id *)&v65;
    -[NFReaderSession startPollingWithError:](v22, "startPollingWithError:", &v65);
LABEL_15:
    v23 = (__CFString *)*v19;

    if (-[__CFString code](v23, "code") == (id)47)
    {
      sleep(1u);
      v17 -= 1000;
    }
    v24 = -[__CFString code](v23, "code") != (id)47 || v17 <= 0;
    v16 = v23;
  }
  while (!v24);
  if (a3)
    v25 = dispatch_time(0, 1000000 * (v17 & ~(v17 >> 63)));
  else
    v25 = -1;
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_tagSem, v25) || !self->_tag)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v28 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(v63);
      if (v23)
        v33 = v23;
      else
        v33 = CFSTR("Timeout");
      v34 = 45;
      if (isMetaClass)
        v34 = 43;
      v28(3, "%c[%{public}s %{public}s]:%i Failed to connect a tag : %@", v34, ClassName, Name, 1240, v33);
    }
    v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v36 = NFSharedLogGetLogger(v35);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = object_getClass(self);
      if (class_isMetaClass(v38))
        v39 = 43;
      else
        v39 = 45;
      v40 = object_getClassName(self);
      v41 = sel_getName(v63);
      *(_DWORD *)buf = 67110146;
      if (v23)
        v42 = v23;
      else
        v42 = CFSTR("Timeout");
      v71 = v39;
      v72 = 2082;
      v73 = v40;
      v74 = 2082;
      v75 = v41;
      v76 = 1024;
      v77 = 1240;
      v78 = 2112;
      v79 = v42;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect a tag : %@", buf, 0x2Cu);
    }

    if (v23)
    {
      v43 = v23;
    }
    else
    {
      v58 = objc_alloc((Class)NSError);
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "seld"));
      v68 = NSLocalizedDescriptionKey;
      v69 = CFSTR("Timeout");
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1));
      v43 = (__CFString *)objc_msgSend(v58, "initWithDomain:code:userInfo:", v59, 5, v60);

    }
  }
  else
  {
    v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v45 = NFLogGetLogger(v44);
    if (v45)
    {
      v46 = (void (*)(uint64_t, const char *, ...))v45;
      v47 = object_getClass(self);
      v48 = class_isMetaClass(v47);
      v49 = object_getClassName(self);
      v62 = sel_getName(v63);
      v50 = 45;
      if (v48)
        v50 = 43;
      v46(6, "%c[%{public}s %{public}s]:%i Tag found", v50, v49, v62, 1243);
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
      v57 = sel_getName(v63);
      *(_DWORD *)buf = 67109890;
      v71 = v55;
      v72 = 2082;
      v73 = v56;
      v74 = 2082;
      v75 = v57;
      v76 = 1024;
      v77 = 1243;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag found", buf, 0x22u);
    }

    v43 = 0;
  }

  return v43;
}

- (BOOL)reconnectTag
{
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
  NFTag *tag;
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
  const char *v30;
  void *v31;
  BOOL v32;
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

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Disconnecting tag", v10, ClassName, Name, 1250);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v37 = v15;
    v38 = 2082;
    v39 = object_getClassName(self);
    v40 = 2082;
    v41 = sel_getName(a2);
    v42 = 1024;
    v43 = 1250;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Disconnecting tag", buf, 0x22u);
  }

  -[NFReaderSession disconnectTag](self->_readerSession, "disconnectTag");
  -[NFReaderSession stopPolling](self->_readerSession, "stopPolling");
  tag = self->_tag;
  self->_tag = 0;

  usleep(0xC350u);
  v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = NFLogGetLogger(v17);
  if (v18)
  {
    v19 = (void (*)(uint64_t, const char *, ...))v18;
    v20 = object_getClass(self);
    v21 = class_isMetaClass(v20);
    v22 = object_getClassName(self);
    v35 = sel_getName(a2);
    v23 = 45;
    if (v21)
      v23 = 43;
    v19(6, "%c[%{public}s %{public}s]:%i Connecting tag", v23, v22, v35, 1259);
  }
  v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v25 = NFSharedLogGetLogger(v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = object_getClass(self);
    if (class_isMetaClass(v27))
      v28 = 43;
    else
      v28 = 45;
    v29 = object_getClassName(self);
    v30 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v37 = v28;
    v38 = 2082;
    v39 = v29;
    v40 = 2082;
    v41 = v30;
    v42 = 1024;
    v43 = 1259;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Connecting tag", buf, 0x22u);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession connectTagWithTimeout:](self, "connectTagWithTimeout:", 1000));
  v32 = v31 == 0;

  return v32;
}

- (unint64_t)_performReaderModeRequest
{
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *v29;
  _BOOL4 v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  objc_class *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  _BOOL4 v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  objc_class *v46;
  int v47;
  const char *v48;
  const char *v49;
  void *v50;
  uint64_t v51;
  void (*v52)(uint64_t, const char *, ...);
  objc_class *v53;
  _BOOL4 v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  objc_class *v60;
  int v61;
  const char *v62;
  const char *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  uint64_t v74;
  void (*v75)(uint64_t, const char *, ...);
  objc_class *v76;
  _BOOL4 v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  objc_class *v82;
  int v83;
  const char *v84;
  const char *v85;
  const char *v87;
  const char *Name;
  const char *v89;
  const char *v90;
  const char *v91;
  const char *v92;
  void *v93;
  void *v94;
  id v95;
  uint8_t buf[4];
  int v97;
  __int16 v98;
  const char *v99;
  __int16 v100;
  const char *v101;
  __int16 v102;
  int v103;
  __int16 v104;
  NSObject *v105;

  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminReaderSession getNextRequest](self, "getNextRequest"));
  if (objc_msgSend(v5, "count"))
  {
    v94 = v4;
    -[NFRemoteAdminReaderSession _fireCardIngestionStatus:](self, "_fireCardIngestionStatus:", 3);
    v6 = objc_opt_new(NSMutableDictionary);
    v7 = objc_opt_new(NSMutableDictionary);
    v95 = 0;
    v8 = -[NFRemoteAdminRedirectSession executeHttpRequest:httpHeader:response:responseHeader:duration:sessionError:](self, "executeHttpRequest:httpHeader:response:responseHeader:duration:sessionError:", v5, 0, v6, v7, 0, &v95);
    v9 = v95;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "performanceMetrics"));
    v93 = v9;
    objc_msgSend(v11, "setNsUrlSessionError:", v9);

    if (v8)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v14 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v18 = 45;
        if (isMetaClass)
          v18 = 43;
        v14(3, "%c[%{public}s %{public}s]:%i HTTP Request failed", v18, ClassName, Name, 1304);
      }
      v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v20 = NFSharedLogGetLogger(v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = object_getClass(self);
        if (class_isMetaClass(v22))
          v23 = 43;
        else
          v23 = 45;
        v24 = object_getClassName(self);
        v25 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v97 = v23;
        v98 = 2082;
        v99 = v24;
        v100 = 2082;
        v101 = v25;
        v102 = 1024;
        v103 = 1304;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i HTTP Request failed", buf, 0x22u);
      }
    }
    else
    {
      v21 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_dictionaryForKey:](v6, "NF_dictionaryForKey:", CFSTR("redirectRequest")));
      if (-[NSObject count](v21, "count"))
      {
        if (byte_10005C3E8)
        {
          v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v38 = NFLogGetLogger(v37);
          if (v38)
          {
            v39 = (void (*)(uint64_t, const char *, ...))v38;
            v40 = object_getClass(self);
            v41 = class_isMetaClass(v40);
            v87 = object_getClassName(self);
            v90 = sel_getName(a2);
            v42 = 45;
            if (v41)
              v42 = 43;
            v39(6, "%c[%{public}s %{public}s]:%i [TSM] Received redirect information: %@", v42, v87, v90, 1290, v21);
          }
          v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v44 = NFSharedLogGetLogger(v43);
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v46 = object_getClass(self);
            if (class_isMetaClass(v46))
              v47 = 43;
            else
              v47 = 45;
            v48 = object_getClassName(self);
            v49 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            v97 = v47;
            v98 = 2082;
            v99 = v48;
            v100 = 2082;
            v101 = v49;
            v102 = 1024;
            v103 = 1290;
            v104 = 2112;
            v105 = v21;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Received redirect information: %@", buf, 0x2Cu);
          }

        }
        v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v51 = NFLogGetLogger(v50);
        if (v51)
        {
          v52 = (void (*)(uint64_t, const char *, ...))v51;
          v53 = object_getClass(self);
          v54 = class_isMetaClass(v53);
          v55 = object_getClassName(self);
          v91 = sel_getName(a2);
          v56 = 45;
          if (v54)
            v56 = 43;
          v52(6, "%c[%{public}s %{public}s]:%i Received redirect information", v56, v55, v91, 1291);
        }
        v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v58 = NFSharedLogGetLogger(v57);
        v59 = objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          v60 = object_getClass(self);
          if (class_isMetaClass(v60))
            v61 = 43;
          else
            v61 = 45;
          v62 = object_getClassName(self);
          v63 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v97 = v61;
          v98 = 2082;
          v99 = v62;
          v100 = 2082;
          v101 = v63;
          v102 = 1024;
          v103 = 1291;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Received redirect information", buf, 0x22u);
        }

        v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_stringForKey:](v6, "NF_stringForKey:", CFSTR("kBatchId")));
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
        objc_msgSend(v65, "setBatchId:", v64);

        v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_stringForKey:](v6, "NF_stringForKey:", CFSTR("kTaskId")));
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
        objc_msgSend(v67, "setTaskId:", v66);

        v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject NF_stringForKey:](v21, "NF_stringForKey:", CFSTR("targetURL")));
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
        objc_msgSend(v69, "setRedirectUrl:", v68);

        v70 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject NF_dictionaryForKey:](v21, "NF_dictionaryForKey:", CFSTR("forwardData")));
        v71 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
        objc_msgSend(v71, "setForwardDataToSP:", v70);

        v72 = objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
        -[NSObject setHttpHeaderInfo:](v72, "setHttpHeaderInfo:", v7);
        v8 = 0;
      }
      else
      {
        v73 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v74 = NFLogGetLogger(v73);
        if (v74)
        {
          v75 = (void (*)(uint64_t, const char *, ...))v74;
          v76 = object_getClass(self);
          v77 = class_isMetaClass(v76);
          v78 = object_getClassName(self);
          v92 = sel_getName(a2);
          v79 = 45;
          if (v77)
            v79 = 43;
          v75(3, "%c[%{public}s %{public}s]:%i Failed to receive redirect info for reader mode request", v79, v78, v92, 1299);
        }
        v80 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v81 = NFSharedLogGetLogger(v80);
        v72 = objc_claimAutoreleasedReturnValue(v81);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          v82 = object_getClass(self);
          if (class_isMetaClass(v82))
            v83 = 43;
          else
            v83 = 45;
          v84 = object_getClassName(self);
          v85 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v97 = v83;
          v98 = 2082;
          v99 = v84;
          v100 = 2082;
          v101 = v85;
          v102 = 1024;
          v103 = 1299;
          _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to receive redirect info for reader mode request", buf, 0x22u);
        }
        v8 = 5;
      }

    }
    v4 = v94;
  }
  else
  {
    v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v27 = NFLogGetLogger(v26);
    if (v27)
    {
      v28 = (void (*)(uint64_t, const char *, ...))v27;
      v29 = object_getClass(self);
      v30 = class_isMetaClass(v29);
      v31 = object_getClassName(self);
      v89 = sel_getName(a2);
      v32 = 45;
      if (v30)
        v32 = 43;
      v28(3, "%c[%{public}s %{public}s]:%i Failed to get next request", v32, v31, v89, 1273);
    }
    v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v34 = NFSharedLogGetLogger(v33);
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(&v6->super.super, OS_LOG_TYPE_ERROR))
    {
      v35 = object_getClass(self);
      if (class_isMetaClass(v35))
        v36 = 43;
      else
        v36 = 45;
      *(_DWORD *)buf = 67109890;
      v97 = v36;
      v98 = 2082;
      v99 = object_getClassName(self);
      v100 = 2082;
      v101 = sel_getName(a2);
      v102 = 1024;
      v103 = 1273;
      _os_log_impl((void *)&_mh_execute_header, &v6->super.super, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get next request", buf, 0x22u);
    }
    v8 = 3;
  }

  objc_autoreleasePoolPop(v4);
  return v8;
}

- (unint64_t)run
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
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
  id v23;
  void *v25;
  uint64_t v26;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *v28;
  _BOOL4 v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  objc_class *v35;
  int v36;
  const char *v37;
  const char *v38;
  void *v39;
  uint64_t v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  _BOOL4 v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  void (*v60)(uint64_t, const char *, ...);
  objc_class *v61;
  _BOOL4 v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  objc_class *v68;
  int v69;
  const char *v70;
  const char *v71;
  unint64_t v72;
  void *v73;
  uint64_t v74;
  void (*v75)(uint64_t, const char *, ...);
  objc_class *v76;
  uint64_t v77;
  const char *v78;
  const char *v79;
  uint64_t cardIngestionStatus_low;
  void *v81;
  uint64_t v82;
  NSObject *v83;
  objc_class *v84;
  int v85;
  const char *v86;
  const char *v87;
  int cardIngestionStatus;
  id v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
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
  const char *v112;
  const char *v113;
  void *v114;
  uint64_t v115;
  void (*v116)(uint64_t, const char *, ...);
  objc_class *v117;
  _BOOL4 v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  NSObject *v122;
  objc_class *v123;
  int v124;
  const char *v125;
  const char *v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  const char *ClassName;
  const char *v136;
  const char *v137;
  const char *Name;
  const char *v139;
  const char *v140;
  const char *v141;
  const char *v142;
  const char *v143;
  id v144;
  _QWORD v145[2];
  _QWORD v146[2];
  uint8_t buf[4];
  int v148;
  __int16 v149;
  const char *v150;
  __int16 v151;
  const char *v152;
  __int16 v153;
  int v154;
  __int16 v155;
  id v156;

  v144 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", &v144));
  v5 = v144;
  if (!v4 || (objc_msgSend(v4, "available") & 1) == 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v11(3, "%c[%{public}s %{public}s]:%i eSE unavailable, aborting.  Error - %{public}@", v14, ClassName, Name, 1317, v5);
    }
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      v20 = object_getClassName(self);
      v21 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v148 = v19;
      v149 = 2082;
      v150 = v20;
      v151 = 2082;
      v152 = v21;
      v153 = 1024;
      v154 = 1317;
      v155 = 2114;
      v156 = v5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i eSE unavailable, aborting.  Error - %{public}@", buf, 0x2Cu);
    }

    -[NFRemoteAdminReaderSession _fireCardIngestionStatus:](self, "_fireCardIngestionStatus:", 5);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    objc_msgSend(v22, "setStep:", 3);

    v23 = (id)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    objc_msgSend(v23, "save");
    v8 = 1;
    goto LABEL_15;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v7 = objc_msgSend(v6, "step");

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v26 = NFLogGetLogger(v25);
    if (v26)
    {
      v27 = (void (*)(uint64_t, const char *, ...))v26;
      v28 = object_getClass(self);
      v29 = class_isMetaClass(v28);
      v30 = object_getClassName(self);
      v139 = sel_getName(a2);
      v31 = 45;
      if (v29)
        v31 = 43;
      v27(6, "%c[%{public}s %{public}s]:%i initiating reader mode request", v31, v30, v139, 1329);
    }
    v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v33 = NFSharedLogGetLogger(v32);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = object_getClass(self);
      if (class_isMetaClass(v35))
        v36 = 43;
      else
        v36 = 45;
      v37 = object_getClassName(self);
      v38 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v148 = v36;
      v149 = 2082;
      v150 = v37;
      v151 = 2082;
      v152 = v38;
      v153 = 1024;
      v154 = 1329;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i initiating reader mode request", buf, 0x22u);
    }

    v8 = -[NFRemoteAdminReaderSession _doInitialRequest](self, "_doInitialRequest");
    v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v40 = NFLogGetLogger(v39);
    if (v40)
    {
      v41 = (void (*)(uint64_t, const char *, ...))v40;
      v42 = object_getClass(self);
      v43 = class_isMetaClass(v42);
      v136 = object_getClassName(self);
      v140 = sel_getName(a2);
      v44 = 45;
      if (v43)
        v44 = 43;
      v41(6, "%c[%{public}s %{public}s]:%i Result = 0x%04x", v44, v136, v140, 1331, v8);
    }
    v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v46 = NFSharedLogGetLogger(v45);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = object_getClass(self);
      if (class_isMetaClass(v48))
        v49 = 43;
      else
        v49 = 45;
      v50 = object_getClassName(self);
      v51 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v148 = v49;
      v149 = 2082;
      v150 = v50;
      v151 = 2082;
      v152 = v51;
      v153 = 1024;
      v154 = 1331;
      v155 = 1024;
      LODWORD(v156) = v8;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Result = 0x%04x", buf, 0x28u);
    }

    v145[0] = CFSTR("state");
    v145[1] = CFSTR("technology");
    v146[0] = &off_100057238;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[NFRemoteAdminReaderSession targetTagType](self, "targetTagType")));
    v146[1] = v52;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v146, v145, 2));

    +[NFReaderModeCardIngestionCALogger postAnalyticsReaderModeCardIngestionSession:prepOnly:](NFReaderModeCardIngestionCALogger, "postAnalyticsReaderModeCardIngestionSession:prepOnly:", v53, 1);
  }
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v55 = objc_msgSend(v54, "step");

  if (self && v55 == (id)3 && v8 == 2)
    self->_cardIngestionStatus = 2;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v57 = objc_msgSend(v56, "step");

  if (v57 == (id)1)
  {
    v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v59 = NFLogGetLogger(v58);
    if (v59)
    {
      v60 = (void (*)(uint64_t, const char *, ...))v59;
      v61 = object_getClass(self);
      v62 = class_isMetaClass(v61);
      v63 = object_getClassName(self);
      v141 = sel_getName(a2);
      v64 = 45;
      if (v62)
        v64 = 43;
      v60(6, "%c[%{public}s %{public}s]:%i Performing reader mode redirect", v64, v63, v141, 1348);
    }
    v65 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v66 = NFSharedLogGetLogger(v65);
    v67 = objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      v68 = object_getClass(self);
      if (class_isMetaClass(v68))
        v69 = 43;
      else
        v69 = 45;
      v70 = object_getClassName(self);
      v71 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v148 = v69;
      v149 = 2082;
      v150 = v70;
      v151 = 2082;
      v152 = v71;
      v153 = 1024;
      v154 = 1348;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Performing reader mode redirect", buf, 0x22u);
    }

    v72 = -[NFRemoteAdminReaderSession _doReaderModeRedirect](self, "_doReaderModeRedirect");
    if (self)
      self->_cardIngestionStatus = v72;
    v73 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v74 = NFLogGetLogger(v73);
    if (v74)
    {
      v75 = (void (*)(uint64_t, const char *, ...))v74;
      v76 = object_getClass(self);
      if (class_isMetaClass(v76))
        v77 = 43;
      else
        v77 = 45;
      v78 = object_getClassName(self);
      v79 = sel_getName(a2);
      if (self)
        cardIngestionStatus_low = LODWORD(self->_cardIngestionStatus);
      else
        cardIngestionStatus_low = 0;
      v75(6, "%c[%{public}s %{public}s]:%i Result = 0x%04x", v77, v78, v79, 1350, cardIngestionStatus_low);
    }
    v81 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v82 = NFSharedLogGetLogger(v81);
    v83 = objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      v84 = object_getClass(self);
      if (class_isMetaClass(v84))
        v85 = 43;
      else
        v85 = 45;
      v86 = object_getClassName(self);
      v87 = sel_getName(a2);
      if (self)
        cardIngestionStatus = self->_cardIngestionStatus;
      else
        cardIngestionStatus = 0;
      *(_DWORD *)buf = 67110146;
      v148 = v85;
      v149 = 2082;
      v150 = v86;
      v151 = 2082;
      v152 = v87;
      v153 = 1024;
      v154 = 1350;
      v155 = 1024;
      LODWORD(v156) = cardIngestionStatus;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Result = 0x%04x", buf, 0x28u);
    }

    v89 = objc_alloc((Class)NSMutableDictionary);
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[NFRemoteAdminReaderSession targetTagType](self, "targetTagType")));
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_cardValidationStatus));
    v92 = objc_msgSend(v89, "initWithObjectsAndKeys:", &off_100057250, CFSTR("state"), v90, CFSTR("technology"), v91, CFSTR("cardValidationStatus"), 0);

    if (self->_cardIngestionStatus != -1)
    {
      v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
      objc_msgSend(v92, "setObject:forKeyedSubscript:", v93, CFSTR("sessionStatus"));

    }
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "spStatusCode"));

    if (v95)
    {
      v96 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "spStatusCode"));
      objc_msgSend(v92, "setObject:forKey:", v97, CFSTR("spStatus"));

    }
    +[NFReaderModeCardIngestionCALogger postAnalyticsReaderModeCardIngestionSession:prepOnly:](NFReaderModeCardIngestionCALogger, "postAnalyticsReaderModeCardIngestionSession:prepOnly:", v92, 1);

  }
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v99 = objc_msgSend(v98, "step");

  if (v99 == (id)2)
  {
    v100 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v101 = NFLogGetLogger(v100);
    if (v101)
    {
      v102 = (void (*)(uint64_t, const char *, ...))v101;
      v103 = object_getClass(self);
      v104 = class_isMetaClass(v103);
      v105 = object_getClassName(self);
      v142 = sel_getName(a2);
      v106 = 45;
      if (v104)
        v106 = 43;
      v102(6, "%c[%{public}s %{public}s]:%i Performing post-redirect TSM check in", v106, v105, v142, 1370);
    }
    v107 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v108 = NFSharedLogGetLogger(v107);
    v109 = objc_claimAutoreleasedReturnValue(v108);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      v110 = object_getClass(self);
      if (class_isMetaClass(v110))
        v111 = 43;
      else
        v111 = 45;
      v112 = object_getClassName(self);
      v113 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v148 = v111;
      v149 = 2082;
      v150 = v112;
      v151 = 2082;
      v152 = v113;
      v153 = 1024;
      v154 = 1370;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Performing post-redirect TSM check in", buf, 0x22u);
    }

    v8 = -[NFRemoteAdminReaderSession _doFinalTSMCheckIn](self, "_doFinalTSMCheckIn");
    v114 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v115 = NFLogGetLogger(v114);
    if (v115)
    {
      v116 = (void (*)(uint64_t, const char *, ...))v115;
      v117 = object_getClass(self);
      v118 = class_isMetaClass(v117);
      v137 = object_getClassName(self);
      v143 = sel_getName(a2);
      v119 = 45;
      if (v118)
        v119 = 43;
      v116(6, "%c[%{public}s %{public}s]:%i Result = 0x%04x", v119, v137, v143, 1372, v8);
    }
    v120 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v121 = NFSharedLogGetLogger(v120);
    v122 = objc_claimAutoreleasedReturnValue(v121);
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
    {
      v123 = object_getClass(self);
      if (class_isMetaClass(v123))
        v124 = 43;
      else
        v124 = 45;
      v125 = object_getClassName(self);
      v126 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v148 = v124;
      v149 = 2082;
      v150 = v125;
      v151 = 2082;
      v152 = v126;
      v153 = 1024;
      v154 = 1372;
      v155 = 1024;
      LODWORD(v156) = v8;
      _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Result = 0x%04x", buf, 0x28u);
    }

    v127 = objc_alloc((Class)NSMutableDictionary);
    v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[NFRemoteAdminReaderSession targetTagType](self, "targetTagType")));
    v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_cardValidationStatus));
    v23 = objc_msgSend(v127, "initWithObjectsAndKeys:", &off_100057268, CFSTR("state"), v128, CFSTR("technology"), v129, CFSTR("cardValidationStatus"), 0);

    if (self->_cardIngestionStatus != -1)
    {
      v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v130, CFSTR("sessionStatus"));

    }
    v131 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "spStatusCode"));

    if (v132)
    {
      v133 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "spStatusCode"));
      objc_msgSend(v23, "setObject:forKey:", v134, CFSTR("spStatus"));

    }
    +[NFReaderModeCardIngestionCALogger postAnalyticsReaderModeCardIngestionSession:prepOnly:](NFReaderModeCardIngestionCALogger, "postAnalyticsReaderModeCardIngestionSession:prepOnly:", v23, 0);
LABEL_15:

  }
  return v8;
}

- (unint64_t)_doInitialRequest
{
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
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
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
  void *v52;
  uint64_t v53;
  void (*v54)(uint64_t, const char *, ...);
  objc_class *v55;
  _BOOL4 v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  objc_class *v63;
  int v64;
  const char *v65;
  const char *v66;
  unsigned int v67;
  void *v68;
  uint64_t v69;
  void (*v70)(uint64_t, const char *, ...);
  objc_class *v71;
  _BOOL4 v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  objc_class *v78;
  int v79;
  const char *v80;
  const char *v81;
  void *v82;
  uint64_t v83;
  void (*v84)(uint64_t, const char *, ...);
  objc_class *v85;
  _BOOL4 v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  NSObject *v91;
  objc_class *v92;
  int v93;
  const char *v94;
  const char *v95;
  id v96;
  unint64_t v97;
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
  uint64_t v117;
  void *v118;
  uint64_t v119;
  NSObject *v120;
  objc_class *v121;
  int v122;
  const char *v123;
  const char *v124;
  void *v125;
  void *v127;
  uint64_t v128;
  void (*v129)(uint64_t, const char *, ...);
  objc_class *v130;
  _BOOL4 v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  NSObject *v136;
  objc_class *v137;
  int v138;
  const char *v139;
  const char *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void (*v145)(uint64_t, const char *, ...);
  objc_class *v146;
  _BOOL4 v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  NSObject *v152;
  objc_class *v153;
  int v154;
  const char *v155;
  const char *v156;
  const char *v157;
  const char *Name;
  const char *v159;
  const char *v160;
  const char *v161;
  const char *v162;
  const char *v163;
  const char *v164;
  const char *v165;
  const char *v166;
  uint8_t buf[4];
  int v168;
  __int16 v169;
  const char *v170;
  __int16 v171;
  const char *v172;
  __int16 v173;
  int v174;
  __int16 v175;
  unint64_t v176;

  if (byte_10005C3E8)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v6(6, "%c[%{public}s %{public}s]:%i [TSM] initiating reader mode request", v10, ClassName, Name, 1395);
    }
    v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFSharedLogGetLogger(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = object_getClass(self);
      if (class_isMetaClass(v14))
        v15 = 43;
      else
        v15 = 45;
      *(_DWORD *)buf = 67109890;
      v168 = v15;
      v169 = 2082;
      v170 = object_getClassName(self);
      v171 = 2082;
      v172 = sel_getName(a2);
      v173 = 1024;
      v174 = 1395;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] initiating reader mode request", buf, 0x22u);
    }

  }
  if (-[NFRemoteAdminRedirectSession aborted](self, "aborted"))
  {
    if (!-[NFRemoteAdminRedirectSession aborted](self, "aborted"))
    {
      v16 = 5;
LABEL_95:
      v112 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v113 = NFLogGetLogger(v112);
      if (v113)
      {
        v114 = (void (*)(uint64_t, const char *, ...))v113;
        v115 = object_getClass(self);
        v116 = class_isMetaClass(v115);
        v157 = object_getClassName(self);
        v164 = sel_getName(a2);
        v117 = 45;
        if (v116)
          v117 = 43;
        v114(3, "%c[%{public}s %{public}s]:%i Failed to perform initial reader mode request with TSM, status=0x%lx", v117, v157, v164, 1449, v16);
      }
      v118 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v119 = NFSharedLogGetLogger(v118);
      v120 = objc_claimAutoreleasedReturnValue(v119);
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
      {
        v121 = object_getClass(self);
        if (class_isMetaClass(v121))
          v122 = 43;
        else
          v122 = 45;
        v123 = object_getClassName(self);
        v124 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v168 = v122;
        v169 = 2082;
        v170 = v123;
        v171 = 2082;
        v172 = v124;
        v173 = 1024;
        v174 = 1449;
        v175 = 2048;
        v176 = v16;
        _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to perform initial reader mode request with TSM, status=0x%lx", buf, 0x2Cu);
      }

      v96 = (id)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      objc_msgSend(v96, "setStep:", 3);
      v97 = 2;
      goto LABEL_105;
    }
    goto LABEL_72;
  }
  v17 = 0;
  v18 = 5;
  do
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession connection](self, "connection"));

    if (!v19)
    {
      if (byte_10005C3E8)
      {
        v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v21 = NFLogGetLogger(v20);
        if (v21)
        {
          v22 = (void (*)(uint64_t, const char *, ...))v21;
          v23 = object_getClass(self);
          v24 = class_isMetaClass(v23);
          v25 = object_getClassName(self);
          v159 = sel_getName(a2);
          if (v24)
            v26 = 43;
          else
            v26 = 45;
          v22(6, "%c[%{public}s %{public}s]:%i [TSM] Opening connection to TSM", v26, v25, v159, 1401);
        }
        v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v28 = NFSharedLogGetLogger(v27);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = object_getClass(self);
          if (class_isMetaClass(v30))
            v31 = 43;
          else
            v31 = 45;
          v32 = object_getClassName(self);
          v33 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v168 = v31;
          v169 = 2082;
          v170 = v32;
          v171 = 2082;
          v172 = v33;
          v173 = 1024;
          v174 = 1401;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Opening connection to TSM", buf, 0x22u);
        }

      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "sourceUrl"));
      v36 = -[NFRemoteAdminRedirectSession openConnection:](self, "openConnection:", v35);

      if ((v36 & 1) == 0)
      {
        v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v38 = NFLogGetLogger(v37);
        if (v38)
        {
          v39 = (void (*)(uint64_t, const char *, ...))v38;
          v40 = object_getClass(self);
          v41 = class_isMetaClass(v40);
          v42 = object_getClassName(self);
          v160 = sel_getName(a2);
          if (v41)
            v43 = 43;
          else
            v43 = 45;
          v39(3, "%c[%{public}s %{public}s]:%i Failed to open connection to TSM", v43, v42, v160, 1404);
        }
        v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v45 = NFSharedLogGetLogger(v44);
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = object_getClass(self);
          if (class_isMetaClass(v47))
            v48 = 43;
          else
            v48 = 45;
          v49 = object_getClassName(self);
          v50 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v168 = v48;
          v169 = 2082;
          v170 = v49;
          v171 = 2082;
          v172 = v50;
          v173 = 1024;
          v174 = 1404;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open connection to TSM", buf, 0x22u);
        }

        v18 = 3;
      }
    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession connection](self, "connection"));

    v16 = v18;
    if (v51)
      v16 = -[NFRemoteAdminReaderSession _performReaderModeRequest](self, "_performReaderModeRequest");
    if (v17 <= 2 && v16 == 3)
    {
      v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v53 = NFLogGetLogger(v52);
      if (v53)
      {
        v54 = (void (*)(uint64_t, const char *, ...))v53;
        v55 = object_getClass(self);
        v56 = class_isMetaClass(v55);
        v57 = object_getClassName(self);
        v58 = sel_getName(a2);
        if (v56)
          v59 = 43;
        else
          v59 = 45;
        v54(5, "%c[%{public}s %{public}s]:%i Performing short retry in %d seconds", v59, v57, v58, 1416, dword_100041110[v17]);
      }
      v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v61 = NFSharedLogGetLogger(v60);
      v62 = objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = object_getClass(self);
        if (class_isMetaClass(v63))
          v64 = 43;
        else
          v64 = 45;
        v65 = object_getClassName(self);
        v66 = sel_getName(a2);
        v67 = dword_100041110[v17];
        *(_DWORD *)buf = 67110146;
        v168 = v64;
        v169 = 2082;
        v170 = v65;
        v171 = 2082;
        v172 = v66;
        v173 = 1024;
        v174 = 1416;
        v175 = 1024;
        LODWORD(v176) = v67;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Performing short retry in %d seconds", buf, 0x28u);
      }

      sleep(dword_100041110[v17++]);
      v16 = 6;
    }
    if (v17 >= 3)
    {
      v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v69 = NFLogGetLogger(v68);
      if (v69)
      {
        v70 = (void (*)(uint64_t, const char *, ...))v69;
        v71 = object_getClass(self);
        v72 = class_isMetaClass(v71);
        v73 = object_getClassName(self);
        v161 = sel_getName(a2);
        if (v72)
          v74 = 43;
        else
          v74 = 45;
        v70(5, "%c[%{public}s %{public}s]:%i Short retries expired", v74, v73, v161, 1421);
      }
      v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v76 = NFSharedLogGetLogger(v75);
      v77 = objc_claimAutoreleasedReturnValue(v76);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        v78 = object_getClass(self);
        if (class_isMetaClass(v78))
          v79 = 43;
        else
          v79 = 45;
        v80 = object_getClassName(self);
        v81 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v168 = v79;
        v169 = 2082;
        v170 = v80;
        v171 = 2082;
        v172 = v81;
        v173 = 1024;
        v174 = 1421;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Short retries expired", buf, 0x22u);
      }

    }
    if (v16 != 6)
      break;
    v18 = 6;
  }
  while (!-[NFRemoteAdminRedirectSession aborted](self, "aborted"));
  -[NFRemoteAdminRedirectSession closeConnection](self, "closeConnection");
  if (-[NFRemoteAdminRedirectSession aborted](self, "aborted"))
  {
    if (!v16)
    {
      v127 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v128 = NFLogGetLogger(v127);
      if (v128)
      {
        v129 = (void (*)(uint64_t, const char *, ...))v128;
        v130 = object_getClass(self);
        v131 = class_isMetaClass(v130);
        v132 = object_getClassName(self);
        v165 = sel_getName(a2);
        v133 = 45;
        if (v131)
          v133 = 43;
        v129(6, "%c[%{public}s %{public}s]:%i Abort with checkin", v133, v132, v165, 1432);
      }
      v134 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v135 = NFSharedLogGetLogger(v134);
      v136 = objc_claimAutoreleasedReturnValue(v135);
      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
      {
        v137 = object_getClass(self);
        if (class_isMetaClass(v137))
          v138 = 43;
        else
          v138 = 45;
        v139 = object_getClassName(self);
        v140 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v168 = v138;
        v169 = 2082;
        v170 = v139;
        v171 = 2082;
        v172 = v140;
        v173 = 1024;
        v174 = 1432;
        _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Abort with checkin", buf, 0x22u);
      }

      v141 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      objc_msgSend(v141, "setStep:", 2);

      v96 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@(reason=%d)"), CFSTR("Cancel"), -[NFRemoteAdminRedirectSession abortedReason](self, "abortedReason"));
      v142 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      objc_msgSend(v142, "setIncompleteReason:", v96);

      goto LABEL_82;
    }
LABEL_72:
    v82 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v83 = NFLogGetLogger(v82);
    if (v83)
    {
      v84 = (void (*)(uint64_t, const char *, ...))v83;
      v85 = object_getClass(self);
      v86 = class_isMetaClass(v85);
      v87 = object_getClassName(self);
      v162 = sel_getName(a2);
      v88 = 45;
      if (v86)
        v88 = 43;
      v84(6, "%c[%{public}s %{public}s]:%i Abort", v88, v87, v162, 1437);
    }
    v89 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v90 = NFSharedLogGetLogger(v89);
    v91 = objc_claimAutoreleasedReturnValue(v90);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      v92 = object_getClass(self);
      if (class_isMetaClass(v92))
        v93 = 43;
      else
        v93 = 45;
      v94 = object_getClassName(self);
      v95 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v168 = v93;
      v169 = 2082;
      v170 = v94;
      v171 = 2082;
      v172 = v95;
      v173 = 1024;
      v174 = 1437;
      _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Abort", buf, 0x22u);
    }

    v96 = (id)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    objc_msgSend(v96, "setStep:", 3);
LABEL_82:
    v97 = 1;
    goto LABEL_105;
  }
  if (v16 == 8)
  {
    v143 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v144 = NFLogGetLogger(v143);
    if (v144)
    {
      v145 = (void (*)(uint64_t, const char *, ...))v144;
      v146 = object_getClass(self);
      v147 = class_isMetaClass(v146);
      v148 = object_getClassName(self);
      v166 = sel_getName(a2);
      v149 = 45;
      if (v147)
        v149 = 43;
      v145(6, "%c[%{public}s %{public}s]:%i device not registered", v149, v148, v166, 1445);
    }
    v150 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v151 = NFSharedLogGetLogger(v150);
    v152 = objc_claimAutoreleasedReturnValue(v151);
    if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
    {
      v153 = object_getClass(self);
      if (class_isMetaClass(v153))
        v154 = 43;
      else
        v154 = 45;
      v155 = object_getClassName(self);
      v156 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v168 = v154;
      v169 = 2082;
      v170 = v155;
      v171 = 2082;
      v172 = v156;
      v173 = 1024;
      v174 = 1445;
      _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i device not registered", buf, 0x22u);
    }

    v96 = (id)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    objc_msgSend(v96, "setStep:", 3);
    v97 = 8;
  }
  else
  {
    if (v16)
      goto LABEL_95;
    v98 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v99 = NFLogGetLogger(v98);
    if (v99)
    {
      v100 = (void (*)(uint64_t, const char *, ...))v99;
      v101 = object_getClass(self);
      v102 = class_isMetaClass(v101);
      v103 = object_getClassName(self);
      v163 = sel_getName(a2);
      v104 = 45;
      if (v102)
        v104 = 43;
      v100(6, "%c[%{public}s %{public}s]:%i advancing to InProgress step", v104, v103, v163, 1442);
    }
    v105 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v106 = NFSharedLogGetLogger(v105);
    v107 = objc_claimAutoreleasedReturnValue(v106);
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
    {
      v108 = object_getClass(self);
      if (class_isMetaClass(v108))
        v109 = 43;
      else
        v109 = 45;
      v110 = object_getClassName(self);
      v111 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v168 = v109;
      v169 = 2082;
      v170 = v110;
      v171 = 2082;
      v172 = v111;
      v173 = 1024;
      v174 = 1442;
      _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i advancing to InProgress step", buf, 0x22u);
    }

    v96 = (id)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    objc_msgSend(v96, "incrementStep");
    v97 = 0;
  }
LABEL_105:

  v125 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  objc_msgSend(v125, "save");

  return v97;
}

- (unint64_t)_doReaderModeRedirect
{
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
  uint64_t v16;
  _BOOL4 v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
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
  unint64_t v58;
  char v59;
  unint64_t v60;
  int v61;
  void *v62;
  void *v63;
  unsigned __int8 v64;
  void *v65;
  uint64_t v66;
  void (*v67)(uint64_t, const char *, ...);
  objc_class *v68;
  _BOOL4 v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  NSObject *v74;
  objc_class *v75;
  int v76;
  const char *v77;
  const char *v78;
  unsigned int v79;
  void *v80;
  uint64_t v81;
  void (*v82)(uint64_t, const char *, ...);
  objc_class *v83;
  _BOOL4 v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  NSObject *v90;
  objc_class *v91;
  int v92;
  const char *v93;
  const char *v94;
  unsigned int v95;
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
  NSObject *v119;
  objc_class *v120;
  int v121;
  const char *v122;
  const char *v123;
  void *v124;
  uint64_t v125;
  void (*v126)(uint64_t, const char *, ...);
  objc_class *v127;
  _BOOL4 v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  NSObject *v133;
  objc_class *v134;
  int v135;
  const char *v136;
  const char *v137;
  void *v138;
  uint64_t v139;
  void (*v140)(uint64_t, const char *, ...);
  objc_class *v141;
  _BOOL4 v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  NSObject *v147;
  objc_class *v148;
  int v149;
  const char *v150;
  const char *v151;
  void *v152;
  const __CFString *v153;
  void *v154;
  uint64_t v155;
  void (*v156)(uint64_t, const char *, ...);
  objc_class *v157;
  _BOOL4 v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  NSObject *v163;
  objc_class *v164;
  int v165;
  const char *v166;
  const char *v167;
  void *v168;
  uint64_t v169;
  void (*v170)(uint64_t, const char *, ...);
  objc_class *v171;
  _BOOL4 v172;
  uint64_t v173;
  void *v174;
  uint64_t v175;
  NSObject *v176;
  objc_class *v177;
  int v178;
  const char *v179;
  const char *v180;
  void *v181;
  uint64_t v182;
  void (*v183)(uint64_t, const char *, ...);
  objc_class *v184;
  _BOOL4 v185;
  uint64_t v186;
  void *v187;
  uint64_t v188;
  NSObject *v189;
  objc_class *v190;
  int v191;
  const char *v192;
  const char *v193;
  id v194;
  void *v195;
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
  uint64_t v209;
  uint8_t buf[4];
  int v211;
  __int16 v212;
  const char *v213;
  __int16 v214;
  const char *v215;
  __int16 v216;
  int v217;
  __int16 v218;
  unint64_t v219;

  if (byte_10005C3E8)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v6(6, "%c[%{public}s %{public}s]:%i [TSM] Performing reader mode redirect", v10, ClassName, Name, 1465);
    }
    v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFSharedLogGetLogger(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = object_getClass(self);
      if (class_isMetaClass(v14))
        v15 = 43;
      else
        v15 = 45;
      *(_DWORD *)buf = 67109890;
      v211 = v15;
      v212 = 2082;
      v213 = object_getClassName(self);
      v214 = 2082;
      v215 = sel_getName(a2);
      v216 = 1024;
      v217 = 1465;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Performing reader mode redirect", buf, 0x22u);
    }

  }
  v16 = mach_continuous_time();
  if (-[NFRemoteAdminRedirectSession aborted](self, "aborted"))
  {
LABEL_13:
    v17 = 0;
    v18 = 5;
    goto LABEL_14;
  }
  if (byte_10005C3E8)
  {
    v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v45 = NFLogGetLogger(v44);
    if (v45)
    {
      v46 = (void (*)(uint64_t, const char *, ...))v45;
      v47 = object_getClass(self);
      v48 = class_isMetaClass(v47);
      v49 = object_getClassName(self);
      v200 = sel_getName(a2);
      v50 = 45;
      if (v48)
        v50 = 43;
      v46(6, "%c[%{public}s %{public}s]:%i [TSM] Opening reader session", v50, v49, v200, 1469);
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
      v57 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v211 = v55;
      v212 = 2082;
      v213 = v56;
      v214 = 2082;
      v215 = v57;
      v216 = 1024;
      v217 = 1469;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Opening reader session", buf, 0x22u);
    }

  }
  v18 = -[NFRemoteAdminReaderSession _openSession](self, "_openSession");
  v17 = 0;
  switch(v18)
  {
    case 2uLL:
      v209 = v16;
      v58 = 0;
      v59 = 0;
      break;
    case 5uLL:
      goto LABEL_13;
    case 9uLL:
      goto LABEL_14;
    case 0xCuLL:
      v124 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v125 = NFLogGetLogger(v124);
      if (v125)
      {
        v126 = (void (*)(uint64_t, const char *, ...))v125;
        v127 = object_getClass(self);
        v128 = class_isMetaClass(v127);
        v129 = object_getClassName(self);
        v204 = sel_getName(a2);
        v130 = 45;
        if (v128)
          v130 = 43;
        v126(3, "%c[%{public}s %{public}s]:%i Bad Command APDU", v130, v129, v204, 1506);
      }
      v131 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v132 = NFSharedLogGetLogger(v131);
      v133 = objc_claimAutoreleasedReturnValue(v132);
      if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
      {
        v134 = object_getClass(self);
        if (class_isMetaClass(v134))
          v135 = 43;
        else
          v135 = 45;
        v136 = object_getClassName(self);
        v137 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v211 = v135;
        v212 = 2082;
        v213 = v136;
        v214 = 2082;
        v215 = v137;
        v216 = 1024;
        v217 = 1506;
        _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Bad Command APDU", buf, 0x22u);
      }

      v17 = 0;
      v18 = 10;
      goto LABEL_14;
    case 0xDuLL:
      v138 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v139 = NFLogGetLogger(v138);
      if (v139)
      {
        v140 = (void (*)(uint64_t, const char *, ...))v139;
        v141 = object_getClass(self);
        v142 = class_isMetaClass(v141);
        v143 = object_getClassName(self);
        v205 = sel_getName(a2);
        v144 = 45;
        if (v142)
          v144 = 43;
        v140(6, "%c[%{public}s %{public}s]:%i Failed due to thermal protection", v144, v143, v205, 1511);
      }
      v145 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v146 = NFSharedLogGetLogger(v145);
      v147 = objc_claimAutoreleasedReturnValue(v146);
      if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
      {
        v148 = object_getClass(self);
        if (class_isMetaClass(v148))
          v149 = 43;
        else
          v149 = 45;
        v150 = object_getClassName(self);
        v151 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v211 = v149;
        v212 = 2082;
        v213 = v150;
        v214 = 2082;
        v215 = v151;
        v216 = 1024;
        v217 = 1511;
        _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed due to thermal protection", buf, 0x22u);
      }

      v17 = 0;
      v18 = 13;
      goto LABEL_14;
    default:
      v110 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v111 = NFLogGetLogger(v110);
      if (v111)
      {
        v112 = (void (*)(uint64_t, const char *, ...))v111;
        v113 = object_getClass(self);
        v114 = class_isMetaClass(v113);
        v115 = object_getClassName(self);
        v203 = sel_getName(a2);
        v116 = 45;
        if (v114)
          v116 = 43;
        v112(3, "%c[%{public}s %{public}s]:%i Failed to start reader session", v116, v115, v203, 1514);
      }
      v117 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v118 = NFSharedLogGetLogger(v117);
      v119 = objc_claimAutoreleasedReturnValue(v118);
      if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
      {
        v120 = object_getClass(self);
        if (class_isMetaClass(v120))
          v121 = 43;
        else
          v121 = 45;
        v122 = object_getClassName(self);
        v123 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v211 = v121;
        v212 = 2082;
        v213 = v122;
        v214 = 2082;
        v215 = v123;
        v216 = 1024;
        v217 = 1514;
        _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start reader session", buf, 0x22u);
      }

      v17 = 0;
      v18 = 7;
      goto LABEL_14;
  }
  while (1)
  {
    if ((v59 & 1) == 0)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "redirectUrl"));
      v64 = -[NFRemoteAdminRedirectSession openConnection:](self, "openConnection:", v63);

      if ((v64 & 1) == 0)
      {
        v65 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v66 = NFLogGetLogger(v65);
        if (v66)
        {
          v67 = (void (*)(uint64_t, const char *, ...))v66;
          v68 = object_getClass(self);
          v69 = class_isMetaClass(v68);
          v70 = object_getClassName(self);
          v201 = sel_getName(a2);
          v71 = 45;
          if (v69)
            v71 = 43;
          v67(3, "%c[%{public}s %{public}s]:%i Failed to open connection to SP-TSM", v71, v70, v201, 1478);
        }
        v72 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v73 = NFSharedLogGetLogger(v72);
        v74 = objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          v75 = object_getClass(self);
          if (class_isMetaClass(v75))
            v76 = 43;
          else
            v76 = 45;
          v77 = object_getClassName(self);
          v78 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v211 = v76;
          v212 = 2082;
          v213 = v77;
          v214 = 2082;
          v215 = v78;
          v216 = 1024;
          v217 = 1478;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open connection to SP-TSM", buf, 0x22u);
        }

        v59 = 0;
        v61 = 0;
        v18 = 3;
        goto LABEL_63;
      }
      v59 = 1;
    }
    -[NFRemoteAdminReaderSession _fireCardIngestionStatus:](self, "_fireCardIngestionStatus:", 8);
    v60 = -[NFRemoteAdminRedirectSession performRedirect](self, "performRedirect");
    v61 = 1;
    if (v60 != 6)
      break;
    v58 = 0;
LABEL_76:
    if (-[NFRemoteAdminRedirectSession aborted](self, "aborted"))
    {
      v18 = 6;
      goto LABEL_139;
    }
  }
  v18 = v60;
  if (v60 == 1)
  {
    -[NFRemoteAdminRedirectSession setRedirectStepError:](self, "setRedirectStepError:", 3);
    v61 = 1;
    goto LABEL_139;
  }
LABEL_63:
  v79 = -[NFRemoteAdminRedirectSession aborted](self, "aborted");
  if (v18 == 3 && !v79 && v58 <= 2)
  {
    v80 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v81 = NFLogGetLogger(v80);
    if (v81)
    {
      v82 = (void (*)(uint64_t, const char *, ...))v81;
      v83 = object_getClass(self);
      v84 = class_isMetaClass(v83);
      v85 = object_getClassName(self);
      v86 = sel_getName(a2);
      v87 = 45;
      if (v84)
        v87 = 43;
      v82(6, "%c[%{public}s %{public}s]:%i Performing short retry in %d seconds", v87, v85, v86, 1494, dword_100041110[v58]);
    }
    v88 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v89 = NFSharedLogGetLogger(v88);
    v90 = objc_claimAutoreleasedReturnValue(v89);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      v91 = object_getClass(self);
      if (class_isMetaClass(v91))
        v92 = 43;
      else
        v92 = 45;
      v93 = object_getClassName(self);
      v94 = sel_getName(a2);
      v95 = dword_100041110[v58];
      *(_DWORD *)buf = 67110146;
      v211 = v92;
      v212 = 2082;
      v213 = v93;
      v214 = 2082;
      v215 = v94;
      v216 = 1024;
      v217 = 1494;
      v218 = 1024;
      LODWORD(v219) = v95;
      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Performing short retry in %d seconds", buf, 0x28u);
    }

    sleep(dword_100041110[v58++]);
    goto LABEL_76;
  }
  if (v18 == 3 && v58 == 3)
  {
    v154 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v155 = NFLogGetLogger(v154);
    if (v155)
    {
      v156 = (void (*)(uint64_t, const char *, ...))v155;
      v157 = object_getClass(self);
      v158 = class_isMetaClass(v157);
      v159 = object_getClassName(self);
      v206 = sel_getName(a2);
      v160 = 45;
      if (v158)
        v160 = 43;
      v156(6, "%c[%{public}s %{public}s]:%i Short retries expired", v160, v159, v206, 1501);
    }
    v161 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v162 = NFSharedLogGetLogger(v161);
    v163 = objc_claimAutoreleasedReturnValue(v162);
    if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
    {
      v164 = object_getClass(self);
      if (class_isMetaClass(v164))
        v165 = 43;
      else
        v165 = 45;
      v166 = object_getClassName(self);
      v167 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v211 = v165;
      v212 = 2082;
      v213 = v166;
      v214 = 2082;
      v215 = v167;
      v216 = 1024;
      v217 = 1501;
      _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Short retries expired", buf, 0x22u);
    }

    v18 = 3;
  }
LABEL_139:
  v17 = v61 != 0;
  v16 = v209;
LABEL_14:
  if (-[NFRemoteAdminRedirectSession redirectStepError](self, "redirectStepError") == 3
    || -[NFRemoteAdminRedirectSession aborted](self, "aborted"))
  {
    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFLogGetLogger(v19);
    if (v20)
    {
      v21 = (void (*)(uint64_t, const char *, ...))v20;
      v22 = object_getClass(self);
      v23 = class_isMetaClass(v22);
      v24 = object_getClassName(self);
      v199 = sel_getName(a2);
      v25 = 45;
      if (v23)
        v25 = 43;
      v21(6, "%c[%{public}s %{public}s]:%i aborted", v25, v24, v199, 1520);
    }
    v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v27 = NFSharedLogGetLogger(v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = object_getClass(self);
      if (class_isMetaClass(v29))
        v30 = 43;
      else
        v30 = 45;
      v31 = object_getClassName(self);
      v32 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v211 = v30;
      v212 = 2082;
      v213 = v31;
      v214 = 2082;
      v215 = v32;
      v216 = 1024;
      v217 = 1520;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i aborted", buf, 0x22u);
    }

    if ((id)-[NFRemoteAdminRedirectSession abortedReason](self, "abortedReason") == (id)6)
      v18 = 7;
    else
      v18 = 1;
    v33 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@(reason=%d)"), CFSTR("Cancel"), -[NFRemoteAdminRedirectSession abortedReason](self, "abortedReason"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    objc_msgSend(v34, "setIncompleteReason:", v33);

    goto LABEL_29;
  }
  if (v18)
  {
    if (v18 == 7)
    {
      v96 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v97 = NFLogGetLogger(v96);
      if (v97)
      {
        v98 = (void (*)(uint64_t, const char *, ...))v97;
        v99 = object_getClass(self);
        v100 = class_isMetaClass(v99);
        v101 = object_getClassName(self);
        v202 = sel_getName(a2);
        v102 = 45;
        if (v100)
          v102 = 43;
        v98(6, "%c[%{public}s %{public}s]:%i tag unavailable", v102, v101, v202, 1531);
      }
      v103 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v104 = NFSharedLogGetLogger(v103);
      v105 = objc_claimAutoreleasedReturnValue(v104);
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        v106 = object_getClass(self);
        if (class_isMetaClass(v106))
          v107 = 43;
        else
          v107 = 45;
        v108 = object_getClassName(self);
        v109 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v211 = v107;
        v212 = 2082;
        v213 = v108;
        v214 = 2082;
        v215 = v109;
        v216 = 1024;
        v217 = 1531;
        _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i tag unavailable", buf, 0x22u);
      }

      v33 = (id)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      objc_msgSend(v33, "setIncompleteReason:", CFSTR("CardNotFound"));
      v18 = 3;
LABEL_29:

      goto LABEL_30;
    }
    if (-[NFRemoteAdminRedirectSession redirectStepError](self, "redirectStepError") == 29)
    {
      v152 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      v33 = v152;
      v153 = CFSTR("ReaderTransceiveError");
LABEL_122:
      objc_msgSend(v152, "setIncompleteReason:", v153);
      v18 = 5;
      goto LABEL_29;
    }
    switch(v18)
    {
      case 0xDuLL:
        v152 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
        v33 = v152;
        v153 = CFSTR("ReaderModeProtection");
        goto LABEL_122;
      case 0xAuLL:
        v33 = (id)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
        objc_msgSend(v33, "setIncompleteReason:", CFSTR("CommandError"));
        v18 = 6;
        goto LABEL_29;
      case 9uLL:
        v33 = (id)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
        objc_msgSend(v33, "setIncompleteReason:", CFSTR("UnsupportedCardFound"));
        v18 = 4;
        goto LABEL_29;
    }
    if (!v17 || v18 <= 0xF && ((1 << v18) & 0x811C) != 0)
    {
      v168 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v169 = NFLogGetLogger(v168);
      if (v169)
      {
        v170 = (void (*)(uint64_t, const char *, ...))v169;
        v171 = object_getClass(self);
        v172 = class_isMetaClass(v171);
        v196 = object_getClassName(self);
        v207 = sel_getName(a2);
        v173 = 45;
        if (v172)
          v173 = 43;
        v170(3, "%c[%{public}s %{public}s]:%i ingestion failed, status=0x%lx", v173, v196, v207, 1556, v18);
      }
      v174 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v175 = NFSharedLogGetLogger(v174);
      v176 = objc_claimAutoreleasedReturnValue(v175);
      if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
      {
        v177 = object_getClass(self);
        if (class_isMetaClass(v177))
          v178 = 43;
        else
          v178 = 45;
        v179 = object_getClassName(self);
        v180 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v211 = v178;
        v212 = 2082;
        v213 = v179;
        v214 = 2082;
        v215 = v180;
        v216 = 1024;
        v217 = 1556;
        v218 = 2048;
        v219 = v18;
        _os_log_impl((void *)&_mh_execute_header, v176, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ingestion failed, status=0x%lx", buf, 0x2Cu);
      }

      if (v18 != 8)
      {
        v33 = (id)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
        objc_msgSend(v33, "setIncompleteReason:", CFSTR("NetworkError"));
        v18 = 2;
        goto LABEL_29;
      }
      v18 = 2;
      goto LABEL_30;
    }
    v181 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v182 = NFLogGetLogger(v181);
    if (v182)
    {
      v183 = (void (*)(uint64_t, const char *, ...))v182;
      v184 = object_getClass(self);
      v185 = class_isMetaClass(v184);
      v197 = object_getClassName(self);
      v208 = sel_getName(a2);
      v186 = 45;
      if (v185)
        v186 = 43;
      v183(3, "%c[%{public}s %{public}s]:%i ingestion failed, status=0x%lx", v186, v197, v208, 1563, v18);
    }
    v187 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v188 = NFSharedLogGetLogger(v187);
    v189 = objc_claimAutoreleasedReturnValue(v188);
    if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
    {
      v190 = object_getClass(self);
      if (class_isMetaClass(v190))
        v191 = 43;
      else
        v191 = 45;
      v192 = object_getClassName(self);
      v193 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v211 = v191;
      v212 = 2082;
      v213 = v192;
      v214 = 2082;
      v215 = v193;
      v216 = 1024;
      v217 = 1563;
      v218 = 2048;
      v219 = v18;
      _os_log_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ingestion failed, status=0x%lx", buf, 0x2Cu);
    }

    v194 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown error:%d"), -[NFRemoteAdminRedirectSession redirectStepError](self, "redirectStepError"));
    v195 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    objc_msgSend(v195, "setIncompleteReason:", v194);

    v18 = -1;
LABEL_31:
    -[NFRemoteAdminRedirectSession closeConnection](self, "closeConnection");
  }
  else
  {
LABEL_30:
    if (v17)
      goto LABEL_31;
  }
  -[NFRemoteAdminReaderSession _closeSession](self, "_closeSession");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "performanceMetrics"));
  v37 = mach_continuous_time();
  v38 = (double)(unint64_t)GetElapsedTimeInMillisecondsFromMachTime(v37, v16) / 1000.0;
  objc_msgSend(v36, "totalSessionTime");
  objc_msgSend(v36, "setTotalSessionTime:", v39 + v38);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  objc_msgSend(v40, "clearRetryInterval");

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  objc_msgSend(v41, "incrementStep");

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  objc_msgSend(v42, "save");

  return v18;
}

- (unint64_t)_doFinalTSMCheckIn
{
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
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  void *v36;
  uint64_t v37;
  void (*v38)(uint64_t, const char *, ...);
  objc_class *v39;
  _BOOL4 v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  objc_class *v46;
  int v47;
  const char *v48;
  const char *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void (*v53)(uint64_t, const char *, ...);
  objc_class *v54;
  _BOOL4 v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  objc_class *v62;
  int v63;
  const char *v64;
  const char *v65;
  unsigned int v66;
  void *v67;
  uint64_t v68;
  void (*v69)(uint64_t, const char *, ...);
  objc_class *v70;
  _BOOL4 v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  NSObject *v76;
  objc_class *v77;
  int v78;
  const char *v79;
  const char *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void (*v84)(uint64_t, const char *, ...);
  objc_class *v85;
  _BOOL4 v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  NSObject *v91;
  objc_class *v92;
  int v93;
  const char *v94;
  const char *v95;
  const char *v96;
  void *v97;
  uint64_t v98;
  void (*v99)(uint64_t, const char *, ...);
  objc_class *v100;
  _BOOL4 v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
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
  NSObject *v119;
  objc_class *v120;
  int v121;
  const char *v122;
  const char *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  const char *Name;
  const char *v130;
  const char *v131;
  const char *v132;
  const char *v133;
  const char *v134;
  const char *v135;
  uint8_t buf[4];
  int v137;
  __int16 v138;
  const char *v139;
  __int16 v140;
  const char *v141;
  __int16 v142;
  int v143;
  __int16 v144;
  unsigned int v145;

  if (byte_10005C3E8)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v6(6, "%c[%{public}s %{public}s]:%i [TSM] Performing final TSM checkin", v10, ClassName, Name, 1588);
    }
    v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFSharedLogGetLogger(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = object_getClass(self);
      if (class_isMetaClass(v14))
        v15 = 43;
      else
        v15 = 45;
      *(_DWORD *)buf = 67109890;
      v137 = v15;
      v138 = 2082;
      v139 = object_getClassName(self);
      v140 = 2082;
      v141 = sel_getName(a2);
      v142 = 1024;
      v143 = 1588;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Performing final TSM checkin", buf, 0x22u);
    }

  }
  v16 = 0;
  v17 = 5;
  while (1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession connection](self, "connection"));

    if (!v18)
    {
      if (byte_10005C3E8)
      {
        v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v20 = NFLogGetLogger(v19);
        if (v20)
        {
          v21 = (void (*)(uint64_t, const char *, ...))v20;
          v22 = object_getClass(self);
          v23 = class_isMetaClass(v22);
          v24 = object_getClassName(self);
          v130 = sel_getName(a2);
          v25 = 45;
          if (v23)
            v25 = 43;
          v21(6, "%c[%{public}s %{public}s]:%i [TSM] Opening connection to TSM", v25, v24, v130, 1594);
        }
        v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v27 = NFSharedLogGetLogger(v26);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = object_getClass(self);
          if (class_isMetaClass(v29))
            v30 = 43;
          else
            v30 = 45;
          v31 = object_getClassName(self);
          v32 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v137 = v30;
          v138 = 2082;
          v139 = v31;
          v140 = 2082;
          v141 = v32;
          v142 = 1024;
          v143 = 1594;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Opening connection to TSM", buf, 0x22u);
        }

      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "sourceUrl"));
      v35 = -[NFRemoteAdminRedirectSession openConnection:](self, "openConnection:", v34);

      if ((v35 & 1) == 0)
      {
        v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v37 = NFLogGetLogger(v36);
        if (v37)
        {
          v38 = (void (*)(uint64_t, const char *, ...))v37;
          v39 = object_getClass(self);
          v40 = class_isMetaClass(v39);
          v41 = object_getClassName(self);
          v131 = sel_getName(a2);
          v42 = 45;
          if (v40)
            v42 = 43;
          v38(3, "%c[%{public}s %{public}s]:%i Failed to open connection", v42, v41, v131, 1597);
        }
        v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v44 = NFSharedLogGetLogger(v43);
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v46 = object_getClass(self);
          if (class_isMetaClass(v46))
            v47 = 43;
          else
            v47 = 45;
          v48 = object_getClassName(self);
          v49 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v137 = v47;
          v138 = 2082;
          v139 = v48;
          v140 = 2082;
          v141 = v49;
          v142 = 1024;
          v143 = 1597;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open connection", buf, 0x22u);
        }

        v17 = 3;
      }
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession connection](self, "connection"));

    if (v50)
    {
      v17 = -[NFRemoteAdminRedirectSession performCheckIn](self, "performCheckIn");
      if (!v17)
      {
        if (v16 <= 2)
        {
          -[NFRemoteAdminRedirectSession closeConnection](self, "closeConnection");
          v126 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
          objc_msgSend(v126, "incrementStep");

          v17 = -[NFRemoteAdminRedirectSession aborted](self, "aborted");
          goto LABEL_104;
        }
LABEL_78:
        v97 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v98 = NFLogGetLogger(v97);
        if (v98)
        {
          v99 = (void (*)(uint64_t, const char *, ...))v98;
          v100 = object_getClass(self);
          v101 = class_isMetaClass(v100);
          v102 = object_getClassName(self);
          v134 = sel_getName(a2);
          v103 = 45;
          if (v101)
            v103 = 43;
          v99(5, "%c[%{public}s %{public}s]:%i Short retries expired", v103, v102, v134, 1621);
        }
        v104 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v105 = NFSharedLogGetLogger(v104);
        v91 = objc_claimAutoreleasedReturnValue(v105);
        if (!os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
          goto LABEL_88;
        v106 = object_getClass(self);
        if (class_isMetaClass(v106))
          v107 = 43;
        else
          v107 = 45;
        v108 = object_getClassName(self);
        v109 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v137 = v107;
        v138 = 2082;
        v139 = v108;
        v140 = 2082;
        v141 = v109;
        v142 = 1024;
        v143 = 1621;
        v96 = "%c[%{public}s %{public}s]:%i Short retries expired";
        goto LABEL_87;
      }
    }
    if (-[NFRemoteAdminRedirectSession aborted](self, "aborted"))
    {
      v82 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v83 = NFLogGetLogger(v82);
      if (v83)
      {
        v84 = (void (*)(uint64_t, const char *, ...))v83;
        v85 = object_getClass(self);
        v86 = class_isMetaClass(v85);
        v87 = object_getClassName(self);
        v133 = sel_getName(a2);
        v88 = 45;
        if (v86)
          v88 = 43;
        v84(5, "%c[%{public}s %{public}s]:%i Checkin failed and abort was requested; try again later",
          v88,
          v87,
          v133,
          1608);
      }
      v89 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v90 = NFSharedLogGetLogger(v89);
      v91 = objc_claimAutoreleasedReturnValue(v90);
      if (!os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        goto LABEL_88;
      v92 = object_getClass(self);
      if (class_isMetaClass(v92))
        v93 = 43;
      else
        v93 = 45;
      v94 = object_getClassName(self);
      v95 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v137 = v93;
      v138 = 2082;
      v139 = v94;
      v140 = 2082;
      v141 = v95;
      v142 = 1024;
      v143 = 1608;
      v96 = "%c[%{public}s %{public}s]:%i Checkin failed and abort was requested; try again later";
LABEL_87:
      _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, v96, buf, 0x22u);
LABEL_88:

      -[NFRemoteAdminRedirectSession closeConnection](self, "closeConnection");
      goto LABEL_89;
    }
    if (v17 != 3 || v16 > 2)
      break;
    v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v52 = NFLogGetLogger(v51);
    if (v52)
    {
      v53 = (void (*)(uint64_t, const char *, ...))v52;
      v54 = object_getClass(self);
      v55 = class_isMetaClass(v54);
      v56 = object_getClassName(self);
      v57 = sel_getName(a2);
      v58 = 45;
      if (v55)
        v58 = 43;
      v53(6, "%c[%{public}s %{public}s]:%i Performing short retry in %d seconds", v58, v56, v57, 1614, dword_100041110[v16]);
    }
    v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v60 = NFSharedLogGetLogger(v59);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      v62 = object_getClass(self);
      if (class_isMetaClass(v62))
        v63 = 43;
      else
        v63 = 45;
      v64 = object_getClassName(self);
      v65 = sel_getName(a2);
      v66 = dword_100041110[v16];
      *(_DWORD *)buf = 67110146;
      v137 = v63;
      v138 = 2082;
      v139 = v64;
      v140 = 2082;
      v141 = v65;
      v142 = 1024;
      v143 = 1614;
      v144 = 1024;
      v145 = v66;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Performing short retry in %d seconds", buf, 0x28u);
    }

    sleep(dword_100041110[v16++]);
LABEL_53:
    v17 = 6;
    if (-[NFRemoteAdminRedirectSession aborted](self, "aborted"))
    {
      -[NFRemoteAdminRedirectSession closeConnection](self, "closeConnection");
      v17 = 6;
      goto LABEL_55;
    }
  }
  if (v16 > 2)
    goto LABEL_78;
  if (v17 == 6)
    goto LABEL_53;
  -[NFRemoteAdminRedirectSession closeConnection](self, "closeConnection");
  if (v17 == 8)
    goto LABEL_102;
  if (v17 != 4)
  {
LABEL_55:
    if (-[NFRemoteAdminRedirectSession aborted](self, "aborted"))
    {
      if (byte_10005C3E8)
      {
        v67 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v68 = NFLogGetLogger(v67);
        if (v68)
        {
          v69 = (void (*)(uint64_t, const char *, ...))v68;
          v70 = object_getClass(self);
          v71 = class_isMetaClass(v70);
          v72 = object_getClassName(self);
          v132 = sel_getName(a2);
          v73 = 45;
          if (v71)
            v73 = 43;
          v69(6, "%c[%{public}s %{public}s]:%i [TSM] Checkin failed and abort was requested; try again later",
            v73,
            v72,
            v132,
            1646);
        }
        v74 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v75 = NFSharedLogGetLogger(v74);
        v76 = objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          v77 = object_getClass(self);
          if (class_isMetaClass(v77))
            v78 = 43;
          else
            v78 = 45;
          v79 = object_getClassName(self);
          v80 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v137 = v78;
          v138 = 2082;
          v139 = v79;
          v140 = 2082;
          v141 = v80;
          v142 = 1024;
          v143 = 1646;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Checkin failed and abort was requested; try again later",
            buf,
            0x22u);
        }

      }
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
      objc_msgSend(v81, "incrementLongRetry");

      v17 = 1;
      goto LABEL_104;
    }
LABEL_102:
    v125 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
    objc_msgSend(v125, "incrementStep");

    goto LABEL_104;
  }
LABEL_89:
  v110 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v111 = NFLogGetLogger(v110);
  if (v111)
  {
    v112 = (void (*)(uint64_t, const char *, ...))v111;
    v113 = object_getClass(self);
    v114 = class_isMetaClass(v113);
    v115 = object_getClassName(self);
    v135 = sel_getName(a2);
    v116 = 45;
    if (v114)
      v116 = 43;
    v112(6, "%c[%{public}s %{public}s]:%i Incrementing long retry for TSM checkin", v116, v115, v135, 1631);
  }
  v117 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v118 = NFSharedLogGetLogger(v117);
  v119 = objc_claimAutoreleasedReturnValue(v118);
  if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
  {
    v120 = object_getClass(self);
    if (class_isMetaClass(v120))
      v121 = 43;
    else
      v121 = 45;
    v122 = object_getClassName(self);
    v123 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v137 = v121;
    v138 = 2082;
    v139 = v122;
    v140 = 2082;
    v141 = v123;
    v142 = 1024;
    v143 = 1631;
    _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Incrementing long retry for TSM checkin", buf, 0x22u);
  }

  v124 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  objc_msgSend(v124, "incrementLongRetry");

  v17 = 4;
LABEL_104:
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectSession redirectState](self, "redirectState"));
  objc_msgSend(v127, "save");

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_sessionStartSem, 0);
  objc_storeStrong((id *)&self->_tagSem, 0);
  objc_storeStrong((id *)&self->_externalState, 0);
  objc_storeStrong((id *)&self->_cardContents, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_readerSession, 0);
}

@end
