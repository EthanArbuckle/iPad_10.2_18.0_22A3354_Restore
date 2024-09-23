@implementation PLBBMav10HwMsgParser

- (PLBBMav10HwMsgParser)initWithData:(id)a3
{
  id v4;
  PLBBMav10HwMsgParser *v5;
  PLBBMav10HwMsgParser *v6;
  PLBBMav10HwMsgParser *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLBBMav10HwMsgParser;
  v5 = -[PLMav7BasebandHardwareMessage initWithData:](&v9, sel_initWithData_, v4);
  v6 = v5;
  if (v5 && !-[PLBBMav10HwMsgParser parseData:](v5, "parseData:", v4))
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
  unsigned __int8 *v7;
  uint64_t v8;
  _QWORD *v9;
  unsigned __int8 *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD *v17;
  unsigned __int8 *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  unsigned __int8 *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  _QWORD *v34;
  unsigned __int8 *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  _QWORD *v42;
  unsigned __int8 *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  _QWORD *v50;
  unsigned __int8 *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  _QWORD *v58;
  unsigned __int8 *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  _QWORD *v66;
  unsigned __int8 *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  uint64_t v73;
  _QWORD *v74;
  unsigned __int8 *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  uint64_t v81;
  _QWORD *v82;
  unsigned __int8 *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  uint64_t v89;
  _QWORD *v90;
  unsigned __int8 *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  uint64_t v97;
  _QWORD *v98;
  unsigned __int8 *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  unsigned __int8 *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  NSObject *v113;
  uint64_t v114;
  uint64_t v115;
  _QWORD *v116;
  unsigned __int8 *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  NSObject *v122;
  _QWORD *v123;
  unsigned __int8 *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  NSObject *v129;
  _QWORD *v130;
  unsigned __int8 *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  NSObject *v136;
  uint64_t v137;
  _QWORD *v138;
  unsigned __int8 *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  NSObject *v144;
  uint64_t v145;
  uint64_t v146;
  _QWORD *v147;
  unsigned __int8 *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  NSObject *v153;
  uint64_t v154;
  _QWORD *v155;
  unsigned __int8 *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  NSObject *v161;
  uint64_t v162;
  _QWORD *v163;
  unsigned __int8 *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  NSObject *v169;
  uint64_t v170;
  _QWORD *v171;
  unsigned __int8 *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  NSObject *v177;
  uint64_t v178;
  _QWORD *v179;
  unsigned __int8 *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  NSObject *v185;
  uint64_t v186;
  _QWORD *v187;
  unsigned __int8 *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  NSObject *v193;
  uint64_t v194;
  _QWORD *v195;
  unsigned __int8 *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  NSObject *v201;
  uint64_t v202;
  _QWORD *v203;
  unsigned __int8 *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  NSObject *v209;
  uint64_t v210;
  _QWORD *v211;
  unsigned __int8 *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  NSObject *v217;
  unsigned __int8 *v218;
  int v219;
  void *v220;
  unsigned __int8 *v221;
  int v222;
  void *v223;
  uint64_t v224;
  uint64_t v225;
  id v226;
  unint64_t v227;
  unint64_t v228;
  NSObject *v229;
  id v231;
  unsigned __int8 *v232;
  uint64_t v233;
  id v234;
  void *v235;
  _QWORD v236[5];
  _QWORD v237[5];
  _QWORD v238[5];
  _QWORD v239[5];
  _QWORD v240[5];
  _QWORD v241[5];
  _QWORD v242[5];
  _QWORD v243[5];
  _QWORD v244[5];
  _QWORD v245[5];
  _QWORD v246[5];
  _QWORD v247[5];
  _QWORD v248[5];
  _QWORD v249[5];
  _QWORD v250[5];
  _QWORD v251[5];
  _QWORD v252[5];
  _QWORD v253[5];
  _QWORD v254[5];
  _QWORD v255[5];
  _QWORD v256[5];
  _QWORD v257[5];
  _QWORD v258[5];
  _QWORD v259[5];
  _QWORD v260[5];
  _QWORD v261[5];
  uint8_t buf[4];
  unsigned __int8 *v263;
  __int16 v264;
  uint64_t v265;
  __int16 v266;
  const char *v267;
  uint64_t v268;

  v268 = *MEMORY[0x1E0C80C00];
  v234 = objc_retainAutorelease(a3);
  v4 = (unsigned __int8 *)objc_msgSend(v234, "bytes");
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
  v235 = v6;
  objc_msgSend(v6, "appendFormat:", CFSTR("Hw Rev[%0x %0x] "), v4[15], v4[16]);
  v7 = v4 + 33;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    v261[0] = MEMORY[0x1E0C809B0];
    v261[1] = 3221225472;
    v261[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke;
    v261[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v261[4] = v8;
    v9 = v261;
    if (qword_1ED8869C8 != -1)
      dispatch_once(&qword_1ED8869C8, v9);

    if (_MergedGlobals_93)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RPM starts at offset %llu"), 20);
      v10 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 70);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v263 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLMav4BasebandHardwareMessage setLogDuration:](self, "setLogDuration:", ((_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[16]- (_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[12]));
  if (-[PLMav4BasebandHardwareMessage level](self, "level"))
  {
    -[PLBBMav10HwMsgParser setRpmNew:](self, "setRpmNew:", v4 + 33);
    v7 = v4 + 57;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v16 = objc_opt_class();
      v260[0] = MEMORY[0x1E0C809B0];
      v260[1] = 3221225472;
      v260[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_257;
      v260[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v260[4] = v16;
      v17 = v260;
      if (qword_1ED8869D0 != -1)
        dispatch_once(&qword_1ED8869D0, v17);

      if (byte_1ED886981)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HW stats starts at offset %llu"), 44);
        v18 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 84);

        PLLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v263 = v18;
          _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v24 = 44;
  }
  else
  {
    v24 = 20;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 2)
  {
    -[PLBBMav10HwMsgParser setAppsNew:](self, "setAppsNew:", v7);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v25 = objc_opt_class();
      v259[0] = MEMORY[0x1E0C809B0];
      v259[1] = 3221225472;
      v259[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_262;
      v259[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v259[4] = v25;
      v26 = v259;
      if (qword_1ED8869D8 != -1)
        dispatch_once(&qword_1ED8869D8, v26);

      if (byte_1ED886982)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HW stats Sleep starts at offset %llu"), v24 + 20);
        v27 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastPathComponent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 97);

        PLLogCommon();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v263 = v27;
          _os_log_debug_impl(&dword_1CAF47000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLBBMav10HwMsgParser setApps_sleepNew:](self, "setApps_sleepNew:", v7 + 20);
    v7 += 32;
    v24 += 32;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v33 = objc_opt_class();
      v258[0] = MEMORY[0x1E0C809B0];
      v258[1] = 3221225472;
      v258[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_267;
      v258[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v258[4] = v33;
      v34 = v258;
      if (qword_1ED8869E0 != -1)
        dispatch_once(&qword_1ED8869E0, v34);

      if (byte_1ED886983)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("USB stats starts at offset %llu"), v24);
        v35 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "lastPathComponent");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 106);

        PLLogCommon();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v263 = v35;
          _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 3)
  {
    -[PLMav5BasebandHardwareMessage setUsb:](self, "setUsb:", v7);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v41 = objc_opt_class();
      v257[0] = MEMORY[0x1E0C809B0];
      v257[1] = 3221225472;
      v257[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_272;
      v257[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v257[4] = v41;
      v42 = v257;
      if (qword_1ED8869E8 != -1)
        dispatch_once(&qword_1ED8869E8, v42);

      if (byte_1ED886984)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UART stats starts at offset %llu"), v24 + 12);
        v43 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "lastPathComponent");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "logMessage:fromFile:fromFunction:fromLineNumber:", v43, v46, v47, 118);

        PLLogCommon();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v263 = v43;
          _os_log_debug_impl(&dword_1CAF47000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLMav4BasebandHardwareMessage setUart:](self, "setUart:", v7 + 12);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v49 = objc_opt_class();
      v256[0] = MEMORY[0x1E0C809B0];
      v256[1] = 3221225472;
      v256[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_277;
      v256[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v256[4] = v49;
      v50 = v256;
      if (qword_1ED8869F0 != -1)
        dispatch_once(&qword_1ED8869F0, v50);

      if (byte_1ED886985)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SPI stats starts at offset %llu"), v24 + 20);
        v51 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "lastPathComponent");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "logMessage:fromFile:fromFunction:fromLineNumber:", v51, v54, v55, 126);

        PLLogCommon();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v263 = v51;
          _os_log_debug_impl(&dword_1CAF47000, v56, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLMav4BasebandHardwareMessage setSpi:](self, "setSpi:", v7 + 20);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v57 = objc_opt_class();
      v255[0] = MEMORY[0x1E0C809B0];
      v255[1] = 3221225472;
      v255[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_282;
      v255[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v255[4] = v57;
      v58 = v255;
      if (qword_1ED8869F8 != -1)
        dispatch_once(&qword_1ED8869F8, v58);

      if (byte_1ED886986)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ABAM stats starts at offset %llu"), v24 + 28);
        v59 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "lastPathComponent");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "logMessage:fromFile:fromFunction:fromLineNumber:", v59, v62, v63, 134);

        PLLogCommon();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v263 = v59;
          _os_log_debug_impl(&dword_1CAF47000, v64, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLMav4BasebandHardwareMessage setAdm:](self, "setAdm:", v7 + 28);
    v7 += 36;
    v24 += 36;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v65 = objc_opt_class();
      v254[0] = MEMORY[0x1E0C809B0];
      v254[1] = 3221225472;
      v254[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_287;
      v254[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v254[4] = v65;
      v66 = v254;
      if (qword_1ED886A00 != -1)
        dispatch_once(&qword_1ED886A00, v66);

      if (byte_1ED886987)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LPASS stats starts at offset %llu"), v24);
        v67 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "lastPathComponent");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "logMessage:fromFile:fromFunction:fromLineNumber:", v67, v70, v71, 143);

        PLLogCommon();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v263 = v67;
          _os_log_debug_impl(&dword_1CAF47000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 4)
  {
    -[PLMav5BasebandHardwareMessage setLpass:](self, "setLpass:", v7);
    v7 += 8;
    v24 += 8;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v73 = objc_opt_class();
      v253[0] = MEMORY[0x1E0C809B0];
      v253[1] = 3221225472;
      v253[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_292;
      v253[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v253[4] = v73;
      v74 = v253;
      if (qword_1ED886A08 != -1)
        dispatch_once(&qword_1ED886A08, v74);

      if (byte_1ED886988)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Apps Sleep veto stats starts at offset %llu"), v24);
        v75 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v76 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "lastPathComponent");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "logMessage:fromFile:fromFunction:fromLineNumber:", v75, v78, v79, 155);

        PLLogCommon();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v263 = v75;
          _os_log_debug_impl(&dword_1CAF47000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 5)
  {
    -[PLMav5BasebandHardwareMessage setApps_sleep_veto:](self, "setApps_sleep_veto:", v7);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v81 = objc_opt_class();
      v252[0] = MEMORY[0x1E0C809B0];
      v252[1] = 3221225472;
      v252[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_297;
      v252[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v252[4] = v81;
      v82 = v252;
      if (qword_1ED886A10 != -1)
        dispatch_once(&qword_1ED886A10, v82);

      if (byte_1ED886989)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MPSS Sleep veto stats starts at offset %llu"), v24 + 4);
        v83 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v84 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "lastPathComponent");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "logMessage:fromFile:fromFunction:fromLineNumber:", v83, v86, v87, 169);

        PLLogCommon();
        v88 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v263 = v83;
          _os_log_debug_impl(&dword_1CAF47000, v88, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLMav5BasebandHardwareMessage setMpss_sleep_veto:](self, "setMpss_sleep_veto:", v7 + 4);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v89 = objc_opt_class();
      v251[0] = MEMORY[0x1E0C809B0];
      v251[1] = 3221225472;
      v251[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_302;
      v251[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v251[4] = v89;
      v90 = v251;
      if (qword_1ED886A18 != -1)
        dispatch_once(&qword_1ED886A18, v90);

      if (byte_1ED88698A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("QDSP Sleep veto stats starts at offset %llu"), v24 + 16);
        v91 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v92 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "lastPathComponent");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "logMessage:fromFile:fromFunction:fromLineNumber:", v91, v94, v95, 177);

        PLLogCommon();
        v96 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v263 = v91;
          _os_log_debug_impl(&dword_1CAF47000, v96, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLBBMav10HwMsgParser setQdspNew:](self, "setQdspNew:", v7 + 16);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v97 = objc_opt_class();
      v250[0] = MEMORY[0x1E0C809B0];
      v250[1] = 3221225472;
      v250[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_307;
      v250[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v250[4] = v97;
      v98 = v250;
      if (qword_1ED886A20 != -1)
        dispatch_once(&qword_1ED886A20, v98);

      if (byte_1ED88698B)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GPS Sleep veto stats starts at offset %llu"), v24 + 52);
        v99 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v100 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "lastPathComponent");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "logMessage:fromFile:fromFunction:fromLineNumber:", v99, v102, v103, 191);

        PLLogCommon();
        v104 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v263 = v99;
          _os_log_debug_impl(&dword_1CAF47000, v104, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLMav4BasebandHardwareMessage setGps:](self, "setGps:", v7 + 52);
    v105 = v24 + 60;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v106 = objc_opt_class();
      v249[0] = MEMORY[0x1E0C809B0];
      v249[1] = 3221225472;
      v249[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_312;
      v249[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v249[4] = v106;
      v107 = v249;
      if (qword_1ED886A28 != -1)
        dispatch_once(&qword_1ED886A28, v107);

      if (byte_1ED88698C)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GPS DPO stats starts at offset %llu"), v24 + 60);
        v108 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v109 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "lastPathComponent");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "logMessage:fromFile:fromFunction:fromLineNumber:", v108, v111, v112, 199);

        PLLogCommon();
        v113 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v263 = v108;
          _os_log_debug_impl(&dword_1CAF47000, v113, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLMav5BasebandHardwareMessage setGps_dpo:](self, "setGps_dpo:", v7 + 60);
    v114 = objc_opt_class();
    v115 = MEMORY[0x1E0C809B0];
    v248[0] = MEMORY[0x1E0C809B0];
    v248[1] = 3221225472;
    v248[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_317;
    v248[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v248[4] = v114;
    v116 = v248;
    if (qword_1ED886A30 != -1)
      dispatch_once(&qword_1ED886A30, v116);

    if (byte_1ED88698D)
    {
      v105 = v24 + 68;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GPS DPO bin stats starts at offset %llu"), v24 + 68);
      v117 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v118 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "lastPathComponent");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "logMessage:fromFile:fromFunction:fromLineNumber:", v117, v120, v121, 209);

      PLLogCommon();
      v122 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v263 = v117;
        _os_log_debug_impl(&dword_1CAF47000, v122, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v115 = MEMORY[0x1E0C809B0];
    }
    -[PLMav7BasebandHardwareMessage setGps_dpo_bins:](self, "setGps_dpo_bins:", v7 + 68);
    v247[0] = v115;
    v247[1] = 3221225472;
    v247[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_322;
    v247[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v247[4] = objc_opt_class();
    v123 = v247;
    if (qword_1ED886A38 != -1)
      dispatch_once(&qword_1ED886A38, v123);

    if (byte_1ED88698E)
    {
      v105 += 24;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MPSS sleep stats starts at offset %llu"), v105);
      v124 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v125 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "lastPathComponent");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "logMessage:fromFile:fromFunction:fromLineNumber:", v124, v127, v128, 220);

      PLLogCommon();
      v129 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v263 = v124;
        _os_log_debug_impl(&dword_1CAF47000, v129, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v115 = MEMORY[0x1E0C809B0];
    }
    -[PLBBMav10HwMsgParser setMpss_sleepNew:](self, "setMpss_sleepNew:", v7 + 92);
    v7 += 104;
    v246[0] = v115;
    v246[1] = 3221225472;
    v246[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_327;
    v246[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v246[4] = objc_opt_class();
    v130 = v246;
    if (qword_1ED886A40 != -1)
      dispatch_once(&qword_1ED886A40, v130);

    if (byte_1ED88698F)
    {
      v24 = v105 + 12;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hw RF tech stats starts at offset %llu"), v105 + 12);
      v131 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v132 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "lastPathComponent");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "logMessage:fromFile:fromFunction:fromLineNumber:", v131, v134, v135, 232);

      PLLogCommon();
      v136 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v263 = v131;
        _os_log_debug_impl(&dword_1CAF47000, v136, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
    else
    {
      v24 = v105;
    }
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 6)
  {
    -[PLMav7BasebandHardwareMessage setRf:](self, "setRf:", v7);
    v137 = objc_opt_class();
    v245[0] = MEMORY[0x1E0C809B0];
    v245[1] = 3221225472;
    v245[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_332;
    v245[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v245[4] = v137;
    v138 = v245;
    if (qword_1ED886A48 != -1)
      dispatch_once(&qword_1ED886A48, v138);

    if (byte_1ED886990)
    {
      v24 += 1536;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hw protocol starts at offset %llu"), v24);
      v139 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v140 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "lastPathComponent");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "logMessage:fromFile:fromFunction:fromLineNumber:", v139, v142, v143, 247);

      PLLogCommon();
      v144 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v144, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v263 = v139;
        _os_log_debug_impl(&dword_1CAF47000, v144, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
    -[PLMav7BasebandHardwareMessage setProtocol:](self, "setProtocol:", v7 + 1536);
    v145 = v24 + 408;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v146 = objc_opt_class();
      v244[0] = MEMORY[0x1E0C809B0];
      v244[1] = 3221225472;
      v244[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_337;
      v244[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v244[4] = v146;
      v147 = v244;
      if (qword_1ED886A50 != -1)
        dispatch_once(&qword_1ED886A50, v147);

      if (byte_1ED886991)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("New LTE stats starts at offset %llu"), v24 + 408);
        v148 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v149 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "lastPathComponent");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "logMessage:fromFile:fromFunction:fromLineNumber:", v148, v151, v152, 256);

        PLLogCommon();
        v153 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v153, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v263 = v148;
          _os_log_debug_impl(&dword_1CAF47000, v153, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLBBMav10HwMsgParser setRfLTE:](self, "setRfLTE:", v7 + 1944);
    v154 = objc_opt_class();
    v243[0] = MEMORY[0x1E0C809B0];
    v243[1] = 3221225472;
    v243[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_342;
    v243[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v243[4] = v154;
    v155 = v243;
    if (qword_1ED886A58 != -1)
      dispatch_once(&qword_1ED886A58, v155);

    if (byte_1ED886992)
    {
      v145 = v24 + 668;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WCDMA new stats starts at offset %llu"), v24 + 668);
      v156 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v157 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "lastPathComponent");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "logMessage:fromFile:fromFunction:fromLineNumber:", v156, v159, v160, 271);

      PLLogCommon();
      v161 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v161, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v263 = v156;
        _os_log_debug_impl(&dword_1CAF47000, v161, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
    -[PLBBMav10HwMsgParser setRfWCDMA:](self, "setRfWCDMA:", v7 + 2204);
    v162 = objc_opt_class();
    v242[0] = MEMORY[0x1E0C809B0];
    v242[1] = 3221225472;
    v242[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_347;
    v242[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v242[4] = v162;
    v163 = v242;
    if (qword_1ED886A60 != -1)
      dispatch_once(&qword_1ED886A60, v163);

    if (byte_1ED886993)
    {
      v145 += 176;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GSM new stats starts at offset %llu"), v145);
      v164 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v165 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "lastPathComponent");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "logMessage:fromFile:fromFunction:fromLineNumber:", v164, v167, v168, 282);

      PLLogCommon();
      v169 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v169, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v263 = v164;
        _os_log_debug_impl(&dword_1CAF47000, v169, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
    -[PLBBMav10HwMsgParser setRfGSM:](self, "setRfGSM:", v7 + 2380);
    v170 = objc_opt_class();
    v241[0] = MEMORY[0x1E0C809B0];
    v241[1] = 3221225472;
    v241[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_352;
    v241[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v241[4] = v170;
    v171 = v241;
    if (qword_1ED886A68 != -1)
      dispatch_once(&qword_1ED886A68, v171);

    if (byte_1ED886994)
    {
      v145 += 20;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TDS stats starts at offset %llu"), v145);
      v172 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v173 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "lastPathComponent");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "logMessage:fromFile:fromFunction:fromLineNumber:", v172, v175, v176, 293);

      PLLogCommon();
      v177 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v177, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v263 = v172;
        _os_log_debug_impl(&dword_1CAF47000, v177, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
    -[PLBBMav10HwMsgParser setRfTDS:](self, "setRfTDS:", v7 + 2400);
    v178 = objc_opt_class();
    v240[0] = MEMORY[0x1E0C809B0];
    v240[1] = 3221225472;
    v240[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_357;
    v240[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v240[4] = v178;
    v179 = v240;
    if (qword_1ED886A70 != -1)
      dispatch_once(&qword_1ED886A70, v179);

    if (byte_1ED886995)
    {
      v145 += 48;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("1x stats starts at offset %llu"), v145);
      v180 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v181 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "lastPathComponent");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "logMessage:fromFile:fromFunction:fromLineNumber:", v180, v183, v184, 304);

      PLLogCommon();
      v185 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v185, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v263 = v180;
        _os_log_debug_impl(&dword_1CAF47000, v185, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
    -[PLBBMav10HwMsgParser setRf1x:](self, "setRf1x:", v7 + 2448);
    v186 = objc_opt_class();
    v239[0] = MEMORY[0x1E0C809B0];
    v239[1] = 3221225472;
    v239[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_362;
    v239[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v239[4] = v186;
    v187 = v239;
    if (qword_1ED886A78 != -1)
      dispatch_once(&qword_1ED886A78, v187);

    if (byte_1ED886996)
    {
      v145 += 40;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HDR stats starts at offset %llu"), v145);
      v188 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v189 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "lastPathComponent");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "logMessage:fromFile:fromFunction:fromLineNumber:", v188, v191, v192, 315);

      PLLogCommon();
      v193 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v193, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v263 = v188;
        _os_log_debug_impl(&dword_1CAF47000, v193, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
    -[PLBBMav10HwMsgParser setRfHDR:](self, "setRfHDR:", v7 + 2488);
    v194 = objc_opt_class();
    v238[0] = MEMORY[0x1E0C809B0];
    v238[1] = 3221225472;
    v238[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_367;
    v238[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v238[4] = v194;
    v195 = v238;
    if (qword_1ED886A80 != -1)
      dispatch_once(&qword_1ED886A80, v195);

    if (byte_1ED886997)
    {
      v145 += 32;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OOS stats starts at offset %llu"), v145);
      v196 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v197 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "lastPathComponent");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v197, "logMessage:fromFile:fromFunction:fromLineNumber:", v196, v199, v200, 326);

      PLLogCommon();
      v201 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v201, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v263 = v196;
        _os_log_debug_impl(&dword_1CAF47000, v201, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
    -[PLBBMav10HwMsgParser setRfOOS:](self, "setRfOOS:", v7 + 2520);
    v202 = objc_opt_class();
    v237[0] = MEMORY[0x1E0C809B0];
    v237[1] = 3221225472;
    v237[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_372;
    v237[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v237[4] = v202;
    v203 = v237;
    if (qword_1ED886A88 != -1)
      dispatch_once(&qword_1ED886A88, v203);

    if (byte_1ED886998)
    {
      v145 += 155;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MCPM stats starts at offset %llu"), v145);
      v204 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v205 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "lastPathComponent");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "logMessage:fromFile:fromFunction:fromLineNumber:", v204, v207, v208, 337);

      PLLogCommon();
      v209 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v209, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v263 = v204;
        _os_log_debug_impl(&dword_1CAF47000, v209, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
    -[PLBBMav10HwMsgParser setMcpm_sleep_vetoNew:](self, "setMcpm_sleep_vetoNew:", v7 + 2675);
    v210 = objc_opt_class();
    v236[0] = MEMORY[0x1E0C809B0];
    v236[1] = 3221225472;
    v236[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_377;
    v236[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v236[4] = v210;
    v211 = v236;
    if (qword_1ED886A90 != -1)
      dispatch_once(&qword_1ED886A90, v211);

    if (byte_1ED886999)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NPA stats starts at offset %llu"), v145 + 48);
      v212 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v213 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v214, "lastPathComponent");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser parseData:]");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v213, "logMessage:fromFile:fromFunction:fromLineNumber:", v212, v215, v216, 348);

      PLLogCommon();
      v217 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v217, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v263 = v212;
        _os_log_debug_impl(&dword_1CAF47000, v217, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
    -[PLMav7BasebandHardwareMessage setNpa_sleep_veto:](self, "setNpa_sleep_veto:", v7 + 2723);
    v7 += 2823;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 7)
  {
    -[PLMav7BasebandHardwareMessage setApps_clock_duration_mask:](self, "setApps_clock_duration_mask:", v7);
    v218 = v7 + 16;
    v219 = -[PLBBMav10HwMsgParser GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage apps_clock_duration_mask](self, "apps_clock_duration_mask"));
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMav7BasebandHardwareMessage setApps_clock_duration:](self, "setApps_clock_duration:", v220);

    -[PLBBMav10HwMsgParser SetClocks:oftype:withData:](self, "SetClocks:oftype:withData:", -[PLMav7BasebandHardwareMessage apps_clock_duration_mask](self, "apps_clock_duration_mask"), 0, v218);
    v221 = &v218[4 * v219];
    -[PLMav7BasebandHardwareMessage setMpss_clock_duration_mask:](self, "setMpss_clock_duration_mask:", v221);
    v221 += 16;
    v222 = -[PLBBMav10HwMsgParser GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage mpss_clock_duration_mask](self, "mpss_clock_duration_mask"));
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMav7BasebandHardwareMessage setMpss_clock_duration:](self, "setMpss_clock_duration:", v223);

    -[PLBBMav10HwMsgParser SetClocks:oftype:withData:](self, "SetClocks:oftype:withData:", -[PLMav7BasebandHardwareMessage mpss_clock_duration_mask](self, "mpss_clock_duration_mask"), 1, v221);
    v7 = &v221[4 * v222];
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 8)
  {
    -[PLMav7BasebandHardwareMessage setApps_clock_count_mask:](self, "setApps_clock_count_mask:", v7);
    v224 = (uint64_t)&v7[4
                      * -[PLBBMav10HwMsgParser GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage apps_clock_count_mask](self, "apps_clock_count_mask"))+ 16];
    -[PLMav7BasebandHardwareMessage setMpss_clock_count_mask:](self, "setMpss_clock_count_mask:", v224);
    v225 = v224
         + 4
         * -[PLBBMav10HwMsgParser GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage mpss_clock_count_mask](self, "mpss_clock_count_mask"));
    -[PLMav7BasebandHardwareMessage setHsic:](self, "setHsic:", v225 + 16);
    v7 = (unsigned __int8 *)(v225 + 48);
  }
  v226 = objc_retainAutorelease(v234);
  v227 = (unint64_t)&v7[-objc_msgSend(v226, "bytes")];
  v228 = objc_msgSend(v226, "length");
  if (v227 > v228)
  {
    PLLogCommon();
    v229 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v229, OS_LOG_TYPE_ERROR))
    {
      v231 = objc_retainAutorelease(v226);
      v232 = &v7[-objc_msgSend(v231, "bytes")];
      v233 = objc_msgSend(v231, "length");
      *(_DWORD *)buf = 134218498;
      v263 = v232;
      v264 = 2048;
      v265 = v233;
      v266 = 2080;
      v267 = "-[PLBBMav10HwMsgParser parseData:]";
      _os_log_error_impl(&dword_1CAF47000, v229, OS_LOG_TYPE_ERROR, "Expected data length %lu but recieved %lu in %s", buf, 0x20u);
    }

  }
  return v227 <= v228;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_93 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_257(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886981 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_262(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886982 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_267(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886983 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_272(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886984 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_277(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886985 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_282(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886986 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_287(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886987 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_292(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886988 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_297(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886989 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_302(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88698A = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_307(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88698B = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_312(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88698C = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_317(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88698D = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_322(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88698E = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_327(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88698F = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_332(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886990 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_337(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886991 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_342(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886992 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_347(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886993 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_352(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886994 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_357(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886995 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_362(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886996 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_367(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886997 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_372(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886998 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_377(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886999 = result;
  return result;
}

- (void)logWithLogger:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  PLBBMavLogMsg *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  objc_super v25;
  _QWORD block[5];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__PLBBMav10HwMsgParser_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED886A98 != -1)
      dispatch_once(&qword_1ED886A98, block);
    if (byte_1ED88699A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav10HwMsgParser logWithLogger:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 402);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v25.receiver = self;
  v25.super_class = (Class)PLBBMav10HwMsgParser;
  -[PLBasebandHardwareMessage logRawWithLogger:](&v25, sel_logRawWithLogger_, v4);
  v12 = objc_alloc_init(PLBBMavLogMsg);
  -[PLBasebandMessage agent](self, "agent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage setAgent:](v12, "setAgent:", v13);

  -[PLBBMavLogMsg setError:](v12, "setError:", &stru_1E8587D00);
  -[PLBasebandMessage seqNum](self, "seqNum");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage date](self, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage timeCal](self, "timeCal");
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v12, "setHeaderWithSeqNum:andDate:andTimeCal:", v14, v15);

  if (-[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev") == 6)
  {
    -[PLMav4BasebandHardwareMessage logHeaderWithLogger:](self, "logHeaderWithLogger:", v12);
    -[PLBBMav10HwMsgParser logRPMWithLogger:](self, "logRPMWithLogger:", v12);
    -[PLBBMav10HwMsgParser logAPPSWithLogger:](self, "logAPPSWithLogger:", v12);
    -[PLBBMav10HwMsgParser logMPSSWithLogger:](self, "logMPSSWithLogger:", v12);
    -[PLMav5BasebandHardwareMessage logLPASSWithLogger:](self, "logLPASSWithLogger:", v12);
    -[PLMav7BasebandHardwareMessage logPeripheralsWithLogger:](self, "logPeripheralsWithLogger:", v12);
    -[PLMav5BasebandHardwareMessage logProtocolWithLogger:withCount:](self, "logProtocolWithLogger:withCount:", v12, 6);
    -[PLMav7BasebandHardwareMessage logProtocolActiveWithLogger:](self, "logProtocolActiveWithLogger:", v12);
    -[PLBBMav10HwMsgParser logSleepVetoWithLogger:](self, "logSleepVetoWithLogger:", v12);
    if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 7)
    {
      -[PLMav7BasebandHardwareMessage logClockWithLogger:](self, "logClockWithLogger:", v12);
      -[PLMav7BasebandHardwareMessage logHSICWithLogger:](self, "logHSICWithLogger:", v12);
    }
    -[PLBBMavLogMsg addToGroupPLBBMav10HwOther](v12, "addToGroupPLBBMav10HwOther");
    -[PLMav7BasebandHardwareMessage logRFWithLogger2:](self, "logRFWithLogger2:", v12);
    -[PLBBMav10HwMsgParser logHwRFLTEWithLogger:](self, "logHwRFLTEWithLogger:", v12);
    -[PLBBMav10HwMsgParser logHwRFWCDMAWithLogger:](self, "logHwRFWCDMAWithLogger:", v12);
    -[PLBBMav10HwMsgParser logHwRFGSMWithLogger:](self, "logHwRFGSMWithLogger:", v12);
    -[PLBBMav10HwMsgParser logHwRFTDSWithLogger:](self, "logHwRFTDSWithLogger:", v12);
    -[PLBBMav10HwMsgParser logHwRF1xWithLogger:](self, "logHwRF1xWithLogger:", v12);
    -[PLBBMav10HwMsgParser logHwRFHDRWithLogger:](self, "logHwRFHDRWithLogger:", v12);
    -[PLBBMav10HwMsgParser logHwRFOOSWithLogger:](self, "logHwRFOOSWithLogger:", v12);
    -[PLBBMavLogMsg logEventBackwardGrpEntriesBBMav10Hw](v12, "logEventBackwardGrpEntriesBBMav10Hw");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendFormat:", CFSTR("Version Mismatch: Baseband_sw_rev=%d Powerlog_supported_sw_rev=%d"), -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"), 6);
    -[PLBBMavLogMsg setError:](v12, "setError:", v16);
    -[PLBBMavLogMsg setType:](v12, "setType:", CFSTR("BB HW Error"));
    -[PLBBMavLogMsg logEventBackwardMavBBHwOther](v12, "logEventBackwardMavBBHwOther");
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v17 = objc_opt_class();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __38__PLBBMav10HwMsgParser_logWithLogger___block_invoke_393;
      v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v24[4] = v17;
      if (qword_1ED886AA0 != -1)
        dispatch_once(&qword_1ED886AA0, v24);
      if (byte_1ED88699B)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SW version mismatch, cannot process, returning"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logWithLogger:]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 420);

        PLLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v18;
          _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }

  }
}

uint64_t __38__PLBBMav10HwMsgParser_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88699A = result;
  return result;
}

uint64_t __38__PLBBMav10HwMsgParser_logWithLogger___block_invoke_393(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88699B = result;
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
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLBBMav10HwMsgParser_logSleepVetoWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED886AA8 != -1)
      dispatch_once(&qword_1ED886AA8, block);
    if (byte_1ED88699C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav10HwMsgParser logSleepVetoWithLogger:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logSleepVetoWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 468);

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
  if (!-[PLBBMav10HwMsgParser mcpm_sleep_vetoNew](self, "mcpm_sleep_vetoNew"))
  {
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_29;
    v23 = objc_opt_class();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __47__PLBBMav10HwMsgParser_logSleepVetoWithLogger___block_invoke_398;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v23;
    if (qword_1ED886AB0 != -1)
      dispatch_once(&qword_1ED886AB0, v37);
    if (!byte_1ED88699D)
      goto LABEL_29;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BB HW Sleep Veto is expected but not present"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lastPathComponent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logSleepVetoWithLogger:]");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 477);

    PLLogCommon();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      goto LABEL_28;
    *(_DWORD *)buf = 138412290;
    v40 = v24;
    goto LABEL_32;
  }
  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser mcpm_sleep_vetoNew](self, "mcpm_sleep_vetoNew"), 12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMcpmVetoNumHistogram:", v13);

  if (!-[PLMav7BasebandHardwareMessage npa_sleep_veto](self, "npa_sleep_veto"))
  {
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_29;
    v30 = objc_opt_class();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __47__PLBBMav10HwMsgParser_logSleepVetoWithLogger___block_invoke_406;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = v30;
    if (qword_1ED886AB8 != -1)
      dispatch_once(&qword_1ED886AB8, v36);
    if (!byte_1ED88699E)
      goto LABEL_29;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BB HW Sleep Veto is expected but not present"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lastPathComponent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logSleepVetoWithLogger:]");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v33, v34, 490);

    PLLogCommon();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
LABEL_28:

LABEL_29:
      objc_msgSend(v12, "appendToError:", CFSTR("Error: BB HW Sleep Veto is expected but not present. "));
      goto LABEL_30;
    }
    *(_DWORD *)buf = 138412290;
    v40 = v24;
LABEL_32:
    _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    goto LABEL_28;
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
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __47__PLBBMav10HwMsgParser_logSleepVetoWithLogger___block_invoke_409;
    v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v35[4] = v16;
    if (qword_1ED886AC0 != -1)
      dispatch_once(&qword_1ED886AC0, v35);
    if (byte_1ED88699F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW Sleep Veto"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logSleepVetoWithLogger:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 495);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v17;
        _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
LABEL_30:

}

uint64_t __47__PLBBMav10HwMsgParser_logSleepVetoWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88699C = result;
  return result;
}

uint64_t __47__PLBBMav10HwMsgParser_logSleepVetoWithLogger___block_invoke_398(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88699D = result;
  return result;
}

uint64_t __47__PLBBMav10HwMsgParser_logSleepVetoWithLogger___block_invoke_406(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88699E = result;
  return result;
}

uint64_t __47__PLBBMav10HwMsgParser_logSleepVetoWithLogger___block_invoke_409(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88699F = result;
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
    block[2] = __41__PLBBMav10HwMsgParser_logRPMWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED886AC8 != -1)
      dispatch_once(&qword_1ED886AC8, block);
    if (byte_1ED8869A0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav10HwMsgParser logRPMWithLogger:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logRPMWithLogger:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 502);

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
  if (-[PLBBMav10HwMsgParser rpmNew](self, "rpmNew"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)-[PLBBMav10HwMsgParser rpmNew](self, "rpmNew")[8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRpmXOShutDuration:", v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)-[PLBBMav10HwMsgParser rpmNew](self, "rpmNew"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRpmXOShutCnt:", v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)-[PLBBMav10HwMsgParser rpmNew](self, "rpmNew")[16]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRpmVDDMinDuration:", v16);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rpmNew](self, "rpmNew")[4]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRpmVDDMinEnterCnt:", v17);

  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v31[0] = v6;
      v31[1] = 3221225472;
      v31[2] = __41__PLBBMav10HwMsgParser_logRPMWithLogger___block_invoke_414;
      v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v31[4] = objc_opt_class();
      if (qword_1ED886AD0 != -1)
        dispatch_once(&qword_1ED886AD0, v31);
      if (byte_1ED8869A1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RPM=<unknown>"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logRPMWithLogger:]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 533);

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
    v30[2] = __41__PLBBMav10HwMsgParser_logRPMWithLogger___block_invoke_421;
    v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v30[4] = objc_opt_class();
    if (qword_1ED886AD8 != -1)
      dispatch_once(&qword_1ED886AD8, v30);
    if (byte_1ED8869A2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW RPM"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logRPMWithLogger:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 537);

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

uint64_t __41__PLBBMav10HwMsgParser_logRPMWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869A0 = result;
  return result;
}

uint64_t __41__PLBBMav10HwMsgParser_logRPMWithLogger___block_invoke_414(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869A1 = result;
  return result;
}

uint64_t __41__PLBBMav10HwMsgParser_logRPMWithLogger___block_invoke_421(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869A2 = result;
  return result;
}

- (void)logAPPSWithLogger:(id)a3
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
    block[2] = __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED886AE0 != -1)
      dispatch_once(&qword_1ED886AE0, block);
    if (byte_1ED8869A3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav10HwMsgParser logAPPSWithLogger:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logAPPSWithLogger:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 543);

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
  if (-[PLBBMav10HwMsgParser appsNew](self, "appsNew"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser appsNew](self, "appsNew"), 5);
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
    v48[2] = __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke_428;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = objc_opt_class();
    if (qword_1ED886AE8 != -1)
      dispatch_once(&qword_1ED886AE8, v48);
    if (byte_1ED8869A4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Perf_Level=<unknown>"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logAPPSWithLogger:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 561);

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
  if (-[PLBBMav10HwMsgParser apps_sleepNew](self, "apps_sleepNew"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)-[PLBBMav10HwMsgParser apps_sleepNew](self, "apps_sleepNew")[4]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCxoShutDownDuration:", v21);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)-[PLBBMav10HwMsgParser apps_sleepNew](self, "apps_sleepNew"));
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
      v47[2] = __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke_433;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v23;
      if (qword_1ED886AF0 != -1)
        dispatch_once(&qword_1ED886AF0, v47);
      if (byte_1ED8869A5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Stats=<unknown>"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logAPPSWithLogger:]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 580);

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
  if (-[PLMav5BasebandHardwareMessage apps_sleep_veto](self, "apps_sleep_veto"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage apps_sleep_veto](self, "apps_sleep_veto"), 1);
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
      v46[2] = __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke_440;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v31;
      if (qword_1ED886AF8 != -1)
        dispatch_once(&qword_1ED886AF8, v46);
      if (byte_1ED8869A6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Veto_Duration=<unknown>"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "lastPathComponent");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logAPPSWithLogger:]");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 600);

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
    v45[2] = __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke_447;
    v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v45[4] = v38;
    if (qword_1ED886B00 != -1)
      dispatch_once(&qword_1ED886B00, v45);
    if (byte_1ED8869A7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW APPS"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "lastPathComponent");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logAPPSWithLogger:]");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v42, v43, 604);

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

uint64_t __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869A3 = result;
  return result;
}

uint64_t __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke_428(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869A4 = result;
  return result;
}

uint64_t __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke_433(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869A5 = result;
  return result;
}

uint64_t __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke_440(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869A6 = result;
  return result;
}

uint64_t __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke_447(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869A7 = result;
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
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  v7 = &word_1CB388000;
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED886B08 != -1)
      dispatch_once(&qword_1ED886B08, block);
    if (byte_1ED8869A8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav10HwMsgParser logMPSSWithLogger:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logMPSSWithLogger:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 611);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v6 = MEMORY[0x1E0C809B0];
      v7 = &word_1CB388000;
    }
  }
  v14 = v4;
  if (-[PLBBMav10HwMsgParser mpss_sleepNew](self, "mpss_sleepNew"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)-[PLBBMav10HwMsgParser mpss_sleepNew](self, "mpss_sleepNew")[4]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMpssCxoShutDownDuration:", v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)-[PLBBMav10HwMsgParser mpss_sleepNew](self, "mpss_sleepNew"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMpssCxoShutDownCount:", v16);

  }
  if (-[PLMav5BasebandHardwareMessage mpss_sleep_veto](self, "mpss_sleep_veto"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage mpss_sleep_veto](self, "mpss_sleep_veto"), 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMpssSleepVeto:", v17);
LABEL_12:

    goto LABEL_20;
  }
  objc_msgSend(v14, "appendToError:", CFSTR("Sleep_Veto=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v47[0] = v6;
    v47[1] = 3221225472;
    v47[2] = __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke_454;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = objc_opt_class();
    if (qword_1ED886B10 != -1)
      dispatch_once(&qword_1ED886B10, v47);
    if (byte_1ED8869A9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Veto=<unknown>"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logMPSSWithLogger:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 644);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v17;
        _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v7 = &word_1CB388000;
      goto LABEL_12;
    }
  }
LABEL_20:
  if (-[PLBBMav10HwMsgParser qdspNew](self, "qdspNew"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser qdspNew](self, "qdspNew"), 9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setQdspConfigCount:", v23);
LABEL_22:

    goto LABEL_30;
  }
  objc_msgSend(v14, "appendToError:", CFSTR("Q6SW_Perf=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v24 = objc_opt_class();
    v46[0] = v6;
    v46[1] = *((_QWORD *)v7 + 166);
    v46[2] = __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke_461;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v24;
    if (qword_1ED886B18 != -1)
      dispatch_once(&qword_1ED886B18, v46);
    if (byte_1ED8869AA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Q6SW_Perf=<unknown>"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logMPSSWithLogger:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v27, v28, 657);

      PLLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v23;
        _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v7 = &word_1CB388000;
      goto LABEL_22;
    }
  }
LABEL_30:
  if (-[PLMav4BasebandHardwareMessage adm](self, "adm"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage adm](self, "adm"), 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAdmOnOffState:", v30);
LABEL_32:

    goto LABEL_40;
  }
  objc_msgSend(v14, "appendToError:", CFSTR("ADM=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v31 = objc_opt_class();
    v45[0] = v6;
    v45[1] = *((_QWORD *)v7 + 166);
    v45[2] = __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke_468;
    v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v45[4] = v31;
    if (qword_1ED886B20 != -1)
      dispatch_once(&qword_1ED886B20, v45);
    if (byte_1ED8869AB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ADM=<unknown>"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "lastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logMPSSWithLogger:]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v34, v35, 669);

      PLLogCommon();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v30;
        _os_log_debug_impl(&dword_1CAF47000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_32;
    }
  }
LABEL_40:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v37 = objc_opt_class();
    v44[0] = v6;
    v44[1] = *((_QWORD *)v7 + 166);
    v44[2] = __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke_473;
    v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v44[4] = v37;
    if (qword_1ED886B28 != -1)
      dispatch_once(&qword_1ED886B28, v44);
    if (byte_1ED8869AC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW MPSS"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "lastPathComponent");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logMPSSWithLogger:]");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v38, v41, v42, 673);

      PLLogCommon();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v38;
        _os_log_debug_impl(&dword_1CAF47000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869A8 = result;
  return result;
}

uint64_t __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke_454(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869A9 = result;
  return result;
}

uint64_t __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke_461(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869AA = result;
  return result;
}

uint64_t __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke_468(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869AB = result;
  return result;
}

uint64_t __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke_473(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869AC = result;
  return result;
}

- (void)logHwRFLTEWithLogger:(id)a3
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
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav10HwMsgParser_logHwRFLTEWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED886B30 != -1)
      dispatch_once(&qword_1ED886B30, block);
    if (byte_1ED8869AD)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav10HwMsgParser logHwRFLTEWithLogger:]");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFLTEWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 678);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v6;
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

    if (-[PLBBMav10HwMsgParser rfLTE](self, "rfLTE"))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (*(_DWORD *)-[PLBBMav10HwMsgParser rfLTE](self, "rfLTE")- (_DWORD)-[PLBBMav10HwMsgParser rfLTE](self, "rfLTE")[4]));
      -[PLBBMavHwRfLTELogMsg setLogDuration:](v13, "setLogDuration:", v17);

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", -[PLBBMav10HwMsgParser rfLTE](self, "rfLTE")[12]);
      -[PLBBMavHwRfLTELogMsg setDupMode:](v13, "setDupMode:", v18);

      -[PLBasebandHardwareMessage convertUint8ArrayToNSArray:ofSize:](self, "convertUint8ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfLTE](self, "rfLTE") + 16, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setCaFreqInfo:](v13, "setCaFreqInfo:", v19);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfLTE](self, "rfLTE") + 20, 16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setDlC0TBSzCnt:](v13, "setDlC0TBSzCnt:", v20);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfLTE](self, "rfLTE") + 84, 16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setDlC1TBSzCnt:](v13, "setDlC1TBSzCnt:", v21);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfLTE](self, "rfLTE") + 148, 12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setTxPwrCnt:](v13, "setTxPwrCnt:", v22);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfLTE](self, "rfLTE") + 196, 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setCaSCCCnt:](v13, "setCaSCCCnt:", v23);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfLTE](self, "rfLTE") + 212, 6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setActRxTxCnt:](v13, "setActRxTxCnt:", v24);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfLTE](self, "rfLTE") + 236, 6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfLTELogMsg setSleepStateCnt:](v13, "setSleepStateCnt:", v25);

      -[PLBBMavHwRfLTELogMsg logEventBackwardBBMav10HwRfLTE](v13, "logEventBackwardBBMav10HwRfLTE");
      v26 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v26, "objectForKey:", CFSTR("entry"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v26, "objectForKey:", CFSTR("entryKey"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addToGroupPLBBMavHwEntry:withEntryKey:", v27, v28);

      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_29;
      v29 = objc_opt_class();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __45__PLBBMav10HwMsgParser_logHwRFLTEWithLogger___block_invoke_495;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v29;
      if (qword_1ED886B48 != -1)
        dispatch_once(&qword_1ED886B48, v46);
      if (!byte_1ED8869B0)
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh Mav HW RF LTE"));
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "lastPathComponent");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFLTEWithLogger:]");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 740);

      PLLogCommon();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v30;
        _os_log_debug_impl(&dword_1CAF47000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_28:
LABEL_29:

      goto LABEL_30;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v41 = objc_opt_class();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __45__PLBBMav10HwMsgParser_logHwRFLTEWithLogger___block_invoke_486;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v41;
      if (qword_1ED886B40 != -1)
        dispatch_once(&qword_1ED886B40, v47);
      if (byte_1ED8869AF)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfLTE is not valid, return"));
        v26 = objc_claimAutoreleasedReturnValue();
        v42 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "lastPathComponent");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFLTEWithLogger:]");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v44, v45, 692);

        PLLogCommon();
        v30 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          goto LABEL_28;
        *(_DWORD *)buf = 138412290;
        v51 = v26;
        goto LABEL_32;
      }
    }
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v36 = objc_opt_class();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __45__PLBBMav10HwMsgParser_logHwRFLTEWithLogger___block_invoke_479;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = v36;
    if (qword_1ED886B38 != -1)
      dispatch_once(&qword_1ED886B38, v48);
    if (byte_1ED8869AE)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: mem alloc for logHwRfLTE failed"));
      v26 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "lastPathComponent");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFLTEWithLogger:]");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v39, v40, 682);

      PLLogCommon();
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        goto LABEL_28;
      *(_DWORD *)buf = 138412290;
      v51 = v26;
LABEL_32:
      _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_28;
    }
  }
LABEL_30:

}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFLTEWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869AD = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFLTEWithLogger___block_invoke_479(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869AE = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFLTEWithLogger___block_invoke_486(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869AF = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFLTEWithLogger___block_invoke_495(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869B0 = result;
  return result;
}

- (void)logHwRFWCDMAWithLogger:(id)a3
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
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLBBMav10HwMsgParser_logHwRFWCDMAWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED886B50 != -1)
      dispatch_once(&qword_1ED886B50, block);
    if (byte_1ED8869B1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav10HwMsgParser logHwRFWCDMAWithLogger:]");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFWCDMAWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 745);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v6;
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

    if (-[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA"))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", ((_DWORD)-[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA")[4]- (_DWORD)-[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA")[8]));
      -[PLBBMavHwRfWCDMALogMsg setLogDuration:](v13, "setLogDuration:", v17);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA") + 12, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfWCDMALogMsg setSCEqStatCnt:](v13, "setSCEqStatCnt:", v18);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA") + 24, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfWCDMALogMsg setDCEqStatCnt:](v13, "setDCEqStatCnt:", v19);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA") + 36, 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfWCDMALogMsg setSCQsetEqStatCnt:](v13, "setSCQsetEqStatCnt:", v20);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA") + 52, 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfWCDMALogMsg setDCQsetEqStatCnt:](v13, "setDCQsetEqStatCnt:", v21);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA") + 68, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfWCDMALogMsg setDurInCarrierMode:](v13, "setDurInCarrierMode:", v22);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA") + 76, 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfWCDMALogMsg setRABModeCnt:](v13, "setRABModeCnt:", v23);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA") + 92, 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfWCDMALogMsg setRABTypeCnt:](v13, "setRABTypeCnt:", v24);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA") + 108, 12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfWCDMALogMsg setTxPwrBucket:](v13, "setTxPwrBucket:", v25);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA")[156]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfWCDMALogMsg setCpcRxOnCnt:](v13, "setCpcRxOnCnt:", v26);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA")[160]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfWCDMALogMsg setCpcRxTxOffCnt:](v13, "setCpcRxTxOffCnt:", v27);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA")[164]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfWCDMALogMsg setCpcTimeCnt:](v13, "setCpcTimeCnt:", v28);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)-[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA")[168]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfWCDMALogMsg setCpcEnergy:](v13, "setCpcEnergy:", v29);

      -[PLBBMavHwRfWCDMALogMsg logEventBackwardBBMavHwRfWCDMA](v13, "logEventBackwardBBMavHwRfWCDMA");
      v30 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v30, "objectForKey:", CFSTR("entry"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v30, "objectForKey:", CFSTR("entryKey"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addToGroupPLBBMavHwEntry:withEntryKey:", v31, v32);

      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_29;
      v33 = objc_opt_class();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __47__PLBBMav10HwMsgParser_logHwRFWCDMAWithLogger___block_invoke_511;
      v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v50[4] = v33;
      if (qword_1ED886B68 != -1)
        dispatch_once(&qword_1ED886B68, v50);
      if (!byte_1ED8869B4)
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh BB HW RF WCDMA"));
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastPathComponent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFWCDMAWithLogger:]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 814);

      PLLogCommon();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v34;
        _os_log_debug_impl(&dword_1CAF47000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_28:
LABEL_29:

      goto LABEL_30;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v45 = objc_opt_class();
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __47__PLBBMav10HwMsgParser_logHwRFWCDMAWithLogger___block_invoke_506;
      v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v51[4] = v45;
      if (qword_1ED886B60 != -1)
        dispatch_once(&qword_1ED886B60, v51);
      if (byte_1ED8869B3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfWCDMA is not valid, return"));
        v30 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "lastPathComponent");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFWCDMAWithLogger:]");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v48, v49, 759);

        PLLogCommon();
        v34 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          goto LABEL_28;
        *(_DWORD *)buf = 138412290;
        v55 = v30;
        goto LABEL_32;
      }
    }
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v40 = objc_opt_class();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __47__PLBBMav10HwMsgParser_logHwRFWCDMAWithLogger___block_invoke_501;
    v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v52[4] = v40;
    if (qword_1ED886B58 != -1)
      dispatch_once(&qword_1ED886B58, v52);
    if (byte_1ED8869B2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: mem alloc for logHwRfWCDMA failed"));
      v30 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "lastPathComponent");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFWCDMAWithLogger:]");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v43, v44, 749);

      PLLogCommon();
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        goto LABEL_28;
      *(_DWORD *)buf = 138412290;
      v55 = v30;
LABEL_32:
      _os_log_debug_impl(&dword_1CAF47000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_28;
    }
  }
LABEL_30:

}

uint64_t __47__PLBBMav10HwMsgParser_logHwRFWCDMAWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869B1 = result;
  return result;
}

uint64_t __47__PLBBMav10HwMsgParser_logHwRFWCDMAWithLogger___block_invoke_501(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869B2 = result;
  return result;
}

uint64_t __47__PLBBMav10HwMsgParser_logHwRFWCDMAWithLogger___block_invoke_506(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869B3 = result;
  return result;
}

uint64_t __47__PLBBMav10HwMsgParser_logHwRFWCDMAWithLogger___block_invoke_511(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869B4 = result;
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
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav10HwMsgParser_logHwRFGSMWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED886B70 != -1)
      dispatch_once(&qword_1ED886B70, block);
    if (byte_1ED8869B5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav10HwMsgParser logHwRFGSMWithLogger:]");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFGSMWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 820);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  v13 = objc_alloc_init(PLBBMavHwRfGSMLogMsg);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: mem alloc for logHwRfGSM failed"));
    v19 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lastPathComponent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFGSMWithLogger:]");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v31, v32, 824);

    PLLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    *(_DWORD *)buf = 138412290;
    v42 = v19;
LABEL_28:
    _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
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

  if (-[PLBBMav10HwMsgParser rfGSM](self, "rfGSM"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (*(_DWORD *)-[PLBBMav10HwMsgParser rfGSM](self, "rfGSM")- (_DWORD)-[PLBBMav10HwMsgParser rfGSM](self, "rfGSM")[4]));
    -[PLBBMavHwRfGSMLogMsg setLogDuration:](v13, "setLogDuration:", v17);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfGSM](self, "rfGSM") + 8, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavHwRfGSMLogMsg setConnState:](v13, "setConnState:", v18);

    -[PLBBMavHwRfGSMLogMsg logEventBackwardBBMavHwRfGSM](v13, "logEventBackwardBBMavHwRfGSM");
    v19 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v19, "objectForKey:", CFSTR("entry"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v19, "objectForKey:", CFSTR("entryKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addToGroupPLBBMavHwEntry:withEntryKey:", v20, v21);

    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_19;
    v22 = objc_opt_class();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __45__PLBBMav10HwMsgParser_logHwRFGSMWithLogger___block_invoke_524;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = v22;
    if (qword_1ED886B80 != -1)
      dispatch_once(&qword_1ED886B80, v38);
    if (!byte_1ED8869B7)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh BB HW RF GSM"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lastPathComponent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFGSMWithLogger:]");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 848);

    PLLogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v23;
      _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

LABEL_18:
LABEL_19:

    goto LABEL_20;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v33 = objc_opt_class();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __45__PLBBMav10HwMsgParser_logHwRFGSMWithLogger___block_invoke_519;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = v33;
    if (qword_1ED886B78 != -1)
      dispatch_once(&qword_1ED886B78, v39);
    if (byte_1ED8869B6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfGSM is not valid, return"));
      v19 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "lastPathComponent");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFGSMWithLogger:]");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v36, v37, 833);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        goto LABEL_18;
      *(_DWORD *)buf = 138412290;
      v42 = v19;
      goto LABEL_28;
    }
  }
LABEL_20:

}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFGSMWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869B5 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFGSMWithLogger___block_invoke_519(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869B6 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFGSMWithLogger___block_invoke_524(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869B7 = result;
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
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav10HwMsgParser_logHwRFTDSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED886B88 != -1)
      dispatch_once(&qword_1ED886B88, block);
    if (byte_1ED8869B8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav10HwMsgParser logHwRFTDSWithLogger:]");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFTDSWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 853);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v6;
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

    if (-[PLBBMav10HwMsgParser rfTDS](self, "rfTDS"))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (*(_DWORD *)-[PLBBMav10HwMsgParser rfTDS](self, "rfTDS")- (_DWORD)-[PLBBMav10HwMsgParser rfTDS](self, "rfTDS")[4]));
      -[PLBBMavHwRfTDSLogMsg setLogDuration:](v13, "setLogDuration:", v17);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfTDS](self, "rfTDS") + 8, 7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfTDSLogMsg setSrvcTypeCnt:](v13, "setSrvcTypeCnt:", v18);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfTDS](self, "rfTDS") + 36, 3);
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
        goto LABEL_29;
      v23 = objc_opt_class();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __45__PLBBMav10HwMsgParser_logHwRFTDSWithLogger___block_invoke_538;
      v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v40[4] = v23;
      if (qword_1ED886BA0 != -1)
        dispatch_once(&qword_1ED886BA0, v40);
      if (!byte_1ED8869BB)
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh BB HW RF TDS"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFTDSWithLogger:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 883);

      PLLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v24;
        _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_28:
LABEL_29:

      goto LABEL_30;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v35 = objc_opt_class();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __45__PLBBMav10HwMsgParser_logHwRFTDSWithLogger___block_invoke_533;
      v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v41[4] = v35;
      if (qword_1ED886B98 != -1)
        dispatch_once(&qword_1ED886B98, v41);
      if (byte_1ED8869BA)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfTDS is not valid, return"));
        v20 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "lastPathComponent");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFTDSWithLogger:]");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v38, v39, 867);

        PLLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          goto LABEL_28;
        *(_DWORD *)buf = 138412290;
        v45 = v20;
        goto LABEL_32;
      }
    }
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v30 = objc_opt_class();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __45__PLBBMav10HwMsgParser_logHwRFTDSWithLogger___block_invoke_530;
    v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v42[4] = v30;
    if (qword_1ED886B90 != -1)
      dispatch_once(&qword_1ED886B90, v42);
    if (byte_1ED8869B9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: mem alloc for logHwRfGSM failed"));
      v20 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "lastPathComponent");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFTDSWithLogger:]");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v33, v34, 857);

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        goto LABEL_28;
      *(_DWORD *)buf = 138412290;
      v45 = v20;
LABEL_32:
      _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_28;
    }
  }
LABEL_30:

}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFTDSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869B8 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFTDSWithLogger___block_invoke_530(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869B9 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFTDSWithLogger___block_invoke_533(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869BA = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFTDSWithLogger___block_invoke_538(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869BB = result;
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
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PLBBMav10HwMsgParser_logHwRF1xWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED886BA8 != -1)
      dispatch_once(&qword_1ED886BA8, block);
    if (byte_1ED8869BC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav10HwMsgParser logHwRF1xWithLogger:]");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRF1xWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 888);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v6;
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

    if (-[PLBBMav10HwMsgParser rf1x](self, "rf1x"))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (*(_DWORD *)-[PLBBMav10HwMsgParser rf1x](self, "rf1x")- (_DWORD)-[PLBBMav10HwMsgParser rf1x](self, "rf1x")[4]));
      -[PLBBMavHwRf1xLogMsg setLogDuration:](v13, "setLogDuration:", v17);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rf1x](self, "rf1x")[8]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRf1xLogMsg setDtxOn:](v13, "setDtxOn:", v18);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rf1x](self, "rf1x")[12]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRf1xLogMsg setDtxOff:](v13, "setDtxOff:", v19);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rf1x](self, "rf1x") + 16, 6);
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
        goto LABEL_29;
      v24 = objc_opt_class();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __44__PLBBMav10HwMsgParser_logHwRF1xWithLogger___block_invoke_554;
      v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v41[4] = v24;
      if (qword_1ED886BC0 != -1)
        dispatch_once(&qword_1ED886BC0, v41);
      if (!byte_1ED8869BF)
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh BB HW RF 1x"));
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lastPathComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRF1xWithLogger:]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 950);

      PLLogCommon();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v25;
        _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_28:
LABEL_29:

      goto LABEL_30;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v36 = objc_opt_class();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __44__PLBBMav10HwMsgParser_logHwRF1xWithLogger___block_invoke_549;
      v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v42[4] = v36;
      if (qword_1ED886BB8 != -1)
        dispatch_once(&qword_1ED886BB8, v42);
      if (byte_1ED8869BE)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rf1x is not valid, return"));
        v21 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "lastPathComponent");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRF1xWithLogger:]");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v39, v40, 901);

        PLLogCommon();
        v25 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          goto LABEL_28;
        *(_DWORD *)buf = 138412290;
        v46 = v21;
        goto LABEL_32;
      }
    }
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v31 = objc_opt_class();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __44__PLBBMav10HwMsgParser_logHwRF1xWithLogger___block_invoke_544;
    v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v43[4] = v31;
    if (qword_1ED886BB0 != -1)
      dispatch_once(&qword_1ED886BB0, v43);
    if (byte_1ED8869BD)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: mem alloc for logHwRf1x failed"));
      v21 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "lastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRF1xWithLogger:]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v34, v35, 892);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        goto LABEL_28;
      *(_DWORD *)buf = 138412290;
      v46 = v21;
LABEL_32:
      _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_28;
    }
  }
LABEL_30:

}

uint64_t __44__PLBBMav10HwMsgParser_logHwRF1xWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869BC = result;
  return result;
}

uint64_t __44__PLBBMav10HwMsgParser_logHwRF1xWithLogger___block_invoke_544(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869BD = result;
  return result;
}

uint64_t __44__PLBBMav10HwMsgParser_logHwRF1xWithLogger___block_invoke_549(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869BE = result;
  return result;
}

uint64_t __44__PLBBMav10HwMsgParser_logHwRF1xWithLogger___block_invoke_554(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869BF = result;
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
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav10HwMsgParser_logHwRFHDRWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED886BC8 != -1)
      dispatch_once(&qword_1ED886BC8, block);
    if (byte_1ED8869C0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav10HwMsgParser logHwRFHDRWithLogger:]");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFHDRWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 955);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v6;
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

    if (-[PLBBMav10HwMsgParser rf1x](self, "rf1x"))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (*(_DWORD *)-[PLBBMav10HwMsgParser rf1x](self, "rf1x")- (_DWORD)-[PLBBMav10HwMsgParser rf1x](self, "rf1x")[4]));
      -[PLBBMavHwRfHDRLogMsg setLogDuration:](v13, "setLogDuration:", v17);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rfHDR](self, "rfHDR")[8]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfHDRLogMsg setSDTXOnFrame:](v13, "setSDTXOnFrame:", v18);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rfHDR](self, "rfHDR")[12]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfHDRLogMsg setSDTXOffFrame:](v13, "setSDTXOffFrame:", v19);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rfHDR](self, "rfHDR")[16]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfHDRLogMsg setLDTXOnFrame:](v13, "setLDTXOnFrame:", v20);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rfHDR](self, "rfHDR")[20]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfHDRLogMsg setLDTXOffFrame:](v13, "setLDTXOffFrame:", v21);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rfHDR](self, "rfHDR")[24]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavHwRfHDRLogMsg setTDTXOnFrame:](v13, "setTDTXOnFrame:", v22);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rfHDR](self, "rfHDR")[28]);
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
        goto LABEL_29;
      v27 = objc_opt_class();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __45__PLBBMav10HwMsgParser_logHwRFHDRWithLogger___block_invoke_568;
      v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v44[4] = v27;
      if (qword_1ED886BE0 != -1)
        dispatch_once(&qword_1ED886BE0, v44);
      if (!byte_1ED8869C3)
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh BB HW RF HDR"));
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "lastPathComponent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFHDRWithLogger:]");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 989);

      PLLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v28;
        _os_log_debug_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_28:
LABEL_29:

      goto LABEL_30;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v39 = objc_opt_class();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __45__PLBBMav10HwMsgParser_logHwRFHDRWithLogger___block_invoke_565;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v39;
      if (qword_1ED886BD8 != -1)
        dispatch_once(&qword_1ED886BD8, v45);
      if (byte_1ED8869C2)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rf1x is not valid, return"));
        v24 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "lastPathComponent");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFHDRWithLogger:]");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v42, v43, 968);

        PLLogCommon();
        v28 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          goto LABEL_28;
        *(_DWORD *)buf = 138412290;
        v49 = v24;
        goto LABEL_32;
      }
    }
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v34 = objc_opt_class();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __45__PLBBMav10HwMsgParser_logHwRFHDRWithLogger___block_invoke_560;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v34;
    if (qword_1ED886BD0 != -1)
      dispatch_once(&qword_1ED886BD0, v46);
    if (byte_1ED8869C1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: mem alloc for logHwRfHDR failed"));
      v24 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastPathComponent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFHDRWithLogger:]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v37, v38, 959);

      PLLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        goto LABEL_28;
      *(_DWORD *)buf = 138412290;
      v49 = v24;
LABEL_32:
      _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_28;
    }
  }
LABEL_30:

}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFHDRWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869C0 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFHDRWithLogger___block_invoke_560(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869C1 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFHDRWithLogger___block_invoke_565(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869C2 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFHDRWithLogger___block_invoke_568(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869C3 = result;
  return result;
}

- (void)logHwRFOOSWithLogger:(id)a3
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
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav10HwMsgParser_logHwRFOOSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED886BE8 != -1)
      dispatch_once(&qword_1ED886BE8, block);
    if (byte_1ED8869C4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav10HwMsgParser logHwRFOOSWithLogger:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFOOSWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 994);

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
  v13 = (void *)objc_opt_new();
  -[PLBasebandMessage agent](self, "agent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAgent:", v14);

  objc_msgSend(v13, "setError:", &stru_1E8587D00);
  -[PLBasebandMessage seqNum](self, "seqNum");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage date](self, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage timeCal](self, "timeCal");
  objc_msgSend(v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

  if (-[PLBBMav10HwMsgParser rfOOS](self, "rfOOS"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLogDuration:", v17);

    objc_msgSend(v13, "setOosInProgress:", -[PLBBMav10HwMsgParser rfOOS](self, "rfOOS")[10]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rfOOS](self, "rfOOS")[2]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOosTicks:", v18);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)-[PLBBMav10HwMsgParser rfOOS](self, "rfOOS"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOosTimes:", v19);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rfOOS](self, "rfOOS")[6]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPssiTicks:", v20);

    -[PLBasebandHardwareMessage convertUint16ArrayToNSArray:ofSize:](self, "convertUint16ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfOOS](self, "rfOOS") + 11, 6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOosGsmPssiTimes:", v21);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfOOS](self, "rfOOS") + 59, 6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOosGsmPssiStatTicks:", v22);

    -[PLBasebandHardwareMessage convertUint16ArrayToNSArray:ofSize:](self, "convertUint16ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfOOS](self, "rfOOS") + 23, 6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOosWcdmaPssiTimes:", v23);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfOOS](self, "rfOOS") + 83, 6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOosWcdmaPssiStatTicks:", v24);

    -[PLBasebandHardwareMessage convertUint16ArrayToNSArray:ofSize:](self, "convertUint16ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfOOS](self, "rfOOS") + 35, 6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOosLtePssiTimes:", v25);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfOOS](self, "rfOOS") + 107, 6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOosLtePssiStatTicks:", v26);

    -[PLBasebandHardwareMessage convertUint16ArrayToNSArray:ofSize:](self, "convertUint16ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfOOS](self, "rfOOS") + 47, 6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOosTdsPssiTimes:", v27);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBBMav10HwMsgParser rfOOS](self, "rfOOS") + 131, 6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOosTdsPssiStatTicks:", v28);

    objc_msgSend(v13, "logEventBackwardBBMavHwRfOos");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", CFSTR("entry"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", CFSTR("entryKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addToGroupPLBBMavHwEntry:withEntryKey:", v30, v31);

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v32 = objc_opt_class();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __45__PLBBMav10HwMsgParser_logHwRFOOSWithLogger___block_invoke_579;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v32;
      if (qword_1ED886BF8 != -1)
        dispatch_once(&qword_1ED886BF8, v46);
      if (byte_1ED8869C6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded enh BB HW RF OOS"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "lastPathComponent");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFOOSWithLogger:]");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 1049);

        PLLogCommon();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v33;
          _os_log_debug_impl(&dword_1CAF47000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }

  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v39 = objc_opt_class();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __45__PLBBMav10HwMsgParser_logHwRFOOSWithLogger___block_invoke_574;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v39;
      if (qword_1ED886BF0 != -1)
        dispatch_once(&qword_1ED886BF0, v47);
      if (byte_1ED8869C5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rfOOS is not valid, return"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "lastPathComponent");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav10HwMsgParser logHwRFOOSWithLogger:]");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v43, v44, 1004);

        PLLogCommon();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v40;
          _os_log_debug_impl(&dword_1CAF47000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v13, "setError:", CFSTR("rfOOS is not valid, return"));
  }

}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFOOSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869C4 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFOOSWithLogger___block_invoke_574(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869C5 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFOOSWithLogger___block_invoke_579(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8869C6 = result;
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
  v9 = apps_clock_names;
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

- ($977EFEC0392D0530E6EA6884BB0BB487)rfWCDMA
{
  return self->_rfWCDMA;
}

- (void)setRfWCDMA:(id *)a3
{
  self->_rfWCDMA = a3;
}

- ($D38AB55F17507DDEA729FCED855170D9)rfGSM
{
  return self->_rfGSM;
}

- (void)setRfGSM:(id *)a3
{
  self->_rfGSM = a3;
}

- ($81F89CDC83781E2F8C3B7C08B1FDA3B1)rfTDS
{
  return self->_rfTDS;
}

- (void)setRfTDS:(id *)a3
{
  self->_rfTDS = a3;
}

- ($63F8DB169AF67CF236EE4F82E25D56B9)rf1x
{
  return self->_rf1x;
}

- (void)setRf1x:(id *)a3
{
  self->_rf1x = a3;
}

- ($A8298569B4D1A09F081049035A0A6303)rfHDR
{
  return self->_rfHDR;
}

- (void)setRfHDR:(id *)a3
{
  self->_rfHDR = a3;
}

- ($A3D0985796EC959AD12099E5C8C6CD30)rfOOS
{
  return self->_rfOOS;
}

- (void)setRfOOS:(id *)a3
{
  self->_rfOOS = a3;
}

- ($6A53C83E73901DD0C34CF18301855816)rpmNew
{
  return self->_rpmNew;
}

- (void)setRpmNew:(id *)a3
{
  self->_rpmNew = a3;
}

- ($6247608A9E858CB8A0F4CC99D4816BFE)apps_sleepNew
{
  return self->_apps_sleepNew;
}

- (void)setApps_sleepNew:(id *)a3
{
  self->_apps_sleepNew = a3;
}

- ($6247608A9E858CB8A0F4CC99D4816BFE)mpss_sleepNew
{
  return self->_mpss_sleepNew;
}

- (void)setMpss_sleepNew:(id *)a3
{
  self->_mpss_sleepNew = a3;
}

- ($6988F191A2E699FD2FDBF2169EACE1F4)appsNew
{
  return self->_appsNew;
}

- (void)setAppsNew:(id *)a3
{
  self->_appsNew = a3;
}

- ($791438B4249E1CB1D0E4FA5B19D8959E)qdspNew
{
  return self->_qdspNew;
}

- (void)setQdspNew:(id *)a3
{
  self->_qdspNew = a3;
}

- ($E07DBFA35793E6ACBF53B370E2AAA817)mcpm_sleep_vetoNew
{
  return self->_mcpm_sleep_vetoNew;
}

- (void)setMcpm_sleep_vetoNew:(id *)a3
{
  self->_mcpm_sleep_vetoNew = a3;
}

@end
