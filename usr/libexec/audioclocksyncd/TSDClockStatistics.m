@implementation TSDClockStatistics

- (void)logStatistics
{
  uint64_t v3;
  TSDKernelClock *clock;
  uint64_t v5;
  TSDKernelClock *v6;
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  unsigned int v11;
  __CFString *v12;
  unint64_t v13;
  unsigned int v14;
  __CFString *v15;
  id v16;
  id v17;
  unsigned int v18;
  id v19;
  id v20;
  _BOOL4 v21;
  id v22;
  id v23;
  id v24;
  TSDKernelClock *v25;
  unsigned int v26;
  id v27;
  _BOOL4 v28;
  id v29;
  id v30;
  unsigned int v31;
  id v32;
  _BOOL4 v33;
  id v34;
  id v35;
  id v36;
  id v37;
  TSDKernelClock *v38;
  unsigned int v39;
  id v40;
  _BOOL4 v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *i;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  TSDClockStatistics *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  const char *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  unsigned int v82;
  id v83;
  unsigned int v84;
  id v85;
  unsigned int v86;
  id v87;
  unsigned int v88;
  id v89;
  unsigned int v90;
  id v91;
  unsigned int v92;
  id v93;
  id v94;
  id v95;
  unsigned int v96;
  id v97;
  const char *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  void *v103;
  void *v104;
  unsigned int v105;
  id v106;
  unint64_t v107;
  unint64_t v108;
  unsigned int v109;
  unsigned int v110;
  unsigned int v111;
  unsigned int v112;
  id v113;
  _BOOL4 v114;
  BOOL v115;
  const char *v116;
  uint32_t v117;
  unsigned int v118;
  id v119;
  _BOOL4 v120;
  BOOL v121;
  const char *v122;
  unsigned int v123;
  unsigned int v124;
  id v125;
  _BOOL4 v126;
  BOOL v127;
  const char *v128;
  uint32_t v129;
  id v130;
  _BOOL4 v131;
  BOOL v132;
  const char *v133;
  id v134;
  _BOOL4 v135;
  unsigned int v136;
  unsigned int v137;
  const char *v138;
  id v139;
  _BOOL4 v140;
  const char *v141;
  id v142;
  _BOOL4 v143;
  const char *v144;
  id v145;
  _BOOL4 v146;
  const char *v147;
  unsigned int v148;
  unsigned int v149;
  id v150;
  _BOOL4 v151;
  BOOL v152;
  const char *v153;
  uint32_t v154;
  id v155;
  _BOOL4 v156;
  BOOL v157;
  const char *v158;
  unsigned int v159;
  BOOL v160;
  id v161;
  _BOOL4 v162;
  const char *v163;
  id v164;
  _BOOL4 v165;
  BOOL v166;
  const char *v167;
  id v168;
  _BOOL4 v169;
  unsigned int v170;
  const char *v171;
  unsigned int v172;
  id v173;
  _BOOL4 v174;
  BOOL v175;
  const char *v176;
  uint32_t v177;
  id v178;
  _BOOL4 v179;
  BOOL v180;
  const char *v181;
  id v182;
  _BOOL4 v183;
  BOOL v184;
  const char *v185;
  id v186;
  _BOOL4 v187;
  BOOL v188;
  const char *v189;
  id v190;
  id v191;
  uint64_t v192;
  unint64_t v193;
  unsigned int v194;
  unsigned int v195;
  unsigned int v196;
  unsigned int v197;
  unsigned int v198;
  id v199;
  _BOOL4 v200;
  BOOL v201;
  const char *v202;
  uint32_t v203;
  uint64_t v204;
  unsigned int v205;
  unsigned int v206;
  unsigned int v207;
  unsigned int v208;
  unsigned int v209;
  unsigned int v210;
  unsigned int v211;
  BOOL v212;
  id v213;
  _BOOL4 v214;
  const char *v215;
  unsigned int v216;
  unsigned int v217;
  id v218;
  _BOOL4 v219;
  BOOL v220;
  unsigned int v221;
  const char *v222;
  id v223;
  _BOOL4 v224;
  BOOL v225;
  const char *v226;
  id v227;
  _BOOL4 v228;
  BOOL v229;
  const char *v230;
  id v231;
  _BOOL4 v232;
  BOOL v233;
  unsigned int v234;
  const char *v235;
  unsigned int v236;
  unint64_t v237;
  unsigned int v238;
  unsigned int v239;
  id v240;
  _BOOL4 v241;
  BOOL v242;
  unsigned int v243;
  const char *v244;
  uint32_t v245;
  id v246;
  _BOOL4 v247;
  BOOL v248;
  const char *v249;
  uint32_t v250;
  id v251;
  _BOOL4 v252;
  BOOL v253;
  unsigned int v254;
  const char *v255;
  id v256;
  _BOOL4 v257;
  BOOL v258;
  const char *v259;
  uint32_t v260;
  unsigned int v261;
  id v262;
  _BOOL4 v263;
  BOOL v264;
  unsigned int v265;
  const char *v266;
  id v267;
  _BOOL4 v268;
  BOOL v269;
  unsigned int v270;
  const char *v271;
  id v272;
  _BOOL4 v273;
  BOOL v274;
  const char *v275;
  id v276;
  _BOOL4 v277;
  BOOL v278;
  const char *v279;
  BOOL v280;
  id v281;
  _BOOL4 v282;
  const char *v283;
  id v284;
  _BOOL4 v285;
  unsigned int v286;
  const char *v287;
  id v288;
  _BOOL4 v289;
  id v290;
  id v291;
  TSDKernelClock *v292;
  id v293;
  id v294;
  TSDClockStatistics *v295;
  unsigned int v296;
  unsigned int v297;
  unsigned int v298;
  unsigned int v299;
  unsigned int v300;
  unsigned int v301;
  uint64_t v302;
  id v303;
  unsigned int v304;
  unsigned int v305;
  unsigned int v306;
  unsigned int v307;
  unsigned int v308;
  unsigned int v309;
  unsigned int v310;
  unsigned int v311;
  unsigned int v312;
  unsigned int v313;
  unsigned int v314;
  unsigned int v315;
  unsigned int v316;
  unsigned int v317;
  unsigned int v318;
  unsigned int v319;
  unsigned int v320;
  unsigned int v321;
  unsigned int v322;
  unsigned int v323;
  unsigned int v324;
  unsigned int v325;
  unsigned int v326;
  unsigned int v327;
  unsigned int v328;
  unsigned int v329;
  unsigned int v330;
  unsigned int v331;
  unsigned int v332;
  unsigned int v333;
  unsigned int v334;
  unsigned int v335;
  unsigned int v336;
  unsigned int v337;
  unsigned int v338;
  unsigned int v339;
  unsigned int v340;
  unsigned int v341;
  id v342;
  id obj;
  unint64_t v344;
  unsigned int v345;
  unsigned int v346;
  unsigned int v347;
  unsigned int v348;
  void *v349;
  unsigned int v350;
  unint64_t v351;
  unsigned int v352;
  unsigned int v353;
  unsigned int v354;
  unsigned int v355;
  uint64_t v356;
  void *v357;
  unsigned int v358;
  unsigned int v359;
  unsigned int v360;
  unint64_t v361;
  unsigned int v362;
  unsigned int v363;
  unsigned int v364;
  unsigned int v365;
  unsigned int v366;
  unsigned int v367;
  unsigned int v368;
  unsigned int v369;
  unint64_t v370;
  unsigned int v371;
  unsigned int v372;
  id v373;
  id v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  id v383;
  id v384;
  unsigned __int16 v385;
  uint64_t v386;
  unint64_t v387;
  uint64_t v388;
  uint64_t v389;
  unint64_t v390;
  unint64_t v391;
  _BYTE v392[128];
  _BYTE v393[128];
  _BYTE buf[14];
  unint64_t v395;
  __int16 v396;
  double v397;

  v3 = mach_absolute_time();
  clock = self->_clock;
  v5 = objc_opt_class(TSDgPTPClock);
  if ((objc_opt_isKindOfClass(clock, v5) & 1) != 0)
  {
    v6 = self->_clock;
    v7 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[TSDKernelClock clockIdentifier](self->_clock, "clockIdentifier");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PTP Clock Statistics for 0x%016llx\n", buf, 0xCu);
    }

    v9 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[TSDKernelClock grandmasterIdentity](v6, "grandmasterIdentity");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Grandmaster Identity: 0x%016llx\n", buf, 0xCu);
    }

    v11 = -[TSDKernelClock lockState](v6, "lockState");
    if (v11 > 2)
      v12 = CFSTR("Unknown");
    else
      v12 = off_10003C858[v11];
    v16 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v17 = -[__CFString UTF8String](v12, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Clock lock state: %s\n", buf, 0xCu);
    }

    v391 = 0;
    v390 = 0;
    v389 = 0;
    v388 = 0;
    v387 = 0;
    v386 = 0;
    v385 = 0;
    v384 = 0;
    v18 = -[TSDKernelClock getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:](v6, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:", &v391, &v390, &v389, &v387, &v386, &v385, &v384);
    v19 = v384;
    v20 = &_os_log_default;
    v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v21)
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v391;
        *(_WORD *)&buf[12] = 2048;
        v395 = v390;
        v396 = 2048;
        v397 = (double)v391 / (double)v390;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Mach Rate Ratio: %llu/%llu (%0.12f)\n", buf, 0x20u);
      }

      v22 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v389;
        *(_WORD *)&buf[12] = 2048;
        v395 = v387;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Mach Anchors: %llu, %llu\n", buf, 0x16u);
      }

      v23 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v386;
        *(_WORD *)&buf[12] = 1024;
        LODWORD(v395) = v385;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Mach Sync Identity: 0x%016llx.%hu\n", buf, 0x12u);
      }
    }
    else if (v21)
    {
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedDescription")));
      v30 = objc_msgSend(v29, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v30;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Mach Sync Info: failed to get rate ratio and anchors with error \"%s\"\n", buf, 0xCu);

    }
    v383 = v19;
    v31 = -[TSDKernelClock getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:](v6, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:", &v391, &v390, &v388, &v387, &v386, &v385, &v383);
    v293 = v383;

    v32 = &_os_log_default;
    v33 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    v295 = self;
    if (v31)
    {
      if (v33)
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v391;
        *(_WORD *)&buf[12] = 2048;
        v395 = v390;
        v396 = 2048;
        v397 = (double)v391 / (double)v390;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    TimeSync Rate Ratio: %llu/%llu (%0.12f)\n", buf, 0x20u);
      }

      v34 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v388;
        *(_WORD *)&buf[12] = 2048;
        v395 = v387;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    TimeSync Anchors: %llu, %llu\n", buf, 0x16u);
      }

      v35 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v386;
        *(_WORD *)&buf[12] = 1024;
        LODWORD(v395) = v385;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    TimeSync Sync Identity: 0x%016llx.%hu\n", buf, 0x12u);
      }
    }
    else if (v33)
    {
      v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v293, "localizedDescription")));
      v43 = objc_msgSend(v42, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v43;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    TimeSync Sync Info: failed to get rate ratio and anchors with error \"%s\"\n", buf, 0xCu);

    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock ports](v6, "ports"));
    obj = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v357 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v379 = 0u;
    v380 = 0u;
    v381 = 0u;
    v382 = 0u;
    v45 = v44;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v379, v393, 16);
    v342 = v45;
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v380;
      do
      {
        for (i = 0; i != v47; i = (char *)i + 1)
        {
          if (*(_QWORD *)v380 != v48)
            objc_enumerationMutation(v45);
          v50 = *(void **)(*((_QWORD *)&v379 + 1) + 8 * (_QWORD)i);
          v51 = objc_opt_class(TSDgPTPFDPtPPort);
          if ((objc_opt_isKindOfClass(v50, v51) & 1) == 0)
          {
            v52 = objc_opt_class(TSDgPTPFDEtEPort);
            if ((objc_opt_isKindOfClass(v50, v52) & 1) == 0)
              continue;
          }
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "statistics"));
          if (v53)
          {
            v54 = v53;
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "portIdentifier"));
            objc_msgSend(obj, "setObject:forKeyedSubscript:", v54, v55);

            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "portIdentifier"));
            objc_msgSend(v357, "setObject:forKeyedSubscript:", v50, v56);

            v45 = v342;
          }
        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v379, v393, 16);
      }
      while (v47);
    }

    v57 = v295;
    if (!v295->_firstStatistics)
    {
      v292 = v6;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[TSDClockManager sharedClockManager](TSDClockManager, "sharedClockManager"));
      v344 = (unint64_t)objc_msgSend(v58, "machAbsoluteTicksToNanoseconds:", v3 - v295->_lastStatisticsTime);

      v377 = 0u;
      v378 = 0u;
      v375 = 0u;
      v376 = 0u;
      v59 = obj;
      v303 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v375, v392, 16);
      if (!v303)
        goto LABEL_479;
      v302 = *(_QWORD *)v376;
      v294 = v59;
      while (1)
      {
        v60 = 0;
        do
        {
          if (*(_QWORD *)v376 != v302)
            objc_enumerationMutation(v59);
          v356 = v60;
          v61 = *(_QWORD *)(*((_QWORD *)&v375 + 1) + 8 * v60);
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v357, "objectForKeyedSubscript:", v61));
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", v61));
          v64 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Port:\n", buf, 2u);
          }

          switch(objc_msgSend(v63, "portType"))
          {
            case 0u:
              v65 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_87;
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Unknown\n";
              break;
            case 1u:
              v67 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_87;
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Ethernet\n";
              break;
            case 2u:
              v68 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_87;
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Unicast Link Layer PtP\n";
              break;
            case 3u:
              v69 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_87;
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Unicast UDPv4 PtP\n";
              break;
            case 4u:
              v70 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_87;
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Unicast UDPv6 PtP\n";
              break;
            case 5u:
              v71 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_87;
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Unicast Link Layer EtE\n";
              break;
            case 6u:
              v72 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_87;
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Unicast UDPv4 EtE\n";
              break;
            case 7u:
              v73 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_87;
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Unicast UDPv6 EtE\n";
              break;
            case 8u:
              v74 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_87;
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Local Clock\n";
              break;
            default:
              goto LABEL_88;
          }
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v66, buf, 2u);
LABEL_87:

LABEL_88:
          v75 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v76 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "interfaceName")));
            v77 = objc_msgSend(v76, "UTF8String");
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = v77;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Interface: %s\n", buf, 0xCu);

          }
          v78 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v79 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "destinationAddressString")));
            v80 = objc_msgSend(v79, "UTF8String");
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = v80;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Destination Address: %s\n", buf, 0xCu);

          }
          v81 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v82 = objc_msgSend(v62, "propagationDelay");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v82;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Propgation Delay: %u\n", buf, 8u);
          }

          v83 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v84 = objc_msgSend(v62, "minimumPropagationDelay");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v84;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Minimum Propagation Delay: %u\n", buf, 8u);
          }

          v85 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v86 = objc_msgSend(v62, "maximumPropagationDelay");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v86;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Maximum Propagation Delay: %u\n", buf, 8u);
          }

          v87 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v88 = objc_msgSend(v62, "minimumRawDelay");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v88;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Minimum Raw Delay: %u\n", buf, 8u);
          }

          v89 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v90 = objc_msgSend(v62, "maximumRawDelay");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v90;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Maximum Raw Delay: %u\n", buf, 8u);
          }

          v91 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v92 = objc_msgSend(v62, "portNumber");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v92;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Local Clock Port Number: %hu\n", buf, 8u);
          }

          v93 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v94 = objc_msgSend(v62, "remoteClockIdentity");
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v94;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Remote Clock Identity: 0x%016llx\n", buf, 0xCu);
          }

          v95 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v96 = objc_msgSend(v62, "remotePortNumber");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v96;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Remote Clock Port Number: %hu\n", buf, 8u);
          }

          switch(objc_msgSend(v62, "portRole"))
          {
            case 0u:
              v97 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_120;
              *(_WORD *)buf = 0;
              v98 = "        Port Role: Unknown\n";
              break;
            case 1u:
              v101 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_120;
              *(_WORD *)buf = 0;
              v98 = "        Port Role: Disabled\n";
              break;
            case 2u:
              v99 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_120;
              *(_WORD *)buf = 0;
              v98 = "        Port Role: Passive\n";
              break;
            case 3u:
              v102 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_120;
              *(_WORD *)buf = 0;
              v98 = "        Port Role: Slave\n";
              break;
            case 4u:
              v100 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_120;
              *(_WORD *)buf = 0;
              v98 = "        Port Role: Master\n";
              break;
            default:
              goto LABEL_121;
          }
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v98, buf, 2u);
LABEL_120:

LABEL_121:
          v103 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v57->_lastStatistics, "objectForKeyedSubscript:", v61));

          if (v103)
          {
            v104 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v57->_lastStatistics, "objectForKeyedSubscript:", v61));
            v105 = objc_msgSend(v104, "portRole");
            if (v105 != objc_msgSend(v63, "portRole"))
            {
              v106 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Port Role changed since last statistics log. Ignore expected counts.\n", buf, 2u);
              }

            }
            if (objc_msgSend(v63, "portRole") == 3 || objc_msgSend(v63, "portRole") == 2)
            {
              v107 = v344 / sub_100019390((int)objc_msgSend(v62, "remoteSyncLogMeanInterval"));
              v108 = v344 / sub_100019390((int)objc_msgSend(v62, "remoteAnnounceLogMeanInterval"));
            }
            else
            {
              LODWORD(v108) = 0;
              LODWORD(v107) = 0;
            }
            v349 = v62;
            if (objc_msgSend(v63, "portRole") == 4)
            {
              v361 = v344 / sub_100019390((int)objc_msgSend(v62, "localSyncLogMeanInterval"));
              v370 = v344 / sub_100019390((int)objc_msgSend(v62, "localAnnounceLogMeanInterval"));
            }
            else
            {
              LODWORD(v370) = 0;
              LODWORD(v361) = 0;
            }
            v347 = objc_msgSend(v63, "receivedSyncCounter");
            v345 = objc_msgSend(v104, "receivedSyncCounter");
            v109 = v347 - v345;
            v110 = objc_msgSend(v63, "receivedFollowUpCounter");
            v111 = objc_msgSend(v104, "receivedFollowUpCounter");
            v306 = objc_msgSend(v63, "receivedAnnounceCounter");
            v350 = objc_msgSend(v104, "receivedAnnounceCounter");
            v305 = objc_msgSend(v63, "receivedSignalCounter");
            v304 = objc_msgSend(v104, "receivedSignalCounter");
            v308 = objc_msgSend(v63, "receivedPacketDiscardCounter");
            v307 = objc_msgSend(v104, "receivedPacketDiscardCounter");
            v310 = objc_msgSend(v63, "syncReceiptTimeoutCounter");
            v309 = objc_msgSend(v104, "syncReceiptTimeoutCounter");
            v312 = objc_msgSend(v63, "announceReceiptTimeoutCounter");
            v311 = objc_msgSend(v104, "announceReceiptTimeoutCounter");
            v314 = objc_msgSend(v63, "allowedLostResponsesExceededCounter");
            v313 = objc_msgSend(v104, "allowedLostResponsesExceededCounter");
            v353 = objc_msgSend(v63, "transmittedSyncCounter");
            v358 = objc_msgSend(v104, "transmittedSyncCounter");
            v316 = objc_msgSend(v63, "transmittedFollowUpCounter");
            v315 = objc_msgSend(v104, "transmittedFollowUpCounter");
            v367 = objc_msgSend(v63, "transmittedAnnounceCounter");
            v364 = objc_msgSend(v104, "transmittedAnnounceCounter");
            v318 = objc_msgSend(v63, "transmittedSignalCounter");
            v317 = objc_msgSend(v104, "transmittedSignalCounter");
            v320 = objc_msgSend(v63, "transmittedPacketDiscardCounter");
            v319 = objc_msgSend(v104, "transmittedPacketDiscardCounter");
            v322 = objc_msgSend(v63, "attemptedSyncCounter");
            v321 = objc_msgSend(v104, "attemptedSyncCounter");
            v327 = objc_msgSend(v63, "attemptedFollowUpCounter");
            v324 = objc_msgSend(v104, "attemptedFollowUpCounter");
            v333 = objc_msgSend(v63, "attemptedAnnounceCounter");
            v330 = objc_msgSend(v104, "attemptedAnnounceCounter");
            v339 = objc_msgSend(v63, "attemptedSignalCounter");
            v336 = objc_msgSend(v104, "attemptedSignalCounter");
            v299 = objc_msgSend(v63, "rawDelayExceededCounter");
            v298 = objc_msgSend(v104, "rawDelayExceededCounter");
            v301 = objc_msgSend(v63, "rawDelayMeasurementCounter");
            v300 = objc_msgSend(v104, "rawDelayMeasurementCounter");
            v112 = ((int)v107 + 9) / 0xAu;
            v113 = &_os_log_default;
            v114 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v115 = v347 - v345 < v107 - v112 && v107 >= v112;
            if (v115 || v109 > v112 + v107)
            {
              if (v114)
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&buf[4] = v347 - v345;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v107;
                LOWORD(v395) = 1024;
                *(_DWORD *)((char *)&v395 + 2) = ((int)v107 + 9) / 0xAu;
                v116 = "        Received Sync Counter: %u out of expected bounds (%u ± %u)\n";
                v117 = 20;
LABEL_142:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v116, buf, v117);
              }
            }
            else if (v114)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v347 - v345;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v107;
              v116 = "        Received Sync Counter: %u expected %u\n";
              v117 = 14;
              goto LABEL_142;
            }
            v118 = v110 - v111;

            v119 = &_os_log_default;
            v120 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v121 = v118 >= v109 - 1 || v347 == v345;
            v296 = v347 - v345 + 1;
            v297 = v109 - 1;
            if (v121 && v118 <= v109 + 1)
            {
              if (v120)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v118;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v347 - v345;
                v122 = "        Received FollowUp Counter: %u expected %u\n";
                goto LABEL_153;
              }
            }
            else if (v120)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v118;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v347 - v345;
              v122 = "        Received FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_153:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v122, buf, 0xEu);
            }
            v123 = v306 - v350;

            v124 = ((int)v108 + 9) / 0xAu;
            v125 = &_os_log_default;
            v126 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v127 = v306 - v350 < v108 - v124 && v108 >= v124;
            if (v127 || v123 > v124 + v108)
            {
              if (v126)
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&buf[4] = v306 - v350;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v108;
                LOWORD(v395) = 1024;
                *(_DWORD *)((char *)&v395 + 2) = ((int)v108 + 9) / 0xAu;
                v128 = "        Received Announce Counter: %u out of expected bounds (%u ± %u)\n";
                v129 = 20;
LABEL_163:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v128, buf, v129);
              }
            }
            else if (v126)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v306 - v350;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v108;
              v128 = "        Received Announce Counter: %u expected %u\n";
              v129 = 14;
              goto LABEL_163;
            }

            v130 = &_os_log_default;
            v131 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v132 = v305 - v304 >= v123 - 1 || v306 == v350;
            if (v132 && v305 - v304 <= v123 + 1)
            {
              if (v131)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v305 - v304;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v306 - v350;
                v133 = "        Received Signal Counter: %u expected %u\n";
                goto LABEL_174;
              }
            }
            else if (v131)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v305 - v304;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v306 - v350;
              v133 = "        Received Signal Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_174:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v133, buf, 0xEu);
            }

            v134 = &_os_log_default;
            v135 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v308 == v307)
            {
              v136 = v353;
              v137 = v314;
              if (v135)
              {
                *(_QWORD *)buf = 67109120;
                v138 = "        Received Packet Discard Counter: %u\n";
                goto LABEL_180;
              }
            }
            else
            {
              v136 = v353;
              v137 = v314;
              if (v135)
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = v308 - v307;
                v138 = "        Received Packet Discard Counter: %u greater than 0\n";
LABEL_180:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v138, buf, 8u);
              }
            }

            v139 = &_os_log_default;
            v140 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v310 == v309)
            {
              if (v140)
              {
                *(_QWORD *)buf = 67109120;
                v141 = "        Received Sync Receipt Timeout Counter: %u\n";
                goto LABEL_186;
              }
            }
            else if (v140)
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v310 - v309;
              v141 = "        Received Sync Receipt Timeout Counter: %u greater than 0\n";
LABEL_186:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v141, buf, 8u);
            }

            v142 = &_os_log_default;
            v143 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v312 == v311)
            {
              if (v143)
              {
                *(_QWORD *)buf = 67109120;
                v144 = "        Received Announce Receipt Timeout Counter: %u\n";
                goto LABEL_192;
              }
            }
            else if (v143)
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v312 - v311;
              v144 = "        Received Announce Receipt Timeout Counter: %u greater than 0\n";
LABEL_192:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v144, buf, 8u);
            }

            v145 = &_os_log_default;
            v146 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v137 == v313)
            {
              if (v146)
              {
                *(_QWORD *)buf = 67109120;
                v147 = "        Received Allowed Lost Responses Exceeded Counter: %u\n";
                goto LABEL_198;
              }
            }
            else if (v146)
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v137 - v313;
              v147 = "        Received Allowed Lost Responses Exceeded Counter: %u greater than 0\n";
LABEL_198:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v147, buf, 8u);
            }
            v148 = v136 - v358;

            v149 = ((int)v361 + 9) / 0xAu;
            v150 = &_os_log_default;
            v151 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v152 = v136 - v358 < v361 - v149 && v361 >= v149;
            if (v152 || v148 > v149 + v361)
            {
              if (v151)
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&buf[4] = v136 - v358;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v361;
                LOWORD(v395) = 1024;
                *(_DWORD *)((char *)&v395 + 2) = ((int)v361 + 9) / 0xAu;
                v153 = "        Transmitted Sync Counter: %u out of expected bounds (%u ± %u)\n";
                v154 = 20;
LABEL_208:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v153, buf, v154);
              }
            }
            else if (v151)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v136 - v358;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v361;
              v153 = "        Transmitted Sync Counter: %u expected %u\n";
              v154 = 14;
              goto LABEL_208;
            }

            v155 = &_os_log_default;
            v156 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v157 = v316 - v315 >= v148 - 1 || v136 == v358;
            if (v157 && v316 - v315 <= v148 + 1)
            {
              if (v156)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v316 - v315;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v136 - v358;
                v158 = "        Transmitted FollowUp Counter: %u expected %u\n";
                goto LABEL_219;
              }
            }
            else if (v156)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v316 - v315;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v136 - v358;
              v158 = "        Transmitted FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_219:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v158, buf, 0xEu);
            }
            v159 = v367 - v364;

            v160 = v367 - v364 < (int)v370 - 1 && (_DWORD)v370 != 0;
            v161 = &_os_log_default;
            v162 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v160 || v159 > (int)v370 + 1)
            {
              if (v162)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v367 - v364;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v370;
                v163 = "        Transmitted Announce Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_229:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v163, buf, 0xEu);
              }
            }
            else if (v162)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v367 - v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v370;
              v163 = "        Transmitted Announce Counter: %u expected %u\n";
              goto LABEL_229;
            }

            v164 = &_os_log_default;
            v165 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v166 = v318 - v317 >= v159 - 1 || v367 == v364;
            if (v166 && v318 - v317 <= v159 + 1)
            {
              if (v165)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v318 - v317;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v367 - v364;
                v167 = "        Transmitted Signal Counter: %u expected %u\n";
                goto LABEL_240;
              }
            }
            else if (v165)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v318 - v317;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v367 - v364;
              v167 = "        Transmitted Signal Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_240:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v167, buf, 0xEu);
            }

            v168 = &_os_log_default;
            v169 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v320 == v319)
            {
              v170 = v322;
              if (v169)
              {
                *(_QWORD *)buf = 67109120;
                v171 = "        Transmitted Packet Discard Counter: %u\n";
                goto LABEL_246;
              }
            }
            else
            {
              v170 = v322;
              if (v169)
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = v320 - v319;
                v171 = "        Transmitted Packet Discard Counter: %u greater than 0\n";
LABEL_246:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v171, buf, 8u);
              }
            }
            v172 = v170 - v321;

            v173 = &_os_log_default;
            v174 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v175 = v172 < v361 - v149 && v361 >= v149;
            if (v175 || v172 > v149 + v361)
            {
              if (v174)
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&buf[4] = v172;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v361;
                LOWORD(v395) = 1024;
                *(_DWORD *)((char *)&v395 + 2) = ((int)v361 + 9) / 0xAu;
                v176 = "        Attempted Sync Counter: %u out of expected bounds (%u ± %u)\n";
                v177 = 20;
LABEL_256:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v176, buf, v177);
              }
            }
            else if (v174)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v172;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v361;
              v176 = "        Attempted Sync Counter: %u expected %u\n";
              v177 = 14;
              goto LABEL_256;
            }

            v178 = &_os_log_default;
            v179 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v180 = v327 - v324 >= v148 - 1 || v353 == v358;
            if (v180 && v327 - v324 <= v148 + 1)
            {
              if (v179)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v327 - v324;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v148;
                v181 = "        Attempted FollowUp Counter: %u expected %u\n";
                goto LABEL_267;
              }
            }
            else if (v179)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v327 - v324;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v148;
              v181 = "        Attempted FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_267:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v181, buf, 0xEu);
            }

            v182 = &_os_log_default;
            v183 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v184 = v333 - v330 >= (int)v370 - 1 || (_DWORD)v370 == 0;
            if (v184 && v333 - v330 <= (int)v370 + 1)
            {
              if (v183)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v333 - v330;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v370;
                v185 = "        Attempted Announce Counter: %u expected %u\n";
                goto LABEL_278;
              }
            }
            else if (v183)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v333 - v330;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v370;
              v185 = "        Attempted Announce Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_278:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v185, buf, 0xEu);
            }

            v186 = &_os_log_default;
            v187 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v188 = v339 - v336 >= v159 - 1 || v367 == v364;
            if (v188 && v339 - v336 <= v159 + 1)
            {
              if (v187)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v339 - v336;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v367 - v364;
                v189 = "        Attempted Signal Counter: %u expected %u\n";
                goto LABEL_289;
              }
            }
            else if (v187)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v339 - v336;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v367 - v364;
              v189 = "        Attempted Signal Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_289:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v189, buf, 0xEu);
            }

            v190 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v299 - v298;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Raw Delay Exceeded Counter: %u\n", buf, 8u);
            }

            v191 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v301 - v300;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Raw Delay Measurements Counter: %u\n", buf, 8u);
            }

            v192 = objc_opt_class(TSDgPTPFDPtPPort);
            if ((objc_opt_isKindOfClass(v62, v192) & 1) != 0)
            {
              v351 = sub_100019390((int)objc_msgSend(v62, "localPDelayLogMeanInterval"));
              v193 = v344 / sub_100019390((int)objc_msgSend(v62, "remotePDelayLogMeanInterval"));
              v194 = objc_msgSend(v63, "receivedPDelayRequestCounter");
              v195 = objc_msgSend(v104, "receivedPDelayRequestCounter");
              v196 = v194 - v195;
              v323 = objc_msgSend(v63, "transmittedPDelayResponseCounter");
              v197 = objc_msgSend(v104, "transmittedPDelayResponseCounter");
              v328 = objc_msgSend(v63, "transmittedPDelayResponseFollowUpCounter");
              v325 = objc_msgSend(v104, "transmittedPDelayResponseFollowUpCounter");
              v334 = objc_msgSend(v63, "attemptedPDelayResponseCounter");
              v331 = objc_msgSend(v104, "attemptedPDelayResponseCounter");
              v340 = objc_msgSend(v63, "attemptedPDelayResponseFollowUpCounter");
              v337 = objc_msgSend(v104, "attemptedPDelayResponseFollowUpCounter");
              v368 = objc_msgSend(v63, "transmittedPDelayRequestCounter");
              v371 = objc_msgSend(v104, "transmittedPDelayRequestCounter");
              v348 = objc_msgSend(v63, "attemptedPDelayRequestCounter");
              v346 = objc_msgSend(v104, "attemptedPDelayRequestCounter");
              v359 = objc_msgSend(v63, "receivedPDelayResponseCounter");
              v354 = objc_msgSend(v104, "receivedPDelayResponseCounter");
              v365 = objc_msgSend(v63, "receivedPDelayResponseFollowUpCounter");
              v362 = objc_msgSend(v104, "receivedPDelayResponseFollowUpCounter");
              v198 = ((int)v193 + 9) / 0xAu;
              v199 = &_os_log_default;
              v200 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              v201 = v194 - v195 < v193 - v198 && v193 >= v198;
              if (v201 || v196 > v198 + v193)
              {
                if (v200)
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)&buf[4] = v194 - v195;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v193;
                  LOWORD(v395) = 1024;
                  *(_DWORD *)((char *)&v395 + 2) = ((int)v193 + 9) / 0xAu;
                  v202 = "        Received PDelay Request Counter: %u out of expected bounds (%u ± %u)\n";
                  v203 = 20;
LABEL_318:
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v202, buf, v203);
                }
              }
              else if (v200)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v194 - v195;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v193;
                v202 = "        Received PDelay Request Counter: %u expected %u\n";
                v203 = 14;
                goto LABEL_318;
              }
              v216 = v323 - v197;

              v217 = v196 - 1;
              v218 = &_os_log_default;
              v219 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              v220 = v323 - v197 >= v196 - 1 || v194 == v195;
              v221 = v196 + 1;
              if (v220 && v216 <= v221)
              {
                if (v219)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v216;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v194 - v195;
                  v222 = "        Transmitted PDelay Response Counter: %u expected %u\n";
                  goto LABEL_329;
                }
              }
              else if (v219)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v216;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v194 - v195;
                v222 = "        Transmitted PDelay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_329:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v222, buf, 0xEu);
              }

              v223 = &_os_log_default;
              v224 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              v225 = v328 - v325 >= v217 || v194 == v195;
              if (v225 && v328 - v325 <= v221)
              {
                if (v224)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v328 - v325;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v194 - v195;
                  v226 = "        Transmitted PDelay Response FollowUp Counter: %u expected %u\n";
                  goto LABEL_340;
                }
              }
              else if (v224)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v328 - v325;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v194 - v195;
                v226 = "        Transmitted PDelay Response FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_340:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v226, buf, 0xEu);
              }

              v227 = &_os_log_default;
              v228 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              v229 = v334 - v331 >= v217 || v194 == v195;
              if (v229 && v334 - v331 <= v221)
              {
                if (v228)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v334 - v331;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v194 - v195;
                  v230 = "        Attempted PDelay Response Counter: %u expected %u\n";
                  goto LABEL_351;
                }
              }
              else if (v228)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v334 - v331;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v194 - v195;
                v230 = "        Attempted PDelay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_351:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v230, buf, 0xEu);
              }

              v231 = &_os_log_default;
              v232 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              v233 = v340 - v337 >= v217 || v194 == v195;
              if (v233 && v340 - v337 <= v221)
              {
                v234 = v368;
                if (v232)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v340 - v337;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v196;
                  v235 = "        Attempted PDelay Response FollowUp Counter: %u expected %u\n";
                  goto LABEL_362;
                }
              }
              else
              {
                v234 = v368;
                if (v232)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v340 - v337;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v196;
                  v235 = "        Attempted PDelay Response FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_362:
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v235, buf, 0xEu);
                }
              }
              v236 = v234 - v371;
              v237 = v344 / v351;

              v238 = ((v344 / v351) + 9) / 0xA;
              v239 = v344 / v351 - v238;
              v240 = &_os_log_default;
              v241 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              v242 = v234 - v371 < v239 && v237 >= v238;
              v243 = v238 + v237;
              if (v242 || v236 > v243)
              {
                if (v241)
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)&buf[4] = v234 - v371;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v344 / v351;
                  LOWORD(v395) = 1024;
                  *(_DWORD *)((char *)&v395 + 2) = (*(_DWORD *)&buf[10] + 9) / 0xAu;
                  v244 = "        Transmitted PDelay Request Counter: %u out of expected bounds (%u ± %u)\n";
                  v245 = 20;
LABEL_372:
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v244, buf, v245);
                }
              }
              else if (v241)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v234 - v371;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v344 / v351;
                v244 = "        Transmitted PDelay Request Counter: %u expected %u\n";
                v245 = 14;
                goto LABEL_372;
              }

              v246 = &_os_log_default;
              v247 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              v248 = v348 - v346 < v239 && v237 >= v238;
              if (v248 || v348 - v346 > v243)
              {
                if (v247)
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)&buf[4] = v348 - v346;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v344 / v351;
                  LOWORD(v395) = 1024;
                  *(_DWORD *)((char *)&v395 + 2) = (*(_DWORD *)&buf[10] + 9) / 0xAu;
                  v249 = "        Attempted PDelay Request Counter: %u out of expected bounds (%u ± %u)\n";
                  v250 = 20;
LABEL_382:
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v249, buf, v250);
                }
              }
              else if (v247)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v348 - v346;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v344 / v351;
                v249 = "        Attempted PDelay Request Counter: %u expected %u\n";
                v250 = 14;
                goto LABEL_382;
              }

              v251 = &_os_log_default;
              v252 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              v253 = v359 - v354 >= v236 - 1 || v234 == v371;
              v254 = v236 + 1;
              if (v253 && v359 - v354 <= v254)
              {
                v62 = v349;
                if (v252)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v359 - v354;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v234 - v371;
                  v255 = "        Received PDelay Response Counter: %u expected %u\n";
                  goto LABEL_393;
                }
              }
              else
              {
                v62 = v349;
                if (v252)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v359 - v354;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v234 - v371;
                  v255 = "        Received PDelay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_393:
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v255, buf, 0xEu);
                }
              }

              v256 = &_os_log_default;
              v257 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              v258 = v365 - v362 >= v236 - 1 || v234 == v371;
              if (v258 && v365 - v362 <= v254)
              {
                if (v257)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v365 - v362;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v234 - v371;
                  v259 = "        Received PDelay Response FollowUp Counter: %u expected %u\n";
                  goto LABEL_404;
                }
LABEL_475:

LABEL_476:
                v59 = v294;
                v57 = v295;
                goto LABEL_477;
              }
              if (!v257)
                goto LABEL_475;
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v365 - v362;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v234 - v371;
              v259 = "        Received PDelay Response FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_404:
              v260 = 14;
LABEL_474:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v259, buf, v260);
              goto LABEL_475;
            }
            v204 = objc_opt_class(TSDgPTPFDEtEPort);
            if ((objc_opt_isKindOfClass(v62, v204) & 1) == 0)
              goto LABEL_476;
            if (objc_msgSend(v63, "portRole") == 4)
              v205 = v148;
            else
              v205 = 0;
            if (objc_msgSend(v63, "portRole") == 3)
              v206 = v347 - v345;
            else
              v206 = 0;
            v366 = v206;
            v207 = objc_msgSend(v63, "receivedDelayRequestCounter");
            v208 = objc_msgSend(v104, "receivedDelayRequestCounter");
            v209 = v207 - v208;
            v210 = objc_msgSend(v63, "transmittedDelayResponseCounter");
            v211 = objc_msgSend(v104, "transmittedDelayResponseCounter");
            v329 = objc_msgSend(v63, "attemptedDelayResponseCounter");
            v326 = objc_msgSend(v104, "attemptedDelayResponseCounter");
            v335 = objc_msgSend(v63, "transmittedDelayRequestCounter");
            v332 = objc_msgSend(v104, "transmittedDelayRequestCounter");
            v341 = objc_msgSend(v63, "attemptedDelayRequestCounter");
            v338 = objc_msgSend(v104, "attemptedDelayRequestCounter");
            v355 = objc_msgSend(v63, "receivedDelayResponseCounter");
            v352 = objc_msgSend(v104, "receivedDelayResponseCounter");
            v363 = objc_msgSend(v63, "supersededSyncCounter");
            v360 = objc_msgSend(v104, "supersededSyncCounter");
            v372 = objc_msgSend(v63, "supersededDelayCounter");
            v369 = objc_msgSend(v104, "supersededDelayCounter");
            v212 = v207 - v208 < v205 - 1 && v205 != 0;
            v213 = &_os_log_default;
            v214 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v212 || v209 > v205 + 1)
            {
              if (v214)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v207 - v208;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v205;
                v215 = "        Received Delay Request Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_407:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v215, buf, 0xEu);
              }
            }
            else if (v214)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v207 - v208;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v205;
              v215 = "        Received Delay Request Counter: %u expected %u\n";
              goto LABEL_407;
            }
            v261 = v210 - v211;

            v262 = &_os_log_default;
            v263 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v264 = v210 - v211 >= v209 - 1 || v207 == v208;
            v265 = v209 + 1;
            if (v264 && v261 <= v265)
            {
              if (v263)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v261;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v207 - v208;
                v266 = "        Transmitted Delay Response Counter: %u expected %u\n";
                goto LABEL_418;
              }
            }
            else if (v263)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v261;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v207 - v208;
              v266 = "        Transmitted Delay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_418:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v266, buf, 0xEu);
            }

            v267 = &_os_log_default;
            v268 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v269 = v329 - v326 >= v209 - 1 || v207 == v208;
            if (v269 && v329 - v326 <= v265)
            {
              v62 = v349;
              v270 = v297;
              if (v268)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v329 - v326;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v209;
                v271 = "        Attempted Delay Response Counter: %u expected %u\n";
                goto LABEL_429;
              }
            }
            else
            {
              v62 = v349;
              v270 = v297;
              if (v268)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v329 - v326;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v209;
                v271 = "        Attempted Delay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_429:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v271, buf, 0xEu);
              }
            }

            v272 = &_os_log_default;
            v273 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v274 = v335 - v332 >= v270 || v347 == v345;
            if (v274 && v335 - v332 <= v296)
            {
              if (v273)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v335 - v332;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v347 - v345;
                v275 = "        Transmitted Delay Request Counter: %u expected %u\n";
                goto LABEL_440;
              }
            }
            else if (v273)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v335 - v332;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v347 - v345;
              v275 = "        Transmitted Delay Request Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_440:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v275, buf, 0xEu);
            }

            v276 = &_os_log_default;
            v277 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v278 = v341 - v338 >= v270 || v347 == v345;
            if (v278 && v341 - v338 <= v296)
            {
              if (v277)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v341 - v338;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v347 - v345;
                v279 = "        Attempted Delay Request Counter: %u expected %u\n";
                goto LABEL_451;
              }
            }
            else if (v277)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v341 - v338;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v347 - v345;
              v279 = "        Attempted Delay Request Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_451:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v279, buf, 0xEu);
            }

            v280 = v355 - v352 < v366 - 1 && v366 != 0;
            v281 = &_os_log_default;
            v282 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v280 || v355 - v352 > v366 + 1)
            {
              if (v282)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v355 - v352;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v366;
                v283 = "        Received Delay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_461:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v283, buf, 0xEu);
              }
            }
            else if (v282)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v355 - v352;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              v283 = "        Received Delay Response Counter: %u expected %u\n";
              goto LABEL_461;
            }

            v284 = &_os_log_default;
            v285 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v363 == v360)
            {
              v286 = v372;
              if (v285)
              {
                *(_QWORD *)buf = 67109120;
                v287 = "        Superseded Sync Counter: %u expected 0\n";
                goto LABEL_467;
              }
            }
            else
            {
              v286 = v372;
              if (v285)
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = v363 - v360;
                v287 = "        Superseded Sync Counter: %u out of expected bounds (0)\n";
LABEL_467:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v287, buf, 8u);
              }
            }

            v288 = &_os_log_default;
            v289 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v286 == v369)
            {
              if (!v289)
                goto LABEL_475;
              *(_QWORD *)buf = 67109120;
              v259 = "        Superseded Delay Counter: %u expected 0\n";
            }
            else
            {
              if (!v289)
                goto LABEL_475;
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v286 - v369;
              v259 = "        Superseded Delay Counter: %u out of expected bounds (0)\n";
            }
            v260 = 8;
            goto LABEL_474;
          }
LABEL_477:

          v60 = v356 + 1;
        }
        while (v303 != (id)(v356 + 1));
        v303 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v375, v392, 16);
        if (!v303)
        {
LABEL_479:

          v6 = v292;
          v45 = v342;
          break;
        }
      }
    }
    v57->_firstStatistics = 0;
    v57->_lastStatisticsTime = v3;
    objc_storeStrong((id *)&v57->_lastStatistics, obj);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[TSDKernelClock clockIdentifier](self->_clock, "clockIdentifier");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Clock Statistics for 0x%016llx\n", buf, 0xCu);
    }
    v14 = -[TSDKernelClock lockState](self->_clock, "lockState");
    if (v14 > 2)
      v15 = CFSTR("Unknown");
    else
      v15 = off_10003C858[v14];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v24 = -[__CFString UTF8String](v15, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v24;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Clock lock state: %s\n", buf, 0xCu);
    }
    v391 = 0;
    v390 = 0;
    v389 = 0;
    v388 = 0;
    v387 = 0;
    v25 = self->_clock;
    v374 = 0;
    v26 = -[TSDKernelClock getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:](v25, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:", &v391, &v390, &v389, &v387, &v374);
    v27 = v374;
    v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v391;
        *(_WORD *)&buf[12] = 2048;
        v395 = v390;
        v396 = 2048;
        v397 = (double)v391 / (double)v390;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Mach Rate Ratio: %llu/%llu (%0.12f)\n", buf, 0x20u);
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v389;
        *(_WORD *)&buf[12] = 2048;
        v395 = v387;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Mach Anchors: %llu, %llu\n", buf, 0x16u);
      }
    }
    else if (v28)
    {
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedDescription")));
      v37 = objc_msgSend(v36, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v37;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Mach Sync Info: failed to get rate ratio and anchors with error \"%s\"\n", buf, 0xCu);

    }
    v38 = self->_clock;
    v373 = v27;
    v39 = -[TSDKernelClock getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:](v38, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:", &v391, &v390, &v388, &v387, &v373);
    v40 = v373;

    v41 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v39)
    {
      if (v41)
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v391;
        *(_WORD *)&buf[12] = 2048;
        v395 = v390;
        v396 = 2048;
        v397 = (double)v391 / (double)v390;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    TimeSync Rate Ratio: %llu/%llu (%0.12f)\n", buf, 0x20u);
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v388;
        *(_WORD *)&buf[12] = 2048;
        v395 = v387;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    TimeSync Anchors: %llu, %llu\n", buf, 0x16u);
      }
    }
    else if (v41)
    {
      v290 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedDescription")));
      v291 = objc_msgSend(v290, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v291;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    TimeSync Sync Info: failed to get rate ratio and anchors with error \"%s\"\n", buf, 0xCu);

    }
  }
}

- (void)didProcessSync:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  _BOOL4 v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  unsigned int v13;
  id v14;
  _BOOL4 v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  unsigned __int16 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  unint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  int v42;

  v4 = a3;
  v5 = v4;
  if (!self->_hasSyncedSinceLocked)
  {
    v27 = 0;
    v28 = 0;
    v25 = 0;
    v26 = 0;
    v23 = 0;
    v24 = 0;
    v22 = 0;
    v21 = 0;
    v6 = objc_msgSend(v4, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:", &v28, &v27, &v26, &v24, &v23, &v22, &v21);
    v7 = v21;
    v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        v9 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
        *(_DWORD *)buf = 134219520;
        v30 = v9;
        v31 = 2048;
        v32 = v28;
        v33 = 2048;
        v34 = v27;
        v35 = 2048;
        v36 = v26;
        v37 = 2048;
        v38 = v24;
        v39 = 2048;
        v40 = v23;
        v41 = 1024;
        v42 = v22;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: First MachSync %llu,%llu,%llu,%llu,0x%016llx,%hu\n", buf, 0x44u);
      }
    }
    else if (v8)
    {
      v10 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedDescription")));
      v12 = objc_msgSend(v11, "UTF8String");
      *(_DWORD *)buf = 134218242;
      v30 = v10;
      v31 = 2080;
      v32 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: failed to get mach rate ratio and anchors with error \"%s\"\n", buf, 0x16u);

    }
    v20 = v7;
    v13 = objc_msgSend(v5, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:", &v28, &v27, &v25, &v24, &v23, &v22, &v20);
    v14 = v20;

    v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        v16 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
        *(_DWORD *)buf = 134219520;
        v30 = v16;
        v31 = 2048;
        v32 = v28;
        v33 = 2048;
        v34 = v27;
        v35 = 2048;
        v36 = v25;
        v37 = 2048;
        v38 = v24;
        v39 = 2048;
        v40 = v23;
        v41 = 1024;
        v42 = v22;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: First TimeSync %llu,%llu,%llu,%llu,0x%016llx,%hu\n", buf, 0x44u);
      }
    }
    else if (v15)
    {
      v17 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedDescription")));
      v19 = objc_msgSend(v18, "UTF8String");
      *(_DWORD *)buf = 134218242;
      v30 = v17;
      v31 = 2080;
      v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: failed to get timesync rate ratio and anchors with error \"%s\"\n", buf, 0x16u);

    }
    self->_hasSyncedSinceLocked = 1;

  }
}

- (TSDClockStatistics)initWithClockIdentifier:(unint64_t)a3
{
  TSDClockStatistics *v4;
  TSDClockStatistics *v5;
  void *v6;
  TSDClockStatistics *v7;
  dispatch_queue_global_t global_queue;
  void *v9;
  TSDClockStatistics *v10;
  void **v12;
  uint64_t v13;
  _DWORD *(*v14)(uint64_t, uint64_t);
  void *v15;
  TSDClockStatistics *v16;
  unint64_t v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;

  v18.receiver = self;
  v18.super_class = (Class)TSDClockStatistics;
  v4 = -[TSDClockStatistics init](&v18, "init");
  v5 = v4;
  if (v4)
  {
    if (a3 == -1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v20 = "clockIdentifier != TSNullClockIdentifier";
        v21 = 2048;
        v22 = 0;
        v23 = 2048;
        v24 = 0;
        v25 = 2080;
        v26 = "";
        v27 = 2080;
        v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockStatistics.m";
        v29 = 1024;
        v30 = 103;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }
      v7 = v5;
      v5 = 0;
    }
    else
    {
      v4->_clockIdentifier = a3;
      v4->_firstStatistics = 1;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSDClockManager sharedClockManager](TSDClockManager, "sharedClockManager"));
      v7 = (TSDClockStatistics *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clockWithClockIdentifier:", -[TSDClockStatistics clockIdentifier](v5, "clockIdentifier")));

      if (v7)
      {
        objc_storeStrong((id *)&v5->_clock, v7);
        global_queue = dispatch_get_global_queue(0, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
        v12 = _NSConcreteStackBlock;
        v13 = 3221225472;
        v14 = sub_100019238;
        v15 = &unk_10003C838;
        v16 = v7;
        v17 = a3;
        v5->_stateDumpHandler = os_state_add_handler(v9, &v12);

        -[TSDKernelClock addClient:](v5->_clock, "addClient:", v5, v12, v13, v14, v15);
        v10 = v16;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v20 = "clock != nil";
          v21 = 2048;
          v22 = 0;
          v23 = 2048;
          v24 = 0;
          v25 = 2080;
          v26 = "";
          v27 = 2080;
          v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockStatistics.m";
          v29 = 1024;
          v30 = 110;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        }
        v10 = v5;
        v5 = 0;
      }

    }
  }
  return v5;
}

- (void)finalizeClock
{
  TSDKernelClock *clock;

  -[TSDKernelClock removeClient:](self->_clock, "removeClient:", self);
  -[TSDKernelClock finalizeNotifications](self->_clock, "finalizeNotifications");
  clock = self->_clock;
  self->_clock = 0;

}

- (void)didResetClock:(id)a3
{
  int v4;
  unint64_t v5;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: reset clock\n", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didChangeClockMasterForClock:(id)a3
{
  int v4;
  unint64_t v5;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: master clock changed\n", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  id v6;
  __CFString *v7;
  int v8;
  unint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;

  v6 = a4;
  if (a3 > 2)
    v7 = CFSTR("Unknown");
  else
    v7 = off_10003C858[a3];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218498;
    v9 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
    v10 = 1024;
    v11 = a3;
    v12 = 2080;
    v13 = -[__CFString UTF8String](v7, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: set lock state to %u (%s)\n", (uint8_t *)&v8, 0x1Cu);
  }
  if (a3 == 2)
    self->_hasSyncedSinceLocked = 0;

}

- (void)didBeginClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  int v5;
  int v8;
  unint64_t v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  int v13;

  v5 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218496;
    v9 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
    v10 = 2048;
    v11 = a3;
    v12 = 1024;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: begin grandmaster change GMID 0x%016llx local port %hu\n", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  int v5;
  int v8;
  unint64_t v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  int v13;

  v5 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218496;
    v9 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
    v10 = 2048;
    v11 = a3;
    v12 = 1024;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: end grandmaster change GMID 0x%016llx local port %hu\n", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)didGetStatsOfLocalPortNumber:(unint64_t)a3 mean:(unint64_t)a4 median:(unint64_t)a5 stddev:(unint64_t)a6 min:(unint64_t)a7 max:(unint64_t)a8 numberOfSamples:(unsigned int)a9 forClock:(id)a10
{
  void *v14;
  unint64_t v15;
  unsigned __int8 v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[12];
  _QWORD v33[12];

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a10, "portWithPortNumber:", (unsigned __int16)a3));
  v15 = (unint64_t)objc_msgSend(v14, "remoteClockIdentity");
  v16 = BYTE5(v15);
  v17 = v15 >> 40;
  v32[0] = CFSTR("LocalLinkType");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v14, "localLinkType")));
  v33[0] = v31;
  v32[1] = CFSTR("RemoteLinkType");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v14, "remoteLinkType")));
  v33[1] = v30;
  v32[2] = CFSTR("LocalTimestampingMode");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v14, "localTimestampingMode")));
  v33[2] = v29;
  v32[3] = CFSTR("RemoteTimestampingMode");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v14, "remoteTimestampingMode")));
  v33[3] = v28;
  v32[4] = CFSTR("PortType");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v14, "portType")));
  v33[4] = v18;
  v32[5] = CFSTR("MinimumDelay");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)a7 / 1000.0));
  v33[5] = v19;
  v32[6] = CFSTR("MaximumDelay");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)a8 / 1000.0));
  v33[6] = v20;
  v32[7] = CFSTR("MeanDelay");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)a4 / 1000.0));
  v33[7] = v21;
  v32[8] = CFSTR("MedianDelay");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)a5 / 1000.0));
  v33[8] = v22;
  v32[9] = CFSTR("StandardDeviation");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)a6 / 1000.0));
  v33[9] = v23;
  v32[10] = CFSTR("NumberOfSamples");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a9));
  v33[10] = v24;
  v32[11] = CFSTR("RemoteOUI");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02x-%02x-%02x"), WORD1(v17), BYTE1(v17), v16));
  v33[11] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 12));

  AnalyticsSendEvent(CFSTR("com.apple.TimeSync.ete-delay-stats"), v26);
}

- (void)dealloc
{
  unint64_t stateDumpHandler;
  objc_super v4;

  stateDumpHandler = self->_stateDumpHandler;
  if (stateDumpHandler)
    os_state_remove_handler(stateDumpHandler, a2);
  v4.receiver = self;
  v4.super_class = (Class)TSDClockStatistics;
  -[TSDClockStatistics dealloc](&v4, "dealloc");
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastStatistics, 0);
  objc_storeStrong((id *)&self->_clock, 0);
}

@end
