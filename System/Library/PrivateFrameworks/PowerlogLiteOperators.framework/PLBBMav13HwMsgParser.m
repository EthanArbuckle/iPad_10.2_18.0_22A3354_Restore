@implementation PLBBMav13HwMsgParser

+ (id)optimMaskMappings
{
  _QWORD v3[19];
  _QWORD v4[20];

  v4[19] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E8635A18;
  v3[1] = &unk_1E8635A30;
  v4[0] = CFSTR("PROTO_CDMA2K");
  v4[1] = CFSTR("PROTO_1xEVDO");
  v3[2] = &unk_1E8635A48;
  v3[3] = &unk_1E8635A60;
  v4[2] = CFSTR("PROTO_GSM");
  v4[3] = CFSTR("PROTO_WCDMA");
  v3[4] = &unk_1E8635A78;
  v3[5] = &unk_1E8635A90;
  v4[4] = CFSTR("PROTO_LTE");
  v4[5] = CFSTR("PROTO_TDSCDMA");
  v3[6] = &unk_1E8635AA8;
  v3[7] = &unk_1E8635AC0;
  v4[6] = CFSTR("RF_CDMA2K");
  v4[7] = CFSTR("RF_1xEVDO");
  v3[8] = &unk_1E8635AD8;
  v3[9] = &unk_1E8635AF0;
  v4[8] = CFSTR("RF_GSM");
  v4[9] = CFSTR("RF_WCDMA");
  v3[10] = &unk_1E8635B08;
  v3[11] = &unk_1E8635B20;
  v4[10] = CFSTR("RF_LTE");
  v4[11] = CFSTR("RF_TDSCDMA");
  v3[12] = &unk_1E8635B38;
  v3[13] = &unk_1E8635B50;
  v4[12] = CFSTR("ENH_1x");
  v4[13] = CFSTR("ENH_HDR");
  v3[14] = &unk_1E8635B68;
  v3[15] = &unk_1E8635B80;
  v4[14] = CFSTR("ENH_GSM");
  v4[15] = CFSTR("ENH_WCDMA");
  v3[16] = &unk_1E8635B98;
  v3[17] = &unk_1E8635BB0;
  v4[16] = CFSTR("ENH_LTE");
  v4[17] = CFSTR("ENH_TDSCDMA");
  v3[18] = &unk_1E8635BC8;
  v4[18] = CFSTR("ENH_OOS");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 19);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PLBBMav13HwMsgParser)initWithData:(id)a3
{
  id v4;
  PLBBMav13HwMsgParser *v5;
  PLBBMav13HwMsgParser *v6;
  PLBBMav13HwMsgParser *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLBBMav13HwMsgParser;
  v5 = -[PLMav7BasebandHardwareMessage initWithData:](&v9, sel_initWithData_, v4);
  v6 = v5;
  if (v5 && !-[PLBBMav13HwMsgParser parseData:](v5, "parseData:", v4))
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

- (BOOL)parseData:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unsigned __int8 *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  unsigned __int8 *v16;
  uint64_t v17;
  _QWORD *v18;
  unsigned __int8 *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  unsigned __int8 *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  _QWORD *v35;
  unsigned __int8 *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  _QWORD *v43;
  unsigned __int8 *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  _QWORD *v51;
  unsigned __int8 *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  _QWORD *v59;
  unsigned __int8 *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  _QWORD *v67;
  unsigned __int8 *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  uint64_t v74;
  _QWORD *v75;
  unsigned __int8 *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  uint64_t v82;
  _QWORD *v83;
  unsigned __int8 *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  uint64_t v90;
  _QWORD *v91;
  unsigned __int8 *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  uint64_t v98;
  _QWORD *v99;
  unsigned __int8 *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  NSObject *v105;
  uint64_t v106;
  _QWORD *v107;
  unsigned __int8 *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  NSObject *v113;
  uint64_t v114;
  _QWORD *v115;
  unsigned __int8 *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  NSObject *v121;
  uint64_t v122;
  _QWORD *v123;
  unsigned __int8 *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  NSObject *v129;
  uint64_t v130;
  _QWORD *v131;
  unsigned __int8 *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  NSObject *v137;
  uint64_t v138;
  _QWORD *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  unsigned __int8 *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  NSObject *v149;
  uint64_t v150;
  uint64_t v151;
  _QWORD *v152;
  unsigned __int8 *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  NSObject *v158;
  uint64_t v159;
  _QWORD *v160;
  unsigned __int8 *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  NSObject *v166;
  uint64_t v167;
  uint64_t v168;
  _QWORD *v169;
  void *v170;
  void *v171;
  void *v172;
  unsigned __int8 *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  NSObject *v178;
  uint64_t v179;
  _QWORD *v180;
  unsigned __int8 *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  NSObject *v186;
  uint64_t v187;
  _QWORD *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  uint64_t v193;
  _QWORD *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  uint64_t v199;
  _QWORD *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  uint64_t v205;
  _QWORD *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  uint64_t v211;
  _QWORD *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  uint64_t v217;
  _QWORD *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  uint64_t v223;
  _QWORD *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  uint64_t v229;
  _QWORD *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  uint64_t v235;
  _QWORD *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  uint64_t v241;
  _QWORD *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  uint64_t v247;
  _QWORD *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  uint64_t v253;
  _QWORD *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  uint64_t v259;
  _QWORD *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  uint64_t v265;
  _QWORD *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  uint64_t v271;
  _QWORD *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  uint64_t v277;
  _QWORD *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  uint64_t v283;
  _QWORD *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  uint64_t v289;
  _QWORD *v290;
  unsigned __int8 *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  NSObject *v296;
  uint64_t v297;
  _QWORD *v298;
  unsigned __int8 *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  NSObject *v304;
  unsigned __int8 *v305;
  int v306;
  void *v307;
  unsigned __int8 *v308;
  int v309;
  void *v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  id v314;
  unsigned __int8 *v315;
  unint64_t v316;
  unint64_t v317;
  NSObject *v318;
  id v320;
  unsigned __int8 *v321;
  void *v322;
  uint64_t v323;
  void *v324;
  id v325;
  void *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  void *v330;
  _QWORD v331[5];
  _QWORD v332[5];
  _QWORD v333[5];
  _QWORD v334[5];
  _QWORD v335[5];
  _QWORD v336[5];
  _QWORD v337[5];
  _QWORD v338[5];
  _QWORD v339[5];
  _QWORD v340[5];
  _QWORD v341[5];
  _QWORD v342[5];
  _QWORD v343[5];
  _QWORD v344[5];
  _QWORD v345[5];
  _QWORD v346[5];
  _QWORD v347[5];
  _QWORD v348[5];
  _QWORD v349[5];
  _QWORD v350[5];
  _QWORD v351[5];
  _QWORD v352[5];
  _QWORD v353[5];
  _QWORD v354[5];
  _QWORD v355[5];
  _QWORD v356[5];
  _QWORD v357[5];
  _QWORD v358[5];
  _QWORD v359[5];
  _QWORD v360[5];
  _QWORD v361[5];
  _QWORD v362[5];
  _QWORD v363[5];
  _QWORD v364[5];
  _QWORD v365[5];
  _QWORD v366[5];
  _QWORD v367[5];
  _QWORD v368[5];
  _QWORD v369[5];
  _QWORD v370[5];
  uint8_t buf[4];
  unsigned __int8 *v372;
  __int16 v373;
  uint64_t v374;
  __int16 v375;
  const char *v376;
  uint64_t v377;

  v377 = *MEMORY[0x1E0C80C00];
  v325 = objc_retainAutorelease(a3);
  v4 = (unsigned __int8 *)objc_msgSend(v325, "bytes");
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (*v4 == 129)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("SeqInd[%x] "), 129);
    v4 += 2;
  }
  -[PLMav4BasebandHardwareMessage setHeader:](self, "setHeader:", v4 + 13);
  objc_msgSend(v6, "appendFormat:", CFSTR("Sw Rev[%0x %0x] "), v4[13], v4[14]);
  objc_msgSend(v6, "appendFormat:", CFSTR("Hw Rev[%0x %0x] "), v4[15], v4[16]);
  v7 = 0x1E0D7F000uLL;
  v326 = v6;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    v370[0] = MEMORY[0x1E0C809B0];
    v370[1] = 3221225472;
    v370[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke;
    v370[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v370[4] = v8;
    v9 = v370;
    if (qword_1ED8871E0 != -1)
      dispatch_once(&qword_1ED8871E0, v9);

    if (_MergedGlobals_112)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Header Info: %@"), v6);
      v10 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 84);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v372 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v16 = v4 + 33;
  -[PLMav4BasebandHardwareMessage setLogDuration:](self, "setLogDuration:", ((_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[16]- (_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[12]));
  if (-[PLMav4BasebandHardwareMessage level](self, "level"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v17 = objc_opt_class();
      v369[0] = MEMORY[0x1E0C809B0];
      v369[1] = 3221225472;
      v369[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_315;
      v369[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v369[4] = v17;
      v18 = v369;
      if (qword_1ED8871E8 != -1)
        dispatch_once(&qword_1ED8871E8, v18);

      if (byte_1ED887171)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 1: RPM starts at offset %llu"), 20);
        v19 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastPathComponent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 94);

        PLLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v19;
          _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLBBMav13HwMsgParser setRpmData:](self, "setRpmData:", v4 + 33);
    v16 = v4 + 57;
    v25 = 44;
  }
  else
  {
    v25 = 20;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 2)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v26 = objc_opt_class();
      v368[0] = MEMORY[0x1E0C809B0];
      v368[1] = 3221225472;
      v368[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_320;
      v368[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v368[4] = v26;
      v27 = v368;
      if (qword_1ED8871F0 != -1)
        dispatch_once(&qword_1ED8871F0, v27);

      if (byte_1ED887172)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 2: Apps Perf starts at offset %llu"), v25);
        v28 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "lastPathComponent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 103);

        PLLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v28;
          _os_log_debug_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLBBMav13HwMsgParser setAppsPerf:](self, "setAppsPerf:", v16);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v34 = objc_opt_class();
      v367[0] = MEMORY[0x1E0C809B0];
      v367[1] = 3221225472;
      v367[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_325;
      v367[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v367[4] = v34;
      v35 = v367;
      if (qword_1ED8871F8 != -1)
        dispatch_once(&qword_1ED8871F8, v35);

      if (byte_1ED887173)
      {
        v327 = v25;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 2: Apps Sleep starts at offset %llu"), v25 + 24);
        v36 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "lastPathComponent");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v39, v40, 108);

        PLLogCommon();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v36;
          _os_log_debug_impl(&dword_1CAF47000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v25 = v327;
      }
    }
    -[PLBBMav13HwMsgParser setAppsSleep:](self, "setAppsSleep:", v16 + 24);
    v16 += 36;
    v25 += 36;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 3)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v42 = objc_opt_class();
      v366[0] = MEMORY[0x1E0C809B0];
      v366[1] = 3221225472;
      v366[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_330;
      v366[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v366[4] = v42;
      v43 = v366;
      if (qword_1ED887200 != -1)
        dispatch_once(&qword_1ED887200, v43);

      if (byte_1ED887174)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 3: PCIE stats starts at offset %llu"), v25);
        v44 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "lastPathComponent");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "logMessage:fromFile:fromFunction:fromLineNumber:", v44, v47, v48, 117);

        PLLogCommon();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v44;
          _os_log_debug_impl(&dword_1CAF47000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLBBMav13HwMsgParser setPcieState:](self, "setPcieState:", v16);
    v16 += 12;
    v25 += 12;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 4)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v50 = objc_opt_class();
      v365[0] = MEMORY[0x1E0C809B0];
      v365[1] = 3221225472;
      v365[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_335;
      v365[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v365[4] = v50;
      v51 = v365;
      if (qword_1ED887208 != -1)
        dispatch_once(&qword_1ED887208, v51);

      if (byte_1ED887175)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 4: LPASS stats starts at offset %llu"), v25);
        v52 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "lastPathComponent");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "logMessage:fromFile:fromFunction:fromLineNumber:", v52, v55, v56, 126);

        PLLogCommon();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v52;
          _os_log_debug_impl(&dword_1CAF47000, v57, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLBBMav13HwMsgParser setLpassState:](self, "setLpassState:", v16);
    v16 += 8;
    v25 += 8;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 5)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v58 = objc_opt_class();
      v364[0] = MEMORY[0x1E0C809B0];
      v364[1] = 3221225472;
      v364[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_340;
      v364[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v364[4] = v58;
      v59 = v364;
      if (qword_1ED887210 != -1)
        dispatch_once(&qword_1ED887210, v59);

      if (byte_1ED887176)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: Apps Sleep veto stats starts at offset %llu"), v25);
        v60 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v61 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "lastPathComponent");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "logMessage:fromFile:fromFunction:fromLineNumber:", v60, v63, v64, 135);

        PLLogCommon();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v60;
          _os_log_debug_impl(&dword_1CAF47000, v65, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLBBMav13HwMsgParser setAppsSleepVeto:](self, "setAppsSleepVeto:", v16);
    v328 = v25;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v66 = objc_opt_class();
      v363[0] = MEMORY[0x1E0C809B0];
      v363[1] = 3221225472;
      v363[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_345;
      v363[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v363[4] = v66;
      v67 = v363;
      if (qword_1ED887218 != -1)
        dispatch_once(&qword_1ED887218, v67);

      if (byte_1ED887177)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: MPSS Sleep veto stats starts at offset %llu"), v25 + 20);
        v68 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v69 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "lastPathComponent");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "logMessage:fromFile:fromFunction:fromLineNumber:", v68, v71, v72, 140);

        PLLogCommon();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v68;
          _os_log_debug_impl(&dword_1CAF47000, v73, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v25 = v328;
      }
    }
    -[PLBBMav13HwMsgParser setMpssSleepVeto:](self, "setMpssSleepVeto:", v16 + 20);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v74 = objc_opt_class();
      v362[0] = MEMORY[0x1E0C809B0];
      v362[1] = 3221225472;
      v362[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_350;
      v362[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v362[4] = v74;
      v75 = v362;
      if (qword_1ED887220 != -1)
        dispatch_once(&qword_1ED887220, v75);

      if (byte_1ED887178)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: QDSP Sleep veto stats starts at offset %llu"), v25 + 88);
        v76 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v77 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "lastPathComponent");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "logMessage:fromFile:fromFunction:fromLineNumber:", v76, v79, v80, 145);

        PLLogCommon();
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v76;
          _os_log_debug_impl(&dword_1CAF47000, v81, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v25 = v328;
      }
    }
    -[PLBBMav13HwMsgParser setQdspSpeed:](self, "setQdspSpeed:", v16 + 88);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v82 = objc_opt_class();
      v361[0] = MEMORY[0x1E0C809B0];
      v361[1] = 3221225472;
      v361[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_355;
      v361[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v361[4] = v82;
      v83 = v361;
      if (qword_1ED887228 != -1)
        dispatch_once(&qword_1ED887228, v83);

      if (byte_1ED887179)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: MPSS Sleep stats starts at offset %llu"), v25 + 136);
        v84 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v85 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "lastPathComponent");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "logMessage:fromFile:fromFunction:fromLineNumber:", v84, v87, v88, 150);

        PLLogCommon();
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v84;
          _os_log_debug_impl(&dword_1CAF47000, v89, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v25 = v328;
      }
    }
    -[PLBBMav13HwMsgParser setMpssSleep:](self, "setMpssSleep:", v16 + 136);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v90 = objc_opt_class();
      v360[0] = MEMORY[0x1E0C809B0];
      v360[1] = 3221225472;
      v360[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_360;
      v360[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v360[4] = v90;
      v91 = v360;
      if (qword_1ED887230 != -1)
        dispatch_once(&qword_1ED887230, v91);

      if (byte_1ED88717A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: GPS stats starts at offset %llu"), v25 + 148);
        v92 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v93 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "lastPathComponent");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "logMessage:fromFile:fromFunction:fromLineNumber:", v92, v95, v96, 155);

        PLLogCommon();
        v97 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v92;
          _os_log_debug_impl(&dword_1CAF47000, v97, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v25 = v328;
      }
    }
    -[PLBBMav13HwMsgParser setGpsState:](self, "setGpsState:", v16 + 148);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v98 = objc_opt_class();
      v359[0] = MEMORY[0x1E0C809B0];
      v359[1] = 3221225472;
      v359[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_365;
      v359[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v359[4] = v98;
      v99 = v359;
      if (qword_1ED887238 != -1)
        dispatch_once(&qword_1ED887238, v99);

      if (byte_1ED88717B)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: GPS DPO stats starts at offset %llu"), v25 + 156);
        v100 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v101 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "lastPathComponent");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "logMessage:fromFile:fromFunction:fromLineNumber:", v100, v103, v104, 160);

        PLLogCommon();
        v105 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v100;
          _os_log_debug_impl(&dword_1CAF47000, v105, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v25 = v328;
      }
    }
    -[PLBBMav13HwMsgParser setGpsDpoState:](self, "setGpsDpoState:", v16 + 156);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v106 = objc_opt_class();
      v358[0] = MEMORY[0x1E0C809B0];
      v358[1] = 3221225472;
      v358[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_370;
      v358[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v358[4] = v106;
      v107 = v358;
      if (qword_1ED887240 != -1)
        dispatch_once(&qword_1ED887240, v107);

      if (byte_1ED88717C)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: GPS DPO bin stats starts at offset %llu"), v25 + 164);
        v108 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v109 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "lastPathComponent");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "logMessage:fromFile:fromFunction:fromLineNumber:", v108, v111, v112, 165);

        PLLogCommon();
        v113 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v108;
          _os_log_debug_impl(&dword_1CAF47000, v113, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v25 = v328;
      }
    }
    -[PLBBMav13HwMsgParser setGpsDpoBins:](self, "setGpsDpoBins:", v16 + 164);
    v16 += 188;
    v25 += 188;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 6)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v114 = objc_opt_class();
      v357[0] = MEMORY[0x1E0C809B0];
      v357[1] = 3221225472;
      v357[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_375;
      v357[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v357[4] = v114;
      v115 = v357;
      if (qword_1ED887248 != -1)
        dispatch_once(&qword_1ED887248, v115);

      if (byte_1ED88717D)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 6: MCPM Sleep veto starts at offset %llu"), v25);
        v116 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v117 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "lastPathComponent");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "logMessage:fromFile:fromFunction:fromLineNumber:", v116, v119, v120, 174);

        PLLogCommon();
        v121 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v116;
          _os_log_debug_impl(&dword_1CAF47000, v121, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLBBMav13HwMsgParser setMcpmSleepVeto:](self, "setMcpmSleepVeto:", v16);
    v329 = v25;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v122 = objc_opt_class();
      v356[0] = MEMORY[0x1E0C809B0];
      v356[1] = 3221225472;
      v356[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_380;
      v356[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v356[4] = v122;
      v123 = v356;
      if (qword_1ED887250 != -1)
        dispatch_once(&qword_1ED887250, v123);

      if (byte_1ED88717E)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 6: Protocol Active starts at offset %llu"), v25 + 52);
        v124 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v125 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "lastPathComponent");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "logMessage:fromFile:fromFunction:fromLineNumber:", v124, v127, v128, 179);

        PLLogCommon();
        v129 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v124;
          _os_log_debug_impl(&dword_1CAF47000, v129, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v25 = v329;
      }
    }
    -[PLBBMav13HwMsgParser setProtocolActive:](self, "setProtocolActive:", v16 + 52);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v130 = objc_opt_class();
      v355[0] = MEMORY[0x1E0C809B0];
      v355[1] = 3221225472;
      v355[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_385;
      v355[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v355[4] = v130;
      v131 = v355;
      if (qword_1ED887258 != -1)
        dispatch_once(&qword_1ED887258, v131);

      if (byte_1ED88717F)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 6: Optim mask starts at offset %llu"), v25 + 76);
        v132 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v133 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "lastPathComponent");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "logMessage:fromFile:fromFunction:fromLineNumber:", v132, v135, v136, 184);

        PLLogCommon();
        v137 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v132;
          _os_log_debug_impl(&dword_1CAF47000, v137, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v25 = v329;
      }
    }
    -[PLBBMav13HwMsgParser setOptimMaskArray:](self, "setOptimMaskArray:", v16 + 76);
    v138 = objc_opt_class();
    v354[0] = MEMORY[0x1E0C809B0];
    v354[1] = 3221225472;
    v354[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_390;
    v354[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v354[4] = v138;
    v139 = v354;
    if (qword_1ED887260 != -1)
      dispatch_once(&qword_1ED887260, v139);

    if (byte_1ED887180)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), *(unsigned __int8 *)-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray"));
      v140 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1]);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[2]);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[3]);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v324 = (void *)v140;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Optim Mask [%@ %@ %@ %@]"), v140, v141, v142, v143);
      v144 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v145 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "lastPathComponent");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "logMessage:fromFile:fromFunction:fromLineNumber:", v144, v147, v148, 192);

      PLLogCommon();
      v149 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v149, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v372 = v144;
        _os_log_debug_impl(&dword_1CAF47000, v149, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v7 = 0x1E0D7F000uLL;
      v25 = v329;
    }
    v150 = v25 + 80;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v151 = objc_opt_class();
      v353[0] = MEMORY[0x1E0C809B0];
      v353[1] = 3221225472;
      v353[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_397;
      v353[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v353[4] = v151;
      v152 = v353;
      if (qword_1ED887268 != -1)
        dispatch_once(&qword_1ED887268, v152);

      if (byte_1ED887181)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 6: Protocol State starts at offset %llu"), v150);
        v153 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v154 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "lastPathComponent");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "logMessage:fromFile:fromFunction:fromLineNumber:", v153, v156, v157, 196);

        PLLogCommon();
        v158 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v158, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v153;
          _os_log_debug_impl(&dword_1CAF47000, v158, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v16 += 80;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v159 = objc_opt_class();
      v352[0] = MEMORY[0x1E0C809B0];
      v352[1] = 3221225472;
      v352[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_402;
      v352[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v352[4] = v159;
      v160 = v352;
      if (qword_1ED887270 != -1)
        dispatch_once(&qword_1ED887270, v160);

      if (byte_1ED887182)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 6: Optim mask value [0x%x]"), *(unsigned int *)-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray"));
        v161 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v162 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v163, "lastPathComponent");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "logMessage:fromFile:fromFunction:fromLineNumber:", v161, v164, v165, 201);

        PLLogCommon();
        v166 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v166, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v161;
          _os_log_debug_impl(&dword_1CAF47000, v166, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    +[PLBBMav13HwMsgParser optimMaskMappings](PLBBMav13HwMsgParser, "optimMaskMappings");
    v330 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = 0;
    do
    {
      if (((*(_DWORD *)-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") >> v167) & 1) != 0)
      {
        if (objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
        {
          v168 = objc_opt_class();
          v351[0] = MEMORY[0x1E0C809B0];
          v351[1] = 3221225472;
          v351[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_408;
          v351[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v351[4] = v168;
          v169 = v351;
          if (qword_1ED887278 != -1)
            dispatch_once(&qword_1ED887278, v169);

          if (byte_1ED887183)
          {
            v170 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v167);
            v171 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v330, "objectForKeyedSubscript:", v171);
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v170, "stringWithFormat:", CFSTR("Payload %@ is present at offset %llu, pointer %ld"), v172, v150, v16);
            v173 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();

            v174 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v175, "lastPathComponent");
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v174, "logMessage:fromFile:fromFunction:fromLineNumber:", v173, v176, v177, 207);

            PLLogCommon();
            v178 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v178, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v372 = v173;
              _os_log_debug_impl(&dword_1CAF47000, v178, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v7 = 0x1E0D7F000uLL;
          }
        }
        switch((int)v167)
        {
          case 0:
            -[PLBBMav13HwMsgParser setProtoStateC2K:](self, "setProtoStateC2K:", v16);
            v150 += 64;
            v16 += 64;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v179 = objc_opt_class();
            v350[0] = MEMORY[0x1E0C809B0];
            v350[1] = 3221225472;
            v350[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_414;
            v350[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v350[4] = v179;
            v180 = v350;
            if (qword_1ED887280 != -1)
              dispatch_once(&qword_1ED887280, v180);

            if (!byte_1ED887184)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v182 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v183 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v183, "lastPathComponent");
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v185 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v182, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v184, v185, 214);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 1:
            -[PLBBMav13HwMsgParser setProtoStateHDR:](self, "setProtoStateHDR:", v16);
            v150 += 64;
            v16 += 64;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v187 = objc_opt_class();
            v349[0] = MEMORY[0x1E0C809B0];
            v349[1] = 3221225472;
            v349[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_419;
            v349[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v349[4] = v187;
            v188 = v349;
            if (qword_1ED887288 != -1)
              dispatch_once(&qword_1ED887288, v188);

            if (!byte_1ED887185)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v189 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v190 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v190, "lastPathComponent");
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v192 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v189, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v191, v192, 220);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 2:
            -[PLBBMav13HwMsgParser setProtoStateGSM:](self, "setProtoStateGSM:", v16);
            v150 += 64;
            v16 += 64;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v193 = objc_opt_class();
            v348[0] = MEMORY[0x1E0C809B0];
            v348[1] = 3221225472;
            v348[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_422;
            v348[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v348[4] = v193;
            v194 = v348;
            if (qword_1ED887290 != -1)
              dispatch_once(&qword_1ED887290, v194);

            if (!byte_1ED887186)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v195 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v196, "lastPathComponent");
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v198 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v195, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v197, v198, 226);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 3:
            -[PLBBMav13HwMsgParser setProtoStateWCDMA:](self, "setProtoStateWCDMA:", v16);
            v150 += 64;
            v16 += 64;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v199 = objc_opt_class();
            v347[0] = MEMORY[0x1E0C809B0];
            v347[1] = 3221225472;
            v347[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_425;
            v347[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v347[4] = v199;
            v200 = v347;
            if (qword_1ED887298 != -1)
              dispatch_once(&qword_1ED887298, v200);

            if (!byte_1ED887187)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v201 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v202 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v202, "lastPathComponent");
            v203 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v204 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v201, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v203, v204, 232);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 4:
            -[PLBBMav13HwMsgParser setProtoStateLTE:](self, "setProtoStateLTE:", v16);
            v150 += 64;
            v16 += 64;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v205 = objc_opt_class();
            v346[0] = MEMORY[0x1E0C809B0];
            v346[1] = 3221225472;
            v346[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_428;
            v346[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v346[4] = v205;
            v206 = v346;
            if (qword_1ED8872A0 != -1)
              dispatch_once(&qword_1ED8872A0, v206);

            if (!byte_1ED887188)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v207 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v208 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v208, "lastPathComponent");
            v209 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v210 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v207, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v209, v210, 238);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 5:
            -[PLBBMav13HwMsgParser setProtoStateTDS:](self, "setProtoStateTDS:", v16);
            v150 += 64;
            v16 += 64;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v211 = objc_opt_class();
            v345[0] = MEMORY[0x1E0C809B0];
            v345[1] = 3221225472;
            v345[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_431;
            v345[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v345[4] = v211;
            v212 = v345;
            if (qword_1ED8872A8 != -1)
              dispatch_once(&qword_1ED8872A8, v212);

            if (!byte_1ED887189)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v213 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v214, "lastPathComponent");
            v215 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v216 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v213, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v215, v216, 244);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 6:
            -[PLBBMav13HwMsgParser setRfDataC2K:](self, "setRfDataC2K:", v16);
            v150 += 256;
            v16 += 256;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v217 = objc_opt_class();
            v344[0] = MEMORY[0x1E0C809B0];
            v344[1] = 3221225472;
            v344[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_434;
            v344[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v344[4] = v217;
            v218 = v344;
            if (qword_1ED8872B0 != -1)
              dispatch_once(&qword_1ED8872B0, v218);

            if (!byte_1ED88718A)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 256);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v219 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v220 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v220, "lastPathComponent");
            v221 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v222 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v219, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v221, v222, 250);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 7:
            -[PLBBMav13HwMsgParser setRfData1xEVDO:](self, "setRfData1xEVDO:", v16);
            v150 += 256;
            v16 += 256;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v223 = objc_opt_class();
            v343[0] = MEMORY[0x1E0C809B0];
            v343[1] = 3221225472;
            v343[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_437;
            v343[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v343[4] = v223;
            v224 = v343;
            if (qword_1ED8872B8 != -1)
              dispatch_once(&qword_1ED8872B8, v224);

            if (!byte_1ED88718B)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 256);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v225 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v226 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v226, "lastPathComponent");
            v227 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v228 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v225, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v227, v228, 256);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 8:
            -[PLBBMav13HwMsgParser setRfDataGSM:](self, "setRfDataGSM:", v16);
            v150 += 256;
            v16 += 256;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v229 = objc_opt_class();
            v342[0] = MEMORY[0x1E0C809B0];
            v342[1] = 3221225472;
            v342[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_440;
            v342[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v342[4] = v229;
            v230 = v342;
            if (qword_1ED8872C0 != -1)
              dispatch_once(&qword_1ED8872C0, v230);

            if (!byte_1ED88718C)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 256);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v231 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v232 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v232, "lastPathComponent");
            v233 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v234 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v231, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v233, v234, 262);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 9:
            -[PLBBMav13HwMsgParser setRfDataWCDMA:](self, "setRfDataWCDMA:", v16);
            v150 += 208;
            v16 += 208;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v235 = objc_opt_class();
            v341[0] = MEMORY[0x1E0C809B0];
            v341[1] = 3221225472;
            v341[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_443;
            v341[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v341[4] = v235;
            v236 = v341;
            if (qword_1ED8872C8 != -1)
              dispatch_once(&qword_1ED8872C8, v236);

            if (!byte_1ED88718D)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 208);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v237 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v238 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v238, "lastPathComponent");
            v239 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v240 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v237, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v239, v240, 268);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 10:
            -[PLBBMav13HwMsgParser setRfDataLTE:](self, "setRfDataLTE:", v16);
            v150 += 256;
            v16 += 256;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v241 = objc_opt_class();
            v340[0] = MEMORY[0x1E0C809B0];
            v340[1] = 3221225472;
            v340[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_446;
            v340[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v340[4] = v241;
            v242 = v340;
            if (qword_1ED8872D0 != -1)
              dispatch_once(&qword_1ED8872D0, v242);

            if (!byte_1ED88718E)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 256);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v243 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v244 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v244, "lastPathComponent");
            v245 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v246 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v243, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v245, v246, 274);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 11:
            -[PLBBMav13HwMsgParser setRfDataTDS:](self, "setRfDataTDS:", v16);
            v150 += 256;
            v16 += 256;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v247 = objc_opt_class();
            v339[0] = MEMORY[0x1E0C809B0];
            v339[1] = 3221225472;
            v339[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_449;
            v339[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v339[4] = v247;
            v248 = v339;
            if (qword_1ED8872D8 != -1)
              dispatch_once(&qword_1ED8872D8, v248);

            if (!byte_1ED88718F)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 256);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v249 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v250 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v250, "lastPathComponent");
            v251 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v252 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v249, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v251, v252, 280);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 12:
            -[PLBBMav13HwMsgParser setRfEnhLTE:](self, "setRfEnhLTE:", v16);
            v150 += 576;
            v16 += 576;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v253 = objc_opt_class();
            v334[0] = MEMORY[0x1E0C809B0];
            v334[1] = 3221225472;
            v334[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_464;
            v334[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v334[4] = v253;
            v254 = v334;
            if (qword_1ED887300 != -1)
              dispatch_once(&qword_1ED887300, v254);

            if (!byte_1ED887194)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 576);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v255 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v256, "lastPathComponent");
            v257 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v258 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v255, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v257, v258, 310);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 13:
            -[PLBBMav13HwMsgParser setRfEnhWCDMA:](self, "setRfEnhWCDMA:", v16);
            v150 += 176;
            v16 += 176;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v259 = objc_opt_class();
            v335[0] = MEMORY[0x1E0C809B0];
            v335[1] = 3221225472;
            v335[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_461;
            v335[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v335[4] = v259;
            v260 = v335;
            if (qword_1ED8872F8 != -1)
              dispatch_once(&qword_1ED8872F8, v260);

            if (!byte_1ED887193)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 176);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v261 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v262 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v262, "lastPathComponent");
            v263 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v264 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v261, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v263, v264, 304);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 14:
            -[PLBBMav13HwMsgParser setRfEnhGSM:](self, "setRfEnhGSM:", v16);
            v150 += 20;
            v16 += 20;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v265 = objc_opt_class();
            v336[0] = MEMORY[0x1E0C809B0];
            v336[1] = 3221225472;
            v336[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_458;
            v336[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v336[4] = v265;
            v266 = v336;
            if (qword_1ED8872F0 != -1)
              dispatch_once(&qword_1ED8872F0, v266);

            if (!byte_1ED887192)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 20);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v267 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v268 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v268, "lastPathComponent");
            v269 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v270 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v267, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v269, v270, 298);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 15:
            -[PLBBMav13HwMsgParser setRfEnhTDS:](self, "setRfEnhTDS:", v16);
            v150 += 48;
            v16 += 48;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v271 = objc_opt_class();
            v333[0] = MEMORY[0x1E0C809B0];
            v333[1] = 3221225472;
            v333[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_467;
            v333[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v333[4] = v271;
            v272 = v333;
            if (qword_1ED887308 != -1)
              dispatch_once(&qword_1ED887308, v272);

            if (!byte_1ED887195)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 48);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v273 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v274 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v274, "lastPathComponent");
            v275 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v276 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v273, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v275, v276, 316);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 16:
            -[PLBBMav13HwMsgParser setRfEnhC2K:](self, "setRfEnhC2K:", v16);
            v150 += 40;
            v16 += 40;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v277 = objc_opt_class();
            v338[0] = MEMORY[0x1E0C809B0];
            v338[1] = 3221225472;
            v338[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_452;
            v338[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v338[4] = v277;
            v278 = v338;
            if (qword_1ED8872E0 != -1)
              dispatch_once(&qword_1ED8872E0, v278);

            if (!byte_1ED887190)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 40);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v279 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v280 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v280, "lastPathComponent");
            v281 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v282 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v279, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v281, v282, 286);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              goto LABEL_264;
            goto LABEL_265;
          case 17:
            -[PLBBMav13HwMsgParser setRfEnh1xEVDO:](self, "setRfEnh1xEVDO:", v16);
            v150 += 32;
            v16 += 32;
            if (!objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              break;
            v283 = objc_opt_class();
            v337[0] = MEMORY[0x1E0C809B0];
            v337[1] = 3221225472;
            v337[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_455;
            v337[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v337[4] = v283;
            v284 = v337;
            if (qword_1ED8872E8 != -1)
              dispatch_once(&qword_1ED8872E8, v284);

            if (!byte_1ED887191)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 32);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v285 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
            v286 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v286, "lastPathComponent");
            v287 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
            v288 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v285, "logMessage:fromFile:fromFunction:fromLineNumber:", v181, v287, v288, 292);

            PLLogCommon();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
            {
LABEL_264:
              *(_DWORD *)buf = 138412290;
              v372 = v181;
              _os_log_debug_impl(&dword_1CAF47000, v186, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
LABEL_265:

            v7 = 0x1E0D7F000;
            break;
          case 18:
            -[PLBBMav13HwMsgParser setRfEnhOOS:](self, "setRfEnhOOS:", v16);
            v150 += 156;
            v16 += 156;
            if (objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
            {
              v289 = objc_opt_class();
              v332[0] = MEMORY[0x1E0C809B0];
              v332[1] = 3221225472;
              v332[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_470;
              v332[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v332[4] = v289;
              v290 = v332;
              if (qword_1ED887310 != -1)
                dispatch_once(&qword_1ED887310, v290);

              if (byte_1ED887196)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 156);
                v291 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v292 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
                v293 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v293, "lastPathComponent");
                v294 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
                v295 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v292, "logMessage:fromFile:fromFunction:fromLineNumber:", v291, v294, v295, 322);

                PLLogCommon();
                v296 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v296, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v372 = v291;
                  _os_log_debug_impl(&dword_1CAF47000, v296, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

              }
            }
            goto LABEL_275;
          default:
            break;
        }
      }
      v167 = (v167 + 1);
    }
    while ((_DWORD)v167 != 19);
LABEL_275:
    if ((objc_msgSend(*(id *)(v7 + 4000), "debugEnabled") & 1) != 0)
    {
      v297 = objc_opt_class();
      v331[0] = MEMORY[0x1E0C809B0];
      v331[1] = 3221225472;
      v331[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_473;
      v331[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v331[4] = v297;
      v298 = v331;
      if (qword_1ED887318 != -1)
        dispatch_once(&qword_1ED887318, v298);

      if (byte_1ED887197)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("End of Proto, Rf, Enh data at offset %llu"), v150);
        v299 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v300 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v301 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "lastPathComponent");
        v302 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser parseData:]");
        v303 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v300, "logMessage:fromFile:fromFunction:fromLineNumber:", v299, v302, v303, 328);

        PLLogCommon();
        v304 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v304, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v299;
          _os_log_debug_impl(&dword_1CAF47000, v304, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }

  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 7)
  {
    -[PLMav7BasebandHardwareMessage setApps_clock_duration_mask:](self, "setApps_clock_duration_mask:", v16);
    v305 = v16 + 16;
    v306 = -[PLBBMav13HwMsgParser GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage apps_clock_duration_mask](self, "apps_clock_duration_mask"));
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMav7BasebandHardwareMessage setApps_clock_duration:](self, "setApps_clock_duration:", v307);

    -[PLBBMav13HwMsgParser SetClocks:oftype:withData:](self, "SetClocks:oftype:withData:", -[PLMav7BasebandHardwareMessage apps_clock_duration_mask](self, "apps_clock_duration_mask"), 0, v305);
    v308 = &v305[4 * v306];
    -[PLMav7BasebandHardwareMessage setMpss_clock_duration_mask:](self, "setMpss_clock_duration_mask:", v308);
    v308 += 16;
    v309 = -[PLBBMav13HwMsgParser GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage mpss_clock_duration_mask](self, "mpss_clock_duration_mask"));
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMav7BasebandHardwareMessage setMpss_clock_duration:](self, "setMpss_clock_duration:", v310);

    -[PLBBMav13HwMsgParser SetClocks:oftype:withData:](self, "SetClocks:oftype:withData:", -[PLMav7BasebandHardwareMessage mpss_clock_duration_mask](self, "mpss_clock_duration_mask"), 1, v308);
    v16 = &v308[4 * v309];
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 8)
  {
    -[PLMav7BasebandHardwareMessage setApps_clock_count_mask:](self, "setApps_clock_count_mask:", v16);
    v311 = (uint64_t)&v16[4
                       * -[PLBBMav13HwMsgParser GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage apps_clock_count_mask](self, "apps_clock_count_mask"))+ 16];
    -[PLMav7BasebandHardwareMessage setMpss_clock_count_mask:](self, "setMpss_clock_count_mask:", v311);
    v312 = v311
         + 4
         * -[PLBBMav13HwMsgParser GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage mpss_clock_count_mask](self, "mpss_clock_count_mask"));
    -[PLMav7BasebandHardwareMessage setHsic:](self, "setHsic:", v312 + 16);
    v16 = (unsigned __int8 *)(v312 + 48);
  }
  v313 = v326;
  v314 = objc_retainAutorelease(v325);
  v315 = v16;
  v316 = (unint64_t)&v16[-objc_msgSend(v314, "bytes")];
  v317 = objc_msgSend(v314, "length");
  if (v316 > v317)
  {
    PLLogCommon();
    v318 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v318, OS_LOG_TYPE_ERROR))
    {
      v320 = objc_retainAutorelease(v314);
      v321 = &v315[-objc_msgSend(v320, "bytes")];
      v322 = v320;
      v313 = v326;
      v323 = objc_msgSend(v322, "length");
      *(_DWORD *)buf = 134218498;
      v372 = v321;
      v373 = 2048;
      v374 = v323;
      v375 = 2080;
      v376 = "-[PLBBMav13HwMsgParser parseData:]";
      _os_log_error_impl(&dword_1CAF47000, v318, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", buf, 0x20u);
    }

  }
  return v316 <= v317;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_112 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_315(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887171 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_320(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887172 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_325(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887173 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_330(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887174 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_335(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887175 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_340(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887176 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_345(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887177 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_350(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887178 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_355(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887179 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_360(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88717A = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_365(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88717B = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_370(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88717C = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_375(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88717D = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_380(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88717E = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_385(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88717F = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_390(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887180 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_397(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887181 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_402(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887182 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_408(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887183 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_414(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887184 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_419(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887185 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_422(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887186 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_425(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887187 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_428(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887188 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_431(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887189 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_434(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88718A = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_437(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88718B = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_440(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88718C = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_443(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88718D = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_446(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88718E = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_449(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88718F = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_452(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887190 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_455(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887191 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_458(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887192 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_461(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887193 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_464(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887194 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_467(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887195 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_470(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887196 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_473(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887197 = result;
  return result;
}

- (void)logWithLogger:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  PLBBMavLogMsg *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  _QWORD *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  _QWORD *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  _QWORD *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  _QWORD *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  uint64_t v76;
  _QWORD *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  int v84;
  uint64_t v85;
  _QWORD *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  uint64_t v93;
  _QWORD *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  uint64_t v101;
  _QWORD *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  NSObject *v108;
  uint64_t v109;
  _QWORD *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  NSObject *v116;
  uint64_t v117;
  _QWORD *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  NSObject *v124;
  uint64_t v125;
  _QWORD *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  NSObject *v132;
  uint64_t v133;
  _QWORD *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  NSObject *v140;
  uint64_t v141;
  _QWORD *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  NSObject *v148;
  uint64_t v149;
  _QWORD *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  NSObject *v156;
  uint64_t v157;
  _QWORD *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  NSObject *v164;
  uint64_t v165;
  _QWORD *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  NSObject *v172;
  uint64_t v173;
  _QWORD *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  NSObject *v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  _QWORD v186[5];
  _QWORD v187[5];
  _QWORD v188[5];
  _QWORD v189[5];
  _QWORD v190[5];
  _QWORD v191[5];
  _QWORD v192[5];
  _QWORD v193[5];
  _QWORD v194[5];
  _QWORD v195[5];
  _QWORD v196[5];
  _QWORD v197[5];
  _QWORD v198[5];
  _QWORD v199[5];
  _QWORD v200[5];
  _QWORD v201[5];
  _QWORD v202[5];
  _QWORD v203[5];
  _QWORD v204[5];
  _QWORD block[5];
  objc_super v206;
  _QWORD v207[5];
  uint8_t buf[4];
  void *v209;
  uint64_t v210;

  v210 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0x1E0D7F000uLL;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    v207[0] = MEMORY[0x1E0C809B0];
    v207[1] = 3221225472;
    v207[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke;
    v207[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v207[4] = v6;
    v7 = v207;
    if (qword_1ED887320 != -1)
      dispatch_once(&qword_1ED887320, v7);

    if (byte_1ED887198)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logWithLogger:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 376);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v209 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v206.receiver = self;
  v206.super_class = (Class)PLBBMav13HwMsgParser;
  -[PLBasebandHardwareMessage logRawWithLogger:](&v206, sel_logRawWithLogger_, v4);
  v14 = objc_alloc_init(PLBBMavLogMsg);
  -[PLBasebandMessage agent](self, "agent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage setAgent:](v14, "setAgent:", v15);

  -[PLBBMavLogMsg setError:](v14, "setError:", &stru_1E8587D00);
  -[PLBasebandMessage seqNum](self, "seqNum");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage date](self, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage timeCal](self, "timeCal");
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v14, "setHeaderWithSeqNum:andDate:andTimeCal:", v16, v17);

  if (-[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev") == 2)
  {
    -[PLMav4BasebandHardwareMessage logHeaderWithLogger:](self, "logHeaderWithLogger:", v14);
    -[PLBBMav13HwMsgParser logRPMWithLogger:](self, "logRPMWithLogger:", v14);
    -[PLBBMav13HwMsgParser logAppsPerfWithLogger:](self, "logAppsPerfWithLogger:", v14);
    -[PLBBMav13HwMsgParser logMPSSWithLogger:](self, "logMPSSWithLogger:", v14);
    -[PLBBMav13HwMsgParser logLPASSWithLogger:](self, "logLPASSWithLogger:", v14);
    -[PLBBMav13HwMsgParser logPeripheralsWithLogger:](self, "logPeripheralsWithLogger:", v14);
    -[PLBBMav13HwMsgParser logPcieWithLogger:](self, "logPcieWithLogger:", v14);
    v18 = (void *)objc_opt_new();
    if ((*-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") & 1) != 0
      && -[PLBBMav13HwMsgParser protoStateC2K](self, "protoStateC2K"))
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v19 = objc_opt_class();
        v204[0] = MEMORY[0x1E0C809B0];
        v204[1] = 3221225472;
        v204[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_495;
        v204[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v204[4] = v19;
        v20 = v204;
        if (qword_1ED887330 != -1)
          dispatch_once(&qword_1ED887330, v20);

        if (byte_1ED88719A)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateC2K is valid"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 414);

          PLLogCommon();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v21;
            _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000;
        }
      }
      -[PLBBMav13HwMsgParser logProtocolWithLogger:container:state:forRAT:](self, "logProtocolWithLogger:container:state:forRAT:", v14, v18, -[PLBBMav13HwMsgParser protoStateC2K](self, "protoStateC2K"), 0);
      v27 = 0;
      v28 = 1;
    }
    else
    {
      v28 = 0;
      v27 = 6;
    }
    if ((*-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") & 2) != 0
      && -[PLBBMav13HwMsgParser protoStateHDR](self, "protoStateHDR"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v36 = objc_opt_class();
        v203[0] = MEMORY[0x1E0C809B0];
        v203[1] = 3221225472;
        v203[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_500;
        v203[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v203[4] = v36;
        v37 = v203;
        if (qword_1ED887338 != -1)
          dispatch_once(&qword_1ED887338, v37);

        if (byte_1ED88719B)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateHDR is valid"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "lastPathComponent");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v38, v41, v42, 425);

          PLLogCommon();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v38;
            _os_log_debug_impl(&dword_1CAF47000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      v28 = 1;
      -[PLBBMav13HwMsgParser logProtocolWithLogger:container:state:forRAT:](self, "logProtocolWithLogger:container:state:forRAT:", v14, v18, -[PLBBMav13HwMsgParser protoStateHDR](self, "protoStateHDR"), 1);
      v27 = 1;
    }
    if ((*-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") & 4) != 0
      && -[PLBBMav13HwMsgParser protoStateGSM](self, "protoStateGSM"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v44 = objc_opt_class();
        v202[0] = MEMORY[0x1E0C809B0];
        v202[1] = 3221225472;
        v202[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_505;
        v202[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v202[4] = v44;
        v45 = v202;
        if (qword_1ED887340 != -1)
          dispatch_once(&qword_1ED887340, v45);

        if (byte_1ED88719C)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateGSM is valid"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "lastPathComponent");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "logMessage:fromFile:fromFunction:fromLineNumber:", v46, v49, v50, 436);

          PLLogCommon();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v46;
            _os_log_debug_impl(&dword_1CAF47000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      v27 = 2;
      -[PLBBMav13HwMsgParser logProtocolWithLogger:container:state:forRAT:](self, "logProtocolWithLogger:container:state:forRAT:", v14, v18, -[PLBBMav13HwMsgParser protoStateGSM](self, "protoStateGSM"), 2);
      v28 = 1;
    }
    if ((*-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") & 8) != 0
      && -[PLBBMav13HwMsgParser protoStateWCDMA](self, "protoStateWCDMA"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v52 = objc_opt_class();
        v201[0] = MEMORY[0x1E0C809B0];
        v201[1] = 3221225472;
        v201[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_510;
        v201[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v201[4] = v52;
        v53 = v201;
        if (qword_1ED887348 != -1)
          dispatch_once(&qword_1ED887348, v53);

        if (byte_1ED88719D)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateWCDMA is valid"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "lastPathComponent");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "logMessage:fromFile:fromFunction:fromLineNumber:", v54, v57, v58, 447);

          PLLogCommon();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v54;
            _os_log_debug_impl(&dword_1CAF47000, v59, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      v27 = 3;
      -[PLBBMav13HwMsgParser logProtocolWithLogger:container:state:forRAT:](self, "logProtocolWithLogger:container:state:forRAT:", v14, v18, -[PLBBMav13HwMsgParser protoStateWCDMA](self, "protoStateWCDMA"), 3);
      v28 = 1;
    }
    if ((*-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") & 0x10) != 0
      && -[PLBBMav13HwMsgParser protoStateLTE](self, "protoStateLTE"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v60 = objc_opt_class();
        v200[0] = MEMORY[0x1E0C809B0];
        v200[1] = 3221225472;
        v200[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_515;
        v200[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v200[4] = v60;
        v61 = v200;
        if (qword_1ED887350 != -1)
          dispatch_once(&qword_1ED887350, v61);

        if (byte_1ED88719E)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateLTE is valid"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "lastPathComponent");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "logMessage:fromFile:fromFunction:fromLineNumber:", v62, v65, v66, 458);

          PLLogCommon();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v62;
            _os_log_debug_impl(&dword_1CAF47000, v67, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      v27 = 4;
      -[PLBBMav13HwMsgParser logProtocolWithLogger:container:state:forRAT:](self, "logProtocolWithLogger:container:state:forRAT:", v14, v18, -[PLBBMav13HwMsgParser protoStateLTE](self, "protoStateLTE"), 4);
      v28 = 1;
    }
    if ((*-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") & 0x20) != 0
      && -[PLBBMav13HwMsgParser protoStateTDS](self, "protoStateTDS"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v68 = objc_opt_class();
        v199[0] = MEMORY[0x1E0C809B0];
        v199[1] = 3221225472;
        v199[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_520;
        v199[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v199[4] = v68;
        v69 = v199;
        if (qword_1ED887358 != -1)
          dispatch_once(&qword_1ED887358, v69);

        if (byte_1ED88719F)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateTDS is valid"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "lastPathComponent");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "logMessage:fromFile:fromFunction:fromLineNumber:", v70, v73, v74, 469);

          PLLogCommon();
          v75 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v70;
            _os_log_debug_impl(&dword_1CAF47000, v75, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      v27 = 5;
      -[PLBBMav13HwMsgParser logProtocolWithLogger:container:state:forRAT:](self, "logProtocolWithLogger:container:state:forRAT:", v14, v18, -[PLBBMav13HwMsgParser protoStateTDS](self, "protoStateTDS"), 5);
      v28 = 1;
    }
    -[PLBBMavLogMsg setProtocolStateHistDict:](v14, "setProtocolStateHistDict:", v18);
    -[PLMav7BasebandHardwareMessage logProtocolActiveWithLogger:](self, "logProtocolActiveWithLogger:", v14);
    -[PLBBMav13HwMsgParser logSleepVetoWithLogger:](self, "logSleepVetoWithLogger:", v14);
    if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 7)
    {
      -[PLMav7BasebandHardwareMessage logClockWithLogger:](self, "logClockWithLogger:", v14);
      -[PLMav7BasebandHardwareMessage logHSICWithLogger:](self, "logHSICWithLogger:", v14);
    }
    -[PLBBMavLogMsg addToGroupPLBBMav13HwOther](v14, "addToGroupPLBBMav13HwOther");
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 4) != 0
      && -[PLBBMav13HwMsgParser rfDataLTE](self, "rfDataLTE"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v76 = objc_opt_class();
        v198[0] = MEMORY[0x1E0C809B0];
        v198[1] = 3221225472;
        v198[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_525;
        v198[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v198[4] = v76;
        v77 = v198;
        if (qword_1ED887360 != -1)
          dispatch_once(&qword_1ED887360, v77);

        if (byte_1ED8871A0)
        {
          v181 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataLTE is valid"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "lastPathComponent");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "logMessage:fromFile:fromFunction:fromLineNumber:", v78, v81, v82, 494);

          PLLogCommon();
          v83 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v78;
            _os_log_debug_impl(&dword_1CAF47000, v83, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v4 = v181;
          v5 = 0x1E0D7F000;
        }
      }
      -[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:](self, "logLegacyRFWithLogger:usingData:forRAT:", v14, -[PLBBMav13HwMsgParser rfDataLTE](self, "rfDataLTE"), 4);
      v84 = 1;
    }
    else
    {
      v84 = 0;
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 2) != 0
      && -[PLBBMav13HwMsgParser rfDataWCDMA](self, "rfDataWCDMA"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v85 = objc_opt_class();
        v197[0] = MEMORY[0x1E0C809B0];
        v197[1] = 3221225472;
        v197[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_530;
        v197[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v197[4] = v85;
        v86 = v197;
        if (qword_1ED887368 != -1)
          dispatch_once(&qword_1ED887368, v86);

        if (byte_1ED8871A1)
        {
          v182 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataWCDMA is valid"));
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "lastPathComponent");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "logMessage:fromFile:fromFunction:fromLineNumber:", v87, v90, v91, 503);

          PLLogCommon();
          v92 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v87;
            _os_log_debug_impl(&dword_1CAF47000, v92, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v4 = v182;
          v5 = 0x1E0D7F000uLL;
        }
      }
      -[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:](self, "logLegacyRFWithLogger:usingData:forRAT:", v14, -[PLBBMav13HwMsgParser rfDataWCDMA](self, "rfDataWCDMA"), 3);
      v84 = 1;
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 1) != 0
      && -[PLBBMav13HwMsgParser rfDataGSM](self, "rfDataGSM"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v93 = objc_opt_class();
        v196[0] = MEMORY[0x1E0C809B0];
        v196[1] = 3221225472;
        v196[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_535;
        v196[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v196[4] = v93;
        v94 = v196;
        if (qword_1ED887370 != -1)
          dispatch_once(&qword_1ED887370, v94);

        if (byte_1ED8871A2)
        {
          v183 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataGSM is valid"));
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "lastPathComponent");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "logMessage:fromFile:fromFunction:fromLineNumber:", v95, v98, v99, 512);

          PLLogCommon();
          v100 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v95;
            _os_log_debug_impl(&dword_1CAF47000, v100, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v4 = v183;
          v5 = 0x1E0D7F000uLL;
        }
      }
      -[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:](self, "logLegacyRFWithLogger:usingData:forRAT:", v14, -[PLBBMav13HwMsgParser rfDataGSM](self, "rfDataGSM"), 2);
      v84 = 1;
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 8) != 0
      && -[PLBBMav13HwMsgParser rfDataTDS](self, "rfDataTDS"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v101 = objc_opt_class();
        v195[0] = MEMORY[0x1E0C809B0];
        v195[1] = 3221225472;
        v195[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_540;
        v195[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v195[4] = v101;
        v102 = v195;
        if (qword_1ED887378 != -1)
          dispatch_once(&qword_1ED887378, v102);

        if (byte_1ED8871A3)
        {
          v184 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataTDS is valid"));
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "lastPathComponent");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "logMessage:fromFile:fromFunction:fromLineNumber:", v103, v106, v107, 521);

          PLLogCommon();
          v108 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v103;
            _os_log_debug_impl(&dword_1CAF47000, v108, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v4 = v184;
          v5 = 0x1E0D7F000uLL;
        }
      }
      -[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:](self, "logLegacyRFWithLogger:usingData:forRAT:", v14, -[PLBBMav13HwMsgParser rfDataTDS](self, "rfDataTDS"), 5);
      v84 = 1;
    }
    if ((*-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") & 0x40) != 0
      && -[PLBBMav13HwMsgParser rfDataC2K](self, "rfDataC2K"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v109 = objc_opt_class();
        v194[0] = MEMORY[0x1E0C809B0];
        v194[1] = 3221225472;
        v194[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_545;
        v194[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v194[4] = v109;
        v110 = v194;
        if (qword_1ED887380 != -1)
          dispatch_once(&qword_1ED887380, v110);

        if (byte_1ED8871A4)
        {
          v185 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataTDS is valid"));
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "lastPathComponent");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "logMessage:fromFile:fromFunction:fromLineNumber:", v111, v114, v115, 530);

          PLLogCommon();
          v116 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v111;
            _os_log_debug_impl(&dword_1CAF47000, v116, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v4 = v185;
          v5 = 0x1E0D7F000uLL;
        }
      }
      -[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:](self, "logLegacyRFWithLogger:usingData:forRAT:", v14, -[PLBBMav13HwMsgParser rfDataC2K](self, "rfDataC2K"), 0);
      v84 = 1;
    }
    if (*-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") < 0
      && -[PLBBMav13HwMsgParser rfData1xEVDO](self, "rfData1xEVDO"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v117 = objc_opt_class();
        v193[0] = MEMORY[0x1E0C809B0];
        v193[1] = 3221225472;
        v193[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_548;
        v193[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v193[4] = v117;
        v118 = v193;
        if (qword_1ED887388 != -1)
          dispatch_once(&qword_1ED887388, v118);

        if (byte_1ED8871A5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataTDS is valid"));
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "lastPathComponent");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "logMessage:fromFile:fromFunction:fromLineNumber:", v119, v122, v123, 539);

          PLLogCommon();
          v124 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v119;
            _os_log_debug_impl(&dword_1CAF47000, v124, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000;
        }
      }
      -[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:](self, "logLegacyRFWithLogger:usingData:forRAT:", v14, -[PLBBMav13HwMsgParser rfData1xEVDO](self, "rfData1xEVDO"), 1);
    }
    else if (((v84 | v28 ^ 1) & 1) == 0)
    {
      -[PLBBMav13HwMsgParser logProtocolOnlyWithLogger:forRAT:](self, "logProtocolOnlyWithLogger:forRAT:", v14, v27);
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 0x10) != 0
      && -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v125 = objc_opt_class();
        v192[0] = MEMORY[0x1E0C809B0];
        v192[1] = 3221225472;
        v192[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_551;
        v192[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v192[4] = v125;
        v126 = v192;
        if (qword_1ED887390 != -1)
          dispatch_once(&qword_1ED887390, v126);

        if (byte_1ED8871A6)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhLTE is valid"));
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "lastPathComponent");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "logMessage:fromFile:fromFunction:fromLineNumber:", v127, v130, v131, 554);

          PLLogCommon();
          v132 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v127;
            _os_log_debug_impl(&dword_1CAF47000, v132, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      -[PLBBMav13HwMsgParser logHwRFEnhLTEWithLogger:](self, "logHwRFEnhLTEWithLogger:", v14);
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 0x20) != 0
      && -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v133 = objc_opt_class();
        v191[0] = MEMORY[0x1E0C809B0];
        v191[1] = 3221225472;
        v191[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_556;
        v191[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v191[4] = v133;
        v134 = v191;
        if (qword_1ED887398 != -1)
          dispatch_once(&qword_1ED887398, v134);

        if (byte_1ED8871A7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhWCDMA is valid"));
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          v136 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "lastPathComponent");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "logMessage:fromFile:fromFunction:fromLineNumber:", v135, v138, v139, 560);

          PLLogCommon();
          v140 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v135;
            _os_log_debug_impl(&dword_1CAF47000, v140, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      -[PLBBMav13HwMsgParser logHwRFEnhWCDMAWithLogger:](self, "logHwRFEnhWCDMAWithLogger:", v14);
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 0x40) != 0
      && -[PLBBMav13HwMsgParser rfEnhGSM](self, "rfEnhGSM"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v141 = objc_opt_class();
        v190[0] = MEMORY[0x1E0C809B0];
        v190[1] = 3221225472;
        v190[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_561;
        v190[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v190[4] = v141;
        v142 = v190;
        if (qword_1ED8873A0 != -1)
          dispatch_once(&qword_1ED8873A0, v142);

        if (byte_1ED8871A8)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhGSM is valid"));
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v144 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "lastPathComponent");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "logMessage:fromFile:fromFunction:fromLineNumber:", v143, v146, v147, 566);

          PLLogCommon();
          v148 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v148, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v143;
            _os_log_debug_impl(&dword_1CAF47000, v148, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      -[PLBBMav13HwMsgParser logHwRFGSMWithLogger:](self, "logHwRFGSMWithLogger:", v14);
    }
    if (-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] < 0
      && -[PLBBMav13HwMsgParser rfEnhTDS](self, "rfEnhTDS"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v149 = objc_opt_class();
        v189[0] = MEMORY[0x1E0C809B0];
        v189[1] = 3221225472;
        v189[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_566;
        v189[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v189[4] = v149;
        v150 = v189;
        if (qword_1ED8873A8 != -1)
          dispatch_once(&qword_1ED8873A8, v150);

        if (byte_1ED8871A9)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhTDS is valid"));
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          v152 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "lastPathComponent");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "logMessage:fromFile:fromFunction:fromLineNumber:", v151, v154, v155, 572);

          PLLogCommon();
          v156 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v156, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v151;
            _os_log_debug_impl(&dword_1CAF47000, v156, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      -[PLBBMav13HwMsgParser logHwRFTDSWithLogger:](self, "logHwRFTDSWithLogger:", v14);
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[2] & 1) != 0
      && -[PLBBMav13HwMsgParser rfEnhC2K](self, "rfEnhC2K"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v157 = objc_opt_class();
        v188[0] = MEMORY[0x1E0C809B0];
        v188[1] = 3221225472;
        v188[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_571;
        v188[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v188[4] = v157;
        v158 = v188;
        if (qword_1ED8873B0 != -1)
          dispatch_once(&qword_1ED8873B0, v158);

        if (byte_1ED8871AA)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnh1x is valid"));
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          v160 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v161, "lastPathComponent");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v160, "logMessage:fromFile:fromFunction:fromLineNumber:", v159, v162, v163, 578);

          PLLogCommon();
          v164 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v164, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v159;
            _os_log_debug_impl(&dword_1CAF47000, v164, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      -[PLBBMav13HwMsgParser logHwRF1xWithLogger:](self, "logHwRF1xWithLogger:", v14);
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[2] & 2) != 0
      && -[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v165 = objc_opt_class();
        v187[0] = MEMORY[0x1E0C809B0];
        v187[1] = 3221225472;
        v187[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_576;
        v187[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v187[4] = v165;
        v166 = v187;
        if (qword_1ED8873B8 != -1)
          dispatch_once(&qword_1ED8873B8, v166);

        if (byte_1ED8871AB)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhHDR is valid"));
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          v168 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v169, "lastPathComponent");
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v168, "logMessage:fromFile:fromFunction:fromLineNumber:", v167, v170, v171, 584);

          PLLogCommon();
          v172 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v172, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v167;
            _os_log_debug_impl(&dword_1CAF47000, v172, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      -[PLBBMav13HwMsgParser logHwRFHDRWithLogger:](self, "logHwRFHDRWithLogger:", v14);
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[2] & 4) != 0
      && -[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v173 = objc_opt_class();
        v186[0] = MEMORY[0x1E0C809B0];
        v186[1] = 3221225472;
        v186[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_581;
        v186[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v186[4] = v173;
        v174 = v186;
        if (qword_1ED8873C0 != -1)
          dispatch_once(&qword_1ED8873C0, v174);

        if (byte_1ED8871AC)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhOOS is valid"));
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v176 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v177, "lastPathComponent");
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "logMessage:fromFile:fromFunction:fromLineNumber:", v175, v178, v179, 590);

          PLLogCommon();
          v180 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v175;
            _os_log_debug_impl(&dword_1CAF47000, v180, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      -[PLBBMav13HwMsgParser logHwRFOOSWithLogger:](self, "logHwRFOOSWithLogger:", v14);
    }
    -[PLBBMavLogMsg logEventBackwardGrpEntriesBBMav13Hw](v14, "logEventBackwardGrpEntriesBBMav13Hw");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendFormat:", CFSTR("Version Mismatch: Baseband_sw_rev=%d Powerlog_supported_sw_rev=%d"), -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"), 2);
    -[PLBBMavLogMsg setError:](v14, "setError:", v18);
    -[PLBBMavLogMsg setType:](v14, "setType:", CFSTR("BB HW Error"));
    -[PLBBMavLogMsg logEventBackwardMavBBHwOther](v14, "logEventBackwardMavBBHwOther");
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v29 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_489;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v29;
      if (qword_1ED887328 != -1)
        dispatch_once(&qword_1ED887328, block);
      if (byte_1ED887199)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SW version mismatch, cannot process, returning"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "lastPathComponent");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logWithLogger:]");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 394);

        PLLogCommon();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v209 = v30;
          _os_log_debug_impl(&dword_1CAF47000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }

}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887198 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_489(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887199 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_495(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88719A = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_500(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88719B = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_505(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88719C = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_510(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88719D = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_515(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88719E = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_520(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88719F = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_525(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871A0 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_530(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871A1 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_535(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871A2 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_540(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871A3 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_545(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871A4 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_548(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871A5 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_551(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871A6 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_556(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871A7 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_561(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871A8 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_566(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871A9 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_571(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871AA = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_576(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871AB = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_581(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871AC = result;
  return result;
}

- (void)logPcieWithLogger:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __42__PLBBMav13HwMsgParser_logPcieWithLogger___block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v5;
    if (qword_1ED8873C8 != -1)
      dispatch_once(&qword_1ED8873C8, &block);
    if (byte_1ED8871AD)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logPcieWithLogger:]", block, v15, v16, v17, v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logPcieWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 600);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  if (-[PLBBMav13HwMsgParser pcieState](self, "pcieState"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser pcieState](self, "pcieState"), 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPcieStateHistogram:", v13);

  }
}

uint64_t __42__PLBBMav13HwMsgParser_logPcieWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871AD = result;
  return result;
}

- (void)logSleepVetoWithLogger:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLBBMav13HwMsgParser_logSleepVetoWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED8873D0 != -1)
      dispatch_once(&qword_1ED8873D0, block);
    if (byte_1ED8871AE)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logSleepVetoWithLogger:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logSleepVetoWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 612);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  if (!-[PLBBMav13HwMsgParser mcpmSleepVeto](self, "mcpmSleepVeto"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v23 = objc_opt_class();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __47__PLBBMav13HwMsgParser_logSleepVetoWithLogger___block_invoke_586;
      v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v40[4] = v23;
      if (qword_1ED8873D8 != -1)
        dispatch_once(&qword_1ED8873D8, v40);
      if (byte_1ED8871AF)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BB HW Sleep Veto is expected but not present or Mav16B"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logSleepVetoWithLogger:]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 621);

        PLLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v24;
          _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v30 = CFSTR("Error: BB HW Sleep Veto is expected but not present  or Mav16B. ");
    goto LABEL_33;
  }
  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser mcpmSleepVeto](self, "mcpmSleepVeto"), 13);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMcpmVetoNumHistogram:", v13);

  if (!-[PLMav7BasebandHardwareMessage npa_sleep_veto](self, "npa_sleep_veto"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v31 = objc_opt_class();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __47__PLBBMav13HwMsgParser_logSleepVetoWithLogger___block_invoke_593;
      v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v39[4] = v31;
      if (qword_1ED8873E0 != -1)
        dispatch_once(&qword_1ED8873E0, v39);
      if (byte_1ED8871B0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BB HW Sleep Veto is expected but not present"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "lastPathComponent");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logSleepVetoWithLogger:]");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 634);

        PLLogCommon();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v32;
          _os_log_debug_impl(&dword_1CAF47000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v30 = CFSTR("Error: BB HW Sleep Veto is expected but not present. ");
LABEL_33:
    objc_msgSend(v12, "appendToError:", v30);
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)-[PLMav7BasebandHardwareMessage npa_sleep_veto](self, "npa_sleep_veto"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNpaVetoMask:", v14);

  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav7BasebandHardwareMessage npa_sleep_veto](self, "npa_sleep_veto") + 4, 24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNpaVetoClientNumHistogram:", v15);

  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled") & 1) != 0)
  {
    v16 = objc_opt_class();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __47__PLBBMav13HwMsgParser_logSleepVetoWithLogger___block_invoke_600;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = v16;
    if (qword_1ED8873E8 != -1)
      dispatch_once(&qword_1ED8873E8, v38);
    if (byte_1ED8871B1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW Sleep Veto"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logSleepVetoWithLogger:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 639);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v17;
        _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
LABEL_34:

}

uint64_t __47__PLBBMav13HwMsgParser_logSleepVetoWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871AE = result;
  return result;
}

uint64_t __47__PLBBMav13HwMsgParser_logSleepVetoWithLogger___block_invoke_586(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871AF = result;
  return result;
}

uint64_t __47__PLBBMav13HwMsgParser_logSleepVetoWithLogger___block_invoke_593(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871B0 = result;
  return result;
}

uint64_t __47__PLBBMav13HwMsgParser_logSleepVetoWithLogger___block_invoke_600(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871B1 = result;
  return result;
}

- (void)logRPMWithLogger:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__PLBBMav13HwMsgParser_logRPMWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED8873F0 != -1)
      dispatch_once(&qword_1ED8873F0, block);
    if (byte_1ED8871B2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logRPMWithLogger:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logRPMWithLogger:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 645);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v6 = MEMORY[0x1E0C809B0];
    }
  }
  v13 = v4;
  if (-[PLBBMav13HwMsgParser rpmData](self, "rpmData"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)-[PLBBMav13HwMsgParser rpmData](self, "rpmData")[8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRpmXOShutDuration:", v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)-[PLBBMav13HwMsgParser rpmData](self, "rpmData"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRpmXOShutCnt:", v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)-[PLBBMav13HwMsgParser rpmData](self, "rpmData")[16]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRpmVDDMinDuration:", v16);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rpmData](self, "rpmData")[4]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRpmVDDMinEnterCnt:", v17);

  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v31[0] = v6;
      v31[1] = 3221225472;
      v31[2] = __41__PLBBMav13HwMsgParser_logRPMWithLogger___block_invoke_605;
      v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v31[4] = objc_opt_class();
      if (qword_1ED8873F8 != -1)
        dispatch_once(&qword_1ED8873F8, v31);
      if (byte_1ED8871B3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RPM=<unknown>"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logRPMWithLogger:]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 660);

        PLLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v18;
          _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v13, "appendToError:", CFSTR("RPM=<unknown> "));
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v30[0] = v6;
    v30[1] = 3221225472;
    v30[2] = __41__PLBBMav13HwMsgParser_logRPMWithLogger___block_invoke_612;
    v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v30[4] = objc_opt_class();
    if (qword_1ED887400 != -1)
      dispatch_once(&qword_1ED887400, v30);
    if (byte_1ED8871B4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW RPM"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logRPMWithLogger:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 664);

      PLLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v24;
        _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __41__PLBBMav13HwMsgParser_logRPMWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871B2 = result;
  return result;
}

uint64_t __41__PLBBMav13HwMsgParser_logRPMWithLogger___block_invoke_605(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871B3 = result;
  return result;
}

uint64_t __41__PLBBMav13HwMsgParser_logRPMWithLogger___block_invoke_612(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871B4 = result;
  return result;
}

- (void)logAppsPerfWithLogger:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  __int16 *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  v7 = &word_1CB388000;
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED887408 != -1)
      dispatch_once(&qword_1ED887408, block);
    if (byte_1ED8871B5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logAppsPerfWithLogger:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logAppsPerfWithLogger:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 670);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v6 = MEMORY[0x1E0C809B0];
      v7 = &word_1CB388000;
    }
  }
  v14 = v4;
  if (-[PLBBMav13HwMsgParser appsPerf](self, "appsPerf"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser appsPerf](self, "appsPerf"), 6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAppsPerfStateCountHist:", v15);
LABEL_10:

    goto LABEL_18;
  }
  objc_msgSend(v14, "appendToError:", CFSTR("Perf_Level=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v48[0] = v6;
    v48[1] = 3221225472;
    v48[2] = __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke_619;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = objc_opt_class();
    if (qword_1ED887410 != -1)
      dispatch_once(&qword_1ED887410, v48);
    if (byte_1ED8871B6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Perf_Level=<unknown>"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logAppsPerfWithLogger:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 682);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v15;
        _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v7 = &word_1CB388000;
      goto LABEL_10;
    }
  }
LABEL_18:
  if (-[PLBBMav13HwMsgParser appsSleep](self, "appsSleep"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)-[PLBBMav13HwMsgParser appsSleep](self, "appsSleep")[4]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCxoShutDownDuration:", v21);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)-[PLBBMav13HwMsgParser appsSleep](self, "appsSleep"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCxoShutDownCount:", v22);

  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v23 = objc_opt_class();
      v47[0] = v6;
      v47[1] = *((_QWORD *)v7 + 166);
      v47[2] = __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke_624;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v23;
      if (qword_1ED887418 != -1)
        dispatch_once(&qword_1ED887418, v47);
      if (byte_1ED8871B7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Stats=<unknown>"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logAppsPerfWithLogger:]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 693);

        PLLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v24;
          _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v7 = &word_1CB388000;
      }
    }
    objc_msgSend(v14, "appendToError:", CFSTR("Sleep_Stats=<unknown> "));
  }
  if (-[PLBBMav13HwMsgParser appsSleepVeto](self, "appsSleepVeto"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser appsSleepVeto](self, "appsSleepVeto"), 5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAppsSleepVeto:", v30);

  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v31 = objc_opt_class();
      v46[0] = v6;
      v46[1] = *((_QWORD *)v7 + 166);
      v46[2] = __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke_631;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v31;
      if (qword_1ED887420 != -1)
        dispatch_once(&qword_1ED887420, v46);
      if (byte_1ED8871B8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Veto_Duration=<unknown>"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "lastPathComponent");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logAppsPerfWithLogger:]");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 705);

        PLLogCommon();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v32;
          _os_log_debug_impl(&dword_1CAF47000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v14, "appendToError:", CFSTR("Sleep_Veto_Duration=<unknown> "));
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v38 = objc_opt_class();
    v45[0] = v6;
    v45[1] = *((_QWORD *)v7 + 166);
    v45[2] = __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke_638;
    v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v45[4] = v38;
    if (qword_1ED887428 != -1)
      dispatch_once(&qword_1ED887428, v45);
    if (byte_1ED8871B9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW APPS"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "lastPathComponent");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logAppsPerfWithLogger:]");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v42, v43, 709);

      PLLogCommon();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v39;
        _os_log_debug_impl(&dword_1CAF47000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871B5 = result;
  return result;
}

uint64_t __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke_619(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871B6 = result;
  return result;
}

uint64_t __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke_624(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871B7 = result;
  return result;
}

uint64_t __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke_631(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871B8 = result;
  return result;
}

uint64_t __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke_638(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871B9 = result;
  return result;
}

- (void)logMPSSWithLogger:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  __int16 *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  v7 = &word_1CB388000;
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__PLBBMav13HwMsgParser_logMPSSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED887430 != -1)
      dispatch_once(&qword_1ED887430, block);
    if (byte_1ED8871BA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logMPSSWithLogger:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logMPSSWithLogger:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 714);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v6 = MEMORY[0x1E0C809B0];
      v7 = &word_1CB388000;
    }
  }
  v14 = v4;
  if (-[PLBBMav13HwMsgParser mpssSleep](self, "mpssSleep"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)-[PLBBMav13HwMsgParser mpssSleep](self, "mpssSleep")[4]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMpssCxoShutDownDuration:", v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)-[PLBBMav13HwMsgParser mpssSleep](self, "mpssSleep"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMpssCxoShutDownCount:", v16);

  }
  if (-[PLBBMav13HwMsgParser mpssSleepVeto](self, "mpssSleepVeto"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser mpssSleepVeto](self, "mpssSleepVeto"), 17);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMpssSleepVeto:", v17);
LABEL_12:

    goto LABEL_20;
  }
  objc_msgSend(v14, "appendToError:", CFSTR("Sleep_Veto=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v39[0] = v6;
    v39[1] = 3221225472;
    v39[2] = __42__PLBBMav13HwMsgParser_logMPSSWithLogger___block_invoke_645;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = objc_opt_class();
    if (qword_1ED887438 != -1)
      dispatch_once(&qword_1ED887438, v39);
    if (byte_1ED8871BB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Veto=<unknown>"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logMPSSWithLogger:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 731);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v17;
        _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v7 = &word_1CB388000;
      goto LABEL_12;
    }
  }
LABEL_20:
  if (-[PLBBMav13HwMsgParser qdspSpeed](self, "qdspSpeed"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser qdspSpeed](self, "qdspSpeed"), 12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setQdspConfigCount:", v23);
LABEL_22:

    goto LABEL_30;
  }
  objc_msgSend(v14, "appendToError:", CFSTR("Q6SW_Perf=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v24 = objc_opt_class();
    v38[0] = v6;
    v38[1] = *((_QWORD *)v7 + 166);
    v38[2] = __42__PLBBMav13HwMsgParser_logMPSSWithLogger___block_invoke_652;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = v24;
    if (qword_1ED887440 != -1)
      dispatch_once(&qword_1ED887440, v38);
    if (byte_1ED8871BC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Q6SW_Perf=<unknown>"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logMPSSWithLogger:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v27, v28, 744);

      PLLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v23;
        _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_22;
    }
  }
LABEL_30:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v30 = objc_opt_class();
    v37[0] = v6;
    v37[1] = *((_QWORD *)v7 + 166);
    v37[2] = __42__PLBBMav13HwMsgParser_logMPSSWithLogger___block_invoke_657;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v30;
    if (qword_1ED887448 != -1)
      dispatch_once(&qword_1ED887448, v37);
    if (byte_1ED8871BD)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW MPSS"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "lastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logMPSSWithLogger:]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 747);

      PLLogCommon();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v31;
        _os_log_debug_impl(&dword_1CAF47000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __42__PLBBMav13HwMsgParser_logMPSSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871BA = result;
  return result;
}

uint64_t __42__PLBBMav13HwMsgParser_logMPSSWithLogger___block_invoke_645(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871BB = result;
  return result;
}

uint64_t __42__PLBBMav13HwMsgParser_logMPSSWithLogger___block_invoke_652(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871BC = result;
  return result;
}

uint64_t __42__PLBBMav13HwMsgParser_logMPSSWithLogger___block_invoke_657(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871BD = result;
  return result;
}

- (void)logLPASSWithLogger:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t v23;
  _QWORD block[5];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLBBMav13HwMsgParser lpassState](self, "lpassState"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser lpassState](self, "lpassState"), 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLpassOnOffState:", v5);
LABEL_3:

    goto LABEL_11;
  }
  objc_msgSend(v4, "appendToError:", CFSTR("LPASS State=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PLBBMav13HwMsgParser_logLPASSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1ED887450 != -1)
      dispatch_once(&qword_1ED887450, block);
    if (byte_1ED8871BE)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LPASS State=<unknown>"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logLPASSWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v9, v10, 762);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_3;
    }
  }
LABEL_11:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v12 = objc_opt_class();
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __43__PLBBMav13HwMsgParser_logLPASSWithLogger___block_invoke_666;
    v22 = &__block_descriptor_40_e5_v8__0lu32l8;
    v23 = v12;
    if (qword_1ED887458 != -1)
      dispatch_once(&qword_1ED887458, &v19);
    if (byte_1ED8871BF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW LPASS"), v19, v20, v21, v22, v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logLPASSWithLogger:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 765);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __43__PLBBMav13HwMsgParser_logLPASSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871BE = result;
  return result;
}

uint64_t __43__PLBBMav13HwMsgParser_logLPASSWithLogger___block_invoke_666(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871BF = result;
  return result;
}

- (void)logPeripheralsWithLogger:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  __int16 *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  v7 = &word_1CB388000;
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED887460 != -1)
      dispatch_once(&qword_1ED887460, block);
    if (byte_1ED8871C0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logPeripheralsWithLogger:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logPeripheralsWithLogger:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 770);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v6 = MEMORY[0x1E0C809B0];
      v7 = &word_1CB388000;
    }
  }
  v14 = v4;
  if (-[PLBBMav13HwMsgParser gpsState](self, "gpsState"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser gpsState](self, "gpsState"), 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setGpsOnOff:", v15);
LABEL_10:

    goto LABEL_18;
  }
  objc_msgSend(v14, "appendToError:", CFSTR("GPS=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v45[0] = v6;
    v45[1] = 3221225472;
    v45[2] = __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke_673;
    v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v45[4] = objc_opt_class();
    if (qword_1ED887468 != -1)
      dispatch_once(&qword_1ED887468, v45);
    if (byte_1ED8871C1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GPS=<unknown>"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logPeripheralsWithLogger:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 782);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v15;
        _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v7 = &word_1CB388000;
      goto LABEL_10;
    }
  }
LABEL_18:
  if (-[PLBBMav13HwMsgParser gpsDpoState](self, "gpsDpoState"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser gpsDpoState](self, "gpsDpoState"), 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setGpsDPOOnOff:", v21);
LABEL_20:

    goto LABEL_28;
  }
  objc_msgSend(v14, "appendToError:", CFSTR("GPS_DPO=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v22 = objc_opt_class();
    v44[0] = v6;
    v44[1] = *((_QWORD *)v7 + 166);
    v44[2] = __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke_680;
    v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v44[4] = v22;
    if (qword_1ED887470 != -1)
      dispatch_once(&qword_1ED887470, v44);
    if (byte_1ED8871C2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GPS_DPO=<unknown>"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lastPathComponent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logPeripheralsWithLogger:]");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v25, v26, 794);

      PLLogCommon();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v21;
        _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v7 = &word_1CB388000;
      goto LABEL_20;
    }
  }
LABEL_28:
  if (-[PLBBMav13HwMsgParser gpsDpoBins](self, "gpsDpoBins"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser gpsDpoBins](self, "gpsDpoBins"), 6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setGpsDPOBin:", v28);
LABEL_30:

    goto LABEL_38;
  }
  objc_msgSend(v14, "appendToError:", CFSTR("GPS_DPO_BINS=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v29 = objc_opt_class();
    v43[0] = v6;
    v43[1] = *((_QWORD *)v7 + 166);
    v43[2] = __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke_687;
    v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v43[4] = v29;
    if (qword_1ED887478 != -1)
      dispatch_once(&qword_1ED887478, v43);
    if (byte_1ED8871C3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GPS_DPO_BINS=<unknown>"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lastPathComponent");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logPeripheralsWithLogger:]");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v32, v33, 806);

      PLLogCommon();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v28;
        _os_log_debug_impl(&dword_1CAF47000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_30;
    }
  }
LABEL_38:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v35 = objc_opt_class();
    v42[0] = v6;
    v42[1] = *((_QWORD *)v7 + 166);
    v42[2] = __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke_692;
    v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v42[4] = v35;
    if (qword_1ED887480 != -1)
      dispatch_once(&qword_1ED887480, v42);
    if (byte_1ED8871C4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW Peripherals GPS DPO BINS"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "lastPathComponent");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logPeripheralsWithLogger:]");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v39, v40, 809);

      PLLogCommon();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v36;
        _os_log_debug_impl(&dword_1CAF47000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871C0 = result;
  return result;
}

uint64_t __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke_673(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871C1 = result;
  return result;
}

uint64_t __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke_680(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871C2 = result;
  return result;
}

uint64_t __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke_687(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871C3 = result;
  return result;
}

uint64_t __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke_692(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871C4 = result;
  return result;
}

- (void)logProtocolWithLogger:(id)a3 container:(id)a4 state:(id *)a5 forRAT:(unsigned int)a6
{
  uint64_t v6;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t block;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v6 = *(_QWORD *)&a6;
  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void *)MEMORY[0x1E0D7FFA0];
  v12 = a4;
  if (objc_msgSend(v11, "debugEnabled"))
  {
    v13 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __69__PLBBMav13HwMsgParser_logProtocolWithLogger_container_state_forRAT___block_invoke;
    v27 = &__block_descriptor_40_e5_v8__0lu32l8;
    v28 = v13;
    if (qword_1ED887488 != -1)
      dispatch_once(&qword_1ED887488, &block);
    if (byte_1ED8871C5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logProtocolWithLogger:container:state:forRAT:]", block, v25, v26, v27, v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logProtocolWithLogger:container:state:forRAT:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 817);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v20 = v10;
  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", a5, 16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRadioTech:", v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v21, v23);

}

uint64_t __69__PLBBMav13HwMsgParser_logProtocolWithLogger_container_state_forRAT___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871C5 = result;
  return result;
}

- (void)logProtocolOnlyWithLogger:(id)a3 forRAT:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  PLBBMavLogMsg *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  uint64_t v43;
  _QWORD block[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v4 = *(_QWORD *)&a4;
  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __57__PLBBMav13HwMsgParser_logProtocolOnlyWithLogger_forRAT___block_invoke;
    v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v49[4] = v7;
    if (qword_1ED887490 != -1)
      dispatch_once(&qword_1ED887490, v49);
    if (byte_1ED8871C6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logProtocolOnlyWithLogger:forRAT:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logProtocolOnlyWithLogger:forRAT:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 829);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v14 = v6;
  v15 = objc_alloc_init(PLBBMavLogMsg);
  -[PLBasebandMessage agent](self, "agent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage setAgent:](v15, "setAgent:", v16);

  -[PLBBMavLogMsg setError:](v15, "setError:", &stru_1E8587D00);
  -[PLBasebandMessage seqNum](self, "seqNum");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage date](self, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage timeCal](self, "timeCal");
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v15, "setHeaderWithSeqNum:andDate:andTimeCal:", v17, v18);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg setRadioTech:](v15, "setRadioTech:", v19);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg setLogDuration:](v15, "setLogDuration:", v20);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ((_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[16]- (_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[12]));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg setBbHwLogDurationInTicks:](v15, "setBbHwLogDurationInTicks:", v21);

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v14, "protocolStateHistDict");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v22)
  {
    v23 = v22;
    v43 = *(_QWORD *)v46;
    do
    {
      v24 = 0;
      v25 = 0x1E0D7F000uLL;
      do
      {
        if (*(_QWORD *)v46 != v43)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v24);
        objc_msgSend(v14, "protocolStateHistDict");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKey:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          -[PLBBMavLogMsg setProtocolStateHist:](v15, "setProtocolStateHist:", v28);
          if (objc_msgSend(*(id *)(v25 + 4000), "debugEnabled"))
          {
            v29 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __57__PLBBMav13HwMsgParser_logProtocolOnlyWithLogger_forRAT___block_invoke_697;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v29;
            if (qword_1ED887498 != -1)
              dispatch_once(&qword_1ED887498, block);
            if (byte_1ED8871C7)
            {
              v30 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v14, "protocolStateHistDict");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "objectForKey:", v26);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "stringWithFormat:", CFSTR("%@ : %@"), v26, v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              v34 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "lastPathComponent");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logProtocolOnlyWithLogger:forRAT:]");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 849);

              PLLogCommon();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v52 = v33;
                _os_log_debug_impl(&dword_1CAF47000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v25 = 0x1E0D7F000;
            }
          }
        }
        -[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHwOtherPerRAT](v15, "logEventBackwardGrpEntriesBBMavHwOtherPerRAT");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKey:", CFSTR("entry"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKey:", CFSTR("name"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addToGroupPLBBMavHwEntry:withEntryKey:", v40, v41);

        ++v24;
      }
      while (v23 != v24);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v23);
  }

}

uint64_t __57__PLBBMav13HwMsgParser_logProtocolOnlyWithLogger_forRAT___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871C6 = result;
  return result;
}

uint64_t __57__PLBBMav13HwMsgParser_logProtocolOnlyWithLogger_forRAT___block_invoke_697(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871C7 = result;
  return result;
}

- (void)logLegacyRFWithLogger:(id)a3 usingData:(id *)a4 forRAT:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  PLBBMavLogMsg *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v5 = *(_QWORD *)&a5;
  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PLBBMav13HwMsgParser_logLegacyRFWithLogger_usingData_forRAT___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1ED8874A0 != -1)
      dispatch_once(&qword_1ED8874A0, block);
    if (byte_1ED8871C8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 864);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v16 = v8;
  v17 = objc_alloc_init(PLBBMavLogMsg);
  -[PLBasebandMessage agent](self, "agent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage setAgent:](v17, "setAgent:", v18);

  -[PLBBMavLogMsg setError:](v17, "setError:", &stru_1E8587D00);
  -[PLBasebandMessage seqNum](self, "seqNum");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage date](self, "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage timeCal](self, "timeCal");
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v17, "setHeaderWithSeqNum:andDate:andTimeCal:", v19, v20);

  -[PLMav7BasebandHardwareMessage indexToRAT:](self, "indexToRAT:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg setRat:](v17, "setRat:", v21);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg setLogDuration:](v17, "setLogDuration:", v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg setRadioTech:](v17, "setRadioTech:", v23);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ((_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[16]- (_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[12]));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg setBbHwLogDurationInTicks:](v17, "setBbHwLogDurationInTicks:", v24);

  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", a4, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg setRssiModeCount:](v17, "setRssiModeCount:", v25);

  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", a4->var1, 13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg setRx0RssiPowerHist:](v17, "setRx0RssiPowerHist:", v26);

  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", a4->var2, 13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg setRx1RssiPowerHist:](v17, "setRx1RssiPowerHist:", v27);

  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", a4->var4, 11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg setRx0SQAPowerHist:](v17, "setRx0SQAPowerHist:", v28);

  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", a4->var5, 11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg setRx1SQAPowerHist:](v17, "setRx1SQAPowerHist:", v29);

  if ((_DWORD)v5 != 3)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v30 = objc_opt_class();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __63__PLBBMav13HwMsgParser_logLegacyRFWithLogger_usingData_forRAT___block_invoke_706;
      v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v44[4] = v30;
      if (qword_1ED8874A8 != -1)
        dispatch_once(&qword_1ED8874A8, v44);
      if (byte_1ED8871C9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not WCDMA legacy data, use Tx power"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "lastPathComponent");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:]");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 900);

        PLLogCommon();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v47 = v31;
          _os_log_debug_impl(&dword_1CAF47000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", a4->var3, 12);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavLogMsg setTxPowerHist:](v17, "setTxPowerHist:", v37);

  }
  objc_msgSend(v16, "protocolStateHistDict");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKey:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
    -[PLBBMavLogMsg setProtocolStateHist:](v17, "setProtocolStateHist:", v40);
  -[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHwOtherPerRAT](v17, "logEventBackwardGrpEntriesBBMavHwOtherPerRAT");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKey:", CFSTR("entry"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKey:", CFSTR("name"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addToGroupPLBBMavHwEntry:withEntryKey:", v42, v43);

}

uint64_t __63__PLBBMav13HwMsgParser_logLegacyRFWithLogger_usingData_forRAT___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871C8 = result;
  return result;
}

uint64_t __63__PLBBMav13HwMsgParser_logLegacyRFWithLogger_usingData_forRAT___block_invoke_706(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871C9 = result;
  return result;
}

- (void)logHwRFEnhLTEWithLogger:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  PLBBMavHwRfLTELogMsg *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PLBBMav13HwMsgParser_logHwRFEnhLTEWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED8874B0 != -1)
      dispatch_once(&qword_1ED8874B0, block);
    if (byte_1ED8871CA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logHwRFEnhLTEWithLogger:]");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFEnhLTEWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 919);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  v13 = objc_alloc_init(PLBBMavHwRfLTELogMsg);
  if (v13)
  {
    -[PLBasebandMessage agent](self, "agent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMsgRoot setAgent:](v13, "setAgent:", v14);

    -[PLBBMavHwRfLTELogMsg setError:](v13, "setError:", CFSTR("not set"));
    -[PLBasebandMessage seqNum](self, "seqNum");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage date](self, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage timeCal](self, "timeCal");
    -[PLBBMavHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 0x10) == 0
      || -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE"))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", ((_DWORD)-[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE")[4]- (_DWORD)-[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE")[8]));
      -[PLBBMavHwRfLTELogMsg setLogDuration:](v13, "setLogDuration:", v17);

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE")[16]);
      -[PLBBMavHwRfLTELogMsg setDupMode:](v13, "setDupMode:", v18);

      -[PLBasebandHardwareMessage convertUint8ArrayToNSArray:ofSize:](self, "convertUint8ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 20, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setCaFreqInfo:](v13, "setCaFreqInfo:", v19);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 24, 18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setDlC0TBSzCnt:](v13, "setDlC0TBSzCnt:", v20);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 96, 18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setDlC1TBSzCnt:](v13, "setDlC1TBSzCnt:", v21);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 168, 12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setTxPwrCnt:](v13, "setTxPwrCnt:", v22);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 216, 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setCaSCCCnt:](v13, "setCaSCCCnt:", v23);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 216, 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setCaPriCCCnt:](v13, "setCaPriCCCnt:", v24);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 232, 4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setCaPriCCCnt:](v13, "setCaPriCCCnt:", v25);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 248, 4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setCaPriSecCCCnt:](v13, "setCaPriSecCCCnt:", v26);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 232, 8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setActRxTxPriCCCnt:](v13, "setActRxTxPriCCCnt:", v27);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 264, 8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setActRxTxSecCCCnt:](v13, "setActRxTxSecCCCnt:", v28);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 296, 8);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setActRxTxPriSecCCCnt:](v13, "setActRxTxPriSecCCCnt:", v29);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 328, 7);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setSleepStateIdleCnt:](v13, "setSleepStateIdleCnt:", v30);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 356, 7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setSleepStateConnCnt:](v13, "setSleepStateConnCnt:", v31);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 384, 6);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setRsrpIdleCnt:](v13, "setRsrpIdleCnt:", v32);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 408, 6);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setRsrpConnCnt:](v13, "setRsrpConnCnt:", v33);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 432, 6);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setSinrIdleCnt:](v13, "setSinrIdleCnt:", v34);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 456, 6);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setSinrConnCnt:](v13, "setSinrConnCnt:", v35);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 480, 5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setArxStateCnt:](v13, "setArxStateCnt:", v36);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 500, 3);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setNlicStateCnt:](v13, "setNlicStateCnt:", v37);

      -[PLBasebandHardwareMessage convertUint64ArrayToNSArray:ofSize:](self, "convertUint64ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE") + 512, 8);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setBpeStats:](v13, "setBpeStats:", v38);

      -[PLBBMavHwRfLTELogMsg logEventBackwardBBMav13HwRfLTE](v13, "logEventBackwardBBMav13HwRfLTE");
      v39 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v39, "objectForKey:", CFSTR("entry"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v39, "objectForKey:", CFSTR("entryKey"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addToGroupPLBBMavHwEntry:withEntryKey:", v40, v41);

      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_32;
      v42 = objc_opt_class();
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __48__PLBBMav13HwMsgParser_logHwRFEnhLTEWithLogger___block_invoke_726;
      v59[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v59[4] = v42;
      if (qword_1ED8874C8 != -1)
        dispatch_once(&qword_1ED8874C8, v59);
      if (!byte_1ED8871CD)
        goto LABEL_32;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh Mav HW RF ENH LTE"));
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "lastPathComponent");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFEnhLTEWithLogger:]");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "logMessage:fromFile:fromFunction:fromLineNumber:", v43, v46, v47, 1029);

      PLLogCommon();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v43;
        _os_log_debug_impl(&dword_1CAF47000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_31:
LABEL_32:

      goto LABEL_33;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v54 = objc_opt_class();
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __48__PLBBMav13HwMsgParser_logHwRFEnhLTEWithLogger___block_invoke_719;
      v60[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v60[4] = v54;
      if (qword_1ED8874C0 != -1)
        dispatch_once(&qword_1ED8874C0, v60);
      if (byte_1ED8871CC)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhLTE is not valid, return"));
        v39 = objc_claimAutoreleasedReturnValue();
        v55 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "lastPathComponent");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFEnhLTEWithLogger:]");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v57, v58, 934);

        PLLogCommon();
        v43 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          goto LABEL_31;
        *(_DWORD *)buf = 138412290;
        v64 = v39;
        goto LABEL_30;
      }
    }
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v49 = objc_opt_class();
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __48__PLBBMav13HwMsgParser_logHwRFEnhLTEWithLogger___block_invoke_712;
    v61[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v61[4] = v49;
    if (qword_1ED8874B8 != -1)
      dispatch_once(&qword_1ED8874B8, v61);
    if (byte_1ED8871CB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: mem alloc for logHwRfLTE failed"));
      v39 = objc_claimAutoreleasedReturnValue();
      v50 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "lastPathComponent");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFEnhLTEWithLogger:]");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v52, v53, 923);

      PLLogCommon();
      v43 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        goto LABEL_31;
      *(_DWORD *)buf = 138412290;
      v64 = v39;
LABEL_30:
      _os_log_debug_impl(&dword_1CAF47000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_31;
    }
  }
LABEL_33:

}

uint64_t __48__PLBBMav13HwMsgParser_logHwRFEnhLTEWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871CA = result;
  return result;
}

uint64_t __48__PLBBMav13HwMsgParser_logHwRFEnhLTEWithLogger___block_invoke_712(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871CB = result;
  return result;
}

uint64_t __48__PLBBMav13HwMsgParser_logHwRFEnhLTEWithLogger___block_invoke_719(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871CC = result;
  return result;
}

uint64_t __48__PLBBMav13HwMsgParser_logHwRFEnhLTEWithLogger___block_invoke_726(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871CD = result;
  return result;
}

- (void)logHwRFEnhWCDMAWithLogger:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  PLBBMavHwRfWCDMALogMsg *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PLBBMav13HwMsgParser_logHwRFEnhWCDMAWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED8874D0 != -1)
      dispatch_once(&qword_1ED8874D0, block);
    if (byte_1ED8871CE)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logHwRFEnhWCDMAWithLogger:]");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFEnhWCDMAWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1034);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  v13 = objc_alloc_init(PLBBMavHwRfWCDMALogMsg);
  if (v13)
  {
    -[PLBasebandMessage agent](self, "agent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage setAgent:](v13, "setAgent:", v14);

    -[PLBBMavHwRfWCDMALogMsg setError:](v13, "setError:", CFSTR("not set"));
    -[PLBasebandMessage seqNum](self, "seqNum");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage date](self, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage timeCal](self, "timeCal");
    -[PLBBMavHwRfWCDMALogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (*(_DWORD *)-[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA")- (_DWORD)-[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA")[4]));
    -[PLBBMavHwRfWCDMALogMsg setLogDuration:](v13, "setLogDuration:", v17);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA") + 8, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setSCEqStatCnt:](v13, "setSCEqStatCnt:", v18);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA") + 20, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setDCEqStatCnt:](v13, "setDCEqStatCnt:", v19);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA") + 32, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setSCQsetEqStatCnt:](v13, "setSCQsetEqStatCnt:", v20);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA") + 48, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setDCQsetEqStatCnt:](v13, "setDCQsetEqStatCnt:", v21);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA") + 64, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setDurInCarrierMode:](v13, "setDurInCarrierMode:", v22);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA") + 72, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setRABModeCnt:](v13, "setRABModeCnt:", v23);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA") + 88, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setRABTypeCnt:](v13, "setRABTypeCnt:", v24);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA") + 104, 12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setTxPwrBucket:](v13, "setTxPwrBucket:", v25);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA")[152]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setFetCnt:](v13, "setFetCnt:", v26);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA")[156]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setCpcRxOnCnt:](v13, "setCpcRxOnCnt:", v27);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA")[160]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setCpcRxTxOffCnt:](v13, "setCpcRxTxOffCnt:", v28);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA")[164]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setCpcTimeCnt:](v13, "setCpcTimeCnt:", v29);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)-[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA")[168]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setCpcEnergy:](v13, "setCpcEnergy:", v30);

    -[PLBBMavHwRfWCDMALogMsg logEventBackwardBBMavHwRfWCDMA](v13, "logEventBackwardBBMavHwRfWCDMA");
    v31 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v31, "objectForKey:", CFSTR("entry"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v31, "objectForKey:", CFSTR("entryKey"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addToGroupPLBBMavHwEntry:withEntryKey:", v32, v33);

    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_23;
    v34 = objc_opt_class();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __50__PLBBMav13HwMsgParser_logHwRFEnhWCDMAWithLogger___block_invoke_737;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v34;
    if (qword_1ED8874E0 != -1)
      dispatch_once(&qword_1ED8874E0, v46);
    if (!byte_1ED8871D0)
      goto LABEL_23;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh BB HW RF WCDMA"));
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "lastPathComponent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFEnhWCDMAWithLogger:]");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 1095);

    PLLogCommon();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v35;
      _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v41 = objc_opt_class();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __50__PLBBMav13HwMsgParser_logHwRFEnhWCDMAWithLogger___block_invoke_732;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v41;
    if (qword_1ED8874D8 != -1)
      dispatch_once(&qword_1ED8874D8, v47);
    if (byte_1ED8871CF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: mem alloc for logHwRfWCDMA failed"));
      v31 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "lastPathComponent");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFEnhWCDMAWithLogger:]");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v44, v45, 1038);

      PLLogCommon();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v31;
        _os_log_debug_impl(&dword_1CAF47000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_22;
    }
  }
LABEL_24:

}

uint64_t __50__PLBBMav13HwMsgParser_logHwRFEnhWCDMAWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871CE = result;
  return result;
}

uint64_t __50__PLBBMav13HwMsgParser_logHwRFEnhWCDMAWithLogger___block_invoke_732(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871CF = result;
  return result;
}

uint64_t __50__PLBBMav13HwMsgParser_logHwRFEnhWCDMAWithLogger___block_invoke_737(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871D0 = result;
  return result;
}

- (void)logHwRFGSMWithLogger:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  PLBBMavHwRfGSMLogMsg *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav13HwMsgParser_logHwRFGSMWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED8874E8 != -1)
      dispatch_once(&qword_1ED8874E8, block);
    if (byte_1ED8871D1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logHwRFGSMWithLogger:]");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFGSMWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1101);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  v13 = objc_alloc_init(PLBBMavHwRfGSMLogMsg);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: mem alloc for logHwRfEnhGSM failed"));
    v19 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lastPathComponent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFGSMWithLogger:]");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v31, v32, 1105);

    PLLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v19;
      _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  -[PLBasebandMessage agent](self, "agent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage setAgent:](v13, "setAgent:", v14);

  -[PLBBMavHwRfGSMLogMsg setError:](v13, "setError:", CFSTR("not set"));
  -[PLBasebandMessage seqNum](self, "seqNum");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage date](self, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage timeCal](self, "timeCal");
  -[PLBBMavHwRfGSMLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (*(_DWORD *)-[PLBBMav13HwMsgParser rfEnhGSM](self, "rfEnhGSM")- (_DWORD)-[PLBBMav13HwMsgParser rfEnhGSM](self, "rfEnhGSM")[4]));
  -[PLBBMavHwRfGSMLogMsg setLogDuration:](v13, "setLogDuration:", v17);

  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhGSM](self, "rfEnhGSM") + 8, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavHwRfGSMLogMsg setConnState:](v13, "setConnState:", v18);

  -[PLBBMavHwRfGSMLogMsg logEventBackwardBBMavHwRfGSM](v13, "logEventBackwardBBMavHwRfGSM");
  v19 = objc_claimAutoreleasedReturnValue();
  -[NSObject objectForKey:](v19, "objectForKey:", CFSTR("entry"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject objectForKey:](v19, "objectForKey:", CFSTR("entryKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addToGroupPLBBMavHwEntry:withEntryKey:", v20, v21);

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v22 = objc_opt_class();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __45__PLBBMav13HwMsgParser_logHwRFGSMWithLogger___block_invoke_745;
    v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v33[4] = v22;
    if (qword_1ED8874F0 != -1)
      dispatch_once(&qword_1ED8874F0, v33);
    if (byte_1ED8871D2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh BB HW RF ENH GSM"));
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFGSMWithLogger:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 1125);

      PLLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v23;
        _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_18:
    }
  }

}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFGSMWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871D1 = result;
  return result;
}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFGSMWithLogger___block_invoke_745(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871D2 = result;
  return result;
}

- (void)logHwRFTDSWithLogger:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  PLBBMavHwRfTDSLogMsg *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav13HwMsgParser_logHwRFTDSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED8874F8 != -1)
      dispatch_once(&qword_1ED8874F8, block);
    if (byte_1ED8871D3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logHwRFTDSWithLogger:]");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFTDSWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1130);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  v13 = objc_alloc_init(PLBBMavHwRfTDSLogMsg);
  if (v13)
  {
    -[PLBasebandMessage agent](self, "agent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage setAgent:](v13, "setAgent:", v14);

    -[PLBBMavHwRfTDSLogMsg setError:](v13, "setError:", CFSTR("not set"));
    -[PLBasebandMessage seqNum](self, "seqNum");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage date](self, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage timeCal](self, "timeCal");
    -[PLBBMavHwRfTDSLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (*(_DWORD *)-[PLBBMav13HwMsgParser rfEnhTDS](self, "rfEnhTDS")- (_DWORD)-[PLBBMav13HwMsgParser rfEnhTDS](self, "rfEnhTDS")[4]));
    -[PLBBMavHwRfTDSLogMsg setLogDuration:](v13, "setLogDuration:", v17);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhTDS](self, "rfEnhTDS") + 8, 7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfTDSLogMsg setSrvcTypeCnt:](v13, "setSrvcTypeCnt:", v18);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhTDS](self, "rfEnhTDS") + 36, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfTDSLogMsg setRxdStateCnt:](v13, "setRxdStateCnt:", v19);

    -[PLBBMavHwRfTDSLogMsg logEventBackwardBBMavHwRfTDS](v13, "logEventBackwardBBMavHwRfTDS");
    v20 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v20, "objectForKey:", CFSTR("entry"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v20, "objectForKey:", CFSTR("entryKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addToGroupPLBBMavHwEntry:withEntryKey:", v21, v22);

    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_23;
    v23 = objc_opt_class();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __45__PLBBMav13HwMsgParser_logHwRFTDSWithLogger___block_invoke_756;
    v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v35[4] = v23;
    if (qword_1ED887508 != -1)
      dispatch_once(&qword_1ED887508, v35);
    if (!byte_1ED8871D5)
      goto LABEL_23;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh BB HW RF TDS"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lastPathComponent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFTDSWithLogger:]");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 1155);

    PLLogCommon();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v24;
      _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v30 = objc_opt_class();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __45__PLBBMav13HwMsgParser_logHwRFTDSWithLogger___block_invoke_751;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = v30;
    if (qword_1ED887500 != -1)
      dispatch_once(&qword_1ED887500, v36);
    if (byte_1ED8871D4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: mem alloc for logHwRfGSM failed"));
      v20 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "lastPathComponent");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFTDSWithLogger:]");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v33, v34, 1134);

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v20;
        _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_22;
    }
  }
LABEL_24:

}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFTDSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871D3 = result;
  return result;
}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFTDSWithLogger___block_invoke_751(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871D4 = result;
  return result;
}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFTDSWithLogger___block_invoke_756(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871D5 = result;
  return result;
}

- (void)logHwRF1xWithLogger:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  PLBBMavHwRf1xLogMsg *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PLBBMav13HwMsgParser_logHwRF1xWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED887510 != -1)
      dispatch_once(&qword_1ED887510, block);
    if (byte_1ED8871D6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logHwRF1xWithLogger:]");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRF1xWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1160);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  v13 = objc_alloc_init(PLBBMavHwRf1xLogMsg);
  if (v13)
  {
    -[PLBasebandMessage agent](self, "agent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage setAgent:](v13, "setAgent:", v14);

    -[PLBBMavHwRf1xLogMsg setError:](v13, "setError:", CFSTR("not set"));
    -[PLBasebandMessage seqNum](self, "seqNum");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage date](self, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage timeCal](self, "timeCal");
    -[PLBBMavHwRf1xLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (*(_DWORD *)-[PLBBMav13HwMsgParser rfEnhC2K](self, "rfEnhC2K")- (_DWORD)-[PLBBMav13HwMsgParser rfEnhC2K](self, "rfEnhC2K")[4]));
    -[PLBBMavHwRf1xLogMsg setLogDuration:](v13, "setLogDuration:", v17);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnhC2K](self, "rfEnhC2K")[8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRf1xLogMsg setDtxOn:](v13, "setDtxOn:", v18);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnhC2K](self, "rfEnhC2K")[12]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRf1xLogMsg setDtxOff:](v13, "setDtxOff:", v19);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhC2K](self, "rfEnhC2K") + 16, 6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRf1xLogMsg setCallTypeDur:](v13, "setCallTypeDur:", v20);

    -[PLBBMavHwRf1xLogMsg logEventBackwardBBMavHwRf1x](v13, "logEventBackwardBBMavHwRf1x");
    v21 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v21, "objectForKey:", CFSTR("entry"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v21, "objectForKey:", CFSTR("entryKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addToGroupPLBBMavHwEntry:withEntryKey:", v22, v23);

    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_23;
    v24 = objc_opt_class();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __44__PLBBMav13HwMsgParser_logHwRF1xWithLogger___block_invoke_767;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = v24;
    if (qword_1ED887520 != -1)
      dispatch_once(&qword_1ED887520, v36);
    if (!byte_1ED8871D8)
      goto LABEL_23;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh BB HW RF ENH 1x"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lastPathComponent");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRF1xWithLogger:]");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 1219);

    PLLogCommon();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v25;
      _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v31 = objc_opt_class();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __44__PLBBMav13HwMsgParser_logHwRF1xWithLogger___block_invoke_762;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v31;
    if (qword_1ED887518 != -1)
      dispatch_once(&qword_1ED887518, v37);
    if (byte_1ED8871D7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: mem alloc for logHwRf1x failed"));
      v21 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "lastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRF1xWithLogger:]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v34, v35, 1164);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v21;
        _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_22;
    }
  }
LABEL_24:

}

uint64_t __44__PLBBMav13HwMsgParser_logHwRF1xWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871D6 = result;
  return result;
}

uint64_t __44__PLBBMav13HwMsgParser_logHwRF1xWithLogger___block_invoke_762(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871D7 = result;
  return result;
}

uint64_t __44__PLBBMav13HwMsgParser_logHwRF1xWithLogger___block_invoke_767(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871D8 = result;
  return result;
}

- (void)logHwRFHDRWithLogger:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  PLBBMavHwRfHDRLogMsg *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav13HwMsgParser_logHwRFHDRWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED887528 != -1)
      dispatch_once(&qword_1ED887528, block);
    if (byte_1ED8871D9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logHwRFHDRWithLogger:]");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFHDRWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1224);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  v13 = objc_alloc_init(PLBBMavHwRfHDRLogMsg);
  if (v13)
  {
    -[PLBasebandMessage agent](self, "agent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage setAgent:](v13, "setAgent:", v14);

    -[PLBBMavHwRfHDRLogMsg setError:](v13, "setError:", CFSTR("not set"));
    -[PLBasebandMessage seqNum](self, "seqNum");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage date](self, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage timeCal](self, "timeCal");
    -[PLBBMavHwRfHDRLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (*(_DWORD *)-[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO")- (_DWORD)-[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO")[4]));
    -[PLBBMavHwRfHDRLogMsg setLogDuration:](v13, "setLogDuration:", v17);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO")[8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfHDRLogMsg setSDTXOnFrame:](v13, "setSDTXOnFrame:", v18);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO")[12]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfHDRLogMsg setSDTXOffFrame:](v13, "setSDTXOffFrame:", v19);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO")[16]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfHDRLogMsg setLDTXOnFrame:](v13, "setLDTXOnFrame:", v20);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO")[20]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfHDRLogMsg setLDTXOffFrame:](v13, "setLDTXOffFrame:", v21);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO")[24]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfHDRLogMsg setTDTXOnFrame:](v13, "setTDTXOnFrame:", v22);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO")[28]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfHDRLogMsg setTDTXOffFrame:](v13, "setTDTXOffFrame:", v23);

    -[PLBBMavHwRfHDRLogMsg logEventBackwardBBMavHwRfHDR](v13, "logEventBackwardBBMavHwRfHDR");
    v24 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v24, "objectForKey:", CFSTR("entry"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v24, "objectForKey:", CFSTR("entryKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addToGroupPLBBMavHwEntry:withEntryKey:", v25, v26);

    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_23;
    v27 = objc_opt_class();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __45__PLBBMav13HwMsgParser_logHwRFHDRWithLogger___block_invoke_778;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = v27;
    if (qword_1ED887538 != -1)
      dispatch_once(&qword_1ED887538, v39);
    if (!byte_1ED8871DB)
      goto LABEL_23;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh BB HW RF ENH HDR"));
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lastPathComponent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFHDRWithLogger:]");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 1254);

    PLLogCommon();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v28;
      _os_log_debug_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v34 = objc_opt_class();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __45__PLBBMav13HwMsgParser_logHwRFHDRWithLogger___block_invoke_773;
    v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v40[4] = v34;
    if (qword_1ED887530 != -1)
      dispatch_once(&qword_1ED887530, v40);
    if (byte_1ED8871DA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: mem alloc for logHwRfHDR failed"));
      v24 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastPathComponent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFHDRWithLogger:]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v37, v38, 1228);

      PLLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v24;
        _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_22;
    }
  }
LABEL_24:

}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFHDRWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871D9 = result;
  return result;
}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFHDRWithLogger___block_invoke_773(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871DA = result;
  return result;
}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFHDRWithLogger___block_invoke_778(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871DB = result;
  return result;
}

- (void)logHwRFOOSWithLogger:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  _QWORD v39[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav13HwMsgParser_logHwRFOOSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED887540 != -1)
      dispatch_once(&qword_1ED887540, block);
    if (byte_1ED8871DC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav13HwMsgParser logHwRFOOSWithLogger:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFOOSWithLogger:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 1259);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v6 = MEMORY[0x1E0C809B0];
    }
  }
  v13 = v4;
  v14 = (void *)objc_opt_new();
  -[PLBasebandMessage agent](self, "agent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAgent:", v15);

  objc_msgSend(v14, "setError:", &stru_1E8587D00);
  -[PLBasebandMessage seqNum](self, "seqNum");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage date](self, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage timeCal](self, "timeCal");
  objc_msgSend(v14, "setHeaderWithSeqNum:andDate:andTimeCal:", v16, v17);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLogDuration:", v18);

  objc_msgSend(v14, "setOosInProgress:", -[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS")[2]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS")[4]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOosTicks:", v19);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)-[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOosTimes:", v20);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS")[8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPssiTicks:", v21);

  -[PLBasebandHardwareMessage convertUint16ArrayToNSArray:ofSize:](self, "convertUint16ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS") + 12, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOosGsmPssiTimes:", v22);

  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS") + 60, 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOosGsmPssiStatTicks:", v23);

  -[PLBasebandHardwareMessage convertUint16ArrayToNSArray:ofSize:](self, "convertUint16ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS") + 24, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOosWcdmaPssiTimes:", v24);

  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS") + 84, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOosWcdmaPssiStatTicks:", v25);

  -[PLBasebandHardwareMessage convertUint16ArrayToNSArray:ofSize:](self, "convertUint16ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS") + 36, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOosLtePssiTimes:", v26);

  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS") + 108, 6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOosLtePssiStatTicks:", v27);

  -[PLBasebandHardwareMessage convertUint16ArrayToNSArray:ofSize:](self, "convertUint16ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS") + 48, 6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOosTdsPssiTimes:", v28);

  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS") + 132, 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOosTdsPssiStatTicks:", v29);

  objc_msgSend(v14, "logEventBackwardBBMavHwRfOos");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", CFSTR("entry"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", CFSTR("entryKey"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addToGroupPLBBMavHwEntry:withEntryKey:", v31, v32);

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v39[0] = v6;
    v39[1] = 3221225472;
    v39[2] = __45__PLBBMav13HwMsgParser_logHwRFOOSWithLogger___block_invoke_784;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = objc_opt_class();
    if (qword_1ED887548 != -1)
      dispatch_once(&qword_1ED887548, v39);
    if (byte_1ED8871DD)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh BB HW RF ENH OOS"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "lastPathComponent");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav13HwMsgParser logHwRFOOSWithLogger:]");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 1309);

      PLLogCommon();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v33;
        _os_log_debug_impl(&dword_1CAF47000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFOOSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871DC = result;
  return result;
}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFOOSWithLogger___block_invoke_784(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8871DD = result;
  return result;
}

- (int)GetClockCount:(_PLMav7BasebandHWStatsClockStateMask *)a3
{
  uint64_t v3;
  int result;
  unsigned int v5;
  BOOL v6;

  v3 = 0;
  result = 0;
  do
  {
    v5 = a3->var0[v3];
    if (v5)
    {
      do
      {
        result += v5 & 1;
        v6 = v5 >= 2;
        v5 >>= 1;
      }
      while (v6);
    }
    ++v3;
  }
  while (v3 != 4);
  return result;
}

- (void)SetClocks:(_PLMav7BasebandHWStatsClockStateMask *)a3 oftype:(int)a4 withData:(char *)a5
{
  uint64_t v8;
  __CFString **v9;
  unsigned int v10;
  __CFString **v11;
  uint64_t v12;
  float v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &apps_clock_names_2;
  do
  {
    v10 = a3->var0[v8];
    v11 = v9;
    if (v10)
    {
      do
      {
        if ((v10 & 1) != 0)
        {
          v12 = *(unsigned int *)a5;
          if (-[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"))
          {
            if (-[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"))
            {
              v13 = (float)v12
                  * 100.0
                  / (double)-[PLMav4BasebandHardwareMessage logDuration](self, "logDuration");
              if (v13 > 0.01)
                objc_msgSend(v20, "appendFormat:", CFSTR(" %@=[%d];"), *v11, v12);
            }
          }
          a5 += 4;
        }
        ++v11;
        v14 = v10 >= 2;
        v10 >>= 1;
      }
      while (v14);
    }
    ++v8;
    ++v9;
  }
  while (v8 != 4);
  if (!a4)
  {
    -[PLMav7BasebandHardwareMessage apps_clock_duration](self, "apps_clock_duration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[PLMav7BasebandHardwareMessage apps_clock_duration](self, "apps_clock_duration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  -[PLMav7BasebandHardwareMessage mpss_clock_duration](self, "mpss_clock_duration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PLMav7BasebandHardwareMessage mpss_clock_duration](self, "mpss_clock_duration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v18 = v16;
    objc_msgSend(v16, "appendString:", v20);

  }
}

- ($02140193D122F4399F556265180A383D)rfLTE
{
  return self->_rfLTE;
}

- (void)setRfLTE:(id *)a3
{
  self->_rfLTE = a3;
}

- ($6A53C83E73901DD0C34CF18301855816)rpmData
{
  return self->_rpmData;
}

- (void)setRpmData:(id *)a3
{
  self->_rpmData = a3;
}

- ($13802F9730B8C46AAB76E09031085152)appsPerf
{
  return self->_appsPerf;
}

- (void)setAppsPerf:(id *)a3
{
  self->_appsPerf = a3;
}

- ($6247608A9E858CB8A0F4CC99D4816BFE)appsSleep
{
  return self->_appsSleep;
}

- (void)setAppsSleep:(id *)a3
{
  self->_appsSleep = a3;
}

- ($C1957A8FD3E0093B731E920E3B161E9A)pcieState
{
  return self->_pcieState;
}

- (void)setPcieState:(id *)a3
{
  self->_pcieState = a3;
}

- ($FC730E2F24BB0828101253C3B52D6220)lpassState
{
  return self->_lpassState;
}

- (void)setLpassState:(id *)a3
{
  self->_lpassState = a3;
}

- ($6988F191A2E699FD2FDBF2169EACE1F4)appsSleepVeto
{
  return self->_appsSleepVeto;
}

- (void)setAppsSleepVeto:(id *)a3
{
  self->_appsSleepVeto = a3;
}

- ($6A788595DF0CE5F229CF8C0E99A1983A)mpssSleepVeto
{
  return self->_mpssSleepVeto;
}

- (void)setMpssSleepVeto:(id *)a3
{
  self->_mpssSleepVeto = a3;
}

- ($E07DBFA35793E6ACBF53B370E2AAA817)qdspSpeed
{
  return self->_qdspSpeed;
}

- (void)setQdspSpeed:(id *)a3
{
  self->_qdspSpeed = a3;
}

- ($6247608A9E858CB8A0F4CC99D4816BFE)mpssSleep
{
  return self->_mpssSleep;
}

- (void)setMpssSleep:(id *)a3
{
  self->_mpssSleep = a3;
}

- ($FC730E2F24BB0828101253C3B52D6220)gpsState
{
  return self->_gpsState;
}

- (void)setGpsState:(id *)a3
{
  self->_gpsState = a3;
}

- ($FC730E2F24BB0828101253C3B52D6220)gpsDpoState
{
  return self->_gpsDpoState;
}

- (void)setGpsDpoState:(id *)a3
{
  self->_gpsDpoState = a3;
}

- ($13802F9730B8C46AAB76E09031085152)gpsDpoBins
{
  return self->_gpsDpoBins;
}

- (void)setGpsDpoBins:(id *)a3
{
  self->_gpsDpoBins = a3;
}

- ($6259AD99E0296D9E5FB04EEC1BEE6709)mcpmSleepVeto
{
  return self->_mcpmSleepVeto;
}

- (void)setMcpmSleepVeto:(id *)a3
{
  self->_mcpmSleepVeto = a3;
}

- ($13802F9730B8C46AAB76E09031085152)protocolActive
{
  return self->_protocolActive;
}

- (void)setProtocolActive:(id *)a3
{
  self->_protocolActive = a3;
}

- ($DD746A1FB08B04E88D15572321826CC5)protocolState
{
  return self->_protocolState;
}

- (void)setProtocolState:(id *)a3
{
  self->_protocolState = a3;
}

- ($DD746A1FB08B04E88D15572321826CC5)protoStateC2K
{
  return self->_protoStateC2K;
}

- (void)setProtoStateC2K:(id *)a3
{
  self->_protoStateC2K = a3;
}

- ($DD746A1FB08B04E88D15572321826CC5)protoStateHDR
{
  return self->_protoStateHDR;
}

- (void)setProtoStateHDR:(id *)a3
{
  self->_protoStateHDR = a3;
}

- ($DD746A1FB08B04E88D15572321826CC5)protoStateGSM
{
  return self->_protoStateGSM;
}

- (void)setProtoStateGSM:(id *)a3
{
  self->_protoStateGSM = a3;
}

- ($DD746A1FB08B04E88D15572321826CC5)protoStateWCDMA
{
  return self->_protoStateWCDMA;
}

- (void)setProtoStateWCDMA:(id *)a3
{
  self->_protoStateWCDMA = a3;
}

- ($DD746A1FB08B04E88D15572321826CC5)protoStateLTE
{
  return self->_protoStateLTE;
}

- (void)setProtoStateLTE:(id *)a3
{
  self->_protoStateLTE = a3;
}

- ($DD746A1FB08B04E88D15572321826CC5)protoStateTDS
{
  return self->_protoStateTDS;
}

- (void)setProtoStateTDS:(id *)a3
{
  self->_protoStateTDS = a3;
}

- (char)optimMaskArray
{
  return self->_optimMaskArray;
}

- (void)setOptimMaskArray:(char *)a3
{
  self->_optimMaskArray = a3;
}

- ($4B43A875349FDE5438E0A7464BB34732)rfData
{
  return self->_rfData;
}

- (void)setRfData:(id *)a3
{
  self->_rfData = a3;
}

- ($E087ED438533671735DC466A2DECADBB)rfDataC2K
{
  return self->_rfDataC2K;
}

- (void)setRfDataC2K:(id *)a3
{
  self->_rfDataC2K = a3;
}

- ($E087ED438533671735DC466A2DECADBB)rfData1xEVDO
{
  return self->_rfData1xEVDO;
}

- (void)setRfData1xEVDO:(id *)a3
{
  self->_rfData1xEVDO = a3;
}

- ($E087ED438533671735DC466A2DECADBB)rfDataGSM
{
  return self->_rfDataGSM;
}

- (void)setRfDataGSM:(id *)a3
{
  self->_rfDataGSM = a3;
}

- ($D6D8E5E4F24C290D662940195489C6C4)rfDataWCDMA
{
  return self->_rfDataWCDMA;
}

- (void)setRfDataWCDMA:(id *)a3
{
  self->_rfDataWCDMA = a3;
}

- ($E087ED438533671735DC466A2DECADBB)rfDataLTE
{
  return self->_rfDataLTE;
}

- (void)setRfDataLTE:(id *)a3
{
  self->_rfDataLTE = a3;
}

- ($E087ED438533671735DC466A2DECADBB)rfDataTDS
{
  return self->_rfDataTDS;
}

- (void)setRfDataTDS:(id *)a3
{
  self->_rfDataTDS = a3;
}

- ($63F8DB169AF67CF236EE4F82E25D56B9)rfEnhC2K
{
  return self->_rfEnhC2K;
}

- (void)setRfEnhC2K:(id *)a3
{
  self->_rfEnhC2K = a3;
}

- ($A8298569B4D1A09F081049035A0A6303)rfEnh1xEVDO
{
  return self->_rfEnh1xEVDO;
}

- (void)setRfEnh1xEVDO:(id *)a3
{
  self->_rfEnh1xEVDO = a3;
}

- ($D38AB55F17507DDEA729FCED855170D9)rfEnhGSM
{
  return self->_rfEnhGSM;
}

- (void)setRfEnhGSM:(id *)a3
{
  self->_rfEnhGSM = a3;
}

- ($E0EEEB5BA8699BABA569A46DBC0146B0)rfEnhWCDMA
{
  return self->_rfEnhWCDMA;
}

- (void)setRfEnhWCDMA:(id *)a3
{
  self->_rfEnhWCDMA = a3;
}

- ($0C0A99A7A001DBC942837B17909EADCE)rfEnhLTE
{
  return self->_rfEnhLTE;
}

- (void)setRfEnhLTE:(id *)a3
{
  self->_rfEnhLTE = a3;
}

- ($81F89CDC83781E2F8C3B7C08B1FDA3B1)rfEnhTDS
{
  return self->_rfEnhTDS;
}

- (void)setRfEnhTDS:(id *)a3
{
  self->_rfEnhTDS = a3;
}

- ($75CBB50FA0EA21D6D12C68A4AD2E7930)rfEnhOOS
{
  return self->_rfEnhOOS;
}

- (void)setRfEnhOOS:(id *)a3
{
  self->_rfEnhOOS = a3;
}

@end
