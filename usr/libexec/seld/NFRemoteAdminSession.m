@implementation NFRemoteAdminSession

- (NFRemoteAdminSession)init
{
  NFRemoteAdminSession *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *endMetric;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NFRemoteAdminSession;
  v2 = -[NFRemoteAdminSession init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    endMetric = v2->_endMetric;
    v2->_endMetric = v3;

    v2->_allocateSESession = 1;
  }
  return v2;
}

- (void)abort:(int64_t)a3
{
  NFRemoteAdminSession *v5;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v9;
  const char *ClassName;
  const char *Name;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;

  v5 = self;
  objc_sync_enter(v5);
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
  {
    Class = object_getClass(v5);
    if (class_isMetaClass(Class))
      v9 = 43;
    else
      v9 = 45;
    ClassName = object_getClassName(v5);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Aborting (%u)...", v9, ClassName, Name, 90, a3);
  }
  v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v13 = NFSharedLogGetLogger(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(v5);
    if (class_isMetaClass(v15))
      v16 = 43;
    else
      v16 = 45;
    *(_DWORD *)buf = 67110146;
    v18 = v16;
    v19 = 2082;
    v20 = object_getClassName(v5);
    v21 = 2082;
    v22 = sel_getName(a2);
    v23 = 1024;
    v24 = 90;
    v25 = 1024;
    v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Aborting (%u)...", buf, 0x28u);
  }

  v5->_abort = a3;
  -[NFRemoteAdminConnection disconnect](v5->_connection, "disconnect");
  objc_sync_exit(v5);

}

- (void)_preprocessNotification:(id)a3 withTaskID:(id)a4
{
  NSMutableArray *v5;
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
  __CFString *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *v28;
  _BOOL4 v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  void *v38;
  uint64_t v39;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *v41;
  _BOOL4 v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  __CFString *v53;
  void *v54;
  uint64_t v55;
  void (*v56)(uint64_t, const char *, ...);
  objc_class *v57;
  _BOOL4 v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  objc_class *v63;
  int v64;
  const char *v65;
  const char *v66;
  id v67;
  id v68;
  uint64_t v69;
  void *j;
  const __CFString *v71;
  uint64_t v72;
  NFSecureElementManagerSession *seSession;
  NSString *targetSEID;
  NSString *v75;
  NSObject *v76;
  NSObject *v77;
  BOOL v78;
  void *v79;
  uint64_t v80;
  void (*v81)(uint64_t, const char *, ...);
  objc_class *v82;
  _BOOL4 v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  NSObject *v88;
  objc_class *v89;
  int v90;
  const char *v91;
  const char *v92;
  void *v93;
  uint64_t v94;
  void (*v95)(uint64_t, const char *, ...);
  objc_class *v96;
  _BOOL4 v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  objc_class *v103;
  int v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  __CFString *v108;
  void *v109;
  uint64_t v110;
  void (*v111)(uint64_t, const char *, ...);
  objc_class *v112;
  _BOOL4 v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  NSObject *v117;
  objc_class *v118;
  int v119;
  const char *v120;
  const char *v121;
  __CFString *v122;
  id v123;
  id v124;
  uint64_t v125;
  void *k;
  void *v127;
  uint64_t v128;
  NSObject *v129;
  uint64_t v130;
  NSObject *v131;
  void *v132;
  BOOL v133;
  uint64_t v134;
  NSObject *v135;
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
  void *v150;
  uint64_t v151;
  void (*v152)(uint64_t, const char *, ...);
  objc_class *v153;
  _BOOL4 v154;
  const char *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  objc_class *v160;
  int v161;
  const char *v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void (*v167)(uint64_t, const char *, ...);
  objc_class *v168;
  _BOOL4 v169;
  const char *v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  uint64_t v174;
  objc_class *v175;
  int v176;
  const char *v177;
  const char *v178;
  uint64_t v179;
  void *v180;
  uint64_t v181;
  void (*v182)(uint64_t, const char *, ...);
  objc_class *v183;
  _BOOL4 v184;
  const char *v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  uint64_t v189;
  objc_class *v190;
  int v191;
  const char *v192;
  const char *v193;
  uint64_t v194;
  NFSecureElementManagerSession *v195;
  NSString *v196;
  NSString *v197;
  int v198;
  NSObject *v199;
  void *v200;
  uint64_t v201;
  void (*v202)(uint64_t, const char *, ...);
  objc_class *v203;
  _BOOL4 v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  uint64_t v208;
  NSObject *v209;
  objc_class *v210;
  int v211;
  const char *v212;
  const char *v213;
  __CFString *v214;
  void *v215;
  uint64_t v216;
  void (*v217)(uint64_t, const char *, ...);
  objc_class *v218;
  _BOOL4 v219;
  uint64_t v220;
  void *v221;
  uint64_t v222;
  NSObject *v223;
  objc_class *v224;
  int v225;
  const char *v226;
  const char *v227;
  __CFString *v228;
  uint64_t v229;
  void *m;
  __CFString *v231;
  uint64_t v232;
  NSObject *v233;
  void *v234;
  void *v235;
  uint64_t v236;
  void *v237;
  BOOL v238;
  void *v240;
  uint64_t v241;
  void (*v242)(uint64_t, const char *, ...);
  objc_class *v243;
  _BOOL4 v244;
  uint64_t v245;
  void *v246;
  uint64_t v247;
  objc_class *v248;
  int v249;
  const char *v250;
  const char *v251;
  void *v252;
  uint64_t v253;
  void (*v254)(uint64_t, const char *, ...);
  objc_class *v255;
  _BOOL4 v256;
  const char *v257;
  const char *v258;
  uint64_t v259;
  void *v260;
  uint64_t v261;
  objc_class *v262;
  int v263;
  const char *v264;
  const char *v265;
  uint64_t v266;
  NSObject *v267;
  void *v268;
  NFSecureElementManagerSession *v269;
  NSString *v270;
  NSString *v271;
  unsigned int v272;
  NSObject *v273;
  BOOL v274;
  void *v275;
  uint64_t v276;
  void (*v277)(uint64_t, const char *, ...);
  objc_class *v278;
  _BOOL4 v279;
  const char *v280;
  uint64_t v281;
  void *v282;
  uint64_t v283;
  NSObject *v284;
  objc_class *v285;
  int v286;
  const char *v287;
  const char *v288;
  const char *ClassName;
  const char *v290;
  const char *v291;
  const char *v292;
  const char *v293;
  const char *v294;
  const char *Name;
  const char *v296;
  const char *v297;
  const char *v298;
  const char *v299;
  const char *v300;
  const char *v301;
  const char *v302;
  const char *v303;
  const char *v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  __CFString *v312;
  id v313;
  id v314;
  __CFString *v315;
  __CFString *v316;
  void *v317;
  uint64_t v318;
  __CFString *obj;
  NSMutableArray *v320;
  id v321;
  id v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  id v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  id v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  _BYTE v343[128];
  _BYTE v344[128];
  uint8_t v345[128];
  uint8_t buf[4];
  int v347;
  __int16 v348;
  const char *v349;
  __int16 v350;
  const char *v351;
  __int16 v352;
  int v353;
  __int16 v354;
  const __CFString *v355;
  __int16 v356;
  NSObject *v357;
  _BYTE v358[128];

  v313 = a3;
  v314 = a4;
  v312 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v313, "NF_arrayForKey:", CFSTR("mfdListPreExecution")));
  if (-[__CFString count](v312, "count"))
  {
    v5 = objc_opt_new(NSMutableArray);
    if (byte_10005C3E8)
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
        v11 = 45;
        if (isMetaClass)
          v11 = 43;
        v8(6, "%c[%{public}s %{public}s]:%i [TSM] MFD list: %@", v11, ClassName, Name, 112, v312);
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
        v347 = v16;
        v348 = 2082;
        v349 = object_getClassName(self);
        v350 = 2082;
        v351 = sel_getName(a2);
        v352 = 1024;
        v353 = 112;
        v354 = 2112;
        v355 = v312;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] MFD list: %@", buf, 0x2Cu);
      }

    }
    v320 = v5;
    v341 = 0u;
    v342 = 0u;
    v339 = 0u;
    v340 = 0u;
    v17 = v312;
    v18 = -[__CFString countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v339, v358, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v340;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v340 != v20)
            objc_enumerationMutation(v17);
          v22 = *(const __CFString **)(*((_QWORD *)&v339 + 1) + 8 * (_QWORD)i);
          v23 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
          {
            v24 = objc_claimAutoreleasedReturnValue(-[NFSecureElementManagerSession appletWithIdentifier:](self->_seSession, "appletWithIdentifier:", v22));
            if (v24)
            {
              -[NSMutableArray addObject:](v320, "addObject:", v24);
              if (byte_10005C3E8)
              {
                v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v26 = NFLogGetLogger(v25);
                if (v26)
                {
                  v27 = (void (*)(uint64_t, const char *, ...))v26;
                  v28 = object_getClass(self);
                  v29 = class_isMetaClass(v28);
                  v290 = object_getClassName(self);
                  v296 = sel_getName(a2);
                  v30 = 45;
                  if (v29)
                    v30 = 43;
                  v27(6, "%c[%{public}s %{public}s]:%i [TSM] Deleting applet: %@", v30, v290, v296, 122, v22);
                }
                v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v32 = NFSharedLogGetLogger(v31);
                v33 = objc_claimAutoreleasedReturnValue(v32);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  v34 = object_getClass(self);
                  if (class_isMetaClass(v34))
                    v35 = 43;
                  else
                    v35 = 45;
                  v36 = object_getClassName(self);
                  v37 = sel_getName(a2);
                  *(_DWORD *)buf = 67110146;
                  v347 = v35;
                  v348 = 2082;
                  v349 = v36;
                  v350 = 2082;
                  v351 = v37;
                  v352 = 1024;
                  v353 = 122;
                  v354 = 2112;
                  v355 = v22;
                  _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Deleting applet: %@", buf, 0x2Cu);
                }

              }
            }
          }
          else
          {
            v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v39 = NFLogGetLogger(v38);
            if (v39)
            {
              v40 = (void (*)(uint64_t, const char *, ...))v39;
              v41 = object_getClass(self);
              v42 = class_isMetaClass(v41);
              v43 = object_getClassName(self);
              v44 = sel_getName(a2);
              v306 = objc_opt_class(v22);
              v45 = 45;
              if (v42)
                v45 = 43;
              v40(3, "%c[%{public}s %{public}s]:%i %{public}@ Expected String, got %{public}@", v45, v43, v44, 116, CFSTR("mfdListPreExecution"), v306);
            }
            v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v47 = NFSharedLogGetLogger(v46);
            v24 = objc_claimAutoreleasedReturnValue(v47);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v48 = object_getClass(self);
              if (class_isMetaClass(v48))
                v49 = 43;
              else
                v49 = 45;
              v50 = object_getClassName(self);
              v51 = sel_getName(a2);
              v52 = objc_opt_class(v22);
              *(_DWORD *)buf = 67110402;
              v347 = v49;
              v348 = 2082;
              v349 = v50;
              v350 = 2082;
              v351 = v51;
              v352 = 1024;
              v353 = 116;
              v354 = 2114;
              v355 = CFSTR("mfdListPreExecution");
              v356 = 2114;
              v357 = v52;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ Expected String, got %{public}@", buf, 0x36u);
            }
          }

        }
        v19 = -[__CFString countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v339, v358, 16);
      }
      while (v19);
    }

    if (-[NSMutableArray count](v320, "count"))
      -[NFSecureElementManagerSession deleteApplets:queueServerConnection:](self->_seSession, "deleteApplets:queueServerConnection:", v320, 0);

  }
  v53 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v313, "NF_arrayForKey:", CFSTR("PTDeleteKeyIdsPreExecution")));
  if (-[__CFString count](v53, "count") && byte_10005C3E8)
  {
    v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v55 = NFLogGetLogger(v54);
    if (v55)
    {
      v56 = (void (*)(uint64_t, const char *, ...))v55;
      v57 = object_getClass(self);
      v58 = class_isMetaClass(v57);
      v291 = object_getClassName(self);
      v297 = sel_getName(a2);
      v59 = 45;
      if (v58)
        v59 = 43;
      v56(6, "%c[%{public}s %{public}s]:%i [TSM] PT Keys to delete: %@", v59, v291, v297, 133, v53);
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
      *(_DWORD *)buf = 67110146;
      v347 = v64;
      v348 = 2082;
      v349 = v65;
      v350 = 2082;
      v351 = v66;
      v352 = 1024;
      v353 = 133;
      v354 = 2112;
      v355 = v53;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] PT Keys to delete: %@", buf, 0x2Cu);
    }

  }
  v337 = 0u;
  v338 = 0u;
  v335 = 0u;
  v336 = 0u;
  obj = v53;
  v67 = -[__CFString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v335, v345, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v336;
    do
    {
      for (j = 0; j != v68; j = (char *)j + 1)
      {
        if (*(_QWORD *)v336 != v69)
          objc_enumerationMutation(obj);
        v71 = *(const __CFString **)(*((_QWORD *)&v335 + 1) + 8 * (_QWORD)j);
        v72 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v71, v72) & 1) != 0)
        {
          seSession = self->_seSession;
          targetSEID = self->_targetSEID;
          v334 = 0;
          v75 = targetSEID;
          LODWORD(seSession) = SESEndPointDeleteWithSession(seSession, v75, v71, &v334);
          v76 = v334;

          v77 = 0;
          if ((_DWORD)seSession)
            v78 = v76 == 0;
          else
            v78 = 0;
          if (!v78)
          {
            if (byte_10005C3E8)
            {
              v79 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v80 = NFLogGetLogger(v79);
              if (v80)
              {
                v81 = (void (*)(uint64_t, const char *, ...))v80;
                v82 = object_getClass(self);
                v83 = class_isMetaClass(v82);
                v84 = object_getClassName(self);
                v298 = sel_getName(a2);
                if (v83)
                  v85 = 43;
                else
                  v85 = 45;
                v81(6, "%c[%{public}s %{public}s]:%i [TSM] Failed to delete key with identifier %@ : %@", v85, v84, v298, 142, v71, v76);
              }
              v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v87 = NFSharedLogGetLogger(v86);
              v88 = objc_claimAutoreleasedReturnValue(v87);
              if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
              {
                v89 = object_getClass(self);
                if (class_isMetaClass(v89))
                  v90 = 43;
                else
                  v90 = 45;
                v91 = object_getClassName(self);
                v92 = sel_getName(a2);
                *(_DWORD *)buf = 67110402;
                v347 = v90;
                v348 = 2082;
                v349 = v91;
                v350 = 2082;
                v351 = v92;
                v352 = 1024;
                v353 = 142;
                v354 = 2112;
                v355 = v71;
                v356 = 2112;
                v357 = v76;
                _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Failed to delete key with identifier %@ : %@", buf, 0x36u);
              }

            }
            v77 = v76;
          }
        }
        else
        {
          v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v94 = NFLogGetLogger(v93);
          if (v94)
          {
            v95 = (void (*)(uint64_t, const char *, ...))v94;
            v96 = object_getClass(self);
            v97 = class_isMetaClass(v96);
            v98 = object_getClassName(self);
            v99 = sel_getName(a2);
            v307 = objc_opt_class(v71);
            if (v97)
              v100 = 43;
            else
              v100 = 45;
            v95(3, "%c[%{public}s %{public}s]:%i %{public}@ Expected String, got %{public}@", v100, v98, v99, 136, CFSTR("PTDeleteKeyIdsPreExecution"), v307);
          }
          v101 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v102 = NFSharedLogGetLogger(v101);
          v77 = objc_claimAutoreleasedReturnValue(v102);
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            v103 = object_getClass(self);
            if (class_isMetaClass(v103))
              v104 = 43;
            else
              v104 = 45;
            v105 = object_getClassName(self);
            v106 = sel_getName(a2);
            v107 = objc_opt_class(v71);
            *(_DWORD *)buf = 67110402;
            v347 = v104;
            v348 = 2082;
            v349 = v105;
            v350 = 2082;
            v351 = v106;
            v352 = 1024;
            v353 = 136;
            v354 = 2114;
            v355 = CFSTR("PTDeleteKeyIdsPreExecution");
            v356 = 2114;
            v357 = v107;
            _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ Expected String, got %{public}@", buf, 0x36u);
          }
        }

      }
      v68 = -[__CFString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v335, v345, 16);
    }
    while (v68);
  }

  v108 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v313, "NF_arrayForKey:", CFSTR("PTTerminateKeyIdsPreExecution")));
  if (-[__CFString count](v108, "count") && byte_10005C3E8)
  {
    v109 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v110 = NFLogGetLogger(v109);
    if (v110)
    {
      v111 = (void (*)(uint64_t, const char *, ...))v110;
      v112 = object_getClass(self);
      v113 = class_isMetaClass(v112);
      v292 = object_getClassName(self);
      v299 = sel_getName(a2);
      v114 = 45;
      if (v113)
        v114 = 43;
      v111(6, "%c[%{public}s %{public}s]:%i [TSM] PT Keys to terminate: %@", v114, v292, v299, 147, v108);
    }
    v115 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v116 = NFSharedLogGetLogger(v115);
    v117 = objc_claimAutoreleasedReturnValue(v116);
    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
    {
      v118 = object_getClass(self);
      if (class_isMetaClass(v118))
        v119 = 43;
      else
        v119 = 45;
      v120 = object_getClassName(self);
      v121 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v347 = v119;
      v348 = 2082;
      v349 = v120;
      v350 = 2082;
      v351 = v121;
      v352 = 1024;
      v353 = 147;
      v354 = 2112;
      v355 = v108;
      _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] PT Keys to terminate: %@", buf, 0x2Cu);
    }

  }
  v333 = 0u;
  v331 = 0u;
  v332 = 0u;
  v330 = 0u;
  v122 = v108;
  v123 = -[__CFString countByEnumeratingWithState:objects:count:](v122, "countByEnumeratingWithState:objects:count:", &v330, v344, 16);
  v315 = v122;
  if (v123)
  {
    v124 = v123;
    v125 = *(_QWORD *)v331;
    do
    {
      for (k = 0; k != v124; k = (char *)k + 1)
      {
        if (*(_QWORD *)v331 != v125)
          objc_enumerationMutation(v122);
        v127 = *(void **)(*((_QWORD *)&v330 + 1) + 8 * (_QWORD)k);
        v128 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v127, v128) & 1) != 0)
        {
          v129 = objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "objectForKeyedSubscript:", CFSTR("keyId")));
          v130 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v129, v130) & 1) != 0)
          {
            v131 = objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "NF_stringForKey:", CFSTR("remoteTerminationRequest")));
            v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "objectForKey:", CFSTR("remoteTerminationRequest")));

            if (v132)
              v133 = v131 == 0;
            else
              v133 = 0;
            if (v133)
            {
              v180 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v181 = NFLogGetLogger(v180);
              if (v181)
              {
                v182 = (void (*)(uint64_t, const char *, ...))v181;
                v183 = object_getClass(self);
                v184 = class_isMetaClass(v183);
                v185 = object_getClassName(self);
                v186 = sel_getName(a2);
                v310 = objc_opt_class(0);
                v301 = v186;
                v122 = v315;
                v187 = 45;
                if (v184)
                  v187 = 43;
                v182(3, "%c[%{public}s %{public}s]:%i %{public}@ Expected String, got %{public}@", v187, v185, v301, 164, CFSTR("remoteTerminationRequest"), v310);
              }
              v188 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v189 = NFSharedLogGetLogger(v188);
              v135 = objc_claimAutoreleasedReturnValue(v189);
              if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
              {
                v190 = object_getClass(self);
                if (class_isMetaClass(v190))
                  v191 = 43;
                else
                  v191 = 45;
                v192 = object_getClassName(self);
                v193 = sel_getName(a2);
                v194 = objc_opt_class(0);
                *(_DWORD *)buf = 67110402;
                v347 = v191;
                v348 = 2082;
                v349 = v192;
                v350 = 2082;
                v351 = v193;
                v352 = 1024;
                v353 = 164;
                v354 = 2114;
                v355 = CFSTR("remoteTerminationRequest");
                v356 = 2114;
                v357 = v194;
                _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ Expected String, got %{public}@", buf, 0x36u);
              }
            }
            else
            {
              v134 = objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v131));
              v135 = v134;
              if (!v131 || v134)
              {
                v195 = self->_seSession;
                v196 = self->_targetSEID;
                v329 = 0;
                v197 = v196;
                v198 = SESEndPointRemoteTerminationRequestFromTSM(v195, v197, v135, v129, v314, &v329);
                v199 = v329;

                if (!v198 || (v145 = 0, v199))
                {
                  v200 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  v201 = NFLogGetLogger(v200);
                  if (v201)
                  {
                    v202 = (void (*)(uint64_t, const char *, ...))v201;
                    v203 = object_getClass(self);
                    v204 = class_isMetaClass(v203);
                    v205 = object_getClassName(self);
                    v302 = sel_getName(a2);
                    v206 = 45;
                    if (v204)
                      v206 = 43;
                    v202(3, "%c[%{public}s %{public}s]:%i Failed to terminate key with identifier %{public}@ : %{public}@", v206, v205, v302, 181, v129, v199);
                  }
                  v207 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  v208 = NFSharedLogGetLogger(v207);
                  v209 = objc_claimAutoreleasedReturnValue(v208);
                  if (os_log_type_enabled(v209, OS_LOG_TYPE_ERROR))
                  {
                    v210 = object_getClass(self);
                    if (class_isMetaClass(v210))
                      v211 = 43;
                    else
                      v211 = 45;
                    v212 = object_getClassName(self);
                    v213 = sel_getName(a2);
                    *(_DWORD *)buf = 67110402;
                    v347 = v211;
                    v348 = 2082;
                    v349 = v212;
                    v350 = 2082;
                    v351 = v213;
                    v352 = 1024;
                    v353 = 181;
                    v354 = 2114;
                    v355 = (const __CFString *)v129;
                    v356 = 2114;
                    v357 = v199;
                    _os_log_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to terminate key with identifier %{public}@ : %{public}@", buf, 0x36u);
                  }

                  v145 = v199;
                }
              }
              else
              {
                v136 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v137 = NFLogGetLogger(v136);
                if (v137)
                {
                  v138 = (void (*)(uint64_t, const char *, ...))v137;
                  v139 = object_getClass(self);
                  v140 = class_isMetaClass(v139);
                  v141 = object_getClassName(self);
                  v300 = sel_getName(a2);
                  v142 = 45;
                  if (v140)
                    v142 = 43;
                  v138(3, "%c[%{public}s %{public}s]:%i %{public}@ Got non-nil RTR but it wasn't hex-encoded : %{public}@", v142, v141, v300, 169, CFSTR("remoteTerminationRequest"), v131);
                }
                v143 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v144 = NFSharedLogGetLogger(v143);
                v145 = objc_claimAutoreleasedReturnValue(v144);
                if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
                {
                  v146 = object_getClass(self);
                  if (class_isMetaClass(v146))
                    v147 = 43;
                  else
                    v147 = 45;
                  v148 = object_getClassName(self);
                  v149 = sel_getName(a2);
                  *(_DWORD *)buf = 67110402;
                  v347 = v147;
                  v348 = 2082;
                  v349 = v148;
                  v350 = 2082;
                  v351 = v149;
                  v352 = 1024;
                  v353 = 169;
                  v354 = 2114;
                  v355 = CFSTR("remoteTerminationRequest");
                  v356 = 2114;
                  v357 = v131;
                  _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ Got non-nil RTR but it wasn't hex-encoded : %{public}@", buf, 0x36u);
                }
              }

              v122 = v315;
            }

          }
          else
          {
            v165 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v166 = NFLogGetLogger(v165);
            if (v166)
            {
              v167 = (void (*)(uint64_t, const char *, ...))v166;
              v168 = object_getClass(self);
              v169 = class_isMetaClass(v168);
              v170 = object_getClassName(self);
              v171 = sel_getName(a2);
              v309 = objc_opt_class(v129);
              v172 = 45;
              if (v169)
                v172 = 43;
              v167(3, "%c[%{public}s %{public}s]:%i %{public}@ Expected String, got %{public}@", v172, v170, v171, 156, CFSTR("keyId"), v309);
            }
            v173 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v174 = NFSharedLogGetLogger(v173);
            v131 = objc_claimAutoreleasedReturnValue(v174);
            if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
            {
              v175 = object_getClass(self);
              if (class_isMetaClass(v175))
                v176 = 43;
              else
                v176 = 45;
              v177 = object_getClassName(self);
              v178 = sel_getName(a2);
              v179 = objc_opt_class(v129);
              *(_DWORD *)buf = 67110402;
              v347 = v176;
              v348 = 2082;
              v349 = v177;
              v350 = 2082;
              v351 = v178;
              v352 = 1024;
              v353 = 156;
              v354 = 2114;
              v355 = CFSTR("keyId");
              v356 = 2114;
              v357 = v179;
              _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ Expected String, got %{public}@", buf, 0x36u);
            }
          }

        }
        else
        {
          v150 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v151 = NFLogGetLogger(v150);
          if (v151)
          {
            v152 = (void (*)(uint64_t, const char *, ...))v151;
            v153 = object_getClass(self);
            v154 = class_isMetaClass(v153);
            v155 = object_getClassName(self);
            v156 = sel_getName(a2);
            v308 = objc_opt_class(v127);
            v157 = 45;
            if (v154)
              v157 = 43;
            v152(3, "%c[%{public}s %{public}s]:%i %{public}@ Expected Dictionary, got %{public}@", v157, v155, v156, 150, CFSTR("PTTerminateKeyIdsPreExecution"), v308);
          }
          v158 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v159 = NFSharedLogGetLogger(v158);
          v129 = objc_claimAutoreleasedReturnValue(v159);
          if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
          {
            v160 = object_getClass(self);
            if (class_isMetaClass(v160))
              v161 = 43;
            else
              v161 = 45;
            v162 = object_getClassName(self);
            v163 = sel_getName(a2);
            v164 = objc_opt_class(v127);
            *(_DWORD *)buf = 67110402;
            v347 = v161;
            v348 = 2082;
            v349 = v162;
            v350 = 2082;
            v351 = v163;
            v352 = 1024;
            v353 = 150;
            v354 = 2114;
            v355 = CFSTR("PTTerminateKeyIdsPreExecution");
            v356 = 2114;
            v357 = v164;
            _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ Expected Dictionary, got %{public}@", buf, 0x36u);
          }
        }

      }
      v124 = -[__CFString countByEnumeratingWithState:objects:count:](v122, "countByEnumeratingWithState:objects:count:", &v330, v344, 16);
    }
    while (v124);
  }

  v214 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v313, "NF_arrayForKey:", CFSTR("FiDOKeyRevokeList")));
  if (-[__CFString count](v214, "count") && byte_10005C3E8)
  {
    v215 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v216 = NFLogGetLogger(v215);
    if (v216)
    {
      v217 = (void (*)(uint64_t, const char *, ...))v216;
      v218 = object_getClass(self);
      v219 = class_isMetaClass(v218);
      v293 = object_getClassName(self);
      v303 = sel_getName(a2);
      v220 = 45;
      if (v219)
        v220 = 43;
      v217(6, "%c[%{public}s %{public}s]:%i [TSM] Revoking FiDO Keys %@", v220, v293, v303, 188, v214);
    }
    v221 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v222 = NFSharedLogGetLogger(v221);
    v223 = objc_claimAutoreleasedReturnValue(v222);
    if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
    {
      v224 = object_getClass(self);
      if (class_isMetaClass(v224))
        v225 = 43;
      else
        v225 = 45;
      v226 = object_getClassName(self);
      v227 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v347 = v225;
      v348 = 2082;
      v349 = v226;
      v350 = 2082;
      v351 = v227;
      v352 = 1024;
      v353 = 188;
      v354 = 2112;
      v355 = v214;
      _os_log_impl((void *)&_mh_execute_header, v223, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Revoking FiDO Keys %@", buf, 0x2Cu);
    }

  }
  v327 = 0u;
  v328 = 0u;
  v325 = 0u;
  v326 = 0u;
  v228 = v214;
  v321 = -[__CFString countByEnumeratingWithState:objects:count:](v228, "countByEnumeratingWithState:objects:count:", &v325, v343, 16);
  if (v321)
  {
    v229 = *(_QWORD *)v326;
    v316 = v228;
    v318 = *(_QWORD *)v326;
    do
    {
      for (m = 0; m != v321; m = (char *)m + 1)
      {
        if (*(_QWORD *)v326 != v229)
          objc_enumerationMutation(v228);
        v231 = *(__CFString **)(*((_QWORD *)&v325 + 1) + 8 * (_QWORD)m);
        v232 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v231, v232) & 1) != 0)
        {
          v233 = objc_claimAutoreleasedReturnValue(-[__CFString NF_stringForKey:](v231, "NF_stringForKey:", CFSTR("relyingParty")));
          v234 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString NF_stringForKey:](v231, "NF_stringForKey:", CFSTR("rpAccountHash")));
          v235 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString NF_stringForKey:](v231, "NF_stringForKey:", CFSTR("keyHash")));
          v236 = objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v235));
          v237 = (void *)v236;
          if (v233)
            v238 = v234 == 0;
          else
            v238 = 1;
          if (v238 || v236 == 0)
          {
            v240 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v241 = NFLogGetLogger(v240);
            if (v241)
            {
              v242 = (void (*)(uint64_t, const char *, ...))v241;
              v243 = object_getClass(self);
              v244 = class_isMetaClass(v243);
              v294 = object_getClassName(self);
              v304 = sel_getName(a2);
              v245 = 45;
              if (v244)
                v245 = 43;
              v242(3, "%c[%{public}s %{public}s]:%i Invalid FiDO Key Revoke directive %{public}@", v245, v294, v304, 200, v231);
            }
            v246 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v247 = NFSharedLogGetLogger(v246);
            v267 = objc_claimAutoreleasedReturnValue(v247);
            if (os_log_type_enabled(v267, OS_LOG_TYPE_ERROR))
            {
              v248 = object_getClass(self);
              if (class_isMetaClass(v248))
                v249 = 43;
              else
                v249 = 45;
              v250 = object_getClassName(self);
              v251 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v347 = v249;
              v348 = 2082;
              v349 = v250;
              v350 = 2082;
              v351 = v251;
              v352 = 1024;
              v353 = 200;
              v354 = 2114;
              v355 = v231;
              _os_log_impl((void *)&_mh_execute_header, v267, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid FiDO Key Revoke directive %{public}@", buf, 0x2Cu);
            }
          }
          else
          {
            v317 = v235;
            v267 = objc_claimAutoreleasedReturnValue(+[SEFidoKeySearchParameters withRelyingParty:relyingPartyAccountHash:fidoKeyHash:](SEFidoKeySearchParameters, "withRelyingParty:relyingPartyAccountHash:fidoKeyHash:", v233, v234, v236));
            v268 = (void *)objc_claimAutoreleasedReturnValue(+[SEFidoKeyService shared](SEFidoKeyService, "shared"));
            v269 = self->_seSession;
            v270 = self->_targetSEID;
            v324 = 0;
            v271 = v270;
            v272 = objc_msgSend(v268, "deleteFidoKeyFor:usingSession:withSessionSEID:error:", v267, v269, v271, &v324);
            v273 = v324;

            if (v272)
              v274 = v273 == 0;
            else
              v274 = 0;
            if (!v274)
            {
              v275 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v276 = NFLogGetLogger(v275);
              if (v276)
              {
                v277 = (void (*)(uint64_t, const char *, ...))v276;
                v278 = object_getClass(self);
                v279 = class_isMetaClass(v278);
                v280 = object_getClassName(self);
                v305 = sel_getName(a2);
                v281 = 45;
                if (v279)
                  v281 = 43;
                v277(3, "%c[%{public}s %{public}s]:%i Failed to revoke FiDO Key %{public}@ : %{public}@", v281, v280, v305, 213, v231, v273);
              }
              v282 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v283 = NFSharedLogGetLogger(v282);
              v284 = objc_claimAutoreleasedReturnValue(v283);
              if (os_log_type_enabled(v284, OS_LOG_TYPE_ERROR))
              {
                v285 = object_getClass(self);
                if (class_isMetaClass(v285))
                  v286 = 43;
                else
                  v286 = 45;
                v287 = object_getClassName(self);
                v288 = sel_getName(a2);
                *(_DWORD *)buf = 67110402;
                v347 = v286;
                v348 = 2082;
                v349 = v287;
                v350 = 2082;
                v351 = v288;
                v352 = 1024;
                v353 = 213;
                v354 = 2114;
                v355 = v231;
                v356 = 2114;
                v357 = v273;
                _os_log_impl((void *)&_mh_execute_header, v284, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to revoke FiDO Key %{public}@ : %{public}@", buf, 0x36u);
              }

            }
            v228 = v316;
            v235 = v317;
          }

          v229 = v318;
        }
        else
        {
          v252 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v253 = NFLogGetLogger(v252);
          if (v253)
          {
            v254 = (void (*)(uint64_t, const char *, ...))v253;
            v255 = object_getClass(self);
            v256 = class_isMetaClass(v255);
            v257 = object_getClassName(self);
            v258 = sel_getName(a2);
            v311 = objc_opt_class(v231);
            v259 = 45;
            if (v256)
              v259 = 43;
            v254(3, "%c[%{public}s %{public}s]:%i Element in %{public}@ Expected Dictionary, got %{public}@", v259, v257, v258, 191, CFSTR("FiDOKeyRevokeList"), v311);
          }
          v260 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v261 = NFSharedLogGetLogger(v260);
          v233 = objc_claimAutoreleasedReturnValue(v261);
          if (os_log_type_enabled(v233, OS_LOG_TYPE_ERROR))
          {
            v262 = object_getClass(self);
            if (class_isMetaClass(v262))
              v263 = 43;
            else
              v263 = 45;
            v264 = object_getClassName(self);
            v265 = sel_getName(a2);
            v266 = objc_opt_class(v231);
            *(_DWORD *)buf = 67110402;
            v347 = v263;
            v348 = 2082;
            v349 = v264;
            v350 = 2082;
            v351 = v265;
            v352 = 1024;
            v353 = 191;
            v354 = 2114;
            v355 = CFSTR("FiDOKeyRevokeList");
            v356 = 2114;
            v357 = v266;
            _os_log_impl((void *)&_mh_execute_header, v233, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Element in %{public}@ Expected Dictionary, got %{public}@", buf, 0x36u);
          }
        }

      }
      v321 = -[__CFString countByEnumeratingWithState:objects:count:](v228, "countByEnumeratingWithState:objects:count:", &v325, v343, 16);
    }
    while (v321);
  }

}

- (void)_postProcessNotification:(id)a3 executionStatus:(BOOL)a4 regionIdentifier:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
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
  void (*v26)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *v41;
  _BOOL4 v42;
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
  NSMutableArray *v53;
  id v54;
  id v55;
  uint64_t v56;
  void *i;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void (*v62)(uint64_t, const char *, ...);
  objc_class *v63;
  _BOOL4 v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  objc_class *v70;
  int v71;
  const char *v72;
  const char *v73;
  void *v74;
  uint64_t v75;
  void (*v76)(uint64_t, const char *, ...);
  objc_class *v77;
  _BOOL4 v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  NSObject *v83;
  objc_class *v84;
  int v85;
  const char *v86;
  const char *v87;
  const char *v88;
  const char *v89;
  const char *Name;
  const char *v91;
  const char *v92;
  const char *v93;
  id v94;
  id v95;
  id obj;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint8_t v102[128];
  uint8_t buf[4];
  int v104;
  __int16 v105;
  const char *v106;
  __int16 v107;
  const char *v108;
  __int16 v109;
  int v110;
  __int16 v111;
  void *v112;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_stringForKey:", CFSTR("type")));
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("restrictedModeExited")) && v6)
    {
      -[NFSecureElementManagerSession didExitRestrictedMode:](self->_seSession, "didExitRestrictedMode:", self->_targetSEID);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_endMetric, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("restrictedModeExit"));
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("cleanupPerformed")))
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v26 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v30 = 45;
        if (isMetaClass)
          v30 = 43;
        v26(6, "%c[%{public}s %{public}s]:%i CleanupPerformed", v30, ClassName, Name, 246);
      }
      v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v32 = NFSharedLogGetLogger(v31);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = object_getClass(self);
        if (class_isMetaClass(v34))
          v35 = 43;
        else
          v35 = 45;
        *(_DWORD *)buf = 67109890;
        v104 = v35;
        v105 = 2082;
        v106 = object_getClassName(self);
        v107 = 2082;
        v108 = sel_getName(a2);
        v109 = 1024;
        v110 = 246;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i CleanupPerformed", buf, 0x22u);
      }

      v36 = SESEndPointAppletCleanup(self->_seSession, self->_targetSEID);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      if (v37)
      {
        v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v39 = NFLogGetLogger(v38);
        if (v39)
        {
          v40 = (void (*)(uint64_t, const char *, ...))v39;
          v41 = object_getClass(self);
          v42 = class_isMetaClass(v41);
          v88 = object_getClassName(self);
          v91 = sel_getName(a2);
          v43 = 45;
          if (v42)
            v43 = 43;
          v40(3, "%c[%{public}s %{public}s]:%i SESEndPointAppletCleanup failed: %@", v43, v88, v91, 249, v37);
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
          *(_DWORD *)buf = 67110146;
          v104 = v48;
          v105 = 2082;
          v106 = v49;
          v107 = 2082;
          v108 = v50;
          v109 = 1024;
          v110 = 249;
          v111 = 2112;
          v112 = v37;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i SESEndPointAppletCleanup failed: %@", buf, 0x2Cu);
        }

      }
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("appletChanged")))
    {
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_stringForKey:", CFSTR("aid")));
      if (-[NSObject length](v21, "length"))
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v21));
        if (v51)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_endMetric, "setObject:forKeyedSubscript:", v51, CFSTR("aid"));
        if (v6)
          -[NFRemoteAdminSession processAppletChanged:regionIdentifier:](self, "processAppletChanged:regionIdentifier:", v21, v9);

      }
      v94 = v9;
      v95 = v8;
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_arrayForKey:", CFSTR("aids")));
      v53 = objc_opt_new(NSMutableArray);
      v98 = 0u;
      v99 = 0u;
      v100 = 0u;
      v101 = 0u;
      obj = v52;
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v99;
        while (2)
        {
          for (i = 0; i != v55; i = (char *)i + 1)
          {
            if (*(_QWORD *)v99 != v56)
              objc_enumerationMutation(obj);
            v58 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)i);
            v59 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v58, v59) & 1) == 0)
            {
              v74 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v75 = NFLogGetLogger(v74);
              if (v75)
              {
                v76 = (void (*)(uint64_t, const char *, ...))v75;
                v77 = object_getClass(self);
                v78 = class_isMetaClass(v77);
                v79 = object_getClassName(self);
                v93 = sel_getName(a2);
                v80 = 45;
                if (v78)
                  v80 = 43;
                v76(3, "%c[%{public}s %{public}s]:%i target AID is not NSString!", v80, v79, v93, 272);
              }
              v81 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v82 = NFSharedLogGetLogger(v81);
              v83 = objc_claimAutoreleasedReturnValue(v82);
              v8 = v95;
              if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
              {
                v84 = object_getClass(self);
                if (class_isMetaClass(v84))
                  v85 = 43;
                else
                  v85 = 45;
                v86 = object_getClassName(self);
                v87 = sel_getName(a2);
                *(_DWORD *)buf = 67109890;
                v104 = v85;
                v105 = 2082;
                v106 = v86;
                v107 = 2082;
                v108 = v87;
                v109 = 1024;
                v110 = 272;
                _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i target AID is not NSString!", buf, 0x22u);
              }

              v9 = v94;
              goto LABEL_68;
            }
            -[NSMutableArray addObject:](v53, "addObject:", v58);
          }
          v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
          if (v55)
            continue;
          break;
        }
      }

      v9 = v94;
      if (-[NSMutableArray count](v53, "count") && v6)
        -[NFRemoteAdminSession processAppletsDeleted:regionIdentifier:](self, "processAppletsDeleted:regionIdentifier:", v53, v94);

      v8 = v95;
    }
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_numberForKey:", CFSTR("mfdAllPostExecution")));
    if (-[NSObject BOOLValue](v21, "BOOLValue"))
    {
      if (byte_10005C3E8)
      {
        v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v61 = NFLogGetLogger(v60);
        if (v61)
        {
          v62 = (void (*)(uint64_t, const char *, ...))v61;
          v63 = object_getClass(self);
          v64 = class_isMetaClass(v63);
          v65 = object_getClassName(self);
          v92 = sel_getName(a2);
          v66 = 45;
          if (v64)
            v66 = 43;
          v62(6, "%c[%{public}s %{public}s]:%i [TSM] Deleting all applets", v66, v65, v92, 286);
        }
        v67 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v68 = NFSharedLogGetLogger(v67);
        v69 = objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          v70 = object_getClass(self);
          if (class_isMetaClass(v70))
            v71 = 43;
          else
            v71 = 45;
          v72 = object_getClassName(self);
          v73 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v104 = v71;
          v105 = 2082;
          v106 = v72;
          v107 = 2082;
          v108 = v73;
          v109 = 1024;
          v110 = 286;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Deleting all applets", buf, 0x22u);
        }

      }
      -[NFSecureElementManagerSession deleteAllApplets:](self->_seSession, "deleteAllApplets:", 0);
    }
  }
  else
  {
    v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFLogGetLogger(v12);
    if (v13)
    {
      v14 = (void (*)(uint64_t, const char *, ...))v13;
      v15 = object_getClass(self);
      v16 = class_isMetaClass(v15);
      v17 = object_getClassName(self);
      v89 = sel_getName(a2);
      v18 = 45;
      if (v16)
        v18 = 43;
      v14(3, "%c[%{public}s %{public}s]:%i Missing notification type", v18, v17, v89, 235);
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
      v104 = v23;
      v105 = 2082;
      v106 = object_getClassName(self);
      v107 = 2082;
      v108 = sel_getName(a2);
      v109 = 1024;
      v110 = 235;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing notification type", buf, 0x22u);
    }
  }
LABEL_68:

}

- (void)processAppletChanged:(id)a3 regionIdentifier:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v15;
  const char *ClassName;
  const char *Name;
  const char *v18;
  void *v19;
  NFRemoteAdminState *serverState;
  NFRemoteAdminState *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  NFRemoteAdminState *v30;
  NFRemoteAdminState *v31;
  void *v32;
  NFRemoteAdminSessionDelegate *delegate;
  id v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;

  v7 = a3;
  v8 = a4;
  v9 = sub_100033D5C();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v13 = (void (*)(uint64_t, const char *, ...))Logger;
    v34 = v8;
    Class = object_getClass(self);
    if (class_isMetaClass(Class))
      v15 = 43;
    else
      v15 = 45;
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v18 = a2;
    v19 = v10;
    if (self)
      serverState = self->_serverState;
    else
      serverState = 0;
    v21 = serverState;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState serverIdentifier](v21, "serverIdentifier"));
    v13(6, "%c[%{public}s %{public}s]:%i updating aid %{public}@ with topic %{public}@", v15, ClassName, Name, 296, v7, v22);

    v10 = v19;
    v8 = v34;
    a2 = v18;
  }
  v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v24 = NFSharedLogGetLogger(v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = object_getClass(self);
    if (class_isMetaClass(v26))
      v27 = 43;
    else
      v27 = 45;
    v28 = object_getClassName(self);
    v29 = sel_getName(a2);
    if (self)
      v30 = self->_serverState;
    else
      v30 = 0;
    v31 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState serverIdentifier](v31, "serverIdentifier"));
    *(_DWORD *)buf = 67110402;
    v36 = v27;
    v37 = 2082;
    v38 = v28;
    v39 = 2082;
    v40 = v29;
    v41 = 1024;
    v42 = 296;
    v43 = 2114;
    v44 = v7;
    v45 = 2114;
    v46 = v32;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i updating aid %{public}@ with topic %{public}@", buf, 0x36u);

  }
  sub_100037678(v10, v8, v7);

  if (self)
    delegate = self->_delegate;
  else
    delegate = 0;
  -[NFRemoteAdminSessionDelegate handleAppletStateChange:](delegate, "handleAppletStateChange:", v7);

}

- (void)processAppletsDeleted:(id)a3 regionIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v16;
  const char *ClassName;
  const char *Name;
  NFRemoteAdminState *serverState;
  NFRemoteAdminState *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  NFRemoteAdminState *v29;
  NFRemoteAdminState *v30;
  void *v31;
  id v32;
  NFRemoteAdminSessionDelegate *delegate;
  id obj;
  uint64_t v35;
  void *v36;
  id v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];

  v6 = a3;
  v37 = a4;
  v7 = sub_100033D5C();
  v36 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
  if (v8)
  {
    v9 = v8;
    v35 = *(_QWORD *)v40;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v40 != v35)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v10);
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v14 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          if (class_isMetaClass(Class))
            v16 = 43;
          else
            v16 = 45;
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          if (self)
            serverState = self->_serverState;
          else
            serverState = 0;
          v20 = serverState;
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState serverIdentifier](v20, "serverIdentifier"));
          v14(6, "%c[%{public}s %{public}s]:%i updating aid %{public}@ with topic %{public}@", v16, ClassName, Name, 308, v11, v21);

        }
        v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v23 = NFSharedLogGetLogger(v22);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = object_getClass(self);
          if (class_isMetaClass(v25))
            v26 = 43;
          else
            v26 = 45;
          v27 = object_getClassName(self);
          v28 = sel_getName(a2);
          if (self)
            v29 = self->_serverState;
          else
            v29 = 0;
          v30 = v29;
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState serverIdentifier](v30, "serverIdentifier"));
          *(_DWORD *)buf = 67110402;
          v44 = v26;
          v45 = 2082;
          v46 = v27;
          v47 = 2082;
          v48 = v28;
          v49 = 1024;
          v50 = 308;
          v51 = 2114;
          v52 = v11;
          v53 = 2114;
          v54 = v31;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i updating aid %{public}@ with topic %{public}@", buf, 0x36u);

        }
        sub_100037678(v36, v37, v11);
        v10 = (char *)v10 + 1;
      }
      while (v9 != v10);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
      v9 = v32;
    }
    while (v32);
  }

  if (self)
    delegate = self->_delegate;
  else
    delegate = 0;
  -[NFRemoteAdminSessionDelegate handleAppletsDeleted:](delegate, "handleAppletsDeleted:", obj);

}

- (BOOL)performRequest
{
  id v3;
  id *v4;
  NFRemoteAdminState *serverState;
  NFRemoteAdminState *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  NFRemoteAdminConnection *connection;
  NFRemoteAdminState *v25;
  void *v26;
  id v27;
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
  BOOL v42;
  unint64_t v43;
  objc_class *v44;
  _BOOL4 v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  objc_class *v51;
  int v52;
  void *v54;
  uint64_t v55;
  void (*v56)(uint64_t, const char *, ...);
  objc_class *v57;
  _BOOL4 v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  objc_class *v64;
  int v65;
  const char *v66;
  const char *v67;
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
  id v82;
  id v83;
  uint64_t v84;
  void *i;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void (*v91)(uint64_t, const char *, ...);
  objc_class *v92;
  _BOOL4 v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  NSObject *v98;
  objc_class *v99;
  int v100;
  const char *v101;
  const char *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void (*v106)(uint64_t, const char *, ...);
  objc_class *v107;
  _BOOL4 v108;
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
  NFRemoteAdminSession *v119;
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
  NSMutableDictionary *v134;
  id v135;
  id *v136;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  id v142;
  void *v143;
  uint64_t v144;
  void (*v145)(uint64_t, const char *, ...);
  objc_class *v146;
  _BOOL4 v147;
  const char *v148;
  void *v149;
  const char *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  NSObject *v156;
  objc_class *v157;
  int v158;
  const char *v159;
  const char *v160;
  __CFString *v161;
  void *v162;
  void *v163;
  void *v164;
  unsigned int v165;
  char v166;
  void *v167;
  NSString **p_targetSEID;
  void *v169;
  uint64_t v170;
  void (*v171)(uint64_t, const char *, ...);
  objc_class *v172;
  _BOOL4 v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;
  NSObject *v177;
  objc_class *v178;
  int v179;
  const char *v180;
  const char *v181;
  void *v182;
  uint64_t v183;
  void (*v184)(uint64_t, const char *, ...);
  objc_class *v185;
  _BOOL4 v186;
  const char *v187;
  const char *v188;
  int v189;
  uint64_t v190;
  void *v191;
  uint64_t v192;
  NSObject *v193;
  objc_class *v194;
  int v195;
  const char *v196;
  const char *v197;
  int v198;
  char *v199;
  void *v200;
  uint64_t v201;
  void (*v202)(uint64_t, const char *, ...);
  objc_class *v203;
  _BOOL4 v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  uint64_t v208;
  NSObject *v209;
  objc_class *v210;
  int v211;
  const char *v212;
  const char *v213;
  void *v214;
  uint64_t v215;
  void (*v216)(uint64_t, const char *, ...);
  objc_class *v217;
  _BOOL4 v218;
  const char *v219;
  uint64_t v220;
  void *v221;
  uint64_t v222;
  NSObject *v223;
  objc_class *v224;
  int v225;
  const char *v226;
  const char *v227;
  void *v228;
  uint64_t v229;
  void (*v230)(uint64_t, const char *, ...);
  objc_class *v231;
  _BOOL4 v232;
  const char *v233;
  uint64_t v234;
  void *v235;
  uint64_t v236;
  NSObject *v237;
  objc_class *v238;
  int v239;
  const char *v240;
  const char *v241;
  void *v242;
  uint64_t v243;
  void (*v244)(uint64_t, const char *, ...);
  objc_class *v245;
  _BOOL4 v246;
  const char *v247;
  uint64_t v248;
  void *v249;
  uint64_t v250;
  NSObject *v251;
  objc_class *v252;
  int v253;
  const char *v254;
  const char *v255;
  id v256;
  uint64_t v257;
  NFRemoteAdminRedirectState *v258;
  void *v259;
  uint64_t v260;
  void (*v261)(uint64_t, const char *, ...);
  objc_class *v262;
  _BOOL4 v263;
  const char *v264;
  uint64_t v265;
  void *v266;
  uint64_t v267;
  NSObject *v268;
  objc_class *v269;
  int v270;
  const char *v271;
  const char *v272;
  void *v273;
  void *v274;
  id v275;
  NSMutableDictionary *v276;
  void *v277;
  uint64_t v278;
  void *v279;
  void *v280;
  NSMutableDictionary *v281;
  void *v282;
  NSArray *v283;
  void *v284;
  NFSecureElementManagerSession *seSession;
  id v286;
  id v287;
  void *v288;
  void *v289;
  uint64_t v290;
  void (*v291)(uint64_t, const char *, ...);
  objc_class *v292;
  _BOOL4 v293;
  const char *v294;
  uint64_t v295;
  void *v296;
  uint64_t v297;
  NSObject *v298;
  objc_class *v299;
  int v300;
  const char *v301;
  const char *v302;
  BOOL v303;
  uint64_t v304;
  void *v305;
  void *v306;
  NFRemoteAdminRedirectState *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  uint64_t v312;
  void (*v313)(uint64_t, const char *, ...);
  objc_class *v314;
  _BOOL4 v315;
  const char *v316;
  uint64_t v317;
  void *v318;
  uint64_t v319;
  NSObject *v320;
  objc_class *v321;
  int v322;
  const char *v323;
  const char *v324;
  NSMutableDictionary *v325;
  id v326;
  id *v327;
  const char *v328;
  const char *v329;
  const char *v330;
  const char *v331;
  const char *Name;
  const char *v333;
  const char *v334;
  const char *v335;
  const char *v336;
  const char *v337;
  const char *v338;
  const char *v339;
  const char *v340;
  const char *v341;
  const char *v342;
  const char *v343;
  const char *v344;
  const char *v345;
  const char *v346;
  const char *v347;
  const char *v348;
  char *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  id *v355;
  unsigned int v356;
  unsigned int v357;
  void *v358;
  void *v359;
  void *v360;
  NSMutableDictionary *v361;
  NSMutableDictionary *v362;
  id *v363;
  void *v364;
  void *v365;
  id obj;
  NFRemoteAdminSession *v367;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  id v373;
  uint8_t v374[128];
  uint8_t buf[4];
  int v376;
  __int16 v377;
  const char *v378;
  __int16 v379;
  const char *v380;
  __int16 v381;
  int v382;
  __int16 v383;
  const __CFString *v384;
  __int16 v385;
  _BYTE v386[14];

  v3 = sub_100033D5C();
  v4 = (id *)objc_claimAutoreleasedReturnValue(v3);
  if (self)
    serverState = self->_serverState;
  else
    serverState = 0;
  v6 = serverState;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState serverIdentifier](v6, "serverIdentifier"));
  v8 = sub_100038918(v4, v7, self->_seSession);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  v12 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v9)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v16 = 45;
      if (isMetaClass)
        v16 = 43;
      v12(6, "%c[%{public}s %{public}s]:%i Performing request", v16, ClassName, Name, 325);
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
      *(_DWORD *)buf = 67109890;
      v376 = v21;
      v377 = 2082;
      v378 = object_getClassName(self);
      v379 = 2082;
      v380 = sel_getName(a2);
      v381 = 1024;
      v382 = 325;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Performing request", buf, 0x22u);
    }

    v22 = objc_opt_new(NSMutableDictionary);
    v23 = objc_opt_new(NSMutableDictionary);
    connection = self->_connection;
    v25 = self->_serverState;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState httpHeaderInfo](v25, "httpHeaderInfo"));
    v362 = v23;
    v27 = -[NFRemoteAdminConnection performRequest:body:header:response:responseHeader:httpStatus:duration:sessionError:](connection, "performRequest:body:header:response:responseHeader:httpStatus:duration:sessionError:", CFSTR("get_pending_commands"), v9, v26, v22, v23, 0, 0, 0);

    if ((v27 | 8) == 0x19
      || (-[NFRemoteAdminState setHttpHeaderInfo:](self->_serverState, "setHttpHeaderInfo:", v362), (_DWORD)v27 == 18))
    {
      +[NFExceptionsCALogger postAnalyticsTSMConnectivityException:](NFExceptionsCALogger, "postAnalyticsTSMConnectivityException:", v27);
    }
    if (self->_abort)
    {
      v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v29 = NFLogGetLogger(v28);
      if (v29)
      {
        v30 = (void (*)(uint64_t, const char *, ...))v29;
        v31 = object_getClass(self);
        v32 = class_isMetaClass(v31);
        v33 = object_getClassName(self);
        v333 = sel_getName(a2);
        v34 = 45;
        if (v32)
          v34 = 43;
        v30(6, "%c[%{public}s %{public}s]:%i Aborted...", v34, v33, v333, 348);
      }
      v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v36 = NFSharedLogGetLogger(v35);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = object_getClass(self);
        if (class_isMetaClass(v38))
          v39 = 43;
        else
          v39 = 45;
        v40 = object_getClassName(self);
        v41 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v376 = v39;
        v377 = 2082;
        v378 = v40;
        v379 = 2082;
        v380 = v41;
        v381 = 1024;
        v382 = 348;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Aborted...", buf, 0x22u);
      }

      v42 = 0;
      v43 = 1;
    }
    else
    {
      if (!(_DWORD)v27)
      {
        v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v69 = NFLogGetLogger(v68);
        if (v69)
        {
          v70 = (void (*)(uint64_t, const char *, ...))v69;
          v71 = object_getClass(self);
          v72 = class_isMetaClass(v71);
          v73 = object_getClassName(self);
          v336 = sel_getName(a2);
          v74 = 45;
          if (v72)
            v74 = 43;
          v70(6, "%c[%{public}s %{public}s]:%i Request sent success", v74, v73, v336, 384);
        }
        v361 = v22;
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
          v376 = v79;
          v377 = 2082;
          v378 = v80;
          v379 = 2082;
          v380 = v81;
          v381 = 1024;
          v382 = 384;
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Request sent success", buf, 0x22u);
        }

        v367 = self;
        -[NFRemoteAdminState setUnsentScriptResponse:](self->_serverState, "setUnsentScriptResponse:", 0);
        v360 = v9;
        v363 = v4;
        obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SEStateInformation")));
        if (obj)
        {
          v371 = 0u;
          v372 = 0u;
          v369 = 0u;
          v370 = 0u;
          v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v369, v374, 16);
          if (v82)
          {
            v83 = v82;
            v84 = *(_QWORD *)v370;
            do
            {
              for (i = 0; i != v83; i = (char *)i + 1)
              {
                if (*(_QWORD *)v370 != v84)
                  objc_enumerationMutation(obj);
                v86 = *(void **)(*((_QWORD *)&v369 + 1) + 8 * (_QWORD)i);
                v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("secureElementType")));
                v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("osUpdateInfo")));

                if (v88 && objc_msgSend(v87, "isEqualToString:", CFSTR("JCOP")))
                {
                  if (byte_10005C3E8)
                  {
                    v89 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v90 = NFLogGetLogger(v89);
                    if (v90)
                    {
                      v91 = (void (*)(uint64_t, const char *, ...))v90;
                      v92 = object_getClass(v367);
                      v93 = class_isMetaClass(v92);
                      v94 = object_getClassName(v367);
                      v337 = sel_getName(a2);
                      v95 = 45;
                      if (v93)
                        v95 = 43;
                      v328 = v94;
                      v4 = v363;
                      v91(6, "%c[%{public}s %{public}s]:%i [TSM] Clearing JCOP update info", v95, v328, v337, 395);
                    }
                    v96 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v97 = NFSharedLogGetLogger(v96);
                    v98 = objc_claimAutoreleasedReturnValue(v97);
                    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                    {
                      v99 = object_getClass(v367);
                      if (class_isMetaClass(v99))
                        v100 = 43;
                      else
                        v100 = 45;
                      v101 = object_getClassName(v367);
                      v102 = sel_getName(a2);
                      *(_DWORD *)buf = 67109890;
                      v376 = v100;
                      v4 = v363;
                      v377 = 2082;
                      v378 = v101;
                      v379 = 2082;
                      v380 = v102;
                      v381 = 1024;
                      v382 = 395;
                      _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Clearing JCOP update info", buf, 0x22u);
                    }

                  }
                  sub_100037A58(v4, 0);
                }
                v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("jsblCounterChanged")));

                if (v103)
                {
                  if (byte_10005C3E8)
                  {
                    v104 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v105 = NFLogGetLogger(v104);
                    if (v105)
                    {
                      v106 = (void (*)(uint64_t, const char *, ...))v105;
                      v107 = object_getClass(v367);
                      v108 = class_isMetaClass(v107);
                      v109 = object_getClassName(v367);
                      v338 = sel_getName(a2);
                      v110 = 45;
                      if (v108)
                        v110 = 43;
                      v106(6, "%c[%{public}s %{public}s]:%i [TSM] Clearing JCOP update info", v110, v109, v338, 401);
                    }
                    v111 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v112 = NFSharedLogGetLogger(v111);
                    v113 = objc_claimAutoreleasedReturnValue(v112);
                    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
                    {
                      v114 = object_getClass(v367);
                      if (class_isMetaClass(v114))
                        v115 = 43;
                      else
                        v115 = 45;
                      v116 = object_getClassName(v367);
                      v117 = sel_getName(a2);
                      *(_DWORD *)buf = 67109890;
                      v376 = v115;
                      v377 = 2082;
                      v378 = v116;
                      v379 = 2082;
                      v380 = v117;
                      v381 = 1024;
                      v382 = 401;
                      _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Clearing JCOP update info", buf, 0x22u);
                    }

                  }
                  sub_100037A58(v4, 0);
                }

              }
              v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v369, v374, 16);
            }
            while (v83);
          }
        }
        v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("jsblCounterChanged")));

        v119 = v367;
        v22 = v361;
        if (v118)
        {
          if (byte_10005C3E8)
          {
            v120 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v121 = NFLogGetLogger(v120);
            if (v121)
            {
              v122 = (void (*)(uint64_t, const char *, ...))v121;
              v123 = object_getClass(v367);
              v124 = class_isMetaClass(v123);
              v125 = object_getClassName(v367);
              v339 = sel_getName(a2);
              v126 = 45;
              if (v124)
                v126 = 43;
              v122(6, "%c[%{public}s %{public}s]:%i [TSM] Clearing JCOP update info", v126, v125, v339, 408);
            }
            v127 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v128 = NFSharedLogGetLogger(v127);
            v129 = objc_claimAutoreleasedReturnValue(v128);
            if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
            {
              v130 = object_getClass(v367);
              if (class_isMetaClass(v130))
                v131 = 43;
              else
                v131 = 45;
              v132 = object_getClassName(v367);
              v133 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              v376 = v131;
              v377 = 2082;
              v378 = v132;
              v379 = 2082;
              v380 = v133;
              v381 = 1024;
              v382 = 408;
              _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Clearing JCOP update info", buf, 0x22u);
            }

          }
          sub_100037A58(v4, 0);
        }
        sub_100037D1C(v4, 0);
        sub_1000384A8(v4);
        if (v367)
        {
          -[NFRemoteAdminState save](v367->_serverState, "save");
          v134 = v361;
          v135 = v9;
          v136 = v4;
          if (-[NSMutableDictionary count](v134, "count"))
          {
            v355 = v136;
            v137 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_dictionaryForKey:](v134, "NF_dictionaryForKey:", CFSTR("kNotification")));
            v138 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v134, "objectForKeyedSubscript:", CFSTR("kStartNewSession")));
            v357 = objc_msgSend(v138, "BOOLValue");

            v359 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_stringForKey:](v134, "NF_stringForKey:", CFSTR("kTaskId")));
            v364 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_stringForKey:](v134, "NF_stringForKey:", CFSTR("targetSEID")));
            v139 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v134, "objectForKeyedSubscript:", CFSTR("kVersion")));
            v140 = objc_msgSend(v139, "integerValue");

            v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "objectForKeyedSubscript:", CFSTR("kVersion")));
            v142 = objc_msgSend(v141, "integerValue");

            if (v140 != v142)
            {
              v143 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v144 = NFLogGetLogger(v143);
              if (v144)
              {
                v145 = (void (*)(uint64_t, const char *, ...))v144;
                v146 = object_getClass(v367);
                v147 = class_isMetaClass(v146);
                v148 = object_getClassName(v367);
                v149 = v137;
                v150 = sel_getName("_processServerResponse:originalRequest:storage:");
                v151 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v142));
                v152 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v140));
                v340 = v150;
                v137 = v149;
                v153 = 45;
                if (v147)
                  v153 = 43;
                v145(4, "%c[%{public}s %{public}s]:%i Protocol version mismatch, expected=%{public}@, rcv=%{public}@", v153, v148, v340, 498, v151, v152);

                v9 = v360;
                v4 = v363;
              }
              v154 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v155 = NFSharedLogGetLogger(v154);
              v156 = objc_claimAutoreleasedReturnValue(v155);
              if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
              {
                v157 = object_getClass(v367);
                v353 = v137;
                if (class_isMetaClass(v157))
                  v158 = 43;
                else
                  v158 = 45;
                v159 = object_getClassName(v367);
                v160 = sel_getName("_processServerResponse:originalRequest:storage:");
                v161 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v142));
                v162 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v140));
                *(_DWORD *)buf = 67110402;
                v376 = v158;
                v137 = v353;
                v377 = 2082;
                v378 = v159;
                v379 = 2082;
                v380 = v160;
                v381 = 1024;
                v382 = 498;
                v383 = 2114;
                v384 = v161;
                v385 = 2114;
                *(_QWORD *)v386 = v162;
                _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Protocol version mismatch, expected=%{public}@, rcv=%{public}@", buf, 0x36u);

              }
              v119 = v367;
              v22 = v361;
            }
            v163 = v364;
            v164 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v364));

            if (!v164)
            {

              v163 = 0;
            }
            v165 = v357;
            if (v163)
              v166 = 1;
            else
              v166 = v357;
            if ((v166 & 1) != 0)
            {
              v167 = v163;
              p_targetSEID = &v119->_targetSEID;
              v365 = v167;
              objc_storeStrong((id *)&v119->_targetSEID, v167);
              if (v137 && v359)
              {
                -[NFRemoteAdminSession _preprocessNotification:withTaskID:](v119, "_preprocessNotification:withTaskID:", v137, v359);
              }
              else
              {
                v228 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v229 = NFLogGetLogger(v228);
                if (v229)
                {
                  v230 = (void (*)(uint64_t, const char *, ...))v229;
                  v231 = object_getClass(v119);
                  v232 = class_isMetaClass(v231);
                  v233 = object_getClassName(v119);
                  v344 = sel_getName("_processServerResponse:originalRequest:storage:");
                  v234 = 45;
                  if (v232)
                    v234 = 43;
                  v230(4, "%c[%{public}s %{public}s]:%i Invalid notification and task id", v234, v233, v344, 519);
                }
                v235 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v236 = NFSharedLogGetLogger(v235);
                v237 = objc_claimAutoreleasedReturnValue(v236);
                if (os_log_type_enabled(v237, OS_LOG_TYPE_ERROR))
                {
                  v238 = object_getClass(v119);
                  if (class_isMetaClass(v238))
                    v239 = 43;
                  else
                    v239 = 45;
                  v240 = object_getClassName(v119);
                  v241 = sel_getName("_processServerResponse:originalRequest:storage:");
                  *(_DWORD *)buf = 67109890;
                  v376 = v239;
                  v377 = 2082;
                  v378 = v240;
                  v379 = 2082;
                  v380 = v241;
                  v381 = 1024;
                  v382 = 519;
                  _os_log_impl((void *)&_mh_execute_header, v237, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid notification and task id", buf, 0x22u);
                }

                v165 = v357;
              }
              if (v165)
              {
                v242 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v243 = NFLogGetLogger(v242);
                if (v243)
                {
                  v244 = (void (*)(uint64_t, const char *, ...))v243;
                  v245 = object_getClass(v119);
                  v246 = class_isMetaClass(v245);
                  v247 = object_getClassName(v119);
                  v345 = sel_getName("_processServerResponse:originalRequest:storage:");
                  v248 = 45;
                  if (v246)
                    v248 = 43;
                  v244(6, "%c[%{public}s %{public}s]:%i New session requested", v248, v247, v345, 524);
                }
                v249 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v250 = NFSharedLogGetLogger(v249);
                v251 = objc_claimAutoreleasedReturnValue(v250);
                v163 = v365;
                if (os_log_type_enabled(v251, OS_LOG_TYPE_DEFAULT))
                {
                  v252 = object_getClass(v119);
                  if (class_isMetaClass(v252))
                    v253 = 43;
                  else
                    v253 = 45;
                  v254 = object_getClassName(v119);
                  v255 = sel_getName("_processServerResponse:originalRequest:storage:");
                  *(_DWORD *)buf = 67109890;
                  v376 = v253;
                  v377 = 2082;
                  v378 = v254;
                  v379 = 2082;
                  v380 = v255;
                  v381 = 1024;
                  v382 = 524;
                  _os_log_impl((void *)&_mh_execute_header, v251, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i New session requested", buf, 0x22u);
                }

                v42 = 1;
              }
              else
              {
                v354 = v137;
                v358 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_dictionaryForKey:](v134, "NF_dictionaryForKey:", CFSTR("redirectRequest")));
                if (objc_msgSend(v358, "count"))
                {
                  v256 = sub_1000396C0(v355, v359);
                  v257 = objc_claimAutoreleasedReturnValue(v256);
                  v163 = v365;
                  if (v257)
                  {
                    v258 = (NFRemoteAdminRedirectState *)v257;
                    v259 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v260 = NFLogGetLogger(v259);
                    if (v260)
                    {
                      v261 = (void (*)(uint64_t, const char *, ...))v260;
                      v262 = object_getClass(v119);
                      v263 = class_isMetaClass(v262);
                      v264 = object_getClassName(v119);
                      v346 = sel_getName("_processServerResponse:originalRequest:storage:");
                      v265 = 45;
                      if (v263)
                        v265 = 43;
                      v330 = v264;
                      v163 = v365;
                      v261(6, "%c[%{public}s %{public}s]:%i Redirect request is aready in queue", v265, v330, v346, 538);
                    }
                    v266 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v267 = NFSharedLogGetLogger(v266);
                    v268 = objc_claimAutoreleasedReturnValue(v267);
                    if (os_log_type_enabled(v268, OS_LOG_TYPE_DEFAULT))
                    {
                      v269 = object_getClass(v119);
                      if (class_isMetaClass(v269))
                        v270 = 43;
                      else
                        v270 = 45;
                      v271 = object_getClassName(v119);
                      v272 = sel_getName("_processServerResponse:originalRequest:storage:");
                      *(_DWORD *)buf = 67109890;
                      v376 = v270;
                      v163 = v365;
                      v377 = 2082;
                      v378 = v271;
                      v379 = 2082;
                      v380 = v272;
                      v381 = 1024;
                      v382 = 538;
                      _os_log_impl((void *)&_mh_execute_header, v268, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Redirect request is aready in queue", buf, 0x22u);
                    }

                    -[NFRemoteAdminState setPendingImmediateRetry:](v258, "setPendingImmediateRetry:", 1);
                    -[NFRemoteAdminRedirectState save](v258, "save");
                  }
                  else
                  {
                    v307 = [NFRemoteAdminRedirectState alloc];
                    v308 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminConnection urlString](v119->_connection, "urlString"));
                    v309 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState serverIdentifier](v119->_serverState, "serverIdentifier"));
                    v258 = -[NFRemoteAdminRedirectState initWithDictionary:sourceURL:originator:](v307, "initWithDictionary:sourceURL:originator:", v134, v308, v309);

                    v310 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState httpHeaderInfo](v119->_serverState, "httpHeaderInfo"));
                    -[NFRemoteAdminState setHttpHeaderInfo:](v258, "setHttpHeaderInfo:", v310);

                    sub_1000395D8(v355, v258);
                  }
                  v119->_returnCode = 11;

                  v42 = 0;
                }
                else
                {
                  v273 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", 0));
                  v274 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v273, "serialNumber"));
                  v275 = objc_msgSend(v274, "caseInsensitiveCompare:", *p_targetSEID);

                  if (!v275)
                    -[NFRemoteAdminSession _deactiveAllAppletsOnSE:](v119, "_deactiveAllAppletsOnSE:", v119->_targetSEID);
                  v276 = v134;
                  v277 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_dictionaryForKey:](v276, "NF_dictionaryForKey:", CFSTR("kNotification")));
                  v278 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_stringForKey:](v276, "NF_stringForKey:", CFSTR("kBatchId")));
                  v279 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary NF_stringForKey:](v276, "NF_stringForKey:", CFSTR("kTaskId")));
                  v280 = (void *)objc_opt_new(NFRunScriptParameters);
                  objc_msgSend(v280, "setSeid:", *p_targetSEID);
                  objc_msgSend(v280, "setIncludeAPDUDuration:", 1);
                  v281 = objc_opt_new(NSMutableDictionary);
                  v282 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 2));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v281, "setObject:forKeyedSubscript:", v282, CFSTR("kVersion"));

                  if (v278)
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v281, "setObject:forKeyedSubscript:", v278, CFSTR("kBatchId"));
                  if (v279)
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v281, "setObject:forKeyedSubscript:", v279, CFSTR("kTaskId"));
                  v351 = (void *)v278;
                  if (*p_targetSEID)
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v281, "setObject:forKeyedSubscript:", *p_targetSEID, CFSTR("targetSEID"));
                  v283 = objc_opt_new(NSArray);
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v281, "setObject:forKeyedSubscript:", v283, CFSTR("kCommandsResponse"));

                  -[NSMutableDictionary setObject:forKeyedSubscript:](v281, "setObject:forKeyedSubscript:", CFSTR("UnexpectedInterruption"), CFSTR("clientIncompleteReason"));
                  v284 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v281, "setObject:forKeyedSubscript:", v284, CFSTR("incompletedExecution"));

                  -[NFRemoteAdminState setUnsentScriptResponse:](v367->_serverState, "setUnsentScriptResponse:", v281);
                  v352 = v277;
                  v350 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v277, "NF_stringForKey:", CFSTR("type")));
                  objc_msgSend(v280, "setToSystemOS:", objc_msgSend(v350, "isEqualToString:", CFSTR("restrictedModeExited")));
                  seSession = v367->_seSession;
                  v373 = 0;
                  v356 = -[NFSecureElementManagerSession runScript:parameters:outputResults:](seSession, "runScript:parameters:outputResults:", v276, v280, &v373);
                  v286 = v373;
                  -[NFRemoteAdminState setUnsentScriptResponse:](v367->_serverState, "setUnsentScriptResponse:", v286);
                  -[NFRemoteAdminState save](v367->_serverState, "save");
                  v287 = objc_msgSend(v280, "outFinalSWStatus");
                  v288 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v287));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v367->_endMetric, "setObject:forKeyedSubscript:", v288, CFSTR("status"));

                  if (byte_10005C3E8)
                  {
                    v289 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v290 = NFLogGetLogger(v289);
                    if (v290)
                    {
                      v291 = (void (*)(uint64_t, const char *, ...))v290;
                      v292 = object_getClass(v367);
                      v293 = class_isMetaClass(v292);
                      v294 = object_getClassName(v367);
                      v347 = sel_getName("_executeScript:");
                      v295 = 45;
                      if (v293)
                        v295 = 43;
                      v331 = v294;
                      v9 = v360;
                      v291(6, "%c[%{public}s %{public}s]:%i [TSM] Execution result=%ld, lastAPDUStatus=0x%lx", v295, v331, v347, 473, v356, v287);
                    }
                    v296 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v297 = NFSharedLogGetLogger(v296);
                    v298 = objc_claimAutoreleasedReturnValue(v297);
                    if (os_log_type_enabled(v298, OS_LOG_TYPE_DEFAULT))
                    {
                      v299 = object_getClass(v367);
                      if (class_isMetaClass(v299))
                        v300 = 43;
                      else
                        v300 = 45;
                      v301 = object_getClassName(v367);
                      v302 = sel_getName("_executeScript:");
                      *(_DWORD *)buf = 67110402;
                      v376 = v300;
                      v9 = v360;
                      v377 = 2082;
                      v378 = v301;
                      v379 = 2082;
                      v380 = v302;
                      v381 = 1024;
                      v382 = 473;
                      v383 = 2048;
                      v384 = (const __CFString *)v356;
                      v385 = 2048;
                      *(_QWORD *)v386 = v287;
                      _os_log_impl((void *)&_mh_execute_header, v298, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Execution result=%ld, lastAPDUStatus=0x%lx", buf, 0x36u);
                    }

                  }
                  v137 = v354;
                  if (v354)
                  {
                    if (v356)
                      v303 = 0;
                    else
                      v303 = v287 == (id)36864;
                    v304 = v303;
                    v305 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState serverIdentifier](v367->_serverState, "serverIdentifier"));
                    -[NFRemoteAdminSession _postProcessNotification:executionStatus:regionIdentifier:](v367, "_postProcessNotification:executionStatus:regionIdentifier:", v354, v304, v305);

                  }
                  v306 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState unsentScriptResponse](v367->_serverState, "unsentScriptResponse"));

                  v4 = v363;
                  v22 = v361;
                  if (v306)
                  {
                    -[NFSecureElementManagerSession refreshSecureElement:](v367->_seSession, "refreshSecureElement:", v367->_targetSEID);
                    v42 = 1;
                  }
                  else
                  {
                    v311 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v312 = NFLogGetLogger(v311);
                    if (v312)
                    {
                      v313 = (void (*)(uint64_t, const char *, ...))v312;
                      v314 = object_getClass(v367);
                      v315 = class_isMetaClass(v314);
                      v316 = object_getClassName(v367);
                      v348 = sel_getName("_processServerResponse:originalRequest:storage:");
                      v317 = 45;
                      if (v315)
                        v317 = 43;
                      v313(3, "%c[%{public}s %{public}s]:%i C-APDU execution failure", v317, v316, v348, 568);
                    }
                    v318 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v319 = NFSharedLogGetLogger(v318);
                    v320 = objc_claimAutoreleasedReturnValue(v319);
                    if (os_log_type_enabled(v320, OS_LOG_TYPE_ERROR))
                    {
                      v321 = object_getClass(v367);
                      if (class_isMetaClass(v321))
                        v322 = 43;
                      else
                        v322 = 45;
                      v323 = object_getClassName(v367);
                      v324 = sel_getName("_processServerResponse:originalRequest:storage:");
                      *(_DWORD *)buf = 67109890;
                      v376 = v322;
                      v377 = 2082;
                      v378 = v323;
                      v379 = 2082;
                      v380 = v324;
                      v381 = 1024;
                      v382 = 568;
                      _os_log_impl((void *)&_mh_execute_header, v320, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i C-APDU execution failure", buf, 0x22u);
                    }

                    v42 = 0;
                    v367->_returnCode = 4;
                  }
                  v163 = v365;
                }

              }
            }
            else
            {
              v214 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v215 = NFLogGetLogger(v214);
              if (v215)
              {
                v216 = (void (*)(uint64_t, const char *, ...))v215;
                v217 = object_getClass(v119);
                v218 = class_isMetaClass(v217);
                v219 = object_getClassName(v119);
                v343 = sel_getName("_processServerResponse:originalRequest:storage:");
                v220 = 45;
                if (v218)
                  v220 = 43;
                v216(3, "%c[%{public}s %{public}s]:%i Missing target SEID.  Halt TSM script execution", v220, v219, v343, 507);
              }
              v221 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v222 = NFSharedLogGetLogger(v221);
              v223 = objc_claimAutoreleasedReturnValue(v222);
              if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
              {
                v224 = object_getClass(v119);
                if (class_isMetaClass(v224))
                  v225 = 43;
                else
                  v225 = 45;
                v226 = object_getClassName(v119);
                v227 = sel_getName("_processServerResponse:originalRequest:storage:");
                *(_DWORD *)buf = 67109890;
                v376 = v225;
                v377 = 2082;
                v378 = v226;
                v379 = 2082;
                v380 = v227;
                v381 = 1024;
                v382 = 507;
                _os_log_impl((void *)&_mh_execute_header, v223, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing target SEID.  Halt TSM script execution", buf, 0x22u);
              }

              v42 = 0;
              v119->_returnCode = 4;
            }

          }
          else
          {
            v200 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v201 = NFLogGetLogger(v200);
            if (v201)
            {
              v202 = (void (*)(uint64_t, const char *, ...))v201;
              v203 = object_getClass(v367);
              v204 = class_isMetaClass(v203);
              v205 = object_getClassName(v367);
              v342 = sel_getName("_processServerResponse:originalRequest:storage:");
              v206 = 45;
              if (v204)
                v206 = 43;
              v202(6, "%c[%{public}s %{public}s]:%i no further action required", v206, v205, v342, 483);
            }
            v207 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v208 = NFSharedLogGetLogger(v207);
            v209 = objc_claimAutoreleasedReturnValue(v208);
            if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
            {
              v210 = object_getClass(v367);
              if (class_isMetaClass(v210))
                v211 = 43;
              else
                v211 = 45;
              v212 = object_getClassName(v367);
              v213 = sel_getName("_processServerResponse:originalRequest:storage:");
              *(_DWORD *)buf = 67109890;
              v376 = v211;
              v377 = 2082;
              v378 = v212;
              v379 = 2082;
              v380 = v213;
              v381 = 1024;
              v382 = 483;
              _os_log_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i no further action required", buf, 0x22u);
            }

            v42 = 0;
            v367->_returnCode = 0;
          }
        }
        else
        {
          objc_msgSend(0, "save");
          v325 = v361;
          v326 = v9;
          v327 = v4;
          v42 = 0;
        }

        goto LABEL_27;
      }
      if ((_DWORD)v27 == 3)
      {
        v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v55 = NFLogGetLogger(v54);
        if (v55)
        {
          v56 = (void (*)(uint64_t, const char *, ...))v55;
          v57 = object_getClass(self);
          v58 = class_isMetaClass(v57);
          v59 = object_getClassName(self);
          v335 = sel_getName(a2);
          v60 = 45;
          if (v58)
            v60 = 43;
          v56(6, "%c[%{public}s %{public}s]:%i Session abort", v60, v59, v335, 355);
        }
        v61 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v62 = NFSharedLogGetLogger(v61);
        v63 = objc_claimAutoreleasedReturnValue(v62);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v64 = object_getClass(self);
          if (class_isMetaClass(v64))
            v65 = 43;
          else
            v65 = 45;
          v66 = object_getClassName(self);
          v67 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v376 = v65;
          v377 = 2082;
          v378 = v66;
          v379 = 2082;
          v380 = v67;
          v381 = 1024;
          v382 = 355;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session abort", buf, 0x22u);
        }

        -[NFRemoteAdminState setUnsentScriptResponse:](self->_serverState, "setUnsentScriptResponse:", 0);
        -[NFRemoteAdminState save](self->_serverState, "save");
        v42 = 1;
        goto LABEL_27;
      }
      v169 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v170 = NFLogGetLogger(v169);
      if (v170)
      {
        v171 = (void (*)(uint64_t, const char *, ...))v170;
        v172 = object_getClass(self);
        v173 = class_isMetaClass(v172);
        v329 = object_getClassName(self);
        v341 = sel_getName(a2);
        v174 = 45;
        if (v173)
          v174 = 43;
        v171(4, "%c[%{public}s %{public}s]:%i Request sent failed, status=%d", v174, v329, v341, 367, v27);
      }
      v175 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v176 = NFSharedLogGetLogger(v175);
      v177 = objc_claimAutoreleasedReturnValue(v176);
      if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
      {
        v178 = object_getClass(self);
        if (class_isMetaClass(v178))
          v179 = 43;
        else
          v179 = 45;
        v180 = object_getClassName(self);
        v181 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v376 = v179;
        v377 = 2082;
        v378 = v180;
        v379 = 2082;
        v380 = v181;
        v381 = 1024;
        v382 = 367;
        v383 = 1024;
        LODWORD(v384) = (_DWORD)v27;
        _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Request sent failed, status=%d", buf, 0x28u);
      }

      if ((_DWORD)v27 == 25)
      {
        v42 = 0;
        v43 = 2;
      }
      else
      {
        v182 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v183 = NFLogGetLogger(v182);
        if (v183)
        {
          v184 = (void (*)(uint64_t, const char *, ...))v183;
          v185 = object_getClass(self);
          v186 = class_isMetaClass(v185);
          v187 = object_getClassName(self);
          v188 = sel_getName(a2);
          if (v27 >= 0x47)
            v189 = 71;
          else
            v189 = (int)v27;
          v349 = off_100054D68[v189];
          v190 = 43;
          if (!v186)
            v190 = 45;
          v184(3, "%c[%{public}s %{public}s]:%i %@ err=%d \"%s\", v190, v187, v188, 369, CFSTR("Returned"), v27, v349);
        }
        v191 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v192 = NFSharedLogGetLogger(v191);
        v193 = objc_claimAutoreleasedReturnValue(v192);
        if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR))
        {
          v194 = object_getClass(self);
          if (class_isMetaClass(v194))
            v195 = 43;
          else
            v195 = 45;
          v196 = object_getClassName(self);
          v197 = sel_getName(a2);
          if (v27 >= 0x47)
            v198 = 71;
          else
            v198 = (int)v27;
          v199 = off_100054D68[v198];
          *(_DWORD *)buf = 67110658;
          v376 = v195;
          v377 = 2082;
          v378 = v196;
          v379 = 2082;
          v380 = v197;
          v381 = 1024;
          v382 = 369;
          v383 = 2112;
          v384 = CFSTR("Returned");
          v385 = 1024;
          *(_DWORD *)v386 = (_DWORD)v27;
          *(_WORD *)&v386[4] = 2080;
          *(_QWORD *)&v386[6] = v199;
          _os_log_impl((void *)&_mh_execute_header, v193, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@ err=%d \"%s\", buf, 0x3Cu);
        }

        v42 = 0;
        if (((_DWORD)v27 - 19) > 1)
          v43 = 4;
        else
          v43 = 3;
      }
    }
    self->_returnCode = v43;
LABEL_27:

    goto LABEL_38;
  }
  if (Logger)
  {
    v44 = object_getClass(self);
    v45 = class_isMetaClass(v44);
    v46 = object_getClassName(self);
    v334 = sel_getName(a2);
    v47 = 45;
    if (v45)
      v47 = 43;
    v12(3, "%c[%{public}s %{public}s]:%i Failed to get next request", v47, v46, v334, 320);
  }
  v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v49 = NFSharedLogGetLogger(v48);
  v50 = objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    v51 = object_getClass(self);
    if (class_isMetaClass(v51))
      v52 = 43;
    else
      v52 = 45;
    *(_DWORD *)buf = 67109890;
    v376 = v52;
    v377 = 2082;
    v378 = object_getClassName(self);
    v379 = 2082;
    v380 = sel_getName(a2);
    v381 = 1024;
    v382 = 320;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get next request", buf, 0x22u);
  }

  v42 = 0;
  self->_returnCode = 4;
LABEL_38:

  return v42;
}

- (BOOL)_openSessionWithTimeout:(unint64_t)a3
{
  id v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  dispatch_time_t v18;
  intptr_t v19;
  id v20;
  void *v21;
  id v22;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v26;
  const char *ClassName;
  const char *Name;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  NFSecureElementManagerSession *seSession;
  id v37;
  void *v38;
  _QWORD v40[5];
  NSObject *v41;
  uint64_t *v42;
  uint64_t *v43;
  SEL v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  __CFString *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint8_t buf[4];
  int v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  int v62;

  if (self->_allocateSESession)
  {
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = sub_100033058;
    v49 = sub_100033068;
    v50 = &stru_100055418;
    v6 = sub_1000180C8();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    sub_10001CCC0((uint64_t)v7);

    v8 = dispatch_semaphore_create(0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100033070;
    v40[3] = &unk_100054FB0;
    v42 = &v45;
    v43 = &v51;
    v40[4] = self;
    v44 = a2;
    v10 = v8;
    v41 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startSecureElementManagerSessionWithPriority:", v40));

    v12 = 60 * a3;
    if (60 * a3 <= 1)
      v12 = 1;
    if (a3 == -1)
      v13 = -1;
    else
      v13 = v12;
    v14 = 119;
    do
    {
      v15 = v13 - v14;
      if (v13 >= v14)
      {
        v16 = v14;
      }
      else
      {
        v15 = 0;
        v16 = v13;
      }
      v17 = v13 == -1;
      if (v13 == -1)
        v13 = -1;
      else
        v13 = v15;
      if (!v17)
        v14 = v16;
      v18 = dispatch_time(0, 1000000000 * v14);
      v19 = dispatch_semaphore_wait(v10, v18);
      v20 = sub_1000180C8();
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      sub_10001CD04(v21);

    }
    while (v13 && v19);
    v22 = (id)v46[5];
    objc_sync_enter(v22);
    if (v19)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(self);
        if (class_isMetaClass(Class))
          v26 = 43;
        else
          v26 = 45;
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        Logger(4, "%c[%{public}s %{public}s]:%i Timeout waiting for nfcd session to start", v26, ClassName, Name, 636);
      }
      v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v30 = NFSharedLogGetLogger(v29);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = object_getClass(self);
        if (class_isMetaClass(v32))
          v33 = 43;
        else
          v33 = 45;
        v34 = object_getClassName(self);
        v35 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v56 = v33;
        v57 = 2082;
        v58 = v34;
        v59 = 2082;
        v60 = v35;
        v61 = 1024;
        v62 = 636;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Timeout waiting for nfcd session to start", buf, 0x22u);
      }

      *((_BYTE *)v52 + 24) = 1;
      objc_msgSend(v11, "endSessionWithCompletion:", &stru_100054FD0);
      seSession = self->_seSession;
      self->_seSession = 0;

    }
    objc_sync_exit(v22);

    v37 = sub_1000180C8();
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    sub_10001CC7C((uint64_t)v38);

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v51, 8);
  }
  return self->_seSession != 0;
}

- (unsigned)_deactiveAllAppletsOnSE:(id)a3
{
  id v5;
  void *v6;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  void *v23;
  NFSecureElementManagerSession *seSession;
  NSDictionary *v25;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;

  v5 = a3;
  v6 = (void *)objc_opt_new(NFRunScriptParameters);
  objc_msgSend(v6, "setSeid:", v5);

  objc_msgSend(v6, "setDeactivateAllApps:", 1);
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "seid"));
    v15 = 45;
    if (isMetaClass)
      v15 = 43;
    v9(6, "%c[%{public}s %{public}s]:%i Deactivating all applets on SEID:%{public}@", v15, ClassName, Name, 654, v14);

  }
  v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v17 = NFSharedLogGetLogger(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = object_getClass(self);
    if (class_isMetaClass(v19))
      v20 = 43;
    else
      v20 = 45;
    v21 = object_getClassName(self);
    v22 = sel_getName(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "seid"));
    *(_DWORD *)buf = 67110146;
    v28 = v20;
    v29 = 2082;
    v30 = v21;
    v31 = 2082;
    v32 = v22;
    v33 = 1024;
    v34 = 654;
    v35 = 2114;
    v36 = v23;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Deactivating all applets on SEID:%{public}@", buf, 0x2Cu);

  }
  seSession = self->_seSession;
  v25 = objc_opt_new(NSDictionary);
  LODWORD(seSession) = -[NFSecureElementManagerSession runScript:parameters:outputResults:](seSession, "runScript:parameters:outputResults:", v25, v6, 0);

  return seSession;
}

- (unint64_t)run
{
  NFRemoteAdminSession *v4;
  int v5;
  unint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NFRemoteAdminConnectionHTTP *v10;
  void *v11;
  void *v12;
  NFRemoteAdminConnectionHTTP *v13;
  NFRemoteAdminConnection *connection;
  NFRemoteAdminConnection *v15;
  NSObject *v16;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v20;
  const char *ClassName;
  const char *Name;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  void *v29;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  void *v35;
  uint64_t v36;
  objc_class *v37;
  int v38;
  const char *v39;
  const char *v40;
  const char *v41;
  void *v42;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  void *v48;
  uint64_t v49;
  objc_class *v50;
  int v51;
  const char *v52;
  const char *v53;
  int v54;
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
  void *v69;
  void (*v70)(uint64_t, const char *, ...);
  objc_class *v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  objc_class *v78;
  int v79;
  const char *v80;
  const char *v81;
  id v83;
  uint8_t buf[4];
  int v85;
  __int16 v86;
  const char *v87;
  __int16 v88;
  const char *v89;
  __int16 v90;
  int v91;
  __int16 v92;
  id v93;

  if (!self->_serverURL)
    return 5;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_abort)
  {
    v5 = 1;
    v6 = 1;
    goto LABEL_46;
  }
  v83 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", &v83));
  v8 = v83;
  if (!v7 || (objc_msgSend(v7, "available") & 1) == 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(v4);
      if (class_isMetaClass(Class))
        v20 = 43;
      else
        v20 = 45;
      ClassName = object_getClassName(v4);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i eSE unavailable, aborting.  Error = %{public}@", v20, ClassName, Name, 675, v8);
    }
    v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v24 = NFSharedLogGetLogger(v23);
    v16 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v25 = object_getClass(v4);
      if (class_isMetaClass(v25))
        v26 = 43;
      else
        v26 = 45;
      v27 = object_getClassName(v4);
      v28 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v85 = v26;
      v86 = 2082;
      v87 = v27;
      v88 = 2082;
      v89 = v28;
      v90 = 1024;
      v91 = 675;
      v92 = 2114;
      v93 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i eSE unavailable, aborting.  Error = %{public}@", buf, 0x2Cu);
    }
    v6 = 1;
    goto LABEL_44;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serialNumber"));
  objc_storeStrong((id *)&v4->_targetSEID, v9);

  if (!v4->_targetSEID)
  {
    v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v29);
    if (v30)
    {
      v31 = object_getClass(v4);
      if (class_isMetaClass(v31))
        v32 = 43;
      else
        v32 = 45;
      v33 = object_getClassName(v4);
      v34 = sel_getName(a2);
      v30(3, "%c[%{public}s %{public}s]:%i Missing SEID", v32, v33, v34, 681);
    }
    v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v36 = NFSharedLogGetLogger(v35);
    v16 = objc_claimAutoreleasedReturnValue(v36);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    v37 = object_getClass(v4);
    if (class_isMetaClass(v37))
      v38 = 43;
    else
      v38 = 45;
    v39 = object_getClassName(v4);
    v40 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v85 = v38;
    v86 = 2082;
    v87 = v39;
    v88 = 2082;
    v89 = v40;
    v90 = 1024;
    v91 = 681;
    v41 = "%c[%{public}s %{public}s]:%i Missing SEID";
    goto LABEL_42;
  }
  v10 = [NFRemoteAdminConnectionHTTP alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_serverURL, "URLByAppendingPathComponent:", CFSTR("v2")));
  v6 = v4->_targetSEID;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", 0));
  v13 = -[NFRemoteAdminConnectionHTTP initWithURL:SEID:showProprietaryHeaders:disableEVTrustValidation:](v10, "initWithURL:SEID:showProprietaryHeaders:disableEVTrustValidation:", v11, v6, 1, objc_msgSend(v12, "isProductionSigned") ^ 1);
  connection = v4->_connection;
  v4->_connection = (NFRemoteAdminConnection *)v13;

  v15 = v4->_connection;
  if (v15)
  {
    if (!-[NFRemoteAdminConnection connect](v15, "connect"))
    {
      v5 = 0;
      goto LABEL_45;
    }
    v16 = v4->_connection;
    v4->_connection = 0;
    goto LABEL_43;
  }
  v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v43 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v42);
  if (v43)
  {
    v44 = object_getClass(v4);
    if (class_isMetaClass(v44))
      v45 = 43;
    else
      v45 = 45;
    v46 = object_getClassName(v4);
    v47 = sel_getName(a2);
    v43(3, "%c[%{public}s %{public}s]:%i Failed to create connection", v45, v46, v47, 691);
  }
  v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v49 = NFSharedLogGetLogger(v48);
  v16 = objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v50 = object_getClass(v4);
    if (class_isMetaClass(v50))
      v51 = 43;
    else
      v51 = 45;
    v52 = object_getClassName(v4);
    v53 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v85 = v51;
    v86 = 2082;
    v87 = v52;
    v88 = 2082;
    v89 = v53;
    v90 = 1024;
    v91 = 691;
    v41 = "%c[%{public}s %{public}s]:%i Failed to create connection";
LABEL_42:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v41, buf, 0x22u);
  }
LABEL_43:
  v6 = 4;
LABEL_44:

  v5 = 1;
LABEL_45:

LABEL_46:
  objc_sync_exit(v4);

  if (!v5)
  {
    if (-[NFRemoteAdminSession _openSessionWithTimeout:](v4, "_openSessionWithTimeout:", -1) && v4->_seSession)
    {
      v54 = 201;
      while (1)
      {
        v55 = objc_autoreleasePoolPush();
        if (v4->_abort)
          break;
        if (!-[NFRemoteAdminSession performRequest](v4, "performRequest"))
          goto LABEL_76;
        objc_autoreleasePoolPop(v55);
        if (--v54 <= 1)
          goto LABEL_77;
      }
      v69 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v70 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v69);
      if (v70)
      {
        v71 = object_getClass(v4);
        if (class_isMetaClass(v71))
          v72 = 43;
        else
          v72 = 45;
        v73 = object_getClassName(v4);
        v74 = sel_getName(a2);
        v70(5, "%c[%{public}s %{public}s]:%i Aborted: system shutting down", v72, v73, v74, 722);
      }
      v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v76 = NFSharedLogGetLogger(v75);
      v77 = objc_claimAutoreleasedReturnValue(v76);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        v78 = object_getClass(v4);
        if (class_isMetaClass(v78))
          v79 = 43;
        else
          v79 = 45;
        v80 = object_getClassName(v4);
        v81 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v85 = v79;
        v86 = 2082;
        v87 = v80;
        v88 = 2082;
        v89 = v81;
        v90 = 1024;
        v91 = 722;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Aborted: system shutting down", buf, 0x22u);
      }

      v4->_returnCode = 1;
LABEL_76:
      objc_autoreleasePoolPop(v55);
LABEL_77:
      if (v4->_allocateSESession)
        -[NFSecureElementManagerSession endSessionWithCompletion:](v4->_seSession, "endSessionWithCompletion:", &stru_100054FF0);
      -[NFRemoteAdminConnection disconnect](v4->_connection, "disconnect");
      return v4->_returnCode;
    }
    else
    {
      v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v57 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v56);
      if (v57)
      {
        v58 = object_getClass(v4);
        if (class_isMetaClass(v58))
          v59 = 43;
        else
          v59 = 45;
        v60 = object_getClassName(v4);
        v61 = sel_getName(a2);
        v57(3, "%c[%{public}s %{public}s]:%i Failed to open SE session", v59, v60, v61, 707);
      }
      v62 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v63 = NFSharedLogGetLogger(v62);
      v64 = objc_claimAutoreleasedReturnValue(v63);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        v65 = object_getClass(v4);
        if (class_isMetaClass(v65))
          v66 = 43;
        else
          v66 = 45;
        v67 = object_getClassName(v4);
        v68 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v85 = v66;
        v86 = 2082;
        v87 = v67;
        v88 = 2082;
        v89 = v68;
        v90 = 1024;
        v91 = 707;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open SE session", buf, 0x22u);
      }

      -[NFRemoteAdminConnection disconnect](v4->_connection, "disconnect");
      return 4;
    }
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSEID, 0);
  objc_storeStrong((id *)&self->_serverURL, 0);
  objc_storeStrong((id *)&self->_serverState, 0);
  objc_storeStrong((id *)&self->_endMetric, 0);
  objc_storeStrong((id *)&self->_seSession, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
