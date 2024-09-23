@implementation MSDLocalMessageResponder

+ (id)sharedInstance
{
  if (qword_100175248 != -1)
    dispatch_once(&qword_100175248, &stru_10013E388);
  return (id)qword_100175240;
}

- (id)getEntitlementsFrom:(id)a3
{
  __SecTask *v3;
  __SecTask *v4;
  __CFString *v5;
  _UNKNOWN **v6;
  _UNKNOWN **v7;
  CFTypeID v8;
  CFTypeID v9;
  void *v10;
  unsigned __int8 v11;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  audit_token_t v31;
  audit_token_t v32;

  memset(&v32, 0, sizeof(v32));
  xpc_connection_get_audit_token(a3, &v32);
  v31 = v32;
  v3 = SecTaskCreateWithAuditToken(0, &v31);
  if (v3)
  {
    v4 = v3;
    v5 = (__CFString *)SecTaskCopySigningIdentifier(v3, 0);
    v6 = (_UNKNOWN **)SecTaskCopyValueForEntitlement(v4, CFSTR("com.apple.private.mobilestoredemo.enabledemo"), 0);
    if (v6)
    {
      v7 = v6;
      v8 = CFGetTypeID(v6);
      if (v8 != CFBooleanGetTypeID())
      {
        v9 = CFGetTypeID(v7);
        if (v9 != CFArrayGetTypeID())
          v7 = 0;
LABEL_8:
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
        if (objc_msgSend(v10, "macOS"))
        {
          if ((-[__CFString containsString:](v5, "containsString:", CFSTR("com.apple.SecurityAgentHelper")) & 1) != 0)
          {

          }
          else
          {
            v11 = -[__CFString containsString:](v5, "containsString:", CFSTR("com.apple.SecurityAgent"));

            if ((v11 & 1) == 0)
            {
LABEL_14:
              CFRelease(v4);
              goto LABEL_15;
            }
          }
          v10 = v7;
          v7 = &off_10014E3D8;
        }

        goto LABEL_14;
      }
      if (CFBooleanGetValue((CFBooleanRef)v7))
      {
        CFRelease(v7);
        v7 = &off_10014E3C0;
        goto LABEL_8;
      }
    }
    else
    {
      v22 = sub_1000605D0();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_1000BC294(v23, v24, v25, v26, v27, v28, v29, v30);

    }
    v7 = 0;
    goto LABEL_8;
  }
  v13 = sub_1000605D0();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_1000BC224(v14, v15, v16, v17, v18, v19, v20, v21);

  v5 = 0;
  v7 = 0;
LABEL_15:

  return v7;
}

- (BOOL)checkEntitlementsWithRequest:(id)a3 from:(id)a4
{
  id v6;
  void *v7;
  const char *string;
  void *v9;
  const char *v10;
  __CFString *v11;
  const __CFString *v12;
  _UNKNOWN **v13;
  const char *v14;
  int v15;
  unsigned int v16;
  BOOL v17;
  id v19;
  NSObject *v20;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder getEntitlementsFrom:](self, "getEntitlementsFrom:", a4));
  if (!v7)
  {
    v19 = sub_1000605D0();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1000BC304();

    goto LABEL_37;
  }
  string = xpc_dictionary_get_string(v6, "RequestOperation");
  if (string)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("GetDeviceOptions"))
      && (v10 = xpc_dictionary_get_string(v6, "SubKey")) != 0)
    {
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v10));
    }
    else
    {
      v11 = 0;
    }
    if (objc_msgSend(&off_10014E408, "containsObject:", v9))
    {
      v12 = CFSTR("Enroll");
    }
    else
    {
      if (objc_msgSend(&off_10014E3F0, "containsObject:", v9))
      {
        if ((objc_msgSend(v7, "containsObject:", CFSTR("Manage")) & 1) != 0)
          goto LABEL_11;
        if (!objc_msgSend(v7, "containsObject:", CFSTR("DigitalCatalog")))
        {
LABEL_36:

LABEL_37:
          v17 = 0;
          goto LABEL_25;
        }
        v13 = &off_10014E438;
        v12 = v11;
LABEL_10:
        if ((objc_msgSend(v13, "containsObject:", v12) & 1) != 0)
        {
LABEL_11:

          goto LABEL_12;
        }
        goto LABEL_36;
      }
      if (objc_msgSend(&off_10014E420, "containsObject:", v9))
      {
        v12 = CFSTR("AccessPersistDemoVolume");
      }
      else if (objc_msgSend(&off_10014E450, "containsObject:", v9))
      {
        v12 = CFSTR("KeychainAccess");
      }
      else if (objc_msgSend(&off_10014E468, "containsObject:", v9))
      {
        v12 = CFSTR("UserKeychainAccess");
      }
      else
      {
        if (!objc_msgSend(&off_10014E480, "containsObject:", v9))
        {
          if (objc_msgSend(&off_10014E498, "containsObject:", v9)
            && objc_msgSend(v7, "containsObject:", CFSTR("PeerDemoDevice")))
          {
            goto LABEL_11;
          }
          goto LABEL_36;
        }
        v12 = CFSTR("SecurityPlugin");
      }
    }
    v13 = (_UNKNOWN **)v7;
    goto LABEL_10;
  }
LABEL_12:
  v14 = xpc_dictionary_get_string(v6, "QueryDeviceInfo");
  if (v14)
  {
    v15 = strncmp(v14, "MSDDemoDeviceFrozen", 0x14uLL);
    v16 = objc_msgSend(v7, "containsObject:", CFSTR("Manage"));
    if (v15)
    {
      if (!v16)
        goto LABEL_37;
    }
    else if ((v16 & 1) == 0 && (objc_msgSend(v7, "containsObject:", CFSTR("SecurityPlugin")) & 1) == 0)
    {
      goto LABEL_37;
    }
  }
  if (xpc_dictionary_get_string(v6, "PricingMessage")
    && (objc_msgSend(v7, "containsObject:", CFSTR("Manage")) & 1) == 0)
  {
    goto LABEL_37;
  }
  v17 = 1;
LABEL_25:

  return v17;
}

- (void)start
{
  void *v3;
  xpc_connection_t mach_service;
  void *v5;
  _xpc_connection_s *v6;
  void *v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  _xpc_connection_s *v10;
  id v11;
  NSObject *v12;
  _QWORD handler[5];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder xpcListener](self, "xpcListener"));

  if (!v3)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.mobilestoredemod", 0, 1uLL);
    -[MSDLocalMessageResponder setXpcListener:](self, "setXpcListener:", mach_service);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder xpcListener](self, "xpcListener"));
    if (!v5)
    {
      v11 = sub_1000605D0();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Could not create XPC listener.", buf, 2u);
      }

      exit(1);
    }
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder xpcListener](self, "xpcListener"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](MSDWorkQueueSet, "sharedInstance"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageQueue"));
    xpc_connection_set_target_queue(v6, v8);

    v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder xpcListener](self, "xpcListener"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000338C4;
    handler[3] = &unk_10013E3B0;
    handler[4] = self;
    xpc_connection_set_event_handler(v9, handler);

    v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder xpcListener](self, "xpcListener"));
    xpc_connection_resume(v10);

  }
}

- (void)handleMessage:(id)a3 from:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  const char *string;
  id v12;
  NSObject *v13;
  int64_t int64;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  _BOOL4 v19;
  unsigned int v20;
  void *v21;
  unsigned __int8 v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  _QWORD *v38;
  void *v39;
  NSObject *v40;
  NSObject *reply;
  const char *v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  void *v48;
  id v49;
  unsigned __int8 v50;
  unsigned int v51;
  unsigned __int8 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unsigned __int8 v56;
  const char *v57;
  id v58;
  unsigned __int8 v59;
  unsigned int v60;
  id *v61;
  id v62;
  id v63;
  NSString *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unsigned int v71;
  const char *v72;
  id v73;
  NSObject *v74;
  id v75;
  NSObject *v76;
  id v77;
  NSObject *v78;
  id v79;
  NSObject *v80;
  id v81;
  NSObject *v82;
  dispatch_queue_global_t global_queue;
  NSObject *v84;
  unsigned __int8 v85;
  void *v86;
  id v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  unsigned __int8 v93;
  unsigned int v94;
  void *v95;
  NSObject *v96;
  void *v97;
  _BOOL8 v98;
  _BOOL8 v99;
  _BOOL4 v100;
  unsigned int v101;
  unsigned __int8 v102;
  NSObject *v103;
  xpc_object_t v104;
  const char *v105;
  void *v106;
  uint64_t v107;
  BOOL v108;
  id v109;
  NSObject *v110;
  xpc_object_t v111;
  NSString *v112;
  void *v113;
  const char *v114;
  id v115;
  NSObject *v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  id *v120;
  NSObject *v121;
  NSObject *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  NSObject *v128;
  void *v129;
  dispatch_semaphore_t v130;
  void *v131;
  NSString *v132;
  void *v133;
  NSString *v134;
  void *v135;
  void *v136;
  NSObject *v137;
  unsigned int v138;
  unsigned int v139;
  id v140;
  NSObject *v141;
  dispatch_time_t v142;
  id v143;
  NSObject *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  NSObject *v153;
  void *v154;
  id v155;
  id v156;
  NSObject *v157;
  void *v158;
  unsigned __int8 v159;
  void *v160;
  id v161;
  NSObject *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  id v168;
  id v169;
  id v170;
  void *v171;
  void *v172;
  xpc_object_t v173;
  xpc_object_t v174;
  void *v175;
  xpc_object_t v176;
  void *v177;
  NSDate *v178;
  NSDate *v179;
  void *v180;
  NSObject *v181;
  BOOL v182;
  id v183;
  NSObject *v184;
  id v185;
  id v186;
  NSObject *v187;
  void *v188;
  unsigned int v189;
  id v190;
  NSObject *v191;
  unsigned __int8 v192;
  xpc_object_t v193;
  const char *v194;
  void *v195;
  const char *v196;
  void *v197;
  void *v198;
  NSObject *v199;
  NSObject *v200;
  id v201;
  int v202;
  NSString *v203;
  NSObject *v204;
  id v205;
  id v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  xpc_object_t v214;
  xpc_object_t v215;
  void *v216;
  const char *v217;
  id v218;
  NSObject *v219;
  BOOL v220;
  id v221;
  unsigned __int8 v222;
  void *v223;
  NSObject *v224;
  id v225;
  NSObject *v226;
  double v227;
  NSString *v228;
  void *v229;
  const void *data;
  id v231;
  id v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  NSSet *v236;
  void *v237;
  void *v238;
  id v239;
  void *v240;
  void *v241;
  NSString *v242;
  void *v243;
  NSString *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  id v251;
  NSObject *v252;
  void *v253;
  xpc_object_t v254;
  void *v255;
  id v256;
  id v257;
  NSObject *v258;
  id v259;
  NSObject *v260;
  id v261;
  id v262;
  void *v263;
  NSObject *v264;
  void *v265;
  id v266;
  id v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  void *v275;
  unsigned __int8 v276;
  NSObject *v277;
  void *v278;
  void *v279;
  unsigned __int8 v280;
  xpc_object_t v281;
  xpc_object_t array;
  void *v283;
  id v284;
  NSObject *v285;
  void *v286;
  void *v287;
  unsigned __int8 v288;
  id v289;
  NSObject *v290;
  void *v291;
  void *v292;
  id v293;
  NSObject *v294;
  double v295;
  void *v296;
  void *v297;
  id v298;
  NSObject *v299;
  double v300;
  id v301;
  NSObject *v302;
  id v303;
  int has_internal_content;
  BOOL v305;
  xpc_object_t v306;
  void *v307;
  NSObject *v308;
  NSDate *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  id v315;
  NSObject *v316;
  void *v317;
  unsigned __int8 v318;
  xpc_object_t v319;
  void *v320;
  char v321;
  id v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  int v330;
  BOOL v331;
  NSObject *v332;
  id v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  id v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  id v349;
  NSObject *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v361;
  _xpc_connection_s *connection;
  id obj;
  id v364;
  _QWORD applier[4];
  id v366;
  id v367;
  id v368;
  _QWORD v369[4];
  id v370;
  MSDLocalMessageResponder *v371;
  _QWORD v372[4];
  NSObject *v373;
  _QWORD v374[4];
  id v375;
  _QWORD v376[4];
  NSObject *v377;
  BOOL value;
  id v379;
  _QWORD v380[4];
  id v381;
  _xpc_connection_s *v382;
  NSObject *v383;
  id v384;
  MSDLocalMessageResponder *v385;
  uint64_t *v386;
  uint64_t *v387;
  _QWORD v388[5];
  id v389;
  _xpc_connection_s *v390;
  _QWORD v391[6];
  int v392;
  _QWORD block[5];
  id v394;
  id v395;
  id v396;
  id v397;
  id v398;
  uint64_t *v399;
  uint64_t *v400;
  uint64_t v401;
  uint64_t *v402;
  uint64_t v403;
  char v404;
  uint64_t v405;
  id *v406;
  uint64_t v407;
  uint64_t (*v408)(uint64_t, uint64_t);
  void (*v409)(uint64_t);
  id v410;
  uint64_t v411;
  void *v412;
  _BYTE buf[24];

  v5 = a3;
  connection = (_xpc_connection_s *)a4;
  v405 = 0;
  v406 = (id *)&v405;
  v407 = 0x3032000000;
  v408 = sub_10003762C;
  v409 = sub_10003763C;
  v410 = 0;
  v401 = 0;
  v402 = &v401;
  v403 = 0x2020000000;
  v404 = 0;
  v353 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPricingUpdateController sharedInstance](MSDPricingUpdateController, "sharedInstance"));
  v6 = sub_1000605D0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1000BCBF4();

  v8 = -[MSDLocalMessageResponder checkEntitlementsWithRequest:from:](self, "checkEntitlementsWithRequest:from:", v5, connection);
  *((_BYTE *)v402 + 24) = v8;
  if ((v8 & 1) == 0)
  {
    v155 = sub_1000605D0();
    reply = objc_claimAutoreleasedReturnValue(v155);
    if (os_log_type_enabled(reply, OS_LOG_TYPE_ERROR))
      sub_1000BCBC8();
    v356 = 0;
    v357 = 0;
    v361 = 0;
    v351 = 0;
    v352 = 0;
    v354 = 0;
    v355 = 0;
    v358 = 0;
    v359 = 0;
    v10 = 0;
    goto LABEL_127;
  }
  v361 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v357 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateController sharedInstance](MSDDemoUpdateController, "sharedInstance"));
  v356 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPairedWatchProxy sharedInstance](MSDPairedWatchProxy, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithXPCDictionary:](NSDictionary, "dictionaryWithXPCDictionary:", v5));
  v10 = v9;
  if (!v9)
  {
    v351 = 0;
    v352 = 0;
    v354 = 0;
    v355 = 0;
    v358 = 0;
    v359 = 0;
    goto LABEL_126;
  }
  v359 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("ContentServer")));
  v358 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("Port")));
  v355 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("PairingCredential")));
  v354 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("DeviceName")));
  v352 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("ContainerUniqueIdentifier")));
  v351 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("PersistentDataBlob")));
  string = xpc_dictionary_get_string(v5, "RequestOperation");
  if (!string)
    goto LABEL_79;
  v12 = sub_1000605D0();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = string;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received an operation request: %{public}s", buf, 0xCu);
  }

  int64 = xpc_dictionary_get_int64(v5, "Duration");
  if (int64)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)int64));
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v17 = v16;

    v18 = (int)v17;
  }
  else
  {
    v18 = 0;
  }
  v19 = xpc_dictionary_get_BOOL(v5, "IgnorePairedDevice");
  if (objc_msgSend(v361, "isBetterTogetherDemo"))
    v20 = objc_msgSend(v356, "paired") & !v19;
  else
    v20 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", string, 4));
  v22 = -[MSDLocalMessageResponder saveOperationRequestIfNeeded:completeBy:](self, "saveOperationRequestIfNeeded:completeBy:", v21, v18);
  *((_BYTE *)v402 + 24) = v22;

  v23 = v402;
  if (!*((_BYTE *)v402 + 24))
    goto LABEL_126;
  if (!strncmp(string, "DemoEnroll", 0xBuLL))
  {
    if (v359 && (v28 = objc_opt_class(NSString, v24), (objc_opt_isKindOfClass(v359, v28) & 1) != 0))
    {
      if (v358)
      {
        v30 = objc_opt_class(NSString, v29);
        if ((objc_opt_isKindOfClass(v358, v30) & 1) != 0)
        {
          if (!v355)
          {
            v31 = sub_1000605D0();
            v32 = objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = "-[MSDLocalMessageResponder handleMessage:from:]";
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s: warning: no credential from app", buf, 0xCu);
            }

          }
          if (!v354)
          {
            v33 = sub_1000605D0();
            v34 = objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = "-[MSDLocalMessageResponder handleMessage:from:]";
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s: warning: no device name from app", buf, 0xCu);
            }

          }
          objc_msgSend(v361, "setupDemoDeviceMetadataFolder");
          objc_msgSend(v361, "setDemoEnrollmentFlag:", CFSTR("enrollmentStarted"));
          v35 = (void *)os_transaction_create("Enrolling.");
          -[MSDLocalMessageResponder setTransaction:](self, "setTransaction:", v35);

          v36 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](MSDWorkQueueSet, "sharedInstance"));
          v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "demoUpdateQueue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100037644;
          block[3] = &unk_10013E3D8;
          v38 = block;
          block[4] = v361;
          v399 = &v401;
          v394 = v357;
          v395 = v354;
          v396 = v355;
          v397 = v359;
          v398 = v358;
          v400 = &v405;
          dispatch_async(v37, block);

          goto LABEL_77;
        }
      }
      v170 = sub_1000605D0();
      reply = objc_claimAutoreleasedReturnValue(v170);
      if (os_log_type_enabled(reply, OS_LOG_TYPE_ERROR))
        goto LABEL_259;
    }
    else
    {
      v169 = sub_1000605D0();
      reply = objc_claimAutoreleasedReturnValue(v169);
      if (os_log_type_enabled(reply, OS_LOG_TYPE_ERROR))
LABEL_259:
        sub_1000BC414();
    }
LABEL_273:

    goto LABEL_126;
  }
  if (!strncmp(string, "DemoUpdate", 0xBuLL))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](MSDWorkQueueSet, "sharedInstance"));
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "demoUpdateQueue"));
    v391[0] = _NSConcreteStackBlock;
    v391[1] = 3221225472;
    v391[2] = sub_1000377C8;
    v391[3] = &unk_10013E400;
    v392 = v18;
    v391[5] = &v401;
    v38 = v391;
    v391[4] = v357;
    dispatch_async(v40, v391);

LABEL_77:
    reply = v38[4];
    goto LABEL_78;
  }
  if (!strncmp(string, "DemoMaualUpdate", 0x10uLL))
  {
    v48 = (void *)os_transaction_create("Turning off snapshot.");
    -[MSDLocalMessageResponder setTransaction:](self, "setTransaction:", v48);

    reply = xpc_dictionary_create_reply(v5);
    if (!reply)
      reply = xpc_dictionary_create(0, 0, 0);
    v49 = objc_msgSend(v361, "canUnlockSnapshot");
    *((_BYTE *)v402 + 24) = (_BYTE)v49;
    if (v20)
    {
      v50 = objc_msgSend(v356, "canUnlockSnapshot", v49);
      if (*((_BYTE *)v402 + 24))
        LOBYTE(v49) = v50;
      else
        LOBYTE(v49) = 0;
      *((_BYTE *)v402 + 24) = (_BYTE)v49;
    }
    xpc_dictionary_set_BOOL(reply, "Acknowledged", (BOOL)v49);
    xpc_connection_send_message(connection, reply);
    if (*((_BYTE *)v402 + 24))
    {
      if (!v20 || (v51 = objc_msgSend(v356, "unlockSnapshot"), *((_BYTE *)v402 + 24) = v51, v51))
      {
        v52 = objc_msgSend(v361, "unlockSnapshot");
        *((_BYTE *)v402 + 24) = v52;

        goto LABEL_125;
      }
      goto LABEL_296;
    }
    v201 = sub_1000605D0();
    v103 = objc_claimAutoreleasedReturnValue(v201);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      sub_1000BC4E0();
    goto LABEL_301;
  }
  if (!strncmp(string, "DemoSnapshotRevert", 0x13uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply)
      reply = xpc_dictionary_create(0, 0, 0);
    v58 = objc_msgSend(v361, "canRevertSnapshot");
    *((_BYTE *)v402 + 24) = (_BYTE)v58;
    if (v20)
    {
      v59 = objc_msgSend(v356, "canRevertSnapshot", v58);
      if (*((_BYTE *)v402 + 24))
        LOBYTE(v58) = v59;
      else
        LOBYTE(v58) = 0;
      *((_BYTE *)v402 + 24) = (_BYTE)v58;
    }
    xpc_dictionary_set_BOOL(reply, "Acknowledged", (BOOL)v58);
    xpc_connection_send_message(connection, reply);
    if (*((_BYTE *)v402 + 24))
    {
      if (!v20 || (v60 = objc_msgSend(v356, "revertSnapshot"), *((_BYTE *)v402 + 24) = v60, v60))
      {
        v52 = objc_msgSend(v361, "revertSnapshot");
        *((_BYTE *)v402 + 24) = v52;

        goto LABEL_125;
      }
      goto LABEL_296;
    }
    v205 = sub_1000605D0();
    v103 = objc_claimAutoreleasedReturnValue(v205);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      sub_1000BC50C();
LABEL_301:
    v202 = 4;
LABEL_302:

LABEL_303:
    if (v202 != 7)
      goto LABEL_157;
    goto LABEL_126;
  }
  if (!strncmp(string, "SetLastShallowRefreshTime", 0x1AuLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply)
      reply = xpc_dictionary_create(0, 0, 0);
    v63 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v63, "setDateFormat:", CFSTR("dd-MM-yyyy_HH:mm:ss:SSS"));
    v64 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v5, "LastShallowRefreshTime"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "dateFromString:", v65));

    v67 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    objc_msgSend(v67, "saveLastShallowRefreshTime:", v66);

    v68 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
    objc_msgSend(v68, "sendLastShallowRefreshTime:", v66);

    xpc_dictionary_set_BOOL(reply, "MSDResult", 1);
    xpc_connection_send_message(connection, reply);

    goto LABEL_78;
  }
  if (!strncmp(string, "DemoSnapshotCommit", 0x13uLL))
  {
    global_queue = dispatch_get_global_queue(21, 0);
    v84 = objc_claimAutoreleasedReturnValue(global_queue);
    v388[0] = _NSConcreteStackBlock;
    v388[1] = 3221225472;
    v388[2] = sub_1000378A8;
    v388[3] = &unk_10013E208;
    v38 = v388;
    v388[4] = v5;
    v389 = v361;
    v390 = connection;
    dispatch_async(v84, v388);

    goto LABEL_77;
  }
  if (!strncmp(string, "SetSEPDemoMode", 0xFuLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply)
      reply = xpc_dictionary_create(0, 0, 0);
    v85 = objc_msgSend(v361, "setSEPDemoMode:", xpc_dictionary_get_BOOL(v5, "SEPDemoMode"));
    *((_BYTE *)v402 + 24) = v85;
    xpc_dictionary_set_BOOL(reply, "MSDResult", v85);
    xpc_connection_send_message(connection, reply);
    goto LABEL_78;
  }
  if (!strncmp(string, "DemoPrepare", 0xCuLL))
  {
    v86 = (void *)os_transaction_create("Preparing demo device.");
    -[MSDLocalMessageResponder setTransaction:](self, "setTransaction:", v86);

    reply = xpc_dictionary_create_reply(v5);
    if (!reply)
      reply = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(reply, "DemoPrepareAcknowledged", 1);
    if (-[MSDLocalMessageResponder demoPrepareInProgress](self, "demoPrepareInProgress"))
    {
      v87 = sub_1000604F0();
      v88 = objc_claimAutoreleasedReturnValue(v87);
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "Ignore second demo prepare request as it's already started.", buf, 2u);
      }

      xpc_connection_send_message(connection, reply);
      goto LABEL_127;
    }
    -[MSDLocalMessageResponder setDemoPrepareInProgress:](self, "setDemoPrepareInProgress:", 1);
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](MSDWorkQueueSet, "sharedInstance"));
    v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "demoUpdateQueue"));
    v380[0] = _NSConcreteStackBlock;
    v380[1] = 3221225472;
    v380[2] = sub_10003797C;
    v380[3] = &unk_10013E428;
    v381 = v361;
    v382 = connection;
    v383 = reply;
    v386 = &v401;
    v387 = &v405;
    v384 = v5;
    v385 = self;
    reply = reply;
    dispatch_async(v96, v380);

    goto LABEL_78;
  }
  if (!strncmp(string, "Demo", 5uLL))
  {
    v91 = (void *)os_transaction_create("Turning on snapshot.");
    -[MSDLocalMessageResponder setTransaction:](self, "setTransaction:", v91);

    reply = xpc_dictionary_create_reply(v5);
    if (!reply)
      reply = xpc_dictionary_create(0, 0, 0);
    v92 = objc_msgSend(v361, "canLockSnapshot");
    *((_BYTE *)v402 + 24) = (_BYTE)v92;
    if (v20)
    {
      v93 = objc_msgSend(v356, "canLockSnapshot", v92);
      if (*((_BYTE *)v402 + 24))
        LOBYTE(v92) = v93;
      else
        LOBYTE(v92) = 0;
      *((_BYTE *)v402 + 24) = (_BYTE)v92;
    }
    xpc_dictionary_set_BOOL(reply, "Acknowledged", (BOOL)v92);
    xpc_connection_send_message(connection, reply);
    if (*((_BYTE *)v402 + 24))
    {
      if (!v20 || (v94 = objc_msgSend(v356, "lockSnapshot"), *((_BYTE *)v402 + 24) = v94, v94))
      {
        v52 = objc_msgSend(v361, "lockSnapshot");
        *((_BYTE *)v402 + 24) = v52;

        goto LABEL_125;
      }
LABEL_296:
      v202 = 7;
      goto LABEL_303;
    }
    v221 = sub_1000605D0();
    v103 = objc_claimAutoreleasedReturnValue(v221);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      sub_1000BC538();
    goto LABEL_301;
  }
  if (!strncmp(string, "Virgin", 7uLL))
  {
    v97 = (void *)os_transaction_create("Unpairing");
    -[MSDLocalMessageResponder setTransaction:](self, "setTransaction:", v97);

    v98 = xpc_dictionary_get_BOOL(v5, "ObliterateDevice");
    v99 = xpc_dictionary_get_BOOL(v5, "PreserveESim");
    v100 = xpc_dictionary_get_BOOL(v5, "CleanUpForBetterTogether");
    reply = xpc_dictionary_create_reply(v5);
    if (!reply)
      reply = xpc_dictionary_create(0, 0, 0);
    if (v100)
    {
      v101 = objc_msgSend(v361, "canRunCleanUpForBetterTogetherDevice");
      *((_BYTE *)v402 + 24) = v101;
      if (!v101)
      {
        v108 = 0;
        goto LABEL_203;
      }
      v102 = objc_msgSend(v361, "runCleanUpForBetterTogetherDevice");
    }
    else
    {
      v102 = objc_msgSend(v361, "canUnenrollWithObliteration:consultDeviceOptions:", v98, 1);
    }
    v108 = v102;
    *((_BYTE *)v402 + 24) = v102;
LABEL_203:
    xpc_dictionary_set_BOOL(reply, "Acknowledged", v108);
    xpc_connection_send_message(connection, reply);
    if (!*((_BYTE *)v402 + 24))
    {
      v225 = sub_1000605D0();
      v226 = objc_claimAutoreleasedReturnValue(v225);
      if (os_log_type_enabled(v226, OS_LOG_TYPE_ERROR))
        sub_1000BC564();

      goto LABEL_127;
    }
    if (v100)
    {
LABEL_127:

      goto LABEL_157;
    }
    if (v20)
      objc_msgSend(v356, "unenrollWithObliteration:callUnregister:", v98, 1);
    v52 = objc_msgSend(v361, "unenrollWithObliteration:preserveESim:callUnregister:preserveDDLFlag:", v98, v99, 1, 1);
    *((_BYTE *)v402 + 24) = v52;

LABEL_125:
    if ((v52 & 1) != 0)
      goto LABEL_79;
LABEL_126:
    v61 = v406;
    obj = v406[5];
    sub_1000B6428(&obj, 3727744768, CFSTR("An error has occurred."));
    objc_storeStrong(v61 + 5, obj);
    reply = objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](MSDDemoUpdateStatusHub, "sharedInstance"));
    -[NSObject demoUpdateFailed:](reply, "demoUpdateFailed:", v406[5]);
    goto LABEL_127;
  }
  if (!strncmp(string, "GetDeviceOptions", 0x11uLL))
  {
    v103 = objc_claimAutoreleasedReturnValue(objc_msgSend(v361, "getDeviceOptions"));
    v104 = xpc_dictionary_create_reply(v5);
    if (!v104)
      v104 = xpc_dictionary_create(0, 0, 0);
    v105 = xpc_dictionary_get_string(v5, "SubKey");
    if (v105)
    {
      v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v105));
      reply = objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v103, "objectForKey:", v106));

    }
    else
    {
      reply = v103;
      v105 = "device_options";
    }
    v118 = objc_opt_class(NSDictionary, v107);
    if ((objc_opt_isKindOfClass(reply, v118) & 1) != 0)
    {
      v120 = v406;
      v379 = v406[5];
      v121 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", reply, 0, &v379));
      objc_storeStrong(v120 + 5, v379);
      if (v406[5])
      {
        v251 = sub_1000605D0();
        v252 = objc_claimAutoreleasedReturnValue(v251);
        if (os_log_type_enabled(v252, OS_LOG_TYPE_ERROR))
          sub_1000BC60C();

        v202 = 4;
LABEL_352:

        goto LABEL_302;
      }
      v122 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v121, 4);

      reply = v122;
    }
    if (!reply)
    {
LABEL_223:
      xpc_connection_send_message(connection, v104);

      goto LABEL_78;
    }
    v123 = objc_opt_class(NSString, v119);
    if ((objc_opt_isKindOfClass(reply, v123) & 1) != 0
      || (v125 = objc_opt_class(NSNumber, v124), (objc_opt_isKindOfClass(reply, v125) & 1) != 0))
    {
      v126 = objc_opt_class(NSString, v124);
      if ((objc_opt_isKindOfClass(reply, v126) & 1) != 0)
        xpc_dictionary_set_string(v104, v105, (const char *)-[NSObject UTF8String](objc_retainAutorelease(reply), "UTF8String"));
      else
        xpc_dictionary_set_BOOL(v104, v105, (BOOL)-[NSObject BOOLValue](reply, "BOOLValue"));
      goto LABEL_223;
    }
    v256 = sub_1000605D0();
    v121 = objc_claimAutoreleasedReturnValue(v256);
    if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
      sub_1000BC590();
    v202 = 7;
    goto LABEL_352;
  }
  if (!strncmp(string, "ConfigureWiFi", 0xEuLL))
  {
    v109 = sub_1000605D0();
    v110 = objc_claimAutoreleasedReturnValue(v109);
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "Configuring WiFi...", buf, 2u);
    }

    v111 = xpc_dictionary_create_reply(v5);
    v112 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v5, "SSID"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(v112);
    v114 = xpc_dictionary_get_string(v5, "Password");
    if (v114)
      reply = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v114));
    else
      reply = 0;
    v156 = sub_1000605D0();
    v157 = objc_claimAutoreleasedReturnValue(v156);
    if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v113;
      _os_log_impl((void *)&_mh_execute_header, v157, OS_LOG_TYPE_DEFAULT, "Setting up WiFi: ssid = %{public}@", buf, 0xCu);
    }

    v158 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](MSDWiFiHelper, "sharedInstance"));
    v159 = objc_msgSend(v158, "configureWiFi:password:", v113, reply);

    if (objc_msgSend(v361, "dcotaOfflineModeDevice"))
    {
      v160 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFindMyHub sharedInstance](MSDFindMyHub, "sharedInstance"));
      objc_msgSend(v160, "handleEnrollmentRetryUponFirstLaunch");

    }
    xpc_dictionary_set_BOOL(v111, "Result", v159);
    xpc_connection_send_message(connection, v111);

    goto LABEL_78;
  }
  if (!strncmp(string, "DisconnectAndForgetWiFi", 0x18uLL))
  {
    v115 = sub_1000605D0();
    v116 = objc_claimAutoreleasedReturnValue(v115);
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "Disconnecting from current WiFi and forgetting all known WiFi...", buf, 2u);
    }

    reply = xpc_dictionary_create_reply(v5);
    v117 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](MSDWiFiHelper, "sharedInstance"));
    objc_msgSend(v117, "disassociateAndForgetWiFi");

    if (objc_msgSend(v361, "isContentFrozen"))
      objc_msgSend(v361, "setShouldForgetKnownNetworkUponUnlock:", 1);
    xpc_dictionary_set_BOOL(reply, "Result", 1);
    xpc_connection_send_message(connection, reply);
    goto LABEL_78;
  }
  if (!strncmp(string, "SetLanguageAndRegion", 0x15uLL))
  {
    v127 = sub_1000605D0();
    v128 = objc_claimAutoreleasedReturnValue(v127);
    if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "Setting Device Language and Region...", buf, 2u);
    }

    v129 = (void *)os_transaction_create("Setting Device Language and Region.");
    -[MSDLocalMessageResponder setTransaction:](self, "setTransaction:", v129);

    reply = xpc_dictionary_create_reply(v5);
    v130 = dispatch_semaphore_create(0);
    v131 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
    objc_msgSend(v131, "startFullScreenUIWith:allowCancel:", CFSTR("LANGUAGE_UPDATE"), 0);

    value = 0;
    v132 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v5, "languageIdentifier"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(v132);
    v134 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v5, "regionCode"));
    v135 = (void *)objc_claimAutoreleasedReturnValue(v134);
    v136 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
    v376[0] = _NSConcreteStackBlock;
    v376[1] = 3221225472;
    v376[2] = sub_100037EE0;
    v376[3] = &unk_10013E320;
    v137 = v130;
    v377 = v137;
    v138 = objc_msgSend(v136, "setDeviceLanguage:andRegion:sbRestartNeeded:sbRestartHandler:", v133, v135, &value, v376);

    xpc_dictionary_set_BOOL(reply, "Result", v138);
    xpc_connection_send_message(connection, reply);
    if (value)
      v139 = v138;
    else
      v139 = 0;
    if (v139 == 1)
    {
      v140 = sub_1000604F0();
      v141 = objc_claimAutoreleasedReturnValue(v140);
      if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEFAULT, "Waiting for Springboard restart", buf, 2u);
      }

      v142 = dispatch_time(0, 70000000000);
      if (dispatch_semaphore_wait(v137, v142))
      {
        v143 = sub_1000604F0();
        v144 = objc_claimAutoreleasedReturnValue(v143);
        if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
          sub_1000BC638(v144, v145, v146, v147, v148, v149, v150, v151);

      }
    }
    if (v138 && objc_msgSend(v361, "isOfflineMode"))
    {
      v152 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](MSDWorkQueueSet, "sharedInstance"));
      v153 = objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "demoUpdateQueue"));
      v374[0] = _NSConcreteStackBlock;
      v374[1] = 3221225472;
      v374[2] = sub_100037EE8;
      v374[3] = &unk_10013D868;
      v375 = v361;
      dispatch_async(v153, v374);

      v154 = v375;
    }
    else
    {
      v154 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
      objc_msgSend(v154, "stopFullScreenUI:", 0);
    }

    -[MSDLocalMessageResponder setTransaction:](self, "setTransaction:", 0);
    goto LABEL_78;
  }
  if (!strncmp(string, "GetLanguageAndRegion", 0x15uLL))
  {
    v161 = sub_1000605D0();
    v162 = objc_claimAutoreleasedReturnValue(v161);
    if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v162, OS_LOG_TYPE_DEFAULT, "Getting Device Language and Region...", buf, 2u);
    }

    reply = xpc_dictionary_create_reply(v5);
    if (!reply)
      reply = xpc_dictionary_create(0, 0, 0);
    v163 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
    v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "getCurrentDeviceLanguage"));

    if (v164)
    {
      v165 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
      v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "getCurrentDeviceRegion"));

      if (!v166)
      {
        v259 = sub_1000604F0();
        v260 = objc_claimAutoreleasedReturnValue(v259);
        if (os_log_type_enabled(v260, OS_LOG_TYPE_ERROR))
          sub_1000BC6D0();

        goto LABEL_273;
      }
      v167 = objc_retainAutorelease(v164);
      xpc_dictionary_set_string(reply, "languageIdentifier", (const char *)objc_msgSend(v167, "UTF8String"));
      v168 = objc_retainAutorelease(v166);
      xpc_dictionary_set_string(reply, "regionCode", (const char *)objc_msgSend(v168, "UTF8String"));
      xpc_connection_send_message(connection, reply);

      goto LABEL_78;
    }
    v257 = sub_1000604F0();
    v258 = objc_claimAutoreleasedReturnValue(v257);
    if (os_log_type_enabled(v258, OS_LOG_TYPE_ERROR))
      sub_1000BC6A4();
    goto LABEL_357;
  }
  if (!strncmp(string, "GetAppUsageSessionUUID", 0x17uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    v171 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDeviceDataCollector sharedInstance](MSDDeviceDataCollector, "sharedInstance"));
    v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "getCurrentAppUsageSessionUUID"));

    if (v172)
    {
      xpc_dictionary_set_BOOL(reply, "Result", 1);
      xpc_dictionary_set_string(reply, "SessionUUID", (const char *)objc_msgSend(objc_retainAutorelease(v172), "UTF8String"));
    }
    else
    {
      xpc_dictionary_set_BOOL(reply, "Result", 0);
    }
    xpc_connection_send_message(connection, reply);

    goto LABEL_78;
  }
  if (!strncmp(string, "CollectAppUsageData", 0x14uLL))
  {
    v173 = xpc_dictionary_create_reply(v5);
    v174 = xpc_dictionary_get_value(v5, "StartTime");
    v175 = (void *)objc_claimAutoreleasedReturnValue(v174);
    if (xpc_get_type(v175) == (xpc_type_t)&_xpc_type_double)
    {
      v176 = xpc_dictionary_get_value(v5, "EndTime");
      v177 = (void *)objc_claimAutoreleasedReturnValue(v176);
      if (xpc_get_type(v177) == (xpc_type_t)&_xpc_type_double)
      {
        v178 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", xpc_double_get_value(v175));
        reply = objc_claimAutoreleasedReturnValue(v178);
        v179 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", xpc_double_get_value(v177));
        v180 = (void *)objc_claimAutoreleasedReturnValue(v179);
        v181 = objc_claimAutoreleasedReturnValue(+[MSDDeviceDataCollector sharedInstance](MSDDeviceDataCollector, "sharedInstance"));
        -[NSObject collectAppUsageWithSessionStart:andEnd:](v181, "collectAppUsageWithSessionStart:andEnd:", reply, v180);
        v182 = 1;
      }
      else
      {
        v262 = sub_1000604F0();
        v181 = objc_claimAutoreleasedReturnValue(v262);
        if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
          sub_1000BC6FC();
        v182 = 0;
        reply = 0;
        v180 = 0;
      }
    }
    else
    {
      v261 = sub_1000604F0();
      v181 = objc_claimAutoreleasedReturnValue(v261);
      if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
        sub_1000BC728();
      v182 = 0;
      reply = 0;
      v180 = 0;
      v177 = 0;
    }

    xpc_dictionary_set_BOOL(v173, "Result", v182);
    xpc_connection_send_message(connection, v173);

    goto LABEL_78;
  }
  if (!strncmp(string, "SaveBTPairingInfo", 0x12uLL))
  {
    v186 = sub_1000605D0();
    v187 = objc_claimAutoreleasedReturnValue(v186);
    if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_DEFAULT, "Saving Bluetooth Pairing Info...", buf, 2u);
    }

    reply = xpc_dictionary_create_reply(v5);
    if (objc_msgSend(v361, "isContentFrozen"))
    {
      v188 = (void *)objc_claimAutoreleasedReturnValue(+[MSDBluetoothHelper sharedInstance](MSDBluetoothHelper, "sharedInstance"));
      v189 = objc_msgSend(v188, "preserveBTPairingRecord");

      v190 = sub_1000604F0();
      v191 = objc_claimAutoreleasedReturnValue(v190);
      if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = v189;
        _os_log_impl((void *)&_mh_execute_header, v191, OS_LOG_TYPE_DEFAULT, "Bluetooth pairing info result: %{public, BOOL}d", buf, 8u);
      }

    }
    else
    {
      LOBYTE(v189) = 1;
    }
    xpc_dictionary_set_BOOL(reply, "Result", v189);
    xpc_connection_send_message(connection, reply);
    goto LABEL_78;
  }
  if (!strncmp(string, "StartOSUpdate", 0xEuLL))
  {
    reply = objc_opt_new(NSMutableDictionary, v25);
    v192 = objc_msgSend(v361, "isVerifiedDemoDevice");
    v193 = xpc_dictionary_create_reply(v5);
    if (!v193)
      v193 = xpc_dictionary_create(0, 0, 0);
    if ((v192 & 1) != 0)
    {
      if ((os_variant_has_internal_content("com.apple.mobilestoredemod") & 1) != 0)
      {
        v194 = xpc_dictionary_get_string(v5, "OSVersion");
        if (v194)
        {
          v195 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v194));
          -[NSObject setObject:forKey:](reply, "setObject:forKey:", v195, CFSTR("OSVersion"));

        }
        v196 = xpc_dictionary_get_string(v5, "DemodVersion");
        if (v196)
        {
          v197 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v196));
          -[NSObject setObject:forKey:](reply, "setObject:forKey:", v197, CFSTR("demodVersion"));

        }
        objc_msgSend(v361, "saveOSUpdateRequest:", reply);
        v198 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](MSDWorkQueueSet, "sharedInstance"));
        v199 = objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "demoUpdateQueue"));
        v372[0] = _NSConcreteStackBlock;
        v372[1] = 3221225472;
        v372[2] = sub_100037EF0;
        v372[3] = &unk_10013D868;
        v373 = v361;
        dispatch_async(v199, v372);

        v200 = v373;
      }
      else
      {
        v267 = sub_1000605D0();
        v200 = objc_claimAutoreleasedReturnValue(v267);
        if (os_log_type_enabled(v200, OS_LOG_TYPE_ERROR))
          sub_1000BC754(v200, v268, v269, v270, v271, v272, v273, v274);
      }
    }
    else
    {
      v266 = sub_1000605D0();
      v200 = objc_claimAutoreleasedReturnValue(v266);
      if (os_log_type_enabled(v200, OS_LOG_TYPE_ERROR))
        sub_1000BC7C4();
    }

    xpc_dictionary_set_BOOL(v193, "Result", 1);
    xpc_connection_send_message(connection, v193);

    goto LABEL_78;
  }
  if (!strncmp(string, "LaunchApp", 0xAuLL))
  {
    v411 = SBSOpenApplicationOptionKeyPreventDismissalOfTransientOverlays;
    v412 = &__kCFBooleanTrue;
    reply = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v412, &v411, 1));
    if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
    {
      v203 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v5, "BundleID"));
      v204 = objc_claimAutoreleasedReturnValue(v203);
      +[MSDAppLauncherTerminator launchApp:withOptions:outError:](MSDAppLauncherTerminator, "launchApp:withOptions:outError:", v204, reply, 0);
    }
    else
    {
      v206 = sub_1000604F0();
      v204 = objc_claimAutoreleasedReturnValue(v206);
      if (os_log_type_enabled(v204, OS_LOG_TYPE_ERROR))
        sub_1000BC7F0(v204, v207, v208, v209, v210, v211, v212, v213);
    }

    v214 = xpc_dictionary_create_reply(v5);
    v215 = v214;
    if (v214)
    {
      xpc_dictionary_set_BOOL(v214, "MSDResult", 0);
      xpc_connection_send_message(connection, v215);
    }
    goto LABEL_442;
  }
  if (!strncmp(string, "DeviceCheckIn", 0xEuLL))
  {
    -[MSDLocalMessageResponder _handleDeviceCheckInOp:from:](self, "_handleDeviceCheckInOp:from:", v5, connection);
    goto LABEL_79;
  }
  if (!strncmp(string, "MarkAsNotDemo", 0xEuLL))
  {
    -[MSDLocalMessageResponder _handleMarkAsNotDemo:from:](self, "_handleMarkAsNotDemo:from:", v5, connection);
    goto LABEL_79;
  }
  if (!strncmp(string, "StoreSearch", 0xCuLL))
  {
    -[MSDLocalMessageResponder _handleStoreSearchOp:from:](self, "_handleStoreSearchOp:from:", v5, connection);
    goto LABEL_79;
  }
  if (!strncmp(string, "ClearSafariHistory", 0x13uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply)
      reply = xpc_dictionary_create(0, 0, 0);
    v216 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    objc_msgSend(v216, "clearSafariHistory");

    xpc_dictionary_set_BOOL(reply, "MSDResult", 1);
    xpc_connection_send_message(connection, reply);
    goto LABEL_78;
  }
  if (!strncmp(string, "ManageWallpaperSettings", 0x18uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply)
      reply = xpc_dictionary_create(0, 0, 0);
    v217 = xpc_dictionary_get_string(v5, "Action");
    if (!strncmp(v217, "Stash", 6uLL))
    {
      v219 = objc_claimAutoreleasedReturnValue(+[MSDWallpaperManager sharedInstance](MSDWallpaperManager, "sharedInstance"));
      -[NSObject stashWallpaperSettingsIfNeeded](v219, "stashWallpaperSettingsIfNeeded");
    }
    else
    {
      if (strncmp(v217, "Restore", 8uLL))
      {
        v218 = sub_1000605D0();
        v219 = objc_claimAutoreleasedReturnValue(v218);
        if (os_log_type_enabled(v219, OS_LOG_TYPE_ERROR))
          sub_1000BC860();
        v220 = 0;
        goto LABEL_342;
      }
      v219 = objc_claimAutoreleasedReturnValue(+[MSDWallpaperManager sharedInstance](MSDWallpaperManager, "sharedInstance"));
      -[NSObject restoreWallpaperSettingsIfNeeded](v219, "restoreWallpaperSettingsIfNeeded");
    }
    v220 = 1;
LABEL_342:

    xpc_dictionary_set_BOOL(reply, "MSDResult", v220);
    xpc_connection_send_message(connection, reply);
    goto LABEL_78;
  }
  if (!strncmp(string, "EnterOfflineMode", 0x11uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply)
      reply = xpc_dictionary_create(0, 0, 0);
    v222 = objc_msgSend(v361, "isOfflineMode");
    if ((v222 & 1) != 0)
    {
      if (!-[MSDLocalMessageResponder demoPrepareInProgress](self, "demoPrepareInProgress"))
      {
        -[MSDLocalMessageResponder setDemoPrepareInProgress:](self, "setDemoPrepareInProgress:", 1);
        v223 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](MSDWorkQueueSet, "sharedInstance"));
        v224 = objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "demoUpdateQueue"));
        v369[0] = _NSConcreteStackBlock;
        v369[1] = 3221225472;
        v369[2] = sub_100037F30;
        v369[3] = &unk_10013DE28;
        v370 = v361;
        v371 = self;
        dispatch_async(v224, v369);

        xpc_dictionary_set_BOOL(reply, "Acknowledged", 1);
        xpc_connection_send_message(connection, reply);

        goto LABEL_78;
      }
      v303 = sub_1000605D0();
      v302 = objc_claimAutoreleasedReturnValue(v303);
      if (os_log_type_enabled(v302, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v302, OS_LOG_TYPE_DEFAULT, "Ignore second cache bundle install request as it's already started.", buf, 2u);
      }
    }
    else
    {
      v301 = sub_1000605D0();
      v302 = objc_claimAutoreleasedReturnValue(v301);
      if (os_log_type_enabled(v302, OS_LOG_TYPE_ERROR))
        sub_1000BC8C0();
    }

    xpc_dictionary_set_BOOL(reply, "Acknowledged", v222);
    xpc_connection_send_message(connection, reply);
    goto LABEL_127;
  }
  if (!strncmp(string, "AutoEnrollmentResults", 0x16uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply)
      reply = xpc_dictionary_create(0, 0, 0);
    v227 = xpc_dictionary_get_double(v5, "AutoEnrollmentTimeStamp");
    v228 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v5, "AutoEnrollmentSelectedStoreID"));
    v229 = (void *)objc_claimAutoreleasedReturnValue(v228);
    *(_QWORD *)buf = 0;
    data = xpc_dictionary_get_data(v5, "AutoEnrollmentHelpMenuUserTapped", (size_t *)buf);
    v231 = objc_alloc((Class)NSData);
    v232 = objc_msgSend(v231, "initWithBytesNoCopy:length:freeWhenDone:", data, *(_QWORD *)buf, 0);
    v234 = objc_opt_class(NSMutableSet, v233);
    v236 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v234, objc_opt_class(NSString, v235), 0);
    v237 = (void *)objc_claimAutoreleasedReturnValue(v236);
    v368 = 0;
    v238 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v237, v232, &v368));
    v239 = v368;

    v240 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFindMyHub sharedInstance](MSDFindMyHub, "sharedInstance"));
    objc_msgSend(v240, "setAutoEnrollmentInfo:withStoreId:withHelpMenuRowSelection:", v229, v238, v227);

    xpc_dictionary_set_BOOL(reply, "MSDResult", 1);
    xpc_connection_send_message(connection, reply);

    goto LABEL_78;
  }
  if (!strncmp(string, "AutoEnrollmentAbortEvent", 0x19uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply)
      reply = xpc_dictionary_create(0, 0, 0);
    v241 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744772, CFSTR("Auto Enrollment Abort by user choosing not a demo device")));
    v242 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v5, "AutoEnrollmentAbortLanguageCodeInfo"));
    v243 = (void *)objc_claimAutoreleasedReturnValue(v242);
    v244 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v5, "AutoEnrollmentAbortCountryCodeInfo"));
    v245 = (void *)objc_claimAutoreleasedReturnValue(v244);
    v246 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCellularHelper sharedInstance](MSDCellularHelper, "sharedInstance"));
    v247 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v246, "getCellularSimInfo"));

    v248 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](MSDWiFiHelper, "sharedInstance"));
    v249 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v248, "getCurrentWiFiSsid"));

    v250 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
    objc_msgSend(v250, "sendAutoEnrollmentAbortEvent:languageCode:countryCode:networkInformation:wifiSSID:", v241, v243, v245, v247, v249);

    xpc_dictionary_set_BOOL(reply, "MSDResult", 1);
    xpc_connection_send_message(connection, reply);

    goto LABEL_78;
  }
  if (!strncmp(string, "SetUpPeerService", 0x11uLL))
  {
    v253 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoPeerCommander sharedInstance](MSDDemoPeerCommander, "sharedInstance"));
    reply = objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "createXPCEndpoint"));

    v254 = xpc_dictionary_create_reply(v5);
    v215 = v254;
    if (v254)
    {
      if (reply)
      {
        xpc_dictionary_set_BOOL(v254, "Result", 1);
        v255 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject _endpoint](reply, "_endpoint"));
        xpc_dictionary_set_value(v215, "PeerServiceXPCEndpoint", v255);

      }
      else
      {
        xpc_dictionary_set_BOOL(v254, "Result", 0);
      }
      xpc_connection_send_message(connection, v215);
    }
    goto LABEL_442;
  }
  if (!strncmp(string, "CloseRunningApps", 0x11uLL))
  {
    -[MSDLocalMessageResponder _handleCloseRunningAppsRequest:from:](self, "_handleCloseRunningAppsRequest:from:", v5, connection);
    goto LABEL_79;
  }
  if (!strncmp(string, "InitializeAppSwitcherContent", 0x1DuLL))
  {
    reply = objc_claimAutoreleasedReturnValue(+[MSDAppSwitcherManager sharedInstance](MSDAppSwitcherManager, "sharedInstance"));
    -[NSObject initializeClearAppSwitcherStateForDemoMode](reply, "initializeClearAppSwitcherStateForDemoMode");
    goto LABEL_78;
  }
  if (!strncmp(string, "RefreshDeviceSettings", 0x16uLL))
  {
    -[MSDLocalMessageResponder _handleRefreshDeviceSettingsOp:from:](self, "_handleRefreshDeviceSettingsOp:from:", v5, connection);
    goto LABEL_79;
  }
  if (!strncmp(string, "InitializeDeviceSettings", 0x19uLL))
  {
    -[MSDLocalMessageResponder _handleInitializeDeviceSettingsOp:from:](self, "_handleInitializeDeviceSettingsOp:from:", v5, connection);
    goto LABEL_79;
  }
  if (!strncmp(string, "UICheckIn", 0xAuLL))
  {
    v263 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
    objc_msgSend(v263, "setConnection:", connection);

    v264 = xpc_dictionary_create_reply(v5);
    reply = v264;
    if (v264)
    {
LABEL_373:
      xpc_dictionary_set_BOOL(v264, "Acknowledged", 1);
      xpc_connection_send_message(connection, reply);
    }
LABEL_78:

    goto LABEL_79;
  }
  if (!strncmp(string, "Cancel", 7uLL))
  {
    v265 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateController sharedInstance](MSDDemoUpdateController, "sharedInstance"));
    objc_msgSend(v265, "cancelDemoContentUpdate");

    v264 = xpc_dictionary_create_reply(v5);
    reply = v264;
    if (!v264)
      goto LABEL_78;
    goto LABEL_373;
  }
  if (!strncmp(string, "StoreDataBlob", 0xEuLL))
  {
    *((_BYTE *)v23 + 24) = 0;
    if (v351 && v352)
    {
      v275 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCache sharedInstance](MSDCache, "sharedInstance"));
      v276 = objc_msgSend(v275, "storeDataBlob:withContainerIdentifier:", v351, v352);
      *((_BYTE *)v402 + 24) = v276;

    }
    v277 = xpc_dictionary_create_reply(v5);
    reply = v277;
    if (!v277)
      goto LABEL_78;
LABEL_384:
    xpc_dictionary_set_BOOL(v277, "Acknowledged", *((_BYTE *)v402 + 24));
    xpc_connection_send_message(connection, reply);
    goto LABEL_78;
  }
  if (!strncmp(string, "RetrieveSavedDataBlob", 0x16uLL))
  {
    if (v352)
    {
      v278 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCache sharedInstance](MSDCache, "sharedInstance"));
      reply = objc_claimAutoreleasedReturnValue(objc_msgSend(v278, "retrieveDataBlob:", v352));

    }
    else
    {
      reply = 0;
    }
    v215 = xpc_dictionary_create_reply(v5);
    if (v215)
    {
      v285 = objc_retainAutorelease(reply);
      xpc_dictionary_set_data(v215, "SavedDataBlob", -[NSObject bytes](v285, "bytes"), (size_t)-[NSObject length](v285, "length"));
      xpc_connection_send_message(connection, v215);
    }
    goto LABEL_442;
  }
  if (!strncmp(string, "DeleteDataBlob", 0xFuLL))
  {
    *((_BYTE *)v23 + 24) = 0;
    if (v352)
    {
      v279 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCache sharedInstance](MSDCache, "sharedInstance"));
      v280 = objc_msgSend(v279, "deleteDataBlob:", v352);
      *((_BYTE *)v402 + 24) = v280;

    }
    v277 = xpc_dictionary_create_reply(v5);
    reply = v277;
    if (!v277)
      goto LABEL_78;
    goto LABEL_384;
  }
  if (!strncmp(string, "GetCurrentNetworkInfo", 0x16uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply)
      reply = xpc_dictionary_create(0, 0, 0);
    v281 = xpc_dictionary_create(0, 0, 0);
    array = xpc_dictionary_get_array(v5, "NetworkInfoKeys");
    v283 = (void *)objc_claimAutoreleasedReturnValue(array);
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_100037F5C;
    applier[3] = &unk_10013E450;
    v284 = v281;
    v366 = v284;
    v367 = v361;
    xpc_array_apply(v283, applier);
    xpc_dictionary_set_value(reply, "Result", v284);
    xpc_connection_send_message(connection, reply);

    goto LABEL_78;
  }
  if (!strncmp(string, "IsStoreOpen", 0xCuLL))
  {
    v286 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    objc_msgSend(v286, "refreshStoreHoursManagerUsingSettings");

    v287 = (void *)objc_claimAutoreleasedReturnValue(+[MSDStoreHoursManager sharedInstance](MSDStoreHoursManager, "sharedInstance"));
    v288 = objc_msgSend(v287, "isStoreOpenNow");

    reply = xpc_dictionary_create_reply(v5);
    v289 = sub_1000604F0();
    v290 = objc_claimAutoreleasedReturnValue(v289);
    if (os_log_type_enabled(v290, OS_LOG_TYPE_DEBUG))
      sub_1000BC8EC(v288, v290);

    if (reply)
    {
      xpc_dictionary_set_BOOL(reply, "MSDResult", 1);
      xpc_dictionary_set_BOOL(reply, "ResultData", v288);
      xpc_connection_send_message(connection, reply);
    }
    goto LABEL_78;
  }
  if (!strncmp(string, "NextStoreOpenDate", 0x12uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    v291 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    objc_msgSend(v291, "refreshStoreHoursManagerUsingSettings");

    v292 = (void *)objc_claimAutoreleasedReturnValue(+[MSDStoreHoursManager sharedInstance](MSDStoreHoursManager, "sharedInstance"));
    v215 = (xpc_object_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v292, "nextStoreOpenDate"));

    if (reply)
    {
      if (v215)
      {
        v293 = sub_1000604F0();
        v294 = objc_claimAutoreleasedReturnValue(v293);
        if (os_log_type_enabled(v294, OS_LOG_TYPE_DEBUG))
          sub_1000BC974();

        xpc_dictionary_set_BOOL(reply, "Result", 1);
        objc_msgSend(v215, "timeIntervalSince1970");
        xpc_dictionary_set_date(reply, "NextStoreHour", (uint64_t)v295);
      }
      else
      {
        xpc_dictionary_set_BOOL(reply, "Result", 0);
        xpc_dictionary_set_string(reply, "ErrorMessage", "MSDStoreHoursManager returned nil value for nextStoreOpenDate");
      }
      xpc_connection_send_message(connection, reply);
    }
    goto LABEL_442;
  }
  if (!strncmp(string, "NextStoreCloseDate", 0x13uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    v296 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    objc_msgSend(v296, "refreshStoreHoursManagerUsingSettings");

    v297 = (void *)objc_claimAutoreleasedReturnValue(+[MSDStoreHoursManager sharedInstance](MSDStoreHoursManager, "sharedInstance"));
    v215 = (xpc_object_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v297, "nextStoreClosedDate"));

    if (reply)
    {
      if (v215)
      {
        v298 = sub_1000604F0();
        v299 = objc_claimAutoreleasedReturnValue(v298);
        if (os_log_type_enabled(v299, OS_LOG_TYPE_DEBUG))
          sub_1000BC9E0();

        xpc_dictionary_set_BOOL(reply, "Result", 1);
        objc_msgSend(v215, "timeIntervalSince1970");
        xpc_dictionary_set_date(reply, "NextStoreHour", (uint64_t)v300);
      }
      else
      {
        xpc_dictionary_set_BOOL(reply, "Result", 0);
        xpc_dictionary_set_string(reply, "ErrorMessage", "MSDStoreHoursManager returned nil value for nextStoreCloseDate");
      }
      xpc_connection_send_message(connection, reply);
    }
LABEL_442:

    goto LABEL_78;
  }
  if (!strncmp(string, "UpdateStoreHours", 0x11uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    has_internal_content = os_variant_has_internal_content("com.apple.mobilestoredemod");
    v305 = has_internal_content;
    if (!has_internal_content)
    {
      v322 = sub_1000604F0();
      v308 = objc_claimAutoreleasedReturnValue(v322);
      if (os_log_type_enabled(v308, OS_LOG_TYPE_ERROR))
        sub_1000BCAE8(v308, v323, v324, v325, v326, v327, v328, v329);
LABEL_436:

      if (reply)
      {
        xpc_dictionary_set_BOOL(reply, "Result", v305);
        xpc_connection_send_message(connection, reply);
      }
      goto LABEL_78;
    }
    v306 = xpc_dictionary_get_array(v5, "RawStoreHours");
    v307 = (void *)objc_claimAutoreleasedReturnValue(v306);
    v308 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithXPCArray:](NSArray, "arrayWithXPCArray:", v307));

    if (v308)
    {
      v309 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)xpc_dictionary_get_date(v5, "EvaluateAgainstDate"));
      v310 = (void *)objc_claimAutoreleasedReturnValue(v309);
      if (!v310)
      {
        v349 = sub_1000604F0();
        v350 = objc_claimAutoreleasedReturnValue(v349);
        if (os_log_type_enabled(v350, OS_LOG_TYPE_ERROR))
          sub_1000BCABC();

        goto LABEL_273;
      }
      v311 = (void *)objc_claimAutoreleasedReturnValue(+[MSDStoreHoursManager sharedInstance](MSDStoreHoursManager, "sharedInstance"));
      v312 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v311, "updateStoreHours:lastSettingsUpdatedDate:", v308, v312);

      v313 = (void *)objc_claimAutoreleasedReturnValue(+[MSDStoreHoursManager sharedInstance](MSDStoreHoursManager, "sharedInstance"));
      objc_msgSend(v313, "evaluateStoreStatusAgainstPointInTime:", v310);

      goto LABEL_436;
    }
    v341 = sub_1000604F0();
    v258 = objc_claimAutoreleasedReturnValue(v341);
    if (os_log_type_enabled(v258, OS_LOG_TYPE_ERROR))
      sub_1000BCA4C(v258, v342, v343, v344, v345, v346, v347, v348);
LABEL_357:

    goto LABEL_273;
  }
  if (!strncmp(string, "preserveSecondPartyAppDataToShelter", 0x24uLL))
  {
    v314 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("SourcePath")));
    v315 = sub_1000605D0();
    v316 = objc_claimAutoreleasedReturnValue(v315);
    if (os_log_type_enabled(v316, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v314;
      _os_log_impl((void *)&_mh_execute_header, v316, OS_LOG_TYPE_DEFAULT, "Preserving second-party app data from %{public}@", buf, 0xCu);
    }

    v317 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
    v364 = 0;
    v318 = objc_msgSend(v317, "preserveSecondPartyAppDataToShelter:withReturnErrorMsg:", v314, &v364);
    reply = v364;

    v319 = xpc_dictionary_create_reply(v5);
    v320 = v319;
    if (v319)
    {
      xpc_dictionary_set_BOOL(v319, "Result", v318);
      if (reply)
        v321 = v318;
      else
        v321 = 1;
      if ((v321 & 1) == 0)
        xpc_dictionary_set_string(v320, "ErrorMsg", (const char *)-[NSObject UTF8String](objc_retainAutorelease(reply), "UTF8String"));
      xpc_connection_send_message(connection, v320);
    }

    goto LABEL_78;
  }
  if (!strncmp(string, "ReloadDemodsPreferencesFile", 0x1CuLL))
  {
    v330 = os_variant_has_internal_content("com.apple.mobilestoredemod");
    v331 = v330;
    if (v330)
    {
      v332 = objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
      -[NSObject reload](v332, "reload");
    }
    else
    {
      v333 = sub_1000604F0();
      v332 = objc_claimAutoreleasedReturnValue(v333);
      if (os_log_type_enabled(v332, OS_LOG_TYPE_ERROR))
        sub_1000BCB58(v332, v334, v335, v336, v337, v338, v339, v340);
    }

    reply = xpc_dictionary_create_reply(v5);
    xpc_dictionary_set_BOOL(reply, "Result", v331);
    xpc_connection_send_message(connection, reply);
    goto LABEL_78;
  }
  v26 = sub_1000605D0();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = string;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Unknown request: %{public}s", buf, 0xCu);
  }

  objc_msgSend(v361, "deleteOperationRequest");
LABEL_79:
  v42 = xpc_dictionary_get_string(v5, "QueryDeviceInfo");
  v43 = sub_1000605D0();
  v44 = objc_claimAutoreleasedReturnValue(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    sub_1000BC480();

  if (!v42)
    goto LABEL_136;
  reply = xpc_dictionary_create_reply(v5);
  if (!reply)
    reply = xpc_dictionary_create(0, 0, 0);
  if (!strncmp(v42, "MSDDemoManualUpdateState", 0x19uLL))
  {
    buf[0] = 0;
    value = 0;
    objc_msgSend(v361, "manualUpdateMode:allowChange:", buf, &value);
    xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
    xpc_dictionary_set_BOOL(reply, "MSDDemoManualUpdateCurrentMode", buf[0]);
    xpc_dictionary_set_BOOL(reply, "MSDDemoManualUpdateAllowChange", value);
    xpc_connection_send_message(connection, reply);
    goto LABEL_135;
  }
  if (!strncmp(v42, "MSDDemoUpdateState", 0x13uLL))
  {
    buf[0] = 0;
    value = 0;
    objc_msgSend(v357, "getDemoUpdateInProgress:operationAllowed:", buf, &value);
    xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
    xpc_dictionary_set_BOOL(reply, "MSDDemoUpdateInProgress", buf[0]);
    xpc_dictionary_set_BOOL(reply, "MSDDemoUpdateAllowed", value);
    xpc_dictionary_set_BOOL(reply, "MSDDemoAlreadySetup", (BOOL)objc_msgSend(v361, "demoSetup"));
    xpc_connection_send_message(connection, reply);
    goto LABEL_135;
  }
  if (!strncmp(v42, "MSDDemoUpdateEnrolled", 0x16uLL))
  {
    if (v359 && (v53 = objc_opt_class(NSString, v45), (objc_opt_isKindOfClass(v359, v53) & 1) != 0))
    {
      if (v358)
      {
        v55 = objc_opt_class(NSString, v54);
        if ((objc_opt_isKindOfClass(v358, v55) & 1) != 0)
        {
          objc_msgSend(v361, "setHubHostName:", v359);
          objc_msgSend(v361, "setHubPort:", v358);
          xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
          v56 = objc_msgSend(v357, "enrolled");
          v57 = "MSDDemoUpdateEnrolled";
          goto LABEL_133;
        }
      }
      v185 = sub_1000605D0();
      v184 = objc_claimAutoreleasedReturnValue(v185);
      if (!os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
        goto LABEL_272;
    }
    else
    {
      v183 = sub_1000605D0();
      v184 = objc_claimAutoreleasedReturnValue(v183);
      if (!os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
      {
LABEL_272:

        goto LABEL_273;
      }
    }
    sub_1000BC414();
    goto LABEL_272;
  }
  if (strncmp(v42, "MSDDemoDeviceManaged", 0x15uLL))
  {
    if (!strncmp(v42, "MSDDemoDeviceFrozen", 0x14uLL))
    {
      xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
      v56 = objc_msgSend(v361, "isContentFrozen");
      v57 = "MSDDemoDeviceFrozen";
    }
    else
    {
      if (!strncmp(v42, "MSDDemoDeviceInstallState", 0x1AuLL))
      {
        xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
        xpc_dictionary_set_int64(reply, "MSDDemoDeviceInstallState", objc_msgSend(v361, "mode"));
        goto LABEL_134;
      }
      if (!strncmp(v42, "MSDTypeOfDemoDevice", 0x14uLL))
      {
        xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
        xpc_dictionary_set_uint64(reply, "MSDTypeOfDemoDevice", (uint64_t)objc_msgSend(v361, "typeOfDemoDevice"));
        goto LABEL_134;
      }
      if (!strncmp(v42, "MSDFriendlyDeviceName", 0x16uLL))
      {
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v361, "hubSuppliedSettings"));
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKey:", CFSTR("DeviceName")));

        if (v90)
        {
          xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
          xpc_dictionary_set_string(reply, "MSDFriendlyDeviceName", (const char *)objc_msgSend(objc_retainAutorelease(v90), "UTF8String"));
        }
        else
        {
          xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 0);
        }
        xpc_connection_send_message(connection, reply);

        goto LABEL_135;
      }
      if (strncmp(v42, "MSDDeviceInOfflineMode", 0x17uLL))
      {
        v46 = sub_1000605D0();
        v47 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Unknown query", buf, 2u);
        }

        goto LABEL_135;
      }
      xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
      v56 = objc_msgSend(v361, "isOfflineMode");
      v57 = "MSDDeviceInOfflineMode";
    }
LABEL_133:
    xpc_dictionary_set_BOOL(reply, v57, v56);
LABEL_134:
    xpc_connection_send_message(connection, reply);
    goto LABEL_135;
  }
  v62 = objc_msgSend(v361, "typeOfDemoDevice");
  xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
  xpc_dictionary_set_BOOL(reply, "MSDDemoDeviceManaged", v62 == (id)6);
  xpc_connection_send_message(connection, reply);
LABEL_135:

LABEL_136:
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  if (objc_msgSend(v69, "macOS"))
  {

  }
  else
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
    v71 = objc_msgSend(v70, "iOS");

    if (!v71)
      goto LABEL_157;
  }
  v72 = xpc_dictionary_get_string(v5, "PricingMessage");
  v73 = sub_1000605D0();
  v74 = objc_claimAutoreleasedReturnValue(v73);
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    sub_1000BC3B4();

  if (v72)
  {
    -[MSDLocalMessageResponder setConnectionForPricing:](self, "setConnectionForPricing:", connection);
    if (!strcmp(v72, "PricingMessageRequestUpdate"))
    {
      v77 = sub_1000605D0();
      v78 = objc_claimAutoreleasedReturnValue(v77);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "XPC - PricingRequestUpdate", buf, 2u);
      }

      objc_msgSend(v353, "receivedUpdateRequest:fromRequest:", connection, v5);
    }
    else if (!strcmp(v72, "PricingMessageUpdateComplete"))
    {
      v79 = sub_1000605D0();
      v80 = objc_claimAutoreleasedReturnValue(v79);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "XPC - PricingUpdateComplete", buf, 2u);
      }

      objc_msgSend(v353, "receivedCompletionNotice:fromRequest:", connection, v5);
    }
    else if (!strcmp(v72, "PricingMessageHeartBeat"))
    {
      v81 = sub_1000605D0();
      v82 = objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "XPC - PricingMessageHeartBeat", buf, 2u);
      }

      objc_msgSend(v353, "receivedHeartBeat:fromRequest:", connection, v5);
    }
    else
    {
      v75 = sub_1000605D0();
      v76 = objc_claimAutoreleasedReturnValue(v75);
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Unknow message from Pricing.", buf, 2u);
      }

      objc_msgSend(v353, "receivedOtherMessages:fromRequest:", connection, v5);
    }
  }
LABEL_157:

  _Block_object_dispose(&v401, 8);
  _Block_object_dispose(&v405, 8);

}

- (void)sendRebootTimeoutMessageToPricing:(int)a3
{
  void *v5;
  xpc_object_t v6;
  id v7;
  NSObject *v8;
  _xpc_connection_s *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder connectionForPricing](self, "connectionForPricing"));

  if (v5)
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    if (v6)
    {
      v7 = sub_1000605D0();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        sub_1000BCC20();

      xpc_dictionary_set_int64(v6, "MSDRebootTimeout", a3);
      v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder connectionForPricing](self, "connectionForPricing"));
      xpc_connection_send_message(v9, v6);

    }
  }
}

- (void)lostClientConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder connectionForPricing](self, "connectionForPricing"));

  if (v4 == v9)
    -[MSDLocalMessageResponder setConnectionForPricing:](self, "setConnectionForPricing:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connection"));

  v7 = v9;
  if (v6 == v9)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
    objc_msgSend(v8, "setConnection:", 0);

    v7 = v9;
  }

}

- (BOOL)saveOperationRequestIfNeeded:(id)a3 completeBy:(int)a4
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DemoUpdate")) & 1) != 0)
  {
    v6 = 1;
    v7 = CFSTR("UpdateContent");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Demo")) & 1) != 0)
  {
    v6 = 0;
    v7 = CFSTR("TurnSnapshotON");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DemoMaualUpdate")) & 1) != 0)
  {
    v6 = 0;
    v7 = CFSTR("TurnSnapshotOFF");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DemoSnapshotRevert")) & 1) != 0)
  {
    v6 = 8;
    v7 = CFSTR("RevertSnapshot");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("OSUpdate")) & 1) != 0)
  {
    v6 = 0;
    v7 = CFSTR("UpdateOS");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("Reboot")))
    {
      v9 = 1;
      goto LABEL_14;
    }
    v6 = 0;
    v7 = CFSTR("Restart");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v9 = objc_msgSend(v8, "saveOperationRequest:requestFlag:completeBy:", v7, v6, v4);

LABEL_14:
  return v9;
}

- (void)_handleDeviceCheckInOp:(id)a3 from:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFindMyHub sharedInstance](MSDFindMyHub, "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000384B4;
  v10[3] = &unk_10013E478;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "checkInWithCompletion:", v10);

}

- (void)_handleMarkAsNotDemo:(id)a3 from:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFindMyHub sharedInstance](MSDFindMyHub, "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100038600;
  v10[3] = &unk_10013E4A0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "markAsNotDemoWithCompletion:", v10);

}

- (void)_handleStoreSearchOp:(id)a3 from:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[7];
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id reply;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v5 = a3;
  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10003762C;
  v19 = sub_10003763C;
  reply = xpc_dictionary_create_reply(v5);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_10003762C;
  v13[4] = sub_10003763C;
  v7 = v6;
  v14 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithXPCDictionary:](NSDictionary, "dictionaryWithXPCDictionary:", v5));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFindMyHub sharedInstance](MSDFindMyHub, "sharedInstance"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100038860;
    v12[3] = &unk_10013E4C8;
    v12[4] = &v21;
    v12[5] = &v15;
    v12[6] = v13;
    objc_msgSend(v9, "searchStoreWithOptions:completion:", v8, v12);

  }
  else
  {
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000BCC4C();

    xpc_dictionary_set_BOOL((xpc_object_t)v16[5], "Result", *((_BYTE *)v22 + 24));
    xpc_connection_send_message((xpc_connection_t)v7, (xpc_object_t)v16[5]);
  }

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

- (void)_handleRefreshDeviceSettingsOp:(id)a3 from:(id)a4
{
  _xpc_connection_s *v5;
  xpc_object_t reply;
  void *v7;
  xpc_object_t xdict;

  v5 = (_xpc_connection_s *)a4;
  reply = xpc_dictionary_create_reply(a3);
  if (!reply)
    reply = xpc_dictionary_create(0, 0, 0);
  xdict = reply;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsRefresher sharedInstance](MSDSettingsRefresher, "sharedInstance"));
  objc_msgSend(v7, "restoreSavedDeviceSettings");

  xpc_dictionary_set_BOOL(xdict, "MSDResult", 1);
  xpc_connection_send_message(v5, xdict);

}

- (void)_handleInitializeDeviceSettingsOp:(id)a3 from:(id)a4
{
  _xpc_connection_s *v5;
  id v6;
  _BOOL8 v7;
  void *v8;
  char **keys;

  v5 = (_xpc_connection_s *)a4;
  v6 = a3;
  v7 = xpc_dictionary_get_BOOL(v6, "InitializeSettingsOverwrite");
  keys = (char **)xpc_dictionary_create_reply(v6);

  if (!keys)
    keys = (char **)xpc_dictionary_create(0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsRefresher sharedInstance](MSDSettingsRefresher, "sharedInstance"));
  objc_msgSend(v8, "initializeWithOverwrite:", v7);

  xpc_dictionary_set_BOOL(keys, "MSDResult", 1);
  xpc_connection_send_message(v5, keys);

}

- (void)_handleCloseRunningAppsRequest:(id)a3 from:(id)a4
{
  id v5;
  _xpc_connection_s *v6;
  void *v7;
  xpc_object_t reply;
  xpc_object_t array;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;

  v5 = a3;
  v6 = (_xpc_connection_s *)a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](MSDAppHelper, "sharedInstance"));
  reply = xpc_dictionary_create_reply(v5);
  if (!reply)
    reply = xpc_dictionary_create(0, 0, 0);
  array = xpc_dictionary_get_array(v5, "ScreenSaverAppIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue(array);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithXPCArray:](NSArray, "arrayWithXPCArray:", v10));

  if (v11)
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Leaving %@ running", buf, 0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "runningApps:", 0));
    v15 = objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "removeObjectsInArray:", v11);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          +[MSDAppLauncherTerminator terminateApp:outError:](MSDAppLauncherTerminator, "terminateApp:outError:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v20), 0, (_QWORD)v22);
          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v18);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppSwitcherManager sharedInstance](MSDAppSwitcherManager, "sharedInstance"));
    objc_msgSend(v21, "clearAppSwitcherForDemoMode");

  }
  xpc_dictionary_set_BOOL(reply, "MSDResult", v11 != 0);
  xpc_connection_send_message(v6, reply);

}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_xpc_object)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListener, a3);
}

- (OS_xpc_object)connectionForPricing
{
  return (OS_xpc_object *)objc_loadWeakRetained((id *)&self->_connectionForPricing);
}

- (void)setConnectionForPricing:(id)a3
{
  objc_storeWeak((id *)&self->_connectionForPricing, a3);
}

- (BOOL)demoPrepareInProgress
{
  return self->_demoPrepareInProgress;
}

- (void)setDemoPrepareInProgress:(BOOL)a3
{
  self->_demoPrepareInProgress = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionForPricing);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
