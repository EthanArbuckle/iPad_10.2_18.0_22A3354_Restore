@implementation NFExpressConfigESE

- (id)getSecureElementWrapper
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "secureElementWrapper"));

  return v3;
}

- (id)getSecureElementWrapperAndSetRouting
{
  void *v4;
  void *v5;
  void *v6;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  void *v19;
  const char *Name;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig embeddedWiredMode](NFRoutingConfig, "embeddedWiredMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setRoutingConfig:", v5));

  if (v6)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i Failed to set eSE to wired mode", v13, ClassName, Name, 118);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(self);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67109890;
      v23 = v18;
      v24 = 2082;
      v25 = object_getClassName(self);
      v26 = 2082;
      v27 = sel_getName(a2);
      v28 = 1024;
      v29 = 118;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set eSE to wired mode", buf, 0x22u);
    }

    v19 = 0;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secureElementWrapper"));
  }

  return v19;
}

- (void)updateStorage
{
  void *v3;
  NSMutableArray *passes;
  NSMutableArray *v5;
  NSObject *p_super;
  id v7;
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
  NFExpressConfigESE *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  NSMutableArray *v23;
  NFExpressConfigESE *v24;
  NSMutableArray *v25;
  NSMutableArray *v26;
  NSMutableArray *v27;
  NFExpressConfigESE *v28;
  NSMutableArray *v29;
  NSMutableArray *v30;
  void *specific;
  uint64_t Logger;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  BOOL v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  objc_class *v41;
  int v42;
  const char *v43;
  const char *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  NSMutableArray *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  unsigned int v70;
  void *v71;
  unsigned int v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  unsigned int v82;
  void *v83;
  unsigned int v84;
  void *v85;
  void *v86;
  unsigned int v87;
  void *v88;
  unsigned int v89;
  void *v90;
  void *v91;
  unsigned int v92;
  void *v93;
  unsigned int v94;
  void *v95;
  void *v96;
  void *v97;
  unsigned int v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  unsigned int v105;
  void *v106;
  unsigned int v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  unsigned int v115;
  void *v116;
  void *v117;
  void *v118;
  unsigned int v119;
  void *v120;
  void *v121;
  void *v122;
  unsigned __int8 v123;
  id v124;
  id v125;
  id v126;
  id v127;
  void *v128;
  uint64_t v129;
  void (*v130)(uint64_t, const char *, ...);
  objc_class *v131;
  _BOOL4 v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  NSObject *v137;
  objc_class *v138;
  int v139;
  const char *v140;
  const char *v141;
  void *v142;
  uint64_t v143;
  void (*v144)(uint64_t, const char *, ...);
  objc_class *v145;
  _BOOL4 v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  NSObject *v151;
  objc_class *v152;
  int v153;
  const char *v154;
  const char *v155;
  NSMutableArray *v156;
  NSMutableArray *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  void (*v161)(uint64_t, const char *, ...);
  objc_class *v162;
  _BOOL4 v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  NSObject *v168;
  objc_class *v169;
  NFExpressConfigESE *v170;
  int v171;
  const char *v172;
  const char *v173;
  const char *v174;
  const char *v175;
  const char *v176;
  const char *v177;
  const char *v178;
  const char *Name;
  const char *v180;
  const char *v181;
  const char *v182;
  void *v183;
  void *v184;
  void *v186;
  int v187;
  uint64_t v188;
  NFExpressConfigESE *v189;
  NSMutableArray *obj;
  id v191;
  uint64_t v192;
  id v193;
  void *v194;
  id v195;
  id v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  uint8_t v205[128];
  uint8_t buf[4];
  int v207;
  __int16 v208;
  const char *v209;
  __int16 v210;
  const char *v211;
  __int16 v212;
  int v213;
  __int16 v214;
  int v215;
  __int16 v216;
  id v217;

  v3 = (void *)objc_opt_new(NFStorageService);
  v183 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  LOBYTE(v187) = objc_msgSend(v183, "BOOLForKey:", CFSTR("eSETestDBErrors"));
  v188 = 0;
  v184 = v3;
  v189 = self;
  while (2)
  {
    if (self)
      passes = self->super._passes;
    else
      passes = 0;
    v5 = passes;
    p_super = &v5->super.super;
    if ((v187 & 1) != 0)
    {
      v7 = -[NSMutableArray count](v5, "count");

      if ((_DWORD)v188 || !v7)
      {
        v28 = v189;
        if (v189)
          v29 = v189->super._passes;
        else
          v29 = 0;
        v30 = v29;
        objc_msgSend(v3, "updateESEExpressEntitiesWithConfig:", v30);

        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v33 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(v189);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(v189);
          Name = sel_getName(a2);
          v37 = !isMetaClass;
          v28 = v189;
          v38 = 45;
          if (!v37)
            v38 = 43;
          v175 = ClassName;
          v3 = v184;
          v33(6, "%c[%{public}s %{public}s]:%i Read back the config", v38, v175, Name, 227);
        }
        v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v40 = NFSharedLogGetLogger(v39);
        p_super = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          v41 = object_getClass(v28);
          if (class_isMetaClass(v41))
            v42 = 43;
          else
            v42 = 45;
          v43 = object_getClassName(v28);
          v44 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v207 = v42;
          v208 = 2082;
          v209 = v43;
          v210 = 2082;
          v211 = v44;
          v212 = 1024;
          v213 = 227;
          _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Read back the config", buf, 0x22u);
        }
        v187 = 1;
        goto LABEL_34;
      }
      v8 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v9 = NFLogGetLogger(v8);
      if (v9)
      {
        v10 = (void (*)(uint64_t, const char *, ...))v9;
        v11 = object_getClass(v189);
        v12 = class_isMetaClass(v11);
        v13 = object_getClassName(v189);
        v178 = sel_getName(a2);
        v14 = 45;
        if (v12)
          v14 = 43;
        v174 = v13;
        v3 = v184;
        v10(6, "%c[%{public}s %{public}s]:%i testing DB errors - doubling array", v14, v174, v178, 215);
      }
      v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v16 = NFSharedLogGetLogger(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      v18 = v189;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = object_getClass(v189);
        if (class_isMetaClass(v19))
          v20 = 43;
        else
          v20 = 45;
        v21 = object_getClassName(v189);
        v22 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v207 = v20;
        v208 = 2082;
        v209 = v21;
        v18 = v189;
        v210 = 2082;
        v211 = v22;
        v212 = 1024;
        v213 = 215;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i testing DB errors - doubling array", buf, 0x22u);
      }

      if (v18)
        v23 = v18->super._passes;
      else
        v23 = 0;
      v24 = v18;
      v25 = v23;
      p_super = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v25));

      if (v24)
        v26 = v24->super._passes;
      else
        v26 = 0;
      v27 = v26;
      -[NSObject addObjectsFromArray:](p_super, "addObjectsFromArray:", v27);

    }
    objc_msgSend(v3, "updateESEExpressEntitiesWithConfig:", p_super);
    v187 = 0;
LABEL_34:

    v196 = 0;
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchESEExpressEntitiesWithError:", &v196));
    v46 = v196;
    v47 = v46;
    v186 = v45;
    if (!v45 || v46)
    {
      v128 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v129 = NFLogGetLogger(v128);
      if (v129)
      {
        v130 = (void (*)(uint64_t, const char *, ...))v129;
        v131 = object_getClass(v189);
        v132 = class_isMetaClass(v131);
        v133 = object_getClassName(v189);
        v180 = sel_getName(a2);
        v37 = !v132;
        v3 = v184;
        v134 = 45;
        if (!v37)
          v134 = 43;
        v130(3, "%c[%{public}s %{public}s]:%i Failed to read expressConfig from storage (iteration %d): error: %{public}@", v134, v133, v180, 235, v188, v47);
      }
      v135 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v136 = NFSharedLogGetLogger(v135);
      v137 = objc_claimAutoreleasedReturnValue(v136);
      if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
      {
        v138 = object_getClass(v189);
        if (class_isMetaClass(v138))
          v139 = 43;
        else
          v139 = 45;
        v140 = object_getClassName(v189);
        v141 = sel_getName(a2);
        *(_DWORD *)buf = 67110402;
        v207 = v139;
        v208 = 2082;
        v209 = v140;
        v3 = v184;
        v210 = 2082;
        v211 = v141;
        v212 = 1024;
        v213 = 235;
        v214 = 1024;
        v215 = v188;
        v216 = 2114;
        v217 = v47;
        _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to read expressConfig from storage (iteration %d): error: %{public}@", buf, 0x32u);
      }

      self = v189;
      goto LABEL_113;
    }
    v48 = v45;
    self = v189;
    if (!v189
      || (v49 = v189->super._passes,
          v50 = -[NSMutableArray count](v49, "count"),
          v51 = objc_msgSend(v48, "count"),
          v49,
          v37 = v50 == v51,
          self = v189,
          !v37))
    {

      goto LABEL_100;
    }
    v203 = 0u;
    v204 = 0u;
    v201 = 0u;
    v202 = 0u;
    obj = v189->super._passes;
    v193 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v201, buf, 16);
    if (!v193)
      goto LABEL_87;
    v191 = v48;
    v192 = *(_QWORD *)v202;
    do
    {
      v52 = 0;
      do
      {
        if (*(_QWORD *)v202 != v192)
          objc_enumerationMutation(obj);
        v53 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * (_QWORD)v52);
        v197 = 0u;
        v198 = 0u;
        v199 = 0u;
        v200 = 0u;
        v54 = v48;
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v197, v205, 16);
        if (!v55)
          goto LABEL_81;
        v56 = v55;
        v194 = v52;
        v57 = *(_QWORD *)v198;
LABEL_46:
        v58 = 0;
        while (1)
        {
          if (*(_QWORD *)v198 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * v58);
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("passUniqueID")));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("passUniqueID")));
          v62 = objc_msgSend(v60, "caseInsensitiveCompare:", v61);

          if (!v62)
          {
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("appletIdentifier")));
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("appletIdentifier")));
            v65 = objc_msgSend(v63, "caseInsensitiveCompare:", v64);

            if (!v65)
            {
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("ExpressType")));
              v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("ExpressType")));
              v68 = objc_msgSend(v66, "caseInsensitiveCompare:", v67);

              if (!v68)
              {
                v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("expressEnabled")));
                v70 = objc_msgSend(v69, "BOOLValue");
                v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("expressEnabled")));
                v72 = objc_msgSend(v71, "BOOLValue");

                if (v70 == v72)
                {
                  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("moduleIdentifier")));
                  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("moduleIdentifier")));
                  v75 = objc_msgSend(v73, "caseInsensitiveCompare:", v74);

                  if (!v75)
                  {
                    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("keyIdentifier")));

                    if (!v76
                      || (v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("keyIdentifier"))),
                          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("keyIdentifier"))),
                          v79 = objc_msgSend(v77, "caseInsensitiveCompare:", v78),
                          v78,
                          v77,
                          !v79))
                    {
                      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("inSessionOnly")));

                      if (!v80
                        || (v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("inSessionOnly"))),
                            v82 = objc_msgSend(v81, "BOOLValue"),
                            v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("inSessionOnly"))),
                            v84 = objc_msgSend(v83, "BOOLValue"),
                            v83,
                            v81,
                            v82 == v84))
                      {
                        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("UWBExpressEnabled")));

                        if (!v85
                          || (v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("UWBExpressEnabled"))),
                              v87 = objc_msgSend(v86, "BOOLValue"),
                              v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("UWBExpressEnabled"))),
                              v89 = objc_msgSend(v88, "BOOLValue"),
                              v88,
                              v86,
                              v87 == v89))
                        {
                          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("userChoice")));

                          if (!v90
                            || (v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("userChoice"))),
                                v92 = objc_msgSend(v91, "BOOLValue"),
                                v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("userChoice"))),
                                v94 = objc_msgSend(v93, "BOOLValue"),
                                v93,
                                v91,
                                v92 == v94))
                          {
                            v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("ECP2Info")));

                            if (!v95
                              || (v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("ECP2Info"))),
                                  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("ECP2Info"))),
                                  v98 = objc_msgSend(v96, "isEqual:", v97),
                                  v97,
                                  v96,
                                  v98))
                            {
                              v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("readerIdentifier")));

                              if (!v99
                                || (v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("readerIdentifier"))), v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("readerIdentifier"))), v102 = objc_msgSend(v100, "caseInsensitiveCompare:", v101), v101, v100, !v102))
                              {
                                v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("groupActivationStyle")));

                                if (!v103
                                  || (v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("groupActivationStyle"))), v105 = objc_msgSend(v104, "intValue"), v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("groupActivationStyle"))), v107 = objc_msgSend(v106, "intValue"), v106, v104, v105 == v107))
                                {
                                  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("groupHead")));

                                  if (!v108
                                    || (v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("groupHead"))), v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("groupHead"))), v111 = objc_msgSend(v109, "caseInsensitiveCompare:", v110), v110, v109, !v111))
                                  {
                                    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("groupMembers")));

                                    if (!v112
                                      || (v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("groupMembers"))), v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("groupMembers"))), v115 = objc_msgSend(v113, "isEqual:", v114), v114, v113, v115))
                                    {
                                      v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("aliroGroupResolvingKeys")));

                                      if (!v116
                                        || (v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("aliroGroupResolvingKeys"))), v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("aliroGroupResolvingKeys"))), v119 = objc_msgSend(v117, "isEqual:", v118), v118, v117, v119))
                                      {
                                        v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("associatedReaderIdentifiers")));

                                        if (!v120)
                                          break;
                                        v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("associatedReaderIdentifiers")));
                                        v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("associatedReaderIdentifiers")));
                                        v123 = objc_msgSend(v121, "isEqual:", v122);

                                        if ((v123 & 1) != 0)
                                          break;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          if (v56 == (id)++v58)
          {
            v124 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v197, v205, 16);
            v56 = v124;
            if (!v124)
            {
              v48 = v191;
              v52 = v194;
              goto LABEL_81;
            }
            goto LABEL_46;
          }
        }
        v125 = v59;

        v48 = v191;
        v52 = v194;
        if (v125)
        {
          objc_msgSend(v54, "removeObject:", v125);
          v54 = v125;
LABEL_81:

        }
        v52 = (char *)v52 + 1;
      }
      while (v52 != v193);
      v126 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v201, buf, 16);
      v193 = v126;
    }
    while (v126);
LABEL_87:

    v127 = objc_msgSend(v48, "count");
    self = v189;
    if (v127)
    {
LABEL_100:
      v142 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v143 = NFLogGetLogger(v142);
      if (v143)
      {
        v144 = (void (*)(uint64_t, const char *, ...))v143;
        v145 = object_getClass(self);
        v146 = class_isMetaClass(v145);
        v147 = object_getClassName(self);
        v181 = sel_getName(a2);
        v148 = 45;
        if (v146)
          v148 = 43;
        v176 = v147;
        self = v189;
        v144(3, "%c[%{public}s %{public}s]:%i Passes in storage don't match to configured (iteration %d)", v148, v176, v181, 247, v188);
      }
      v149 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v150 = NFSharedLogGetLogger(v149);
      v151 = objc_claimAutoreleasedReturnValue(v150);
      v3 = v184;
      if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
      {
        v152 = object_getClass(self);
        if (class_isMetaClass(v152))
          v153 = 43;
        else
          v153 = 45;
        v154 = object_getClassName(v189);
        v155 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v207 = v153;
        v208 = 2082;
        v209 = v154;
        v210 = 2082;
        v211 = v155;
        v212 = 1024;
        v213 = 247;
        v214 = 1024;
        self = v189;
        v215 = v188;
        _os_log_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Passes in storage don't match to configured (iteration %d)", buf, 0x28u);
      }

      if (self)
        v156 = self->super._passes;
      else
        v156 = 0;
      v157 = v156;
      -[NFExpressConfig dumpConfig:logLevel:prefix:](self, "dumpConfig:logLevel:prefix:", v157, 3, CFSTR("updateStorage: current config"));

      v195 = 0;
      v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "fetchESEExpressEntitiesWithError:", &v195));
      v47 = v195;
      -[NFExpressConfig dumpConfig:logLevel:prefix:](self, "dumpConfig:logLevel:prefix:", v158, 3, CFSTR("updateStorage: stored config"));

      if (!(_DWORD)v188)
      {
        sub_100187E84((uint64_t)NFBugCapture, CFSTR("Incorrect eSE config has been stored"), CFSTR("CoreData update error"), 0);
        +[NFExceptionsCALogger postAnalyticsExpressSetupFailureEvent:context:error:](NFExceptionsCALogger, "postAnalyticsExpressSetupFailureEvent:context:error:", 2, 0, 0);
      }
LABEL_113:

      v188 = (v188 + 1);
      if ((_DWORD)v188 == 5)
      {
        objc_msgSend(v3, "disconnect");
        goto LABEL_132;
      }
      continue;
    }
    break;
  }
  v3 = v184;
  if (v187)
  {
    v159 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v160 = NFLogGetLogger(v159);
    if (v160)
    {
      v161 = (void (*)(uint64_t, const char *, ...))v160;
      v162 = object_getClass(v189);
      v163 = class_isMetaClass(v162);
      v164 = object_getClassName(v189);
      v182 = sel_getName(a2);
      v165 = 45;
      if (v163)
        v165 = 43;
      v177 = v164;
      self = v189;
      v161(6, "%c[%{public}s %{public}s]:%i passes match", v165, v177, v182, 239);
    }
    v166 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v167 = NFSharedLogGetLogger(v166);
    v168 = objc_claimAutoreleasedReturnValue(v167);
    if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
    {
      v169 = object_getClass(self);
      v37 = !class_isMetaClass(v169);
      v170 = self;
      if (v37)
        v171 = 45;
      else
        v171 = 43;
      v172 = object_getClassName(v170);
      v173 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v207 = v171;
      v208 = 2082;
      v209 = v172;
      v210 = 2082;
      v211 = v173;
      v212 = 1024;
      v213 = 239;
      _os_log_impl((void *)&_mh_execute_header, v168, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i passes match", buf, 0x22u);
    }

  }
LABEL_132:

}

- (id)seName
{
  return CFSTR("eSE");
}

- (BOOL)validateAndUpdateExpressConfig:(id)a3 avoidChangingRouting:(BOOL)a4
{
  id v6;
  id v7;
  id v8;
  _UNKNOWN **v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  _BOOL4 v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *specific;
  uint64_t Logger;
  void (*v53)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  objc_class *v61;
  int v62;
  const char *v63;
  const char *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void (*v68)(uint64_t, const char *, ...);
  objc_class *v69;
  _BOOL4 v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  NSObject *v74;
  objc_class *v75;
  int v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void (*v83)(uint64_t, const char *, ...);
  objc_class *v84;
  _BOOL4 v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  objc_class *v89;
  int v90;
  const char *v91;
  const char *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void (*v96)(uint64_t, const char *, ...);
  objc_class *v97;
  _BOOL4 v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  objc_class *v102;
  int v103;
  const char *v104;
  const char *v105;
  const char *v107;
  const char *v108;
  const char *v109;
  const char *v110;
  const char *v111;
  const char *Name;
  const char *v113;
  const char *v114;
  const char *v115;
  id v116;
  const char *v117;
  id obj;
  void *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint8_t buf[4];
  int v126;
  __int16 v127;
  const char *v128;
  __int16 v129;
  const char *v130;
  __int16 v131;
  int v132;
  __int16 v133;
  void *v134;
  __int16 v135;
  void *v136;
  _BYTE v137[128];

  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    v34 = 1;
    goto LABEL_95;
  }
  v117 = a2;
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v137, 16);
  if (!v7)
  {
    v34 = 1;
    goto LABEL_94;
  }
  v8 = v7;
  v9 = &AMFDRSealingMapCopyLocalData_ptr;
  v10 = *(_QWORD *)v122;
  v116 = v6;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v122 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)i);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("appletIdentifier")));
      v14 = objc_opt_class(v9[267]);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
      {
        sub_100187E84((uint64_t)NFBugCapture, CFSTR("Unable to set as express"), CFSTR("NFExpressConfigESE : validateAndUpdateExpressConfig, Error: Wrong class"), 0);
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v53 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(v117);
          v57 = 45;
          if (isMetaClass)
            v57 = 43;
          v53(3, "%c[%{public}s %{public}s]:%i Wrong class for AID", v57, ClassName, Name, 288);
        }
        v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v59 = NFSharedLogGetLogger(v58);
        v60 = objc_claimAutoreleasedReturnValue(v59);
        v6 = v116;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          v61 = object_getClass(self);
          if (class_isMetaClass(v61))
            v62 = 43;
          else
            v62 = 45;
          v63 = object_getClassName(self);
          v64 = sel_getName(v117);
          *(_DWORD *)buf = 67109890;
          v126 = v62;
          v127 = 2082;
          v128 = v63;
          v129 = 2082;
          v130 = v64;
          v131 = 1024;
          v132 = 288;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Wrong class for AID", buf, 0x22u);
        }

        +[NFExceptionsCALogger postAnalyticsExpressSetupFailureEvent:context:error:](NFExceptionsCALogger, "postAnalyticsExpressSetupFailureEvent:context:error:", 0, 1, 0);
        goto LABEL_93;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ExpressType")));
      v16 = objc_opt_class(v9[267]);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0
        || !+[NFExpressConfig expressTypeForATLConfigKey:](NFExpressConfig, "expressTypeForATLConfigKey:", v15))
      {
        v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v36 = NFLogGetLogger(v35);
        v6 = v116;
        if (v36)
        {
          v37 = (void (*)(uint64_t, const char *, ...))v36;
          v38 = object_getClass(self);
          v39 = class_isMetaClass(v38);
          v40 = object_getClassName(self);
          v111 = sel_getName(v117);
          v41 = 45;
          if (v39)
            v41 = 43;
          v107 = v40;
          v9 = &AMFDRSealingMapCopyLocalData_ptr;
          v37(3, "%c[%{public}s %{public}s]:%i Incorrect express type %{public}@ for %{public}@", v41, v107, v111, 298, v15, v13);
        }
        v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v43 = NFSharedLogGetLogger(v42);
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = object_getClass(self);
          if (class_isMetaClass(v45))
            v46 = 43;
          else
            v46 = 45;
          v47 = object_getClassName(self);
          v48 = sel_getName(v117);
          *(_DWORD *)buf = 67110402;
          v126 = v46;
          v9 = &AMFDRSealingMapCopyLocalData_ptr;
          v127 = 2082;
          v128 = v47;
          v129 = 2082;
          v130 = v48;
          v131 = 1024;
          v132 = 298;
          v133 = 2114;
          v134 = v15;
          v135 = 2114;
          v136 = v13;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Incorrect express type %{public}@ for %{public}@", buf, 0x36u);
        }

        v120 = v13;
        v22 = objc_msgSend(objc_alloc((Class)v9[267]), "initWithFormat:", CFSTR("NFExpressConfigESE : validateAndUpdateExpressConfig, Error: Wrong express type %@ for %@"), v15, v13);
        sub_100187E84((uint64_t)NFBugCapture, CFSTR("Incorrect express type"), v22, 0);
        v49 = 1;
        v50 = 2;
LABEL_92:
        +[NFExceptionsCALogger postAnalyticsExpressSetupFailureEvent:context:error:](NFExceptionsCALogger, "postAnalyticsExpressSetupFailureEvent:context:error:", v49, v50, 0);

        v13 = v120;
LABEL_93:

        v34 = 0;
        goto LABEL_94;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("inSessionOnly")));

      if (!v17)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("inSessionOnly"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("UWBExpressEnabled")));

      if (!v18)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("UWBExpressEnabled"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("userChoice")));

      if (!v19)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("userChoice"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("supportsUWB")));

      if (v20)
      {
        if (a4)
          goto LABEL_36;
      }
      else
      {
        objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("supportsUWB"));
        if (a4)
          goto LABEL_36;
      }
      v120 = v13;
      v21 = sub_10001DB2C(self, v13);
      v22 = (id)objc_claimAutoreleasedReturnValue(v21);
      if (!v22)
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[267], "stringWithFormat:", CFSTR("NFExpressConfigESE: validateAndUpdateExpressConfig, Error: %@ is not on SE"), v120));
        sub_100187E84((uint64_t)NFBugCapture, CFSTR("Unable to set as express"), v80, 0);

        v81 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v82 = NFLogGetLogger(v81);
        if (v82)
        {
          v83 = (void (*)(uint64_t, const char *, ...))v82;
          v84 = object_getClass(self);
          v85 = class_isMetaClass(v84);
          v109 = object_getClassName(self);
          v114 = sel_getName(v117);
          v86 = 45;
          if (v85)
            v86 = 43;
          v83(3, "%c[%{public}s %{public}s]:%i %{public}@ not installed on eSE", v86, v109, v114, 323, v120);
        }
        v87 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v88 = NFSharedLogGetLogger(v87);
        v74 = objc_claimAutoreleasedReturnValue(v88);
        v6 = v116;
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          v89 = object_getClass(self);
          if (class_isMetaClass(v89))
            v90 = 43;
          else
            v90 = 45;
          v91 = object_getClassName(self);
          v92 = sel_getName(v117);
          *(_DWORD *)buf = 67110146;
          v126 = v90;
          v127 = 2082;
          v128 = v91;
          v129 = 2082;
          v130 = v92;
          v131 = 1024;
          v132 = 323;
          v133 = 2114;
          v134 = v120;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ not installed on eSE", buf, 0x2Cu);
        }
        v79 = 3;
        goto LABEL_91;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("expressEnabled")));
      if (objc_msgSend(v23, "BOOLValue"))
      {
        v24 = objc_msgSend(v22, "authTransientSupport");

        if (v24)
        {
          v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NFExpressConfigESE: validateAndUpdateExpressConfig, Error: Transient authorization enabled for %@"), v120));
          sub_100187E84((uint64_t)NFBugCapture, CFSTR("Unable to set as express"), v93, 0);

          v94 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v95 = NFLogGetLogger(v94);
          if (v95)
          {
            v96 = (void (*)(uint64_t, const char *, ...))v95;
            v97 = object_getClass(self);
            v98 = class_isMetaClass(v97);
            v110 = object_getClassName(self);
            v115 = sel_getName(v117);
            v99 = 45;
            if (v98)
              v99 = 43;
            v96(3, "%c[%{public}s %{public}s]:%i Transient authorization enabled for %{public}@", v99, v110, v115, 335, v120);
          }
          v100 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v101 = NFSharedLogGetLogger(v100);
          v74 = objc_claimAutoreleasedReturnValue(v101);
          v6 = v116;
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            v102 = object_getClass(self);
            if (class_isMetaClass(v102))
              v103 = 43;
            else
              v103 = 45;
            v104 = object_getClassName(self);
            v105 = sel_getName(v117);
            *(_DWORD *)buf = 67110146;
            v126 = v103;
            v127 = 2082;
            v128 = v104;
            v129 = 2082;
            v130 = v105;
            v131 = 1024;
            v132 = 335;
            v133 = 2114;
            v134 = v120;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Transient authorization enabled for %{public}@", buf, 0x2Cu);
          }
          v79 = 4;
LABEL_91:

          v49 = 0;
          v50 = v79;
          goto LABEL_92;
        }
      }
      else
      {

      }
      if (objc_msgSend(v22, "lifecycleState") == 129
        || objc_msgSend(v22, "lifecycleState") == 130)
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NFExpressConfigESE: validateAndUpdateExpressConfig, Error: Applet %@ is terminated/frozen"), v120));
        sub_100187E84((uint64_t)NFBugCapture, CFSTR("Unable to set as express"), v65, 0);

        v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v67 = NFLogGetLogger(v66);
        if (v67)
        {
          v68 = (void (*)(uint64_t, const char *, ...))v67;
          v69 = object_getClass(self);
          v70 = class_isMetaClass(v69);
          v108 = object_getClassName(self);
          v113 = sel_getName(v117);
          v71 = 45;
          if (v70)
            v71 = 43;
          v68(3, "%c[%{public}s %{public}s]:%i Applet %{public}@ is terminated/frozen", v71, v108, v113, 348, v120);
        }
        v72 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v73 = NFSharedLogGetLogger(v72);
        v74 = objc_claimAutoreleasedReturnValue(v73);
        v6 = v116;
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          v75 = object_getClass(self);
          if (class_isMetaClass(v75))
            v76 = 43;
          else
            v76 = 45;
          v77 = object_getClassName(self);
          v78 = sel_getName(v117);
          *(_DWORD *)buf = 67110146;
          v126 = v76;
          v127 = 2082;
          v128 = v77;
          v129 = 2082;
          v130 = v78;
          v131 = 1024;
          v132 = 348;
          v133 = 2114;
          v134 = v120;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Applet %{public}@ is terminated/frozen", buf, 0x2Cu);
        }
        v79 = 5;
        goto LABEL_91;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("moduleIdentifier")));

      if (!v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "moduleIdentifier"));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v26, CFSTR("moduleIdentifier"));

      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v22, "groupActivationStyle")));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v27, CFSTR("groupActivationStyle"));

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "moduleIdentifier"));
      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "moduleIdentifier"));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v29, CFSTR("moduleIdentifier"));

      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "groupHeadID"));

      if (v30)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "groupHeadID"));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v31, CFSTR("groupHead"));

      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "groupMemberIDs"));

      if (v32)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "groupMemberIDs"));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v33, CFSTR("groupMembers"));

      }
      v9 = &AMFDRSealingMapCopyLocalData_ptr;
      v13 = v120;
LABEL_36:

    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v137, 16);
    v34 = 1;
    v6 = v116;
    if (v8)
      continue;
    break;
  }
LABEL_94:

LABEL_95:
  return v34;
}

- (id)fetchFromStorage
{
  void *v4;
  void *v5;
  id v6;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  const char *ClassName;
  const char *Name;
  id v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;

  v4 = (void *)objc_opt_new(NFStorageService);
  v23 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fetchESEExpressEntitiesWithError:", &v23));
  v6 = v23;
  if (v6)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i Failed to execute fetch request: %{public}@", v12, ClassName, Name, 379, v6);
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
      v18 = object_getClassName(self);
      v19 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v25 = v17;
      v26 = 2082;
      v27 = v18;
      v28 = 2082;
      v29 = v19;
      v30 = 1024;
      v31 = 379;
      v32 = 2114;
      v33 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to execute fetch request: %{public}@", buf, 0x2Cu);
    }

  }
  objc_msgSend(v4, "disconnect");

  return v5;
}

- (id)migrateFromDefaults
{
  void *v3;
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *i;
  NSMutableDictionary *v19;
  void *v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  NSMutableDictionary *v33;
  void *v34;
  uint64_t v35;
  void (*v36)(uint64_t, const char *, ...);
  objc_class *v37;
  _BOOL4 v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  int v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void (*v49)(uint64_t, const char *, ...);
  objc_class *v50;
  _BOOL4 v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  objc_class *v56;
  int v57;
  NSMutableDictionary *v58;
  id v59;
  uint64_t v60;
  void *j;
  NSMutableDictionary *v62;
  void *v63;
  void (*v64)(uint64_t, const char *, ...);
  objc_class *v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  void *v69;
  uint64_t v70;
  NSObject *v71;
  objc_class *v72;
  int v73;
  const char *v74;
  const char *v75;
  NSMutableDictionary *v76;
  id v77;
  uint64_t v78;
  void *k;
  NSMutableDictionary *v80;
  void *v81;
  void (*v82)(uint64_t, const char *, ...);
  objc_class *v83;
  uint64_t v84;
  const char *v85;
  const char *v86;
  void *v87;
  uint64_t v88;
  NSObject *v89;
  objc_class *v90;
  int v91;
  const char *v92;
  const char *v93;
  NSMutableDictionary *v94;
  id v95;
  uint64_t v96;
  void *m;
  NSMutableDictionary *v98;
  void *v99;
  void (*v100)(uint64_t, const char *, ...);
  objc_class *v101;
  uint64_t v102;
  const char *v103;
  const char *v104;
  void *v105;
  uint64_t v106;
  NSObject *v107;
  objc_class *v108;
  int v109;
  const char *v110;
  const char *v111;
  NSMutableDictionary *v112;
  void *v113;
  void (*v114)(uint64_t, const char *, ...);
  objc_class *v115;
  uint64_t v116;
  const char *v117;
  const char *v118;
  void *v119;
  uint64_t v120;
  NSObject *v121;
  objc_class *v122;
  int v123;
  const char *v124;
  const char *v125;
  void *v126;
  NSMutableDictionary *v127;
  id v128;
  uint64_t v129;
  void *n;
  NSMutableDictionary *v131;
  void *v132;
  void *v133;
  void (*v134)(uint64_t, const char *, ...);
  objc_class *v135;
  uint64_t v136;
  const char *v137;
  const char *v138;
  void *v139;
  uint64_t v140;
  NSObject *v141;
  objc_class *v142;
  int v143;
  const char *v144;
  const char *v145;
  void *v146;
  id v147;
  const char *ClassName;
  const char *v150;
  const char *Name;
  const char *v152;
  const char *v153;
  void *v154;
  void *v155;
  NSMutableDictionary *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  id obj;
  id obja;
  id objb;
  id objc;
  NSMutableDictionary *objd;
  NSMutableDictionary *v168;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _QWORD v174[5];
  uint64_t v175;
  uint64_t *v176;
  uint64_t v177;
  uint64_t (*v178)(uint64_t, uint64_t);
  void (*v179)(uint64_t);
  id v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  uint8_t v197[128];
  uint8_t buf[4];
  int v199;
  __int16 v200;
  const char *v201;
  __int16 v202;
  const char *v203;
  __int16 v204;
  int v205;
  __int16 v206;
  NSMutableDictionary *v207;
  __int16 v208;
  void *v209;
  _BYTE v210[128];
  _BYTE v211[128];
  _BYTE v212[128];
  _BYTE v213[128];

  v159 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "dictionaryForKey:", CFSTR("eSEExpressConfig")));
  v158 = v3;
  if (v3)
  {
    v168 = (NSMutableDictionary *)objc_msgSend(v3, "mutableCopy");
    if (v168)
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
        v9 = 45;
        if (isMetaClass)
          v9 = 43;
        v6(6, "%c[%{public}s %{public}s]:%i new style express config: %{public}@", v9, ClassName, Name, 399, v168);
      }
      v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v11 = NFSharedLogGetLogger(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = object_getClass(self);
        if (class_isMetaClass(v13))
          v14 = 43;
        else
          v14 = 45;
        *(_DWORD *)buf = 67110146;
        v199 = v14;
        v200 = 2082;
        v201 = object_getClassName(self);
        v202 = 2082;
        v203 = sel_getName(a2);
        v204 = 1024;
        v205 = 399;
        v206 = 2114;
        v207 = v168;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i new style express config: %{public}@", buf, 0x2Cu);
      }

      objc_msgSend(v159, "removeObjectForKey:", CFSTR("eSEExpressConfig"));
LABEL_147:
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfig arrayConfigFromDictionary:](self, "arrayConfigFromDictionary:", v168));
      goto LABEL_148;
    }
  }
  v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "objectForKey:", CFSTR("ExpressTransitIdentifiers")));
  v156 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "objectForKey:", CFSTR("ExpressTransitIdentifier")));
  v168 = objc_opt_new(NSMutableDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "secureElementWrapper"));

  if (v157)
  {
    if ((objc_msgSend(v157, "supportedTechnologies") & 4) != 0)
    {
      if (v160)
      {
        v195 = 0u;
        v196 = 0u;
        v193 = 0u;
        v194 = 0u;
        obj = v160;
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v193, v213, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v194;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(_QWORD *)v194 != v17)
                objc_enumerationMutation(obj);
              v19 = *(NSMutableDictionary **)(*((_QWORD *)&v193 + 1) + 8 * (_QWORD)i);
              v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v20);
              if (v21)
              {
                v22 = object_getClass(self);
                if (class_isMetaClass(v22))
                  v23 = 43;
                else
                  v23 = 45;
                v24 = object_getClassName(self);
                v25 = sel_getName(a2);
                v21(6, "%c[%{public}s %{public}s]:%i Adding Express Transit: %{public}@", v23, v24, v25, 424, v19);
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
                *(_DWORD *)buf = 67110146;
                v199 = v30;
                v200 = 2082;
                v201 = v31;
                v202 = 2082;
                v203 = v32;
                v204 = 1024;
                v205 = 424;
                v206 = 2114;
                v207 = v19;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Adding Express Transit: %{public}@", buf, 0x2Cu);
              }

              v33 = objc_opt_new(NSMutableDictionary);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", CFSTR("Suica"), CFSTR("ExpressType"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v168, "setObject:forKeyedSubscript:", v33, v19);

            }
            v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v193, v213, 16);
          }
          while (v16);
        }

        objc_msgSend(v159, "removeObjectForKey:", CFSTR("ExpressTransitIdentifiers"));
      }
      else if (v156)
      {
        v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v48 = NFLogGetLogger(v47);
        if (v48)
        {
          v49 = (void (*)(uint64_t, const char *, ...))v48;
          v50 = object_getClass(self);
          v51 = class_isMetaClass(v50);
          v150 = object_getClassName(self);
          v153 = sel_getName(a2);
          v52 = 45;
          if (v51)
            v52 = 43;
          v49(6, "%c[%{public}s %{public}s]:%i Express Transit aid: %{public}@", v52, v150, v153, 434, v156);
        }
        v53 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v54 = NFSharedLogGetLogger(v53);
        v55 = objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = object_getClass(self);
          if (class_isMetaClass(v56))
            v57 = 43;
          else
            v57 = 45;
          *(_DWORD *)buf = 67110146;
          v199 = v57;
          v200 = 2082;
          v201 = object_getClassName(self);
          v202 = 2082;
          v203 = sel_getName(a2);
          v204 = 1024;
          v205 = 434;
          v206 = 2114;
          v207 = v156;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Express Transit aid: %{public}@", buf, 0x2Cu);
        }

        v58 = objc_opt_new(NSMutableDictionary);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v58, "setObject:forKeyedSubscript:", CFSTR("Suica"), CFSTR("ExpressType"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v168, "setObject:forKeyedSubscript:", v58, v156);
        objc_msgSend(v159, "removeObjectForKey:", CFSTR("ExpressTransitIdentifier"));

      }
    }
    v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "objectForKey:", CFSTR("ExpressAccessIdentifiers")));

    if (v154)
    {
      v191 = 0u;
      v192 = 0u;
      v189 = 0u;
      v190 = 0u;
      obja = v154;
      v59 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v189, v212, 16);
      if (v59)
      {
        v60 = *(_QWORD *)v190;
        do
        {
          for (j = 0; j != v59; j = (char *)j + 1)
          {
            if (*(_QWORD *)v190 != v60)
              objc_enumerationMutation(obja);
            v62 = *(NSMutableDictionary **)(*((_QWORD *)&v189 + 1) + 8 * (_QWORD)j);
            v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v64 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v63);
            if (v64)
            {
              v65 = object_getClass(self);
              if (class_isMetaClass(v65))
                v66 = 43;
              else
                v66 = 45;
              v67 = object_getClassName(self);
              v68 = sel_getName(a2);
              v64(6, "%c[%{public}s %{public}s]:%i Adding Express Access aid: %{public}@", v66, v67, v68, 448, v62);
            }
            v69 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v70 = NFSharedLogGetLogger(v69);
            v71 = objc_claimAutoreleasedReturnValue(v70);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              v72 = object_getClass(self);
              if (class_isMetaClass(v72))
                v73 = 43;
              else
                v73 = 45;
              v74 = object_getClassName(self);
              v75 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v199 = v73;
              v200 = 2082;
              v201 = v74;
              v202 = 2082;
              v203 = v75;
              v204 = 1024;
              v205 = 448;
              v206 = 2114;
              v207 = v62;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Adding Express Access aid: %{public}@", buf, 0x2Cu);
            }

            v76 = objc_opt_new(NSMutableDictionary);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v76, "setObject:forKeyedSubscript:", CFSTR("ECP1.Access"), CFSTR("ExpressType"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v168, "setObject:forKeyedSubscript:", v76, v62);

          }
          v59 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v189, v212, 16);
        }
        while (v59);
      }

      objc_msgSend(v159, "removeObjectForKey:", CFSTR("ExpressAccessIdentifiers"));
    }
    v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "objectForKey:", CFSTR("ExpressGenericAIdentifiers")));

    if (v161)
    {
      v187 = 0u;
      v188 = 0u;
      v185 = 0u;
      v186 = 0u;
      objb = v161;
      v77 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v185, v211, 16);
      if (v77)
      {
        v78 = *(_QWORD *)v186;
        do
        {
          for (k = 0; k != v77; k = (char *)k + 1)
          {
            if (*(_QWORD *)v186 != v78)
              objc_enumerationMutation(objb);
            v80 = *(NSMutableDictionary **)(*((_QWORD *)&v185 + 1) + 8 * (_QWORD)k);
            v81 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v82 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v81);
            if (v82)
            {
              v83 = object_getClass(self);
              if (class_isMetaClass(v83))
                v84 = 43;
              else
                v84 = 45;
              v85 = object_getClassName(self);
              v86 = sel_getName(a2);
              v82(6, "%c[%{public}s %{public}s]:%i Adding Express Generic-A aid: %{public}@", v84, v85, v86, 462, v80);
            }
            v87 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v88 = NFSharedLogGetLogger(v87);
            v89 = objc_claimAutoreleasedReturnValue(v88);
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              v90 = object_getClass(self);
              if (class_isMetaClass(v90))
                v91 = 43;
              else
                v91 = 45;
              v92 = object_getClassName(self);
              v93 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v199 = v91;
              v200 = 2082;
              v201 = v92;
              v202 = 2082;
              v203 = v93;
              v204 = 1024;
              v205 = 462;
              v206 = 2114;
              v207 = v80;
              _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Adding Express Generic-A aid: %{public}@", buf, 0x2Cu);
            }

            v94 = objc_opt_new(NSMutableDictionary);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v94, "setObject:forKeyedSubscript:", CFSTR("GenericA"), CFSTR("ExpressType"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v168, "setObject:forKeyedSubscript:", v94, v80);

          }
          v77 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v185, v211, 16);
        }
        while (v77);
      }

      objc_msgSend(v159, "removeObjectForKey:", CFSTR("ExpressGenericAIdentifiers"));
    }
    v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "objectForKey:", CFSTR("ExpressECP2Identifiers")));

    if (v155)
    {
      v183 = 0u;
      v184 = 0u;
      v181 = 0u;
      v182 = 0u;
      objc = v155;
      v95 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v181, v210, 16);
      if (v95)
      {
        v96 = *(_QWORD *)v182;
        do
        {
          for (m = 0; m != v95; m = (char *)m + 1)
          {
            if (*(_QWORD *)v182 != v96)
              objc_enumerationMutation(objc);
            v98 = *(NSMutableDictionary **)(*((_QWORD *)&v181 + 1) + 8 * (_QWORD)m);
            v99 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v100 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v99);
            if (v100)
            {
              v101 = object_getClass(self);
              if (class_isMetaClass(v101))
                v102 = 43;
              else
                v102 = 45;
              v103 = object_getClassName(self);
              v104 = sel_getName(a2);
              v100(6, "%c[%{public}s %{public}s]:%i Adding Express ECP2.0 aid: %{public}@", v102, v103, v104, 476, v98);
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
              *(_DWORD *)buf = 67110146;
              v199 = v109;
              v200 = 2082;
              v201 = v110;
              v202 = 2082;
              v203 = v111;
              v204 = 1024;
              v205 = 476;
              v206 = 2114;
              v207 = v98;
              _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Adding Express ECP2.0 aid: %{public}@", buf, 0x2Cu);
            }

            v112 = objc_opt_new(NSMutableDictionary);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", CFSTR("ECP2"), CFSTR("ExpressType"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v168, "setObject:forKeyedSubscript:", v112, v98);

          }
          v95 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v181, v210, 16);
        }
        while (v95);
      }

      objc_msgSend(v159, "removeObjectForKey:", CFSTR("ExpressECP2Identifiers"));
    }
    objd = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "objectForKey:", CFSTR("ExpressAppletTCIs")));
    if (objd)
    {
      if ((objc_msgSend(v159, "BOOLForKey:", CFSTR("Migrated49292960")) & 1) != 0)
      {
        objc_msgSend(v159, "removeObjectForKey:", CFSTR("Migrated49292960"));
      }
      else
      {
        v175 = 0;
        v176 = &v175;
        v177 = 0x3032000000;
        v178 = sub_100021228;
        v179 = sub_100021238;
        v180 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSMutableDictionary count](objd, "count"));
        v174[0] = _NSConcreteStackBlock;
        v174[1] = 3221225472;
        v174[2] = sub_100021240;
        v174[3] = &unk_1002E5120;
        v174[4] = &v175;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](objd, "enumerateKeysAndObjectsUsingBlock:", v174);
        v113 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v114 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v113);
        if (v114)
        {
          v115 = object_getClass(self);
          if (class_isMetaClass(v115))
            v116 = 43;
          else
            v116 = 45;
          v117 = object_getClassName(self);
          v118 = sel_getName(a2);
          v114(4, "%c[%{public}s %{public}s]:%i Migrated %{public}@ --> %{public}@", v116, v117, v118, 501, objd, v176[5]);
        }
        v119 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v120 = NFSharedLogGetLogger(v119);
        v121 = objc_claimAutoreleasedReturnValue(v120);
        if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        {
          v122 = object_getClass(self);
          if (class_isMetaClass(v122))
            v123 = 43;
          else
            v123 = 45;
          v124 = object_getClassName(self);
          v125 = sel_getName(a2);
          v126 = (void *)v176[5];
          *(_DWORD *)buf = 67110402;
          v199 = v123;
          v200 = 2082;
          v201 = v124;
          v202 = 2082;
          v203 = v125;
          v204 = 1024;
          v205 = 501;
          v206 = 2114;
          v207 = objd;
          v208 = 2114;
          v209 = v126;
          _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Migrated %{public}@ --> %{public}@", buf, 0x36u);
        }

        v127 = (NSMutableDictionary *)(id)v176[5];
        _Block_object_dispose(&v175, 8);

        objd = v127;
      }
      v172 = 0u;
      v173 = 0u;
      v170 = 0u;
      v171 = 0u;
      v162 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v168, "allKeys"));
      v128 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v170, v197, 16);
      if (v128)
      {
        v129 = *(_QWORD *)v171;
        do
        {
          for (n = 0; n != v128; n = (char *)n + 1)
          {
            if (*(_QWORD *)v171 != v129)
              objc_enumerationMutation(v162);
            v131 = *(NSMutableDictionary **)(*((_QWORD *)&v170 + 1) + 8 * (_QWORD)n);
            v132 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](objd, "objectForKey:", v131));
            if (v132)
            {
              v133 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v134 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v133);
              if (v134)
              {
                v135 = object_getClass(self);
                if (class_isMetaClass(v135))
                  v136 = 43;
                else
                  v136 = 45;
                v137 = object_getClassName(self);
                v138 = sel_getName(a2);
                v134(6, "%c[%{public}s %{public}s]:%i %{public}@ --> TCIs: %{public}@", v136, v137, v138, 512, v131, v132);
              }
              v139 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v140 = NFSharedLogGetLogger(v139);
              v141 = objc_claimAutoreleasedReturnValue(v140);
              if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
              {
                v142 = object_getClass(self);
                if (class_isMetaClass(v142))
                  v143 = 43;
                else
                  v143 = 45;
                v144 = object_getClassName(self);
                v145 = sel_getName(a2);
                *(_DWORD *)buf = 67110402;
                v199 = v143;
                v200 = 2082;
                v201 = v144;
                v202 = 2082;
                v203 = v145;
                v204 = 1024;
                v205 = 512;
                v206 = 2114;
                v207 = v131;
                v208 = 2114;
                v209 = v132;
                _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ --> TCIs: %{public}@", buf, 0x36u);
              }

              v146 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v168, "objectForKeyedSubscript:", v131));
              v147 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v132);
              objc_msgSend(v146, "setObject:forKeyedSubscript:", v147, CFSTR("ECP2Info"));

            }
          }
          v128 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v170, v197, 16);
        }
        while (v128);
      }

      objc_msgSend(v159, "removeObjectForKey:", CFSTR("ExpressAppletTCIs"));
    }

    goto LABEL_147;
  }
  v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v35 = NFLogGetLogger(v34);
  if (v35)
  {
    v36 = (void (*)(uint64_t, const char *, ...))v35;
    v37 = object_getClass(self);
    v38 = class_isMetaClass(v37);
    v39 = object_getClassName(self);
    v152 = sel_getName(a2);
    v40 = 45;
    if (v38)
      v40 = 43;
    v36(3, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", v40, v39, v152, 413);
  }
  v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v42 = NFSharedLogGetLogger(v41);
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    v44 = object_getClass(self);
    if (class_isMetaClass(v44))
      v45 = 43;
    else
      v45 = 45;
    *(_DWORD *)buf = 67109890;
    v199 = v45;
    v200 = 2082;
    v201 = object_getClassName(self);
    v202 = 2082;
    v203 = sel_getName(a2);
    v204 = 1024;
    v205 = 413;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", buf, 0x22u);
  }

  v46 = 0;
LABEL_148:

  return v46;
}

- (id)extractConfigFrom:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *i;
  void *v16;
  void *v17;
  unsigned int v18;
  id v20;
  void *v21;
  unsigned int v22;
  BOOL v23;
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
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  _BOOL4 v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  NSMutableArray *v51;
  const char *Name;
  const char *v54;
  id v55;
  char v56;
  NFExpressConfigESE *v58;
  NSMutableArray *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  int v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  int v72;

  v4 = a3;
  v58 = self;
  -[NFExpressConfig dumpConfig:logLevel:prefix:](self, "dumpConfig:logLevel:prefix:", v4, 8, CFSTR("expressConfig"));
  v5 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "secureElementWrapper"));

  if (v7)
  {
    v8 = objc_msgSend(v7, "supportedTechnologies");
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    if (v10)
    {
      v11 = v10;
      v55 = v4;
      v59 = v5;
      v56 = 0;
      v12 = *(_QWORD *)v61;
      v13 = v8 & 4;
      do
      {
        v14 = v9;
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v61 != v12)
            objc_enumerationMutation(v14);
          v16 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ExpressType")));
          v18 = +[NFExpressConfig expressTypeForATLConfigKey:](NFExpressConfig, "expressTypeForATLConfigKey:", v17);

          if (v18 != 1 || v13 != 0)
          {
            v20 = objc_msgSend(v16, "mutableCopy");
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("expressEnabled")));
            v22 = objc_msgSend(v21, "BOOLValue");

            if (v22)
              v23 = v18 == 6;
            else
              v23 = 0;
            if (v23)
            {
              specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              Logger = NFLogGetLogger(specific);
              if (Logger)
              {
                v26 = (void (*)(uint64_t, const char *, ...))Logger;
                Class = object_getClass(v58);
                isMetaClass = class_isMetaClass(Class);
                ClassName = object_getClassName(v58);
                Name = sel_getName(a2);
                v30 = 45;
                if (isMetaClass)
                  v30 = 43;
                v26(4, "%c[%{public}s %{public}s]:%i Overriding SinglePoll with GenericA mode express", v30, ClassName, Name, 566);
              }
              v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v32 = NFSharedLogGetLogger(v31);
              v33 = objc_claimAutoreleasedReturnValue(v32);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                v34 = object_getClass(v58);
                if (class_isMetaClass(v34))
                  v35 = 43;
                else
                  v35 = 45;
                v36 = object_getClassName(v58);
                v37 = sel_getName(a2);
                *(_DWORD *)buf = 67109890;
                v66 = v35;
                v67 = 2082;
                v68 = v36;
                v69 = 2082;
                v70 = v37;
                v71 = 1024;
                v72 = 566;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Overriding SinglePoll with GenericA mode express", buf, 0x22u);
              }

              objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("GenericA"), CFSTR("ExpressType"));
              v56 = 1;
            }
            -[NSMutableArray addObject:](v59, "addObject:", v20);

          }
        }
        v9 = v14;
        v11 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      }
      while (v11);

      if ((v56 & 1) != 0)
        v38 = 4;
      else
        v38 = 8;
      v4 = v55;
      v5 = v59;
    }
    else
    {

      v38 = 8;
    }
    -[NFExpressConfig dumpConfig:logLevel:prefix:](v58, "dumpConfig:logLevel:prefix:", v5, v38, CFSTR("new config"));
    v51 = v5;
  }
  else
  {
    v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v40 = NFLogGetLogger(v39);
    if (v40)
    {
      v41 = (void (*)(uint64_t, const char *, ...))v40;
      v42 = object_getClass(v58);
      v43 = class_isMetaClass(v42);
      v44 = object_getClassName(v58);
      v54 = sel_getName(a2);
      v45 = 45;
      if (v43)
        v45 = 43;
      v41(3, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", v45, v44, v54, 543);
    }
    v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v47 = NFSharedLogGetLogger(v46);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = object_getClass(v58);
      if (class_isMetaClass(v49))
        v50 = 43;
      else
        v50 = 45;
      *(_DWORD *)buf = 67109890;
      v66 = v50;
      v67 = 2082;
      v68 = object_getClassName(v58);
      v69 = 2082;
      v70 = sel_getName(a2);
      v71 = 1024;
      v72 = 543;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", buf, 0x22u);
    }

    v51 = 0;
  }

  return v51;
}

- (id)disableExpressForKeys:(id)a3 onApplet:(id)a4
{
  id v7;
  id v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  _BOOL4 v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  objc_class *v46;
  int v47;
  const char *v48;
  const char *v49;
  void *v50;
  id v51;
  id v52;
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
  const char *v66;
  id v67;
  uint64_t v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  const char *v75;
  const char *v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _QWORD v86[5];
  _QWORD v87[5];
  uint8_t buf[4];
  int v89;
  __int16 v90;
  const char *v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  int v95;
  __int16 v96;
  id v97;
  __int16 v98;
  void *v99;

  v7 = a3;
  v8 = a4;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v17 = 45;
    if (isMetaClass)
      v17 = 43;
    v11(6, "%c[%{public}s %{public}s]:%i keys:%{public}@ applet:%{public}@", v17, ClassName, Name, 774, v7, v16);

  }
  v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v19 = NFSharedLogGetLogger(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = object_getClass(self);
    if (class_isMetaClass(v21))
      v22 = 43;
    else
      v22 = 45;
    v23 = object_getClassName(self);
    v24 = sel_getName(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    *(_DWORD *)buf = 67110402;
    v89 = v22;
    v90 = 2082;
    v91 = v23;
    v92 = 2082;
    v93 = v24;
    v94 = 1024;
    v95 = 774;
    v96 = 2114;
    v97 = v7;
    v98 = 2114;
    v99 = v25;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i keys:%{public}@ applet:%{public}@", buf, 0x36u);

  }
  v26 = objc_claimAutoreleasedReturnValue(-[NFExpressConfigESE getSecureElementWrapperAndSetRouting](self, "getSecureElementWrapperAndSetRouting"));
  v27 = (void *)v26;
  if (v26)
  {
    v77 = (void *)v26;
    v80 = v8;
    v79 = objc_alloc_init((Class)NSMutableArray);
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v78 = v7;
    v28 = v7;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
    if (!v29)
      goto LABEL_31;
    v30 = v29;
    v31 = *(_QWORD *)v82;
    while (1)
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(_QWORD *)v82 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i);
        v34 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0)
        {
          if (!objc_msgSend(v33, "length"))
            continue;
          v35 = objc_alloc_init((Class)NSMutableDictionary);
          -[NSObject setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v33, CFSTR("keyIdentifier"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "identifier"));
          -[NSObject setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v36, CFSTR("appletIdentifier"));

          objc_msgSend(v79, "addObject:", v35);
        }
        else
        {
          v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v38 = NFLogGetLogger(v37);
          if (v38)
          {
            v39 = (void (*)(uint64_t, const char *, ...))v38;
            v40 = object_getClass(self);
            v41 = class_isMetaClass(v40);
            v42 = object_getClassName(self);
            v75 = sel_getName(a2);
            v43 = 45;
            if (v41)
              v43 = 43;
            v39(3, "%c[%{public}s %{public}s]:%i Invalid key type.", v43, v42, v75, 786);
          }
          v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v45 = NFSharedLogGetLogger(v44);
          v35 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v46 = object_getClass(self);
            if (class_isMetaClass(v46))
              v47 = 43;
            else
              v47 = 45;
            v48 = object_getClassName(self);
            v49 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v89 = v47;
            v90 = 2082;
            v91 = v48;
            v92 = 2082;
            v93 = v49;
            v94 = 1024;
            v95 = 786;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid key type.", buf, 0x22u);
          }
        }

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
      if (!v30)
      {
LABEL_31:

        v50 = v79;
        if (objc_msgSend(v79, "count"))
        {
          v8 = v80;
          v51 = sub_1000217DC(self, v79, v80, 0, 0, 0xFFFFFFFF);
          v52 = (id)objc_claimAutoreleasedReturnValue(v51);
          v7 = v78;
        }
        else
        {
          v52 = 0;
          v7 = v78;
          v8 = v80;
        }
        v27 = v77;
        goto LABEL_45;
      }
    }
  }
  v53 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v54 = NFLogGetLogger(v53);
  if (v54)
  {
    v55 = (void (*)(uint64_t, const char *, ...))v54;
    v56 = object_getClass(self);
    v57 = class_isMetaClass(v56);
    v58 = object_getClassName(self);
    v76 = sel_getName(a2);
    v59 = 45;
    if (v57)
      v59 = 43;
    v55(3, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", v59, v58, v76, 778);
  }
  v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v61 = NFSharedLogGetLogger(v60);
  v62 = objc_claimAutoreleasedReturnValue(v61);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
  {
    v63 = object_getClass(self);
    if (class_isMetaClass(v63))
      v64 = 43;
    else
      v64 = 45;
    v65 = object_getClassName(self);
    v66 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v89 = v64;
    v90 = 2082;
    v91 = v65;
    v92 = 2082;
    v93 = v66;
    v94 = 1024;
    v95 = 778;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", buf, 0x22u);
  }

  v67 = objc_alloc((Class)NSError);
  v68 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v86[0] = NSLocalizedDescriptionKey;
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
  v87[0] = v69;
  v87[1] = &off_1002FD698;
  v86[1] = CFSTR("Line");
  v86[2] = CFSTR("Method");
  v70 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v87[2] = v70;
  v86[3] = NSDebugDescriptionErrorKey;
  v71 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 779);
  v87[3] = v71;
  v86[4] = NSLocalizedFailureReasonErrorKey;
  v50 = (void *)v68;
  v72 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to initialize eSE wrapper"));
  v87[4] = v72;
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v87, v86, 5));
  v52 = objc_msgSend(v67, "initWithDomain:code:userInfo:", v50, 15, v73);

LABEL_45:
  return v52;
}

- (id)updateExpressConfigLimitedTo:(id)a3 andActivate:(BOOL)a4 hasChanged:(BOOL *)a5
{
  NSObject *v9;
  NSMutableArray *passes;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
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
  NSMutableArray *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void (*v48)(uint64_t, const char *, ...);
  objc_class *v49;
  _BOOL4 v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  objc_class *v55;
  int v56;
  const char *v57;
  const char *v58;
  void *v59;
  uint64_t v60;
  void (*v61)(uint64_t, const char *, ...);
  objc_class *v62;
  _BOOL4 v63;
  const char *v64;
  const char *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  objc_class *v71;
  int v72;
  const char *v73;
  const char *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void (*v78)(uint64_t, const char *, ...);
  objc_class *v79;
  _BOOL4 v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  objc_class *v84;
  int v85;
  const char *v86;
  const char *v87;
  void *v88;
  uint64_t v89;
  void (*v90)(uint64_t, const char *, ...);
  objc_class *v91;
  _BOOL4 v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  NSObject *v96;
  objc_class *v97;
  int v98;
  const char *v99;
  const char *v100;
  void *v101;
  uint64_t v102;
  void (*v103)(uint64_t, const char *, ...);
  objc_class *v104;
  _BOOL4 v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  NSObject *v109;
  objc_class *v110;
  int v111;
  const char *v112;
  const char *v113;
  id v114;
  NSObject *v115;
  id v116;
  NSMutableArray *v117;
  void *v118;
  id v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  NSObject *v124;
  id v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  void *i;
  __CFString *v130;
  id v131;
  void *v132;
  void *v133;
  unsigned int v134;
  void *specific;
  uint64_t Logger;
  void (*v137)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  objc_class *v144;
  int v145;
  NSObject *v146;
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
  const char *v159;
  const char *v160;
  NSMutableArray *v161;
  uint64_t v162;
  NSObject *v163;
  void *v164;
  uint64_t v165;
  void (*v166)(uint64_t, const char *, ...);
  objc_class *v167;
  _BOOL4 v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  objc_class *v174;
  int v175;
  const char *v176;
  const char *v177;
  void *v178;
  uint64_t v179;
  void (*v180)(uint64_t, const char *, ...);
  objc_class *v181;
  _BOOL4 v182;
  uint64_t v183;
  void *v184;
  uint64_t v185;
  NSObject *v186;
  objc_class *v187;
  int v188;
  const char *v189;
  const char *v190;
  const char *v191;
  void *v192;
  uint64_t v193;
  void (*v194)(uint64_t, const char *, ...);
  objc_class *v195;
  _BOOL4 v196;
  const char *v197;
  const char *v198;
  id v199;
  const __CFString *v200;
  uint64_t v201;
  void *v202;
  uint64_t v203;
  NSObject *v204;
  objc_class *v205;
  int v206;
  const char *v207;
  const char *v208;
  id v209;
  const __CFString *v210;
  void *v211;
  uint64_t v212;
  void (*v213)(uint64_t, const char *, ...);
  objc_class *v214;
  _BOOL4 v215;
  uint64_t v216;
  void *v217;
  uint64_t v218;
  objc_class *v219;
  int v220;
  const char *v221;
  const char *v222;
  NSMutableArray *v223;
  NSMutableArray *v224;
  uint64_t v225;
  uint64_t v226;
  NSObject *v227;
  uint64_t v228;
  void *v229;
  unint64_t v230;
  uint64_t v231;
  void *v232;
  id v233;
  id v234;
  uint64_t v235;
  uint64_t v236;
  NSObject *v237;
  void *v238;
  uint64_t v239;
  void (*v240)(uint64_t, const char *, ...);
  objc_class *v241;
  _BOOL4 v242;
  const char *v243;
  uint64_t v244;
  void *v245;
  uint64_t v246;
  NSObject *v247;
  objc_class *v248;
  int v249;
  const char *v250;
  const char *v251;
  id v252;
  void *v253;
  id v254;
  id v255;
  id v256;
  void *v257;
  const char *v259;
  const char *v260;
  const char *v261;
  const char *v262;
  const char *v263;
  const char *v264;
  const char *v265;
  const char *v266;
  const char *v267;
  const char *v268;
  const char *v269;
  const char *v270;
  const char *v271;
  const char *Name;
  const char *v273;
  const char *v274;
  const char *v275;
  const char *v276;
  const char *v277;
  const __CFString *v278;
  BOOL *v279;
  BOOL v280;
  NSObject *v281;
  NSObject *v282;
  NSMutableArray *v283;
  const char *sel;
  NSMutableArray *obj;
  id obja;
  NSObject *v287;
  SEL v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  _QWORD v297[5];
  _QWORD v298[5];
  uint8_t v299[128];
  uint8_t v300[4];
  int v301;
  __int16 v302;
  const char *v303;
  __int16 v304;
  const char *v305;
  __int16 v306;
  int v307;
  __int16 v308;
  const __CFString *v309;
  __int16 v310;
  int v311;
  uint8_t buf[4];
  int v313;
  __int16 v314;
  const char *v315;
  __int16 v316;
  const char *v317;
  __int16 v318;
  int v319;
  __int16 v320;
  void *v321;

  v9 = a3;
  if (!-[NFExpressConfig isSEOperational](self, "isSEOperational"))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v137 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v141 = 45;
      if (isMetaClass)
        v141 = 43;
      v137(4, "%c[%{public}s %{public}s]:%i eSE is not in operational mode", v141, ClassName, Name, 823);
    }
    v142 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v143 = NFSharedLogGetLogger(v142);
    v115 = objc_claimAutoreleasedReturnValue(v143);
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
    {
      v144 = object_getClass(self);
      if (class_isMetaClass(v144))
        v145 = 43;
      else
        v145 = 45;
      *(_DWORD *)buf = 67109890;
      v313 = v145;
      v314 = 2082;
      v315 = object_getClassName(self);
      v316 = 2082;
      v317 = sel_getName(a2);
      v318 = 1024;
      v319 = 823;
      _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i eSE is not in operational mode", buf, 0x22u);
    }
    v146 = 0;
    goto LABEL_204;
  }
  if (self)
    passes = self->super._passes;
  else
    passes = 0;
  v11 = passes;

  if (v11)
  {
    v13 = NFSharedSignpostLog(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_UPDATE_ESE_APPLETS", "begin", buf, 2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v16 = objc_msgSend(v15, "nfcRadioEnabled:showUIPopup:", 0, 0);

    if (!v16)
    {
      v147 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v148 = NFLogGetLogger(v147);
      if (v148)
      {
        v149 = (void (*)(uint64_t, const char *, ...))v148;
        v150 = object_getClass(self);
        v151 = class_isMetaClass(v150);
        v152 = object_getClassName(self);
        v273 = sel_getName(a2);
        v153 = 45;
        if (v151)
          v153 = 43;
        v149(6, "%c[%{public}s %{public}s]:%i NFC radio disabled - use empty config", v153, v152, v273, 838);
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
        v159 = object_getClassName(self);
        v160 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v313 = v158;
        v314 = 2082;
        v315 = v159;
        v316 = 2082;
        v317 = v160;
        v318 = 1024;
        v319 = 838;
        _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC radio disabled - use empty config", buf, 0x22u);
      }

      v161 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v115 = v9;
      v9 = 0;
      goto LABEL_181;
    }
    v18 = NFSharedSignpostLog(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_UPDATE_ESE_APPLETS", "validating", buf, 2u);
    }

    v287 = objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
    v281 = v9;
    v283 = objc_opt_new(NSMutableArray);
    v289 = 0u;
    v290 = 0u;
    v291 = 0u;
    v292 = 0u;
    v280 = a4;
    v279 = a5;
    if (self)
      v20 = self->super._passes;
    else
      v20 = 0;
    obj = v20;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v289, v299, 16);
    sel = a2;
    if (v21)
    {
      v22 = v21;
      v288 = *(SEL *)v290;
      do
      {
        v23 = 0;
        do
        {
          if (*(SEL *)v290 != v288)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v289 + 1) + 8 * (_QWORD)v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("appletIdentifier")));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("expressEnabled")));
          v27 = objc_msgSend(v26, "BOOLValue");

          v28 = sub_10001DB2C(self, v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
          v30 = v29;
          if (!v29)
          {
            v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v47 = NFLogGetLogger(v46);
            if (v47)
            {
              v48 = (void (*)(uint64_t, const char *, ...))v47;
              v49 = object_getClass(self);
              v50 = class_isMetaClass(v49);
              v260 = object_getClassName(self);
              v268 = sel_getName(a2);
              v51 = 45;
              if (v50)
                v51 = 43;
              v48(3, "%c[%{public}s %{public}s]:%i Could not find %{public}@ on eSE", v51, v260, v268, 858, v25);
            }
            v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v53 = NFSharedLogGetLogger(v52);
            v54 = objc_claimAutoreleasedReturnValue(v53);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              v55 = object_getClass(self);
              if (class_isMetaClass(v55))
                v56 = 43;
              else
                v56 = 45;
              v57 = object_getClassName(self);
              v58 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v313 = v56;
              v314 = 2082;
              v315 = v57;
              v316 = 2082;
              v317 = v58;
              v318 = 1024;
              v319 = 858;
              v320 = 2114;
              v321 = v25;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not find %{public}@ on eSE", buf, 0x2Cu);
            }

            v44 = (NSMutableArray *)v287;
            v45 = v25;
            goto LABEL_40;
          }
          if (objc_msgSend(v29, "lifecycleState") == 129
            || objc_msgSend(v30, "lifecycleState") == 130)
          {
            v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v32 = NFLogGetLogger(v31);
            if (v32)
            {
              v33 = (void (*)(uint64_t, const char *, ...))v32;
              v34 = object_getClass(self);
              v35 = class_isMetaClass(v34);
              v259 = object_getClassName(self);
              v267 = sel_getName(a2);
              v36 = 45;
              if (v35)
                v36 = 43;
              v33(6, "%c[%{public}s %{public}s]:%i Applet %{public}@ is terminated/frozen; remove from express mode",
                v36,
                v259,
                v267,
                863,
                v25);
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
              v43 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v313 = v41;
              v314 = 2082;
              v315 = v42;
              v316 = 2082;
              v317 = v43;
              v318 = 1024;
              v319 = 863;
              v320 = 2114;
              v321 = v25;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Applet %{public}@ is terminated/frozen; remove from express mode",
                buf,
                0x2Cu);
            }

            v44 = (NSMutableArray *)v287;
            v45 = v30;
LABEL_40:
            -[NSMutableArray addObject:](v44, "addObject:", v45);
            goto LABEL_41;
          }
          if ((v27 & 1) == 0)
          {
            v76 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v77 = NFLogGetLogger(v76);
            if (v77)
            {
              v78 = (void (*)(uint64_t, const char *, ...))v77;
              v79 = object_getClass(self);
              v80 = class_isMetaClass(v79);
              v261 = object_getClassName(self);
              v269 = sel_getName(a2);
              v81 = 45;
              if (v80)
                v81 = 43;
              v78(6, "%c[%{public}s %{public}s]:%i @applet %{public}@ is not in express. ATL to handle this going forward", v81, v261, v269, 867, v25);
            }
            v82 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v83 = NFSharedLogGetLogger(v82);
            v70 = objc_claimAutoreleasedReturnValue(v83);
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
            {
              v84 = object_getClass(self);
              if (class_isMetaClass(v84))
                v85 = 43;
              else
                v85 = 45;
              v86 = object_getClassName(self);
              v87 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v313 = v85;
              v314 = 2082;
              v315 = v86;
              v316 = 2082;
              v317 = v87;
              v318 = 1024;
              v319 = 867;
              v320 = 2114;
              v321 = v25;
              _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i @applet %{public}@ is not in express. ATL to handle this going forward", buf, 0x2Cu);
            }
            goto LABEL_63;
          }
          if (objc_msgSend(v30, "authTransientSupport"))
          {
            v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v60 = NFLogGetLogger(v59);
            if (v60)
            {
              v61 = (void (*)(uint64_t, const char *, ...))v60;
              v62 = object_getClass(self);
              v63 = class_isMetaClass(v62);
              v64 = object_getClassName(self);
              v65 = sel_getName(a2);
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
              v67 = 45;
              if (v63)
                v67 = 43;
              v61(4, "%c[%{public}s %{public}s]:%i Applet %{public}@ requires authorization and is invalid for express", v67, v64, v65, 870, v66);

              a2 = sel;
            }
            v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v69 = NFSharedLogGetLogger(v68);
            v70 = objc_claimAutoreleasedReturnValue(v69);
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              v71 = object_getClass(self);
              if (class_isMetaClass(v71))
                v72 = 43;
              else
                v72 = 45;
              v73 = object_getClassName(self);
              v74 = sel_getName(sel);
              v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
              *(_DWORD *)buf = 67110146;
              v313 = v72;
              a2 = sel;
              v314 = 2082;
              v315 = v73;
              v316 = 2082;
              v317 = v74;
              v318 = 1024;
              v319 = 870;
              v320 = 2114;
              v321 = v75;
              _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Applet %{public}@ requires authorization and is invalid for express", buf, 0x2Cu);

            }
LABEL_63:

            goto LABEL_41;
          }
          if (objc_msgSend(v30, "isGPLocked"))
          {
            v88 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v89 = NFLogGetLogger(v88);
            if (v89)
            {
              v90 = (void (*)(uint64_t, const char *, ...))v89;
              v91 = object_getClass(self);
              v92 = class_isMetaClass(v91);
              v262 = object_getClassName(self);
              v270 = sel_getName(a2);
              v93 = 45;
              if (v92)
                v93 = 43;
              v90(4, "%c[%{public}s %{public}s]:%i @applet %{public}@ is in GP locked state", v93, v262, v270, 873, v25);
            }
            v94 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v95 = NFSharedLogGetLogger(v94);
            v96 = objc_claimAutoreleasedReturnValue(v95);
            if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
            {
              v97 = object_getClass(self);
              if (class_isMetaClass(v97))
                v98 = 43;
              else
                v98 = 45;
              v99 = object_getClassName(self);
              v100 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v313 = v98;
              v314 = 2082;
              v315 = v99;
              v316 = 2082;
              v317 = v100;
              v318 = 1024;
              v319 = 873;
              v320 = 2114;
              v321 = v25;
              _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i @applet %{public}@ is in GP locked state", buf, 0x2Cu);
            }

            v44 = v283;
            v45 = v24;
            goto LABEL_40;
          }
          if (objc_msgSend(v30, "lifecycleState") != 15)
          {
            v101 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v102 = NFLogGetLogger(v101);
            if (v102)
            {
              v103 = (void (*)(uint64_t, const char *, ...))v102;
              v104 = object_getClass(self);
              v105 = class_isMetaClass(v104);
              v263 = object_getClassName(self);
              v271 = sel_getName(a2);
              v106 = 45;
              if (v105)
                v106 = 43;
              v103(4, "%c[%{public}s %{public}s]:%i @applet %{public}@ is not personalized", v106, v263, v271, 877, v25);
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
              v112 = object_getClassName(self);
              v113 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v313 = v111;
              v314 = 2082;
              v315 = v112;
              v316 = 2082;
              v317 = v113;
              v318 = 1024;
              v319 = 877;
              v320 = 2114;
              v321 = v25;
              _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i @applet %{public}@ is not personalized", buf, 0x2Cu);
            }

          }
LABEL_41:

          v23 = (char *)v23 + 1;
        }
        while (v22 != v23);
        v114 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v289, v299, 16);
        v22 = v114;
      }
      while (v114);
    }

    v115 = v287;
    v116 = -[NSObject count](v287, "count");
    if (v116)
    {
      v116 = -[NFExpressConfig removeAppletsFromConfig:](self, "removeAppletsFromConfig:", v287);
      if (v279)
        *v279 = 1;
    }
    v9 = v281;
    if (!v280)
    {
      v162 = NFSharedSignpostLog(v116);
      v163 = objc_claimAutoreleasedReturnValue(v162);
      if (os_signpost_enabled(v163))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v163, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_UPDATE_ESE_APPLETS", "update complete", buf, 2u);
      }
      v146 = 0;
      v161 = v283;
      goto LABEL_203;
    }
    v117 = v283;
    if (!self)
    {
      v223 = 0;
      goto LABEL_178;
    }
    if (!self->super._expressConfigUpdateRequired)
    {
LABEL_177:
      v223 = self->super._passes;
LABEL_178:
      v224 = v223;
      v161 = (NSMutableArray *)-[NSMutableArray mutableCopy](v224, "mutableCopy");

      if (-[NSMutableArray count](v117, "count"))
        -[NSMutableArray removeObjectsInArray:](v161, "removeObjectsInArray:", v117);

LABEL_181:
      v226 = NFSharedSignpostLog(v225);
      v227 = objc_claimAutoreleasedReturnValue(v226);
      if (os_signpost_enabled(v227))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v227, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_UPDATE_ESE_APPLETS", "configuring ATL", buf, 2u);
      }

      v163 = objc_claimAutoreleasedReturnValue(-[NFExpressConfigESE getSecureElementWrapperAndSetRouting](self, "getSecureElementWrapperAndSetRouting"));
      if (v163)
      {
        v228 = objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
        v229 = (void *)v228;
        if (v228)
        {
          v230 = (unint64_t)objc_msgSend(*(id *)(v228 + 120), "walletDomain");
          if (v230 <= 4)
            v231 = (0x19u >> v230) & 1;
          else
            v231 = 0;
        }
        else
        {
          v231 = 0;
        }

        -[NFExpressConfig dumpConfig:logLevel:prefix:](self, "dumpConfig:logLevel:prefix:", v161, 6, CFSTR("Configuring"));
        v232 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v9));
        v233 = sub_10023A03C(v163, v161, v232, v231);
        v234 = (id)objc_claimAutoreleasedReturnValue(v233);

        v236 = NFSharedSignpostLog(v235);
        v237 = objc_claimAutoreleasedReturnValue(v236);
        if (os_signpost_enabled(v237))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v237, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_UPDATE_ESE_APPLETS", "ATL configured", buf, 2u);
        }
      }
      else
      {
        v238 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v239 = NFLogGetLogger(v238);
        if (v239)
        {
          v240 = (void (*)(uint64_t, const char *, ...))v239;
          v241 = object_getClass(self);
          v242 = class_isMetaClass(v241);
          v243 = object_getClassName(self);
          v277 = sel_getName(a2);
          v244 = 45;
          if (v242)
            v244 = 43;
          v240(3, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", v244, v243, v277, 910);
        }
        v282 = v9;
        v245 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v246 = NFSharedLogGetLogger(v245);
        v247 = objc_claimAutoreleasedReturnValue(v246);
        if (os_log_type_enabled(v247, OS_LOG_TYPE_ERROR))
        {
          v248 = object_getClass(self);
          if (class_isMetaClass(v248))
            v249 = 43;
          else
            v249 = 45;
          v250 = object_getClassName(self);
          v251 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v313 = v249;
          v314 = 2082;
          v315 = v250;
          v316 = 2082;
          v317 = v251;
          v318 = 1024;
          v319 = 910;
          _os_log_impl((void *)&_mh_execute_header, v247, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", buf, 0x22u);
        }

        v252 = objc_alloc((Class)NSError);
        v237 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v297[0] = NSLocalizedDescriptionKey;
        v253 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
        v298[0] = v253;
        v298[1] = &off_1002FD6B0;
        v297[1] = CFSTR("Line");
        v297[2] = CFSTR("Method");
        v254 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v298[2] = v254;
        v297[3] = NSDebugDescriptionErrorKey;
        v255 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 911);
        v298[3] = v255;
        v297[4] = NSLocalizedFailureReasonErrorKey;
        v256 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to initialize eSE wrapper"));
        v298[4] = v256;
        v257 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v298, v297, 5));
        v234 = objc_msgSend(v252, "initWithDomain:code:userInfo:", v237, 15, v257);

        v9 = v282;
      }

      if (v234)
        +[NFExceptionsCALogger postAnalyticsExpressSetupFailureEvent:context:error:](NFExceptionsCALogger, "postAnalyticsExpressSetupFailureEvent:context:error:", 3, 6, v234);
      v115 = v234;
      v146 = v115;
LABEL_203:

LABEL_204:
      goto LABEL_205;
    }
    v118 = objc_autoreleasePoolPush();
    v119 = objc_alloc((Class)NSMutableArray);
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfig getExpressAidsForType:](self, "getExpressAidsForType:", 1));
    v121 = objc_msgSend(v119, "initWithArray:", v120);

    v122 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfig getExpressAidsForType:](self, "getExpressAidsForType:", 5));
    objc_msgSend(v121, "addObjectsFromArray:", v122);

    v123 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfigESE getSecureElementWrapperAndSetRouting](self, "getSecureElementWrapperAndSetRouting"));
    if (v123)
    {
      obja = v118;
      v295 = 0u;
      v296 = 0u;
      v293 = 0u;
      v294 = 0u;
      v124 = v121;
      v125 = -[NSObject countByEnumeratingWithState:objects:count:](v124, "countByEnumeratingWithState:objects:count:", &v293, buf, 16);
      if (v125)
      {
        v126 = v125;
        LODWORD(v127) = 0;
        v128 = *(_QWORD *)v294;
        while (2)
        {
          for (i = 0; i != v126; i = (char *)i + 1)
          {
            if (*(_QWORD *)v294 != v128)
              objc_enumerationMutation(v124);
            v130 = *(__CFString **)(*((_QWORD *)&v293 + 1) + 8 * (_QWORD)i);
            v131 = sub_10022F2F0(v123, v130);
            v132 = (void *)objc_claimAutoreleasedReturnValue(v131);
            v133 = v132;
            if (!v132)
            {
              v178 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v179 = NFLogGetLogger(v178);
              if (v179)
              {
                v180 = (void (*)(uint64_t, const char *, ...))v179;
                v181 = object_getClass(self);
                v182 = class_isMetaClass(v181);
                v265 = object_getClassName(self);
                v275 = sel_getName("_updateDriverExpressConfig");
                v183 = 45;
                if (v182)
                  v183 = 43;
                v180(3, "%c[%{public}s %{public}s]:%i %{public}@ not found on eSE", v183, v265, v275, 1003, v130);
              }
              v184 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v185 = NFSharedLogGetLogger(v184);
              v186 = objc_claimAutoreleasedReturnValue(v185);
              if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
              {
                v187 = object_getClass(self);
                if (class_isMetaClass(v187))
                  v188 = 43;
                else
                  v188 = 45;
                v189 = object_getClassName(self);
                v190 = sel_getName("_updateDriverExpressConfig");
                *(_DWORD *)v300 = 67110146;
                v301 = v188;
                v302 = 2082;
                v303 = v189;
                v304 = 2082;
                v305 = v190;
                v306 = 1024;
                v307 = 1003;
                v308 = 2114;
                v309 = v130;
                v191 = "%c[%{public}s %{public}s]:%i %{public}@ not found on eSE";
LABEL_173:
                _os_log_impl((void *)&_mh_execute_header, v186, OS_LOG_TYPE_ERROR, v191, v300, 0x2Cu);
              }
LABEL_174:
              v9 = v281;
              v118 = obja;

              goto LABEL_175;
            }
            v134 = objc_msgSend(v132, "supportedTypeFSystem");
            if (v134 != 1 && v134 != 2)
            {
              v211 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v212 = NFLogGetLogger(v211);
              if (v212)
              {
                v213 = (void (*)(uint64_t, const char *, ...))v212;
                v214 = object_getClass(self);
                v215 = class_isMetaClass(v214);
                v266 = object_getClassName(self);
                v276 = sel_getName("_updateDriverExpressConfig");
                v216 = 45;
                if (v215)
                  v216 = 43;
                v213(3, "%c[%{public}s %{public}s]:%i Unknown type F type for applet %{public}@", v216, v266, v276, 1019, v130);
              }
              v217 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v218 = NFSharedLogGetLogger(v217);
              v186 = objc_claimAutoreleasedReturnValue(v218);
              if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
              {
                v219 = object_getClass(self);
                if (class_isMetaClass(v219))
                  v220 = 43;
                else
                  v220 = 45;
                v221 = object_getClassName(self);
                v222 = sel_getName("_updateDriverExpressConfig");
                *(_DWORD *)v300 = 67110146;
                v301 = v220;
                v302 = 2082;
                v303 = v221;
                v304 = 2082;
                v305 = v222;
                v306 = 1024;
                v307 = 1019;
                v308 = 2114;
                v309 = v130;
                v191 = "%c[%{public}s %{public}s]:%i Unknown type F type for applet %{public}@";
                goto LABEL_173;
              }
              goto LABEL_174;
            }
            v127 = v134 | v127;

          }
          v126 = -[NSObject countByEnumeratingWithState:objects:count:](v124, "countByEnumeratingWithState:objects:count:", &v293, buf, 16);
          if (v126)
            continue;
          break;
        }
      }
      else
      {
        v127 = 0;
      }

      v192 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v193 = NFLogGetLogger(v192);
      if (v193)
      {
        v194 = (void (*)(uint64_t, const char *, ...))v193;
        v195 = object_getClass(self);
        v196 = class_isMetaClass(v195);
        v197 = object_getClassName(self);
        v198 = sel_getName("_updateDriverExpressConfig");
        v199 = -[NSObject count](v124, "count");
        v200 = CFSTR("YES");
        if (!v199)
          v200 = CFSTR("NO");
        v278 = v200;
        v201 = 45;
        if (v196)
          v201 = 43;
        v194(6, "%c[%{public}s %{public}s]:%i has type F express: %{public}@  entryConditions: %02X", v201, v197, v198, 1024, v278, v127);
      }
      v202 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v203 = NFSharedLogGetLogger(v202);
      v204 = objc_claimAutoreleasedReturnValue(v203);
      if (os_log_type_enabled(v204, OS_LOG_TYPE_DEFAULT))
      {
        v205 = object_getClass(self);
        if (class_isMetaClass(v205))
          v206 = 43;
        else
          v206 = 45;
        v207 = object_getClassName(self);
        v208 = sel_getName("_updateDriverExpressConfig");
        v209 = -[NSObject count](v124, "count");
        *(_DWORD *)v300 = 67110402;
        v210 = CFSTR("YES");
        if (!v209)
          v210 = CFSTR("NO");
        v301 = v206;
        v302 = 2082;
        v303 = v207;
        v304 = 2082;
        v305 = v208;
        v306 = 1024;
        v307 = 1024;
        v308 = 2114;
        v309 = v210;
        v310 = 1024;
        v311 = v127;
        _os_log_impl((void *)&_mh_execute_header, v204, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i has type F express: %{public}@  entryConditions: %02X", v300, 0x32u);
      }

      v9 = v281;
      v118 = obja;
      if (!-[NSObject count](v124, "count") || !(_DWORD)v127)
        goto LABEL_176;
      v124 = objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
      -[NSObject configureExpressFelicaEntry:](v124, "configureExpressFelicaEntry:", v127);
    }
    else
    {
      v164 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v165 = NFLogGetLogger(v164);
      if (v165)
      {
        v166 = (void (*)(uint64_t, const char *, ...))v165;
        v167 = object_getClass(self);
        v168 = class_isMetaClass(v167);
        v169 = v118;
        v170 = object_getClassName(self);
        v274 = sel_getName("_updateDriverExpressConfig");
        v171 = 45;
        if (v168)
          v171 = 43;
        v264 = v170;
        v118 = v169;
        v166(3, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", v171, v264, v274, 995);
      }
      v172 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v173 = NFSharedLogGetLogger(v172);
      v124 = objc_claimAutoreleasedReturnValue(v173);
      if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
      {
        v174 = object_getClass(self);
        if (class_isMetaClass(v174))
          v175 = 43;
        else
          v175 = 45;
        v176 = object_getClassName(self);
        v177 = sel_getName("_updateDriverExpressConfig");
        *(_DWORD *)buf = 67109890;
        v313 = v175;
        v314 = 2082;
        v315 = v176;
        v316 = 2082;
        v317 = v177;
        v318 = 1024;
        v319 = 995;
        _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", buf, 0x22u);
      }
    }
LABEL_175:

LABEL_176:
    objc_autoreleasePoolPop(v118);
    self->super._expressConfigUpdateRequired = 0;
    v117 = v283;
    a2 = sel;
    v115 = v287;
    goto LABEL_177;
  }
  v146 = 0;
LABEL_205:

  return v146;
}

- (BOOL)hasUWBKeys:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("keyIdentifier"), (_QWORD)v15));
        if (v9)
        {
          v10 = (void *)v9;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UWBExpressEnabled")));
          v12 = objc_msgSend(v11, "BOOLValue");

          if ((v12 & 1) != 0)
          {
            v13 = 1;
            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

@end
