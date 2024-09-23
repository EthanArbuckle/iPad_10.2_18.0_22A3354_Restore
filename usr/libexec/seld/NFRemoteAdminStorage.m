@implementation NFRemoteAdminStorage

- (NFRemoteAdminStorage)init
{
  uint64_t v2;
  NSUserDefaults *ud;
  id v4;
  void *v5;
  void *v6;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v10;
  const char *ClassName;
  const char *Name;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void (*v61)(uint64_t, const char *, ...);
  objc_class *v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  objc_class *v69;
  int v70;
  const char *v71;
  const char *v72;
  objc_class *v73;
  uint64_t v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  NSObject *v80;
  objc_class *v81;
  int v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  id v86;
  void *v87;
  NSMutableDictionary *v88;
  NSMutableDictionary *serversForApplets;
  id v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  NSMutableDictionary *v94;
  id v95;
  NSMutableDictionary *v96;
  NSMutableDictionary *serverStates;
  id *v98;
  NSObject *v99;
  NSMutableDictionary *v100;
  void *v101;
  void (*v102)(uint64_t, const char *, ...);
  objc_class *v103;
  uint64_t v104;
  const char *v105;
  const char *v106;
  void *v107;
  uint64_t v108;
  objc_class *v109;
  int v110;
  const char *v111;
  const char *v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  NSMutableArray *v117;
  NSMutableArray *v118;
  NSMutableArray *v119;
  id v120;
  uint64_t v121;
  void *i;
  void *v123;
  uint64_t v124;
  id v125;
  _BOOL4 v126;
  void *v127;
  uint64_t v128;
  void (*v129)(uint64_t, const char *, ...);
  objc_class *v130;
  uint64_t v131;
  const char *v132;
  const char *v133;
  void *v134;
  uint64_t v135;
  NSObject *v136;
  objc_class *v137;
  int v138;
  const char *v139;
  const char *v140;
  objc_class *v141;
  uint64_t v142;
  const char *v143;
  const char *v144;
  void *v145;
  uint64_t v146;
  NSObject *v147;
  objc_class *v148;
  int v149;
  const char *v150;
  const char *v151;
  void *v152;
  void (*v153)(uint64_t, const char *, ...);
  objc_class *v154;
  uint64_t v155;
  const char *v156;
  const char *v157;
  void *v158;
  uint64_t v159;
  NSObject *v160;
  objc_class *v161;
  int v162;
  const char *v163;
  const char *v164;
  NSMutableArray *v165;
  NSMutableArray *v166;
  void *v167;
  void *v168;
  void (*v169)(uint64_t, const char *, ...);
  objc_class *v170;
  uint64_t v171;
  const char *v172;
  const char *v173;
  void *v174;
  uint64_t v175;
  NSObject *v176;
  objc_class *v177;
  int v178;
  const char *v179;
  const char *v180;
  NSMutableArray *v181;
  NSMutableArray *redirectStates;
  NSMutableArray *v184;
  id v185;
  void *v186;
  void *v187;
  void *v188;
  NSMutableArray *v189;
  NFRemoteAdminStorage *v191;
  id v192;
  _QWORD v193[4];
  NSObject *v194;
  SEL v195;
  id v196;
  objc_super v197;
  const __CFString *v198;
  void *v199;
  uint8_t v200[8];
  _BYTE v201[20];
  __int16 v202;
  int v203;
  __int16 v204;
  id v205;
  uint8_t buf[8];
  _BYTE v207[40];
  const char *v208;
  uint8_t v209[48];
  __int128 v210;

  v197.receiver = self;
  v197.super_class = (Class)NFRemoteAdminStorage;
  v191 = -[NFRemoteAdminStorage init](&v197, "init");
  if (v191)
  {
    v2 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    ud = v191->_ud;
    v191->_ud = (NSUserDefaults *)v2;

    v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.stockholm"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("TrustedServiceManagerURL")));
    if (objc_msgSend(v5, "length"))
    {
      v198 = CFSTR("com.apple.seld");
      v199 = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v199, &v198, 1));
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(v191);
        if (class_isMetaClass(Class))
          v10 = 43;
        else
          v10 = 45;
        ClassName = object_getClassName(v191);
        Name = sel_getName("_importLegacyRegistration");
        Logger(5, "%c[%{public}s %{public}s]:%i Importing pre-multihoming config: %{public}@", v10, ClassName, Name, 247, v6);
      }
      v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v14 = NFSharedLogGetLogger(v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = object_getClass(v191);
        if (class_isMetaClass(v16))
          v17 = 43;
        else
          v17 = 45;
        v18 = object_getClassName(v191);
        v19 = sel_getName("_importLegacyRegistration");
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = v17;
        *(_WORD *)v207 = 2082;
        *(_QWORD *)&v207[2] = v18;
        *(_WORD *)&v207[10] = 2082;
        *(_QWORD *)&v207[12] = v19;
        *(_WORD *)&v207[20] = 1024;
        *(_DWORD *)&v207[22] = 247;
        *(_WORD *)&v207[26] = 2114;
        *(_QWORD *)&v207[28] = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Importing pre-multihoming config: %{public}@", buf, 0x2Cu);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastObject"));
      sub_1000368F4(v191, v6, v21);

      objc_msgSend(v4, "removeObjectForKey:", CFSTR("TrustedServiceManagerURL"));
    }
    else
    {
      v6 = 0;
    }
    v22 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.stockholm.tsmreg"));
    if ((objc_msgSend(v22, "BOOLForKey:", CFSTR("ForwardMigrationComplete")) & 1) != 0)
    {
      v23 = v6;
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dictionaryForKey:", CFSTR("RsptUrls")));

      if (v23)
      {
        v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v24);
        if (v25)
        {
          v26 = object_getClass(v191);
          if (class_isMetaClass(v26))
            v27 = 43;
          else
            v27 = 45;
          v28 = object_getClassName(v191);
          v29 = sel_getName("_importLegacyRegistration");
          v25(5, "%c[%{public}s %{public}s]:%i Importing post-multihoming config: %{public}@", v27, v28, v29, 260, v23);
        }
        v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v31 = NFSharedLogGetLogger(v30);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = object_getClass(v191);
          if (class_isMetaClass(v33))
            v34 = 43;
          else
            v34 = 45;
          v35 = object_getClassName(v191);
          v36 = sel_getName("_importLegacyRegistration");
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&buf[4] = v34;
          *(_WORD *)v207 = 2082;
          *(_QWORD *)&v207[2] = v35;
          *(_WORD *)&v207[10] = 2082;
          *(_QWORD *)&v207[12] = v36;
          *(_WORD *)&v207[20] = 1024;
          *(_DWORD *)&v207[22] = 260;
          *(_WORD *)&v207[26] = 2114;
          *(_QWORD *)&v207[28] = v23;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Importing post-multihoming config: %{public}@", buf, 0x2Cu);
        }

        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allKeys"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "lastObject"));
        sub_1000368F4(v191, v23, v38);

        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dictionaryForKey:", CFSTR("AidTopicMap")));
        *(_QWORD *)v200 = 0;
        *(_QWORD *)v201 = v200;
        *(_QWORD *)&v201[8] = 0x2020000000;
        v201[16] = 1;
        *(_QWORD *)buf = _NSConcreteStackBlock;
        *(_QWORD *)v207 = 3221225472;
        *(_QWORD *)&v207[8] = sub_1000371E0;
        *(_QWORD *)&v207[16] = &unk_100055060;
        *(_QWORD *)&v207[32] = v200;
        v208 = "_importLegacyRegistration";
        *(_QWORD *)&v207[24] = v191;
        objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", buf);
        if (*(_BYTE *)(*(_QWORD *)v201 + 24) && objc_msgSend(v39, "count"))
        {
          v40 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v41 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v40);
          if (v41)
          {
            v42 = object_getClass(v191);
            if (class_isMetaClass(v42))
              v43 = 43;
            else
              v43 = 45;
            v44 = object_getClassName(v191);
            v45 = sel_getName("_importLegacyRegistration");
            v41(5, "%c[%{public}s %{public}s]:%i Importing post-multihoming map: %{public}@", v43, v44, v45, 279, v39);
          }
          v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v47 = NFSharedLogGetLogger(v46);
          v48 = objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            v49 = object_getClass(v191);
            if (class_isMetaClass(v49))
              v50 = 43;
            else
              v50 = 45;
            v51 = object_getClassName(v191);
            v52 = sel_getName("_importLegacyRegistration");
            *(_DWORD *)v209 = 67110146;
            *(_DWORD *)&v209[4] = v50;
            *(_WORD *)&v209[8] = 2082;
            *(_QWORD *)&v209[10] = v51;
            *(_WORD *)&v209[18] = 2082;
            *(_QWORD *)&v209[20] = v52;
            *(_WORD *)&v209[28] = 1024;
            *(_DWORD *)&v209[30] = 279;
            *(_WORD *)&v209[34] = 2114;
            *(_QWORD *)&v209[36] = v39;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Importing post-multihoming map: %{public}@", v209, 0x2Cu);
          }

          -[NSMutableDictionary removeAllObjects](v191->_serversForApplets, "removeAllObjects");
          -[NSMutableDictionary addEntriesFromDictionary:](v191->_serversForApplets, "addEntriesFromDictionary:", v39);
          -[NSUserDefaults setObject:forKey:](v191->_ud, "setObject:forKey:", v191->_serversForApplets, CFSTR("ServersForApplets"));
        }
        _Block_object_dispose(v200, 8);

      }
      -[NSUserDefaults synchronize](v191->_ud, "synchronize");
      objc_msgSend(v22, "setBool:forKey:", 1, CFSTR("ForwardMigrationComplete"));
      objc_msgSend(v22, "synchronize");
    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](v191->_ud, "dictionaryForKey:", CFSTR("RegistrationInfo")));

    if (v53)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](v191->_ud, "stringForKey:", CFSTR("PrimaryRegionTopic")));
      v55 = v54 == 0;

      if (v55)
      {
        v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "allKeys"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v56, "lastObject"));

        v58 = objc_opt_class(NSString);
        LOBYTE(v56) = objc_opt_isKindOfClass(v57, v58);
        v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v60 = NFLogGetLogger(v59);
        v61 = (void (*)(uint64_t, const char *, ...))v60;
        if ((v56 & 1) != 0)
        {
          if (v60)
          {
            v62 = object_getClass(v191);
            if (class_isMetaClass(v62))
              v63 = 43;
            else
              v63 = 45;
            v64 = object_getClassName(v191);
            v65 = sel_getName("_importLegacyRegistration");
            v61(5, "%c[%{public}s %{public}s]:%i Found server registration but missing primary topic assignment, assuming %{public}@ as primary.", v63, v64, v65, 296, v57);
          }
          v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v67 = NFSharedLogGetLogger(v66);
          v68 = objc_claimAutoreleasedReturnValue(v67);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            v69 = object_getClass(v191);
            if (class_isMetaClass(v69))
              v70 = 43;
            else
              v70 = 45;
            v71 = object_getClassName(v191);
            v72 = sel_getName("_importLegacyRegistration");
            *(_DWORD *)v209 = 67110146;
            *(_DWORD *)&v209[4] = v70;
            *(_WORD *)&v209[8] = 2082;
            *(_QWORD *)&v209[10] = v71;
            *(_WORD *)&v209[18] = 2082;
            *(_QWORD *)&v209[20] = v72;
            *(_WORD *)&v209[28] = 1024;
            *(_DWORD *)&v209[30] = 296;
            *(_WORD *)&v209[34] = 2114;
            *(_QWORD *)&v209[36] = v57;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found server registration but missing primary topic assignment, assuming %{public}@ as primary.", v209, 0x2Cu);
          }

          -[NSUserDefaults setObject:forKey:](v191->_ud, "setObject:forKey:", v57, CFSTR("PrimaryRegionTopic"));
        }
        else
        {
          if (v60)
          {
            v73 = object_getClass(v191);
            if (class_isMetaClass(v73))
              v74 = 43;
            else
              v74 = 45;
            v75 = object_getClassName(v191);
            v76 = sel_getName("_importLegacyRegistration");
            v77 = objc_opt_class(v57);
            v61(4, "%c[%{public}s %{public}s]:%i Invalid topic: %{public}@", v74, v75, v76, 299, v77);
          }
          v78 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v79 = NFSharedLogGetLogger(v78);
          v80 = objc_claimAutoreleasedReturnValue(v79);
          if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
          {
            v81 = object_getClass(v191);
            if (class_isMetaClass(v81))
              v82 = 43;
            else
              v82 = 45;
            v83 = object_getClassName(v191);
            v84 = sel_getName("_importLegacyRegistration");
            v85 = objc_opt_class(v57);
            *(_DWORD *)v209 = 67110146;
            *(_DWORD *)&v209[4] = v82;
            *(_WORD *)&v209[8] = 2082;
            *(_QWORD *)&v209[10] = v83;
            *(_WORD *)&v209[18] = 2082;
            *(_QWORD *)&v209[20] = v84;
            *(_WORD *)&v209[28] = 1024;
            *(_DWORD *)&v209[30] = 299;
            *(_WORD *)&v209[34] = 2114;
            *(_QWORD *)&v209[36] = v85;
            _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid topic: %{public}@", v209, 0x2Cu);
          }

        }
      }
    }

    v186 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](v191->_ud, "dictionaryForKey:", CFSTR("ServersForApplets")));
    v86 = objc_msgSend(v186, "mutableCopy");
    v87 = v86;
    if (v86)
      v88 = (NSMutableDictionary *)v86;
    else
      v88 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    serversForApplets = v191->_serversForApplets;
    v191->_serversForApplets = v88;

    v188 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dataForKey:](v191->_ud, "dataForKey:", CFSTR("ServerStates")));
    if (v188)
    {
      v90 = objc_alloc((Class)NSSet);
      v91 = objc_opt_class(NFRemoteAdminState);
      v92 = objc_opt_class(NSMutableDictionary);
      v93 = objc_msgSend(v90, "initWithObjects:", v91, v92, objc_opt_class(NSString), 0);
      v196 = 0;
      v94 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v93, v188, &v196));
      v95 = v196;

      v96 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      serverStates = v191->_serverStates;
      v191->_serverStates = v96;

      if (v94)
      {
        v193[0] = _NSConcreteStackBlock;
        v193[1] = 3221225472;
        v193[2] = sub_100035518;
        v193[3] = &unk_100055038;
        v98 = v191;
        v194 = v98;
        v195 = a2;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v94, "enumerateKeysAndObjectsUsingBlock:", v193);
        sub_10003586C(v98);
        v99 = v194;
      }
      else
      {
        v101 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v102 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v101);
        if (v102)
        {
          v103 = object_getClass(v191);
          if (class_isMetaClass(v103))
            v104 = 43;
          else
            v104 = 45;
          v105 = object_getClassName(v191);
          v106 = sel_getName(a2);
          v102(3, "%c[%{public}s %{public}s]:%i Invalid data or decode failed: %{public}@", v104, v105, v106, 94, v95);
        }
        v107 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v108 = NFSharedLogGetLogger(v107);
        v99 = objc_claimAutoreleasedReturnValue(v108);
        if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
        {
          v109 = object_getClass(v191);
          if (class_isMetaClass(v109))
            v110 = 43;
          else
            v110 = 45;
          v111 = object_getClassName(v191);
          v112 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&buf[4] = v110;
          *(_WORD *)v207 = 2082;
          *(_QWORD *)&v207[2] = v111;
          *(_WORD *)&v207[10] = 2082;
          *(_QWORD *)&v207[12] = v112;
          *(_WORD *)&v207[20] = 1024;
          *(_DWORD *)&v207[22] = 94;
          *(_WORD *)&v207[26] = 2114;
          *(_QWORD *)&v207[28] = v95;
          _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid data or decode failed: %{public}@", buf, 0x2Cu);
        }
      }

    }
    else
    {
      v100 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v95 = 0;
      v94 = v191->_serverStates;
      v191->_serverStates = v100;
    }

    v187 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dataForKey:](v191->_ud, "dataForKey:", CFSTR("RedirectStates")));
    if (v187)
    {
      v113 = objc_alloc((Class)NSSet);
      v114 = objc_opt_class(NFRemoteAdminRedirectState);
      v115 = objc_opt_class(NSMutableArray);
      v116 = objc_msgSend(v113, "initWithObjects:", v114, v115, objc_opt_class(NSString), 0);
      v192 = v95;
      v184 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v116, v187, &v192));
      v185 = v192;

      if (!v184)
      {
        v167 = v185;
        v168 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v169 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v168);
        if (v169)
        {
          v170 = object_getClass(v191);
          if (class_isMetaClass(v170))
            v171 = 43;
          else
            v171 = 45;
          v172 = object_getClassName(v191);
          v173 = sel_getName(a2);
          v169(3, "%c[%{public}s %{public}s]:%i Invalid data or decode failed: %{public}@", v171, v172, v173, 121, v185);
        }
        v174 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v175 = NFSharedLogGetLogger(v174);
        v176 = objc_claimAutoreleasedReturnValue(v175);
        if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
        {
          v177 = object_getClass(v191);
          if (class_isMetaClass(v177))
            v178 = 43;
          else
            v178 = 45;
          v179 = object_getClassName(v191);
          v180 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&buf[4] = v178;
          *(_WORD *)v207 = 2082;
          *(_QWORD *)&v207[2] = v179;
          *(_WORD *)&v207[10] = 2082;
          *(_QWORD *)&v207[12] = v180;
          *(_WORD *)&v207[20] = 1024;
          *(_DWORD *)&v207[22] = 121;
          *(_WORD *)&v207[26] = 2114;
          *(_QWORD *)&v207[28] = v185;
          _os_log_impl((void *)&_mh_execute_header, v176, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid data or decode failed: %{public}@", buf, 0x2Cu);
        }

        v181 = objc_opt_new(NSMutableArray);
        redirectStates = v191->_redirectStates;
        v191->_redirectStates = v181;

        goto LABEL_148;
      }
      v117 = (NSMutableArray *)-[NSMutableArray mutableCopy](v184, "mutableCopy");
      v118 = v191->_redirectStates;
      v191->_redirectStates = v117;

      v189 = objc_opt_new(NSMutableArray);
      v210 = 0u;
      memset(v209, 0, sizeof(v209));
      v119 = v191->_redirectStates;
      v120 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v119, "countByEnumeratingWithState:objects:count:", v209, buf, 16);
      if (v120)
      {
        v121 = **(_QWORD **)&v209[16];
        do
        {
          for (i = 0; i != v120; i = (char *)i + 1)
          {
            if (**(_QWORD **)&v209[16] != v121)
              objc_enumerationMutation(v119);
            v123 = *(void **)(*(_QWORD *)&v209[8] + 8 * (_QWORD)i);
            v124 = objc_opt_class(NFRemoteAdminReaderState);
            if ((objc_opt_isKindOfClass(v123, v124) & 1) != 0 && objc_msgSend(v123, "step") != (id)2)
            {
              v125 = v123;
              v126 = objc_msgSend(v125, "step") == (id)1;
              v127 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v128 = NFLogGetLogger(v127);
              v129 = (void (*)(uint64_t, const char *, ...))v128;
              if (v126)
              {
                if (v128)
                {
                  v130 = object_getClass(v191);
                  if (class_isMetaClass(v130))
                    v131 = 43;
                  else
                    v131 = 45;
                  v132 = object_getClassName(v191);
                  v133 = sel_getName("_fixupRedirectState");
                  v129(5, "%c[%{public}s %{public}s]:%i State interrupted in progress - moving to error state: %{public}@", v131, v132, v133, 208, v125);
                }
                v134 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v135 = NFSharedLogGetLogger(v134);
                v136 = objc_claimAutoreleasedReturnValue(v135);
                if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
                {
                  v137 = object_getClass(v191);
                  if (class_isMetaClass(v137))
                    v138 = 43;
                  else
                    v138 = 45;
                  v139 = object_getClassName(v191);
                  v140 = sel_getName("_fixupRedirectState");
                  *(_DWORD *)v200 = 67110146;
                  *(_DWORD *)&v200[4] = v138;
                  *(_WORD *)v201 = 2082;
                  *(_QWORD *)&v201[2] = v139;
                  *(_WORD *)&v201[10] = 2082;
                  *(_QWORD *)&v201[12] = v140;
                  v202 = 1024;
                  v203 = 208;
                  v204 = 2114;
                  v205 = v125;
                  _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i State interrupted in progress - moving to error state: %{public}@", v200, 0x2Cu);
                }

                objc_msgSend(v125, "setIncompleteReason:", CFSTR("NetworkError"));
                objc_msgSend(v125, "incrementStep");
              }
              else
              {
                if (v128)
                {
                  v141 = object_getClass(v191);
                  if (class_isMetaClass(v141))
                    v142 = 43;
                  else
                    v142 = 45;
                  v143 = object_getClassName(v191);
                  v144 = sel_getName("_fixupRedirectState");
                  v129(5, "%c[%{public}s %{public}s]:%i redirect request found in bad state, removing: %{public}@", v142, v143, v144, 213, v125);
                }
                v145 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v146 = NFSharedLogGetLogger(v145);
                v147 = objc_claimAutoreleasedReturnValue(v146);
                if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
                {
                  v148 = object_getClass(v191);
                  if (class_isMetaClass(v148))
                    v149 = 43;
                  else
                    v149 = 45;
                  v150 = object_getClassName(v191);
                  v151 = sel_getName("_fixupRedirectState");
                  *(_DWORD *)v200 = 67110146;
                  *(_DWORD *)&v200[4] = v149;
                  *(_WORD *)v201 = 2082;
                  *(_QWORD *)&v201[2] = v150;
                  *(_WORD *)&v201[10] = 2082;
                  *(_QWORD *)&v201[12] = v151;
                  v202 = 1024;
                  v203 = 213;
                  v204 = 2114;
                  v205 = v125;
                  _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i redirect request found in bad state, removing: %{public}@", v200, 0x2Cu);
                }

                -[NSMutableArray addObject:](v189, "addObject:", v125);
              }

            }
          }
          v120 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v119, "countByEnumeratingWithState:objects:count:", v209, buf, 16);
        }
        while (v120);
      }

      if (-[NSMutableArray count](v189, "count"))
      {
        v152 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v153 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v152);
        if (v153)
        {
          v154 = object_getClass(v191);
          if (class_isMetaClass(v154))
            v155 = 43;
          else
            v155 = 45;
          v156 = object_getClassName(v191);
          v157 = sel_getName("_fixupRedirectState");
          v153(6, "%c[%{public}s %{public}s]:%i Removing invalid reader state entries", v155, v156, v157, 220);
        }
        v158 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v159 = NFSharedLogGetLogger(v158);
        v160 = objc_claimAutoreleasedReturnValue(v159);
        if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
        {
          v161 = object_getClass(v191);
          if (class_isMetaClass(v161))
            v162 = 43;
          else
            v162 = 45;
          v163 = object_getClassName(v191);
          v164 = sel_getName("_fixupRedirectState");
          *(_DWORD *)v200 = 67109890;
          *(_DWORD *)&v200[4] = v162;
          *(_WORD *)v201 = 2082;
          *(_QWORD *)&v201[2] = v163;
          *(_WORD *)&v201[10] = 2082;
          *(_QWORD *)&v201[12] = v164;
          v202 = 1024;
          v203 = 220;
          _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Removing invalid reader state entries", v200, 0x22u);
        }

        -[NSMutableArray removeObjectsInArray:](v191->_redirectStates, "removeObjectsInArray:", v189);
        sub_100036604(v191);
      }

      v165 = v184;
    }
    else
    {
      v166 = objc_opt_new(NSMutableArray);
      v165 = v191->_redirectStates;
      v191->_redirectStates = v166;
      v185 = v95;
    }

    v167 = v185;
LABEL_148:
    -[NSUserDefaults removeObjectForKey:](v191->_ud, "removeObjectForKey:", CFSTR("JCOPUpdateInfo"));
    -[NSUserDefaults removeObjectForKey:](v191->_ud, "removeObjectForKey:", CFSTR("SEOSUpdateInfo"));

  }
  return v191;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seosPlatformID, 0);
  objc_storeStrong((id *)&self->_apnToken, 0);
  objc_storeStrong((id *)&self->_redirectStates, 0);
  objc_storeStrong((id *)&self->_serverStates, 0);
  objc_storeStrong((id *)&self->_serversForApplets, 0);
  objc_storeStrong((id *)&self->_ud, 0);
}

@end
