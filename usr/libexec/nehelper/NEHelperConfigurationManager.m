@implementation NEHelperConfigurationManager

- (NEHelperConfigurationManager)initWithFirstMessage:(id)a3
{
  id v4;
  NEHelperConfigurationManager *v5;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v7;
  pid_t pid;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  uint64_t v13;
  uint64_t v14;
  NSUUID *userUUID;
  uint64_t v16;
  NSString *bundleID;
  xpc_object_t value;
  void *type;
  uint64_t v20;
  void *v21;
  void *v22;
  NSString *v23;
  NSString *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  NSString *v36;
  uint64_t v37;
  NSString *clientName;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  char v45;
  uint64_t v46;
  NSObject *v47;
  NEHelperConfigurationManager *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  void *j;
  uint64_t v56;
  const char *string;
  const char *v58;
  size_t v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *i;
  NSString *applicationID;
  void *v66;
  void *v67;
  const char *string_ptr;
  NSString *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  BOOL v74;
  void *v75;
  void *v76;
  NSMutableDictionary *v77;
  NSMutableDictionary *filter;
  id v79;
  uint64_t v80;
  NSString *v81;
  uint64_t v82;
  NSObject *v83;
  NSString *v84;
  NSString *v85;
  NSString *v86;
  _BOOL4 entitled;
  _BOOL4 hasProviderPermission;
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  objc_super v99;
  uint8_t buf[4];
  NSString *v101;
  __int16 v102;
  NSString *v103;
  __int16 v104;
  NSString *v105;
  __int16 v106;
  _BOOL4 v107;
  __int16 v108;
  _BOOL4 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  char buffer[64];

  v4 = a3;
  v99.receiver = self;
  v99.super_class = (Class)NEHelperConfigurationManager;
  v5 = -[NEHelperConfigurationManager init](&v99, "init");
  if (!v5)
  {
LABEL_86:
    v48 = v5;
    goto LABEL_87;
  }
  remote_connection = xpc_dictionary_get_remote_connection(v4);
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  pid = xpc_connection_get_pid(v7);
  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = dispatch_queue_create("NEHelperConfigurationManager", v10);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v11;

  v5->_entitled = 0;
  v13 = NECopyUserUUIDFromXPCEUID(v7);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  userUUID = v5->_userUUID;
  v5->_userUUID = (NSUUID *)v14;

  v5->_userUID = xpc_connection_get_euid(v7);
  v5->_hasProviderPermission = 0;
  v16 = NECopySigningIdentifierForXPCMessage(v4);
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v16;

  value = xpc_dictionary_get_value(v4, "preferred-languages");
  type = (void *)objc_claimAutoreleasedReturnValue(value);
  v21 = type;
  if (type)
  {
    type = xpc_get_type(type);
    if (type == &_xpc_type_array)
    {
      type = (void *)xpc_array_get_count(v21);
      if (type)
      {
        v22 = (void *)_CFXPCCreateCFObjectFromXPCObject(v21);
        NEResourcesSetPreferredLanguages();

      }
    }
  }
  if (v5->_bundleID)
  {
    if (xpc_connection_is_extension(v7))
    {
      v23 = v5->_bundleID;
      if (v23)
      {
        v24 = v23;
        v26 = ne_log_obj(v24, v25);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v101 = v24;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Client is an extension with bundle identifier %@", buf, 0xCu);
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[LSPlugInKitProxy pluginKitProxyForIdentifier:](LSPlugInKitProxy, "pluginKitProxyForIdentifier:", v24));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "containingBundle"));
        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bundleIdentifier"));
        v31 = v5->_bundleID;
        v5->_bundleID = (NSString *)v30;

        v34 = ne_log_obj(v32, v33);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = v5->_bundleID;
          *(_DWORD *)buf = 138412290;
          v101 = v36;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Containing app for extension is %@", buf, 0xCu);
        }

      }
    }
    if (proc_name(pid, buffer, 0x40u) <= 0)
      snprintf(buffer, 0x40uLL, "%d", pid);
    v37 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", buffer));
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v37;

    v39 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.developer.networking.vpn.api");
    v40 = v39;
    if (v39)
    {
      if (xpc_get_type(v39) == (xpc_type_t)&_xpc_type_array)
      {
        if (xpc_array_get_count(v40))
        {
          string = xpc_array_get_string(v40, 0);
          if (string)
          {
            v58 = string;
            v59 = strlen(string);
            if (!strncmp(v58, "allow-vpn", v59))
            {
              objc_storeStrong((id *)&v5->_applicationID, v5->_bundleID);
              v5->_entitled = 1;
            }
          }
        }
      }
    }
    v41 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.security.application-groups");

    if (v41 && xpc_get_type(v41) == (xpc_type_t)&_xpc_type_array && xpc_array_get_count(v41))
    {
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v60 = (id)_CFXPCCreateCFObjectFromXPCObject(v41);
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
      v42 = v60;
      if (v61)
      {
        v62 = v61;
        v63 = *(_QWORD *)v96;
        while (2)
        {
          for (i = 0; i != v62; i = (char *)i + 1)
          {
            if (*(_QWORD *)v96 != v63)
              objc_enumerationMutation(v60);
            if ((isa_nsstring(*(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)i)) & 1) == 0)
            {

              v42 = 0;
              goto LABEL_56;
            }
          }
          v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
          if (v62)
            continue;
          break;
        }
        v42 = v60;
      }
LABEL_56:

    }
    else
    {
      v42 = 0;
    }
    v43 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.developer.networking.networkextension");

    v44 = NEGetEntitlement(v43);
    v90 = v42;
    if (v44)
    {
      v45 = v44;
      objc_storeStrong((id *)&v5->_applicationID, v5->_bundleID);
      v5->_entitled = 1;
      v5->_hasProviderPermission = 1;
      if ((v45 & 4) != 0)
        v5->_isCurrentAllowedContentFilterApp = sub_100016174((uint64_t)NEHelperConfigurationManager, v5->_applicationID);
      if (xpc_connection_is_extension(v7))
        v5->_appGroupEntitled = 1;
      else
        objc_storeStrong((id *)&v5->_appGroups, v42);
    }
    else if (!v5->_entitled && objc_msgSend(v42, "count"))
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
      v50 = objc_msgSend(v49, "copyAppGroupMapDidChange:", 0);

      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v51 = v42;
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v91, v110, 16);
      if (v52)
      {
        v53 = v52;
        v54 = *(_QWORD *)v92;
        while (2)
        {
          for (j = 0; j != v53; j = (char *)j + 1)
          {
            if (*(_QWORD *)v92 != v54)
              objc_enumerationMutation(v51);
            v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)j)));
            if (v56)
            {
              applicationID = v5->_applicationID;
              v5->_applicationID = (NSString *)v56;

              v5->_entitled = 1;
              v5->_hasProviderPermission = 1;
              v5->_appGroupEntitled = 1;
              goto LABEL_58;
            }
          }
          v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v91, v110, 16);
          if (v53)
            continue;
          break;
        }
      }
LABEL_58:

    }
    v66 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.private.networkextension.configuration");
    v67 = v66;
    if (v66)
    {
      v5->_entitled = 1;
      v5->_hasProviderPermission = 1;
      v5->_platformEntitled = 1;
      if (xpc_get_type(v66) == (xpc_type_t)&_xpc_type_string)
      {
        string_ptr = xpc_string_get_string_ptr(v67);
        if (!strcmp(string_ptr, "super"))
          v5->_superEntitled = 1;
      }
      if (xpc_dictionary_get_BOOL(v4, "no-app-filter"))
      {
        v69 = v5->_applicationID;
        v5->_applicationID = 0;

      }
      v5->_appGroupEntitled = 0;
    }
    v70 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.private.networkextension.spi");
    v71 = v70;
    if (v70 && xpc_get_type(v70) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v71))
      v5->_spiEntitled = 1;
    v72 = (void *)xpc_connection_copy_entitlement_value(v7, "get-task-allow");
    v73 = v72;
    v74 = v72 && xpc_get_type(v72) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v73);
    v5->_isDevelopment = v74;
    v75 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.private.networkextension.test-control");
    v76 = v75;
    if (v75 && xpc_get_type(v75) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v76))
      v5->_isTestClient = 1;
    v77 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    filter = v5->_filter;
    v5->_filter = v77;

    v79 = (id)xpc_dictionary_get_BOOL(v4, "no-app-filter");
    if ((v79 & 1) == 0)
      v79 = -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_filter, "setObject:forKeyedSubscript:", v5->_userUUID, CFSTR("user-uuid"));
    v81 = v5->_applicationID;
    if (v81)
      v79 = -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_filter, "setObject:forKeyedSubscript:", v81, CFSTR("application-id"));
    v82 = ne_log_obj(v79, v80);
    v83 = objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      v84 = v5->_clientName;
      v85 = v5->_bundleID;
      v86 = v5->_applicationID;
      entitled = v5->_entitled;
      hasProviderPermission = v5->_hasProviderPermission;
      *(_DWORD *)buf = 138413314;
      v101 = v84;
      v102 = 2112;
      v103 = v85;
      v104 = 2112;
      v105 = v86;
      v106 = 1024;
      v107 = entitled;
      v108 = 1024;
      v109 = hasProviderPermission;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "Created a new configuration delegate with name = %@, bundleID = %@, applicationID = %@, entitled = %d, hasProviderPermission = %d", buf, 0x2Cu);
    }

    goto LABEL_86;
  }
  v46 = ne_log_obj(type, v20);
  v47 = objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Operation failed, client is not signed", buf, 2u);
  }

  v48 = 0;
LABEL_87:

  return v48;
}

- (NSString)name
{
  return self->_bundleID;
}

- (OS_dispatch_queue)handlerQueue
{
  if (self)
    self = (NEHelperConfigurationManager *)objc_getProperty(self, a2, 32, 1);
  return (OS_dispatch_queue *)self;
}

- (void)handleMessage:(id)a3
{
  id v4;
  int64_t int64;
  int64_t v6;
  const char *string;
  const char *v8;
  NSString *v9;
  id (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  SEL v15;
  id v16;
  uint64_t v17;
  void *v18;
  SEL v19;
  id v20;
  SEL v21;
  id Property;
  xpc_object_t value;
  void *v24;
  void *v25;
  id v26;
  const void *bytes_ptr;
  NSData *v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSSet *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  const char *v41;
  void *v42;
  SEL v43;
  id v44;
  SEL v45;
  id v46;
  const void *data;
  void *v48;
  const char *v49;
  uint64_t v50;
  NSObject *v51;
  const char *v52;
  const uint8_t *v53;
  id v54;
  _QWORD *v55;
  const char *v56;
  void *v57;
  id v58;
  void *v59;
  BOOL v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  id v66;
  os_unfair_lock_s *v67;
  void *v68;
  id v69;
  _QWORD *v70;
  _QWORD *v71;
  void *v72;
  xpc_object_t v73;
  void *v74;
  void *v75;
  SEL v76;
  id v77;
  uint64_t v78;
  const uint8_t *v79;
  BOOL v80;
  id v81;
  void *v82;
  SEL v83;
  id v84;
  SEL v85;
  id v86;
  id v87;
  const char *v88;
  _BOOL8 v89;
  uint64_t v90;
  BOOL v91;
  void *v92;
  void *v93;
  SEL v94;
  id v95;
  id v96;
  const char *v97;
  int v98;
  const uint8_t *v99;
  uint64_t v100;
  uint8_t *v101;
  uint64_t v102;
  NSObject *v103;
  const uint8_t *uuid;
  id v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  const char *v109;
  void *v110;
  SEL v111;
  id v112;
  id v113;
  const void *v114;
  SEL v115;
  id v116;
  const char *v117;
  void *v118;
  id v119;
  void *v120;
  char v121;
  uint64_t v122;
  NSObject *v123;
  const char *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  id v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  _BOOL4 v134;
  id v135;
  const char *v136;
  uint64_t v137;
  NSObject *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  NSObject *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  int64_t v148;
  SEL v149;
  id v150;
  SEL v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  NSObject *v156;
  const char *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  NSObject *v163;
  const char *v164;
  NSObject *v165;
  uint32_t v166;
  uint64_t v167;
  NSObject *v168;
  const char *v169;
  uint64_t v170;
  BOOL v171;
  id v172;
  NSObject *v173;
  id v174;
  id v175;
  uint64_t v176;
  NSObject *v177;
  const char *v178;
  const char *v179;
  uint64_t v180;
  const char *v181;
  id v182;
  id v183;
  void *v184;
  BOOL v185;
  const char *v186;
  uint64_t v187;
  id v188;
  void *v189;
  BOOL v190;
  const char *v191;
  id v192;
  unsigned __int8 v193;
  const char *v194;
  id v195;
  uint64_t v196;
  uint64_t v197;
  NSObject *v198;
  const char *v199;
  void *v200;
  unsigned __int8 v201;
  void *v202;
  _BOOL4 v203;
  id v204;
  const char *v205;
  void *v206;
  void *v207;
  BOOL v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  BOOL v212;
  void *v213;
  _BOOL4 v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  BOOL v218;
  uint64_t v219;
  NSObject *v220;
  id v221;
  void *v222;
  BOOL v223;
  uint64_t v224;
  id v225;
  uint64_t v226;
  const char *v227;
  const char *v228;
  void *v229;
  _BOOL4 v230;
  id v231;
  uint64_t v232;
  const char *v233;
  const char *v234;
  SEL v235;
  SEL v236;
  id v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  SEL v246;
  id v247;
  SEL v248;
  id v249;
  const char *v250;
  BOOL v251;
  id v252;
  void *v253;
  id v254;
  void *v255;
  SEL v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  const char *v260;
  uint64_t v261;
  NSObject *v262;
  const char *v263;
  id v264;
  void *v265;
  id v266;
  id v267;
  uint64_t v268;
  const char *v269;
  void *v270;
  BOOL v271;
  id v272;
  uint64_t v273;
  NSObject *v274;
  const char *v275;
  unsigned __int8 v276;
  id v277;
  id v278;
  id v279;
  id v280;
  SEL v281;
  id v282;
  id v283;
  id v284;
  SEL v285;
  id v286;
  id v287;
  SEL v288;
  id v289;
  void *v290;
  unsigned __int8 v291;
  int v292;
  _QWORD v293[4];
  id v294;
  NEHelperConfigurationManager *v295;
  id v296;
  BOOL v297;
  _QWORD v298[4];
  id v299;
  id v300;
  NEHelperConfigurationManager *v301;
  BOOL v302;
  _QWORD v303[4];
  id v304;
  _QWORD block[4];
  id v306;
  id v307;
  NEHelperConfigurationManager *v308;
  uint8_t *v309;
  id v310;
  int v311;
  BOOL v312;
  _QWORD v313[4];
  id v314;
  NEHelperConfigurationManager *v315;
  _BYTE *v316;
  _QWORD v317[5];
  id v318;
  id v319;
  _QWORD v320[5];
  id v321;
  id v322;
  char v323;
  _QWORD v324[4];
  id v325;
  size_t v326;
  size_t length;
  _QWORD v328[4];
  id v329;
  _QWORD v330[4];
  id v331;
  _BYTE buf[24];
  id (*v333)(uint64_t, uint64_t);
  void (*v334)(uint64_t);
  id v335;
  id (*v336)(uint64_t, uint64_t);

  v4 = a3;
  int64 = xpc_dictionary_get_int64(v4, "config-operation");
  if (!int64)
  {
    v10 = 0;
    goto LABEL_9;
  }
  v6 = int64;
  string = xpc_dictionary_get_string(v4, "config-plugin-type");
  if (string)
  {
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v4, "config-plugin-type"));
    string = (const char *)objc_claimAutoreleasedReturnValue(v9);
    v10 = (id (*)(uint64_t, uint64_t))string;
    if (!self)
      goto LABEL_8;
  }
  else
  {
    v10 = 0;
    if (!self)
    {
LABEL_8:
      sub_1000037E4((uint64_t)NEHelperServer, v4, 10, 0);
      goto LABEL_9;
    }
  }
  if (!self->_entitled)
    goto LABEL_8;
  if (v6 == 5 && !self->_superEntitled)
  {
    v11 = ne_log_obj(string, v8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = objc_getProperty(self, v13, 64, 1);
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Rejecting fetch-identities operation from non-super-entitled app %@", buf, 0xCu);
    }

    goto LABEL_8;
  }
  if (v10)
  {
    v336 = v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v336, 1));
    objc_msgSend(objc_getProperty(self, v15, 56, 1), "setObject:forKeyedSubscript:", v14, CFSTR("plugin-types"));

  }
  else
  {
    v16 = objc_msgSend(objc_getProperty(self, v8, 56, 1), "removeObjectForKey:", CFSTR("plugin-types"));
  }
  switch(v6)
  {
    case 1:
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
      v20 = objc_getProperty(self, v19, 56, 1);
      Property = objc_getProperty(self, v21, 32, 1);
      v330[0] = _NSConcreteStackBlock;
      v330[1] = 3221225472;
      v330[2] = sub_100015EA0;
      v330[3] = &unk_100039250;
      v331 = v4;
      objc_msgSend(v18, "loadIndexWithFilter:completionQueue:handler:", v20, Property, v330);

      goto LABEL_9;
    case 2:
      value = xpc_dictionary_get_value(v4, "config-ids-data");
      v24 = (void *)objc_claimAutoreleasedReturnValue(value);
      v25 = v24;
      if (v24 && xpc_get_type(v24) == (xpc_type_t)&_xpc_type_data)
      {
        v26 = objc_alloc((Class)NSKeyedUnarchiver);
        bytes_ptr = xpc_data_get_bytes_ptr(v25);
        v28 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(v25), 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        v30 = objc_msgSend(v26, "initForReadingFromData:error:", v29, 0);

        v31 = objc_opt_class(NSArray);
        v32 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v31, objc_opt_class(NSUUID), 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "decodeObjectOfClasses:forKey:", v33, CFSTR("config-identifiers")));

        v35 = isa_nsarray(v34);
        v36 = v35;
        v38 = ne_log_obj(v35, v37);
        v39 = objc_claimAutoreleasedReturnValue(v38);
        v40 = v39;
        if (v36)
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = objc_getProperty(self, v41, 64, 1);
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v34;
            _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%@ fetching configs with IDs: %@", buf, 0x16u);
          }

          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
          v44 = objc_getProperty(self, v43, 56, 1);
          v46 = objc_getProperty(self, v45, 32, 1);
          v328[0] = _NSConcreteStackBlock;
          v328[1] = 3221225472;
          v328[2] = sub_100015F80;
          v328[3] = &unk_100039278;
          v329 = v4;
          objc_msgSend(v42, "loadConfigurations:withFilter:completionQueue:completionHandler:", v34, v44, v46, v328);

        }
        else
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = objc_getProperty(self, v179, 64, 1);
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v34;
            _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%@ Received invalid config IDs: %@", buf, 0x16u);
          }

          sub_1000037E4((uint64_t)NEHelperServer, v4, 0, 0);
        }

      }
      goto LABEL_9;
    case 3:
      length = 0;
      data = xpc_dictionary_get_data(v4, "config-data", &length);
      v326 = 0;
      v48 = (void *)xpc_dictionary_get_data(v4, "config-signature", &v326);
      if (length > 0x80000)
      {
        v50 = ne_log_obj(v48, v49);
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v188 = objc_getProperty(self, v52, 64, 1);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v188;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = length;
          _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%@ configuration is too large: %lu", buf, 0x16u);
        }

        sub_1000037E4((uint64_t)NEHelperServer, v4, 2, 0);
        goto LABEL_9;
      }
      v125 = v48;
      v126 = 0;
      if (data && length)
      {
        v127 = objc_alloc((Class)NSKeyedUnarchiver);
        v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0));
        v129 = objc_msgSend(v127, "initForReadingFromData:error:", v128, 0);

        v130 = objc_msgSend(v129, "decodeObjectOfClass:forKey:", objc_opt_class(NEConfiguration), CFSTR("config-object"));
        v126 = (void *)objc_claimAutoreleasedReturnValue(v130);

      }
      if (!v125 || !v326)
      {
        if (self->_appGroupEntitled)
          goto LABEL_123;
        v131 = 0;
LABEL_104:
        v135 = objc_msgSend(objc_getProperty(self, v49, 24, 1), "count");
        if (!v135)
          goto LABEL_108;
        v135 = objc_getProperty(self, v136, 40, 1);
        if (!v135)
          goto LABEL_108;
        v132 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
        v150 = objc_getProperty(self, v149, 24, 1);
        objc_msgSend(v132, "addGroups:forApp:", v150, objc_getProperty(self, v151, 40, 1));

LABEL_107:
        goto LABEL_108;
      }
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v125));
      v131 = v48;
      if (!self->_appGroupEntitled)
        goto LABEL_104;
      if (!v48)
      {
LABEL_123:
        v167 = ne_log_obj(v48, v49);
        v168 = objc_claimAutoreleasedReturnValue(v167);
        if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
        {
          v225 = objc_getProperty(self, v169, 64, 1);
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v225;
          _os_log_error_impl((void *)&_mh_execute_header, v168, OS_LOG_TYPE_ERROR, "%@ cannot create new configurations because it is only app group entitled", buf, 0xCu);
        }

        sub_1000037E4((uint64_t)NEHelperServer, v4, 10, 0);
        goto LABEL_9;
      }
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "VPN"));
      if (v132)
        goto LABEL_107;
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "appVPN"));
      if (v132)
        goto LABEL_107;
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "contentFilter"));
      if (v132)
        goto LABEL_107;
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "dnsProxy"));
      if (v132)
        goto LABEL_107;
      v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "relay"));
      v134 = v133 == 0;

      if (v134)
      {
        v137 = ne_log_obj(v135, v136);
        v138 = objc_claimAutoreleasedReturnValue(v137);
        if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
        {
          v290 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "name"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v290;
          _os_log_error_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_ERROR, "Configuration type of %@ does not allow modification by app group entitled apps", buf, 0xCu);

        }
        sub_1000037E4((uint64_t)NEHelperServer, v4, 10, 0);

        goto LABEL_9;
      }
LABEL_108:
      if (!v126)
      {
        v176 = ne_log_obj(v135, v136);
        v177 = objc_claimAutoreleasedReturnValue(v176);
        if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
        {
          v254 = objc_getProperty(self, v178, 64, 1);
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v254;
          _os_log_error_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_ERROR, "%@ cannot save a configuration, no configuration provided", buf, 0xCu);
        }

        sub_1000037E4((uint64_t)NEHelperServer, v4, 8, 0);
        goto LABEL_9;
      }
      v152 = objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "pluginType"));
      v154 = (void *)v152;
      if (v10)
      {
        if (!v152 || (v152 = (uint64_t)objc_msgSend((id)v152, "isEqualToString:", v10), (v152 & 1) == 0))
        {
          v155 = ne_log_obj(v152, v153);
          v156 = objc_claimAutoreleasedReturnValue(v155);
          if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
          {
            v264 = objc_getProperty(self, v157, 64, 1);
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v264;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v154;
            *(_WORD *)&buf[22] = 2112;
            v333 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_ERROR, "%@ trying to save a configuration with a bad plugin type (%@), plugin type for this client is %@", buf, 0x20u);
          }
LABEL_231:

          sub_1000037E4((uint64_t)NEHelperServer, v4, 10, 0);
          goto LABEL_9;
        }
      }
      else if (!v152)
      {
        v292 = 1;
        goto LABEL_152;
      }
      if (!self->_hasProviderPermission)
      {
        v180 = ne_log_obj(v152, v153);
        v156 = objc_claimAutoreleasedReturnValue(v180);
        if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
        {
          v272 = objc_getProperty(self, v181, 64, 1);
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v272;
          _os_log_error_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_ERROR, "%@ is not allowed to save provider-based configurations", buf, 0xCu);
        }
        goto LABEL_231;
      }
      v292 = 0;
LABEL_152:
      v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "contentFilter"));
      v190 = v189 == 0;

      if (v190)
        goto LABEL_166;
      v192 = objc_getProperty(self, v191, 40, 1);
      v193 = sub_100016174((uint64_t)NEHelperConfigurationManager, v192);
      self->_isCurrentAllowedContentFilterApp = v193;
      if ((v193 & 1) != 0)
        goto LABEL_166;
      if (!v131 && !self->_isDevelopment)
      {
        v195 = objc_getProperty(self, v194, 40, 1);
        if (v195)
        {
          v197 = ne_log_obj(v195, v196);
          v198 = objc_claimAutoreleasedReturnValue(v197);
          if (os_log_type_enabled(v198, OS_LOG_TYPE_ERROR))
          {
            v280 = objc_getProperty(self, v199, 64, 1);
            v282 = objc_getProperty(self, v281, 64, 1);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v280;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v282;
            _os_log_error_impl((void *)&_mh_execute_header, v198, OS_LOG_TYPE_ERROR, "%@ trying to create a content filter configuration through an app. Creating a content filter configuration is only allowed through profile in production version of %@.", buf, 0x16u);
          }

          sub_1000037E4((uint64_t)NEHelperServer, v4, 10, 0);
          goto LABEL_9;
        }
      }
      if (!objc_opt_class(MCProfileConnection)
        || (v200 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection")), v201 = objc_msgSend(v200, "isSupervised"), v200, (v201 & 1) == 0))
      {
        v202 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "externalIdentifier"));
        v203 = v202 == 0;

        if (v203)
        {
          if (!self->_isDevelopment || (v204 = objc_getProperty(self, v205, 40, 1)) == 0)
          {
            v268 = ne_log_obj(v204, v205);
            v156 = objc_claimAutoreleasedReturnValue(v268);
            if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
            {
              v278 = objc_getProperty(self, v269, 64, 1);
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v278;
              _os_log_error_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_ERROR, "%@ trying to save a content filter configuration on an unsupervised device", buf, 0xCu);
            }
            goto LABEL_231;
          }
          v261 = ne_log_obj(v204, v205);
          v262 = objc_claimAutoreleasedReturnValue(v261);
          if (os_log_type_enabled(v262, OS_LOG_TYPE_ERROR))
          {
            v287 = objc_getProperty(self, v263, 64, 1);
            v289 = objc_getProperty(self, v288, 64, 1);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v287;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v289;
            _os_log_error_impl((void *)&_mh_execute_header, v262, OS_LOG_TYPE_ERROR, "Warning: allowing creation/modification of a content filter configuration on non-supervised device because the requesting app (%@) is a development version. This will not be allowed for the production version of %@", buf, 0x16u);
          }

        }
      }
      if (self->_superEntitled
        || (v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "externalIdentifier"))) == 0
        || (v207 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "payloadInfo")),
            v208 = objc_msgSend(v207, "profileSource") == (id)2,
            v207,
            v206,
            v208))
      {
LABEL_166:
        v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "dnsProxy"));
        if (v211)
        {
          v212 = objc_msgSend(v126, "grade") == (id)2;

          if (!v212)
          {
            v213 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "payloadInfo"));
            v214 = v213 == 0;

            if (v214)
            {
              if (!self->_isDevelopment && !self->_platformEntitled)
              {
                v226 = ne_log_obj(v215, v216);
                v156 = objc_claimAutoreleasedReturnValue(v226);
                if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
                {
                  v284 = objc_getProperty(self, v227, 64, 1);
                  v286 = objc_getProperty(self, v285, 64, 1);
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v284;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v286;
                  _os_log_error_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_ERROR, "The production version of %@ is not allowed to create DNS proxy configurations. Use MDM to create DNS Proxy configurations for the production version of %@.", buf, 0x16u);
                }
                goto LABEL_231;
              }
            }
            else if (!v131)
            {
              if (!self->_platformEntitled
                || (v217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "payloadInfo")),
                    v218 = objc_msgSend(v217, "profileSource") == (id)2,
                    v217,
                    !v218))
              {
                v219 = ne_log_obj(v215, v216);
                v220 = objc_claimAutoreleasedReturnValue(v219);
                if (os_log_type_enabled(v220, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, v220, OS_LOG_TYPE_ERROR, "DNS Proxy configurations can only be created via MDM", buf, 2u);
                }

                sub_1000037E4((uint64_t)NEHelperServer, v4, 21, 0);
                goto LABEL_9;
              }
            }
          }
        }
        v229 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "dnsSettings"));
        if (v229)
        {
          v230 = objc_msgSend(v126, "grade") == (id)1;

          if (v230)
          {
            v231 = objc_getProperty(self, v228, 40, 1);
            if (v231)
            {
              v232 = ne_log_obj(v231, v228);
              v156 = objc_claimAutoreleasedReturnValue(v232);
              if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
              {
                v277 = objc_getProperty(self, v233, 64, 1);
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v277;
                _os_log_error_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_ERROR, "%@ trying to create an enterprise DNS Settings configuration through an app. Creating an enterprise DNS Settings configuration is only allowed through profile.", buf, 0xCu);
              }
              goto LABEL_231;
            }
          }
        }
        if (objc_getProperty(self, v228, 40, 1))
        {
          objc_msgSend(v126, "setApplicationIdentifier:", objc_getProperty(self, v234, 40, 1));
          objc_msgSend(v126, "setApplication:", objc_getProperty(self, v235, 40, 1));
          v237 = +[NELaunchServices bundleProxyForIdentifier:uid:plugins:](NELaunchServices, "bundleProxyForIdentifier:uid:plugins:", objc_getProperty(self, v236, 40, 1), self->_userUID, 0);
          v238 = (void *)objc_claimAutoreleasedReturnValue(v237);
          v239 = v238;
          if (v238)
          {
            v240 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v238, "name"));
            objc_msgSend(v126, "setApplicationName:", v240);

          }
        }
        if (!self->_superEntitled)
        {
          v241 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "payloadInfo"));
          if (objc_msgSend(v241, "profileSource") == (id)2)
          {
LABEL_199:

            goto LABEL_200;
          }
          v242 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
          if (objc_msgSend(v242, "isVPNCreationAllowed"))
          {

            goto LABEL_199;
          }
          v255 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
          v291 = objc_msgSend(v255, "isAppManaged:", objc_getProperty(self, v256, 72, 1));

          if ((v291 & 1) == 0)
          {
            v259 = ne_log_obj(v257, v258);
            v156 = objc_claimAutoreleasedReturnValue(v259);
            if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
            {
              v279 = objc_getProperty(self, v260, 64, 1);
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v279;
              _os_log_error_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_ERROR, "%@ cannot save configuration, vpn creation from app is restricted", buf, 0xCu);
            }
            goto LABEL_231;
          }
        }
LABEL_200:
        if (self->_superEntitled)
          goto LABEL_203;
        v243 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "dnsSettings"));
        if (v243)
        {
LABEL_202:

LABEL_203:
          if ((v292 & 1) != 0)
            goto LABEL_208;
          goto LABEL_204;
        }
        v243 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "contentFilter"));
        if (v243)
          v251 = v10 != 0;
        else
          v251 = 0;
        if (!v251)
        {
          v252 = objc_getProperty(self, v250, 40, 1);
          if (!v252)
            goto LABEL_202;
          v253 = v252;
          if (!v292)
          {
            v276 = +[NETunnelProviderProtocol isLegacyPluginType:](NETunnelProviderProtocol, "isLegacyPluginType:", v154);

            if ((v276 & 1) != 0)
            {
LABEL_204:
              v244 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "appVPN"));
              if (v244
                || (v244 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "contentFilter"))) != 0)
              {

              }
              else
              {
                v270 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "dnsProxy"));
                v271 = v270 == 0;

                if (v271)
                  goto LABEL_208;
              }
              sub_100016310((uint64_t)NEHelperConfigurationManager, v154, v126);
LABEL_208:
              v245 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
              v247 = objc_getProperty(self, v246, 48, 1);
              v249 = objc_getProperty(self, v248, 32, 1);
              v324[0] = _NSConcreteStackBlock;
              v324[1] = 3221225472;
              v324[2] = sub_100016760;
              v324[3] = &unk_1000392A0;
              v325 = v4;
              objc_msgSend(v245, "saveConfigurationToDisk:currentSignature:userUUID:isUpgrade:completionQueue:completionHandler:", v126, v131, v247, 0, v249, v324);

              goto LABEL_9;
            }
LABEL_217:
            sub_1000161E0(self, v126, v131, v4);

            goto LABEL_9;
          }

        }
        goto LABEL_217;
      }
      v273 = ne_log_obj(v209, v210);
      v274 = objc_claimAutoreleasedReturnValue(v273);
      if (os_log_type_enabled(v274, OS_LOG_TYPE_ERROR))
      {
        v283 = objc_getProperty(self, v275, 64, 1);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v283;
        _os_log_error_impl((void *)&_mh_execute_header, v274, OS_LOG_TYPE_ERROR, "%@ perApp content filter configuration can only be created via MDM", buf, 0xCu);
      }

      sub_1000037E4((uint64_t)NEHelperServer, v4, 21, 0);
LABEL_9:

      return;
    case 4:
      if (self->_appGroupEntitled)
      {
        v122 = ne_log_obj(v16, v17);
        v123 = objc_claimAutoreleasedReturnValue(v122);
        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = objc_getProperty(self, v124, 64, 1);
          _os_log_error_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_ERROR, "%@ is not allowed to remove configurations because it is only app group entitled", buf, 0xCu);
        }

        sub_1000037E4((uint64_t)NEHelperServer, v4, 10, 0);
      }
      else
      {
        uuid = xpc_dictionary_get_uuid(v4, "config-identifier");
        if (!uuid)
          goto LABEL_116;
        v105 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", uuid);
        v107 = ne_log_obj(v105, v106);
        v108 = objc_claimAutoreleasedReturnValue(v107);
        if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = objc_getProperty(self, v109, 64, 1);
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v105;
          _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_INFO, "%@ is removing configuration %@", buf, 0x16u);
        }

        v110 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
        v112 = objc_getProperty(self, v111, 32, 1);
        v320[0] = _NSConcreteStackBlock;
        v320[1] = 3221225472;
        v320[2] = sub_10001679C;
        v320[3] = &unk_1000392F0;
        v320[4] = self;
        v323 = 0;
        v321 = v4;
        v322 = v105;
        v113 = v105;
        objc_msgSend(v110, "loadConfigurationWithID:withCompletionQueue:handler:", v113, v112, v320);

      }
      goto LABEL_9;
    case 5:
      *(_QWORD *)buf = 0;
      v114 = xpc_dictionary_get_data(v4, "identity-reference", (size_t *)buf);
      v116 = objc_getProperty(self, v115, 40, 1);
      if (v116)
      {

      }
      else if (!self->_appGroupEntitled)
      {
        if (v114)
          v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v114, *(_QWORD *)buf, 0));
        else
          v145 = 0;
        v182 = +[NEIdentityKeychainItem copyIdentities:fromDomain:](NEIdentityKeychainItem, "copyIdentities:fromDomain:", v145, 0);
        v146 = v182;
        if (v182)
          v147 = (void *)_CFXPCCreateXPCObjectFromCFObject(v182);
        else
          v147 = 0;
        v148 = 0;
LABEL_98:
        sub_1000037E4((uint64_t)NEHelperServer, v4, v148, v147);

        goto LABEL_9;
      }
      v145 = 0;
      v146 = 0;
      v147 = 0;
      v148 = 10;
      goto LABEL_98;
    case 6:
      sub_100016998(self, v4);
      goto LABEL_9;
    case 7:
      if (!self->_superEntitled)
        goto LABEL_116;
      v53 = xpc_dictionary_get_uuid(v4, "config-identifier");
      if (!v53)
        goto LABEL_116;
      v54 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v53);
      v55 = sub_100016B10((uint64_t)NEHelperPendingOperation, v54);
      v57 = v55;
      if (v55 && v55[2] == 3)
      {
        v58 = objc_msgSend(objc_getProperty(v55, v56, 32, 1), "dnsProxy");
        v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
        v60 = v59 == 0;

        if (v60)
        {
          v183 = objc_msgSend(objc_getProperty(v57, v61, 32, 1), "contentFilter");
          v184 = (void *)objc_claimAutoreleasedReturnValue(v183);
          v185 = v184 == 0;

          if (v185)
          {
            v221 = objc_msgSend(objc_getProperty(v57, v186, 32, 1), "relay");
            v222 = (void *)objc_claimAutoreleasedReturnValue(v221);
            v223 = v222 == 0;

            if (v223)
              v224 = NEResourcesCopyLocalizedNSString(CFSTR("APP_AUTHEN_HEADER_VPN"), CFSTR("APP_AUTHEN_HEADER_VPN"));
            else
              v224 = NEResourcesCopyLocalizedNSString(CFSTR("APP_AUTHEN_HEADER_RELAY"), CFSTR("APP_AUTHEN_HEADER_RELAY"));
            v63 = objc_claimAutoreleasedReturnValue(v224);
          }
          else
          {
            v187 = NEResourcesCopyLocalizedNSString(CFSTR("APP_AUTHEN_HEADER_FILTER"), CFSTR("APP_AUTHEN_HEADER_FILTER"));
            v63 = objc_claimAutoreleasedReturnValue(v187);
          }
        }
        else
        {
          v62 = NEResourcesCopyLocalizedNSString(CFSTR("APP_AUTHEN_HEADER_DNS_PROXY"), CFSTR("APP_AUTHEN_HEADER_DNS_PROXY"));
          v63 = objc_claimAutoreleasedReturnValue(v62);
        }
        v265 = (void *)v63;
        v266 = objc_getProperty(self, v64, 32, 1);
        v317[0] = _NSConcreteStackBlock;
        v317[1] = 3221225472;
        v317[2] = sub_100016C1C;
        v317[3] = &unk_100039340;
        v317[4] = self;
        v318 = v57;
        v319 = v4;
        v267 = v57;
        +[NEUserNotification promptForLocalAuthenticationWithReason:completionQueue:completionHandler:](NEUserNotification, "promptForLocalAuthenticationWithReason:completionQueue:completionHandler:", v265, v266, v317);

      }
      else
      {

LABEL_116:
        sub_1000037E4((uint64_t)NEHelperServer, v4, 8, 0);
      }
      goto LABEL_9;
    case 8:
      v65 = xpc_dictionary_get_string(v4, "client-name");
      if (v65)
      {
        v66 = sub_10000DDE4((uint64_t)NEHelperServer);
        v67 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue(v66);
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v65));
        v69 = sub_10000FB20(v67, v68);

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v333 = sub_100016D84;
        v334 = sub_100016DAC;
        v335 = 0;
        v313[0] = _NSConcreteStackBlock;
        v313[1] = 3221225472;
        v313[2] = sub_100016DB4;
        v313[3] = &unk_100039390;
        v315 = self;
        v316 = buf;
        v314 = v4;
        v70 = objc_retainBlock(v313);
        v71 = objc_retainBlock(v70);
        v72 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v71;

        ((void (*)(_QWORD *, id, _QWORD))v70[2])(v70, v69, 0);
        _Block_object_dispose(buf, 8);

      }
      else
      {
        sub_1000037E4((uint64_t)NEHelperServer, v4, 22, 0);
      }
      goto LABEL_9;
    case 9:
      v117 = xpc_dictionary_get_string(v4, "config-plugin-type");
      if (v117)
      {
        v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v117));
        v119 = sub_100016F34(v118);

        if (isa_nsdictionary(v119))
          v120 = (void *)_CFXPCCreateXPCObjectFromCFObject(v119);
        else
          v120 = 0;

      }
      else
      {
        v120 = 0;
      }
      sub_1000037E4((uint64_t)NEHelperServer, v4, 0, v120);

      goto LABEL_9;
    case 11:
      sub_100016A54(self, v4);
      goto LABEL_9;
    case 13:
      v73 = xpc_dictionary_get_value(v4, "config-ids");
      v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
      v77 = objc_getProperty(self, v76, 32, 1);
      v303[0] = _NSConcreteStackBlock;
      v303[1] = 3221225472;
      v303[2] = sub_100017C0C;
      v303[3] = &unk_1000394A8;
      v304 = v4;
      objc_msgSend(v75, "syncConfigurationsWithSC:completionQueue:completionHandler:", v74, v77, v303);

      goto LABEL_9;
    case 14:
      v79 = xpc_dictionary_get_uuid(v4, "config-identifier");
      if (!v79)
      {
        v142 = ne_log_obj(0, v78);
        v143 = objc_claimAutoreleasedReturnValue(v142);
        if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_ERROR, "Invalid configuration ID", buf, 2u);
        }
        goto LABEL_89;
      }
      v80 = xpc_dictionary_get_BOOL(v4, "enabled");
      v81 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v79);
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
      v84 = objc_getProperty(self, v83, 56, 1);
      v86 = objc_getProperty(self, v85, 32, 1);
      v298[0] = _NSConcreteStackBlock;
      v298[1] = 3221225472;
      v298[2] = sub_100017C28;
      v298[3] = &unk_1000394F8;
      v299 = v81;
      v300 = v4;
      v301 = self;
      v302 = v80;
      v87 = v81;
      objc_msgSend(v82, "loadIndexWithFilter:completionQueue:handler:", v84, v86, v298);

      goto LABEL_9;
    case 15:
      v88 = xpc_dictionary_get_string(v4, "app-bundle-id");
      v89 = xpc_dictionary_get_BOOL(v4, "enable-required");
      if (v88)
      {
        v91 = v89;
        v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v88));
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
        v95 = objc_getProperty(self, v94, 32, 1);
        v293[0] = _NSConcreteStackBlock;
        v293[1] = 3221225472;
        v293[2] = sub_100017E14;
        v293[3] = &unk_100039520;
        v297 = v91;
        v294 = v92;
        v295 = self;
        v296 = v4;
        v96 = v92;
        objc_msgSend(v93, "loadConfigurations:withFilter:completionQueue:completionHandler:", 0, 0, v95, v293);

      }
      else
      {
        v144 = ne_log_obj(v89, v90);
        v143 = objc_claimAutoreleasedReturnValue(v144);
        if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_ERROR, "Failed to check config, invalid bundle ID", buf, 2u);
        }
LABEL_89:

        sub_1000037E4((uint64_t)NEHelperServer, v4, 22, 0);
      }
      goto LABEL_9;
    case 16:
      v97 = xpc_dictionary_get_string(v4, "bundle-id");
      v98 = xpc_dictionary_get_int64(v4, "pid");
      v99 = xpc_dictionary_get_uuid(v4, "uuid");
      v101 = (uint8_t *)v99;
      if (v99)
      {
        v99 = (const uint8_t *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v99);
        v101 = (uint8_t *)v99;
      }
      if (!v97 && !v98)
      {
        v102 = ne_log_obj(v99, v100);
        v103 = objc_claimAutoreleasedReturnValue(v102);
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "Failed to get bundle ID or PID from message", buf, 2u);
        }
LABEL_50:

        sub_1000037E4((uint64_t)NEHelperServer, v4, 22, 0);
        goto LABEL_129;
      }
      if (v97)
      {
        v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v97));
        if (!v140)
        {
          v141 = ne_log_obj(0, v139);
          v103 = objc_claimAutoreleasedReturnValue(v141);
          if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = v97;
            _os_log_error_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "Failed to convert BundleID for message (bundle_id: %s)", buf, 0xCu);
          }
          goto LABEL_50;
        }
      }
      else
      {
        v140 = 0;
      }
      v159 = xpc_dictionary_get_string(v4, "query");
      if (v159)
      {
        v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v159));
        if (v161)
          goto LABEL_128;
        v162 = ne_log_obj(0, v160);
        v163 = objc_claimAutoreleasedReturnValue(v162);
        if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v159;
          v164 = "Failed to convert query (query_string: %s)";
          v165 = v163;
          v166 = 12;
LABEL_179:
          _os_log_debug_impl((void *)&_mh_execute_header, v165, OS_LOG_TYPE_DEBUG, v164, buf, v166);
        }
      }
      else
      {
        v170 = ne_log_obj(0, v158);
        v163 = objc_claimAutoreleasedReturnValue(v170);
        if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v164 = "No query string in message";
          v165 = v163;
          v166 = 2;
          goto LABEL_179;
        }
      }

      v161 = 0;
LABEL_128:
      v171 = xpc_dictionary_get_BOOL(v4, "has-entitlement");
      v172 = sub_100017134((uint64_t)NEHelperConfigurationManager);
      v173 = objc_claimAutoreleasedReturnValue(v172);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100017178;
      block[3] = &unk_100039480;
      v306 = v140;
      v307 = v4;
      v308 = self;
      v311 = v98;
      v309 = v101;
      v310 = v161;
      v312 = v171;
      v174 = v161;
      v175 = v140;
      dispatch_async(v173, block);

LABEL_129:
      goto LABEL_9;
    case 17:
      v121 = xpc_dictionary_get_BOOL(v4, "reset-all");
      sub_100017040((uint64_t)NEHelperConfigurationManager, v121, 0, 0);
      goto LABEL_9;
    default:
      goto LABEL_9;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationContext, 0);
  objc_storeStrong((id *)&self->_addNotification, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_appGroups, 0);
}

@end
