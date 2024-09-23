@implementation PLBBMav16HwMsgParser

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
  _QWORD *v191;
  uint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  unsigned __int8 *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  NSObject *v201;
  uint64_t v202;
  _QWORD *v203;
  uint64_t v204;
  unsigned __int8 *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  NSObject *v210;
  uint64_t v211;
  _QWORD *v212;
  uint64_t v213;
  unsigned __int8 *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  NSObject *v219;
  uint64_t v220;
  uint64_t v221;
  _QWORD *v222;
  void *v223;
  void *v224;
  void *v225;
  unsigned __int8 *v226;
  uint64_t v227;
  unsigned __int8 *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  NSObject *v233;
  uint64_t v234;
  _QWORD *v235;
  unint64_t v236;
  uint64_t v237;
  unsigned __int8 *v238;
  unsigned __int8 *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  NSObject *v244;
  uint64_t v245;
  _QWORD *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  uint64_t v251;
  _QWORD *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  uint64_t v257;
  _QWORD *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  uint64_t v263;
  _QWORD *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  uint64_t v269;
  _QWORD *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  uint64_t v275;
  _QWORD *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  uint64_t v281;
  _QWORD *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  uint64_t v287;
  _QWORD *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  uint64_t v293;
  _QWORD *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  uint64_t v299;
  _QWORD *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  uint64_t v305;
  _QWORD *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  uint64_t v311;
  _QWORD *v312;
  uint64_t v313;
  unsigned __int8 *v314;
  unsigned __int8 *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  NSObject *v320;
  uint64_t v321;
  _QWORD *v322;
  unsigned __int8 *v323;
  unsigned __int8 *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  NSObject *v329;
  uint64_t v330;
  _QWORD *v331;
  uint64_t v332;
  unsigned __int8 *v333;
  unsigned __int8 *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  NSObject *v339;
  uint64_t v340;
  _QWORD *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  uint64_t v346;
  _QWORD *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  uint64_t v352;
  _QWORD *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  uint64_t v358;
  _QWORD *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  uint64_t v364;
  _QWORD *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  uint64_t v370;
  _QWORD *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  uint64_t v376;
  _QWORD *v377;
  uint64_t v378;
  unsigned __int8 *v379;
  unsigned __int8 *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  NSObject *v385;
  uint64_t v386;
  _QWORD *v387;
  unsigned __int8 *v388;
  uint64_t v389;
  unsigned __int8 *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  NSObject *v395;
  int v396;
  unint64_t v397;
  void *v398;
  int v399;
  void *v400;
  uint64_t v401;
  _QWORD *v402;
  unsigned __int8 *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  NSObject *v408;
  uint64_t v409;
  uint64_t v410;
  id v411;
  unint64_t v412;
  unint64_t v413;
  NSObject *v414;
  id v416;
  unsigned __int8 *v417;
  uint64_t v418;
  id v419;
  void *v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  void *v425;
  void *v426;
  unsigned __int8 *v427;
  PLBBMav16HwMsgParser *v428;
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
  _QWORD v474[5];
  _QWORD v475[5];
  _QWORD v476[5];
  uint8_t buf[4];
  unsigned __int8 *v478;
  __int16 v479;
  uint64_t v480;
  __int16 v481;
  const char *v482;
  uint64_t v483;

  v483 = *MEMORY[0x1E0C80C00];
  v419 = objc_retainAutorelease(a3);
  v4 = (unsigned __int8 *)objc_msgSend(v419, "bytes");
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    v476[0] = MEMORY[0x1E0C809B0];
    v476[1] = 3221225472;
    v476[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke;
    v476[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v476[4] = v5;
    v6 = v476;
    if (qword_1ED886150 != -1)
      dispatch_once(&qword_1ED886150, v6);

    if (_MergedGlobals_78)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received data of length %lu"), objc_msgSend(v419, "length"));
      v7 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 34);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v478 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v420 = v13;
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
    v475[0] = MEMORY[0x1E0C809B0];
    v475[1] = 3221225472;
    v475[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_253;
    v475[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v475[4] = v15;
    v16 = v475;
    if (qword_1ED886158 != -1)
      dispatch_once(&qword_1ED886158, v16);

    if (byte_1ED8860F9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Log header starts at offset %llu"), v14);
      v17 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 47);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v478 = v17;
        _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v23 = objc_opt_class();
    v474[0] = MEMORY[0x1E0C809B0];
    v474[1] = 3221225472;
    v474[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_258;
    v474[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v474[4] = v23;
    v24 = v474;
    if (qword_1ED886160 != -1)
      dispatch_once(&qword_1ED886160, v24);

    if (byte_1ED8860FA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stats header starts at offset %llu"), v14 | 0xD);
      v25 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lastPathComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 51);

      PLLogCommon();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v478 = v25;
        _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLMav4BasebandHardwareMessage setHeader:](self, "setHeader:", v4 + 13);
  objc_msgSend(v420, "appendFormat:", CFSTR("Sw Rev[%0x %0x] "), v4[13], v4[14]);
  objc_msgSend(v420, "appendFormat:", CFSTR("Hw Rev[%0x %0x] "), v4[15], v4[16]);
  v31 = 0x1E0D7F000uLL;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v32 = objc_opt_class();
    v473[0] = MEMORY[0x1E0C809B0];
    v473[1] = 3221225472;
    v473[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_267;
    v473[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v473[4] = v32;
    v33 = v473;
    if (qword_1ED886168 != -1)
      dispatch_once(&qword_1ED886168, v33);

    v31 = 0x1E0D7F000;
    if (byte_1ED8860FB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Header Info: %@"), v420);
      v34 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastPathComponent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 57);

      PLLogCommon();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v478 = v34;
        _os_log_debug_impl(&dword_1CAF47000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v31 = 0x1E0D7F000uLL;
    }
  }
  v40 = v4 + 33;
  if (objc_msgSend(*(id *)(v31 + 4000), "debugEnabled"))
  {
    v41 = objc_opt_class();
    v472[0] = MEMORY[0x1E0C809B0];
    v472[1] = 3221225472;
    v472[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_272;
    v472[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v472[4] = v41;
    v42 = v472;
    if (qword_1ED886170 != -1)
      dispatch_once(&qword_1ED886170, v42);

    if (byte_1ED8860FC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Size after Seq and Statsheader %lu"), objc_msgSend(v419, "length") - 22);
      v43 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "lastPathComponent");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "logMessage:fromFile:fromFunction:fromLineNumber:", v43, v46, v47, 62);

      PLLogCommon();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v478 = v43;
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
      v471[0] = MEMORY[0x1E0C809B0];
      v471[1] = 3221225472;
      v471[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_277;
      v471[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v471[4] = v51;
      v52 = v471;
      if (qword_1ED886178 != -1)
        dispatch_once(&qword_1ED886178, v52);

      if (byte_1ED8860FD)
      {
        v53 = v14;
        v54 = v40;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 1: RPM starts at offset %llu"), v49);
        v55 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "lastPathComponent");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "logMessage:fromFile:fromFunction:fromLineNumber:", v55, v58, v59, 69);

        PLLogCommon();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v55;
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
      v470[0] = MEMORY[0x1E0C809B0];
      v470[1] = 3221225472;
      v470[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_282;
      v470[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v470[4] = v61;
      v62 = v470;
      if (qword_1ED886180 != -1)
        dispatch_once(&qword_1ED886180, v62);

      if (byte_1ED8860FE)
      {
        v63 = v40;
        v64 = v49;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 2: Apps Perf starts at offset %llu"), v49);
        v65 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v66 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "lastPathComponent");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "logMessage:fromFile:fromFunction:fromLineNumber:", v65, v68, v69, 78);

        PLLogCommon();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v65;
          _os_log_debug_impl(&dword_1CAF47000, v70, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v63;
        v49 = v64;
      }
    }
    -[PLBBMav16HwMsgParser setMav16AppsPerf:](self, "setMav16AppsPerf:", v40);
    v71 = v40 + 28;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v72 = objc_opt_class();
      v469[0] = MEMORY[0x1E0C809B0];
      v469[1] = 3221225472;
      v469[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_287;
      v469[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v469[4] = v72;
      v73 = v469;
      if (qword_1ED886188 != -1)
        dispatch_once(&qword_1ED886188, v73);

      if (byte_1ED8860FF)
      {
        v74 = v40;
        v421 = v49;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 2: Apps Sleep starts at offset %llu"), v49 + 28);
        v75 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v76 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "lastPathComponent");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "logMessage:fromFile:fromFunction:fromLineNumber:", v75, v78, v79, 83);

        PLLogCommon();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v75;
          _os_log_debug_impl(&dword_1CAF47000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v74;
        v49 = v421;
      }
    }
    -[PLBBMav13HwMsgParser setAppsSleep:](self, "setAppsSleep:", v71);
    v40 += 40;
    v49 += 40;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 3)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v81 = objc_opt_class();
      v468[0] = MEMORY[0x1E0C809B0];
      v468[1] = 3221225472;
      v468[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_292;
      v468[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v468[4] = v81;
      v82 = v468;
      if (qword_1ED886190 != -1)
        dispatch_once(&qword_1ED886190, v82);

      if (byte_1ED886100)
      {
        v83 = v40;
        v84 = v49;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 3: PCIE stats starts at offset %llu"), v49);
        v85 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v86 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "lastPathComponent");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "logMessage:fromFile:fromFunction:fromLineNumber:", v85, v88, v89, 92);

        PLLogCommon();
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v85;
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
      v467[0] = MEMORY[0x1E0C809B0];
      v467[1] = 3221225472;
      v467[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_297;
      v467[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v467[4] = v91;
      v92 = v467;
      if (qword_1ED886198 != -1)
        dispatch_once(&qword_1ED886198, v92);

      if (byte_1ED886101)
      {
        v93 = v40;
        v94 = v49;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 4: LPASS stats starts at offset %llu"), v49);
        v95 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v96 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "lastPathComponent");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "logMessage:fromFile:fromFunction:fromLineNumber:", v95, v98, v99, 101);

        PLLogCommon();
        v100 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v95;
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
    v422 = v49;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v102 = objc_opt_class();
      v466[0] = MEMORY[0x1E0C809B0];
      v466[1] = 3221225472;
      v466[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_302;
      v466[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v466[4] = v102;
      v103 = v466;
      if (qword_1ED8861A0 != -1)
        dispatch_once(&qword_1ED8861A0, v103);

      if (byte_1ED886102)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: Apps Sleep veto stats starts at offset %llu"), v49);
        v104 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v105 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "lastPathComponent");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "logMessage:fromFile:fromFunction:fromLineNumber:", v104, v107, v108, 110);

        PLLogCommon();
        v109 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v104;
          _os_log_debug_impl(&dword_1CAF47000, v109, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        v49 = v422;
      }
    }
    -[PLBBMav16HwMsgParser setMav16AppsSleepVeto:](self, "setMav16AppsSleepVeto:", v40);
    v110 = v40 + 16;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v111 = objc_opt_class();
      v465[0] = MEMORY[0x1E0C809B0];
      v465[1] = 3221225472;
      v465[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_307;
      v465[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v465[4] = v111;
      v112 = v465;
      if (qword_1ED8861A8 != -1)
        dispatch_once(&qword_1ED8861A8, v112);

      if (byte_1ED886103)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: MPSS Sleep veto stats starts at offset %llu"), v49 + 16);
        v113 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v114 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "lastPathComponent");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "logMessage:fromFile:fromFunction:fromLineNumber:", v113, v116, v117, 115);

        PLLogCommon();
        v118 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v113;
          _os_log_debug_impl(&dword_1CAF47000, v118, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        v49 = v422;
      }
    }
    -[PLBBMav16HwMsgParser setMav16MpssSleepVeto:](self, "setMav16MpssSleepVeto:", v110);
    v119 = v40 + 100;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v120 = objc_opt_class();
      v464[0] = MEMORY[0x1E0C809B0];
      v464[1] = 3221225472;
      v464[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_312;
      v464[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v464[4] = v120;
      v121 = v464;
      if (qword_1ED8861B0 != -1)
        dispatch_once(&qword_1ED8861B0, v121);

      if (byte_1ED886104)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: QDSP Sleep veto stats starts at offset %llu"), v49 + 100);
        v122 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v123 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "lastPathComponent");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "logMessage:fromFile:fromFunction:fromLineNumber:", v122, v125, v126, 120);

        PLLogCommon();
        v127 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v122;
          _os_log_debug_impl(&dword_1CAF47000, v127, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        v49 = v422;
      }
    }
    -[PLBBMav16HwMsgParser setMav16QdspSpeed:](self, "setMav16QdspSpeed:", v119);
    v128 = v40 + 164;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v129 = objc_opt_class();
      v463[0] = MEMORY[0x1E0C809B0];
      v463[1] = 3221225472;
      v463[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_317;
      v463[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v463[4] = v129;
      v130 = v463;
      if (qword_1ED8861B8 != -1)
        dispatch_once(&qword_1ED8861B8, v130);

      if (byte_1ED886105)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: MPSS Sleep stats starts at offset %llu"), v49 + 164);
        v131 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v132 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "lastPathComponent");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "logMessage:fromFile:fromFunction:fromLineNumber:", v131, v134, v135, 125);

        PLLogCommon();
        v136 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v131;
          _os_log_debug_impl(&dword_1CAF47000, v136, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        v49 = v422;
      }
    }
    -[PLBBMav13HwMsgParser setMpssSleep:](self, "setMpssSleep:", v128);
    v137 = v40 + 176;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v138 = objc_opt_class();
      v462[0] = MEMORY[0x1E0C809B0];
      v462[1] = 3221225472;
      v462[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_322;
      v462[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v462[4] = v138;
      v139 = v462;
      if (qword_1ED8861C0 != -1)
        dispatch_once(&qword_1ED8861C0, v139);

      if (byte_1ED886106)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: GPS stats starts at offset %llu"), v49 + 176);
        v140 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v141 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "lastPathComponent");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "logMessage:fromFile:fromFunction:fromLineNumber:", v140, v143, v144, 130);

        PLLogCommon();
        v145 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v140;
          _os_log_debug_impl(&dword_1CAF47000, v145, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        v49 = v422;
      }
    }
    -[PLBBMav13HwMsgParser setGpsState:](self, "setGpsState:", v137);
    v146 = v40 + 184;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v147 = objc_opt_class();
      v461[0] = MEMORY[0x1E0C809B0];
      v461[1] = 3221225472;
      v461[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_327;
      v461[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v461[4] = v147;
      v148 = v461;
      if (qword_1ED8861C8 != -1)
        dispatch_once(&qword_1ED8861C8, v148);

      if (byte_1ED886107)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: GPS DPO stats starts at offset %llu"), v49 + 184);
        v149 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v150 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "lastPathComponent");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "logMessage:fromFile:fromFunction:fromLineNumber:", v149, v152, v153, 135);

        PLLogCommon();
        v154 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v149;
          _os_log_debug_impl(&dword_1CAF47000, v154, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        v49 = v422;
      }
    }
    -[PLBBMav13HwMsgParser setGpsDpoState:](self, "setGpsDpoState:", v146);
    v155 = v40 + 192;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v156 = objc_opt_class();
      v460[0] = MEMORY[0x1E0C809B0];
      v460[1] = 3221225472;
      v460[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_332;
      v460[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v460[4] = v156;
      v157 = v460;
      if (qword_1ED8861D0 != -1)
        dispatch_once(&qword_1ED8861D0, v157);

      if (byte_1ED886108)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 5: GPS DPO bin stats starts at offset %llu"), v49 + 192);
        v158 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v159 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "lastPathComponent");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "logMessage:fromFile:fromFunction:fromLineNumber:", v158, v161, v162, 140);

        PLLogCommon();
        v163 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v158;
          _os_log_debug_impl(&dword_1CAF47000, v163, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        v49 = v422;
      }
    }
    -[PLBBMav13HwMsgParser setGpsDpoBins:](self, "setGpsDpoBins:", v155);
    v40 += 216;
    v49 += 216;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 6)
  {
    v427 = v40;
    v423 = v49;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v164 = objc_opt_class();
      v459[0] = MEMORY[0x1E0C809B0];
      v459[1] = 3221225472;
      v459[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_337;
      v459[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v459[4] = v164;
      v165 = v459;
      if (qword_1ED8861D8 != -1)
        dispatch_once(&qword_1ED8861D8, v165);

      if (byte_1ED886109)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 6: MCPM Sleep veto starts at offset %llu"), v49);
        v166 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v167 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v168, "lastPathComponent");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v167, "logMessage:fromFile:fromFunction:fromLineNumber:", v166, v169, v170, 149);

        PLLogCommon();
        v171 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v171, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v166;
          _os_log_debug_impl(&dword_1CAF47000, v171, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v427;
        v49 = v423;
      }
    }
    -[PLBBMav13HwMsgParser setMcpmSleepVeto:](self, "setMcpmSleepVeto:", v40);
    v172 = v40 + 52;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v173 = objc_opt_class();
      v458[0] = MEMORY[0x1E0C809B0];
      v458[1] = 3221225472;
      v458[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_342;
      v458[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v458[4] = v173;
      v174 = v458;
      if (qword_1ED8861E0 != -1)
        dispatch_once(&qword_1ED8861E0, v174);

      if (byte_1ED88610A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 6: Protocol Active starts at offset %llu"), v49 + 52);
        v175 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v176 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "lastPathComponent");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "logMessage:fromFile:fromFunction:fromLineNumber:", v175, v178, v179, 154);

        PLLogCommon();
        v180 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v175;
          _os_log_debug_impl(&dword_1CAF47000, v180, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v427;
        v49 = v423;
      }
    }
    -[PLBBMav13HwMsgParser setProtocolActive:](self, "setProtocolActive:", v172);
    v181 = v40 + 76;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v182 = objc_opt_class();
      v457[0] = MEMORY[0x1E0C809B0];
      v457[1] = 3221225472;
      v457[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_347;
      v457[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v457[4] = v182;
      v183 = v457;
      if (qword_1ED8861E8 != -1)
        dispatch_once(&qword_1ED8861E8, v183);

      if (byte_1ED88610B)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 6: Optim mask starts at offset %llu"), v49 + 76);
        v184 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v185 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v186, "lastPathComponent");
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v185, "logMessage:fromFile:fromFunction:fromLineNumber:", v184, v187, v188, 159);

        PLLogCommon();
        v189 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v184;
          _os_log_debug_impl(&dword_1CAF47000, v189, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v49 = v423;
      }
    }
    -[PLBBMav13HwMsgParser setOptimMaskArray:](self, "setOptimMaskArray:", v181);
    v190 = objc_opt_class();
    v456[0] = MEMORY[0x1E0C809B0];
    v456[1] = 3221225472;
    v456[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_352;
    v456[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v456[4] = v190;
    v191 = v456;
    if (qword_1ED8861F0 != -1)
      dispatch_once(&qword_1ED8861F0, v191);

    if (byte_1ED88610C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), *(unsigned __int8 *)-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray"));
      v192 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1]);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[2]);
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[3]);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      v425 = (void *)v192;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Optim Mask [%@ %@ %@ %@]"), v192, v193, v194, v195);
      v196 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v197 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "lastPathComponent");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v197, "logMessage:fromFile:fromFunction:fromLineNumber:", v196, v199, v200, 167);

      PLLogCommon();
      v201 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v201, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v478 = v196;
        _os_log_debug_impl(&dword_1CAF47000, v201, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v50 = 0x1E0D7F000uLL;
      v49 = v423;
    }
    v49 += 80;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v202 = objc_opt_class();
      v455[0] = MEMORY[0x1E0C809B0];
      v455[1] = 3221225472;
      v455[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_359;
      v455[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v455[4] = v202;
      v203 = v455;
      if (qword_1ED8861F8 != -1)
        dispatch_once(&qword_1ED8861F8, v203);

      if (byte_1ED88610D)
      {
        v204 = v49;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 6: Protocol State starts at offset %llu"), v49);
        v205 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v206 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v207, "lastPathComponent");
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v206, "logMessage:fromFile:fromFunction:fromLineNumber:", v205, v208, v209, 171);

        PLLogCommon();
        v210 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v210, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v205;
          _os_log_debug_impl(&dword_1CAF47000, v210, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v50 = 0x1E0D7F000uLL;
        v49 = v204;
      }
    }
    v40 = v427 + 80;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v211 = objc_opt_class();
      v454[0] = MEMORY[0x1E0C809B0];
      v454[1] = 3221225472;
      v454[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_364;
      v454[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v454[4] = v211;
      v212 = v454;
      if (qword_1ED886200 != -1)
        dispatch_once(&qword_1ED886200, v212);

      if (byte_1ED88610E)
      {
        v213 = v49;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level 6: Optim mask value [0x%x]"), *(unsigned int *)-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray"));
        v214 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v215 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v216 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v216, "lastPathComponent");
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v215, "logMessage:fromFile:fromFunction:fromLineNumber:", v214, v217, v218, 176);

        PLLogCommon();
        v219 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v219, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v214;
          _os_log_debug_impl(&dword_1CAF47000, v219, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v50 = 0x1E0D7F000uLL;
        v49 = v213;
      }
    }
    +[PLBBMav13HwMsgParser optimMaskMappings](PLBBMav13HwMsgParser, "optimMaskMappings");
    v426 = (void *)objc_claimAutoreleasedReturnValue();
    v220 = 0;
    v428 = self;
    do
    {
      if (((*(_DWORD *)-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray") >> v220) & 1) != 0)
      {
        if (objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
        {
          v221 = objc_opt_class();
          v453[0] = MEMORY[0x1E0C809B0];
          v453[1] = 3221225472;
          v453[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_370;
          v453[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v453[4] = v221;
          v222 = v453;
          if (qword_1ED886208 != -1)
            dispatch_once(&qword_1ED886208, v222);

          if (byte_1ED88610F)
          {
            v223 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v220);
            v224 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v426, "objectForKeyedSubscript:", v224);
            v225 = (void *)objc_claimAutoreleasedReturnValue();
            v226 = v40;
            v227 = v49;
            objc_msgSend(v223, "stringWithFormat:", CFSTR("Payload %@ is present at offset %llu, pointer %ld"), v225, v49, v40);
            v228 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();

            v229 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v230 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v230, "lastPathComponent");
            v231 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v232 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v229, "logMessage:fromFile:fromFunction:fromLineNumber:", v228, v231, v232, 182);

            PLLogCommon();
            v233 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v233, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v478 = v228;
              _os_log_debug_impl(&dword_1CAF47000, v233, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v40 = v226;
            v49 = v227;
            self = v428;
          }
        }
        switch((int)v220)
        {
          case 0:
            -[PLBBMav13HwMsgParser setProtoStateC2K:](self, "setProtoStateC2K:", v40);
            v49 += 64;
            v40 += 64;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v234 = objc_opt_class();
            v452[0] = MEMORY[0x1E0C809B0];
            v452[1] = 3221225472;
            v452[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_376;
            v452[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v452[4] = v234;
            v235 = v452;
            if (qword_1ED886210 != -1)
              dispatch_once(&qword_1ED886210, v235);

            if (!byte_1ED886110)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v240 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v241 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v241, "lastPathComponent");
            v242 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v243 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v240, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v242, v243, 189);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 1:
            -[PLBBMav13HwMsgParser setProtoStateHDR:](self, "setProtoStateHDR:", v40);
            v49 += 64;
            v40 += 64;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v245 = objc_opt_class();
            v451[0] = MEMORY[0x1E0C809B0];
            v451[1] = 3221225472;
            v451[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_381;
            v451[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v451[4] = v245;
            v246 = v451;
            if (qword_1ED886218 != -1)
              dispatch_once(&qword_1ED886218, v246);

            if (!byte_1ED886111)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v247 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v248 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v248, "lastPathComponent");
            v249 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v250 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v247, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v249, v250, 195);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 2:
            -[PLBBMav13HwMsgParser setProtoStateGSM:](self, "setProtoStateGSM:", v40);
            v49 += 64;
            v40 += 64;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v251 = objc_opt_class();
            v450[0] = MEMORY[0x1E0C809B0];
            v450[1] = 3221225472;
            v450[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_384;
            v450[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v450[4] = v251;
            v252 = v450;
            if (qword_1ED886220 != -1)
              dispatch_once(&qword_1ED886220, v252);

            if (!byte_1ED886112)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v253 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v254 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v254, "lastPathComponent");
            v255 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v253, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v255, v256, 201);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 3:
            -[PLBBMav13HwMsgParser setProtoStateWCDMA:](self, "setProtoStateWCDMA:", v40);
            v49 += 64;
            v40 += 64;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v257 = objc_opt_class();
            v449[0] = MEMORY[0x1E0C809B0];
            v449[1] = 3221225472;
            v449[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_387;
            v449[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v449[4] = v257;
            v258 = v449;
            if (qword_1ED886228 != -1)
              dispatch_once(&qword_1ED886228, v258);

            if (!byte_1ED886113)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v259 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v260 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v260, "lastPathComponent");
            v261 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v262 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v259, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v261, v262, 207);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 4:
            -[PLBBMav13HwMsgParser setProtoStateLTE:](self, "setProtoStateLTE:", v40);
            v49 += 64;
            v40 += 64;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v263 = objc_opt_class();
            v448[0] = MEMORY[0x1E0C809B0];
            v448[1] = 3221225472;
            v448[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_390;
            v448[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v448[4] = v263;
            v264 = v448;
            if (qword_1ED886230 != -1)
              dispatch_once(&qword_1ED886230, v264);

            if (!byte_1ED886114)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v265 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v266 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v266, "lastPathComponent");
            v267 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v268 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v265, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v267, v268, 213);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 5:
            -[PLBBMav13HwMsgParser setProtoStateTDS:](self, "setProtoStateTDS:", v40);
            v49 += 64;
            v40 += 64;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v269 = objc_opt_class();
            v447[0] = MEMORY[0x1E0C809B0];
            v447[1] = 3221225472;
            v447[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_393;
            v447[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v447[4] = v269;
            v270 = v447;
            if (qword_1ED886238 != -1)
              dispatch_once(&qword_1ED886238, v270);

            if (!byte_1ED886115)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v271 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v272 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v272, "lastPathComponent");
            v273 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v274 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v271, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v273, v274, 219);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 6:
            -[PLBBMav13HwMsgParser setRfDataC2K:](self, "setRfDataC2K:", v40);
            v49 += 256;
            v40 += 256;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v275 = objc_opt_class();
            v446[0] = MEMORY[0x1E0C809B0];
            v446[1] = 3221225472;
            v446[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_396;
            v446[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v446[4] = v275;
            v276 = v446;
            if (qword_1ED886240 != -1)
              dispatch_once(&qword_1ED886240, v276);

            if (!byte_1ED886116)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v277 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v278 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v278, "lastPathComponent");
            v279 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v280 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v277, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v279, v280, 225);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 7:
            -[PLBBMav13HwMsgParser setRfData1xEVDO:](self, "setRfData1xEVDO:", v40);
            v49 += 256;
            v40 += 256;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v281 = objc_opt_class();
            v445[0] = MEMORY[0x1E0C809B0];
            v445[1] = 3221225472;
            v445[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_399;
            v445[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v445[4] = v281;
            v282 = v445;
            if (qword_1ED886248 != -1)
              dispatch_once(&qword_1ED886248, v282);

            if (!byte_1ED886117)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 64);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v283 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v284 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v284, "lastPathComponent");
            v285 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v286 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v283, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v285, v286, 231);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 8:
            -[PLBBMav13HwMsgParser setRfDataGSM:](self, "setRfDataGSM:", v40);
            v49 += 256;
            v40 += 256;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v287 = objc_opt_class();
            v444[0] = MEMORY[0x1E0C809B0];
            v444[1] = 3221225472;
            v444[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_402;
            v444[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v444[4] = v287;
            v288 = v444;
            if (qword_1ED886250 != -1)
              dispatch_once(&qword_1ED886250, v288);

            if (!byte_1ED886118)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 256);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v289 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v290 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v290, "lastPathComponent");
            v291 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v292 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v289, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v291, v292, 237);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 9:
            -[PLBBMav13HwMsgParser setRfDataWCDMA:](self, "setRfDataWCDMA:", v40);
            v49 += 208;
            v40 += 208;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v293 = objc_opt_class();
            v443[0] = MEMORY[0x1E0C809B0];
            v443[1] = 3221225472;
            v443[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_405;
            v443[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v443[4] = v293;
            v294 = v443;
            if (qword_1ED886258 != -1)
              dispatch_once(&qword_1ED886258, v294);

            if (!byte_1ED886119)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 208);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v295 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v296 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v296, "lastPathComponent");
            v297 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v298 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v295, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v297, v298, 243);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 10:
            -[PLBBMav13HwMsgParser setRfDataLTE:](self, "setRfDataLTE:", v40);
            v49 += 256;
            v40 += 256;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v299 = objc_opt_class();
            v442[0] = MEMORY[0x1E0C809B0];
            v442[1] = 3221225472;
            v442[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_408;
            v442[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v442[4] = v299;
            v300 = v442;
            if (qword_1ED886260 != -1)
              dispatch_once(&qword_1ED886260, v300);

            if (!byte_1ED88611A)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 256);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v301 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v302 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v302, "lastPathComponent");
            v303 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v304 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v301, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v303, v304, 249);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 11:
            -[PLBBMav13HwMsgParser setRfDataTDS:](self, "setRfDataTDS:", v40);
            v49 += 256;
            v40 += 256;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v305 = objc_opt_class();
            v441[0] = MEMORY[0x1E0C809B0];
            v441[1] = 3221225472;
            v441[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_411;
            v441[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v441[4] = v305;
            v306 = v441;
            if (qword_1ED886268 != -1)
              dispatch_once(&qword_1ED886268, v306);

            if (!byte_1ED88611B)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 256);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v307 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v308 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v308, "lastPathComponent");
            v309 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v310 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v307, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v309, v310, 255);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 12:
            -[PLBBMav16HwMsgParser setRfEnhLTEMav16:](self, "setRfEnhLTEMav16:", v40);
            if (objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
            {
              v311 = objc_opt_class();
              v436[0] = MEMORY[0x1E0C809B0];
              v436[1] = 3221225472;
              v436[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_426;
              v436[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v436[4] = v311;
              v312 = v436;
              if (qword_1ED886290 != -1)
                dispatch_once(&qword_1ED886290, v312);

              if (byte_1ED886120)
              {
                v313 = v49;
                v314 = v40;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 574);
                v315 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v316 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
                v317 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v317, "lastPathComponent");
                v318 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
                v319 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v316, "logMessage:fromFile:fromFunction:fromLineNumber:", v315, v318, v319, 285);

                PLLogCommon();
                v320 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v320, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v478 = v315;
                  _os_log_debug_impl(&dword_1CAF47000, v320, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v40 = v314;
                v49 = v313;
                self = v428;
              }
            }
            if (objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
            {
              v321 = objc_opt_class();
              v435[0] = MEMORY[0x1E0C809B0];
              v435[1] = 3221225472;
              v435[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_429;
              v435[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v435[4] = v321;
              v322 = v435;
              if (qword_1ED886298 != -1)
                dispatch_once(&qword_1ED886298, v322);

              if (byte_1ED886121)
              {
                v424 = v49;
                v323 = v40;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("received PCC bw/band in struct %d,%d. SCC1 bw/band in struct %d,%d"), -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[569], -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[568], -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[572], -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[570]);
                v324 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v325 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
                v326 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v326, "lastPathComponent");
                v327 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
                v328 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v325, "logMessage:fromFile:fromFunction:fromLineNumber:", v324, v327, v328, 288);

                PLLogCommon();
                v329 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v329, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v478 = v324;
                  _os_log_debug_impl(&dword_1CAF47000, v329, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v50 = 0x1E0D7F000uLL;
                v40 = v323;
                v49 = v424;
              }
            }
            if (objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
            {
              v330 = objc_opt_class();
              v434[0] = MEMORY[0x1E0C809B0];
              v434[1] = 3221225472;
              v434[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_434;
              v434[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v434[4] = v330;
              v331 = v434;
              if (qword_1ED8862A0 != -1)
                dispatch_once(&qword_1ED8862A0, v331);

              if (byte_1ED886122)
              {
                v332 = v49;
                v333 = v40;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received ARD stats %u"), -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[352]);
                v334 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v335 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
                v336 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v336, "lastPathComponent");
                v337 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
                v338 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v335, "logMessage:fromFile:fromFunction:fromLineNumber:", v334, v337, v338, 289);

                PLLogCommon();
                v339 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v339, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v478 = v334;
                  _os_log_debug_impl(&dword_1CAF47000, v339, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v40 = v333;
                v49 = v332;
                self = v428;
              }
            }
            v49 += 576;
            v40 += 576;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v340 = objc_opt_class();
            v433[0] = MEMORY[0x1E0C809B0];
            v433[1] = 3221225472;
            v433[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_439;
            v433[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v433[4] = v340;
            v341 = v433;
            if (qword_1ED8862A8 != -1)
              dispatch_once(&qword_1ED8862A8, v341);

            if (!byte_1ED886123)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Padding size for padding before LTE struct [%lu]"), 2);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v342 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v343 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v343, "lastPathComponent");
            v344 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v345 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v342, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v344, v345, 290);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 13:
            -[PLBBMav16HwMsgParser setRfEnhWCDMAMav16:](self, "setRfEnhWCDMAMav16:", v40);
            v49 += 192;
            v40 += 192;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v346 = objc_opt_class();
            v437[0] = MEMORY[0x1E0C809B0];
            v437[1] = 3221225472;
            v437[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_423;
            v437[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v437[4] = v346;
            v347 = v437;
            if (qword_1ED886288 != -1)
              dispatch_once(&qword_1ED886288, v347);

            if (!byte_1ED88611F)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 192);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v348 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v349 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v349, "lastPathComponent");
            v350 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v351 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v348, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v350, v351, 279);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 14:
            -[PLBBMav13HwMsgParser setRfEnhGSM:](self, "setRfEnhGSM:", v40);
            v49 += 20;
            v40 += 20;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v352 = objc_opt_class();
            v438[0] = MEMORY[0x1E0C809B0];
            v438[1] = 3221225472;
            v438[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_420;
            v438[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v438[4] = v352;
            v353 = v438;
            if (qword_1ED886280 != -1)
              dispatch_once(&qword_1ED886280, v353);

            if (!byte_1ED88611E)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 20);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v354 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v355 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v355, "lastPathComponent");
            v356 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v357 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v354, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v356, v357, 273);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 15:
            -[PLBBMav13HwMsgParser setRfEnhTDS:](self, "setRfEnhTDS:", v40);
            v49 += 48;
            v40 += 48;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v358 = objc_opt_class();
            v432[0] = MEMORY[0x1E0C809B0];
            v432[1] = 3221225472;
            v432[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_444;
            v432[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v432[4] = v358;
            v359 = v432;
            if (qword_1ED8862B0 != -1)
              dispatch_once(&qword_1ED8862B0, v359);

            if (!byte_1ED886124)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 48);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v360 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v361 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v361, "lastPathComponent");
            v362 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v363 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v360, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v362, v363, 296);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 16:
            -[PLBBMav13HwMsgParser setRfEnhC2K:](self, "setRfEnhC2K:", v40);
            v49 += 40;
            v40 += 40;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v364 = objc_opt_class();
            v440[0] = MEMORY[0x1E0C809B0];
            v440[1] = 3221225472;
            v440[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_414;
            v440[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v440[4] = v364;
            v365 = v440;
            if (qword_1ED886270 != -1)
              dispatch_once(&qword_1ED886270, v365);

            if (!byte_1ED88611C)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 40);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v366 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v367 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v367, "lastPathComponent");
            v368 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v369 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v366, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v368, v369, 261);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              goto LABEL_313;
            goto LABEL_314;
          case 17:
            -[PLBBMav13HwMsgParser setRfEnh1xEVDO:](self, "setRfEnh1xEVDO:", v40);
            v49 += 32;
            v40 += 32;
            if (!objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
              break;
            v370 = objc_opt_class();
            v439[0] = MEMORY[0x1E0C809B0];
            v439[1] = 3221225472;
            v439[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_417;
            v439[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v439[4] = v370;
            v371 = v439;
            if (qword_1ED886278 != -1)
              dispatch_once(&qword_1ED886278, v371);

            if (!byte_1ED88611D)
              break;
            v236 = v50;
            v237 = v49;
            v238 = v40;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 32);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v372 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
            v373 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v373, "lastPathComponent");
            v374 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
            v375 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v372, "logMessage:fromFile:fromFunction:fromLineNumber:", v239, v374, v375, 267);

            PLLogCommon();
            v244 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
            {
LABEL_313:
              *(_DWORD *)buf = 138412290;
              v478 = v239;
              _os_log_debug_impl(&dword_1CAF47000, v244, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
LABEL_314:
            v40 = v238;
            v49 = v237;
            v50 = v236;

            self = v428;
            break;
          case 18:
            -[PLBBMav13HwMsgParser setRfEnhOOS:](self, "setRfEnhOOS:", v40);
            v49 += 156;
            v40 += 156;
            if (objc_msgSend(*(id *)(v50 + 4000), "debugEnabled"))
            {
              v376 = objc_opt_class();
              v431[0] = MEMORY[0x1E0C809B0];
              v431[1] = 3221225472;
              v431[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_447;
              v431[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v431[4] = v376;
              v377 = v431;
              if (qword_1ED8862B8 != -1)
                dispatch_once(&qword_1ED8862B8, v377);

              if (byte_1ED886125)
              {
                v378 = v49;
                v379 = v40;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload size [%lu]"), 156);
                v380 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v381 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
                v382 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v382, "lastPathComponent");
                v383 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
                v384 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v381, "logMessage:fromFile:fromFunction:fromLineNumber:", v380, v383, v384, 302);

                PLLogCommon();
                v385 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v385, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v478 = v380;
                  _os_log_debug_impl(&dword_1CAF47000, v385, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v40 = v379;
                v49 = v378;
              }
            }
            goto LABEL_324;
          default:
            break;
        }
      }
      v220 = (v220 + 1);
    }
    while ((_DWORD)v220 != 19);
LABEL_324:
    if ((objc_msgSend(*(id *)(v50 + 4000), "debugEnabled") & 1) != 0)
    {
      v386 = objc_opt_class();
      v430[0] = MEMORY[0x1E0C809B0];
      v430[1] = 3221225472;
      v430[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_450;
      v430[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v430[4] = v386;
      v387 = v430;
      if (qword_1ED8862C0 != -1)
        dispatch_once(&qword_1ED8862C0, v387);

      if (byte_1ED886126)
      {
        v388 = v40;
        v389 = v49;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("End of Proto, Rf, Enh data at offset %llu"), v49);
        v390 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v391 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v392 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v392, "lastPathComponent");
        v393 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v394 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v391, "logMessage:fromFile:fromFunction:fromLineNumber:", v390, v393, v394, 308);

        PLLogCommon();
        v395 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v395, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v390;
          _os_log_debug_impl(&dword_1CAF47000, v395, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v388;
        v49 = v389;
        self = v428;
      }
    }

  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 7)
  {
    -[PLMav7BasebandHardwareMessage setApps_clock_duration_mask:](self, "setApps_clock_duration_mask:", v40);
    v396 = -[PLBBMav13HwMsgParser GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage apps_clock_duration_mask](self, "apps_clock_duration_mask"));
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v397 = v50;
    v398 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMav7BasebandHardwareMessage setApps_clock_duration:](self, "setApps_clock_duration:", v398);

    -[PLBBMav13HwMsgParser SetClocks:oftype:withData:](self, "SetClocks:oftype:withData:", -[PLMav7BasebandHardwareMessage apps_clock_duration_mask](self, "apps_clock_duration_mask"), 0, v40 + 16);
    -[PLMav7BasebandHardwareMessage setMpss_clock_duration_mask:](self, "setMpss_clock_duration_mask:", &v40[4 * v396 + 16]);
    v399 = -[PLBBMav13HwMsgParser GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage mpss_clock_duration_mask](self, "mpss_clock_duration_mask"));
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v400 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMav7BasebandHardwareMessage setMpss_clock_duration:](self, "setMpss_clock_duration:", v400);

    -[PLBBMav13HwMsgParser SetClocks:oftype:withData:](self, "SetClocks:oftype:withData:", -[PLMav7BasebandHardwareMessage mpss_clock_duration_mask](self, "mpss_clock_duration_mask"), 1, &v40[4 * v396 + 32]);
    v40 += 4 * v396 + 4 * v399 + 32;
    if (objc_msgSend(*(id *)(v397 + 4000), "debugEnabled"))
    {
      v401 = objc_opt_class();
      v429[0] = MEMORY[0x1E0C809B0];
      v429[1] = 3221225472;
      v429[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_455;
      v429[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v429[4] = v401;
      v402 = v429;
      if (qword_1ED8862C8 != -1)
        dispatch_once(&qword_1ED8862C8, v402);

      if (byte_1ED886127)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("End of level 6 at offset %llu"), v49 + 4 * v396 + 4 * v399 + 32);
        v403 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v404 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v405 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v405, "lastPathComponent");
        v406 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser parseData:]");
        v407 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v404, "logMessage:fromFile:fromFunction:fromLineNumber:", v403, v406, v407, 332);

        PLLogCommon();
        v408 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v408, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v478 = v403;
          _os_log_debug_impl(&dword_1CAF47000, v408, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 8)
  {
    -[PLMav7BasebandHardwareMessage setApps_clock_count_mask:](self, "setApps_clock_count_mask:", v40);
    v409 = (uint64_t)&v40[4
                       * -[PLBBMav13HwMsgParser GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage apps_clock_count_mask](self, "apps_clock_count_mask"))+ 16];
    -[PLMav7BasebandHardwareMessage setMpss_clock_count_mask:](self, "setMpss_clock_count_mask:", v409);
    v410 = v409
         + 4
         * -[PLBBMav13HwMsgParser GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage mpss_clock_count_mask](self, "mpss_clock_count_mask"));
    -[PLMav7BasebandHardwareMessage setHsic:](self, "setHsic:", v410 + 16);
    v40 = (unsigned __int8 *)(v410 + 48);
  }
  v411 = objc_retainAutorelease(v419);
  v412 = (unint64_t)&v40[-objc_msgSend(v411, "bytes")];
  v413 = objc_msgSend(v411, "length");
  if (v412 > v413)
  {
    PLLogCommon();
    v414 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v414, OS_LOG_TYPE_ERROR))
    {
      v416 = objc_retainAutorelease(v411);
      v417 = &v40[-objc_msgSend(v416, "bytes")];
      v418 = objc_msgSend(v416, "length");
      *(_DWORD *)buf = 134218498;
      v478 = v417;
      v479 = 2048;
      v480 = v418;
      v481 = 2080;
      v482 = "-[PLBBMav16HwMsgParser parseData:]";
      _os_log_error_impl(&dword_1CAF47000, v414, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", buf, 0x20u);
    }

  }
  return v412 <= v413;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_78 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_253(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8860F9 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_258(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8860FA = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_267(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8860FB = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_272(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8860FC = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_277(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8860FD = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_282(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8860FE = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_287(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8860FF = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_292(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886100 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_297(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886101 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_302(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886102 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_307(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886103 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_312(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886104 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_317(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886105 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_322(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886106 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_327(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886107 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_332(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886108 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_337(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886109 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_342(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88610A = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_347(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88610B = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_352(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88610C = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_359(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88610D = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_364(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88610E = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_370(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88610F = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_376(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886110 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_381(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886111 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_384(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886112 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_387(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886113 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_390(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886114 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_393(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886115 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_396(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886116 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_399(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886117 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_402(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886118 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_405(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886119 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_408(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88611A = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_411(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88611B = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_414(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88611C = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_417(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88611D = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_420(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88611E = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_423(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88611F = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_426(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886120 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_429(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886121 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_434(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886122 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_439(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886123 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_444(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886124 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_447(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886125 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_450(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886126 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_455(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886127 = result;
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
    v207[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke;
    v207[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v207[4] = v6;
    v7 = v207;
    if (qword_1ED8862D0 != -1)
      dispatch_once(&qword_1ED8862D0, v7);

    if (byte_1ED886128)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16HwMsgParser logWithLogger:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 362);

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
  v206.super_class = (Class)PLBBMav16HwMsgParser;
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

  if (-[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev") == 3)
  {
    -[PLMav4BasebandHardwareMessage logHeaderWithLogger:](self, "logHeaderWithLogger:", v14);
    -[PLBBMav13HwMsgParser logRPMWithLogger:](self, "logRPMWithLogger:", v14);
    -[PLBBMav16HwMsgParser logMav16AppsPerfWithLogger:](self, "logMav16AppsPerfWithLogger:", v14);
    -[PLBBMav16HwMsgParser logMav16MPSSWithLogger:](self, "logMav16MPSSWithLogger:", v14);
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
        v204[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_475;
        v204[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v204[4] = v19;
        v20 = v204;
        if (qword_1ED8862E0 != -1)
          dispatch_once(&qword_1ED8862E0, v20);

        if (byte_1ED88612A)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateC2K is valid"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 400);

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
        v203[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_480;
        v203[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v203[4] = v36;
        v37 = v203;
        if (qword_1ED8862E8 != -1)
          dispatch_once(&qword_1ED8862E8, v37);

        if (byte_1ED88612B)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateHDR is valid"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "lastPathComponent");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v38, v41, v42, 411);

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
        v202[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_485;
        v202[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v202[4] = v44;
        v45 = v202;
        if (qword_1ED8862F0 != -1)
          dispatch_once(&qword_1ED8862F0, v45);

        if (byte_1ED88612C)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateGSM is valid"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "lastPathComponent");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "logMessage:fromFile:fromFunction:fromLineNumber:", v46, v49, v50, 422);

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
        v201[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_490;
        v201[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v201[4] = v52;
        v53 = v201;
        if (qword_1ED8862F8 != -1)
          dispatch_once(&qword_1ED8862F8, v53);

        if (byte_1ED88612D)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateWCDMA is valid"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "lastPathComponent");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "logMessage:fromFile:fromFunction:fromLineNumber:", v54, v57, v58, 433);

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
        v200[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_495;
        v200[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v200[4] = v60;
        v61 = v200;
        if (qword_1ED886300 != -1)
          dispatch_once(&qword_1ED886300, v61);

        if (byte_1ED88612E)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateLTE is valid"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "lastPathComponent");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "logMessage:fromFile:fromFunction:fromLineNumber:", v62, v65, v66, 444);

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
        v199[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_500;
        v199[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v199[4] = v68;
        v69 = v199;
        if (qword_1ED886308 != -1)
          dispatch_once(&qword_1ED886308, v69);

        if (byte_1ED88612F)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protoStateTDS is valid"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "lastPathComponent");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "logMessage:fromFile:fromFunction:fromLineNumber:", v70, v73, v74, 455);

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
    -[PLBBMavLogMsg addToGroupPLBBMav16HwOther](v14, "addToGroupPLBBMav16HwOther");
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 4) != 0
      && -[PLBBMav13HwMsgParser rfDataLTE](self, "rfDataLTE"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v76 = objc_opt_class();
        v198[0] = MEMORY[0x1E0C809B0];
        v198[1] = 3221225472;
        v198[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_505;
        v198[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v198[4] = v76;
        v77 = v198;
        if (qword_1ED886310 != -1)
          dispatch_once(&qword_1ED886310, v77);

        if (byte_1ED886130)
        {
          v181 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataLTE is valid"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "lastPathComponent");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "logMessage:fromFile:fromFunction:fromLineNumber:", v78, v81, v82, 480);

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
        v197[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_510;
        v197[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v197[4] = v85;
        v86 = v197;
        if (qword_1ED886318 != -1)
          dispatch_once(&qword_1ED886318, v86);

        if (byte_1ED886131)
        {
          v182 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataWCDMA is valid"));
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "lastPathComponent");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "logMessage:fromFile:fromFunction:fromLineNumber:", v87, v90, v91, 489);

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
        v196[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_515;
        v196[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v196[4] = v93;
        v94 = v196;
        if (qword_1ED886320 != -1)
          dispatch_once(&qword_1ED886320, v94);

        if (byte_1ED886132)
        {
          v183 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataGSM is valid"));
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "lastPathComponent");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "logMessage:fromFile:fromFunction:fromLineNumber:", v95, v98, v99, 498);

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
        v195[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_520;
        v195[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v195[4] = v101;
        v102 = v195;
        if (qword_1ED886328 != -1)
          dispatch_once(&qword_1ED886328, v102);

        if (byte_1ED886133)
        {
          v184 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataTDS is valid"));
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "lastPathComponent");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "logMessage:fromFile:fromFunction:fromLineNumber:", v103, v106, v107, 507);

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
        v194[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_525;
        v194[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v194[4] = v109;
        v110 = v194;
        if (qword_1ED886330 != -1)
          dispatch_once(&qword_1ED886330, v110);

        if (byte_1ED886134)
        {
          v185 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataTDS is valid"));
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "lastPathComponent");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "logMessage:fromFile:fromFunction:fromLineNumber:", v111, v114, v115, 516);

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
        v193[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_528;
        v193[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v193[4] = v117;
        v118 = v193;
        if (qword_1ED886338 != -1)
          dispatch_once(&qword_1ED886338, v118);

        if (byte_1ED886135)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfDataTDS is valid"));
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "lastPathComponent");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "logMessage:fromFile:fromFunction:fromLineNumber:", v119, v122, v123, 525);

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
      && -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v125 = objc_opt_class();
        v192[0] = MEMORY[0x1E0C809B0];
        v192[1] = 3221225472;
        v192[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_531;
        v192[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v192[4] = v125;
        v126 = v192;
        if (qword_1ED886340 != -1)
          dispatch_once(&qword_1ED886340, v126);

        if (byte_1ED886136)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhLTEMav16 is valid"));
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "lastPathComponent");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "logMessage:fromFile:fromFunction:fromLineNumber:", v127, v130, v131, 540);

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
      -[PLBBMav16HwMsgParser logMav16HwRFEnhLTEWithLogger:](self, "logMav16HwRFEnhLTEWithLogger:", v14);
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 0x20) != 0
      && -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v133 = objc_opt_class();
        v191[0] = MEMORY[0x1E0C809B0];
        v191[1] = 3221225472;
        v191[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_536;
        v191[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v191[4] = v133;
        v134 = v191;
        if (qword_1ED886348 != -1)
          dispatch_once(&qword_1ED886348, v134);

        if (byte_1ED886137)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhWCDMAMav16 is valid"));
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          v136 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "lastPathComponent");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "logMessage:fromFile:fromFunction:fromLineNumber:", v135, v138, v139, 546);

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
      -[PLBBMav16HwMsgParser logMav16HwRFEnhWCDMAWithLogger:](self, "logMav16HwRFEnhWCDMAWithLogger:", v14);
    }
    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 0x40) != 0
      && -[PLBBMav13HwMsgParser rfEnhGSM](self, "rfEnhGSM"))
    {
      if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
      {
        v141 = objc_opt_class();
        v190[0] = MEMORY[0x1E0C809B0];
        v190[1] = 3221225472;
        v190[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_541;
        v190[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v190[4] = v141;
        v142 = v190;
        if (qword_1ED886350 != -1)
          dispatch_once(&qword_1ED886350, v142);

        if (byte_1ED886138)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhGSM is valid"));
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v144 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "lastPathComponent");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "logMessage:fromFile:fromFunction:fromLineNumber:", v143, v146, v147, 552);

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
        v189[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_546;
        v189[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v189[4] = v149;
        v150 = v189;
        if (qword_1ED886358 != -1)
          dispatch_once(&qword_1ED886358, v150);

        if (byte_1ED886139)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhTDS is valid"));
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          v152 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "lastPathComponent");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "logMessage:fromFile:fromFunction:fromLineNumber:", v151, v154, v155, 558);

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
        v188[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_551;
        v188[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v188[4] = v157;
        v158 = v188;
        if (qword_1ED886360 != -1)
          dispatch_once(&qword_1ED886360, v158);

        if (byte_1ED88613A)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnh1x is valid"));
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          v160 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v161, "lastPathComponent");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v160, "logMessage:fromFile:fromFunction:fromLineNumber:", v159, v162, v163, 564);

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
        v187[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_556;
        v187[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v187[4] = v165;
        v166 = v187;
        if (qword_1ED886368 != -1)
          dispatch_once(&qword_1ED886368, v166);

        if (byte_1ED88613B)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhHDR is valid"));
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          v168 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v169, "lastPathComponent");
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v168, "logMessage:fromFile:fromFunction:fromLineNumber:", v167, v170, v171, 570);

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
        v186[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_561;
        v186[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v186[4] = v173;
        v174 = v186;
        if (qword_1ED886370 != -1)
          dispatch_once(&qword_1ED886370, v174);

        if (byte_1ED88613C)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhOOS is valid"));
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v176 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v177, "lastPathComponent");
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "logMessage:fromFile:fromFunction:fromLineNumber:", v175, v178, v179, 576);

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
    -[PLBBMavLogMsg logEventBackwardGrpEntriesBBMav16Hw](v14, "logEventBackwardGrpEntriesBBMav16Hw");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendFormat:", CFSTR("Version Mismatch: Baseband_sw_rev=%d Powerlog_supported_sw_rev=%d"), -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"), 3);
    -[PLBBMavLogMsg setError:](v14, "setError:", v18);
    -[PLBBMavLogMsg setType:](v14, "setType:", CFSTR("BB HW Error"));
    -[PLBBMavLogMsg logEventBackwardMavBBHwOther](v14, "logEventBackwardMavBBHwOther");
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v29 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_469;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v29;
      if (qword_1ED8862D8 != -1)
        dispatch_once(&qword_1ED8862D8, block);
      if (byte_1ED886129)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SW version mismatch. Received %d, expected %d cannot process, returning"), -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"), 3);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "lastPathComponent");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logWithLogger:]");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 380);

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

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886128 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_469(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886129 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_475(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88612A = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_480(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88612B = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_485(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88612C = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_490(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88612D = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_495(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88612E = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_500(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88612F = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_505(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886130 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_510(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886131 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_515(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886132 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_520(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886133 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_525(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886134 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_528(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886135 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_531(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886136 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_536(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886137 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_541(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886138 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_546(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886139 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_551(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88613A = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_556(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88613B = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_561(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88613C = result;
  return result;
}

- (void)logMav16AppsPerfWithLogger:(id)a3
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
    block[2] = __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED886378 != -1)
      dispatch_once(&qword_1ED886378, block);
    if (byte_1ED88613D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16HwMsgParser logMav16AppsPerfWithLogger:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logMav16AppsPerfWithLogger:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 587);

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
  if (-[PLBBMav16HwMsgParser mav16AppsPerf](self, "mav16AppsPerf"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser mav16AppsPerf](self, "mav16AppsPerf"), 7);
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
    v48[2] = __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke_568;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = objc_opt_class();
    if (qword_1ED886380 != -1)
      dispatch_once(&qword_1ED886380, v48);
    if (byte_1ED88613E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Perf_Level=<unknown>"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logMav16AppsPerfWithLogger:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 599);

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
      v47[2] = __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke_573;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v23;
      if (qword_1ED886388 != -1)
        dispatch_once(&qword_1ED886388, v47);
      if (byte_1ED88613F)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Stats=<unknown>"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logMav16AppsPerfWithLogger:]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 610);

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
  if (-[PLBBMav16HwMsgParser mav16AppsSleepVeto](self, "mav16AppsSleepVeto"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser mav16AppsSleepVeto](self, "mav16AppsSleepVeto"), 4);
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
      v46[2] = __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke_580;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v31;
      if (qword_1ED886390 != -1)
        dispatch_once(&qword_1ED886390, v46);
      if (byte_1ED886140)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Veto_Duration=<unknown>"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "lastPathComponent");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logMav16AppsPerfWithLogger:]");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 622);

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
    v45[2] = __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke_587;
    v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v45[4] = v38;
    if (qword_1ED886398 != -1)
      dispatch_once(&qword_1ED886398, v45);
    if (byte_1ED886141)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW APPS"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "lastPathComponent");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logMav16AppsPerfWithLogger:]");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v42, v43, 626);

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

uint64_t __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88613D = result;
  return result;
}

uint64_t __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke_568(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88613E = result;
  return result;
}

uint64_t __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke_573(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88613F = result;
  return result;
}

uint64_t __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke_580(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886140 = result;
  return result;
}

uint64_t __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke_587(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886141 = result;
  return result;
}

- (void)logMav16MPSSWithLogger:(id)a3
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
    block[2] = __47__PLBBMav16HwMsgParser_logMav16MPSSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED8863A0 != -1)
      dispatch_once(&qword_1ED8863A0, block);
    if (byte_1ED886142)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16HwMsgParser logMav16MPSSWithLogger:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logMav16MPSSWithLogger:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 631);

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
  if (-[PLBBMav16HwMsgParser mav16MpssSleepVeto](self, "mav16MpssSleepVeto"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser mav16MpssSleepVeto](self, "mav16MpssSleepVeto"), 21);
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
    v39[2] = __47__PLBBMav16HwMsgParser_logMav16MPSSWithLogger___block_invoke_594;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = objc_opt_class();
    if (qword_1ED8863A8 != -1)
      dispatch_once(&qword_1ED8863A8, v39);
    if (byte_1ED886143)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Veto=<unknown>"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logMav16MPSSWithLogger:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 648);

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
  if (-[PLBBMav16HwMsgParser mav16QdspSpeed](self, "mav16QdspSpeed"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser mav16QdspSpeed](self, "mav16QdspSpeed"), 16);
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
    v38[2] = __47__PLBBMav16HwMsgParser_logMav16MPSSWithLogger___block_invoke_601;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = v24;
    if (qword_1ED8863B0 != -1)
      dispatch_once(&qword_1ED8863B0, v38);
    if (byte_1ED886144)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Q6SW_Perf=<unknown>"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logMav16MPSSWithLogger:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v27, v28, 661);

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
    v37[2] = __47__PLBBMav16HwMsgParser_logMav16MPSSWithLogger___block_invoke_606;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v30;
    if (qword_1ED8863B8 != -1)
      dispatch_once(&qword_1ED8863B8, v37);
    if (byte_1ED886145)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW MPSS"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "lastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logMav16MPSSWithLogger:]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 664);

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

uint64_t __47__PLBBMav16HwMsgParser_logMav16MPSSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886142 = result;
  return result;
}

uint64_t __47__PLBBMav16HwMsgParser_logMav16MPSSWithLogger___block_invoke_594(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886143 = result;
  return result;
}

uint64_t __47__PLBBMav16HwMsgParser_logMav16MPSSWithLogger___block_invoke_601(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886144 = result;
  return result;
}

uint64_t __47__PLBBMav16HwMsgParser_logMav16MPSSWithLogger___block_invoke_606(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886145 = result;
  return result;
}

- (void)logMav16HwRFEnhLTEWithLogger:(id)a3
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
  PLBBMav16HwRfLTELogMsg *v13;
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
  NSObject *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[5];
  _QWORD v75[5];
  _QWORD v76[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__PLBBMav16HwMsgParser_logMav16HwRFEnhLTEWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED8863C0 != -1)
      dispatch_once(&qword_1ED8863C0, block);
    if (byte_1ED886146)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16HwMsgParser logMav16HwRFEnhLTEWithLogger:]");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logMav16HwRFEnhLTEWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 669);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v79 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  v13 = objc_alloc_init(PLBBMav16HwRfLTELogMsg);
  if (v13)
  {
    -[PLBasebandMessage agent](self, "agent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMsgRoot setAgent:](v13, "setAgent:", v14);

    -[PLBBMav16HwRfLTELogMsg setError:](v13, "setError:", CFSTR("not set"));
    -[PLBasebandMessage seqNum](self, "seqNum");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage date](self, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage timeCal](self, "timeCal");
    -[PLBBMav16HwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    if ((-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1] & 0x10) == 0
      || -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16"))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (*(_DWORD *)-[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")- (_DWORD)-[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[4]));
      -[PLBBMav16HwRfLTELogMsg setLogDuration:](v13, "setLogDuration:", v17);

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[8]);
      -[PLBBMav16HwRfLTELogMsg setDupMode:](v13, "setDupMode:", v18);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[568]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setPCCFreq:](v13, "setPCCFreq:", v19);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[569]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setPCCBw:](v13, "setPCCBw:", v20);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[570]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setSCC1Freq:](v13, "setSCC1Freq:", v21);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[572]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setSCC1Bw:](v13, "setSCC1Bw:", v22);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[571]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setSCC2Freq:](v13, "setSCC2Freq:", v23);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[573]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setSCC2Bw:](v13, "setSCC2Bw:", v24);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 12, 17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setDlTBSzCnt:](v13, "setDlTBSzCnt:", v25);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 80, 12);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setTxPwrCnt:](v13, "setTxPwrCnt:", v26);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 128, 6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setCaSCCCnt:](v13, "setCaSCCCnt:", v27);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 152, 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setUlCaSCCCnt:](v13, "setUlCaSCCCnt:", v28);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 164, 6);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setActRxTxCnt:](v13, "setActRxTxCnt:", v29);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 188, 7);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setSleepStateIdleCnt:](v13, "setSleepStateIdleCnt:", v30);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 216, 7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setSleepStateConnCnt:](v13, "setSleepStateConnCnt:", v31);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 244, 6);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setRsrpIdleCnt:](v13, "setRsrpIdleCnt:", v32);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 268, 6);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setRsrpConnCnt:](v13, "setRsrpConnCnt:", v33);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 292, 6);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setSinrIdleCnt:](v13, "setSinrIdleCnt:", v34);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 316, 6);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setSinrConnCnt:](v13, "setSinrConnCnt:", v35);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 340, 3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setNlicStateCnt:](v13, "setNlicStateCnt:", v36);

      -[PLBasebandHardwareMessage convertUint64ArrayToNSArray:ofSize:](self, "convertUint64ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 504, 8);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setBpeStats:](v13, "setBpeStats:", v37);

      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[352]);
      -[PLBBMav16HwRfLTELogMsg setArdRxDOff:](v13, "setArdRxDOff:", v38);

      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[492]);
      -[PLBBMav16HwRfLTELogMsg setUSleepPCCCnt:](v13, "setUSleepPCCCnt:", v39);

      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[496]);
      -[PLBBMav16HwRfLTELogMsg setUSleepSCC1Cnt:](v13, "setUSleepSCC1Cnt:", v40);

      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[500]);
      -[PLBBMav16HwRfLTELogMsg setUSleepSCC2Cnt:](v13, "setUSleepSCC2Cnt:", v41);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 356, 2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setHsicPCC:](v13, "setHsicPCC:", v42);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 364, 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setHsicSCC1:](v13, "setHsicSCC1:", v43);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 372, 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setHsicSCC2:](v13, "setHsicSCC2:", v44);

      v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[380]);
      -[PLBBMav16HwRfLTELogMsg setArxOffPCC:](v13, "setArxOffPCC:", v45);

      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[416]);
      -[PLBBMav16HwRfLTELogMsg setArxOffSCC1:](v13, "setArxOffSCC1:", v46);

      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[452]);
      -[PLBBMav16HwRfLTELogMsg setArxOffSCC2:](v13, "setArxOffSCC2:", v47);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 392, 3);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setArxBaselinePCC:](v13, "setArxBaselinePCC:", v48);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 428, 3);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setArxBaselineSCC1:](v13, "setArxBaselineSCC1:", v49);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 464, 3);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setArxBaselineSCC2:](v13, "setArxBaselineSCC2:", v50);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 404, 3);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setArxQicePCC:](v13, "setArxQicePCC:", v51);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 440, 3);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setArxQiceSCC1:](v13, "setArxQiceSCC1:", v52);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16") + 476, 3);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMav16HwRfLTELogMsg setArxQiceSCC2:](v13, "setArxQiceSCC2:", v53);

      -[PLBBMav16HwRfLTELogMsg logEventBackwardBBMav16HwRfLTE](v13, "logEventBackwardBBMav16HwRfLTE");
      v54 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v54, "objectForKey:", CFSTR("entry"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v54, "objectForKey:", CFSTR("entryKey"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addToGroupPLBBMavHwEntry:withEntryKey:", v55, v56);

      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_32;
      v57 = objc_opt_class();
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __53__PLBBMav16HwMsgParser_logMav16HwRFEnhLTEWithLogger___block_invoke_628;
      v74[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v74[4] = v57;
      if (qword_1ED8863D8 != -1)
        dispatch_once(&qword_1ED8863D8, v74);
      if (!byte_1ED886149)
        goto LABEL_32;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh Mav16 HW RF ENH LTE"));
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "lastPathComponent");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logMav16HwRFEnhLTEWithLogger:]");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "logMessage:fromFile:fromFunction:fromLineNumber:", v58, v61, v62, 807);

      PLLogCommon();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v79 = v58;
        _os_log_debug_impl(&dword_1CAF47000, v63, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_31:
LABEL_32:

      goto LABEL_33;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v69 = objc_opt_class();
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __53__PLBBMav16HwMsgParser_logMav16HwRFEnhLTEWithLogger___block_invoke_619;
      v75[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v75[4] = v69;
      if (qword_1ED8863D0 != -1)
        dispatch_once(&qword_1ED8863D0, v75);
      if (byte_1ED886148)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfEnhLTEMav16 is not valid, return"));
        v54 = objc_claimAutoreleasedReturnValue();
        v70 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "lastPathComponent");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logMav16HwRFEnhLTEWithLogger:]");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "logMessage:fromFile:fromFunction:fromLineNumber:", v54, v72, v73, 684);

        PLLogCommon();
        v58 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
          goto LABEL_31;
        *(_DWORD *)buf = 138412290;
        v79 = v54;
        goto LABEL_30;
      }
    }
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v64 = objc_opt_class();
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __53__PLBBMav16HwMsgParser_logMav16HwRFEnhLTEWithLogger___block_invoke_612;
    v76[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v76[4] = v64;
    if (qword_1ED8863C8 != -1)
      dispatch_once(&qword_1ED8863C8, v76);
    if (byte_1ED886147)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: mem alloc for logHwRfLTE failed"));
      v54 = objc_claimAutoreleasedReturnValue();
      v65 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "lastPathComponent");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logMav16HwRFEnhLTEWithLogger:]");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "logMessage:fromFile:fromFunction:fromLineNumber:", v54, v67, v68, 673);

      PLLogCommon();
      v58 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        goto LABEL_31;
      *(_DWORD *)buf = 138412290;
      v79 = v54;
LABEL_30:
      _os_log_debug_impl(&dword_1CAF47000, v58, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_31;
    }
  }
LABEL_33:

}

uint64_t __53__PLBBMav16HwMsgParser_logMav16HwRFEnhLTEWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886146 = result;
  return result;
}

uint64_t __53__PLBBMav16HwMsgParser_logMav16HwRFEnhLTEWithLogger___block_invoke_612(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886147 = result;
  return result;
}

uint64_t __53__PLBBMav16HwMsgParser_logMav16HwRFEnhLTEWithLogger___block_invoke_619(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886148 = result;
  return result;
}

uint64_t __53__PLBBMav16HwMsgParser_logMav16HwRFEnhLTEWithLogger___block_invoke_628(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886149 = result;
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
    block[2] = __55__PLBBMav16HwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED8863E0 != -1)
      dispatch_once(&qword_1ED8863E0, block);
    if (byte_1ED88614A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16HwMsgParser logMav16HwRFEnhWCDMAWithLogger:]");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logMav16HwRFEnhWCDMAWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 812);

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

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (*(_DWORD *)-[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16")- (_DWORD)-[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16")[4]));
    -[PLBBMavHwRfWCDMALogMsg setLogDuration:](v13, "setLogDuration:", v17);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16") + 8, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setSCEqStatCnt:](v13, "setSCEqStatCnt:", v18);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16") + 20, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setDCEqStatCnt:](v13, "setDCEqStatCnt:", v19);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16") + 32, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setSCQsetEqStatCnt:](v13, "setSCQsetEqStatCnt:", v20);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16") + 48, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setDCQsetEqStatCnt:](v13, "setDCQsetEqStatCnt:", v21);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16") + 64, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setDurInCarrierMode:](v13, "setDurInCarrierMode:", v22);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16") + 72, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setRABModeCnt:](v13, "setRABModeCnt:", v23);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16") + 88, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setRABTypeCnt:](v13, "setRABTypeCnt:", v24);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16") + 104, 16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setTxPwrBucket:](v13, "setTxPwrBucket:", v25);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16")[168]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setFetCnt:](v13, "setFetCnt:", v26);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16")[172]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setCpcRxOnCnt:](v13, "setCpcRxOnCnt:", v27);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16")[176]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setCpcRxTxOffCnt:](v13, "setCpcRxTxOffCnt:", v28);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16")[180]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfWCDMALogMsg setCpcTimeCnt:](v13, "setCpcTimeCnt:", v29);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)-[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16")[184]);
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
    v46[2] = __55__PLBBMav16HwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke_639;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v34;
    if (qword_1ED8863F0 != -1)
      dispatch_once(&qword_1ED8863F0, v46);
    if (!byte_1ED88614C)
      goto LABEL_23;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh Mav 16 BB HW RF WCDMA"));
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "lastPathComponent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logMav16HwRFEnhWCDMAWithLogger:]");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 873);

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
    v47[2] = __55__PLBBMav16HwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke_634;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v41;
    if (qword_1ED8863E8 != -1)
      dispatch_once(&qword_1ED8863E8, v47);
    if (byte_1ED88614B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: mem alloc for logHwRfWCDMA failed"));
      v31 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "lastPathComponent");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwMsgParser logMav16HwRFEnhWCDMAWithLogger:]");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v44, v45, 816);

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

uint64_t __55__PLBBMav16HwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88614A = result;
  return result;
}

uint64_t __55__PLBBMav16HwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke_634(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88614B = result;
  return result;
}

uint64_t __55__PLBBMav16HwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke_639(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88614C = result;
  return result;
}

- ($40C1CFFA044C2C5D117935F53EF88510)mav16AppsPerf
{
  return self->_mav16AppsPerf;
}

- (void)setMav16AppsPerf:(id *)a3
{
  self->_mav16AppsPerf = a3;
}

- ($B928AC1575A032845EE481A0CA20E437)rfEnhWCDMAMav16
{
  return self->_rfEnhWCDMAMav16;
}

- (void)setRfEnhWCDMAMav16:(id *)a3
{
  self->_rfEnhWCDMAMav16 = a3;
}

- ($4B086867D8BA87029A988E508826B867)rfEnhLTEMav16
{
  return self->_rfEnhLTEMav16;
}

- (void)setRfEnhLTEMav16:(id *)a3
{
  self->_rfEnhLTEMav16 = a3;
}

- ($092601FE6E8A40A76BE67D22268BABC6)mav16AppsSleepVeto
{
  return self->_mav16AppsSleepVeto;
}

- (void)setMav16AppsSleepVeto:(id *)a3
{
  self->_mav16AppsSleepVeto = a3;
}

- ($FB43E548459D050BA5797B0FF6452E7F)mav16MpssSleepVeto
{
  return self->_mav16MpssSleepVeto;
}

- (void)setMav16MpssSleepVeto:(id *)a3
{
  self->_mav16MpssSleepVeto = a3;
}

- ($DD746A1FB08B04E88D15572321826CC5)mav16QdspSpeed
{
  return self->_mav16QdspSpeed;
}

- (void)setMav16QdspSpeed:(id *)a3
{
  self->_mav16QdspSpeed = a3;
}

@end
