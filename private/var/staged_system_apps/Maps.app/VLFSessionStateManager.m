@implementation VLFSessionStateManager

- (VLFSessionStateManager)initWithPlatformController:(id)a3
{
  id v4;
  VLFSessionStateManager *v5;
  VLFSessionStateManager *v6;
  GEOObserverHashTable *v7;
  GEOObserverHashTable *observers;
  uint64_t v9;
  NSMutableSet *highThresholdMonitors;
  uint64_t v11;
  NSMutableSet *lowThresholdMonitors;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;

  v4 = a3;
  if (!v4)
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "-[VLFSessionStateManager initWithPlatformController:]";
      v22 = 2080;
      v23 = "VLFSessionStateManager.m";
      v24 = 1024;
      v25 = 68;
      v26 = 2080;
      v27 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v21 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)VLFSessionStateManager;
  v5 = -[VLFSessionStateManager init](&v19, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_platformController, v4);
    v7 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___VLFSessionStateManagerDelegate, 0);
    observers = v6->_observers;
    v6->_observers = v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    highThresholdMonitors = v6->_highThresholdMonitors;
    v6->_highThresholdMonitors = (NSMutableSet *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    lowThresholdMonitors = v6->_lowThresholdMonitors;
    v6->_lowThresholdMonitors = (NSMutableSet *)v11;

    -[VLFSessionStateManager buildMonitors](v6, "buildMonitors");
    -[VLFSessionStateManager calculateCurrentState](v6, "calculateCurrentState");
  }

  return v6;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[VLFSessionStateManager observers](self, "observers"));
    objc_msgSend(v5, "registerObserver:", v4);

  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[VLFSessionStateManager observers](self, "observers"));
    objc_msgSend(v5, "unregisterObserver:", v4);

  }
}

- (void)setCurrentState:(int64_t)a3
{
  id v4;
  NSObject *v5;
  int64_t currentState;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  const __CFString *v11;

  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    v4 = sub_100248910();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      currentState = self->_currentState;
      v7 = CFSTR("Off");
      if (currentState == 1)
        v7 = CFSTR("Puck");
      if (currentState == 2)
        v8 = CFSTR("PuckAndBanner");
      else
        v8 = v7;
      v10 = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "State changed to %@", (uint8_t *)&v10, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateManager observers](self, "observers"));
    objc_msgSend(v9, "stateManager:didChangeState:", self, self->_currentState);

  }
}

- (void)buildMonitors
{
  unsigned int v3;
  id v4;
  VLFSessionAppLaunchDelayMonitor *v5;
  _BOOL4 v6;
  objc_class *v7;
  NSString *v8;
  char *v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  char *v14;
  id v15;
  NSObject *v16;
  objc_class *v17;
  NSString *v18;
  char *v19;
  objc_class *v20;
  NSString *v21;
  char *v22;
  unsigned int v23;
  id v24;
  VLFSessionCarPlayConnectionMonitor *v25;
  _BOOL4 v26;
  objc_class *v27;
  NSString *v28;
  char *v29;
  id v30;
  NSObject *v31;
  objc_class *v32;
  NSString *v33;
  char *v34;
  id v35;
  NSObject *v36;
  objc_class *v37;
  NSString *v38;
  char *v39;
  objc_class *v40;
  NSString *v41;
  char *v42;
  unsigned int v43;
  id v44;
  NSObject *v45;
  _BOOL4 v46;
  objc_class *v47;
  NSString *v48;
  char *v49;
  VLFSessionChromeStackMonitor *v50;
  void *v51;
  id v52;
  NSObject *v53;
  objc_class *v54;
  NSString *v55;
  char *v56;
  id v57;
  NSObject *v58;
  objc_class *v59;
  NSString *v60;
  char *v61;
  objc_class *v62;
  NSString *v63;
  char *v64;
  unsigned int v65;
  id v66;
  NSObject *v67;
  _BOOL4 v68;
  objc_class *v69;
  NSString *v70;
  char *v71;
  VLFSessionCoarseLocationMonitor *v72;
  id v73;
  id v74;
  NSObject *v75;
  objc_class *v76;
  NSString *v77;
  char *v78;
  id v79;
  NSObject *v80;
  objc_class *v81;
  NSString *v82;
  char *v83;
  objc_class *v84;
  NSString *v85;
  char *v86;
  unsigned int v87;
  id v88;
  NSObject *v89;
  _BOOL4 v90;
  objc_class *v91;
  NSString *v92;
  char *v93;
  VLFSessionHistoricalLocationAccuracyMonitor *v94;
  void *v95;
  id v96;
  NSObject *v97;
  objc_class *v98;
  NSString *v99;
  char *v100;
  id v101;
  NSObject *v102;
  objc_class *v103;
  NSString *v104;
  char *v105;
  objc_class *v106;
  NSString *v107;
  char *v108;
  id v109;
  NSObject *v110;
  objc_class *v111;
  NSString *v112;
  char *v113;
  VLFSessionHomeWorkMonitor *v114;
  void *v115;
  VLFSessionHomeWorkMonitor *v116;
  id v117;
  NSObject *v118;
  objc_class *v119;
  NSString *v120;
  char *v121;
  id v122;
  NSObject *v123;
  objc_class *v124;
  NSString *v125;
  char *v126;
  id v127;
  NSObject *v128;
  objc_class *v129;
  NSString *v130;
  char *v131;
  VLFSessionLocationHorizontalAccuracyMonitor *v132;
  void *v133;
  VLFSessionLocationHorizontalAccuracyMonitor *v134;
  id v135;
  NSObject *v136;
  objc_class *v137;
  NSString *v138;
  char *v139;
  id v140;
  NSObject *v141;
  objc_class *v142;
  NSString *v143;
  char *v144;
  id v145;
  NSObject *v146;
  objc_class *v147;
  NSString *v148;
  char *v149;
  VLFSessionLocationOutdoorMonitor *v150;
  void *v151;
  VLFSessionLocationOutdoorMonitor *v152;
  id v153;
  NSObject *v154;
  objc_class *v155;
  NSString *v156;
  char *v157;
  id v158;
  NSObject *v159;
  objc_class *v160;
  NSString *v161;
  char *v162;
  id v163;
  NSObject *v164;
  objc_class *v165;
  NSString *v166;
  char *v167;
  VLFSessionLocationSignalEnvironmentMonitor *v168;
  void *v169;
  VLFSessionLocationSignalEnvironmentMonitor *v170;
  id v171;
  NSObject *v172;
  objc_class *v173;
  NSString *v174;
  char *v175;
  id v176;
  NSObject *v177;
  objc_class *v178;
  NSString *v179;
  char *v180;
  id v181;
  NSObject *v182;
  objc_class *v183;
  NSString *v184;
  char *v185;
  VLFSessionLocationTypeMonitor *v186;
  void *v187;
  VLFSessionLocationTypeMonitor *v188;
  id v189;
  NSObject *v190;
  objc_class *v191;
  NSString *v192;
  char *v193;
  id v194;
  NSObject *v195;
  objc_class *v196;
  NSString *v197;
  char *v198;
  unsigned int v199;
  id v200;
  NSObject *v201;
  _BOOL4 v202;
  objc_class *v203;
  NSString *v204;
  char *v205;
  VLFSessionMapsHomeMonitor *v206;
  void *v207;
  id v208;
  NSObject *v209;
  objc_class *v210;
  NSString *v211;
  char *v212;
  id v213;
  NSObject *v214;
  objc_class *v215;
  NSString *v216;
  char *v217;
  objc_class *v218;
  NSString *v219;
  char *v220;
  unsigned int v221;
  id v222;
  VLFSessionNetworkReachabilityMonitor *v223;
  _BOOL4 v224;
  objc_class *v225;
  NSString *v226;
  char *v227;
  id v228;
  NSObject *v229;
  objc_class *v230;
  NSString *v231;
  char *v232;
  id v233;
  NSObject *v234;
  objc_class *v235;
  NSString *v236;
  char *v237;
  objc_class *v238;
  NSString *v239;
  char *v240;
  unsigned int v241;
  id v242;
  VLFSessionOfflineMonitor *v243;
  _BOOL4 v244;
  objc_class *v245;
  NSString *v246;
  char *v247;
  id v248;
  NSObject *v249;
  objc_class *v250;
  NSString *v251;
  char *v252;
  id v253;
  NSObject *v254;
  objc_class *v255;
  NSString *v256;
  char *v257;
  objc_class *v258;
  NSString *v259;
  char *v260;
  unsigned int v261;
  id v262;
  VLFSessionThermalStateMonitor *v263;
  _BOOL4 v264;
  objc_class *v265;
  NSString *v266;
  char *v267;
  id v268;
  NSObject *v269;
  objc_class *v270;
  NSString *v271;
  char *v272;
  id v273;
  NSObject *v274;
  objc_class *v275;
  NSString *v276;
  char *v277;
  objc_class *v278;
  NSString *v279;
  char *v280;
  unsigned int v281;
  id v282;
  NSObject *v283;
  _BOOL4 v284;
  objc_class *v285;
  NSString *v286;
  char *v287;
  VLFTileObserver *v288;
  void *v289;
  void *v290;
  VLFSessionTileAvailabilityMonitor *v291;
  id v292;
  NSObject *v293;
  objc_class *v294;
  NSString *v295;
  char *v296;
  id v297;
  NSObject *v298;
  objc_class *v299;
  NSString *v300;
  char *v301;
  objc_class *v302;
  NSString *v303;
  unsigned int v304;
  id v305;
  NSObject *v306;
  _BOOL4 v307;
  objc_class *v308;
  NSString *v309;
  char *v310;
  VLFSessionTransitSteppingMonitor *v311;
  void *v312;
  id v313;
  NSObject *v314;
  objc_class *v315;
  NSString *v316;
  char *v317;
  id v318;
  NSObject *v319;
  objc_class *v320;
  NSString *v321;
  char *v322;
  objc_class *v323;
  NSString *v324;
  char *v325;
  unsigned int v326;
  id v327;
  VLFSessionUsageMonitor *v328;
  _BOOL4 v329;
  objc_class *v330;
  NSString *v331;
  char *v332;
  id v333;
  NSObject *v334;
  objc_class *v335;
  NSString *v336;
  char *v337;
  id v338;
  NSObject *v339;
  objc_class *v340;
  NSString *v341;
  char *v342;
  objc_class *v343;
  NSString *v344;
  char *v345;
  id v346;
  NSObject *v347;
  objc_class *v348;
  NSString *v349;
  char *v350;
  VLFSessionDebugPuckVisibilityMonitor *v351;
  id v352;
  NSObject *v353;
  objc_class *v354;
  NSString *v355;
  char *v356;
  id v357;
  NSObject *v358;
  objc_class *v359;
  NSString *v360;
  char *v361;
  VLFSessionDebugBannerVisibilityMonitor *v362;
  id v363;
  NSObject *v364;
  objc_class *v365;
  NSString *v366;
  char *v367;
  unsigned int v368;
  id v369;
  NSObject *v370;
  _BOOL4 v371;
  objc_class *v372;
  NSString *v373;
  char *v374;
  VLFSessionSunsetSunriseMonitor *v375;
  void *v376;
  void *v377;
  void *v378;
  id v379;
  NSObject *v380;
  objc_class *v381;
  NSString *v382;
  char *v383;
  id v384;
  NSObject *v385;
  objc_class *v386;
  NSString *v387;
  char *v388;
  objc_class *v389;
  NSString *v390;
  char *v391;
  id v392;
  NSObject *v393;
  id v394;
  NSObject *v395;
  char *v396;
  id v397;
  NSObject *v398;
  int v399;
  const char *v400;
  __int16 v401;
  const char *v402;
  __int16 v403;
  int v404;
  __int16 v405;
  const char *v406;

  if (!self->_didBuildMonitors)
    goto LABEL_2;
  v392 = sub_1004318FC();
  v393 = objc_claimAutoreleasedReturnValue(v392);
  if (os_log_type_enabled(v393, OS_LOG_TYPE_ERROR))
  {
    v399 = 136315906;
    v400 = "-[VLFSessionStateManager buildMonitors]";
    v401 = 2080;
    v402 = "VLFSessionStateManager.m";
    v403 = 1024;
    v404 = 124;
    v405 = 2080;
    v406 = "!_didBuildMonitors";
    _os_log_impl((void *)&_mh_execute_header, v393, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v399, 0x26u);
  }

  if (sub_100A70734())
  {
    v394 = sub_1004318FC();
    v395 = objc_claimAutoreleasedReturnValue(v394);
    if (os_log_type_enabled(v395, OS_LOG_TYPE_ERROR))
    {
      v396 = (char *)(id)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v399 = 138412290;
      v400 = v396;
      _os_log_impl((void *)&_mh_execute_header, v395, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v399, 0xCu);

    }
  }
  if (!self->_didBuildMonitors)
  {
LABEL_2:
    v3 = +[VLFSessionAppLaunchDelayMonitor isEnabled](VLFSessionAppLaunchDelayMonitor, "isEnabled");
    v4 = sub_100248910();
    v5 = (VLFSessionAppLaunchDelayMonitor *)objc_claimAutoreleasedReturnValue(v4);
    v6 = os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        v7 = (objc_class *)objc_opt_class(VLFSessionAppLaunchDelayMonitor);
        v8 = NSStringFromClass(v7);
        v9 = (char *)(id)objc_claimAutoreleasedReturnValue(v8);
        v399 = 138412290;
        v400 = v9;
        _os_log_impl((void *)&_mh_execute_header, &v5->super.super, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

      }
      v5 = -[VLFSessionAppLaunchDelayMonitor initWithObserver:]([VLFSessionAppLaunchDelayMonitor alloc], "initWithObserver:", self);
      if (+[VLFSessionAppLaunchDelayMonitor affectsPuckVisibility](VLFSessionAppLaunchDelayMonitor, "affectsPuckVisibility"))
      {
        v10 = sub_100248910();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = (objc_class *)objc_opt_class(VLFSessionAppLaunchDelayMonitor);
          v13 = NSStringFromClass(v12);
          v14 = (char *)(id)objc_claimAutoreleasedReturnValue(v13);
          v399 = 138412290;
          v400 = v14;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v5);
      }
      if (+[VLFSessionAppLaunchDelayMonitor affectsBannerVisibility](VLFSessionAppLaunchDelayMonitor, "affectsBannerVisibility"))
      {
        v15 = sub_100248910();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = (objc_class *)objc_opt_class(VLFSessionAppLaunchDelayMonitor);
          v18 = NSStringFromClass(v17);
          v19 = (char *)(id)objc_claimAutoreleasedReturnValue(v18);
          v399 = 138412290;
          v400 = v19;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v5);
      }
    }
    else if (v6)
    {
      v20 = (objc_class *)objc_opt_class(VLFSessionAppLaunchDelayMonitor);
      v21 = NSStringFromClass(v20);
      v22 = (char *)(id)objc_claimAutoreleasedReturnValue(v21);
      v399 = 138412290;
      v400 = v22;
      _os_log_impl((void *)&_mh_execute_header, &v5->super.super, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v399, 0xCu);

    }
    v23 = +[VLFSessionCarPlayConnectionMonitor isEnabled](VLFSessionCarPlayConnectionMonitor, "isEnabled");
    v24 = sub_100248910();
    v25 = (VLFSessionCarPlayConnectionMonitor *)objc_claimAutoreleasedReturnValue(v24);
    v26 = os_log_type_enabled(&v25->super.super, OS_LOG_TYPE_INFO);
    if (v23)
    {
      if (v26)
      {
        v27 = (objc_class *)objc_opt_class(VLFSessionCarPlayConnectionMonitor);
        v28 = NSStringFromClass(v27);
        v29 = (char *)(id)objc_claimAutoreleasedReturnValue(v28);
        v399 = 138412290;
        v400 = v29;
        _os_log_impl((void *)&_mh_execute_header, &v25->super.super, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

      }
      v25 = -[VLFSessionCarPlayConnectionMonitor initWithObserver:]([VLFSessionCarPlayConnectionMonitor alloc], "initWithObserver:", self);
      if (+[VLFSessionCarPlayConnectionMonitor affectsPuckVisibility](VLFSessionCarPlayConnectionMonitor, "affectsPuckVisibility"))
      {
        v30 = sub_100248910();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = (objc_class *)objc_opt_class(VLFSessionCarPlayConnectionMonitor);
          v33 = NSStringFromClass(v32);
          v34 = (char *)(id)objc_claimAutoreleasedReturnValue(v33);
          v399 = 138412290;
          v400 = v34;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v25);
      }
      if (+[VLFSessionCarPlayConnectionMonitor affectsBannerVisibility](VLFSessionCarPlayConnectionMonitor, "affectsBannerVisibility"))
      {
        v35 = sub_100248910();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = (objc_class *)objc_opt_class(VLFSessionCarPlayConnectionMonitor);
          v38 = NSStringFromClass(v37);
          v39 = (char *)(id)objc_claimAutoreleasedReturnValue(v38);
          v399 = 138412290;
          v400 = v39;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v25);
      }
    }
    else if (v26)
    {
      v40 = (objc_class *)objc_opt_class(VLFSessionCarPlayConnectionMonitor);
      v41 = NSStringFromClass(v40);
      v42 = (char *)(id)objc_claimAutoreleasedReturnValue(v41);
      v399 = 138412290;
      v400 = v42;
      _os_log_impl((void *)&_mh_execute_header, &v25->super.super, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v399, 0xCu);

    }
    v43 = +[VLFSessionChromeStackMonitor isEnabled](VLFSessionChromeStackMonitor, "isEnabled");
    v44 = sub_100248910();
    v45 = objc_claimAutoreleasedReturnValue(v44);
    v46 = os_log_type_enabled(v45, OS_LOG_TYPE_INFO);
    if (v43)
    {
      if (v46)
      {
        v47 = (objc_class *)objc_opt_class(VLFSessionChromeStackMonitor);
        v48 = NSStringFromClass(v47);
        v49 = (char *)(id)objc_claimAutoreleasedReturnValue(v48);
        v399 = 138412290;
        v400 = v49;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

      }
      v50 = [VLFSessionChromeStackMonitor alloc];
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateManager platformController](self, "platformController"));
      v45 = -[VLFSessionChromeStackMonitor initWithObserver:platformController:](v50, "initWithObserver:platformController:", self, v51);

      if (+[VLFSessionChromeStackMonitor affectsPuckVisibility](VLFSessionChromeStackMonitor, "affectsPuckVisibility"))
      {
        v52 = sub_100248910();
        v53 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          v54 = (objc_class *)objc_opt_class(VLFSessionChromeStackMonitor);
          v55 = NSStringFromClass(v54);
          v56 = (char *)(id)objc_claimAutoreleasedReturnValue(v55);
          v399 = 138412290;
          v400 = v56;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v45);
      }
      if (+[VLFSessionChromeStackMonitor affectsBannerVisibility](VLFSessionChromeStackMonitor, "affectsBannerVisibility"))
      {
        v57 = sub_100248910();
        v58 = objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          v59 = (objc_class *)objc_opt_class(VLFSessionChromeStackMonitor);
          v60 = NSStringFromClass(v59);
          v61 = (char *)(id)objc_claimAutoreleasedReturnValue(v60);
          v399 = 138412290;
          v400 = v61;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v45);
      }
    }
    else if (v46)
    {
      v62 = (objc_class *)objc_opt_class(VLFSessionChromeStackMonitor);
      v63 = NSStringFromClass(v62);
      v64 = (char *)(id)objc_claimAutoreleasedReturnValue(v63);
      v399 = 138412290;
      v400 = v64;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v399, 0xCu);

    }
    v65 = +[VLFSessionCoarseLocationMonitor isEnabled](VLFSessionCoarseLocationMonitor, "isEnabled");
    v66 = sub_100248910();
    v67 = objc_claimAutoreleasedReturnValue(v66);
    v68 = os_log_type_enabled(v67, OS_LOG_TYPE_INFO);
    if (v65)
    {
      if (v68)
      {
        v69 = (objc_class *)objc_opt_class(VLFSessionCoarseLocationMonitor);
        v70 = NSStringFromClass(v69);
        v71 = (char *)(id)objc_claimAutoreleasedReturnValue(v70);
        v399 = 138412290;
        v400 = v71;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

      }
      v72 = [VLFSessionCoarseLocationMonitor alloc];
      v73 = objc_alloc_init((Class)MKLocationManager);
      v67 = -[VLFSessionCoarseLocationMonitor initWithObserver:locationManager:](v72, "initWithObserver:locationManager:", self, v73);

      if (+[VLFSessionCoarseLocationMonitor affectsPuckVisibility](VLFSessionCoarseLocationMonitor, "affectsPuckVisibility"))
      {
        v74 = sub_100248910();
        v75 = objc_claimAutoreleasedReturnValue(v74);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          v76 = (objc_class *)objc_opt_class(VLFSessionCoarseLocationMonitor);
          v77 = NSStringFromClass(v76);
          v78 = (char *)(id)objc_claimAutoreleasedReturnValue(v77);
          v399 = 138412290;
          v400 = v78;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v67);
      }
      if (+[VLFSessionCoarseLocationMonitor affectsBannerVisibility](VLFSessionCoarseLocationMonitor, "affectsBannerVisibility"))
      {
        v79 = sub_100248910();
        v80 = objc_claimAutoreleasedReturnValue(v79);
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          v81 = (objc_class *)objc_opt_class(VLFSessionCoarseLocationMonitor);
          v82 = NSStringFromClass(v81);
          v83 = (char *)(id)objc_claimAutoreleasedReturnValue(v82);
          v399 = 138412290;
          v400 = v83;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v67);
      }
    }
    else if (v68)
    {
      v84 = (objc_class *)objc_opt_class(VLFSessionCoarseLocationMonitor);
      v85 = NSStringFromClass(v84);
      v86 = (char *)(id)objc_claimAutoreleasedReturnValue(v85);
      v399 = 138412290;
      v400 = v86;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v399, 0xCu);

    }
    v87 = +[VLFSessionHistoricalLocationAccuracyMonitor isEnabled](VLFSessionHistoricalLocationAccuracyMonitor, "isEnabled");
    v88 = sub_100248910();
    v89 = objc_claimAutoreleasedReturnValue(v88);
    v90 = os_log_type_enabled(v89, OS_LOG_TYPE_INFO);
    if (v87)
    {
      if (v90)
      {
        v91 = (objc_class *)objc_opt_class(VLFSessionHistoricalLocationAccuracyMonitor);
        v92 = NSStringFromClass(v91);
        v93 = (char *)(id)objc_claimAutoreleasedReturnValue(v92);
        v399 = 138412290;
        v400 = v93;
        _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

      }
      v94 = [VLFSessionHistoricalLocationAccuracyMonitor alloc];
      v95 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v89 = -[VLFSessionHistoricalLocationAccuracyMonitor initWithObserver:locationManager:](v94, "initWithObserver:locationManager:", self, v95);

      if (+[VLFSessionHistoricalLocationAccuracyMonitor affectsPuckVisibility](VLFSessionHistoricalLocationAccuracyMonitor, "affectsPuckVisibility"))
      {
        v96 = sub_100248910();
        v97 = objc_claimAutoreleasedReturnValue(v96);
        if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
        {
          v98 = (objc_class *)objc_opt_class(VLFSessionHistoricalLocationAccuracyMonitor);
          v99 = NSStringFromClass(v98);
          v100 = (char *)(id)objc_claimAutoreleasedReturnValue(v99);
          v399 = 138412290;
          v400 = v100;
          _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v89);
      }
      if (+[VLFSessionHistoricalLocationAccuracyMonitor affectsBannerVisibility](VLFSessionHistoricalLocationAccuracyMonitor, "affectsBannerVisibility"))
      {
        v101 = sub_100248910();
        v102 = objc_claimAutoreleasedReturnValue(v101);
        if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
        {
          v103 = (objc_class *)objc_opt_class(VLFSessionHistoricalLocationAccuracyMonitor);
          v104 = NSStringFromClass(v103);
          v105 = (char *)(id)objc_claimAutoreleasedReturnValue(v104);
          v399 = 138412290;
          v400 = v105;
          _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v89);
      }
    }
    else if (v90)
    {
      v106 = (objc_class *)objc_opt_class(VLFSessionHistoricalLocationAccuracyMonitor);
      v107 = NSStringFromClass(v106);
      v108 = (char *)(id)objc_claimAutoreleasedReturnValue(v107);
      v399 = 138412290;
      v400 = v108;
      _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v399, 0xCu);

    }
    if (+[VLFSessionHomeWorkMonitor isEnabled](VLFSessionHomeWorkMonitor, "isEnabled"))
    {
      v109 = sub_100248910();
      v110 = objc_claimAutoreleasedReturnValue(v109);
      if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
      {
        v111 = (objc_class *)objc_opt_class(VLFSessionHomeWorkMonitor);
        v112 = NSStringFromClass(v111);
        v113 = (char *)(id)objc_claimAutoreleasedReturnValue(v112);
        v399 = 138412290;
        v400 = v113;
        _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

      }
      v114 = [VLFSessionHomeWorkMonitor alloc];
      v115 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v116 = -[VLFSessionHomeWorkMonitor initWithObserver:locationManager:](v114, "initWithObserver:locationManager:", self, v115);

      if (+[VLFSessionHomeWorkMonitor affectsPuckVisibility](VLFSessionHomeWorkMonitor, "affectsPuckVisibility"))
      {
        v117 = sub_100248910();
        v118 = objc_claimAutoreleasedReturnValue(v117);
        if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
        {
          v119 = (objc_class *)objc_opt_class(VLFSessionHomeWorkMonitor);
          v120 = NSStringFromClass(v119);
          v121 = (char *)(id)objc_claimAutoreleasedReturnValue(v120);
          v399 = 138412290;
          v400 = v121;
          _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v116);
      }
      if (+[VLFSessionHomeWorkMonitor affectsBannerVisibility](VLFSessionHomeWorkMonitor, "affectsBannerVisibility"))
      {
        v122 = sub_100248910();
        v123 = objc_claimAutoreleasedReturnValue(v122);
        if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
        {
          v124 = (objc_class *)objc_opt_class(VLFSessionHomeWorkMonitor);
          v125 = NSStringFromClass(v124);
          v126 = (char *)(id)objc_claimAutoreleasedReturnValue(v125);
          v399 = 138412290;
          v400 = v126;
          _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v116);
      }

    }
    if (+[VLFSessionLocationHorizontalAccuracyMonitor isEnabled](VLFSessionLocationHorizontalAccuracyMonitor, "isEnabled"))
    {
      v127 = sub_100248910();
      v128 = objc_claimAutoreleasedReturnValue(v127);
      if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
      {
        v129 = (objc_class *)objc_opt_class(VLFSessionLocationHorizontalAccuracyMonitor);
        v130 = NSStringFromClass(v129);
        v131 = (char *)(id)objc_claimAutoreleasedReturnValue(v130);
        v399 = 138412290;
        v400 = v131;
        _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

      }
      v132 = [VLFSessionLocationHorizontalAccuracyMonitor alloc];
      v133 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v134 = -[VLFSessionLocationHorizontalAccuracyMonitor initWithObserver:locationManager:](v132, "initWithObserver:locationManager:", self, v133);

      if (+[VLFSessionLocationHorizontalAccuracyMonitor affectsPuckVisibility](VLFSessionLocationHorizontalAccuracyMonitor, "affectsPuckVisibility"))
      {
        v135 = sub_100248910();
        v136 = objc_claimAutoreleasedReturnValue(v135);
        if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
        {
          v137 = (objc_class *)objc_opt_class(VLFSessionLocationHorizontalAccuracyMonitor);
          v138 = NSStringFromClass(v137);
          v139 = (char *)(id)objc_claimAutoreleasedReturnValue(v138);
          v399 = 138412290;
          v400 = v139;
          _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v134);
      }
      if (+[VLFSessionLocationHorizontalAccuracyMonitor affectsBannerVisibility](VLFSessionLocationHorizontalAccuracyMonitor, "affectsBannerVisibility"))
      {
        v140 = sub_100248910();
        v141 = objc_claimAutoreleasedReturnValue(v140);
        if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
        {
          v142 = (objc_class *)objc_opt_class(VLFSessionLocationHorizontalAccuracyMonitor);
          v143 = NSStringFromClass(v142);
          v144 = (char *)(id)objc_claimAutoreleasedReturnValue(v143);
          v399 = 138412290;
          v400 = v144;
          _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v134);
      }

    }
    if (+[VLFSessionLocationOutdoorMonitor isEnabled](VLFSessionLocationOutdoorMonitor, "isEnabled"))
    {
      v145 = sub_100248910();
      v146 = objc_claimAutoreleasedReturnValue(v145);
      if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
      {
        v147 = (objc_class *)objc_opt_class(VLFSessionLocationOutdoorMonitor);
        v148 = NSStringFromClass(v147);
        v149 = (char *)(id)objc_claimAutoreleasedReturnValue(v148);
        v399 = 138412290;
        v400 = v149;
        _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

      }
      v150 = [VLFSessionLocationOutdoorMonitor alloc];
      v151 = (void *)objc_claimAutoreleasedReturnValue(+[VLFLocationManager sharedLocationManager](VLFLocationManager, "sharedLocationManager"));
      v152 = -[VLFSessionLocationOutdoorMonitor initWithObserver:locationManager:](v150, "initWithObserver:locationManager:", self, v151);

      if (+[VLFSessionLocationOutdoorMonitor affectsPuckVisibility](VLFSessionLocationOutdoorMonitor, "affectsPuckVisibility"))
      {
        v153 = sub_100248910();
        v154 = objc_claimAutoreleasedReturnValue(v153);
        if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
        {
          v155 = (objc_class *)objc_opt_class(VLFSessionLocationOutdoorMonitor);
          v156 = NSStringFromClass(v155);
          v157 = (char *)(id)objc_claimAutoreleasedReturnValue(v156);
          v399 = 138412290;
          v400 = v157;
          _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v152);
      }
      if (+[VLFSessionLocationOutdoorMonitor affectsBannerVisibility](VLFSessionLocationOutdoorMonitor, "affectsBannerVisibility"))
      {
        v158 = sub_100248910();
        v159 = objc_claimAutoreleasedReturnValue(v158);
        if (os_log_type_enabled(v159, OS_LOG_TYPE_INFO))
        {
          v160 = (objc_class *)objc_opt_class(VLFSessionLocationOutdoorMonitor);
          v161 = NSStringFromClass(v160);
          v162 = (char *)(id)objc_claimAutoreleasedReturnValue(v161);
          v399 = 138412290;
          v400 = v162;
          _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v152);
      }

    }
    if (+[VLFSessionLocationSignalEnvironmentMonitor isEnabled](VLFSessionLocationSignalEnvironmentMonitor, "isEnabled"))
    {
      v163 = sub_100248910();
      v164 = objc_claimAutoreleasedReturnValue(v163);
      if (os_log_type_enabled(v164, OS_LOG_TYPE_INFO))
      {
        v165 = (objc_class *)objc_opt_class(VLFSessionLocationSignalEnvironmentMonitor);
        v166 = NSStringFromClass(v165);
        v167 = (char *)(id)objc_claimAutoreleasedReturnValue(v166);
        v399 = 138412290;
        v400 = v167;
        _os_log_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

      }
      v168 = [VLFSessionLocationSignalEnvironmentMonitor alloc];
      v169 = (void *)objc_claimAutoreleasedReturnValue(+[VLFLocationManager sharedLocationManager](VLFLocationManager, "sharedLocationManager"));
      v170 = -[VLFSessionLocationSignalEnvironmentMonitor initWithObserver:locationManager:](v168, "initWithObserver:locationManager:", self, v169);

      if (+[VLFSessionLocationSignalEnvironmentMonitor affectsPuckVisibility](VLFSessionLocationSignalEnvironmentMonitor, "affectsPuckVisibility"))
      {
        v171 = sub_100248910();
        v172 = objc_claimAutoreleasedReturnValue(v171);
        if (os_log_type_enabled(v172, OS_LOG_TYPE_INFO))
        {
          v173 = (objc_class *)objc_opt_class(VLFSessionLocationSignalEnvironmentMonitor);
          v174 = NSStringFromClass(v173);
          v175 = (char *)(id)objc_claimAutoreleasedReturnValue(v174);
          v399 = 138412290;
          v400 = v175;
          _os_log_impl((void *)&_mh_execute_header, v172, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v170);
      }
      if (+[VLFSessionLocationSignalEnvironmentMonitor affectsBannerVisibility](VLFSessionLocationSignalEnvironmentMonitor, "affectsBannerVisibility"))
      {
        v176 = sub_100248910();
        v177 = objc_claimAutoreleasedReturnValue(v176);
        if (os_log_type_enabled(v177, OS_LOG_TYPE_INFO))
        {
          v178 = (objc_class *)objc_opt_class(VLFSessionLocationSignalEnvironmentMonitor);
          v179 = NSStringFromClass(v178);
          v180 = (char *)(id)objc_claimAutoreleasedReturnValue(v179);
          v399 = 138412290;
          v400 = v180;
          _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v170);
      }

    }
    if (+[VLFSessionLocationTypeMonitor isEnabled](VLFSessionLocationTypeMonitor, "isEnabled"))
    {
      v181 = sub_100248910();
      v182 = objc_claimAutoreleasedReturnValue(v181);
      if (os_log_type_enabled(v182, OS_LOG_TYPE_INFO))
      {
        v183 = (objc_class *)objc_opt_class(VLFSessionLocationTypeMonitor);
        v184 = NSStringFromClass(v183);
        v185 = (char *)(id)objc_claimAutoreleasedReturnValue(v184);
        v399 = 138412290;
        v400 = v185;
        _os_log_impl((void *)&_mh_execute_header, v182, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

      }
      v186 = [VLFSessionLocationTypeMonitor alloc];
      v187 = (void *)objc_claimAutoreleasedReturnValue(+[VLFLocationManager sharedLocationManager](VLFLocationManager, "sharedLocationManager"));
      v188 = -[VLFSessionLocationTypeMonitor initWithObserver:locationManager:](v186, "initWithObserver:locationManager:", self, v187);

      if (+[VLFSessionLocationTypeMonitor affectsPuckVisibility](VLFSessionLocationTypeMonitor, "affectsPuckVisibility"))
      {
        v189 = sub_100248910();
        v190 = objc_claimAutoreleasedReturnValue(v189);
        if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
        {
          v191 = (objc_class *)objc_opt_class(VLFSessionLocationTypeMonitor);
          v192 = NSStringFromClass(v191);
          v193 = (char *)(id)objc_claimAutoreleasedReturnValue(v192);
          v399 = 138412290;
          v400 = v193;
          _os_log_impl((void *)&_mh_execute_header, v190, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v188);
      }
      if (+[VLFSessionLocationTypeMonitor affectsBannerVisibility](VLFSessionLocationTypeMonitor, "affectsBannerVisibility"))
      {
        v194 = sub_100248910();
        v195 = objc_claimAutoreleasedReturnValue(v194);
        if (os_log_type_enabled(v195, OS_LOG_TYPE_INFO))
        {
          v196 = (objc_class *)objc_opt_class(VLFSessionLocationTypeMonitor);
          v197 = NSStringFromClass(v196);
          v198 = (char *)(id)objc_claimAutoreleasedReturnValue(v197);
          v399 = 138412290;
          v400 = v198;
          _os_log_impl((void *)&_mh_execute_header, v195, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v188);
      }

    }
    v199 = +[VLFSessionMapsHomeMonitor isEnabled](VLFSessionMapsHomeMonitor, "isEnabled");
    v200 = sub_100248910();
    v201 = objc_claimAutoreleasedReturnValue(v200);
    v202 = os_log_type_enabled(v201, OS_LOG_TYPE_INFO);
    if (v199)
    {
      if (v202)
      {
        v203 = (objc_class *)objc_opt_class(VLFSessionMapsHomeMonitor);
        v204 = NSStringFromClass(v203);
        v205 = (char *)(id)objc_claimAutoreleasedReturnValue(v204);
        v399 = 138412290;
        v400 = v205;
        _os_log_impl((void *)&_mh_execute_header, v201, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

      }
      v206 = [VLFSessionMapsHomeMonitor alloc];
      v207 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateManager platformController](self, "platformController"));
      v201 = -[VLFSessionMapsHomeMonitor initWithObserver:platformController:](v206, "initWithObserver:platformController:", self, v207);

      if (+[VLFSessionMapsHomeMonitor affectsPuckVisibility](VLFSessionMapsHomeMonitor, "affectsPuckVisibility"))
      {
        v208 = sub_100248910();
        v209 = objc_claimAutoreleasedReturnValue(v208);
        if (os_log_type_enabled(v209, OS_LOG_TYPE_INFO))
        {
          v210 = (objc_class *)objc_opt_class(VLFSessionMapsHomeMonitor);
          v211 = NSStringFromClass(v210);
          v212 = (char *)(id)objc_claimAutoreleasedReturnValue(v211);
          v399 = 138412290;
          v400 = v212;
          _os_log_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v201);
      }
      if (+[VLFSessionMapsHomeMonitor affectsBannerVisibility](VLFSessionMapsHomeMonitor, "affectsBannerVisibility"))
      {
        v213 = sub_100248910();
        v214 = objc_claimAutoreleasedReturnValue(v213);
        if (os_log_type_enabled(v214, OS_LOG_TYPE_INFO))
        {
          v215 = (objc_class *)objc_opt_class(VLFSessionMapsHomeMonitor);
          v216 = NSStringFromClass(v215);
          v217 = (char *)(id)objc_claimAutoreleasedReturnValue(v216);
          v399 = 138412290;
          v400 = v217;
          _os_log_impl((void *)&_mh_execute_header, v214, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v201);
      }
    }
    else if (v202)
    {
      v218 = (objc_class *)objc_opt_class(VLFSessionMapsHomeMonitor);
      v219 = NSStringFromClass(v218);
      v220 = (char *)(id)objc_claimAutoreleasedReturnValue(v219);
      v399 = 138412290;
      v400 = v220;
      _os_log_impl((void *)&_mh_execute_header, v201, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v399, 0xCu);

    }
    v221 = +[VLFSessionNetworkReachabilityMonitor isEnabled](VLFSessionNetworkReachabilityMonitor, "isEnabled");
    v222 = sub_100248910();
    v223 = (VLFSessionNetworkReachabilityMonitor *)objc_claimAutoreleasedReturnValue(v222);
    v224 = os_log_type_enabled(&v223->super.super, OS_LOG_TYPE_INFO);
    if (v221)
    {
      if (v224)
      {
        v225 = (objc_class *)objc_opt_class(VLFSessionNetworkReachabilityMonitor);
        v226 = NSStringFromClass(v225);
        v227 = (char *)(id)objc_claimAutoreleasedReturnValue(v226);
        v399 = 138412290;
        v400 = v227;
        _os_log_impl((void *)&_mh_execute_header, &v223->super.super, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

      }
      v223 = -[VLFSessionNetworkReachabilityMonitor initWithObserver:]([VLFSessionNetworkReachabilityMonitor alloc], "initWithObserver:", self);
      if (+[VLFSessionNetworkReachabilityMonitor affectsPuckVisibility](VLFSessionNetworkReachabilityMonitor, "affectsPuckVisibility"))
      {
        v228 = sub_100248910();
        v229 = objc_claimAutoreleasedReturnValue(v228);
        if (os_log_type_enabled(v229, OS_LOG_TYPE_INFO))
        {
          v230 = (objc_class *)objc_opt_class(VLFSessionNetworkReachabilityMonitor);
          v231 = NSStringFromClass(v230);
          v232 = (char *)(id)objc_claimAutoreleasedReturnValue(v231);
          v399 = 138412290;
          v400 = v232;
          _os_log_impl((void *)&_mh_execute_header, v229, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v223);
      }
      if (+[VLFSessionNetworkReachabilityMonitor affectsBannerVisibility](VLFSessionNetworkReachabilityMonitor, "affectsBannerVisibility"))
      {
        v233 = sub_100248910();
        v234 = objc_claimAutoreleasedReturnValue(v233);
        if (os_log_type_enabled(v234, OS_LOG_TYPE_INFO))
        {
          v235 = (objc_class *)objc_opt_class(VLFSessionNetworkReachabilityMonitor);
          v236 = NSStringFromClass(v235);
          v237 = (char *)(id)objc_claimAutoreleasedReturnValue(v236);
          v399 = 138412290;
          v400 = v237;
          _os_log_impl((void *)&_mh_execute_header, v234, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v223);
      }
    }
    else if (v224)
    {
      v238 = (objc_class *)objc_opt_class(VLFSessionNetworkReachabilityMonitor);
      v239 = NSStringFromClass(v238);
      v240 = (char *)(id)objc_claimAutoreleasedReturnValue(v239);
      v399 = 138412290;
      v400 = v240;
      _os_log_impl((void *)&_mh_execute_header, &v223->super.super, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v399, 0xCu);

    }
    v241 = +[VLFSessionOfflineMonitor isEnabled](VLFSessionOfflineMonitor, "isEnabled");
    v242 = sub_100248910();
    v243 = (VLFSessionOfflineMonitor *)objc_claimAutoreleasedReturnValue(v242);
    v244 = os_log_type_enabled(&v243->super.super, OS_LOG_TYPE_INFO);
    if (v241)
    {
      if (v244)
      {
        v245 = (objc_class *)objc_opt_class(VLFSessionOfflineMonitor);
        v246 = NSStringFromClass(v245);
        v247 = (char *)(id)objc_claimAutoreleasedReturnValue(v246);
        v399 = 138412290;
        v400 = v247;
        _os_log_impl((void *)&_mh_execute_header, &v243->super.super, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

      }
      v243 = -[VLFSessionOfflineMonitor initWithObserver:]([VLFSessionOfflineMonitor alloc], "initWithObserver:", self);
      if (+[VLFSessionOfflineMonitor affectsPuckVisibility](VLFSessionOfflineMonitor, "affectsPuckVisibility"))
      {
        v248 = sub_100248910();
        v249 = objc_claimAutoreleasedReturnValue(v248);
        if (os_log_type_enabled(v249, OS_LOG_TYPE_INFO))
        {
          v250 = (objc_class *)objc_opt_class(VLFSessionOfflineMonitor);
          v251 = NSStringFromClass(v250);
          v252 = (char *)(id)objc_claimAutoreleasedReturnValue(v251);
          v399 = 138412290;
          v400 = v252;
          _os_log_impl((void *)&_mh_execute_header, v249, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v243);
      }
      if (+[VLFSessionOfflineMonitor affectsBannerVisibility](VLFSessionOfflineMonitor, "affectsBannerVisibility"))
      {
        v253 = sub_100248910();
        v254 = objc_claimAutoreleasedReturnValue(v253);
        if (os_log_type_enabled(v254, OS_LOG_TYPE_INFO))
        {
          v255 = (objc_class *)objc_opt_class(VLFSessionOfflineMonitor);
          v256 = NSStringFromClass(v255);
          v257 = (char *)(id)objc_claimAutoreleasedReturnValue(v256);
          v399 = 138412290;
          v400 = v257;
          _os_log_impl((void *)&_mh_execute_header, v254, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v243);
      }
    }
    else if (v244)
    {
      v258 = (objc_class *)objc_opt_class(VLFSessionOfflineMonitor);
      v259 = NSStringFromClass(v258);
      v260 = (char *)(id)objc_claimAutoreleasedReturnValue(v259);
      v399 = 138412290;
      v400 = v260;
      _os_log_impl((void *)&_mh_execute_header, &v243->super.super, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v399, 0xCu);

    }
    v261 = +[VLFSessionThermalStateMonitor isEnabled](VLFSessionThermalStateMonitor, "isEnabled");
    v262 = sub_100248910();
    v263 = (VLFSessionThermalStateMonitor *)objc_claimAutoreleasedReturnValue(v262);
    v264 = os_log_type_enabled(&v263->super.super, OS_LOG_TYPE_INFO);
    if (v261)
    {
      if (v264)
      {
        v265 = (objc_class *)objc_opt_class(VLFSessionThermalStateMonitor);
        v266 = NSStringFromClass(v265);
        v267 = (char *)(id)objc_claimAutoreleasedReturnValue(v266);
        v399 = 138412290;
        v400 = v267;
        _os_log_impl((void *)&_mh_execute_header, &v263->super.super, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

      }
      v263 = -[VLFSessionThermalStateMonitor initWithObserver:]([VLFSessionThermalStateMonitor alloc], "initWithObserver:", self);
      if (+[VLFSessionThermalStateMonitor affectsPuckVisibility](VLFSessionThermalStateMonitor, "affectsPuckVisibility"))
      {
        v268 = sub_100248910();
        v269 = objc_claimAutoreleasedReturnValue(v268);
        if (os_log_type_enabled(v269, OS_LOG_TYPE_INFO))
        {
          v270 = (objc_class *)objc_opt_class(VLFSessionSunsetSunriseMonitor);
          v271 = NSStringFromClass(v270);
          v272 = (char *)(id)objc_claimAutoreleasedReturnValue(v271);
          v399 = 138412290;
          v400 = v272;
          _os_log_impl((void *)&_mh_execute_header, v269, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v263);
      }
      if (+[VLFSessionThermalStateMonitor affectsBannerVisibility](VLFSessionThermalStateMonitor, "affectsBannerVisibility"))
      {
        v273 = sub_100248910();
        v274 = objc_claimAutoreleasedReturnValue(v273);
        if (os_log_type_enabled(v274, OS_LOG_TYPE_INFO))
        {
          v275 = (objc_class *)objc_opt_class(VLFSessionSunsetSunriseMonitor);
          v276 = NSStringFromClass(v275);
          v277 = (char *)(id)objc_claimAutoreleasedReturnValue(v276);
          v399 = 138412290;
          v400 = v277;
          _os_log_impl((void *)&_mh_execute_header, v274, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v263);
      }
    }
    else if (v264)
    {
      v278 = (objc_class *)objc_opt_class(VLFSessionThermalStateMonitor);
      v279 = NSStringFromClass(v278);
      v280 = (char *)(id)objc_claimAutoreleasedReturnValue(v279);
      v399 = 138412290;
      v400 = v280;
      _os_log_impl((void *)&_mh_execute_header, &v263->super.super, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v399, 0xCu);

    }
    v281 = +[VLFSessionTileAvailabilityMonitor isEnabled](VLFSessionTileAvailabilityMonitor, "isEnabled");
    v282 = sub_100248910();
    v283 = objc_claimAutoreleasedReturnValue(v282);
    v284 = os_log_type_enabled(v283, OS_LOG_TYPE_INFO);
    if (v281)
    {
      if (v284)
      {
        v285 = (objc_class *)objc_opt_class(VLFSessionTileAvailabilityMonitor);
        v286 = NSStringFromClass(v285);
        v287 = (char *)(id)objc_claimAutoreleasedReturnValue(v286);
        v399 = 138412290;
        v400 = v287;
        _os_log_impl((void *)&_mh_execute_header, v283, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

      }
      v288 = [VLFTileObserver alloc];
      v289 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v290 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v283 = -[VLFTileObserver initWithLocationManager:navigationService:purpose:](v288, "initWithLocationManager:navigationService:purpose:", v289, v290, 1);

      v291 = -[VLFSessionTileAvailabilityMonitor initWithObserver:tileObserver:]([VLFSessionTileAvailabilityMonitor alloc], "initWithObserver:tileObserver:", self, v283);
      if (+[VLFSessionTileAvailabilityMonitor affectsPuckVisibility](VLFSessionTileAvailabilityMonitor, "affectsPuckVisibility"))
      {
        v292 = sub_100248910();
        v293 = objc_claimAutoreleasedReturnValue(v292);
        if (os_log_type_enabled(v293, OS_LOG_TYPE_INFO))
        {
          v294 = (objc_class *)objc_opt_class(VLFSessionTileAvailabilityMonitor);
          v295 = NSStringFromClass(v294);
          v296 = (char *)(id)objc_claimAutoreleasedReturnValue(v295);
          v399 = 138412290;
          v400 = v296;
          _os_log_impl((void *)&_mh_execute_header, v293, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v291);
      }
      if (+[VLFSessionTileAvailabilityMonitor affectsBannerVisibility](VLFSessionTileAvailabilityMonitor, "affectsBannerVisibility"))
      {
        v297 = sub_100248910();
        v298 = objc_claimAutoreleasedReturnValue(v297);
        if (os_log_type_enabled(v298, OS_LOG_TYPE_INFO))
        {
          v299 = (objc_class *)objc_opt_class(VLFSessionTileAvailabilityMonitor);
          v300 = NSStringFromClass(v299);
          v301 = (char *)(id)objc_claimAutoreleasedReturnValue(v300);
          v399 = 138412290;
          v400 = v301;
          _os_log_impl((void *)&_mh_execute_header, v298, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

        }
        -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v291);
      }
    }
    else
    {
      if (!v284)
      {
LABEL_193:

        v304 = +[VLFSessionTransitSteppingMonitor isEnabled](VLFSessionTransitSteppingMonitor, "isEnabled");
        v305 = sub_100248910();
        v306 = objc_claimAutoreleasedReturnValue(v305);
        v307 = os_log_type_enabled(v306, OS_LOG_TYPE_INFO);
        if (v304)
        {
          if (v307)
          {
            v308 = (objc_class *)objc_opt_class(VLFSessionTransitSteppingMonitor);
            v309 = NSStringFromClass(v308);
            v310 = (char *)(id)objc_claimAutoreleasedReturnValue(v309);
            v399 = 138412290;
            v400 = v310;
            _os_log_impl((void *)&_mh_execute_header, v306, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

          }
          v311 = [VLFSessionTransitSteppingMonitor alloc];
          v312 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
          v306 = -[VLFSessionTransitSteppingMonitor initWithObserver:navigationService:](v311, "initWithObserver:navigationService:", self, v312);

          if (+[VLFSessionTransitSteppingMonitor affectsPuckVisibility](VLFSessionTransitSteppingMonitor, "affectsPuckVisibility"))
          {
            v313 = sub_100248910();
            v314 = objc_claimAutoreleasedReturnValue(v313);
            if (os_log_type_enabled(v314, OS_LOG_TYPE_INFO))
            {
              v315 = (objc_class *)objc_opt_class(VLFSessionTransitSteppingMonitor);
              v316 = NSStringFromClass(v315);
              v317 = (char *)(id)objc_claimAutoreleasedReturnValue(v316);
              v399 = 138412290;
              v400 = v317;
              _os_log_impl((void *)&_mh_execute_header, v314, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

            }
            -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v306);
          }
          if (+[VLFSessionTransitSteppingMonitor affectsBannerVisibility](VLFSessionTransitSteppingMonitor, "affectsBannerVisibility"))
          {
            v318 = sub_100248910();
            v319 = objc_claimAutoreleasedReturnValue(v318);
            if (os_log_type_enabled(v319, OS_LOG_TYPE_INFO))
            {
              v320 = (objc_class *)objc_opt_class(VLFSessionTransitSteppingMonitor);
              v321 = NSStringFromClass(v320);
              v322 = (char *)(id)objc_claimAutoreleasedReturnValue(v321);
              v399 = 138412290;
              v400 = v322;
              _os_log_impl((void *)&_mh_execute_header, v319, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

            }
            -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v306);
          }
        }
        else if (v307)
        {
          v323 = (objc_class *)objc_opt_class(VLFSessionTransitSteppingMonitor);
          v324 = NSStringFromClass(v323);
          v325 = (char *)(id)objc_claimAutoreleasedReturnValue(v324);
          v399 = 138412290;
          v400 = v325;
          _os_log_impl((void *)&_mh_execute_header, v306, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v399, 0xCu);

        }
        v326 = +[VLFSessionUsageMonitor isEnabled](VLFSessionUsageMonitor, "isEnabled");
        v327 = sub_100248910();
        v328 = (VLFSessionUsageMonitor *)objc_claimAutoreleasedReturnValue(v327);
        v329 = os_log_type_enabled(&v328->super.super, OS_LOG_TYPE_INFO);
        if (v326)
        {
          if (v329)
          {
            v330 = (objc_class *)objc_opt_class(VLFSessionUsageMonitor);
            v331 = NSStringFromClass(v330);
            v332 = (char *)(id)objc_claimAutoreleasedReturnValue(v331);
            v399 = 138412290;
            v400 = v332;
            _os_log_impl((void *)&_mh_execute_header, &v328->super.super, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

          }
          v328 = -[VLFSessionUsageMonitor initWithObserver:]([VLFSessionUsageMonitor alloc], "initWithObserver:", self);
          if (+[VLFSessionUsageMonitor affectsPuckVisibility](VLFSessionUsageMonitor, "affectsPuckVisibility"))
          {
            v333 = sub_100248910();
            v334 = objc_claimAutoreleasedReturnValue(v333);
            if (os_log_type_enabled(v334, OS_LOG_TYPE_INFO))
            {
              v335 = (objc_class *)objc_opt_class(VLFSessionUsageMonitor);
              v336 = NSStringFromClass(v335);
              v337 = (char *)(id)objc_claimAutoreleasedReturnValue(v336);
              v399 = 138412290;
              v400 = v337;
              _os_log_impl((void *)&_mh_execute_header, v334, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

            }
            -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v328);
          }
          if (+[VLFSessionUsageMonitor affectsBannerVisibility](VLFSessionUsageMonitor, "affectsBannerVisibility"))
          {
            v338 = sub_100248910();
            v339 = objc_claimAutoreleasedReturnValue(v338);
            if (os_log_type_enabled(v339, OS_LOG_TYPE_INFO))
            {
              v340 = (objc_class *)objc_opt_class(VLFSessionUsageMonitor);
              v341 = NSStringFromClass(v340);
              v342 = (char *)(id)objc_claimAutoreleasedReturnValue(v341);
              v399 = 138412290;
              v400 = v342;
              _os_log_impl((void *)&_mh_execute_header, v339, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

            }
            -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v328);
          }
        }
        else if (v329)
        {
          v343 = (objc_class *)objc_opt_class(VLFSessionUsageMonitor);
          v344 = NSStringFromClass(v343);
          v345 = (char *)(id)objc_claimAutoreleasedReturnValue(v344);
          v399 = 138412290;
          v400 = v345;
          _os_log_impl((void *)&_mh_execute_header, &v328->super.super, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v399, 0xCu);

        }
        if (+[VLFSessionDebugPuckVisibilityMonitor isEnabled](VLFSessionDebugPuckVisibilityMonitor, "isEnabled"))
        {
          v346 = sub_100248910();
          v347 = objc_claimAutoreleasedReturnValue(v346);
          if (os_log_type_enabled(v347, OS_LOG_TYPE_INFO))
          {
            v348 = (objc_class *)objc_opt_class(VLFSessionDebugPuckVisibilityMonitor);
            v349 = NSStringFromClass(v348);
            v350 = (char *)(id)objc_claimAutoreleasedReturnValue(v349);
            v399 = 138412290;
            v400 = v350;
            _os_log_impl((void *)&_mh_execute_header, v347, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

          }
          v351 = -[VLFSessionDebugPuckVisibilityMonitor initWithObserver:]([VLFSessionDebugPuckVisibilityMonitor alloc], "initWithObserver:", self);
          v352 = sub_100248910();
          v353 = objc_claimAutoreleasedReturnValue(v352);
          if (os_log_type_enabled(v353, OS_LOG_TYPE_INFO))
          {
            v354 = (objc_class *)objc_opt_class(VLFSessionDebugPuckVisibilityMonitor);
            v355 = NSStringFromClass(v354);
            v356 = (char *)(id)objc_claimAutoreleasedReturnValue(v355);
            v399 = 138412290;
            v400 = v356;
            _os_log_impl((void *)&_mh_execute_header, v353, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

          }
          -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v351);

        }
        if (+[VLFSessionDebugBannerVisibilityMonitor isEnabled](VLFSessionDebugBannerVisibilityMonitor, "isEnabled"))
        {
          v357 = sub_100248910();
          v358 = objc_claimAutoreleasedReturnValue(v357);
          if (os_log_type_enabled(v358, OS_LOG_TYPE_INFO))
          {
            v359 = (objc_class *)objc_opt_class(VLFSessionDebugBannerVisibilityMonitor);
            v360 = NSStringFromClass(v359);
            v361 = (char *)(id)objc_claimAutoreleasedReturnValue(v360);
            v399 = 138412290;
            v400 = v361;
            _os_log_impl((void *)&_mh_execute_header, v358, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

          }
          v362 = -[VLFSessionDebugBannerVisibilityMonitor initWithObserver:]([VLFSessionDebugBannerVisibilityMonitor alloc], "initWithObserver:", self);
          v363 = sub_100248910();
          v364 = objc_claimAutoreleasedReturnValue(v363);
          if (os_log_type_enabled(v364, OS_LOG_TYPE_INFO))
          {
            v365 = (objc_class *)objc_opt_class(VLFSessionDebugBannerVisibilityMonitor);
            v366 = NSStringFromClass(v365);
            v367 = (char *)(id)objc_claimAutoreleasedReturnValue(v366);
            v399 = 138412290;
            v400 = v367;
            _os_log_impl((void *)&_mh_execute_header, v364, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

          }
          -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v362);

        }
        v368 = +[VLFSessionSunsetSunriseMonitor isEnabled](VLFSessionSunsetSunriseMonitor, "isEnabled");
        v369 = sub_100248910();
        v370 = objc_claimAutoreleasedReturnValue(v369);
        v371 = os_log_type_enabled(v370, OS_LOG_TYPE_INFO);
        if (v368)
        {
          if (v371)
          {
            v372 = (objc_class *)objc_opt_class(VLFSessionSunsetSunriseMonitor);
            v373 = NSStringFromClass(v372);
            v374 = (char *)(id)objc_claimAutoreleasedReturnValue(v373);
            v399 = 138412290;
            v400 = v374;
            _os_log_impl((void *)&_mh_execute_header, v370, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v399, 0xCu);

          }
          v375 = [VLFSessionSunsetSunriseMonitor alloc];
          v376 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
          v377 = (void *)objc_claimAutoreleasedReturnValue(+[SunsetSunriseCalculator sharedCalculator](SunsetSunriseCalculator, "sharedCalculator"));
          v378 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateManager platformController](self, "platformController"));
          v370 = -[VLFSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformController:transportTypeSupportProvider:](v375, "initWithObserver:locationManager:sunsetSunriseCalculator:platformController:transportTypeSupportProvider:", self, v376, v377, v378, objc_opt_class(VLFSessionTask));

          if (+[VLFSessionSunsetSunriseMonitor affectsPuckVisibility](VLFSessionSunsetSunriseMonitor, "affectsPuckVisibility"))
          {
            v379 = sub_100248910();
            v380 = objc_claimAutoreleasedReturnValue(v379);
            if (os_log_type_enabled(v380, OS_LOG_TYPE_INFO))
            {
              v381 = (objc_class *)objc_opt_class(VLFSessionSunsetSunriseMonitor);
              v382 = NSStringFromClass(v381);
              v383 = (char *)(id)objc_claimAutoreleasedReturnValue(v382);
              v399 = 138412290;
              v400 = v383;
              _os_log_impl((void *)&_mh_execute_header, v380, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v399, 0xCu);

            }
            -[NSMutableSet addObject:](self->_lowThresholdMonitors, "addObject:", v370);
          }
          if (+[VLFSessionSunsetSunriseMonitor affectsBannerVisibility](VLFSessionSunsetSunriseMonitor, "affectsBannerVisibility"))
          {
            v384 = sub_100248910();
            v385 = objc_claimAutoreleasedReturnValue(v384);
            if (os_log_type_enabled(v385, OS_LOG_TYPE_INFO))
            {
              v386 = (objc_class *)objc_opt_class(VLFSessionSunsetSunriseMonitor);
              v387 = NSStringFromClass(v386);
              v388 = (char *)(id)objc_claimAutoreleasedReturnValue(v387);
              v399 = 138412290;
              v400 = v388;
              _os_log_impl((void *)&_mh_execute_header, v385, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v399, 0xCu);

            }
            -[NSMutableSet addObject:](self->_highThresholdMonitors, "addObject:", v370);
          }
        }
        else if (v371)
        {
          v389 = (objc_class *)objc_opt_class(VLFSessionSunsetSunriseMonitor);
          v390 = NSStringFromClass(v389);
          v391 = (char *)(id)objc_claimAutoreleasedReturnValue(v390);
          v399 = 138412290;
          v400 = v391;
          _os_log_impl((void *)&_mh_execute_header, v370, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v399, 0xCu);

        }
        self->_didBuildMonitors = 1;
        return;
      }
      v302 = (objc_class *)objc_opt_class(VLFSessionTileAvailabilityMonitor);
      v303 = NSStringFromClass(v302);
      v291 = (VLFSessionTileAvailabilityMonitor *)(id)objc_claimAutoreleasedReturnValue(v303);
      v399 = 138412290;
      v400 = (const char *)v291;
      _os_log_impl((void *)&_mh_execute_header, v283, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v399, 0xCu);

    }
    goto LABEL_193;
  }
  v397 = sub_100248910();
  v398 = objc_claimAutoreleasedReturnValue(v397);
  if (os_log_type_enabled(v398, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v399) = 0;
    _os_log_impl((void *)&_mh_execute_header, v398, OS_LOG_TYPE_ERROR, "Can't build the monitors more than once; ignoring",
      (uint8_t *)&v399,
      2u);
  }

}

- (void)calculateCurrentState
{
  id v3;
  NSObject *v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  NSObject *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  id v19;
  BOOL v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  _BYTE v58[128];

  v3 = sub_100248910();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Re-calculating the current state", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateManager lowThresholdMonitors](self, "lowThresholdMonitors"));
  v6 = objc_msgSend(v5, "count") != 0;

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateManager lowThresholdMonitors](self, "lowThresholdMonitors"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v50;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v12, "state"))
        {
          v13 = sub_100248910();
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            v15 = (objc_class *)objc_opt_class(v12);
            v16 = NSStringFromClass(v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            *(_DWORD *)buf = 138412290;
            v54 = v17;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%@ did not satisfy the low threshold requirement", buf, 0xCu);

          }
          v6 = 0;
          goto LABEL_15;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_15:

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateManager highThresholdMonitors](self, "highThresholdMonitors"));
  v19 = objc_msgSend(v18, "count");
  v20 = v19 != 0;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateManager highThresholdMonitors](self, "highThresholdMonitors", 0));
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v46;
LABEL_17:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v24)
        objc_enumerationMutation(v21);
      v26 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v25);
      if (objc_msgSend(v26, "state") != (id)2)
        break;
      if (v23 == (id)++v25)
      {
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
        if (v23)
          goto LABEL_17;
        goto LABEL_23;
      }
    }
    v27 = sub_100248910();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = (objc_class *)objc_opt_class(v26);
      v30 = NSStringFromClass(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      *(_DWORD *)buf = 138412290;
      v54 = v31;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%@ did not satisfy the high threshold requirement", buf, 0xCu);

    }
    if (!v6)
    {
      v20 = 0;
      goto LABEL_32;
    }
    goto LABEL_29;
  }
LABEL_23:

  if (v6)
  {
    if (!v19)
    {
LABEL_29:
      v32 = sub_100248910();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      v34 = 1;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateManager lowThresholdMonitors](self, "lowThresholdMonitors"));
        v36 = objc_msgSend(v35, "count");
        *(_DWORD *)buf = 134217984;
        v54 = v36;
        v34 = 1;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "All %lu low threshold monitors are satisfied; updating state",
          buf,
          0xCu);

      }
      goto LABEL_40;
    }
    goto LABEL_34;
  }
LABEL_32:
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateManager lowThresholdMonitors](self, "lowThresholdMonitors"));
  v38 = objc_msgSend(v37, "count");

  if (!v38 && v20)
  {
LABEL_34:
    v39 = sub_100248910();
    v33 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateManager lowThresholdMonitors](self, "lowThresholdMonitors"));
      v41 = objc_msgSend(v40, "count");
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateManager highThresholdMonitors](self, "highThresholdMonitors"));
      v43 = objc_msgSend(v42, "count");
      *(_DWORD *)buf = 134218240;
      v54 = v41;
      v55 = 2048;
      v56 = v43;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "All %lu low threshold and %lu high threshold monitors are satisfied; updating state",
        buf,
        0x16u);

    }
    v34 = 2;
    goto LABEL_40;
  }
  v44 = sub_100248910();
  v33 = objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Neither the low nor the high threshold monitors were satisfied; updating state",
      buf,
      2u);
  }
  v34 = 0;
LABEL_40:

  -[VLFSessionStateManager setCurrentState:](self, "setCurrentState:", v34);
}

- (id)allMonitors
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateManager lowThresholdMonitors](self, "lowThresholdMonitors"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateManager highThresholdMonitors](self, "highThresholdMonitors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "setByAddingObjectsFromSet:", v4));

  return v5;
}

- (void)monitor:(id)a3 didChangeState:(int64_t)a4
{
  id v6;
  _BOOL4 didBuildMonitors;
  id v8;
  NSObject *v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  objc_class *v16;
  NSString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;

  v6 = a3;
  didBuildMonitors = self->_didBuildMonitors;
  v8 = sub_100248910();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (didBuildMonitors)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class(v6);
      v12 = NSStringFromClass(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)v13;
      v15 = CFSTR("Hide");
      if (a4 == 1)
        v15 = CFSTR("EnablePuck");
      if (a4 == 2)
        v15 = CFSTR("EnablePuckAndBanner");
      v21 = 138412546;
      v22 = v13;
      v23 = 2112;
      v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ changed its state to %@; re-calculating VLF state",
        (uint8_t *)&v21,
        0x16u);

    }
    -[VLFSessionStateManager calculateCurrentState](self, "calculateCurrentState");
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v16 = (objc_class *)objc_opt_class(v6);
      v17 = NSStringFromClass(v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)v18;
      v20 = CFSTR("Hide");
      if (a4 == 1)
        v20 = CFSTR("EnablePuck");
      if (a4 == 2)
        v20 = CFSTR("EnablePuckAndBanner");
      v21 = 138412546;
      v22 = v18;
      v23 = 2112;
      v24 = v20;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@ changed its state to %@, but we haven't finished building the monitors yet; ignoring",
        (uint8_t *)&v21,
        0x16u);

    }
  }

}

- (int64_t)currentState
{
  return self->_currentState;
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSMutableSet)highThresholdMonitors
{
  return self->_highThresholdMonitors;
}

- (void)setHighThresholdMonitors:(id)a3
{
  objc_storeStrong((id *)&self->_highThresholdMonitors, a3);
}

- (NSMutableSet)lowThresholdMonitors
{
  return self->_lowThresholdMonitors;
}

- (void)setLowThresholdMonitors:(id)a3
{
  objc_storeStrong((id *)&self->_lowThresholdMonitors, a3);
}

- (BOOL)didBuildMonitors
{
  return self->_didBuildMonitors;
}

- (void)setDidBuildMonitors:(BOOL)a3
{
  self->_didBuildMonitors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowThresholdMonitors, 0);
  objc_storeStrong((id *)&self->_highThresholdMonitors, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_platformController);
}

@end
