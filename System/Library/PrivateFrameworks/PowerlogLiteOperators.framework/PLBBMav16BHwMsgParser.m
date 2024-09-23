@implementation PLBBMav16BHwMsgParser

- (BOOL)parseData:(id)a3
{
  unsigned __int8 *v4;
  uint64_t v5;
  _QWORD *v6;
  unsigned __int8 *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unsigned __int8 *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD *v24;
  unsigned __int8 *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  unsigned __int8 *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  unsigned __int8 *v40;
  uint64_t v41;
  _QWORD *v42;
  unsigned __int8 *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  unsigned __int8 *v54;
  unsigned __int8 *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  _QWORD *v62;
  unsigned __int8 *v63;
  uint64_t v64;
  unsigned __int8 *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  unsigned __int8 *v71;
  uint64_t v72;
  _QWORD *v73;
  unsigned __int8 *v74;
  unsigned __int8 *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  uint64_t v81;
  _QWORD *v82;
  unsigned __int8 *v83;
  uint64_t v84;
  unsigned __int8 *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  uint64_t v91;
  _QWORD *v92;
  unsigned __int8 *v93;
  uint64_t v94;
  unsigned __int8 *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  unsigned __int8 *v101;
  uint64_t v102;
  _QWORD *v103;
  unsigned __int8 *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  NSObject *v109;
  unsigned __int8 *v110;
  uint64_t v111;
  _QWORD *v112;
  unsigned __int8 *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  NSObject *v118;
  unsigned __int8 *v119;
  uint64_t v120;
  _QWORD *v121;
  unsigned __int8 *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  NSObject *v127;
  unsigned __int8 *v128;
  uint64_t v129;
  _QWORD *v130;
  unsigned __int8 *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  NSObject *v136;
  unsigned __int8 *v137;
  uint64_t v138;
  _QWORD *v139;
  unsigned __int8 *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  NSObject *v145;
  unsigned __int8 *v146;
  uint64_t v147;
  _QWORD *v148;
  unsigned __int8 *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  NSObject *v154;
  unsigned __int8 *v155;
  uint64_t v156;
  _QWORD *v157;
  unsigned __int8 *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  NSObject *v163;
  uint64_t v164;
  _QWORD *v165;
  unsigned __int8 *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  NSObject *v171;
  unsigned __int8 *v172;
  uint64_t v173;
  _QWORD *v174;
  unsigned __int8 *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  NSObject *v180;
  unsigned __int8 *v181;
  uint64_t v182;
  _QWORD *v183;
  unsigned __int8 *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  NSObject *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  void *v193;
  unsigned __int8 *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  NSObject *v199;
  uint64_t v200;
  _QWORD *v201;
  uint64_t v202;
  unsigned __int8 *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  NSObject *v208;
  uint64_t v209;
  _QWORD *v210;
  uint64_t v211;
  unsigned __int8 *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  NSObject *v217;
  uint64_t v218;
  uint64_t v219;
  _QWORD *v220;
  void *v221;
  void *v222;
  void *v223;
  unsigned __int8 *v224;
  uint64_t v225;
  unsigned __int8 *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  NSObject *v231;
  uint64_t v232;
  _QWORD *v233;
  unint64_t v234;
  uint64_t v235;
  unsigned __int8 *v236;
  unsigned __int8 *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  NSObject *v242;
  uint64_t v243;
  _QWORD *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  uint64_t v249;
  _QWORD *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  uint64_t v255;
  _QWORD *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  uint64_t v261;
  _QWORD *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  uint64_t v267;
  _QWORD *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  uint64_t v273;
  _QWORD *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  uint64_t v279;
  _QWORD *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  uint64_t v285;
  _QWORD *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  uint64_t v291;
  _QWORD *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  uint64_t v297;
  _QWORD *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  uint64_t v303;
  _QWORD *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  uint64_t v309;
  _QWORD *v310;
  uint64_t v311;
  unsigned __int8 *v312;
  unsigned __int8 *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  NSObject *v318;
  uint64_t v319;
  _QWORD *v320;
  unsigned __int8 *v321;
  unsigned __int8 *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  NSObject *v327;
  uint64_t v328;
  _QWORD *v329;
  uint64_t v330;
  unsigned __int8 *v331;
  unsigned __int8 *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  NSObject *v337;
  uint64_t v338;
  _QWORD *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  uint64_t v344;
  _QWORD *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  uint64_t v350;
  _QWORD *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  uint64_t v356;
  _QWORD *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  uint64_t v362;
  _QWORD *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  uint64_t v368;
  _QWORD *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  uint64_t v374;
  _QWORD *v375;
  uint64_t v376;
  unsigned __int8 *v377;
  unsigned __int8 *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  NSObject *v383;
  uint64_t v384;
  _QWORD *v385;
  unsigned __int8 *v386;
  uint64_t v387;
  unsigned __int8 *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  NSObject *v393;
  int v394;
  unint64_t v395;
  void *v396;
  int v397;
  void *v398;
  uint64_t v399;
  _QWORD *v400;
  unsigned __int8 *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  NSObject *v406;
  uint64_t v407;
  uint64_t v408;
  id v409;
  unint64_t v410;
  unint64_t v411;
  NSObject *v412;
  id v414;
  unsigned __int8 *v415;
  uint64_t v416;
  id v417;
  void *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  void *v423;
  void *v424;
  unsigned __int8 *v425;
  PLBBMav16BHwMsgParser *v426;
  _QWORD v427[5];
  _QWORD v428[5];
  _QWORD v429[5];
  _QWORD v430[5];
  _QWORD v431[5];
  _QWORD v432[5];
  _QWORD v433[5];
  _QWORD v434[5];
  _QWORD v435[5];
  _QWORD v436[5];
  _QWORD v437[5];
  _QWORD v438[5];
  _QWORD v439[5];
  _QWORD v440[5];
  _QWORD v441[5];
  _QWORD v442[5];
  _QWORD v443[5];
  _QWORD v444[5];
  _QWORD v445[5];
  _QWORD v446[5];
  _QWORD v447[5];
  _QWORD v448[5];
  _QWORD v449[5];
  _QWORD v450[5];
  _QWORD v451[5];
  _QWORD v452[5];
  _QWORD v453[5];
  _QWORD v454[5];
  _QWORD v455[5];
  _QWORD v456[5];
  _QWORD v457[5];
  _QWORD v458[5];
  _QWORD v459[5];
  _QWORD v460[5];
  _QWORD v461[5];
  _QWORD v462[5];
  _QWORD v463[5];
  _QWORD v464[5];
  _QWORD v465[5];
  _QWORD v466[5];
  _QWORD v467[5];
  _QWORD v468[5];
  _QWORD v469[5];
  _QWORD v470[5];
  _QWORD v471[5];
  _QWORD v472[5];
  _QWORD v473[5];
  uint8_t buf[4];
  unsigned __int8 *v475;
  __int16 v476;
  uint64_t v477;
  __int16 v478;
  const char *v479;
  uint64_t v480;

  v480 = *MEMORY[0x1E0C80C00];
  v417 = objc_retainAutorelease(a3);
  v4 = (unsigned __int8 *)objc_msgSend(v417, "bytes");
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    v473[0] = MEMORY[0x1E0C809B0];
    v473[1] = 3221225472;
    v473[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke;
    v473[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v473[4] = v5;
    v6 = v473;
    if (qword_1ED886460 != -1)
      dispatch_once(&qword_1ED886460, v6);

    if (_MergedGlobals_80)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received data of length %lu"), objc_msgSend(v417, "length"));
      v7 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 34);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v475 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v418 = v13;
  if (*v4 == 129)
  {
    objc_msgSend(v13, "appendFormat:", CFSTR("SeqInd[%x] "), 129);
    v4 += 2;
    v14 = 2;
  }
  else
  {
    v14 = 0;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v15 = objc_opt_class();
    v472[0] = MEMORY[0x1E0C809B0];
    v472[1] = 3221225472;
    v472[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_253;
    v472[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v472[4] = v15;
    v16 = v472;
    if (qword_1ED886468 != -1)
      dispatch_once(&qword_1ED886468, v16);

    if (byte_1ED886409)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Log header starts at offset %llu"), v14);
      v17 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 46);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v475 = v17;
        _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v23 = objc_opt_class();
    v471[0] = MEMORY[0x1E0C809B0];
    v471[1] = 3221225472;
    v471[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_258;
    v471[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v471[4] = v23;
    v24 = v471;
    if (qword_1ED886470 != -1)
      dispatch_once(&qword_1ED886470, v24);

    if (byte_1ED88640A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stats header starts at offset %llu"), v14 | 0xD);
      v25 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lastPathComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 50);

      PLLogCommon();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v475 = v25;
        _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLMav4BasebandHardwareMessage setHeader:](self, "setHeader:", v4 + 13);
  objc_msgSend(v418, "appendFormat:", CFSTR("Sw Rev[%0x %0x] "), v4[13], v4[14]);
  objc_msgSend(v418, "appendFormat:", CFSTR("Hw Rev[%0x %0x] "), v4[15], v4[16]);
  v31 = 0x1E0D7F000uLL;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v32 = objc_opt_class();
    v470[0] = MEMORY[0x1E0C809B0];
    v470[1] = 3221225472;
    v470[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_267;
    v470[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v470[4] = v32;
    v33 = v470;
    if (qword_1ED886478 != -1)
      dispatch_once(&qword_1ED886478, v33);

    v31 = 0x1E0D7F000;
    if (byte_1ED88640B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Header Info: %@"), v418);
      v34 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastPathComponent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 56);

      PLLogCommon();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v475 = v34;
        _os_log_debug_impl(&dword_1CAF47000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v31 = 0x1E0D7F000uLL;
    }
  }
  v40 = v4 + 33;
  if (objc_msgSend(*(id *)(v31 + 4000), "debugEnabled"))
  {
    v41 = objc_opt_class();
    v469[0] = MEMORY[0x1E0C809B0];
    v469[1] = 3221225472;
    v469[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_272;
    v469[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v469[4] = v41;
    v42 = v469;
    if (qword_1ED886480 != -1)
      dispatch_once(&qword_1ED886480, v42);

    if (byte_1ED88640C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Size after Seq and Statsheader %lu"), objc_msgSend(v417, "length") - 22);
      v43 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "lastPathComponent");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "logMessage:fromFile:fromFunction:fromLineNumber:", v43, v46, v47, 61);

      PLLogCommon();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v475 = v43;
        _os_log_debug_impl(&dword_1CAF47000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v40 = v4 + 33;
    }
  }
  v49 = v14 | 0x21;
  -[PLMav4BasebandHardwareMessage setLogDuration:](self, "setLogDuration:", ((_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[16]- (_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[12]));
  v50 = 0x1E0D7F000uLL;
  if (-[PLMav4BasebandHardwareMessage level](self, "level"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v51 = objc_opt_class();
      v468[0] = MEMORY[0x1E0C809B0];
      v468[1] = 3221225472;
      v468[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_277;
      v468[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v468[4] = v51;
      v52 = v468;
      if (qword_1ED886488 != -1)
        dispatch_once(&qword_1ED886488, v52);

      if (byte_1ED88640D)
      {
        v53 = v14;
        v54 = v40;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 1: RPM starts at offset %llu"), v49);
        v55 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "lastPathComponent");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "logMessage:fromFile:fromFunction:fromLineNumber:", v55, v58, v59, 68);

        PLLogCommon();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v55;
          _os_log_debug_impl(&dword_1CAF47000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v50 = 0x1E0D7F000uLL;
        v40 = v54;
        v14 = v53;
      }
    }
    -[PLBBMav13HwMsgParser setRpmData:](self, "setRpmData:", v40);
    v40 = v4 + 57;
    v49 = v14 | 0x39;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 2)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v61 = objc_opt_class();
      v467[0] = MEMORY[0x1E0C809B0];
      v467[1] = 3221225472;
      v467[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_282;
      v467[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v467[4] = v61;
      v62 = v467;
      if (qword_1ED886490 != -1)
        dispatch_once(&qword_1ED886490, v62);

      if (byte_1ED88640E)
      {
        v63 = v40;
        v64 = v49;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 2: Apps Perf starts at offset %llu"), v49);
        v65 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v66 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "lastPathComponent");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "logMessage:fromFile:fromFunction:fromLineNumber:", v65, v68, v69, 77);

        PLLogCommon();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v65;
          _os_log_debug_impl(&dword_1CAF47000, v70, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v63;
        v49 = v64;
      }
    }
    -[PLBBMav16BHwMsgParser setMav16BAppsPerf:](self, "setMav16BAppsPerf:", v40);
    v71 = v40 + 32;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v72 = objc_opt_class();
      v466[0] = MEMORY[0x1E0C809B0];
      v466[1] = 3221225472;
      v466[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_287;
      v466[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v466[4] = v72;
      v73 = v466;
      if (qword_1ED886498 != -1)
        dispatch_once(&qword_1ED886498, v73);

      if (byte_1ED88640F)
      {
        v74 = v40;
        v419 = v49;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 2: Apps Sleep starts at offset %llu"), v49 + 32);
        v75 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v76 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "lastPathComponent");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "logMessage:fromFile:fromFunction:fromLineNumber:", v75, v78, v79, 82);

        PLLogCommon();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v75;
          _os_log_debug_impl(&dword_1CAF47000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v74;
        v49 = v419;
      }
    }
    -[PLBBMav13HwMsgParser setAppsSleep:](self, "setAppsSleep:", v71);
    v40 += 44;
    v49 += 44;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 3)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v81 = objc_opt_class();
      v465[0] = MEMORY[0x1E0C809B0];
      v465[1] = 3221225472;
      v465[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_292;
      v465[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v465[4] = v81;
      v82 = v465;
      if (qword_1ED8864A0 != -1)
        dispatch_once(&qword_1ED8864A0, v82);

      if (byte_1ED886410)
      {
        v83 = v40;
        v84 = v49;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 3: PCIE stats starts at offset %llu"), v49);
        v85 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v86 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "lastPathComponent");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "logMessage:fromFile:fromFunction:fromLineNumber:", v85, v88, v89, 91);

        PLLogCommon();
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v85;
          _os_log_debug_impl(&dword_1CAF47000, v90, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v83;
        v49 = v84;
      }
    }
    -[PLBBMav13HwMsgParser setPcieState:](self, "setPcieState:", v40);
    v40 += 12;
    v49 += 12;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 4)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v91 = objc_opt_class();
      v464[0] = MEMORY[0x1E0C809B0];
      v464[1] = 3221225472;
      v464[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_297;
      v464[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v464[4] = v91;
      v92 = v464;
      if (qword_1ED8864A8 != -1)
        dispatch_once(&qword_1ED8864A8, v92);

      if (byte_1ED886411)
      {
        v93 = v40;
        v94 = v49;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 4: LPASS stats starts at offset %llu"), v49);
        v95 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v96 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "lastPathComponent");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "logMessage:fromFile:fromFunction:fromLineNumber:", v95, v98, v99, 100);

        PLLogCommon();
        v100 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v95;
          _os_log_debug_impl(&dword_1CAF47000, v100, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v93;
        v49 = v94;
      }
    }
    -[PLBBMav13HwMsgParser setLpassState:](self, "setLpassState:", v40);
    v40 += 8;
    v49 += 8;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 5)
  {
    v101 = v40;
    v420 = v49;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v102 = objc_opt_class();
      v463[0] = MEMORY[0x1E0C809B0];
      v463[1] = 3221225472;
      v463[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_302;
      v463[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v463[4] = v102;
      v103 = v463;
      if (qword_1ED8864B0 != -1)
        dispatch_once(&qword_1ED8864B0, v103);

      if (byte_1ED886412)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: Apps Sleep veto stats starts at offset %llu"), v49);
        v104 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v105 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "lastPathComponent");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "logMessage:fromFile:fromFunction:fromLineNumber:", v104, v107, v108, 109);

        PLLogCommon();
        v109 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v104;
          _os_log_debug_impl(&dword_1CAF47000, v109, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        v49 = v420;
      }
    }
    -[PLBBMav16BHwMsgParser setMav16BAppsSleepVeto:](self, "setMav16BAppsSleepVeto:", v40);
    v110 = v40 + 16;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v111 = objc_opt_class();
      v462[0] = MEMORY[0x1E0C809B0];
      v462[1] = 3221225472;
      v462[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_307;
      v462[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v462[4] = v111;
      v112 = v462;
      if (qword_1ED8864B8 != -1)
        dispatch_once(&qword_1ED8864B8, v112);

      if (byte_1ED886413)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: MPSS Sleep veto stats starts at offset %llu"), v49 + 16);
        v113 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v114 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "lastPathComponent");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "logMessage:fromFile:fromFunction:fromLineNumber:", v113, v116, v117, 114);

        PLLogCommon();
        v118 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v113;
          _os_log_debug_impl(&dword_1CAF47000, v118, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        v49 = v420;
      }
    }
    -[PLBBMav16BHwMsgParser setMav16BMpssSleepVeto:](self, "setMav16BMpssSleepVeto:", v110);
    v119 = v40 + 100;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v120 = objc_opt_class();
      v461[0] = MEMORY[0x1E0C809B0];
      v461[1] = 3221225472;
      v461[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_312;
      v461[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v461[4] = v120;
      v121 = v461;
      if (qword_1ED8864C0 != -1)
        dispatch_once(&qword_1ED8864C0, v121);

      if (byte_1ED886414)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: QDSP Sleep veto stats starts at offset %llu"), v49 + 100);
        v122 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v123 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "lastPathComponent");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "logMessage:fromFile:fromFunction:fromLineNumber:", v122, v125, v126, 119);

        PLLogCommon();
        v127 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v122;
          _os_log_debug_impl(&dword_1CAF47000, v127, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        v49 = v420;
      }
    }
    -[PLBBMav16BHwMsgParser setMav16BQdspSpeed:](self, "setMav16BQdspSpeed:", v119);
    v128 = v40 + 144;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v129 = objc_opt_class();
      v460[0] = MEMORY[0x1E0C809B0];
      v460[1] = 3221225472;
      v460[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_317;
      v460[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v460[4] = v129;
      v130 = v460;
      if (qword_1ED8864C8 != -1)
        dispatch_once(&qword_1ED8864C8, v130);

      if (byte_1ED886415)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: MPSS Sleep stats starts at offset %llu"), v49 + 144);
        v131 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v132 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "lastPathComponent");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "logMessage:fromFile:fromFunction:fromLineNumber:", v131, v134, v135, 124);

        PLLogCommon();
        v136 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v131;
          _os_log_debug_impl(&dword_1CAF47000, v136, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        v49 = v420;
      }
    }
    -[PLBBMav13HwMsgParser setMpssSleep:](self, "setMpssSleep:", v128);
    v137 = v40 + 156;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v138 = objc_opt_class();
      v459[0] = MEMORY[0x1E0C809B0];
      v459[1] = 3221225472;
      v459[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_322;
      v459[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v459[4] = v138;
      v139 = v459;
      if (qword_1ED8864D0 != -1)
        dispatch_once(&qword_1ED8864D0, v139);

      if (byte_1ED886416)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: GPS stats starts at offset %llu"), v49 + 156);
        v140 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v141 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "lastPathComponent");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "logMessage:fromFile:fromFunction:fromLineNumber:", v140, v143, v144, 129);

        PLLogCommon();
        v145 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v140;
          _os_log_debug_impl(&dword_1CAF47000, v145, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        v49 = v420;
      }
    }
    -[PLBBMav13HwMsgParser setGpsState:](self, "setGpsState:", v137);
    v146 = v40 + 164;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v147 = objc_opt_class();
      v458[0] = MEMORY[0x1E0C809B0];
      v458[1] = 3221225472;
      v458[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_327;
      v458[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v458[4] = v147;
      v148 = v458;
      if (qword_1ED8864D8 != -1)
        dispatch_once(&qword_1ED8864D8, v148);

      if (byte_1ED886417)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: GPS DPO stats starts at offset %llu"), v49 + 164);
        v149 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v150 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "lastPathComponent");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "logMessage:fromFile:fromFunction:fromLineNumber:", v149, v152, v153, 134);

        PLLogCommon();
        v154 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v149;
          _os_log_debug_impl(&dword_1CAF47000, v154, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        v49 = v420;
      }
    }
    -[PLBBMav13HwMsgParser setGpsDpoState:](self, "setGpsDpoState:", v146);
    v155 = v40 + 172;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v156 = objc_opt_class();
      v457[0] = MEMORY[0x1E0C809B0];
      v457[1] = 3221225472;
      v457[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_332;
      v457[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v457[4] = v156;
      v157 = v457;
      if (qword_1ED8864E0 != -1)
        dispatch_once(&qword_1ED8864E0, v157);

      if (byte_1ED886418)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: GPS DPO bin stats starts at offset %llu"), v49 + 172);
        v158 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v159 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "lastPathComponent");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "logMessage:fromFile:fromFunction:fromLineNumber:", v158, v161, v162, 139);

        PLLogCommon();
        v163 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v158;
          _os_log_debug_impl(&dword_1CAF47000, v163, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        v49 = v420;
      }
    }
    -[PLBBMav13HwMsgParser setGpsDpoBins:](self, "setGpsDpoBins:", v155);
    v40 += 196;
    v49 += 196;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 6)
  {
    v425 = v40;
    v421 = v49;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v164 = objc_opt_class();
      v456[0] = MEMORY[0x1E0C809B0];
      v456[1] = 3221225472;
      v456[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_337;
      v456[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v456[4] = v164;
      v165 = v456;
      if (qword_1ED8864E8 != -1)
        dispatch_once(&qword_1ED8864E8, v165);

      if (byte_1ED886419)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 6: MCPM Sleep veto starts at offset %llu"), v49);
        v166 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v167 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v168, "lastPathComponent");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v167, "logMessage:fromFile:fromFunction:fromLineNumber:", v166, v169, v170, 148);

        PLLogCommon();
        v171 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v171, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v166;
          _os_log_debug_impl(&dword_1CAF47000, v171, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v425;
        v49 = v421;
      }
    }
    -[PLBBMav16BHwMsgParser setMcpmSleepVetoMav16B:](self, "setMcpmSleepVetoMav16B:", v40);
    v172 = v40 + 56;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v173 = objc_opt_class();
      v455[0] = MEMORY[0x1E0C809B0];
      v455[1] = 3221225472;
      v455[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_342;
      v455[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v455[4] = v173;
      v174 = v455;
      if (qword_1ED8864F0 != -1)
        dispatch_once(&qword_1ED8864F0, v174);

      if (byte_1ED88641A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 6: Protocol Active starts at offset %llu"), v49 + 56);
        v175 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v176 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "lastPathComponent");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "logMessage:fromFile:fromFunction:fromLineNumber:", v175, v178, v179, 153);

        PLLogCommon();
        v180 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v175;
          _os_log_debug_impl(&dword_1CAF47000, v180, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v425;
        v49 = v421;
      }
    }
    -[PLBBMav13HwMsgParser setProtocolActive:](self, "setProtocolActive:", v172);
    v181 = v40 + 80;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v182 = objc_opt_class();
      v454[0] = MEMORY[0x1E0C809B0];
      v454[1] = 3221225472;
      v454[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_347;
      v454[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v454[4] = v182;
      v183 = v454;
      if (qword_1ED8864F8 != -1)
        dispatch_once(&qword_1ED8864F8, v183);

      if (byte_1ED88641B)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 6: Optim mask starts at offset %llu"), v49 + 80);
        v184 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v185 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v186, "lastPathComponent");
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v185, "logMessage:fromFile:fromFunction:fromLineNumber:", v184, v187, v188, 158);

        PLLogCommon();
        v189 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v184;
          _os_log_debug_impl(&dword_1CAF47000, v189, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v425;
        v49 = v421;
      }
    }
    -[PLBBMav13HwMsgParser setOptimMaskArray:](self, "setOptimMaskArray:", v181);
    if (-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray"))
      NSLog(CFSTR("not null"));
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", objc_opt_class()))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), *(unsigned __int8 *)-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray"));
      v190 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1]);
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[2]);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[3]);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      v423 = (void *)v190;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Optim Mask [%@ %@ %@ %@]"), v190, v191, v192, v193);
      v194 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v195 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v196, "lastPathComponent");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "logMessage:fromFile:fromFunction:fromLineNumber:", v194, v197, v198, 169);

      PLLogCommon();
      v199 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v199, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v475 = v194;
        _os_log_debug_impl(&dword_1CAF47000, v199, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v50 = 0x1E0D7F000uLL;
      v40 = v425;
      v49 = v421;
    }
    v49 += 84;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v200 = objc_opt_class();
      v453[0] = MEMORY[0x1E0C809B0];
      v453[1] = 3221225472;
      v453[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_358;
      v453[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v453[4] = v200;
      v201 = v453;
      if (qword_1ED886500 != -1)
        dispatch_once(&qword_1ED886500, v201);

      if (byte_1ED88641C)
      {
        v202 = v49;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 6: Protocol State starts at offset %llu"), v49);
        v203 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v204 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v205, "lastPathComponent");
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v204, "logMessage:fromFile:fromFunction:fromLineNumber:", v203, v206, v207, 173);

        PLLogCommon();
        v208 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v208, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v203;
          _os_log_debug_impl(&dword_1CAF47000, v208, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v50 = 0x1E0D7F000uLL;
        v49 = v202;
      }
    }
    v40 += 84;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v209 = objc_opt_class();
      v452[0] = MEMORY[0x1E0C809B0];
      v452[1] = 3221225472;
      v452[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_363;
      v452[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v452[4] = v209;
      v210 = v452;
      if (qword_1ED886508 != -1)
        dispatch_once(&qword_1ED886508, v210);

      if (byte_1ED88641D)
      {
        v211 = v49;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 6: Optim mask value [0x%x]"), *(unsigned int *)-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray"));
        v212 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v213 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v214, "lastPathComponent");
        v215 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v216 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v213, "logMessage:fromFile:fromFunction:fromLineNumber:", v212, v215, v216, 178);

        PLLogCommon();
        v217 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v217, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v212;
          _os_log_debug_impl(&dword_1CAF47000, v217, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v50 = 0x1E0D7F000uLL;
        v49 = v211;
      }
    }
    +[PLBBMav13HwMsgParser optimMaskMappings](PLBBMav13HwMsgParser, "optimMaskMappings");
    v424 = (void *)objc_claimAutoreleasedReturnValue();
    v218 = 0;
    v426 = self;
    do
    {
      if (((*(_DWORD *)-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") >> v218) & 1) != 0)
      {
        if (objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
        {
          v219 = objc_opt_class();
          v451[0] = MEMORY[0x1E0C809B0];
          v451[1] = 3221225472;
          v451[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_369;
          v451[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v451[4] = v219;
          v220 = v451;
          if (qword_1ED886510 != -1)
            dispatch_once(&qword_1ED886510, v220);

          if (byte_1ED88641E)
          {
            v221 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v218);
            v222 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v424, "objectForKeyedSubscript:", v222);
            v223 = (void *)objc_claimAutoreleasedReturnValue();
            v224 = v40;
            v225 = v49;
            objc_msgSend(v221, "stringWithFormat:", CFSTR("Payload %@ is present at offset %llu, pointer %ld"), v223, v49, v40);
            v226 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();

            v227 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v228 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v228, "lastPathComponent");
            v229 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v230 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v227, "logMessage:fromFile:fromFunction:fromLineNumber:", v226, v229, v230, 184);

            PLLogCommon();
            v231 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v231, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v475 = v226;
              _os_log_debug_impl(&dword_1CAF47000, v231, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v40 = v224;
            v49 = v225;
            self = v426;
          }
        }
        switch((int)v218)
        {
          case 0:
            -[PLBBMav13HwMsgParser setProtoStateC2K:](self, "setProtoStateC2K:", v40);
            v49 += 64;
            v40 += 64;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v232 = objc_opt_class();
            v450[0] = MEMORY[0x1E0C809B0];
            v450[1] = 3221225472;
            v450[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_375;
            v450[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v450[4] = v232;
            v233 = v450;
            if (qword_1ED886518 != -1)
              dispatch_once(&qword_1ED886518, v233);

            if (!byte_1ED88641F)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v238 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v239 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v239, "lastPathComponent");
            v240 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v241 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v238, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v240, v241, 191);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 1:
            -[PLBBMav13HwMsgParser setProtoStateHDR:](self, "setProtoStateHDR:", v40);
            v49 += 64;
            v40 += 64;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v243 = objc_opt_class();
            v449[0] = MEMORY[0x1E0C809B0];
            v449[1] = 3221225472;
            v449[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_380;
            v449[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v449[4] = v243;
            v244 = v449;
            if (qword_1ED886520 != -1)
              dispatch_once(&qword_1ED886520, v244);

            if (!byte_1ED886420)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v245 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v246 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v246, "lastPathComponent");
            v247 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v248 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v245, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v247, v248, 197);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 2:
            -[PLBBMav13HwMsgParser setProtoStateGSM:](self, "setProtoStateGSM:", v40);
            v49 += 64;
            v40 += 64;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v249 = objc_opt_class();
            v448[0] = MEMORY[0x1E0C809B0];
            v448[1] = 3221225472;
            v448[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_383;
            v448[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v448[4] = v249;
            v250 = v448;
            if (qword_1ED886528 != -1)
              dispatch_once(&qword_1ED886528, v250);

            if (!byte_1ED886421)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v251 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v252 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v252, "lastPathComponent");
            v253 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v254 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v251, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v253, v254, 203);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 3:
            -[PLBBMav13HwMsgParser setProtoStateWCDMA:](self, "setProtoStateWCDMA:", v40);
            v49 += 64;
            v40 += 64;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v255 = objc_opt_class();
            v447[0] = MEMORY[0x1E0C809B0];
            v447[1] = 3221225472;
            v447[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_386;
            v447[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v447[4] = v255;
            v256 = v447;
            if (qword_1ED886530 != -1)
              dispatch_once(&qword_1ED886530, v256);

            if (!byte_1ED886422)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v257 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v258 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v258, "lastPathComponent");
            v259 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v260 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v257, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v259, v260, 209);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 4:
            -[PLBBMav13HwMsgParser setProtoStateLTE:](self, "setProtoStateLTE:", v40);
            v49 += 64;
            v40 += 64;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v261 = objc_opt_class();
            v446[0] = MEMORY[0x1E0C809B0];
            v446[1] = 3221225472;
            v446[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_389;
            v446[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v446[4] = v261;
            v262 = v446;
            if (qword_1ED886538 != -1)
              dispatch_once(&qword_1ED886538, v262);

            if (!byte_1ED886423)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v263 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v264 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v264, "lastPathComponent");
            v265 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v266 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v263, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v265, v266, 215);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 5:
            -[PLBBMav13HwMsgParser setProtoStateTDS:](self, "setProtoStateTDS:", v40);
            v49 += 64;
            v40 += 64;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v267 = objc_opt_class();
            v445[0] = MEMORY[0x1E0C809B0];
            v445[1] = 3221225472;
            v445[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_392;
            v445[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v445[4] = v267;
            v268 = v445;
            if (qword_1ED886540 != -1)
              dispatch_once(&qword_1ED886540, v268);

            if (!byte_1ED886424)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v269 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v270 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v270, "lastPathComponent");
            v271 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v272 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v269, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v271, v272, 221);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 6:
            -[PLBBMav13HwMsgParser setRfDataC2K:](self, "setRfDataC2K:", v40);
            v49 += 256;
            v40 += 256;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v273 = objc_opt_class();
            v444[0] = MEMORY[0x1E0C809B0];
            v444[1] = 3221225472;
            v444[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_395;
            v444[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v444[4] = v273;
            v274 = v444;
            if (qword_1ED886548 != -1)
              dispatch_once(&qword_1ED886548, v274);

            if (!byte_1ED886425)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 256);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v275 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v276 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v276, "lastPathComponent");
            v277 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v278 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v275, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v277, v278, 227);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 7:
            -[PLBBMav13HwMsgParser setRfData1xEVDO:](self, "setRfData1xEVDO:", v40);
            v49 += 256;
            v40 += 256;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v279 = objc_opt_class();
            v443[0] = MEMORY[0x1E0C809B0];
            v443[1] = 3221225472;
            v443[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_398;
            v443[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v443[4] = v279;
            v280 = v443;
            if (qword_1ED886550 != -1)
              dispatch_once(&qword_1ED886550, v280);

            if (!byte_1ED886426)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 256);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v281 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v282 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v282, "lastPathComponent");
            v283 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v284 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v281, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v283, v284, 233);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 8:
            -[PLBBMav13HwMsgParser setRfDataGSM:](self, "setRfDataGSM:", v40);
            v49 += 256;
            v40 += 256;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v285 = objc_opt_class();
            v442[0] = MEMORY[0x1E0C809B0];
            v442[1] = 3221225472;
            v442[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_401;
            v442[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v442[4] = v285;
            v286 = v442;
            if (qword_1ED886558 != -1)
              dispatch_once(&qword_1ED886558, v286);

            if (!byte_1ED886427)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 256);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v287 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v288 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v288, "lastPathComponent");
            v289 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v290 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v287, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v289, v290, 239);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 9:
            -[PLBBMav13HwMsgParser setRfDataWCDMA:](self, "setRfDataWCDMA:", v40);
            v49 += 208;
            v40 += 208;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v291 = objc_opt_class();
            v441[0] = MEMORY[0x1E0C809B0];
            v441[1] = 3221225472;
            v441[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_404;
            v441[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v441[4] = v291;
            v292 = v441;
            if (qword_1ED886560 != -1)
              dispatch_once(&qword_1ED886560, v292);

            if (!byte_1ED886428)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 208);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v293 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v294 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v294, "lastPathComponent");
            v295 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v296 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v293, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v295, v296, 245);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 10:
            -[PLBBMav13HwMsgParser setRfDataLTE:](self, "setRfDataLTE:", v40);
            v49 += 256;
            v40 += 256;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v297 = objc_opt_class();
            v440[0] = MEMORY[0x1E0C809B0];
            v440[1] = 3221225472;
            v440[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_407;
            v440[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v440[4] = v297;
            v298 = v440;
            if (qword_1ED886568 != -1)
              dispatch_once(&qword_1ED886568, v298);

            if (!byte_1ED886429)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 256);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v299 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v300 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v300, "lastPathComponent");
            v301 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v302 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v299, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v301, v302, 251);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 11:
            -[PLBBMav13HwMsgParser setRfDataTDS:](self, "setRfDataTDS:", v40);
            v49 += 256;
            v40 += 256;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v303 = objc_opt_class();
            v439[0] = MEMORY[0x1E0C809B0];
            v439[1] = 3221225472;
            v439[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_410;
            v439[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v439[4] = v303;
            v304 = v439;
            if (qword_1ED886570 != -1)
              dispatch_once(&qword_1ED886570, v304);

            if (!byte_1ED88642A)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 256);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v305 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v306 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v306, "lastPathComponent");
            v307 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v308 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v305, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v307, v308, 257);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 12:
            -[PLBBMav16BHwMsgParser setRfEnhLTEMav16B:](self, "setRfEnhLTEMav16B:", v40);
            if (objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
            {
              v309 = objc_opt_class();
              v434[0] = MEMORY[0x1E0C809B0];
              v434[1] = 3221225472;
              v434[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_425;
              v434[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v434[4] = v309;
              v310 = v434;
              if (qword_1ED886598 != -1)
                dispatch_once(&qword_1ED886598, v310);

              if (byte_1ED88642F)
              {
                v311 = v49;
                v312 = v40;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 492);
                v313 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v314 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
                v315 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v315, "lastPathComponent");
                v316 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
                v317 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v314, "logMessage:fromFile:fromFunction:fromLineNumber:", v313, v316, v317, 287);

                PLLogCommon();
                v318 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v318, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v475 = v313;
                  _os_log_debug_impl(&dword_1CAF47000, v318, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v40 = v312;
                v49 = v311;
                self = v426;
              }
            }
            if (objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
            {
              v319 = objc_opt_class();
              v433[0] = MEMORY[0x1E0C809B0];
              v433[1] = 3221225472;
              v433[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_428;
              v433[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v433[4] = v319;
              v320 = v433;
              if (qword_1ED8865A0 != -1)
                dispatch_once(&qword_1ED8865A0, v320);

              if (byte_1ED886430)
              {
                v422 = v49;
                v321 = v40;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("received PCC bw/band in struct %d,%d. SCC1 bw/band in struct %d,%d"), -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[485], -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[484], -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[489], -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[486]);
                v322 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v323 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
                v324 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v324, "lastPathComponent");
                v325 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
                v326 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v323, "logMessage:fromFile:fromFunction:fromLineNumber:", v322, v325, v326, 290);

                PLLogCommon();
                v327 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v327, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v475 = v322;
                  _os_log_debug_impl(&dword_1CAF47000, v327, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v50 = 0x1E0D7F000uLL;
                v40 = v321;
                v49 = v422;
              }
            }
            if (objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
            {
              v328 = objc_opt_class();
              v432[0] = MEMORY[0x1E0C809B0];
              v432[1] = 3221225472;
              v432[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_433;
              v432[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v432[4] = v328;
              v329 = v432;
              if (qword_1ED8865A8 != -1)
                dispatch_once(&qword_1ED8865A8, v329);

              if (byte_1ED886431)
              {
                v330 = v49;
                v331 = v40;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received ARD stats %u"), -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[368]);
                v332 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v333 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
                v334 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v334, "lastPathComponent");
                v335 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
                v336 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v333, "logMessage:fromFile:fromFunction:fromLineNumber:", v332, v335, v336, 291);

                PLLogCommon();
                v337 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v337, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v475 = v332;
                  _os_log_debug_impl(&dword_1CAF47000, v337, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v40 = v331;
                v49 = v330;
                self = v426;
              }
            }
            v49 += 494;
            v40 += 494;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v338 = objc_opt_class();
            v431[0] = MEMORY[0x1E0C809B0];
            v431[1] = 3221225472;
            v431[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_438;
            v431[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v431[4] = v338;
            v339 = v431;
            if (qword_1ED8865B0 != -1)
              dispatch_once(&qword_1ED8865B0, v339);

            if (!byte_1ED886432)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Padding size for padding before LTE struct [%lu]"), 2);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v340 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v341 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v341, "lastPathComponent");
            v342 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v343 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v340, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v342, v343, 292);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 13:
            -[PLBBMav16BHwMsgParser setRfEnhWCDMAMav16B:](self, "setRfEnhWCDMAMav16B:", v40);
            v49 += 176;
            v40 += 176;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v344 = objc_opt_class();
            v435[0] = MEMORY[0x1E0C809B0];
            v435[1] = 3221225472;
            v435[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_422;
            v435[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v435[4] = v344;
            v345 = v435;
            if (qword_1ED886590 != -1)
              dispatch_once(&qword_1ED886590, v345);

            if (!byte_1ED88642E)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 176);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v346 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v347 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v347, "lastPathComponent");
            v348 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v349 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v346, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v348, v349, 281);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 14:
            -[PLBBMav13HwMsgParser setRfEnhGSM:](self, "setRfEnhGSM:", v40);
            v49 += 20;
            v40 += 20;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v350 = objc_opt_class();
            v436[0] = MEMORY[0x1E0C809B0];
            v436[1] = 3221225472;
            v436[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_419;
            v436[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v436[4] = v350;
            v351 = v436;
            if (qword_1ED886588 != -1)
              dispatch_once(&qword_1ED886588, v351);

            if (!byte_1ED88642D)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 20);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v352 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v353 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v353, "lastPathComponent");
            v354 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v355 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v352, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v354, v355, 275);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 15:
            -[PLBBMav13HwMsgParser setRfEnhTDS:](self, "setRfEnhTDS:", v40);
            v49 += 48;
            v40 += 48;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v356 = objc_opt_class();
            v430[0] = MEMORY[0x1E0C809B0];
            v430[1] = 3221225472;
            v430[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_443;
            v430[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v430[4] = v356;
            v357 = v430;
            if (qword_1ED8865B8 != -1)
              dispatch_once(&qword_1ED8865B8, v357);

            if (!byte_1ED886433)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 48);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v358 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v359 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v359, "lastPathComponent");
            v360 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v361 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v358, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v360, v361, 298);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 16:
            -[PLBBMav13HwMsgParser setRfEnhC2K:](self, "setRfEnhC2K:", v40);
            v49 += 40;
            v40 += 40;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v362 = objc_opt_class();
            v438[0] = MEMORY[0x1E0C809B0];
            v438[1] = 3221225472;
            v438[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_413;
            v438[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v438[4] = v362;
            v363 = v438;
            if (qword_1ED886578 != -1)
              dispatch_once(&qword_1ED886578, v363);

            if (!byte_1ED88642B)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 40);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v364 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v365 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v365, "lastPathComponent");
            v366 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v367 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v364, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v366, v367, 263);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 17:
            -[PLBBMav13HwMsgParser setRfEnh1xEVDO:](self, "setRfEnh1xEVDO:", v40);
            v49 += 32;
            v40 += 32;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v368 = objc_opt_class();
            v437[0] = MEMORY[0x1E0C809B0];
            v437[1] = 3221225472;
            v437[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_416;
            v437[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v437[4] = v368;
            v369 = v437;
            if (qword_1ED886580 != -1)
              dispatch_once(&qword_1ED886580, v369);

            if (!byte_1ED88642C)
              break;
            v234 = v50;
            v235 = v49;
            v236 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 32);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v370 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
            v371 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v371, "lastPathComponent");
            v372 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
            v373 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v370, "logMessage:fromFile:fromFunction:fromLineNumber:", v237, v372, v373, 269);

            PLLogCommon();
            v242 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
            {
LABEL_313:
              *(_DWORD *)buf = 138412290;
              v475 = v237;
              _os_log_debug_impl(&dword_1CAF47000, v242, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
LABEL_314:
            v40 = v236;
            v49 = v235;
            v50 = v234;

            self = v426;
            break;
          case 18:
            -[PLBBMav13HwMsgParser setRfEnhOOS:](self, "setRfEnhOOS:", v40);
            v49 += 156;
            v40 += 156;
            if (objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
            {
              v374 = objc_opt_class();
              v429[0] = MEMORY[0x1E0C809B0];
              v429[1] = 3221225472;
              v429[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_446;
              v429[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v429[4] = v374;
              v375 = v429;
              if (qword_1ED8865C0 != -1)
                dispatch_once(&qword_1ED8865C0, v375);

              if (byte_1ED886434)
              {
                v376 = v49;
                v377 = v40;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 156);
                v378 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v379 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
                v380 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v380, "lastPathComponent");
                v381 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
                v382 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v379, "logMessage:fromFile:fromFunction:fromLineNumber:", v378, v381, v382, 304);

                PLLogCommon();
                v383 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v383, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v475 = v378;
                  _os_log_debug_impl(&dword_1CAF47000, v383, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v40 = v377;
                v49 = v376;
              }
            }
            goto LABEL_324;
          default:
            break;
        }
      }
      v218 = (v218 + 1);
    }
    while ((_DWORD)v218 != 19);
LABEL_324:
    if ((objc_msgSend(*(id *)(v50 + 4000), "debugEnabled") & 1) != 0)
    {
      v384 = objc_opt_class();
      v428[0] = MEMORY[0x1E0C809B0];
      v428[1] = 3221225472;
      v428[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_449;
      v428[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v428[4] = v384;
      v385 = v428;
      if (qword_1ED8865C8 != -1)
        dispatch_once(&qword_1ED8865C8, v385);

      if (byte_1ED886435)
      {
        v386 = v40;
        v387 = v49;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("End of Proto, Rf, Enh data at offset %llu"), v49);
        v388 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v389 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v390 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v390, "lastPathComponent");
        v391 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v392 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v389, "logMessage:fromFile:fromFunction:fromLineNumber:", v388, v391, v392, 310);

        PLLogCommon();
        v393 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v393, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v388;
          _os_log_debug_impl(&dword_1CAF47000, v393, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v386;
        v49 = v387;
        self = v426;
      }
    }

  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 7)
  {
    -[PLMav7BasebandHardwareMessage setApps_clock_duration_mask:](self, "setApps_clock_duration_mask:", v40);
    v394 = -[PLBBMav13HwMsgParser GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage apps_clock_duration_mask](self, "apps_clock_duration_mask"));
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v395 = v50;
    v396 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMav7BasebandHardwareMessage setApps_clock_duration:](self, "setApps_clock_duration:", v396);

    -[PLBBMav13HwMsgParser SetClocks:oftype:withData:](self, "SetClocks:oftype:withData:", -[PLMav7BasebandHardwareMessage apps_clock_duration_mask](self, "apps_clock_duration_mask"), 0, v40 + 16);
    -[PLMav7BasebandHardwareMessage setMpss_clock_duration_mask:](self, "setMpss_clock_duration_mask:", &v40[4 * v394 + 16]);
    v397 = -[PLBBMav13HwMsgParser GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage mpss_clock_duration_mask](self, "mpss_clock_duration_mask"));
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v398 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMav7BasebandHardwareMessage setMpss_clock_duration:](self, "setMpss_clock_duration:", v398);

    -[PLBBMav13HwMsgParser SetClocks:oftype:withData:](self, "SetClocks:oftype:withData:", -[PLMav7BasebandHardwareMessage mpss_clock_duration_mask](self, "mpss_clock_duration_mask"), 1, &v40[4 * v394 + 32]);
    v40 += 4 * v394 + 4 * v397 + 32;
    if (objc_msgSend(*(id *)(v395 + 4000), "debugEnabled"))
    {
      v399 = objc_opt_class();
      v427[0] = MEMORY[0x1E0C809B0];
      v427[1] = 3221225472;
      v427[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_454;
      v427[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v427[4] = v399;
      v400 = v427;
      if (qword_1ED8865D0 != -1)
        dispatch_once(&qword_1ED8865D0, v400);

      if (byte_1ED886436)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("End of level 6 at offset %llu"), v49 + 4 * v394 + 4 * v397 + 32);
        v401 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v402 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v403 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v403, "lastPathComponent");
        v404 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser parseData:]");
        v405 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v402, "logMessage:fromFile:fromFunction:fromLineNumber:", v401, v404, v405, 334);

        PLLogCommon();
        v406 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v406, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v475 = v401;
          _os_log_debug_impl(&dword_1CAF47000, v406, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 8)
  {
    -[PLMav7BasebandHardwareMessage setApps_clock_count_mask:](self, "setApps_clock_count_mask:", v40);
    v407 = (uint64_t)&v40[4
                       * -[PLBBMav13HwMsgParser GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage apps_clock_count_mask](self, "apps_clock_count_mask"))+ 16];
    -[PLMav7BasebandHardwareMessage setMpss_clock_count_mask:](self, "setMpss_clock_count_mask:", v407);
    v408 = v407
         + 4
         * -[PLBBMav13HwMsgParser GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage mpss_clock_count_mask](self, "mpss_clock_count_mask"));
    -[PLMav7BasebandHardwareMessage setHsic:](self, "setHsic:", v408 + 16);
    v40 = (unsigned __int8 *)(v408 + 48);
  }
  v409 = objc_retainAutorelease(v417);
  v410 = (unint64_t)&v40[-objc_msgSend(v409, "bytes")];
  v411 = objc_msgSend(v409, "length");
  if (v410 > v411)
  {
    PLLogCommon();
    v412 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v412, OS_LOG_TYPE_ERROR))
    {
      v414 = objc_retainAutorelease(v409);
      v415 = &v40[-objc_msgSend(v414, "bytes")];
      v416 = objc_msgSend(v414, "length");
      *(_DWORD *)buf = 134218498;
      v475 = v415;
      v476 = 2048;
      v477 = v416;
      v478 = 2080;
      v479 = "-[PLBBMav16BHwMsgParser parseData:]";
      _os_log_error_impl(&dword_1CAF47000, v412, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", buf, 0x20u);
    }

  }
  return v410 <= v411;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_80 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_253(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886409 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_258(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88640A = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_267(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88640B = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_272(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88640C = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_277(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88640D = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_282(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88640E = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_287(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88640F = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_292(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886410 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_297(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886411 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_302(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886412 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_307(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886413 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_312(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886414 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_317(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886415 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_322(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886416 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_327(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886417 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_332(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886418 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_337(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886419 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_342(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88641A = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_347(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88641B = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_358(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88641C = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_363(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88641D = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_369(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88641E = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_375(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88641F = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_380(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886420 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_383(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886421 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_386(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886422 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_389(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886423 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_392(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886424 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_395(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886425 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_398(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886426 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_401(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886427 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_404(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886428 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_407(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886429 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_410(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88642A = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_413(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88642B = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_416(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88642C = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_419(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88642D = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_422(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88642E = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_425(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88642F = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_428(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886430 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_433(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886431 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_438(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886432 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_443(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886433 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_446(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886434 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_449(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886435 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_454(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886436 = result;
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  _QWORD *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  _QWORD *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  _QWORD *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  _QWORD *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  _QWORD *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  uint64_t v78;
  _QWORD *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  int v86;
  uint64_t v87;
  _QWORD *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  NSObject *v94;
  uint64_t v95;
  _QWORD *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  uint64_t v103;
  _QWORD *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  uint64_t v111;
  _QWORD *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  NSObject *v118;
  uint64_t v119;
  _QWORD *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  NSObject *v126;
  uint64_t v127;
  _QWORD *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  NSObject *v134;
  uint64_t v135;
  _QWORD *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  NSObject *v142;
  uint64_t v143;
  _QWORD *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  NSObject *v150;
  uint64_t v151;
  _QWORD *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  NSObject *v158;
  uint64_t v159;
  _QWORD *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  NSObject *v166;
  uint64_t v167;
  _QWORD *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  NSObject *v174;
  uint64_t v175;
  _QWORD *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  NSObject *v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
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
  _QWORD v205[5];
  _QWORD v206[5];
  _QWORD block[5];
  objc_super v208;
  _QWORD v209[5];
  uint8_t buf[4];
  void *v211;
  uint64_t v212;

  v212 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0x1E0D7F000uLL;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    v209[0] = MEMORY[0x1E0C809B0];
    v209[1] = 3221225472;
    v209[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke;
    v209[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v209[4] = v6;
    v7 = v209;
    if (qword_1ED8865D8 != -1)
      dispatch_once(&qword_1ED8865D8, v7);

    if (byte_1ED886437)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16BHwMsgParser logWithLogger:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 363);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v211 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v208.receiver = self;
  v208.super_class = (Class)PLBBMav16BHwMsgParser;
  -[PLBasebandHardwareMessage logRawWithLogger:](&v208, sel_logRawWithLogger_, v4);
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

  if (-[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev") == 3)
  {
    v18 = 6;
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav13HwMsgParser protocolActive](self, "protocolActive"), 6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavLogMsg setProtocolActivityHistogram:](v14, "setProtocolActivityHistogram:", v19);

    -[PLMav4BasebandHardwareMessage logHeaderWithLogger:](self, "logHeaderWithLogger:", v14);
    -[PLBBMav13HwMsgParser logRPMWithLogger:](self, "logRPMWithLogger:", v14);
    -[PLBBMav16BHwMsgParser logMav16BAppsPerfWithLogger:](self, "logMav16BAppsPerfWithLogger:", v14);
    -[PLBBMav16BHwMsgParser logMav16BMPSSWithLogger:](self, "logMav16BMPSSWithLogger:", v14);
    -[PLBBMav13HwMsgParser logLPASSWithLogger:](self, "logLPASSWithLogger:", v14);
    -[PLBBMav13HwMsgParser logPeripheralsWithLogger:](self, "logPeripheralsWithLogger:", v14);
    -[PLBBMav13HwMsgParser logPcieWithLogger:](self, "logPcieWithLogger:", v14);
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser mcpmSleepVetoMav16B](self, "mcpmSleepVetoMav16B"), 14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavLogMsg setMcpmVetoNumHistogram:](v14, "setMcpmVetoNumHistogram:", v20);

    v21 = (void *)objc_opt_new();
    if ((*-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") & 1) != 0
      && -[PLBBMav13HwMsgParser protoStateC2K](self, "protoStateC2K"))
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v22 = objc_opt_class();
        v206[0] = MEMORY[0x1E0C809B0];
        v206[1] = 3221225472;
        v206[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_474;
        v206[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v206[4] = v22;
        v23 = v206;
        if (qword_1ED8865E8 != -1)
          dispatch_once(&qword_1ED8865E8, v23);

        if (byte_1ED886439)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateC2K is valid"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lastPathComponent");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 405);

          PLLogCommon();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v24;
            _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000;
        }
      }
      -[PLBBMav13HwMsgParser logProtocolWithLogger:container:state:forRAT:](self, "logProtocolWithLogger:container:state:forRAT:", v14, v21, -[PLBBMav13HwMsgParser protoStateC2K](self, "protoStateC2K"), 0);
      v18 = 0;
      v30 = 1;
    }
    else
    {
      v30 = 0;
    }
    if ((*-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") & 2) != 0
      && -[PLBBMav13HwMsgParser protoStateHDR](self, "protoStateHDR"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v38 = objc_opt_class();
        v205[0] = MEMORY[0x1E0C809B0];
        v205[1] = 3221225472;
        v205[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_479;
        v205[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v205[4] = v38;
        v39 = v205;
        if (qword_1ED8865F0 != -1)
          dispatch_once(&qword_1ED8865F0, v39);

        if (byte_1ED88643A)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateHDR is valid"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "lastPathComponent");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v43, v44, 416);

          PLLogCommon();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v40;
            _os_log_debug_impl(&dword_1CAF47000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      v30 = 1;
      -[PLBBMav13HwMsgParser logProtocolWithLogger:container:state:forRAT:](self, "logProtocolWithLogger:container:state:forRAT:", v14, v21, -[PLBBMav13HwMsgParser protoStateHDR](self, "protoStateHDR"), 1);
      v18 = 1;
    }
    if ((*-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") & 4) != 0
      && -[PLBBMav13HwMsgParser protoStateGSM](self, "protoStateGSM"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v46 = objc_opt_class();
        v204[0] = MEMORY[0x1E0C809B0];
        v204[1] = 3221225472;
        v204[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_484;
        v204[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v204[4] = v46;
        v47 = v204;
        if (qword_1ED8865F8 != -1)
          dispatch_once(&qword_1ED8865F8, v47);

        if (byte_1ED88643B)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateGSM is valid"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "lastPathComponent");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "logMessage:fromFile:fromFunction:fromLineNumber:", v48, v51, v52, 427);

          PLLogCommon();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v48;
            _os_log_debug_impl(&dword_1CAF47000, v53, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      v18 = 2;
      -[PLBBMav13HwMsgParser logProtocolWithLogger:container:state:forRAT:](self, "logProtocolWithLogger:container:state:forRAT:", v14, v21, -[PLBBMav13HwMsgParser protoStateGSM](self, "protoStateGSM"), 2);
      v30 = 1;
    }
    if ((*-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") & 8) != 0
      && -[PLBBMav13HwMsgParser protoStateWCDMA](self, "protoStateWCDMA"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v54 = objc_opt_class();
        v203[0] = MEMORY[0x1E0C809B0];
        v203[1] = 3221225472;
        v203[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_489;
        v203[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v203[4] = v54;
        v55 = v203;
        if (qword_1ED886600 != -1)
          dispatch_once(&qword_1ED886600, v55);

        if (byte_1ED88643C)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateWCDMA is valid"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "lastPathComponent");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "logMessage:fromFile:fromFunction:fromLineNumber:", v56, v59, v60, 438);

          PLLogCommon();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v56;
            _os_log_debug_impl(&dword_1CAF47000, v61, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      v18 = 3;
      -[PLBBMav13HwMsgParser logProtocolWithLogger:container:state:forRAT:](self, "logProtocolWithLogger:container:state:forRAT:", v14, v21, -[PLBBMav13HwMsgParser protoStateWCDMA](self, "protoStateWCDMA"), 3);
      v30 = 1;
    }
    if ((*-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") & 0x10) != 0
      && -[PLBBMav13HwMsgParser protoStateLTE](self, "protoStateLTE"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v62 = objc_opt_class();
        v202[0] = MEMORY[0x1E0C809B0];
        v202[1] = 3221225472;
        v202[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_494;
        v202[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v202[4] = v62;
        v63 = v202;
        if (qword_1ED886608 != -1)
          dispatch_once(&qword_1ED886608, v63);

        if (byte_1ED88643D)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateLTE is valid"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "lastPathComponent");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "logMessage:fromFile:fromFunction:fromLineNumber:", v64, v67, v68, 449);

          PLLogCommon();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v64;
            _os_log_debug_impl(&dword_1CAF47000, v69, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      v18 = 4;
      -[PLBBMav13HwMsgParser logProtocolWithLogger:container:state:forRAT:](self, "logProtocolWithLogger:container:state:forRAT:", v14, v21, -[PLBBMav13HwMsgParser protoStateLTE](self, "protoStateLTE"), 4);
      v30 = 1;
    }
    if ((*-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") & 0x20) != 0
      && -[PLBBMav13HwMsgParser protoStateTDS](self, "protoStateTDS"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v70 = objc_opt_class();
        v201[0] = MEMORY[0x1E0C809B0];
        v201[1] = 3221225472;
        v201[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_499;
        v201[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v201[4] = v70;
        v71 = v201;
        if (qword_1ED886610 != -1)
          dispatch_once(&qword_1ED886610, v71);

        if (byte_1ED88643E)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateTDS is valid"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "lastPathComponent");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "logMessage:fromFile:fromFunction:fromLineNumber:", v72, v75, v76, 460);

          PLLogCommon();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v72;
            _os_log_debug_impl(&dword_1CAF47000, v77, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      v18 = 5;
      -[PLBBMav13HwMsgParser logProtocolWithLogger:container:state:forRAT:](self, "logProtocolWithLogger:container:state:forRAT:", v14, v21, -[PLBBMav13HwMsgParser protoStateTDS](self, "protoStateTDS"), 5);
      v30 = 1;
    }
    -[PLBBMavLogMsg setProtocolStateHistDict:](v14, "setProtocolStateHistDict:", v21);
    -[PLMav7BasebandHardwareMessage logProtocolActiveWithLogger:](self, "logProtocolActiveWithLogger:", v14);
    -[PLBBMav13HwMsgParser logSleepVetoWithLogger:](self, "logSleepVetoWithLogger:", v14);
    if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 7)
    {
      -[PLMav7BasebandHardwareMessage logClockWithLogger:](self, "logClockWithLogger:", v14);
      -[PLMav7BasebandHardwareMessage logHSICWithLogger:](self, "logHSICWithLogger:", v14);
    }
    -[PLBBMavLogMsg addToGroupPLBBMav16BHwOther](v14, "addToGroupPLBBMav16BHwOther");
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 4) != 0
      && -[PLBBMav13HwMsgParser rfDataLTE](self, "rfDataLTE"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v78 = objc_opt_class();
        v200[0] = MEMORY[0x1E0C809B0];
        v200[1] = 3221225472;
        v200[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_504;
        v200[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v200[4] = v78;
        v79 = v200;
        if (qword_1ED886618 != -1)
          dispatch_once(&qword_1ED886618, v79);

        if (byte_1ED88643F)
        {
          v183 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataLTE is valid"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "lastPathComponent");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "logMessage:fromFile:fromFunction:fromLineNumber:", v80, v83, v84, 485);

          PLLogCommon();
          v85 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v80;
            _os_log_debug_impl(&dword_1CAF47000, v85, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v4 = v183;
          v5 = 0x1E0D7F000;
        }
      }
      -[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:](self, "logLegacyRFWithLogger:usingData:forRAT:", v14, -[PLBBMav13HwMsgParser rfDataLTE](self, "rfDataLTE"), 4);
      v86 = 1;
    }
    else
    {
      v86 = 0;
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 2) != 0
      && -[PLBBMav13HwMsgParser rfDataWCDMA](self, "rfDataWCDMA"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v87 = objc_opt_class();
        v199[0] = MEMORY[0x1E0C809B0];
        v199[1] = 3221225472;
        v199[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_509;
        v199[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v199[4] = v87;
        v88 = v199;
        if (qword_1ED886620 != -1)
          dispatch_once(&qword_1ED886620, v88);

        if (byte_1ED886440)
        {
          v184 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataWCDMA is valid"));
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "lastPathComponent");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "logMessage:fromFile:fromFunction:fromLineNumber:", v89, v92, v93, 494);

          PLLogCommon();
          v94 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v89;
            _os_log_debug_impl(&dword_1CAF47000, v94, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v4 = v184;
          v5 = 0x1E0D7F000uLL;
        }
      }
      -[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:](self, "logLegacyRFWithLogger:usingData:forRAT:", v14, -[PLBBMav13HwMsgParser rfDataWCDMA](self, "rfDataWCDMA"), 3);
      v86 = 1;
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 1) != 0
      && -[PLBBMav13HwMsgParser rfDataGSM](self, "rfDataGSM"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v95 = objc_opt_class();
        v198[0] = MEMORY[0x1E0C809B0];
        v198[1] = 3221225472;
        v198[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_514;
        v198[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v198[4] = v95;
        v96 = v198;
        if (qword_1ED886628 != -1)
          dispatch_once(&qword_1ED886628, v96);

        if (byte_1ED886441)
        {
          v185 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataGSM is valid"));
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "lastPathComponent");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "logMessage:fromFile:fromFunction:fromLineNumber:", v97, v100, v101, 503);

          PLLogCommon();
          v102 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v97;
            _os_log_debug_impl(&dword_1CAF47000, v102, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v4 = v185;
          v5 = 0x1E0D7F000uLL;
        }
      }
      -[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:](self, "logLegacyRFWithLogger:usingData:forRAT:", v14, -[PLBBMav13HwMsgParser rfDataGSM](self, "rfDataGSM"), 2);
      v86 = 1;
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 8) != 0
      && -[PLBBMav13HwMsgParser rfDataTDS](self, "rfDataTDS"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v103 = objc_opt_class();
        v197[0] = MEMORY[0x1E0C809B0];
        v197[1] = 3221225472;
        v197[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_519;
        v197[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v197[4] = v103;
        v104 = v197;
        if (qword_1ED886630 != -1)
          dispatch_once(&qword_1ED886630, v104);

        if (byte_1ED886442)
        {
          v186 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataTDS is valid"));
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "lastPathComponent");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "logMessage:fromFile:fromFunction:fromLineNumber:", v105, v108, v109, 512);

          PLLogCommon();
          v110 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v105;
            _os_log_debug_impl(&dword_1CAF47000, v110, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v4 = v186;
          v5 = 0x1E0D7F000uLL;
        }
      }
      -[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:](self, "logLegacyRFWithLogger:usingData:forRAT:", v14, -[PLBBMav13HwMsgParser rfDataTDS](self, "rfDataTDS"), 5);
      v86 = 1;
    }
    if ((*-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") & 0x40) != 0
      && -[PLBBMav13HwMsgParser rfDataC2K](self, "rfDataC2K"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v111 = objc_opt_class();
        v196[0] = MEMORY[0x1E0C809B0];
        v196[1] = 3221225472;
        v196[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_524;
        v196[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v196[4] = v111;
        v112 = v196;
        if (qword_1ED886638 != -1)
          dispatch_once(&qword_1ED886638, v112);

        if (byte_1ED886443)
        {
          v187 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataTDS is valid"));
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "lastPathComponent");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "logMessage:fromFile:fromFunction:fromLineNumber:", v113, v116, v117, 521);

          PLLogCommon();
          v118 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v113;
            _os_log_debug_impl(&dword_1CAF47000, v118, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v4 = v187;
          v5 = 0x1E0D7F000uLL;
        }
      }
      -[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:](self, "logLegacyRFWithLogger:usingData:forRAT:", v14, -[PLBBMav13HwMsgParser rfDataC2K](self, "rfDataC2K"), 0);
      v86 = 1;
    }
    if (*-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") < 0
      && -[PLBBMav13HwMsgParser rfData1xEVDO](self, "rfData1xEVDO"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v119 = objc_opt_class();
        v195[0] = MEMORY[0x1E0C809B0];
        v195[1] = 3221225472;
        v195[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_527;
        v195[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v195[4] = v119;
        v120 = v195;
        if (qword_1ED886640 != -1)
          dispatch_once(&qword_1ED886640, v120);

        if (byte_1ED886444)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataTDS is valid"));
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "lastPathComponent");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "logMessage:fromFile:fromFunction:fromLineNumber:", v121, v124, v125, 530);

          PLLogCommon();
          v126 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v121;
            _os_log_debug_impl(&dword_1CAF47000, v126, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000;
        }
      }
      -[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:](self, "logLegacyRFWithLogger:usingData:forRAT:", v14, -[PLBBMav13HwMsgParser rfData1xEVDO](self, "rfData1xEVDO"), 1);
    }
    else if (((v86 | v30 ^ 1) & 1) == 0)
    {
      -[PLBBMav13HwMsgParser logProtocolOnlyWithLogger:forRAT:](self, "logProtocolOnlyWithLogger:forRAT:", v14, v18);
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 0x10) != 0
      && -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v127 = objc_opt_class();
        v194[0] = MEMORY[0x1E0C809B0];
        v194[1] = 3221225472;
        v194[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_530;
        v194[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v194[4] = v127;
        v128 = v194;
        if (qword_1ED886648 != -1)
          dispatch_once(&qword_1ED886648, v128);

        if (byte_1ED886445)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhLTE is valid"));
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "lastPathComponent");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "logMessage:fromFile:fromFunction:fromLineNumber:", v129, v132, v133, 545);

          PLLogCommon();
          v134 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v134, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v129;
            _os_log_debug_impl(&dword_1CAF47000, v134, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      -[PLBBMav16BHwMsgParser logMav16BHwRFEnhLTEWithLogger:](self, "logMav16BHwRFEnhLTEWithLogger:", v14);
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 0x20) != 0
      && -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v135 = objc_opt_class();
        v193[0] = MEMORY[0x1E0C809B0];
        v193[1] = 3221225472;
        v193[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_535;
        v193[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v193[4] = v135;
        v136 = v193;
        if (qword_1ED886650 != -1)
          dispatch_once(&qword_1ED886650, v136);

        if (byte_1ED886446)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhWCDMA is valid"));
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          v138 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "lastPathComponent");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "logMessage:fromFile:fromFunction:fromLineNumber:", v137, v140, v141, 551);

          PLLogCommon();
          v142 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v137;
            _os_log_debug_impl(&dword_1CAF47000, v142, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v5 = 0x1E0D7F000uLL;
        }
      }
      -[PLBBMav16BHwMsgParser logMav16HwRFEnhWCDMAWithLogger:](self, "logMav16HwRFEnhWCDMAWithLogger:", v14);
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 0x40) != 0
      && -[PLBBMav13HwMsgParser rfEnhGSM](self, "rfEnhGSM"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v143 = objc_opt_class();
        v192[0] = MEMORY[0x1E0C809B0];
        v192[1] = 3221225472;
        v192[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_540;
        v192[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v192[4] = v143;
        v144 = v192;
        if (qword_1ED886658 != -1)
          dispatch_once(&qword_1ED886658, v144);

        if (byte_1ED886447)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhGSM is valid"));
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          v146 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147, "lastPathComponent");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v146, "logMessage:fromFile:fromFunction:fromLineNumber:", v145, v148, v149, 557);

          PLLogCommon();
          v150 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v150, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v145;
            _os_log_debug_impl(&dword_1CAF47000, v150, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
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
        v151 = objc_opt_class();
        v191[0] = MEMORY[0x1E0C809B0];
        v191[1] = 3221225472;
        v191[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_545;
        v191[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v191[4] = v151;
        v152 = v191;
        if (qword_1ED886660 != -1)
          dispatch_once(&qword_1ED886660, v152);

        if (byte_1ED886448)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhTDS is valid"));
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          v154 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v155, "lastPathComponent");
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "logMessage:fromFile:fromFunction:fromLineNumber:", v153, v156, v157, 563);

          PLLogCommon();
          v158 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v158, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v153;
            _os_log_debug_impl(&dword_1CAF47000, v158, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
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
        v159 = objc_opt_class();
        v190[0] = MEMORY[0x1E0C809B0];
        v190[1] = 3221225472;
        v190[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_550;
        v190[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v190[4] = v159;
        v160 = v190;
        if (qword_1ED886668 != -1)
          dispatch_once(&qword_1ED886668, v160);

        if (byte_1ED886449)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnh1x is valid"));
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          v162 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v163, "lastPathComponent");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v162, "logMessage:fromFile:fromFunction:fromLineNumber:", v161, v164, v165, 569);

          PLLogCommon();
          v166 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v166, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v161;
            _os_log_debug_impl(&dword_1CAF47000, v166, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
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
        v167 = objc_opt_class();
        v189[0] = MEMORY[0x1E0C809B0];
        v189[1] = 3221225472;
        v189[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_555;
        v189[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v189[4] = v167;
        v168 = v189;
        if (qword_1ED886670 != -1)
          dispatch_once(&qword_1ED886670, v168);

        if (byte_1ED88644A)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhHDR is valid"));
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          v170 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "lastPathComponent");
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v170, "logMessage:fromFile:fromFunction:fromLineNumber:", v169, v172, v173, 575);

          PLLogCommon();
          v174 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v174, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v169;
            _os_log_debug_impl(&dword_1CAF47000, v174, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
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
        v175 = objc_opt_class();
        v188[0] = MEMORY[0x1E0C809B0];
        v188[1] = 3221225472;
        v188[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_560;
        v188[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v188[4] = v175;
        v176 = v188;
        if (qword_1ED886678 != -1)
          dispatch_once(&qword_1ED886678, v176);

        if (byte_1ED88644B)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhOOS is valid"));
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          v178 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v179, "lastPathComponent");
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v178, "logMessage:fromFile:fromFunction:fromLineNumber:", v177, v180, v181, 581);

          PLLogCommon();
          v182 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v182, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v211 = v177;
            _os_log_debug_impl(&dword_1CAF47000, v182, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      -[PLBBMav13HwMsgParser logHwRFOOSWithLogger:](self, "logHwRFOOSWithLogger:", v14);
    }
    -[PLBBMavLogMsg logEventBackwardGrpEntriesBBMav16Hw](v14, "logEventBackwardGrpEntriesBBMav16Hw");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appendFormat:", CFSTR("Version Mismatch: Baseband_sw_rev=%d Powerlog_supported_sw_rev=%d"), -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"), 3);
    -[PLBBMavLogMsg setError:](v14, "setError:", v21);
    -[PLBBMavLogMsg setType:](v14, "setType:", CFSTR("BB HW Error"));
    -[PLBBMavLogMsg logEventBackwardMavBBHwOther](v14, "logEventBackwardMavBBHwOther");
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v31 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_468;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v31;
      if (qword_1ED8865E0 != -1)
        dispatch_once(&qword_1ED8865E0, block);
      if (byte_1ED886438)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SW version mismatch. Received %d, expected %d cannot process, returning"), -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"), 3);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "lastPathComponent");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logWithLogger:]");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 381);

        PLLogCommon();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v211 = v32;
          _os_log_debug_impl(&dword_1CAF47000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }

}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886437 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_468(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886438 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_474(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886439 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_479(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88643A = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_484(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88643B = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_489(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88643C = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_494(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88643D = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_499(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88643E = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_504(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88643F = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_509(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886440 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_514(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886441 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_519(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886442 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_524(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886443 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_527(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886444 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_530(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886445 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_535(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886446 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_540(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886447 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_545(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886448 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_550(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886449 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_555(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88644A = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_560(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88644B = result;
  return result;
}

- (void)logMav16BAppsPerfWithLogger:(id)a3
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
    block[2] = __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED886680 != -1)
      dispatch_once(&qword_1ED886680, block);
    if (byte_1ED88644C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16BHwMsgParser logMav16BAppsPerfWithLogger:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logMav16BAppsPerfWithLogger:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 592);

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
  if (-[PLBBMav16BHwMsgParser mav16BAppsPerf](self, "mav16BAppsPerf"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser mav16BAppsPerf](self, "mav16BAppsPerf"), 8);
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
    v48[2] = __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke_567;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = objc_opt_class();
    if (qword_1ED886688 != -1)
      dispatch_once(&qword_1ED886688, v48);
    if (byte_1ED88644D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Perf_Level=<unknown>"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logMav16BAppsPerfWithLogger:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 604);

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
      v47[2] = __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke_572;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v23;
      if (qword_1ED886690 != -1)
        dispatch_once(&qword_1ED886690, v47);
      if (byte_1ED88644E)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Stats=<unknown>"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logMav16BAppsPerfWithLogger:]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 615);

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
  if (-[PLBBMav16BHwMsgParser mav16BAppsSleepVeto](self, "mav16BAppsSleepVeto"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser mav16BAppsSleepVeto](self, "mav16BAppsSleepVeto"), 4);
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
      v46[2] = __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke_579;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v31;
      if (qword_1ED886698 != -1)
        dispatch_once(&qword_1ED886698, v46);
      if (byte_1ED88644F)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Veto_Duration=<unknown>"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "lastPathComponent");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logMav16BAppsPerfWithLogger:]");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 629);

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
    v45[2] = __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke_586;
    v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v45[4] = v38;
    if (qword_1ED8866A0 != -1)
      dispatch_once(&qword_1ED8866A0, v45);
    if (byte_1ED886450)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW APPS"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "lastPathComponent");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logMav16BAppsPerfWithLogger:]");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v42, v43, 633);

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

uint64_t __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88644C = result;
  return result;
}

uint64_t __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke_567(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88644D = result;
  return result;
}

uint64_t __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke_572(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88644E = result;
  return result;
}

uint64_t __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke_579(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88644F = result;
  return result;
}

uint64_t __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke_586(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886450 = result;
  return result;
}

- (void)logMav16BMPSSWithLogger:(id)a3
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
    block[2] = __49__PLBBMav16BHwMsgParser_logMav16BMPSSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED8866A8 != -1)
      dispatch_once(&qword_1ED8866A8, block);
    if (byte_1ED886451)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16BHwMsgParser logMav16BMPSSWithLogger:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logMav16BMPSSWithLogger:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 638);

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
  if (-[PLBBMav16BHwMsgParser mav16BMpssSleepVeto](self, "mav16BMpssSleepVeto"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser mav16BMpssSleepVeto](self, "mav16BMpssSleepVeto"), 21);
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
    v39[2] = __49__PLBBMav16BHwMsgParser_logMav16BMPSSWithLogger___block_invoke_593;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = objc_opt_class();
    if (qword_1ED8866B0 != -1)
      dispatch_once(&qword_1ED8866B0, v39);
    if (byte_1ED886452)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Veto=<unknown>"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logMav16BMPSSWithLogger:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 655);

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
  if (-[PLBBMav16BHwMsgParser mav16BQdspSpeed](self, "mav16BQdspSpeed"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser mav16BQdspSpeed](self, "mav16BQdspSpeed"), 11);
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
    v38[2] = __49__PLBBMav16BHwMsgParser_logMav16BMPSSWithLogger___block_invoke_600;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = v24;
    if (qword_1ED8866B8 != -1)
      dispatch_once(&qword_1ED8866B8, v38);
    if (byte_1ED886453)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Q6SW_Perf=<unknown>"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logMav16BMPSSWithLogger:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v27, v28, 668);

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
    v37[2] = __49__PLBBMav16BHwMsgParser_logMav16BMPSSWithLogger___block_invoke_605;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v30;
    if (qword_1ED8866C0 != -1)
      dispatch_once(&qword_1ED8866C0, v37);
    if (byte_1ED886454)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW MPSS"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "lastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logMav16BMPSSWithLogger:]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 671);

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

uint64_t __49__PLBBMav16BHwMsgParser_logMav16BMPSSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886451 = result;
  return result;
}

uint64_t __49__PLBBMav16BHwMsgParser_logMav16BMPSSWithLogger___block_invoke_593(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886452 = result;
  return result;
}

uint64_t __49__PLBBMav16BHwMsgParser_logMav16BMPSSWithLogger___block_invoke_600(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886453 = result;
  return result;
}

uint64_t __49__PLBBMav16BHwMsgParser_logMav16BMPSSWithLogger___block_invoke_605(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886454 = result;
  return result;
}

- (void)logMav16BHwRFEnhLTEWithLogger:(id)a3
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
  PLBBMav16BHwRfLTELogMsg *v13;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _QWORD v83[5];
  _QWORD v84[5];
  _QWORD v85[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PLBBMav16BHwMsgParser_logMav16BHwRFEnhLTEWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED8866C8 != -1)
      dispatch_once(&qword_1ED8866C8, block);
    if (byte_1ED886455)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16BHwMsgParser logMav16BHwRFEnhLTEWithLogger:]");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logMav16BHwRFEnhLTEWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 676);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v88 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  v13 = objc_alloc_init(PLBBMav16BHwRfLTELogMsg);
  if (v13)
  {
    -[PLBasebandMessage agent](self, "agent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMsgRoot setAgent:](v13, "setAgent:", v14);

    -[PLBBMav16BHwRfLTELogMsg setError:](v13, "setError:", CFSTR("not set"));
    -[PLBasebandMessage seqNum](self, "seqNum");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage date](self, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage timeCal](self, "timeCal");
    -[PLBBMav16BHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 0x10) == 0
      || -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B"))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (*(_DWORD *)-[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")- (_DWORD)-[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[4]));
      -[PLBBMav16BHwRfLTELogMsg setLogDuration:](v13, "setLogDuration:", v17);

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[8]);
      -[PLBBMav16BHwRfLTELogMsg setDupMode:](v13, "setDupMode:", v18);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[484]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setPCCFreq:](v13, "setPCCFreq:", v19);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[485]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setPCCBw:](v13, "setPCCBw:", v20);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[486]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setSCC1Freq:](v13, "setSCC1Freq:", v21);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[489]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setSCC1Bw:](v13, "setSCC1Bw:", v22);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[487]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setSCC2Freq:](v13, "setSCC2Freq:", v23);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[490]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setSCC2Bw:](v13, "setSCC2Bw:", v24);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[488]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setSCC3Freq:](v13, "setSCC3Freq:", v25);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[491]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setSCC3Bw:](v13, "setSCC3Bw:", v26);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B") + 12, 17);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setDlTBSzCnt:](v13, "setDlTBSzCnt:", v27);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B") + 80, 12);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setTxPwrCnt:](v13, "setTxPwrCnt:", v28);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B") + 128, 10);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setCaSCCCnt:](v13, "setCaSCCCnt:", v29);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B") + 168, 3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setUlCaSCCCnt:](v13, "setUlCaSCCCnt:", v30);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B") + 180, 6);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setActRxTxCnt:](v13, "setActRxTxCnt:", v31);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B") + 204, 7);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setSleepStateIdleCnt:](v13, "setSleepStateIdleCnt:", v32);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B") + 232, 7);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setSleepStateConnCnt:](v13, "setSleepStateConnCnt:", v33);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B") + 260, 6);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setRsrpIdleCnt:](v13, "setRsrpIdleCnt:", v34);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B") + 284, 6);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setRsrpConnCnt:](v13, "setRsrpConnCnt:", v35);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B") + 308, 6);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setSinrIdleCnt:](v13, "setSinrIdleCnt:", v36);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B") + 332, 6);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setSinrConnCnt:](v13, "setSinrConnCnt:", v37);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B") + 356, 3);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setNlicStateCnt:](v13, "setNlicStateCnt:", v38);

      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[368]);
      -[PLBBMav16BHwRfLTELogMsg setArdRxDOff:](v13, "setArdRxDOff:", v39);

      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[372]);
      -[PLBBMav16BHwRfLTELogMsg setArdRxDOff:](v13, "setArdRxDOff:", v40);

      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[376]);
      -[PLBBMav16BHwRfLTELogMsg setArdRxDOff:](v13, "setArdRxDOff:", v41);

      v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[380]);
      -[PLBBMav16BHwRfLTELogMsg setArdRxDOff:](v13, "setArdRxDOff:", v42);

      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[468]);
      -[PLBBMav16BHwRfLTELogMsg setUSleepPCCCnt:](v13, "setUSleepPCCCnt:", v43);

      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[472]);
      -[PLBBMav16BHwRfLTELogMsg setUSleepSCC1Cnt:](v13, "setUSleepSCC1Cnt:", v44);

      v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[476]);
      -[PLBBMav16BHwRfLTELogMsg setUSleepSCC2Cnt:](v13, "setUSleepSCC2Cnt:", v45);

      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[480]);
      -[PLBBMav16BHwRfLTELogMsg setUSleepSCC3Cnt:](v13, "setUSleepSCC3Cnt:", v46);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B") + 384, 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setHsicPCC:](v13, "setHsicPCC:", v47);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B") + 392, 2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setHsicSCC1:](v13, "setHsicSCC1:", v48);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B") + 400, 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setHsicSCC2:](v13, "setHsicSCC2:", v49);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B") + 408, 2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16BHwRfLTELogMsg setHsicSCC2:](v13, "setHsicSCC2:", v50);

      v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[416]);
      -[PLBBMav16BHwRfLTELogMsg setArxOffPCC:](v13, "setArxOffPCC:", v51);

      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[428]);
      -[PLBBMav16BHwRfLTELogMsg setArxOffSCC1:](v13, "setArxOffSCC1:", v52);

      v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[440]);
      -[PLBBMav16BHwRfLTELogMsg setArxOffSCC2:](v13, "setArxOffSCC2:", v53);

      v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[452]);
      -[PLBBMav16BHwRfLTELogMsg setArxOffSCC3:](v13, "setArxOffSCC3:", v54);

      v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[420]);
      -[PLBBMav16BHwRfLTELogMsg setArxBaselinePCC:](v13, "setArxBaselinePCC:", v55);

      v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[432]);
      -[PLBBMav16BHwRfLTELogMsg setArxBaselineSCC1:](v13, "setArxBaselineSCC1:", v56);

      v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[444]);
      -[PLBBMav16BHwRfLTELogMsg setArxBaselineSCC2:](v13, "setArxBaselineSCC2:", v57);

      v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[456]);
      -[PLBBMav16BHwRfLTELogMsg setArxBaselineSCC3:](v13, "setArxBaselineSCC3:", v58);

      v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[424]);
      -[PLBBMav16BHwRfLTELogMsg setArxQicePCC:](v13, "setArxQicePCC:", v59);

      v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[436]);
      -[PLBBMav16BHwRfLTELogMsg setArxQiceSCC1:](v13, "setArxQiceSCC1:", v60);

      v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[448]);
      -[PLBBMav16BHwRfLTELogMsg setArxQiceSCC2:](v13, "setArxQiceSCC2:", v61);

      v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[460]);
      -[PLBBMav16BHwRfLTELogMsg setArxQiceSCC3:](v13, "setArxQiceSCC3:", v62);

      -[PLBBMav16BHwRfLTELogMsg logEventBackwardBBMav16BHwRfLTE](v13, "logEventBackwardBBMav16BHwRfLTE");
      v63 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v63, "objectForKey:", CFSTR("entry"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v63, "objectForKey:", CFSTR("entryKey"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addToGroupPLBBMavHwEntry:withEntryKey:", v64, v65);

      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_32;
      v66 = objc_opt_class();
      v83[0] = MEMORY[0x1E0C809B0];
      v83[1] = 3221225472;
      v83[2] = __55__PLBBMav16BHwMsgParser_logMav16BHwRFEnhLTEWithLogger___block_invoke_627;
      v83[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v83[4] = v66;
      if (qword_1ED8866E0 != -1)
        dispatch_once(&qword_1ED8866E0, v83);
      if (!byte_1ED886458)
        goto LABEL_32;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh Mav16 HW RF ENH LTE"));
      v67 = objc_claimAutoreleasedReturnValue();
      v68 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "lastPathComponent");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logMav16BHwRFEnhLTEWithLogger:]");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "logMessage:fromFile:fromFunction:fromLineNumber:", v67, v70, v71, 813);

      PLLogCommon();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v88 = v67;
        _os_log_debug_impl(&dword_1CAF47000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_31:
LABEL_32:

      goto LABEL_33;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v78 = objc_opt_class();
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = __55__PLBBMav16BHwMsgParser_logMav16BHwRFEnhLTEWithLogger___block_invoke_618;
      v84[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v84[4] = v78;
      if (qword_1ED8866D8 != -1)
        dispatch_once(&qword_1ED8866D8, v84);
      if (byte_1ED886457)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhLTE is not valid, return"));
        v63 = objc_claimAutoreleasedReturnValue();
        v79 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "lastPathComponent");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logMav16BHwRFEnhLTEWithLogger:]");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "logMessage:fromFile:fromFunction:fromLineNumber:", v63, v81, v82, 691);

        PLLogCommon();
        v67 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
          goto LABEL_31;
        *(_DWORD *)buf = 138412290;
        v88 = v63;
        goto LABEL_30;
      }
    }
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v73 = objc_opt_class();
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __55__PLBBMav16BHwMsgParser_logMav16BHwRFEnhLTEWithLogger___block_invoke_611;
    v85[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v85[4] = v73;
    if (qword_1ED8866D0 != -1)
      dispatch_once(&qword_1ED8866D0, v85);
    if (byte_1ED886456)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: mem alloc for logHwRfLTE failed"));
      v63 = objc_claimAutoreleasedReturnValue();
      v74 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "lastPathComponent");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logMav16BHwRFEnhLTEWithLogger:]");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "logMessage:fromFile:fromFunction:fromLineNumber:", v63, v76, v77, 680);

      PLLogCommon();
      v67 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        goto LABEL_31;
      *(_DWORD *)buf = 138412290;
      v88 = v63;
LABEL_30:
      _os_log_debug_impl(&dword_1CAF47000, v67, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_31;
    }
  }
LABEL_33:

}

uint64_t __55__PLBBMav16BHwMsgParser_logMav16BHwRFEnhLTEWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886455 = result;
  return result;
}

uint64_t __55__PLBBMav16BHwMsgParser_logMav16BHwRFEnhLTEWithLogger___block_invoke_611(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886456 = result;
  return result;
}

uint64_t __55__PLBBMav16BHwMsgParser_logMav16BHwRFEnhLTEWithLogger___block_invoke_618(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886457 = result;
  return result;
}

uint64_t __55__PLBBMav16BHwMsgParser_logMav16BHwRFEnhLTEWithLogger___block_invoke_627(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886458 = result;
  return result;
}

- (void)logMav16HwRFEnhWCDMAWithLogger:(id)a3
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
    block[2] = __56__PLBBMav16BHwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED8866E8 != -1)
      dispatch_once(&qword_1ED8866E8, block);
    if (byte_1ED886459)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16BHwMsgParser logMav16HwRFEnhWCDMAWithLogger:]");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logMav16HwRFEnhWCDMAWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 818);

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

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (*(_DWORD *)-[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B")- (_DWORD)-[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B")[4]));
    -[PLBBMavHwRfWCDMALogMsg setLogDuration:](v13, "setLogDuration:", v17);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B") + 8, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setSCEqStatCnt:](v13, "setSCEqStatCnt:", v18);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B") + 20, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setDCEqStatCnt:](v13, "setDCEqStatCnt:", v19);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B") + 32, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setSCQsetEqStatCnt:](v13, "setSCQsetEqStatCnt:", v20);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B") + 48, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setDCQsetEqStatCnt:](v13, "setDCQsetEqStatCnt:", v21);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B") + 64, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setDurInCarrierMode:](v13, "setDurInCarrierMode:", v22);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B") + 72, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setRABModeCnt:](v13, "setRABModeCnt:", v23);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B") + 88, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setRABTypeCnt:](v13, "setRABTypeCnt:", v24);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B") + 104, 12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setTxPwrBucket:](v13, "setTxPwrBucket:", v25);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B")[152]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setFetCnt:](v13, "setFetCnt:", v26);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B")[156]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setCpcRxOnCnt:](v13, "setCpcRxOnCnt:", v27);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B")[160]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setCpcRxTxOffCnt:](v13, "setCpcRxTxOffCnt:", v28);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B")[164]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setCpcTimeCnt:](v13, "setCpcTimeCnt:", v29);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)-[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B")[168]);
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
    v46[2] = __56__PLBBMav16BHwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke_638;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v34;
    if (qword_1ED8866F8 != -1)
      dispatch_once(&qword_1ED8866F8, v46);
    if (!byte_1ED88645B)
      goto LABEL_23;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh Mav 16 BB HW RF WCDMA"));
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "lastPathComponent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logMav16HwRFEnhWCDMAWithLogger:]");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 879);

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
    v47[2] = __56__PLBBMav16BHwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke_633;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v41;
    if (qword_1ED8866F0 != -1)
      dispatch_once(&qword_1ED8866F0, v47);
    if (byte_1ED88645A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: mem alloc for logHwRfWCDMA failed"));
      v31 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "lastPathComponent");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwMsgParser logMav16HwRFEnhWCDMAWithLogger:]");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v44, v45, 822);

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

uint64_t __56__PLBBMav16BHwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886459 = result;
  return result;
}

uint64_t __56__PLBBMav16BHwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke_633(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88645A = result;
  return result;
}

uint64_t __56__PLBBMav16BHwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke_638(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88645B = result;
  return result;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)mav16BAppsPerf
{
  return self->_mav16BAppsPerf;
}

- (void)setMav16BAppsPerf:(id *)a3
{
  self->_mav16BAppsPerf = a3;
}

- ($E0EEEB5BA8699BABA569A46DBC0146B0)rfEnhWCDMAMav16B
{
  return self->_rfEnhWCDMAMav16B;
}

- (void)setRfEnhWCDMAMav16B:(id *)a3
{
  self->_rfEnhWCDMAMav16B = a3;
}

- ($8A091644260FD57A6E59D5EB5F61C043)rfEnhLTEMav16B
{
  return self->_rfEnhLTEMav16B;
}

- (void)setRfEnhLTEMav16B:(id *)a3
{
  self->_rfEnhLTEMav16B = a3;
}

- ($092601FE6E8A40A76BE67D22268BABC6)mav16BAppsSleepVeto
{
  return self->_mav16BAppsSleepVeto;
}

- (void)setMav16BAppsSleepVeto:(id *)a3
{
  self->_mav16BAppsSleepVeto = a3;
}

- ($FB43E548459D050BA5797B0FF6452E7F)mav16BMpssSleepVeto
{
  return self->_mav16BMpssSleepVeto;
}

- (void)setMav16BMpssSleepVeto:(id *)a3
{
  self->_mav16BMpssSleepVeto = a3;
}

- ($C9B0E9DB1B0C68408F3136D0BD3A897E)mav16BQdspSpeed
{
  return self->_mav16BQdspSpeed;
}

- (void)setMav16BQdspSpeed:(id *)a3
{
  self->_mav16BQdspSpeed = a3;
}

- ($4D5A38CE05C84672617F6ACDBB187D60)mcpmSleepVetoMav16B
{
  return self->_mcpmSleepVetoMav16B;
}

- (void)setMcpmSleepVetoMav16B:(id *)a3
{
  self->_mcpmSleepVetoMav16B = a3;
}

@end
