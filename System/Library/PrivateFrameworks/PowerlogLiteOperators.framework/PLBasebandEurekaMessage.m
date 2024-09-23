@implementation PLBasebandEurekaMessage

- (PLBasebandEurekaMessage)initWithData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  PLBasebandEurekaMessage *v12;
  PLBasebandEurekaMessage *v13;
  NSData *payload;
  PLBasebandEurekaMessage *v15;
  objc_super v17;
  _QWORD block[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__PLBasebandEurekaMessage_initWithData___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED882D10 != -1)
      dispatch_once(&qword_1ED882D10, block);
    if (_MergedGlobals_1_22)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandEurekaMessage initWithData:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaMessage initWithData:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 31);

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
  v17.receiver = self;
  v17.super_class = (Class)PLBasebandEurekaMessage;
  v12 = -[PLBasebandMessage initWithData:](&v17, sel_initWithData_, v4);
  v13 = v12;
  if (!v12)
    goto LABEL_10;
  v12->_header = 0;
  payload = v12->_payload;
  v12->_payload = 0;

  v13->_ssevent = 0;
  v13->_ssaction = 0;
  v13->_ssstate = 0;
  v13->_skip = 0;
  v15 = 0;
  if (-[PLBasebandEurekaMessage parseData:](v13, "parseData:", v4))
LABEL_10:
    v15 = v13;

  return v15;
}

uint64_t __40__PLBasebandEurekaMessage_initWithData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_22 = result;
  return result;
}

- (BOOL)parseData:(id)a3
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
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  _PLBasebandSystemSelectionEvent *v15;
  NSData *v16;
  NSData *payload;
  id v18;
  char *v19;
  unint64_t v20;
  NSObject *v21;
  id v23;
  char *v24;
  uint64_t v25;
  uint64_t block;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __37__PLBasebandEurekaMessage_parseData___block_invoke;
    v29 = &__block_descriptor_40_e5_v8__0lu32l8;
    v30 = v5;
    if (qword_1ED882D18 != -1)
      dispatch_once(&qword_1ED882D18, &block);
    if (byte_1ED882D01)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandEurekaMessage parseData:]", block, v27, v28, v29, v30);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaMessage parseData:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 48);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = objc_retainAutorelease(v4);
  v13 = (unsigned __int8 *)objc_msgSend(v12, "bytes");
  v14 = &v13[2 * (*v13 == 129)];
  self->_header = (_PLBasebandEventHeader *)v14;
  v15 = (_PLBasebandSystemSelectionEvent *)(v14 + 14);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v14 + 14, -[PLBasebandEurekaMessage header](self, "header")[13]);
  v16 = (NSData *)objc_claimAutoreleasedReturnValue();
  payload = self->_payload;
  self->_payload = v16;

  if (((_DWORD)-[PLBasebandEurekaMessage header](self, "header")[1] == 621
     || (_DWORD)-[PLBasebandEurekaMessage header](self, "header")[1] == 622)
    && -[PLBasebandEurekaMessage header](self, "header")[13] >= 4u)
  {
    self->_ssevent = v15;
    self->_ssaction = (char *)(v14 + 16);
    self->_ssstate = (char *)(v14 + 17);
    v15 = (_PLBasebandSystemSelectionEvent *)(v14 + 18);
  }
  v18 = objc_retainAutorelease(v12);
  v19 = (char *)v15 - objc_msgSend(v18, "bytes");
  v20 = objc_msgSend(v18, "length");
  if ((unint64_t)v19 > v20)
  {
    PLLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_retainAutorelease(v18);
      v24 = (char *)v15 - objc_msgSend(v23, "bytes");
      v25 = objc_msgSend(v23, "length");
      *(_DWORD *)buf = 134218498;
      v32 = v24;
      v33 = 2048;
      v34 = v25;
      v35 = 2080;
      v36 = "-[PLBasebandEurekaMessage parseData:]";
      _os_log_error_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", buf, 0x20u);
    }

  }
  return (unint64_t)v19 <= v20;
}

uint64_t __37__PLBasebandEurekaMessage_parseData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882D01 = result;
  return result;
}

- (void)logWithLogger:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  PLBBEurekaEventMsg *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  unsigned __int8 *v44;
  void *v45;
  void *v46;
  id v47;
  const __CFString *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  uint64_t v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  unsigned __int8 *v90;
  void *v91;
  const __CFString *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  _BYTE *v99;
  __CFString *v100;
  const __CFString *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  uint64_t v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  void *v116;
  id v117;
  uint64_t v118;
  id v119;
  void *v120;
  id v121;
  void *v122;
  id v123;
  void *v124;
  id v125;
  unsigned __int8 *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  uint64_t v133;
  unsigned __int8 *v134;
  void *v135;
  void *v136;
  const __CFString *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  id v143;
  unsigned int *v144;
  id v145;
  unsigned __int16 *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  id v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  NSObject *v162;
  int v163;
  id v164;
  id v165;
  void *v166;
  id v167;
  id v168;
  id v169;
  uint64_t v170;
  void *v171;
  id v172;
  unsigned __int8 *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  id v184;
  uint64_t v185;
  id v186;
  uint64_t v187;
  void *v188;
  void *v189;
  int v190;
  id v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  id v196;
  unsigned __int16 *v197;
  uint64_t v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  uint64_t v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  uint64_t v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  uint64_t v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  void *v221;
  id v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  const __CFString *v245;
  void *v246;
  void *v247;
  int v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  const __CFString *v259;
  void *v260;
  void *v261;
  uint64_t v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  NSObject *v268;
  _QWORD v269[5];
  _QWORD v270[5];
  _QWORD v271[5];
  _QWORD v272[5];
  _QWORD v273[5];
  _QWORD v274[5];
  _QWORD v275[5];
  _QWORD v276[5];
  _QWORD v277[5];
  _QWORD v278[5];
  _QWORD v279[5];
  _QWORD v280[5];
  _QWORD block[5];
  objc_super v282;
  uint8_t buf[4];
  void *v284;
  uint64_t v285;

  v285 = *MEMORY[0x1E0C80C00];
  v282.receiver = self;
  v282.super_class = (Class)PLBasebandEurekaMessage;
  -[PLBasebandMessage logWithLogger:](&v282, sel_logWithLogger_, a3);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1ED882D20 != -1)
      dispatch_once(&qword_1ED882D20, block);
    if (byte_1ED882D02)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandEurekaMessage logWithLogger:]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaMessage logWithLogger:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 92);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v284 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBasebandEurekaMessage payloadString](self, "payloadString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandEurekaMessage setSkip:](self, "setSkip:", 0);
  v12 = objc_alloc_init(PLBBEurekaEventMsg);
  -[PLBasebandMessage agent](self, "agent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage setAgent:](v12, "setAgent:", v13);

  -[PLBBEurekaEventMsg setEventCode:](v12, "setEventCode:", -[PLBasebandEurekaMessage eventCode](self, "eventCode"));
  -[PLBBEurekaEventMsg setError:](v12, "setError:", &stru_1E8587D00);
  -[PLBasebandMessage seqNum](self, "seqNum");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage date](self, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage timeCal](self, "timeCal");
  -[PLBBEurekaEventMsg setHeaderWithSeqNum:andDate:andTimeCal:](v12, "setHeaderWithSeqNum:andDate:andTimeCal:", v14, v15);

  if (v11)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v11);
    -[PLBBEurekaEventMsg setPayload:](v12, "setPayload:", v16);

  }
  -[PLBasebandEurekaMessage payload](self, "payload");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend(v17, "bytes");

  if (!v18)
  {
    -[PLBBEurekaEventMsg setError:](v12, "setError:", CFSTR("payloadIsNil;"));
    goto LABEL_236;
  }
  v19 = (int)-[PLBasebandEurekaMessage header](self, "header")[1];
  if (v19 > 2010)
  {
    if (v19 > 2470)
    {
      if (v19 > 2493)
      {
        if ((v19 - 2549) <= 0xB && ((1 << (v19 + 11)) & 0xFC1) != 0)
          goto LABEL_40;
        if (v19 == 2494)
        {
          if (-[PLBasebandEurekaMessage header](self, "header")[13] > 1u)
            goto LABEL_236;
          goto LABEL_198;
        }
        if (v19 == 2521)
        {
LABEL_40:
          v37 = (void *)MEMORY[0x1E0CB3940];
          -[PLBasebandEurekaMessage payload](self, "payload");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringWithFormat:", CFSTR("%@"), v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("payload"), v39);
LABEL_41:

LABEL_151:
          goto LABEL_236;
        }
        goto LABEL_134;
      }
      switch(v19)
      {
        case 2471:
          -[PLBasebandEurekaMessage payload](self, "payload");
          v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v64 = objc_msgSend(v63, "bytes");

          -[PLBasebandEurekaMessage convertCMCallOrigV2PayloadToDictionary:](self, "convertCMCallOrigV2PayloadToDictionary:", v64);
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v65 = objc_alloc(MEMORY[0x1E0CB3940]);
          v66 = (void *)MEMORY[0x1E0CB3940];
          -[__CFString objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("callId"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "stringWithFormat:", CFSTR("%@"), v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = (void *)objc_msgSend(v65, "initWithString:", v68);

          v70 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[__CFString objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("callType"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = (void *)objc_msgSend(v70, "initWithString:", v71);

          v73 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[__CFString objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("serviceType"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = (void *)objc_msgSend(v73, "initWithString:", v74);

          v76 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[__CFString objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("clientId"));
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = (void *)objc_msgSend(v76, "initWithString:", v77);

          -[PLBBEurekaEventMsg logEventCMCallEventOrigWithId:andCallType:andSrvType:andClientId:](v12, "logEventCMCallEventOrigWithId:andCallType:andSrvType:andClientId:", v69, v72, v75, v78);
          break;
        case 2472:
          -[PLBasebandEurekaMessage payload](self, "payload");
          v79 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v80 = objc_msgSend(v79, "bytes");

          -[PLBasebandEurekaMessage convertCMCallConnectV2PayloadToDictionary:](self, "convertCMCallConnectV2PayloadToDictionary:", v80);
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v81 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[__CFString objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("callId"));
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = (void *)objc_msgSend(v81, "initWithString:", v82);

          v83 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[__CFString objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("callType"));
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = (void *)objc_msgSend(v83, "initWithString:", v84);

          v85 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[__CFString objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("systemMode"));
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = (void *)objc_msgSend(v85, "initWithString:", v86);

          v87 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[__CFString objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("clientId"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = (void *)objc_msgSend(v87, "initWithString:", v88);

          -[PLBBEurekaEventMsg logEventCMCallEventConnWithId:andCallType:andSysMode:andClientId:](v12, "logEventCMCallEventConnWithId:andCallType:andSysMode:andClientId:", v69, v72, v75, v78);
          break;
        case 2473:
          -[PLBasebandEurekaMessage payload](self, "payload");
          v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v44 = (unsigned __int8 *)objc_msgSend(v43, "bytes");

          v23 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d"), v44[1]);
          v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d"), *v44);
          v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d"), v44[2]);
          -[PLBBEurekaEventMsg logEventCMCallEventEndWithId:andNumCalls:andClientId:](v12, "logEventCMCallEventEndWithId:andNumCalls:andClientId:", v23, v45, v46);
          -[PLBasebandEurekaMessage setSkip:](self, "setSkip:", 1);

          goto LABEL_235;
        default:
          goto LABEL_134;
      }
      -[PLBasebandEurekaMessage setSkip:](self, "setSkip:", 1);

LABEL_117:
      goto LABEL_171;
    }
    if (v19 <= 2278)
    {
      switch(v19)
      {
        case 2258:
        case 2265:
          goto LABEL_236;
        case 2259:
        case 2261:
        case 2262:
        case 2263:
        case 2264:
        case 2266:
        case 2267:
        case 2268:
        case 2269:
        case 2270:
        case 2271:
          goto LABEL_134;
        case 2260:
          goto LABEL_40;
        case 2272:
          if (-[PLBasebandEurekaMessage header](self, "header")[13] > 0xBu)
          {
            -[PLBasebandEurekaMessage payload](self, "payload");
            v186 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v187 = objc_msgSend(v186, "bytes");

            -[PLBasebandEurekaMessage stateStringMotion:](self, "stateStringMotion:", v187 + 8);
            v188 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("RAW_MOTION_STATE"), v188);

            -[PLBasebandEurekaMessage stateStringMotion:](self, "stateStringMotion:", v187 + 9);
            v189 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("FILTERED_MOTION_STATE"), v189);

            v190 = *(unsigned __int16 *)(v187 + 10);
            switch(v190)
            {
              case 1:
                v23 = CFSTR("CM");
                break;
              case 4:
                v23 = CFSTR("GPS");
                break;
              case 2:
                v23 = CFSTR("SD");
                break;
              default:
                -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:", *(_WORD *)(v187 + 10));
                v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
                break;
            }
            v36 = CFSTR("ACTIVE_CLIENT_BIT_MASK");
            goto LABEL_234;
          }
          if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            goto LABEL_198;
          v27 = objc_opt_class();
          v271[0] = MEMORY[0x1E0C809B0];
          v271[1] = 3221225472;
          v271[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_169;
          v271[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v271[4] = v27;
          if (qword_1ED882D70 != -1)
            dispatch_once(&qword_1ED882D70, v271);
          if (!byte_1ED882D0C)
            goto LABEL_198;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: bad length PL_EVENT_MAV_MOTION_SRV"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "lastPathComponent");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaMessage logWithLogger:]");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 847);

          PLLogCommon();
          v33 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            goto LABEL_197;
          *(_DWORD *)buf = 138412290;
          v284 = v28;
          goto LABEL_196;
        case 2273:
          if (-[PLBasebandEurekaMessage header](self, "header")[13] <= 0xBu)
          {
            if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
              goto LABEL_198;
            v138 = objc_opt_class();
            v270[0] = MEMORY[0x1E0C809B0];
            v270[1] = 3221225472;
            v270[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_186;
            v270[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v270[4] = v138;
            if (qword_1ED882D78 != -1)
              dispatch_once(&qword_1ED882D78, v270);
            if (!byte_1ED882D0D)
              goto LABEL_198;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: bad length PL_EVENT_MAV_LMAPO_SD"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "lastPathComponent");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaMessage logWithLogger:]");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v139, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v141, v142, 879);

            PLLogCommon();
            v33 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              goto LABEL_197;
            *(_DWORD *)buf = 138412290;
            v284 = v28;
            goto LABEL_196;
          }
          -[PLBasebandEurekaMessage payload](self, "payload");
          v191 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v192 = objc_msgSend(v191, "bytes");

          if (*(_BYTE *)(v192 + 8) == 1)
          {
            v23 = CFSTR("ACC_FSM");
            -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("STATE_MACHINE_ID"), CFSTR("ACC_FSM"));
            v218 = v192 + 10;
            v219 = v192 + 11;
            -[PLBasebandEurekaMessage stateStringACC:](self, "stateStringACC:", v192 + 9);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLBasebandEurekaMessage stateStringACC:](self, "stateStringACC:", v218);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLBasebandEurekaMessage stateStringACC:](self, "stateStringACC:", v219);
            v195 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (*(_BYTE *)(v192 + 8))
            {
              -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
              v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v36 = CFSTR("STATE_MACHINE_ID");
              goto LABEL_234;
            }
            v23 = CFSTR("OOS_FSM");
            -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("STATE_MACHINE_ID"), CFSTR("OOS_FSM"));
            v193 = v192 + 10;
            v194 = v192 + 11;
            -[PLBasebandEurekaMessage stateStringOOS:](self, "stateStringOOS:", v192 + 9);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLBasebandEurekaMessage eventStringOOS:](self, "eventStringOOS:", v193);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLBasebandEurekaMessage stateStringOOS:](self, "stateStringOOS:", v194);
            v195 = objc_claimAutoreleasedReturnValue();
          }
          v75 = (void *)v195;
          -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("CURRENT_STATE"), v69);
          -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("EVENT"), v72);
          -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("NEXT_STATE"), v75);
          goto LABEL_117;
        case 2274:
          if (-[PLBasebandEurekaMessage header](self, "header")[13] <= 3u)
            goto LABEL_198;
          -[PLBasebandEurekaMessage payload](self, "payload");
          v143 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v144 = (unsigned int *)objc_msgSend(v143, "bytes");

          v23 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *v144);
          -[__CFString stringValue](v23, "stringValue");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = CFSTR("InActivity_Time");
          goto LABEL_170;
        case 2275:
          if (-[PLBasebandEurekaMessage header](self, "header")[13] <= 0xBu)
            goto LABEL_198;
          -[PLBasebandEurekaMessage payload](self, "payload");
          v145 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v146 = (unsigned __int16 *)objc_msgSend(v145, "bytes");

          v147 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", v146[1]);
          objc_msgSend(v147, "stringValue");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("On_duration_timer"), v148);

          v149 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", v146[2]);
          objc_msgSend(v149, "stringValue");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("Inactivity_timer"), v150);

          v151 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", v146[3]);
          objc_msgSend(v151, "stringValue");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("Short_drx_cycle"), v152);

          v153 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", v146[4]);
          objc_msgSend(v153, "stringValue");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("Short_drx_cycle_timer"), v154);

          v23 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", v146[5]);
          -[__CFString stringValue](v23, "stringValue");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = CFSTR("Long_drx_cycle");
          goto LABEL_170;
        case 2276:
          if (!(_BYTE)-[PLBasebandEurekaMessage header](self, "header")[13])
            goto LABEL_198;
          -[PLBasebandEurekaMessage payload](self, "payload");
          v155 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          -[PLBasebandEurekaMessage estCauseLTE:](self, "estCauseLTE:", objc_msgSend(v155, "bytes"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v48 = CFSTR("est_cause");
          goto LABEL_150;
        default:
          if (v19 == 2011)
          {
            if (-[PLBasebandEurekaMessage header](self, "header")[13] < 3u)
              goto LABEL_236;
            -[PLBasebandEurekaMessage payload](self, "payload");
            v169 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v170 = objc_msgSend(v169, "bytes");

            -[PLBasebandEurekaMessage stateStringWCDMA:](self, "stateStringWCDMA:", v170);
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
            -[PLBasebandEurekaMessage stateStringWCDMA:](self, "stateStringWCDMA:", v170 + 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(unsigned __int8 *)(v170 + 2));
            v171 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v171, "stringValue");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            -[PLBBEurekaEventMsg logEventForwardUTRANRRCNextStateAs:andCurrStateAs:andRateAs:](v12, "logEventForwardUTRANRRCNextStateAs:andCurrStateAs:andRateAs:", v24, v23, v26);
            goto LABEL_154;
          }
          if (v19 != 2131)
            goto LABEL_134;
          if ((_BYTE)-[PLBasebandEurekaMessage header](self, "header")[13])
          {
            -[PLBasebandEurekaMessage payload](self, "payload");
            v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v57 = objc_msgSend(v56, "bytes");

            -[PLBasebandEurekaMessage stateStringUTRANL1:](self, "stateStringUTRANL1:", v57);
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v36 = CFSTR("currState");
            goto LABEL_234;
          }
          if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            goto LABEL_198;
          v213 = objc_opt_class();
          v273[0] = MEMORY[0x1E0C809B0];
          v273[1] = 3221225472;
          v273[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_147;
          v273[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v273[4] = v213;
          if (qword_1ED882D60 != -1)
            dispatch_once(&qword_1ED882D60, v273);
          if (!byte_1ED882D0A)
            goto LABEL_198;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: bad length PL_EVENT_UTRAN_L1_STATE"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v214 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m");
          v215 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v215, "lastPathComponent");
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaMessage logWithLogger:]");
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v214, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v216, v217, 802);

          PLLogCommon();
          v33 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            goto LABEL_197;
          *(_DWORD *)buf = 138412290;
          v284 = v28;
          goto LABEL_196;
      }
    }
    switch(v19)
    {
      case 2279:
        if (!(_BYTE)-[PLBasebandEurekaMessage header](self, "header")[13])
          goto LABEL_198;
        -[PLBasebandEurekaMessage payload](self, "payload");
        v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        -[PLBasebandEurekaMessage relCauseLTE:](self, "relCauseLTE:", objc_msgSend(v47, "bytes"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v48 = CFSTR("rel_cause");
        goto LABEL_150;
      case 2284:
        if (-[PLBasebandEurekaMessage header](self, "header")[13] > 7u)
        {
          -[PLBasebandEurekaMessage payload](self, "payload");
          v172 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v173 = (unsigned __int8 *)objc_msgSend(v172, "bytes");

          v174 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *v173);
          objc_msgSend(v174, "stringValue");
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("CUR_STEP"), v175);

          v176 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", v173[1]);
          objc_msgSend(v176, "stringValue");
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("PSSI_SEARCH_PHASE"), v177);

          v178 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", v173[2]);
          objc_msgSend(v178, "stringValue");
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("MCC"), v179);

          v180 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", v173[4]);
          objc_msgSend(v180, "stringValue");
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("MNC"), v181);

          v182 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", v173[6]);
          objc_msgSend(v182, "stringValue");
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("RAT"), v183);

          v23 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", v173[7]);
          -[__CFString stringValue](v23, "stringValue");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = CFSTR("PROCEDURE");
          goto LABEL_170;
        }
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          goto LABEL_198;
        v93 = objc_opt_class();
        v272[0] = MEMORY[0x1E0C809B0];
        v272[1] = 3221225472;
        v272[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_154;
        v272[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v272[4] = v93;
        if (qword_1ED882D68 != -1)
          dispatch_once(&qword_1ED882D68, v272);
        if (!byte_1ED882D0B)
          goto LABEL_198;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: bad length PL_EVENT_MAV_PSSI_SCAN"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "lastPathComponent");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaMessage logWithLogger:]");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v96, v97, 816);

        PLLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          goto LABEL_197;
        *(_DWORD *)buf = 138412290;
        v284 = v28;
        break;
      case 2287:
        if (!(_BYTE)-[PLBasebandEurekaMessage header](self, "header")[13])
          goto LABEL_198;
        -[PLBasebandEurekaMessage payload](self, "payload");
        v98 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v99 = (_BYTE *)objc_msgSend(v98, "bytes");

        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v23 = v100;
        if (*v99)
          v101 = CFSTR("Start");
        else
          v101 = CFSTR("Stop");
        -[__CFString appendFormat:](v100, "appendFormat:", CFSTR("%@"), v101);
        v36 = CFSTR("State");
        goto LABEL_234;
      case 2288:
        goto LABEL_236;
      default:
        goto LABEL_134;
    }
    goto LABEL_196;
  }
  if (v19 <= 1130)
  {
    if (v19 <= 620)
    {
      v20 = (v19 - 530);
      if (v20 <= 0x29)
      {
        if (((1 << (v19 - 18)) & 0x80000000DLL) != 0)
          goto LABEL_236;
        if (v20 == 41)
        {
          if (-[PLBasebandEurekaMessage header](self, "header")[13] > 2u)
          {
            -[PLBasebandEurekaMessage payload](self, "payload");
            v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v22 = objc_msgSend(v21, "bytes");

            -[PLBasebandEurekaMessage stateStringWCDMA:](self, "stateStringWCDMA:", v22);
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
            -[PLBasebandEurekaMessage stateStringWCDMA:](self, "stateStringWCDMA:", v22 + 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", *(unsigned __int8 *)(v22 + 2));
            objc_msgSend(v25, "stringValue");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            -[PLBBEurekaEventMsg logEventForwardWCDMARRCPrevStateAs:andCurrState:andRate:](v12, "logEventForwardWCDMARRCPrevStateAs:andCurrState:andRate:", v23, v24, v26);
LABEL_154:
            -[PLBasebandEurekaMessage setSkip:](self, "setSkip:", 1);

            goto LABEL_235;
          }
LABEL_155:
          v164 = objc_alloc(MEMORY[0x1E0CB3940]);
          goto LABEL_156;
        }
      }
      if (v19 == 389)
      {
        if ((_BYTE)-[PLBasebandEurekaMessage header](self, "header")[13])
        {
          -[PLBasebandEurekaMessage payload](self, "payload");
          v167 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          -[PLBasebandEurekaMessage stateStringGSM:](self, "stateStringGSM:", objc_msgSend(v167, "bytes"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          -[PLBBEurekaEventMsg logEventForwardGSML1StateWith:](v12, "logEventForwardGSML1StateWith:", v38);
          -[PLBasebandEurekaMessage setSkip:](self, "setSkip:", 1);
          goto LABEL_151;
        }
        goto LABEL_155;
      }
      if (v19 == 424)
      {
        -[PLBasebandEurekaMessage payload](self, "payload");
        v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        -[PLBasebandEurekaMessage cdmaExitString:](self, "cdmaExitString:", objc_msgSend(v55, "bytes"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v38);
        -[PLBBEurekaEventMsg logEventPointCMExitCodeWithState:](v12, "logEventPointCMExitCodeWithState:", v39);
        -[PLBasebandEurekaMessage setSkip:](self, "setSkip:", 1);
        goto LABEL_41;
      }
      goto LABEL_134;
    }
    switch(v19)
    {
      case 621:
      case 622:
        if (-[PLBasebandEurekaMessage header](self, "header")[13] > 3u)
        {
          -[PLBasebandEurekaMessage eventSystemSelection](self, "eventSystemSelection");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBasebandEurekaMessage actionSystemSelection](self, "actionSystemSelection");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBasebandEurekaMessage stateSystemSelection](self, "stateSystemSelection");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBBEurekaEventMsg setSDEventActionCodeWith:andSDAction:andSDState:](v12, "setSDEventActionCodeWith:andSDAction:andSDState:", v129, v130, v131);

          -[PLBasebandEurekaMessage payload](self, "payload");
          v132 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v133 = objc_msgSend(v132, "bytes");
          v134 = (unsigned __int8 *)(v133 + 4);

          switch(*-[PLBasebandEurekaMessage ssaction](self, "ssaction"))
          {
            case 0:
              v134 = (unsigned __int8 *)(v133 + 8);
              v135 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", *(unsigned __int16 *)(v133 + 4));
              objc_msgSend(v135, "stringValue");
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              v137 = CFSTR("timer");
              goto LABEL_205;
            case 1:
              v220 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *(unsigned __int8 *)(v133 + 4));
              objc_msgSend(v220, "stringValue");
              v221 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("band"), v221);

              v222 = objc_alloc(MEMORY[0x1E0CB3940]);
              -[PLBasebandEurekaMessage cellularSystemStringSystemSelection:](self, "cellularSystemStringSystemSelection:", v133 + 5);
              v223 = (void *)objc_claimAutoreleasedReturnValue();
              v224 = (void *)objc_msgSend(v222, "initWithString:", v223);

              -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("block_cellular_system"), v224);
              v134 = (unsigned __int8 *)(v133 + 8);
              v225 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", *(unsigned __int16 *)(v133 + 6));
              objc_msgSend(v225, "stringValue");
              v226 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("CDMA_Channel"), v226);

              break;
            case 2:
              v227 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *(unsigned __int8 *)(v133 + 4));
              objc_msgSend(v227, "stringValue");
              v228 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("band"), v228);

              v229 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *(unsigned __int8 *)(v133 + 5));
              objc_msgSend(v229, "stringValue");
              v230 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("sys"), v230);

              v231 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *(unsigned __int8 *)(v133 + 6));
              objc_msgSend(v231, "stringValue");
              v232 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("is_amps_2nd_cch"), v232);

              v134 = (unsigned __int8 *)(v133 + 8);
              v135 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *(unsigned __int8 *)(v133 + 7));
              objc_msgSend(v135, "stringValue");
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              v137 = CFSTR("max_redirect_delay");
              goto LABEL_205;
            case 3:
              v233 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *(unsigned __int8 *)(v133 + 4));
              objc_msgSend(v233, "stringValue");
              v234 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("band"), v234);

              v235 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *(unsigned __int8 *)(v133 + 5));
              objc_msgSend(v235, "stringValue");
              v236 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("acq_mode"), v236);

              v134 = (unsigned __int8 *)(v133 + 8);
              v135 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", *(unsigned __int16 *)(v133 + 6));
              objc_msgSend(v135, "stringValue");
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              v137 = CFSTR("channel");
LABEL_205:
              -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", v137, v136);

              break;
            case 0xB:
              if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
              {
                v237 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *v134);
                objc_msgSend(v237, "stringValue");
                v238 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("plmn1"), v238);

              }
              if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
              {
                v239 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *(unsigned __int8 *)(v133 + 5));
                objc_msgSend(v239, "stringValue");
                v240 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("plmn2"), v240);

              }
              if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
              {
                v241 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *(unsigned __int8 *)(v133 + 6));
                objc_msgSend(v241, "stringValue");
                v242 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("plmn3"), v242);

              }
              v243 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *(unsigned __int8 *)(v133 + 7));
              objc_msgSend(v243, "stringValue");
              v244 = (void *)objc_claimAutoreleasedReturnValue();
              v245 = CFSTR("net_sel_mode");
              goto LABEL_214;
            case 0xC:
              v246 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *(unsigned __int8 *)(v133 + 4));
              objc_msgSend(v246, "stringValue");
              v247 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("mode_pref"), v247);

              v243 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *(unsigned __int8 *)(v133 + 5));
              objc_msgSend(v243, "stringValue");
              v244 = (void *)objc_claimAutoreleasedReturnValue();
              v245 = CFSTR("srv_domain_pref");
LABEL_214:
              -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", v245, v244);

              v134 = (unsigned __int8 *)(v133 + 8);
              break;
            default:
              break;
          }
          v248 = *(unsigned __int16 *)-[PLBasebandEurekaMessage ssevent](self, "ssevent");
          if (v248 == 906 || v248 == 413)
          {
            v260 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *v134);
            objc_msgSend(v260, "stringValue");
            v261 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("reason"), v261);

            v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *v134);
            objc_msgSend(v41, "stringValue");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v259 = CFSTR("term");
          }
          else
          {
            if (v248 != 5)
              goto LABEL_222;
            v249 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *v134);
            objc_msgSend(v249, "stringValue");
            v250 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("reason"), v250);

            v251 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", v134[1]);
            objc_msgSend(v251, "stringValue");
            v252 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("orig_mode"), v252);

            v253 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", *((unsigned __int16 *)v134 + 1));
            objc_msgSend(v253, "stringValue");
            v254 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("mode_pref"), v254);

            v255 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v134 + 1));
            objc_msgSend(v255, "stringValue");
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("band_pref"), v256);

            v257 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", v134[8]);
            objc_msgSend(v257, "stringValue");
            v258 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("roam_pref"), v258);

            v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", v134[9]);
            objc_msgSend(v41, "stringValue");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v259 = CFSTR("hybr_pref");
          }
          -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", v259, v42);
        }
        else
        {
          v40 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[PLBasebandEurekaMessage tooShortErrorString](self, "tooShortErrorString");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_msgSend(v40, "initWithString:", v41);
          -[PLBBEurekaEventMsg setError:](v12, "setError:", v42);
        }

LABEL_222:
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v262 = objc_opt_class();
          v280[0] = MEMORY[0x1E0C809B0];
          v280[1] = 3221225472;
          v280[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_63;
          v280[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v280[4] = v262;
          if (qword_1ED882D28 != -1)
            dispatch_once(&qword_1ED882D28, v280);
          if (byte_1ED882D03)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded SDEventAction/Hybrid"));
            v263 = (void *)objc_claimAutoreleasedReturnValue();
            v264 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m");
            v265 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v265, "lastPathComponent");
            v266 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaMessage logWithLogger:]");
            v267 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v264, "logMessage:fromFile:fromFunction:fromLineNumber:", v263, v266, v267, 350);

            PLLogCommon();
            v268 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v268, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v284 = v263;
              _os_log_debug_impl(&dword_1CAF47000, v268, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        -[PLBBEurekaEventMsg logEventForwardSDEventActionCode](v12, "logEventForwardSDEventActionCode");
        goto LABEL_236;
      case 623:
      case 624:
      case 626:
      case 627:
      case 628:
        goto LABEL_134;
      case 625:
        if (-[PLBasebandEurekaMessage header](self, "header")[13] > 2u)
        {
          -[PLBasebandEurekaMessage payload](self, "payload");
          v184 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v185 = objc_msgSend(v184, "bytes");

          v23 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *(unsigned __int8 *)(v185 + 2));
          -[__CFString stringValue](v23, "stringValue");
          v54 = objc_claimAutoreleasedReturnValue();
          goto LABEL_161;
        }
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          goto LABEL_198;
        v102 = objc_opt_class();
        v279[0] = MEMORY[0x1E0C809B0];
        v279[1] = 3221225472;
        v279[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_82;
        v279[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v279[4] = v102;
        if (qword_1ED882D30 != -1)
          dispatch_once(&qword_1ED882D30, v279);
        if (!byte_1ED882D04)
          goto LABEL_198;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: bad length PL_EVENT_WCDMA_DRX_CYCLE"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "lastPathComponent");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaMessage logWithLogger:]");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v105, v106, 540);

        PLLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          goto LABEL_197;
        *(_DWORD *)buf = 138412290;
        v284 = v28;
        break;
      case 629:
        -[PLBasebandEurekaMessage payload](self, "payload");
        v107 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v108 = objc_msgSend(v107, "bytes");

        -[PLBasebandEurekaMessage convertCMCallOrigPayloadToDictionary:](self, "convertCMCallOrigPayloadToDictionary:", v108);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v109 = objc_alloc(MEMORY[0x1E0CB3940]);
        v110 = (void *)MEMORY[0x1E0CB3940];
        -[__CFString objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("callId"));
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "stringWithFormat:", CFSTR("%@"), v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = (void *)objc_msgSend(v109, "initWithString:", v112);

        v113 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[__CFString objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("callType"));
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = (void *)objc_msgSend(v113, "initWithString:", v114);

        v115 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[__CFString objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("serviceType"));
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = (void *)objc_msgSend(v115, "initWithString:", v116);

        -[PLBBEurekaEventMsg logEventCMCallEventOrigWithId:andCallType:andSrvType:](v12, "logEventCMCallEventOrigWithId:andCallType:andSrvType:", v69, v72, v75);
        goto LABEL_116;
      case 630:
        -[PLBasebandEurekaMessage payload](self, "payload");
        v117 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v118 = objc_msgSend(v117, "bytes");

        -[PLBasebandEurekaMessage convertCMCallConnectPayloadToDictionary:](self, "convertCMCallConnectPayloadToDictionary:", v118);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v119 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[__CFString objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("callId"));
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = (void *)objc_msgSend(v119, "initWithString:", v120);

        v121 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[__CFString objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("callType"));
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = (void *)objc_msgSend(v121, "initWithString:", v122);

        v123 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[__CFString objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("systemMode"));
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = (void *)objc_msgSend(v123, "initWithString:", v124);

        -[PLBBEurekaEventMsg logEventCMCallEventConnWithId:andCallType:andSysMode:](v12, "logEventCMCallEventConnWithId:andCallType:andSysMode:", v69, v72, v75);
LABEL_116:
        -[PLBasebandEurekaMessage setSkip:](self, "setSkip:", 1);
        goto LABEL_117;
      case 631:
        -[PLBasebandEurekaMessage payload](self, "payload");
        v125 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v126 = (unsigned __int8 *)objc_msgSend(v125, "bytes");

        v127 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d"), v126[1]);
        v128 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d"), *v126);
        -[PLBBEurekaEventMsg logEventCMCallEventEndWithId:andNumCalls:](v12, "logEventCMCallEventEndWithId:andNumCalls:", v127, v128);
        -[PLBasebandEurekaMessage setSkip:](self, "setSkip:", 1);

        goto LABEL_236;
      default:
        if (v19 != 1130)
          goto LABEL_134;
        if (-[PLBasebandEurekaMessage header](self, "header")[13] <= 2u)
          goto LABEL_198;
        -[PLBasebandEurekaMessage payload](self, "payload");
        v89 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v90 = (unsigned __int8 *)objc_msgSend(v89, "bytes");

        -[PLBasebandEurekaMessage stateStringHSDPA:](self, "stateStringHSDPA:", v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", CFSTR("HS_Operation"), v91);

        v23 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", *v90);
        -[__CFString stringValue](v23, "stringValue");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = CFSTR("PSC_HS_Cell");
        goto LABEL_170;
    }
    goto LABEL_196;
  }
  if (v19 <= 1549)
  {
    if (v19 <= 1495)
    {
      if ((v19 - 1131) < 2 || v19 == 1210)
        goto LABEL_236;
      goto LABEL_134;
    }
    if ((v19 - 1496) < 2)
      goto LABEL_236;
    if (v19 != 1549)
      goto LABEL_134;
    if ((_BYTE)-[PLBasebandEurekaMessage header](self, "header")[13])
    {
      -[PLBasebandEurekaMessage payload](self, "payload");
      v23 = (__CFString *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[PLBasebandEurekaMessage scanTypeStartWCDMA:](self, "scanTypeStartWCDMA:", -[__CFString bytes](v23, "bytes"));
      v54 = objc_claimAutoreleasedReturnValue();
      goto LABEL_161;
    }
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_198;
    v198 = objc_opt_class();
    v278[0] = MEMORY[0x1E0C809B0];
    v278[1] = 3221225472;
    v278[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_89;
    v278[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v278[4] = v198;
    if (qword_1ED882D38 != -1)
      dispatch_once(&qword_1ED882D38, v278);
    if (!byte_1ED882D05)
      goto LABEL_198;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: bad length PL_EVENT_WCDMA_BPLMN_SCAN_START"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v199 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v200, "lastPathComponent");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaMessage logWithLogger:]");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v199, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v201, v202, 555);

    PLLogCommon();
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      goto LABEL_197;
    *(_DWORD *)buf = 138412290;
    v284 = v28;
LABEL_196:
    _os_log_debug_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
LABEL_197:

    goto LABEL_198;
  }
  if (v19 <= 1614)
  {
    if (v19 != 1550)
    {
      if (v19 != 1606)
      {
        if (v19 != 1614)
          goto LABEL_134;
        if (-[PLBasebandEurekaMessage header](self, "header")[13] <= 1u)
        {
          if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            goto LABEL_198;
          v49 = objc_opt_class();
          v276[0] = MEMORY[0x1E0C809B0];
          v276[1] = 3221225472;
          v276[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_112;
          v276[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v276[4] = v49;
          if (qword_1ED882D48 != -1)
            dispatch_once(&qword_1ED882D48, v276);
          if (!byte_1ED882D07)
            goto LABEL_198;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: bad length PL_EVENT_LTE_RRC_PAGING_DRX_CYCLE"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "lastPathComponent");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaMessage logWithLogger:]");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v52, v53, 648);

          PLLogCommon();
          v33 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            goto LABEL_197;
          *(_DWORD *)buf = 138412290;
          v284 = v28;
          goto LABEL_196;
        }
        -[PLBasebandEurekaMessage payload](self, "payload");
        v196 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v197 = (unsigned __int16 *)objc_msgSend(v196, "bytes");

        v23 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", *v197);
        -[__CFString stringValue](v23, "stringValue");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = CFSTR("drx_cycle");
        goto LABEL_170;
      }
      v163 = -[PLBasebandEurekaMessage header](self, "header")[13];
      v164 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (!v163)
      {
LABEL_156:
        -[PLBasebandEurekaMessage tooShortErrorString](self, "tooShortErrorString");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_msgSend(v164, "initWithString:", v38);
        -[PLBBEurekaEventMsg setError:](v12, "setError:", v39);
        goto LABEL_41;
      }
      -[PLBasebandEurekaMessage payload](self, "payload");
      v165 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[PLBasebandEurekaMessage stateStringLTE:](self, "stateStringLTE:", objc_msgSend(v165, "bytes"));
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (__CFString *)objc_msgSend(v164, "initWithString:", v166);

      -[PLBBEurekaEventMsg logEventForwardLTERRCStateAs:](v12, "logEventForwardLTERRCStateAs:", v23);
      -[PLBasebandEurekaMessage setSkip:](self, "setSkip:", 1);
LABEL_235:

      goto LABEL_236;
    }
    if (!(_BYTE)-[PLBasebandEurekaMessage header](self, "header")[13])
    {
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_198;
      v203 = objc_opt_class();
      v277[0] = MEMORY[0x1E0C809B0];
      v277[1] = 3221225472;
      v277[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_94;
      v277[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v277[4] = v203;
      if (qword_1ED882D40 != -1)
        dispatch_once(&qword_1ED882D40, v277);
      if (!byte_1ED882D06)
        goto LABEL_198;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: bad length PL_EVENT_WCDMA_BPLMN_SCAN_ENDED"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "lastPathComponent");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaMessage logWithLogger:]");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v206, v207, 569);

      PLLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        goto LABEL_197;
      *(_DWORD *)buf = 138412290;
      v284 = v28;
      goto LABEL_196;
    }
    -[PLBasebandEurekaMessage payload](self, "payload");
    v23 = (__CFString *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[PLBasebandEurekaMessage scanTypeStopWCDMA:](self, "scanTypeStopWCDMA:", -[__CFString bytes](v23, "bytes"));
    v54 = objc_claimAutoreleasedReturnValue();
LABEL_161:
    v69 = (void *)v54;
    v92 = CFSTR("scan_type");
LABEL_170:
    -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", v92, v69);
LABEL_171:

    goto LABEL_235;
  }
  if (v19 > 1969)
  {
    if (v19 == 1970)
    {
      if (!(_BYTE)-[PLBasebandEurekaMessage header](self, "header")[13])
      {
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          goto LABEL_198;
        v208 = objc_opt_class();
        v275[0] = MEMORY[0x1E0C809B0];
        v275[1] = 3221225472;
        v275[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_133;
        v275[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v275[4] = v208;
        if (qword_1ED882D50 != -1)
          dispatch_once(&qword_1ED882D50, v275);
        if (!byte_1ED882D08)
          goto LABEL_198;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: bad length PL_EVENT_LTE_RRC_PLMN_SEARCH_START"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v209 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m");
        v210 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v210, "lastPathComponent");
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaMessage logWithLogger:]");
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v209, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v211, v212, 735);

        PLLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          goto LABEL_197;
        *(_DWORD *)buf = 138412290;
        v284 = v28;
        goto LABEL_196;
      }
    }
    else
    {
      if (v19 != 1971)
        goto LABEL_134;
      if (!(_BYTE)-[PLBasebandEurekaMessage header](self, "header")[13])
      {
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          goto LABEL_198;
        v58 = objc_opt_class();
        v274[0] = MEMORY[0x1E0C809B0];
        v274[1] = 3221225472;
        v274[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_140;
        v274[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v274[4] = v58;
        if (qword_1ED882D58 != -1)
          dispatch_once(&qword_1ED882D58, v274);
        if (!byte_1ED882D09)
          goto LABEL_198;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: bad length PL_EVENT_LTE_RRC_PLMN_SEARCH_ENDED"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "lastPathComponent");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaMessage logWithLogger:]");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v61, v62, 750);

        PLLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          goto LABEL_197;
        *(_DWORD *)buf = 138412290;
        v284 = v28;
        goto LABEL_196;
      }
    }
    -[PLBasebandEurekaMessage payload](self, "payload");
    v168 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[PLBasebandEurekaMessage iratStringLTE:](self, "iratStringLTE:", objc_msgSend(v168, "bytes"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = CFSTR("RAT");
LABEL_150:
    -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", v48, v38);
    goto LABEL_151;
  }
  if (v19 == 1615)
    goto LABEL_236;
  if (v19 == 1924)
  {
    if (-[PLBasebandEurekaMessage header](self, "header")[13] <= 0xFu)
    {
LABEL_198:
      -[PLBasebandEurekaMessage tooShortErrorString](self, "tooShortErrorString");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[PLBBEurekaEventMsg setError:](v12, "setError:", v23);
      goto LABEL_235;
    }
    -[PLBasebandEurekaMessage payload](self, "payload");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v35 = objc_msgSend(v34, "bytes");

    -[PLBasebandEurekaMessage stateStringHSPAPLUS_DC:](self, "stateStringHSPAPLUS_DC:", v35 + 8);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v36 = CFSTR("Action");
LABEL_234:
    -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v12, "addPairWithKey:andWithVal:", v36, v23);
    goto LABEL_235;
  }
LABEL_134:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v156 = objc_opt_class();
    v269[0] = MEMORY[0x1E0C809B0];
    v269[1] = 3221225472;
    v269[2] = __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_205;
    v269[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v269[4] = v156;
    if (qword_1ED882D80 != -1)
      dispatch_once(&qword_1ED882D80, v269);
    if (byte_1ED882D0E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Eureka Msg not processed"));
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaMessage.m");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "lastPathComponent");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaMessage logWithLogger:]");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "logMessage:fromFile:fromFunction:fromLineNumber:", v157, v160, v161, 955);

      PLLogCommon();
      v162 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v162, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v284 = v157;
        _os_log_debug_impl(&dword_1CAF47000, v162, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBEurekaEventMsg logEventNoneEventNotProcessed](v12, "logEventNoneEventNotProcessed");
LABEL_236:
  if (!-[PLBasebandEurekaMessage skip](self, "skip"))
    -[PLBBEurekaEventMsg logEventForwardBBEurekaEventMsgLite](v12, "logEventForwardBBEurekaEventMsgLite");

}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882D02 = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_63(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882D03 = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_82(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882D04 = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_89(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882D05 = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_94(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882D06 = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_112(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882D07 = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_133(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882D08 = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_140(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882D09 = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_147(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882D0A = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_154(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882D0B = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_169(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882D0C = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_186(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882D0D = result;
  return result;
}

uint64_t __41__PLBasebandEurekaMessage_logWithLogger___block_invoke_205(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882D0E = result;
  return result;
}

- (unsigned)eventCode
{
  return -[PLBasebandEurekaMessage header](self, "header")[1];
}

- (id)eventSystemSelection
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)-[PLBasebandEurekaMessage ssevent](self, "ssevent"));
}

- (id)eventStringACC:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 3)
    return off_1E857A280[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)eventStringOOS:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 4)
    return off_1E857A298[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)actionSystemSelection
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)-[PLBasebandEurekaMessage ssaction](self, "ssaction"));
}

- (id)stateSystemSelection
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)-[PLBasebandEurekaMessage ssstate](self, "ssstate"));
}

- (id)stateStringGSM:(char *)a3
{
  int v4;
  __CFString *v5;
  id result;

  v4 = *a3;
  if (v4 > 39)
  {
    if (v4 <= 49)
    {
      if (v4 == 40)
        return CFSTR("L1_RANDOM_ACCESS_MODE");
      if (v4 == 41)
        return CFSTR("L1_PACKET_ACCESS_MODE");
    }
    else
    {
      switch(v4)
      {
        case '2':
          return CFSTR("L1_DEDICATED_MODE");
        case '3':
          return CFSTR("L1_TRANSFER_MODE");
        case '4':
          return CFSTR("L1_DTM_MODE");
      }
    }
LABEL_22:
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  else
  {
    v5 = CFSTR("L1_INACTIVE_MODE");
    switch(v4)
    {
      case 10:
        return v5;
      case 11:
        result = CFSTR("L1_NULL_MODE");
        break;
      case 12:
        result = CFSTR("L1_SUSPEND_MODE");
        break;
      case 13:
        result = CFSTR("L1_RESET_MODE");
        break;
      case 14:
        result = CFSTR("L1_WTOG_BPLMN_MODE");
        break;
      case 20:
        result = CFSTR("L1_FIND_BCCH");
        break;
      case 21:
        result = CFSTR("L1_FIND_SCH");
        break;
      case 30:
        result = CFSTR("L1_IDLE_MODE");
        break;
      case 31:
        result = CFSTR("L1_GPRS_IDLE_MODE");
        break;
      default:
        goto LABEL_22;
    }
  }
  return result;
}

- (id)stateStringLTE:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 8)
    return off_1E857A2B8[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stateStringWCDMA:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 6)
    return off_1E857A2F8[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stateStringUTRANL1:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 0xE)
    return off_1E857A328[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stateStringHSDPA:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 4)
    return off_1E857A398[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stateStringHSUPA:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 4)
    return off_1E857A3B8[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stateStringHSPAPLUS_DC:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 5)
    return off_1E857A3D8[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stateStringMotion:(char *)a3
{
  int v3;
  __CFString *v5;

  v3 = *a3;
  if (v3 > 15)
  {
    if (v3 == 16)
    {
      v5 = CFSTR("Pedestrian");
      return v5;
    }
    if (v3 == 17)
      return CFSTR("Driving");
  }
  else
  {
    if (!v3)
      return CFSTR("Stationary");
    if (v3 == 1)
      return CFSTR("Moving");
  }
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)stateStringACC:(char *)a3
{
  int v3;

  v3 = *a3;
  if (!v3)
    return CFSTR("ACCESS");
  if (v3 == 1)
    return CFSTR("AVOID");
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stateStringOOS:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 6)
    return off_1E857A400[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)payloadString
{
  void *v3;
  int v4;
  BOOL v5;
  unsigned int v6;
  BOOL v7;
  unsigned int v10;
  unsigned int v12;
  BOOL v13;
  uint64_t v14;
  BOOL v16;
  void *v19;
  void *v20;

  v3 = 0;
  v4 = (int)-[PLBasebandEurekaMessage header](self, "header")[1];
  if (v4 <= 1603)
  {
    if (v4 <= 1009)
    {
      if (v4 > 530)
      {
        v16 = (v4 - 531) > 0x25 || ((1 << (v4 - 19)) & 0x2200000081) == 0;
        if (!v16 || v4 == 635 || v4 == 897)
          goto LABEL_68;
      }
      else
      {
        v7 = (v4 - 415) > 0x1F || ((1 << (v4 + 97)) & 0xC00C0007) == 0;
        if (!v7 || v4 == 275 || v4 == 311)
          goto LABEL_68;
      }
      return v3;
    }
    if (v4 <= 1209)
    {
      if ((v4 - 1010) <= 0x3E && ((1 << (v4 + 14)) & 0x4000000004000009) != 0)
        goto LABEL_68;
      v10 = v4 - 1076;
      if (v10 <= 0x2D && ((1 << v10) & 0x380000000001) != 0)
        goto LABEL_68;
      return v3;
    }
    if ((v4 - 1210) <= 0x11 && ((1 << (v4 + 70)) & 0x36001) != 0)
      goto LABEL_68;
    v6 = v4 - 1465;
    goto LABEL_44;
  }
  if (v4 > 2175)
  {
    if (v4 > 2475)
    {
      if ((v4 - 2476) <= 0xA && ((1 << (v4 + 84)) & 0x607) != 0 || v4 == 5184)
        goto LABEL_68;
      return v3;
    }
    if ((v4 - 2244) <= 0x2E && ((1 << (v4 + 60)) & 0x41000C030003) != 0)
      goto LABEL_68;
    v6 = v4 - 2176;
LABEL_44:
    if (v6 >= 2)
      return v3;
    goto LABEL_68;
  }
  if (v4 <= 1988)
  {
    v5 = (v4 - 1889) > 0x2A || ((1 << (v4 - 97)) & 0x60800000003) == 0;
    if (v5 && ((v4 - 1604) > 9 || ((1 << (v4 - 68)) & 0x219) == 0))
    {
      v6 = v4 - 1807;
      goto LABEL_44;
    }
LABEL_68:
    v19 = (void *)MEMORY[0x1E0CB3940];
    -[PLBasebandEurekaMessage payload](self, "payload");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@"), v20);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  v12 = v4 - 1989;
  v13 = v12 > 0x28;
  v14 = (1 << v12) & 0x18000060003;
  if (!v13 && v14 != 0)
    goto LABEL_68;
  return v3;
}

- (id)convertCMCallConnectPayloadToDictionary:(_CMCallConnectPayload *)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  __CFString **v11;
  void *v13;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3->var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@"), v7);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("callId"));

  -[PLBasebandEurekaMessage callTypeString:](self, "callTypeString:", &a3->var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("callType"));

  switch(a3->var2)
  {
    case 0u:
      v10 = CFSTR("NO_SRV");
      goto LABEL_15;
    case 1u:
      v10 = CFSTR("AMPS");
      goto LABEL_15;
    case 2u:
      v10 = CFSTR("CDMA");
      goto LABEL_15;
    case 3u:
      v11 = kPLGSM;
      goto LABEL_12;
    case 4u:
      v10 = CFSTR("HDR");
      goto LABEL_15;
    case 5u:
      v11 = kPLWCDMA;
      goto LABEL_12;
    case 6u:
      v10 = CFSTR("GPS");
      goto LABEL_15;
    case 7u:
      v10 = CFSTR("GW");
      goto LABEL_15;
    case 8u:
      v10 = CFSTR("WLAN");
      goto LABEL_15;
    case 9u:
      v11 = kPLLTE;
LABEL_12:
      v10 = *v11;
      goto LABEL_15;
    case 0xAu:
      v10 = CFSTR("GWL");
      goto LABEL_15;
    case 0xBu:
      v10 = CFSTR("TDS");
LABEL_15:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("systemMode"));
      break;
    default:
      -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("systemMode"));

      break;
  }
  return v5;
}

- (id)convertCMCallConnectV2PayloadToDictionary:(_NewCMCallConnectPayload *)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3->var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@"), v7);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("callId"));

  -[PLBasebandEurekaMessage callTypeString:](self, "callTypeString:", &a3->var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("callType"));

  switch(a3->var2)
  {
    case 0u:
      v10 = CFSTR("NO_SRV");
      goto LABEL_14;
    case 1u:
      v10 = CFSTR("AMPS");
      goto LABEL_14;
    case 2u:
      v10 = CFSTR("CDMA");
      goto LABEL_14;
    case 3u:
      v10 = CFSTR("GSM");
      goto LABEL_14;
    case 4u:
      v10 = CFSTR("HDR");
      goto LABEL_14;
    case 5u:
      v10 = CFSTR("WCDMA");
      goto LABEL_14;
    case 6u:
      v10 = CFSTR("GPS");
      goto LABEL_14;
    case 7u:
      v10 = CFSTR("GW");
      goto LABEL_14;
    case 8u:
      v10 = CFSTR("WLAN");
      goto LABEL_14;
    case 9u:
      v10 = CFSTR("LTE");
      goto LABEL_14;
    case 0xAu:
      v10 = CFSTR("GWL");
      goto LABEL_14;
    case 0xBu:
      v10 = CFSTR("TDS");
LABEL_14:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("systemMode"));
      break;
    default:
      -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("systemMode"));

      break;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3->var3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@"), v12);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("clientId"));

  return v5;
}

- (id)convertCMCallOrigPayloadToDictionary:(_CMCallOrigPayload *)a3
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  __CFString **v10;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3->var0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("callId"));

  -[PLBasebandEurekaMessage callTypeString:](self, "callTypeString:", &a3->var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("callType"));

  switch(a3->var2)
  {
    case 0u:
      v8 = CFSTR("AMPS");
      goto LABEL_26;
    case 1u:
      v8 = CFSTR("HDR");
      goto LABEL_26;
    case 2u:
      v8 = CFSTR("CDMA_SPECIFIC");
      goto LABEL_26;
    case 3u:
      v8 = CFSTR("CDMA_AUTOMATIC");
      goto LABEL_26;
    case 4u:
      v8 = CFSTR("AUTOMATIC");
      goto LABEL_26;
    case 5u:
      v8 = CFSTR("CDMA_HDR");
      goto LABEL_26;
    case 6u:
      v8 = CFSTR("GSM_WCDMA");
      goto LABEL_26;
    case 7u:
      v10 = kPLWCDMA;
      goto LABEL_15;
    case 8u:
      v10 = kPLGSM;
      goto LABEL_15;
    case 9u:
      v8 = CFSTR("WLAN");
      goto LABEL_26;
    case 0xAu:
      v8 = CFSTR("NON_AUTOMATIC");
      goto LABEL_26;
    case 0xBu:
      v10 = kPLLTE;
LABEL_15:
      v8 = *v10;
      goto LABEL_26;
    case 0xCu:
      v8 = CFSTR("GSM_WCDMA_LTE");
      goto LABEL_26;
    case 0xDu:
      v8 = CFSTR("HDR_MORE_PREF");
      goto LABEL_26;
    case 0xEu:
      v8 = CFSTR("TDS");
      goto LABEL_26;
    case 0xFu:
      v8 = CFSTR("TDS_GSM");
      goto LABEL_26;
    case 0x10u:
      v8 = CFSTR("TDS_GSM_LTE");
      goto LABEL_26;
    case 0x11u:
      v8 = CFSTR("TDS_GSM_WCDMA_LTE");
      goto LABEL_26;
    case 0x12u:
      v8 = CFSTR("TDS_GSM_WCDMA");
      goto LABEL_26;
    case 0x13u:
      v8 = CFSTR("TDS_LTE");
      goto LABEL_26;
    case 0x14u:
      v8 = CFSTR("CS_ONLY");
      goto LABEL_26;
    case 0x15u:
      v8 = CFSTR("PS_ONLY");
LABEL_26:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("serviceType"));
      break;
    default:
      -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("serviceType"));

      break;
  }
  return v5;
}

- (id)convertCMCallOrigV2PayloadToDictionary:(_NewCMCallOrigPayload *)a3
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3->var0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("callId"));

  -[PLBasebandEurekaMessage callTypeString:](self, "callTypeString:", &a3->var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("callType"));

  switch(a3->var2)
  {
    case 0u:
      v8 = CFSTR("AMPS");
      goto LABEL_25;
    case 1u:
      v8 = CFSTR("HDR");
      goto LABEL_25;
    case 2u:
      v8 = CFSTR("CDMA_SPECIFIC");
      goto LABEL_25;
    case 3u:
      v8 = CFSTR("CDMA_AUTOMATIC");
      goto LABEL_25;
    case 4u:
      v8 = CFSTR("AUTOMATIC");
      goto LABEL_25;
    case 5u:
      v8 = CFSTR("CDMA_HDR");
      goto LABEL_25;
    case 6u:
      v8 = CFSTR("GSM_WCDMA");
      goto LABEL_25;
    case 7u:
      v8 = CFSTR("WCDMA");
      goto LABEL_25;
    case 8u:
      v8 = CFSTR("GSM");
      goto LABEL_25;
    case 9u:
      v8 = CFSTR("WLAN");
      goto LABEL_25;
    case 0xAu:
      v8 = CFSTR("NON_AUTOMATIC");
      goto LABEL_25;
    case 0xBu:
      v8 = CFSTR("LTE");
      goto LABEL_25;
    case 0xCu:
      v8 = CFSTR("GSM_WCDMA_LTE");
      goto LABEL_25;
    case 0xDu:
      v8 = CFSTR("HDR_MORE_PREF");
      goto LABEL_25;
    case 0xEu:
      v8 = CFSTR("TDS");
      goto LABEL_25;
    case 0xFu:
      v8 = CFSTR("TDS_GSM");
      goto LABEL_25;
    case 0x10u:
      v8 = CFSTR("TDS_GSM_LTE");
      goto LABEL_25;
    case 0x11u:
      v8 = CFSTR("TDS_GSM_WCDMA_LTE");
      goto LABEL_25;
    case 0x12u:
      v8 = CFSTR("TDS_GSM_WCDMA");
      goto LABEL_25;
    case 0x13u:
      v8 = CFSTR("TDS_LTE");
      goto LABEL_25;
    case 0x14u:
      v8 = CFSTR("CS_ONLY");
      goto LABEL_25;
    case 0x15u:
      v8 = CFSTR("PS_ONLY");
LABEL_25:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("serviceType"));
      break;
    default:
      -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("serviceType"));

      break;
  }
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3->var3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@"), v11);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("clientId"));

  return v5;
}

- (id)cdmaExitString:(char *)a3
{
  unsigned int v3;
  __CFString *v4;

  v3 = *a3;
  if (v3 < 0x2F && ((0x7FEE4FFFCFF3uLL >> v3) & 1) != 0)
  {
    v4 = off_1E857A430[(char)v3];
  }
  else
  {
    -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)soCallTypeString:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 4)
    return off_1E857A5A8[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)callTypeString:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 0xF)
    return off_1E857A5C8[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)termStringSystemSelection:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 0xC)
    return off_1E857A640[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cellularSystemStringSystemSelection:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 8)
    return off_1E857A6A0[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)establishmentCauseStringWCDMA:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 0x14)
    return off_1E857A6E0[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)releaseCauseStringWCDMA:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 0x18)
    return off_1E857A780[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pagingTypeWCDMA:(char *)a3
{
  int v3;

  v3 = *a3;
  if (!v3)
    return CFSTR("RRCLOG_PAGING_TYPE_1");
  if (v3 == 1)
    return CFSTR("RRCLOG_PAGING_TYPE_2");
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pagingCauseWCDMA:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 8)
    return off_1E857A840[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)scanTypeStartWCDMA:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 3)
    return off_1E857A880[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)scanTypeStopWCDMA:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 3)
    return off_1E857A898[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)searchPhaseStringPSSI:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 6)
    return off_1E857A8B0[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ratStringPSSI:(char *)a3
{
  __CFString **v3;
  __CFString *v4;

  switch(*a3)
  {
    case 0:
      v3 = kPLGSM;
      goto LABEL_7;
    case 1:
      v3 = kPLUMTS;
      goto LABEL_7;
    case 2:
      v3 = kPLLTE;
      goto LABEL_7;
    case 3:
      v3 = kPLUTRAN;
LABEL_7:
      v4 = *v3;
      break;
    default:
      -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v4;
}

- (id)procedureStringPSSI:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 0xB)
    return off_1E857A8E0[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)estCauseLTE:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 5)
    return off_1E857A938[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)relCauseLTE:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 0xB)
    return off_1E857A960[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)iratHOStringLTE:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 5)
    return off_1E857A9B8[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)iratStringLTE:(char *)a3
{
  __CFString *v3;
  __CFString **v5;

  v3 = CFSTR("CDMA_HRPD");
  switch(*a3)
  {
    case 0:
      return v3;
    case 1:
      return CFSTR("CDMA_1X");
    case 2:
      v5 = kPLGSM;
      return *v5;
    case 3:
      v5 = kPLWCDMA;
      return *v5;
    case 4:
      v5 = kPLLTE;
      return *v5;
    case 5:
      v3 = CFSTR("TDS");
      return v3;
    default:
      objc_msgSend(CFSTR("CDMA_HRPD"), "stringForUnknownBytes:");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (id)smgmmEventType:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 0xB)
    return off_1E857A9E0[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cellUpdateCause:(char *)a3
{
  unsigned int v3;

  v3 = *a3;
  if (v3 < 8)
    return off_1E857AA38[(char)v3];
  -[PLBasebandEurekaMessage stringForUnknownBytes:](self, "stringForUnknownBytes:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stringForUnknownBytes:(unsigned int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("?-(0x%x/%u)"), *(_QWORD *)&a3, *(_QWORD *)&a3);
}

- (id)tooShortErrorString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("short_length!(%d)"), -[PLBasebandEurekaMessage header](self, "header")[13]);
}

- (_PLBasebandEventHeader)header
{
  return self->_header;
}

- (void)setHeader:(_PLBasebandEventHeader *)a3
{
  self->_header = a3;
}

- (NSData)payload
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPayload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (_PLBasebandSystemSelectionEvent)ssevent
{
  return self->_ssevent;
}

- (void)setSsevent:(_PLBasebandSystemSelectionEvent *)a3
{
  self->_ssevent = a3;
}

- (char)ssaction
{
  return self->_ssaction;
}

- (void)setSsaction:(char *)a3
{
  self->_ssaction = a3;
}

- (char)ssstate
{
  return self->_ssstate;
}

- (void)setSsstate:(char *)a3
{
  self->_ssstate = a3;
}

- (unsigned)skip
{
  return self->_skip;
}

- (void)setSkip:(unsigned __int8)a3
{
  self->_skip = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
