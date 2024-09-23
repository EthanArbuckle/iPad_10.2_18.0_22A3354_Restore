@implementation PLBluetoothAgent

+ (BOOL)shouldLogEnhancedStats
{
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004013) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004014) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004015) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017);
  }
}

- (void)logEventBackwardPowerProfileStats
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PLBluetoothAgent *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t DetailedPowerProfileStatistics;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSDate *v29;
  NSDate *lastPowerEntryDate;
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
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  double v49;
  uint64_t v50;
  _BOOL4 v51;
  int v52;
  uint64_t v53;
  void *v54;
  PLBluetoothAgent *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  unsigned int *v63;
  unsigned int *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  NSObject *v81;
  uint64_t v82;
  PLBluetoothAgent *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  uint64_t PowerProfileStatistics;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  NSDate *v107;
  NSDate *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  NSDate *v113;
  NSDate *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  unsigned int *v162;
  uint64_t v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  _QWORD v169[5];
  _QWORD v170[5];
  _QWORD v171[5];
  _QWORD v172[5];
  _QWORD v173[5];
  _QWORD v174[5];
  _QWORD block[5];
  _QWORD v176[5];
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  _QWORD v184[5];
  int v185;
  int v186;
  uint8_t buf[4];
  void *v188;
  uint64_t v189;

  v189 = *MEMORY[0x1E0C80C00];
  v185 = 0;
  v186 = 0;
  v3 = *MEMORY[0x1E0D80370];
  +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("PowerProfileStats"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v4);
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004011) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004012))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v6 = objc_opt_class();
      v184[0] = MEMORY[0x1E0C809B0];
      v184[1] = 3221225472;
      v184[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke;
      v184[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v184[4] = v6;
      if (qword_1ED882BE8 != -1)
        dispatch_once(&qword_1ED882BE8, v184);
      if (byte_1ED882A64)
      {
        v7 = v5;
        v8 = self;
        v9 = v4;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reading detailedpowerprofile"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventBackwardPowerProfileStats]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 1800);

        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v188 = v10;
          _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v4 = v9;
        self = v8;
        v5 = v7;
      }
    }
    v182 = 0;
    v183 = 0;
    v180 = 0;
    v181 = 0;
    v178 = 0;
    v179 = 0;
    v177 = 0;
    -[PLBluetoothAgent localBluetoothDevice](self, "localBluetoothDevice");
    DetailedPowerProfileStatistics = BTLocalDeviceReadDetailedPowerProfileStatistics();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DetailedPowerProfileStatistics, &v180, (char *)&v180 + 4, (char *)&v179 + 4, &v179, (char *)&v178 + 4, &v178, (char *)&v177 + 4, &v177);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("ErrorCode"));

    +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", v3, CFSTR("DetailedPowerProfileStats"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v18);
    if ((_DWORD)DetailedPowerProfileStatistics)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v20 = objc_opt_class();
        v176[0] = MEMORY[0x1E0C809B0];
        v176[1] = 3221225472;
        v176[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_529;
        v176[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v176[4] = v20;
        if (qword_1ED882BF0 != -1)
          dispatch_once(&qword_1ED882BF0, v176);
        if (byte_1ED882A65)
        {
          v165 = v5;
          v21 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: could not read power profile statistics (error: %u)"), DetailedPowerProfileStatistics);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "lastPathComponent");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventBackwardPowerProfileStats]");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 1851);

          PLLogCommon();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v188 = v22;
            _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v4 = v21;
          v5 = v165;
        }
      }
      if ((_DWORD)DetailedPowerProfileStatistics == 7)
      {
        -[PLOperator workQueue](self, "workQueue");
        v28 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_532;
        block[3] = &unk_1E85780C8;
        block[4] = self;
        dispatch_async(v28, block);

      }
    }
    else
    {
      v167 = v4;
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v29 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastPowerEntryDate = self->_lastPowerEntryDate;
      self->_lastPowerEntryDate = v29;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v183));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v31, CFSTR("durationTotal"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v183);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v32, CFSTR("durationActive"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v182));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v33, CFSTR("durationIdle"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v182);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v34, CFSTR("durationSleep"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v181));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v35, CFSTR("disableCounter"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v181);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v36, CFSTR("iPATxBT"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v180));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v37, CFSTR("iPATxLE"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v180);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v38, CFSTR("ePATxBT"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v179));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v39, CFSTR("ePATxLE"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v179);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v40, CFSTR("connectedRxBT"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v178));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v41, CFSTR("connectedRxLE"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v178);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v42, CFSTR("scanRxBT"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v177));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v43, CFSTR("scanRxLE"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v177);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v44, CFSTR("totalPHYCal"));

      if (HIDWORD(v183))
      {
        LODWORD(v45) = v182;
        v46 = (int)((double)v45 / (double)HIDWORD(v183) * 10000.0);
        HIWORD(v185) = (int)((double)v45 / (double)HIDWORD(v183) * 10000.0);
        v47 = (int)((double)(HIDWORD(v178) + v179 + v178 + HIDWORD(v177))
                                / (double)HIDWORD(v183)
                                * 10000.0);
        LOWORD(v186) = (int)((double)(HIDWORD(v178) + v179 + v178 + HIDWORD(v177))
                           / (double)HIDWORD(v183)
                           * 10000.0);
        *(double *)&v48 = (double)(HIDWORD(v180) + v181 + v180 + HIDWORD(v179))
                        / (double)HIDWORD(v183)
                        * 10000.0;
        HIWORD(v186) = (int)*(double *)&v48;
        LODWORD(v48) = HIDWORD(v182);
        v49 = (double)v48 / (double)HIDWORD(v183) * 10000.0;
        v50 = (int)v49;
        LOWORD(v185) = (int)v49;
      }
      else
      {
        v50 = 0;
        v46 = 0;
        v47 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v103, CFSTR("TXPower"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v47);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v104, CFSTR("RXPower"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v46);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v105, CFSTR("SleepPower"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v50);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v106, CFSTR("OtherPower"));

      v4 = v167;
    }
    -[PLOperator logEntry:](self, "logEntry:", v19);

    goto LABEL_62;
  }
  v51 = +[PLBluetoothAgent shouldLogEnhancedStats](PLBluetoothAgent, "shouldLogEnhancedStats");
  v52 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  if (!v51)
  {
    v82 = MEMORY[0x1E0C809B0];
    if (v52)
    {
      v171[0] = MEMORY[0x1E0C809B0];
      v171[1] = 3221225472;
      v171[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_547;
      v171[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v171[4] = objc_opt_class();
      if (qword_1ED882C18 != -1)
        dispatch_once(&qword_1ED882C18, v171);
      if (byte_1ED882A6A)
      {
        v83 = self;
        v84 = v4;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Getting power profile stats"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "lastPathComponent");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventBackwardPowerProfileStats]");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "logMessage:fromFile:fromFunction:fromLineNumber:", v85, v88, v89, 1972);

        PLLogCommon();
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v188 = v85;
          _os_log_debug_impl(&dword_1CAF47000, v90, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v4 = v84;
        self = v83;
        v82 = MEMORY[0x1E0C809B0];
      }
    }
    -[PLBluetoothAgent localBluetoothDevice](self, "localBluetoothDevice");
    PowerProfileStatistics = BTLocalDeviceReadPowerProfileStatistics();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", PowerProfileStatistics);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v92, CFSTR("ErrorCode"));

    if ((_DWORD)PowerProfileStatistics)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v170[0] = v82;
        v170[1] = 3221225472;
        v170[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_552;
        v170[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v170[4] = objc_opt_class();
        if (qword_1ED882C20 != -1)
          dispatch_once(&qword_1ED882C20, v170);
        if (byte_1ED882A6B)
        {
          v93 = v82;
          v94 = v5;
          v95 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: could not read power profile statistics (error: %u)"), PowerProfileStatistics);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "lastPathComponent");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventBackwardPowerProfileStats]");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "logMessage:fromFile:fromFunction:fromLineNumber:", v96, v99, v100, 1982);

          PLLogCommon();
          v101 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v188 = v96;
            _os_log_debug_impl(&dword_1CAF47000, v101, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v4 = v95;
          v5 = v94;
          v82 = v93;
        }
      }
      if ((_DWORD)PowerProfileStatistics == 7)
      {
        -[PLOperator workQueue](self, "workQueue");
        v102 = objc_claimAutoreleasedReturnValue();
        v169[0] = v82;
        v169[1] = 3221225472;
        v169[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_553;
        v169[3] = &unk_1E85780C8;
        v169[4] = self;
        dispatch_async(v102, v169);

      }
      -[PLOperator logEntry:](self, "logEntry:", v5);
      goto LABEL_67;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v107 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v108 = self->_lastPowerEntryDate;
    self->_lastPowerEntryDate = v107;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIWORD(v186));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v109, CFSTR("TXPower"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (unsigned __int16)v186);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v110, CFSTR("RXPower"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIWORD(v185));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v111, CFSTR("SleepPower"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (unsigned __int16)v185);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v112, CFSTR("OtherPower"));

LABEL_65:
    -[PLOperator logEntry:](self, "logEntry:", v5);
LABEL_66:
    -[PLBluetoothAgent modelBluetoothPower:](self, "modelBluetoothPower:", v5);
    goto LABEL_67;
  }
  if (v52)
  {
    v53 = objc_opt_class();
    v174[0] = MEMORY[0x1E0C809B0];
    v174[1] = 3221225472;
    v174[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_535;
    v174[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v174[4] = v53;
    if (qword_1ED882C00 != -1)
      dispatch_once(&qword_1ED882C00, v174);
    if (byte_1ED882A67)
    {
      v54 = v5;
      v55 = self;
      v56 = v4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Getting Enhanced BT stats"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "lastPathComponent");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventBackwardPowerProfileStats]");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "logMessage:fromFile:fromFunction:fromLineNumber:", v57, v60, v61, 1869);

      PLLogCommon();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v188 = v57;
        _os_log_debug_impl(&dword_1CAF47000, v62, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v4 = v56;
      self = v55;
      v5 = v54;
    }
  }
  v63 = (unsigned int *)malloc_type_malloc(0xF8uLL, 0x10000401CD0A21CuLL);
  if (!v63)
    goto LABEL_65;
  v64 = v63;
  v168 = v4;
  -[PLBluetoothAgent localBluetoothDevice](self, "localBluetoothDevice");
  DetailedPowerProfileStatistics = BTLocalDeviceReadEnhancedPowerProfileStatistics();
  v162 = v64;
  +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", v3, CFSTR("EnhancedPowerProfileStats"));
  v163 = objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v163);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DetailedPowerProfileStatistics);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v66, CFSTR("ErrorCode"));

  +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", v3, CFSTR("ThreadRadioPowerProfileStats"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v67);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DetailedPowerProfileStatistics);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = v68;
  objc_msgSend(v68, "setObject:forKeyedSubscript:", v69, CFSTR("ErrorCode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DetailedPowerProfileStatistics);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v70, CFSTR("ErrorCode"));

  if ((_DWORD)DetailedPowerProfileStatistics)
  {
    v72 = v65;
    v71 = (void *)v163;
    v73 = v162;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v74 = objc_opt_class();
      v173[0] = MEMORY[0x1E0C809B0];
      v173[1] = 3221225472;
      v173[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_540;
      v173[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v173[4] = v74;
      if (qword_1ED882C08 != -1)
        dispatch_once(&qword_1ED882C08, v173);
      if (byte_1ED882A68)
      {
        v161 = v67;
        v166 = v5;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: could not read enhanced power profile statistics (error: %u)"), DetailedPowerProfileStatistics);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "lastPathComponent");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventBackwardPowerProfileStats]");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "logMessage:fromFile:fromFunction:fromLineNumber:", v75, v78, v79, 1953);

        PLLogCommon();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v188 = v75;
          _os_log_debug_impl(&dword_1CAF47000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v5 = v166;
        v71 = (void *)v163;
        v67 = v161;
      }
    }
    if ((_DWORD)DetailedPowerProfileStatistics == 7)
    {
      -[PLOperator workQueue](self, "workQueue");
      v81 = objc_claimAutoreleasedReturnValue();
      v172[0] = MEMORY[0x1E0C809B0];
      v172[1] = 3221225472;
      v172[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_543;
      v172[3] = &unk_1E85780C8;
      v172[4] = self;
      dispatch_async(v81, v172);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v113 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v114 = self->_lastPowerEntryDate;
    self->_lastPowerEntryDate = v113;

    v73 = v162;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[1]);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v115, CFSTR("TXPower"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[2]);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v116, CFSTR("RXPower"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[3]);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v117, CFSTR("SleepPower"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[4]);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v118, CFSTR("OtherPower"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[1]);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v65;
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v119, CFSTR("TXPower"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[2]);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v120, CFSTR("RXPower"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[3]);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v121, CFSTR("SleepPower"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[4]);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v122, CFSTR("OtherPower"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[38]);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v123, CFSTR("iPACounter"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[39]);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v124, CFSTR("ePACounter"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[9]);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v125, CFSTR("ActiveDuration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[27]);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v126, CFSTR("DeepSleepDuration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[10]);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v127, CFSTR("D3SuspendDuration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[11]);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v128, CFSTR("PerstDuration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[13]);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v129, CFSTR("L0Duration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[17]);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v130, CFSTR("L11Duration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[19]);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v131, CFSTR("L12Duration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[21]);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v132, CFSTR("L2Duration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[28]);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v133, CFSTR("BTTimestamp"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[43]);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v134, CFSTR("epaTransmitPercentage"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[41]);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v135, CFSTR("txbfTransmitPercentage"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[44]);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v136, CFSTR("txbfEpaTransmitPercentage"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[42]);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v137, CFSTR("mrcReceivePercentage"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[40]);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v138, CFSTR("lpScanReceivePercentage"));

    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004015) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[45]);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v139, CFSTR("rxScanPercentage"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[46]);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v140, CFSTR("mainCoreELNAOnPercentage"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[47]);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v141, CFSTR("mainCoreELNAOffPercentage"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[48]);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v142, CFSTR("scanCoreELNAOnPercentage"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[49]);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v143, CFSTR("scanCoreELNAOffPercentage"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[46]);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v144, CFSTR("mainCoreELNAOnPercentage"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[47]);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v145, CFSTR("mainCoreELNAOffPercentage"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[48]);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v146, CFSTR("scanCoreELNAOnPercentage"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[49]);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v147, CFSTR("scanCoreELNAOffPercentage"));

    }
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[54]);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v148, CFSTR("iPA5GCounter"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[55]);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v149, CFSTR("ePA5GCounter"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned __int16 *)v162 + 112));
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v150, CFSTR("txbf5GTransmitPercentage"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned __int16 *)v162 + 113));
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v151, CFSTR("mrc5GReceivePercentage"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned __int16 *)v162 + 114));
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v152, CFSTR("epa5GTransmitPercentage"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned __int16 *)v162 + 115));
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v153, CFSTR("txbf5GEpaTransmitPercentage"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)v162 + 29));
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v154, CFSTR("Duration5GTx"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)v162 + 30));
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v155, CFSTR("Duration5GRx"));

    }
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[28]);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setObject:forKeyedSubscript:", v156, CFSTR("RadioTimestamp"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[50]);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setObject:forKeyedSubscript:", v157, CFSTR("m154TransmitPercentage"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[51]);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setObject:forKeyedSubscript:", v158, CFSTR("m154ReceivePercentage"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[52]);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setObject:forKeyedSubscript:", v159, CFSTR("iPAThreadCounter"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v162[53]);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setObject:forKeyedSubscript:", v160, CFSTR("ePAThreadCounter"));

      -[PLOperator logEntry:](self, "logEntry:", v68);
    }
    -[PLOperator logEntry:](self, "logEntry:", v65);
    v71 = (void *)v163;
  }
  free(v73);

  v4 = v168;
LABEL_62:
  -[PLOperator logEntry:](self, "logEntry:", v5);
  if (!(_DWORD)DetailedPowerProfileStatistics)
    goto LABEL_66;
LABEL_67:

}

- (void)modelBluetoothPower:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  double v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  dispatch_semaphore_t v89;
  void *v90;
  NSObject *v91;
  dispatch_time_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  double *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  NSObject *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  NSObject *v125;
  void *v126;
  double v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  NSObject *v138;
  uint64_t v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  void *v146;
  _QWORD v147[5];
  _QWORD v148[5];
  _QWORD v149[5];
  _QWORD v150[5];
  _QWORD v151[4];
  id v152;
  PLBluetoothAgent *v153;
  id v154;
  uint64_t *v155;
  uint64_t *v156;
  _QWORD *v157;
  uint64_t *v158;
  uint64_t *v159;
  uint64_t *v160;
  uint64_t *v161;
  __int128 *p_buf;
  uint64_t v163;
  double *v164;
  uint64_t v165;
  uint64_t v166;
  _QWORD v167[4];
  uint64_t v168;
  double *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  double *v173;
  uint64_t v174;
  uint64_t v175;
  _QWORD v176[5];
  _QWORD v177[5];
  NSObject *v178;
  uint64_t *v179;
  _QWORD v180[5];
  uint64_t v181;
  double *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t *v186;
  uint64_t v187;
  char v188;
  uint64_t v189;
  double *v190;
  uint64_t v191;
  double v192;
  _QWORD v193[5];
  _QWORD v194[5];
  _QWORD block[5];
  uint8_t v196[4];
  void *v197;
  __int128 buf;
  uint64_t v199;
  uint64_t (*v200)(uint64_t, uint64_t);
  void (*v201)(uint64_t);
  id v202;
  uint64_t v203;

  v203 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
    goto LABEL_102;
  -[PLBluetoothAgent btHardwareChipsetQuery](self, "btHardwareChipsetQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80078], "powerModelForOperatorName:", CFSTR("bluetooth"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("tx"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v145 = v9;

  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rx"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v144 = v12;

  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("other"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v143 = v15;

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v16 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v16;
    if (qword_1ED882C48 != -1)
      dispatch_once(&qword_1ED882C48, block);
    if (byte_1ED882A70)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("coefficientTxPower = %f, coefficientTxPower = %f, coefficientOtherPower = %f"), *(_QWORD *)&v145, *(_QWORD *)&v144, *(_QWORD *)&v143);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 2155);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v17;
        _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TXPower"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RXPower"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "doubleValue");
  v28 = v27;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OtherPower"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "doubleValue");
  v31 = v30;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SleepPower"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "doubleValue");
  v139 = v33;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004015) & 1) != 0)
    goto LABEL_12;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) != 0)
    goto LABEL_12;
  v34 = 0.0;
  v140 = 0.0;
  v141 = 0.0;
  v142 = 0.0;
  v35 = 0.0;
  v36 = 0.0;
  v37 = 0.0;
  v38 = 0.0;
  if (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017))
  {
LABEL_12:
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("mcon"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "doubleValue");
    v142 = v41;

    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("mcoff"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "doubleValue");
    v141 = v44;

    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("scon"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "doubleValue");
    v140 = v47;

    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("scoff"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "doubleValue");
    v34 = v50;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mainCoreELNAOnPercentage"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "doubleValue");
    v38 = v52;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mainCoreELNAOffPercentage"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "doubleValue");
    v37 = v54;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scanCoreELNAOnPercentage"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "doubleValue");
    v36 = v56;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scanCoreELNAOffPercentage"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "doubleValue");
    v35 = v58;

  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v59 = objc_opt_class();
    v194[0] = MEMORY[0x1E0C809B0];
    v194[1] = 3221225472;
    v194[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_633;
    v194[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v194[4] = v59;
    if (qword_1ED882C50 != -1)
      dispatch_once(&qword_1ED882C50, v194);
    if (byte_1ED882A71)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("txDur=%f, rxDur=%f, otherDur=%f, sleepDur=%f, mcondur=%f, mcoffdur=%f, scondur=%f, scoffdur=%f"), *(_QWORD *)&v25, *(_QWORD *)&v28, *(_QWORD *)&v31, v139, *(_QWORD *)&v38, *(_QWORD *)&v37, *(_QWORD *)&v36, *(_QWORD *)&v35);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "lastPathComponent");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "logMessage:fromFile:fromFunction:fromLineNumber:", v60, v63, v64, 2186);

      PLLogCommon();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v60;
        _os_log_debug_impl(&dword_1CAF47000, v65, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  v66 = 0.0;
  v67 = 0.0;
  v68 = 0.0;
  v69 = 0.0;
  if (v37 + v35 + v36 + v38 < v28)
  {
    v28 = v28 - v36 - v35 - v38 - v37;
    v66 = v35;
    v67 = v36;
    v68 = v37;
    v69 = v38;
  }
  if (v25 <= 10000.0)
    v70 = v25;
  else
    v70 = 0.0;
  if (v28 <= 10000.0)
    v71 = v28;
  else
    v71 = 0.0;
  if (v31 <= 10000.0)
    v72 = v31;
  else
    v72 = 0.0;
  if (v69 > 10000.0)
    v69 = 0.0;
  if (v68 > 10000.0)
    v68 = 0.0;
  if (v67 > 10000.0)
    v67 = 0.0;
  if (v66 > 10000.0)
    v66 = 0.0;
  v73 = (v144 * v71 + v145 * v70 + v143 * v72 + v69 * v142 + v68 * v141 + v67 * v140 + v66 * v34) / 10000.0;
  if (v73 >= 0.0)
    v74 = v73;
  else
    v74 = 0.0;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled", 0.0))
  {
    v75 = objc_opt_class();
    v193[0] = MEMORY[0x1E0C809B0];
    v193[1] = 3221225472;
    v193[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_638;
    v193[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v193[4] = v75;
    if (qword_1ED882C58 != -1)
      dispatch_once(&qword_1ED882C58, v193);
    if (byte_1ED882A72)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bluetooth power=%f"), *(_QWORD *)&v74);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "lastPathComponent");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "logMessage:fromFile:fromFunction:fromLineNumber:", v76, v79, v80, 2227);

      PLLogCommon();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v76;
        _os_log_debug_impl(&dword_1CAF47000, v81, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  v189 = 0;
  v190 = (double *)&v189;
  v191 = 0x2020000000;
  v192 = v74;
  v185 = 0;
  v186 = &v185;
  v187 = 0x2020000000;
  v188 = 0;
  v181 = 0;
  v182 = (double *)&v181;
  v183 = 0x2020000000;
  v184 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", *MEMORY[0x1E0D89A68]);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "addObject:", *MEMORY[0x1E0D89A60]);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v82 = objc_opt_class();
    v180[0] = MEMORY[0x1E0C809B0];
    v180[1] = 3221225472;
    v180[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_644;
    v180[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v180[4] = v82;
    if (qword_1ED882C60 != -1)
      dispatch_once(&qword_1ED882C60, v180);
    if (byte_1ED882A73)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Types: %@"), v146);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "lastPathComponent");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "logMessage:fromFile:fromFunction:fromLineNumber:", v83, v86, v87, 2241);

      PLLogCommon();
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v83;
        _os_log_debug_impl(&dword_1CAF47000, v88, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  v89 = dispatch_semaphore_create(0);
  -[PLBluetoothAgent beaconManager](self, "beaconManager");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v177[0] = MEMORY[0x1E0C809B0];
  v177[1] = 3221225472;
  v177[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_647;
  v177[3] = &unk_1E857A210;
  v177[4] = self;
  v179 = &v185;
  v91 = v89;
  v178 = v91;
  objc_msgSend(v90, "allBeaconsOfTypes:completion:", v146, v177);

  v92 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v91, v92) && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v93 = objc_opt_class();
    v176[0] = MEMORY[0x1E0C809B0];
    v176[1] = 3221225472;
    v176[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_659;
    v176[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v176[4] = v93;
    if (qword_1ED882C78 != -1)
      dispatch_once(&qword_1ED882C78, v176);
    if (byte_1ED882A76)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Timed out, ItemPaired: %d"), *((unsigned __int8 *)v186 + 24));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "lastPathComponent");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "logMessage:fromFile:fromFunction:fromLineNumber:", v94, v97, v98, 2253);

      PLLogCommon();
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v94;
        _os_log_debug_impl(&dword_1CAF47000, v99, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  v172 = 0;
  v173 = (double *)&v172;
  v174 = 0x2020000000;
  v175 = 0x4016000000000000;
  v168 = 0;
  v169 = (double *)&v168;
  v170 = 0x2020000000;
  v171 = 0x3FF6666666666666;
  v167[0] = 0;
  v167[1] = v167;
  v167[2] = 0x2020000000;
  v167[3] = 0x401199999999999ALL;
  v163 = 0;
  v164 = (double *)&v163;
  v165 = 0x2020000000;
  v166 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v199 = 0x3032000000;
  v200 = __Block_byref_object_copy__5;
  v201 = __Block_byref_object_dispose__5;
  objc_msgSend(v4, "entryDate");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "dateByAddingTimeInterval:", -5.0);
  v202 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(MEMORY[0x1E0D80020], "isiPhone"))
  {
    if (*((_BYTE *)v186 + 24))
    {
      if (v190[3] >= v169[3])
      {
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v119 = objc_opt_class();
          v149[0] = MEMORY[0x1E0C809B0];
          v149[1] = 3221225472;
          v149[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_716;
          v149[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v149[4] = v119;
          if (qword_1ED882CD8 != -1)
            dispatch_once(&qword_1ED882CD8, v149);
          if (byte_1ED882A82)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ModelBTPower: BTpower %f > %f"), *((_QWORD *)v190 + 3), *((_QWORD *)v173 + 3));
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "lastPathComponent");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "logMessage:fromFile:fromFunction:fromLineNumber:", v120, v123, v124, 2376);

            PLLogCommon();
            v125 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v196 = 138412290;
              v197 = v120;
              _os_log_debug_impl(&dword_1CAF47000, v125, OS_LOG_TYPE_DEBUG, "%@", v196, 0xCu);
            }

          }
        }
        v164[3] = v173[3];
        v182[3] = v169[3];
        goto LABEL_93;
      }
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v104 = objc_opt_class();
        v150[0] = MEMORY[0x1E0C809B0];
        v150[1] = 3221225472;
        v150[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_713;
        v150[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v150[4] = v104;
        if (qword_1ED882CD0 != -1)
          dispatch_once(&qword_1ED882CD0, v150);
        if (byte_1ED882A81)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ModelBTPower: BTpower %f < %f"), *((_QWORD *)v190 + 3), *((_QWORD *)v173 + 3));
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "lastPathComponent");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "logMessage:fromFile:fromFunction:fromLineNumber:", v105, v108, v109, 2372);

          PLLogCommon();
          v110 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v196 = 138412290;
            v197 = v105;
            _os_log_debug_impl(&dword_1CAF47000, v110, OS_LOG_TYPE_DEBUG, "%@", v196, 0xCu);
          }

        }
      }
      v164[3] = v173[3];
      v111 = v190;
    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v112 = objc_opt_class();
        v148[0] = MEMORY[0x1E0C809B0];
        v148[1] = 3221225472;
        v148[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_719;
        v148[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v148[4] = v112;
        if (qword_1ED882CE0 != -1)
          dispatch_once(&qword_1ED882CE0, v148);
        if (byte_1ED882A83)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ModelBTPower: BTPower: %f"), *((_QWORD *)v190 + 3));
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "lastPathComponent");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "logMessage:fromFile:fromFunction:fromLineNumber:", v113, v116, v117, 2381);

          PLLogCommon();
          v118 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v196 = 138412290;
            v197 = v113;
            _os_log_debug_impl(&dword_1CAF47000, v118, OS_LOG_TYPE_DEBUG, "%@", v196, 0xCu);
          }

        }
      }
      v111 = v164;
    }
    v111[3] = 0.0;
LABEL_93:
    v190[3] = fmax(v190[3] - v182[3], 0.0);
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v190[3];
    objc_msgSend(v4, "entryDate");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 50, v128, v127);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 59, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v164[3]);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryDate");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 59, v131, 0.0);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v102 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryDate");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 47, &unk_1E864BB80, v103);
    goto LABEL_94;
  }
  v101 = objc_alloc_init(MEMORY[0x1E0CAA370]);
  v151[0] = MEMORY[0x1E0C809B0];
  v151[1] = 3221225472;
  v151[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_663;
  v151[3] = &unk_1E857A238;
  v102 = v101;
  v152 = v102;
  v153 = self;
  v155 = &v185;
  v156 = &v189;
  v157 = v167;
  v158 = &v163;
  v159 = &v172;
  v160 = &v181;
  v161 = &v168;
  v154 = v4;
  p_buf = &buf;
  objc_msgSend(v102, "activateWithCompletionHandler:", v151);

  v103 = v152;
LABEL_94:

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v132 = objc_opt_class();
    v147[0] = MEMORY[0x1E0C809B0];
    v147[1] = 3221225472;
    v147[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_725;
    v147[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v147[4] = v132;
    if (qword_1ED882CE8 != -1)
      dispatch_once(&qword_1ED882CE8, v147);
    if (byte_1ED882A84)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ITpower: %f"), *((_QWORD *)v164 + 3));
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "lastPathComponent");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "logMessage:fromFile:fromFunction:fromLineNumber:", v133, v136, v137, 2404);

      PLLogCommon();
      v138 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v196 = 138412290;
        v197 = v133;
        _os_log_debug_impl(&dword_1CAF47000, v138, OS_LOG_TYPE_DEBUG, "%@", v196, 0xCu);
      }

    }
  }
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v163, 8);
  _Block_object_dispose(v167, 8);
  _Block_object_dispose(&v168, 8);
  _Block_object_dispose(&v172, 8);

  _Block_object_dispose(&v181, 8);
  _Block_object_dispose(&v185, 8);
  _Block_object_dispose(&v189, 8);

LABEL_102:
}

- (BTLocalDeviceImpl)localBluetoothDevice
{
  BTLocalDeviceImpl **p_localBluetoothDevice;
  BTLocalDeviceImpl *result;
  uint64_t Default;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_localBluetoothDevice = &self->localBluetoothDevice;
  result = self->localBluetoothDevice;
  if (!result)
  {
    result = (BTLocalDeviceImpl *)self->session;
    if (result)
    {
      Default = BTLocalDeviceGetDefault();
      if ((_DWORD)Default || (result = *p_localBluetoothDevice) == 0)
      {
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v6 = objc_opt_class();
          block = MEMORY[0x1E0C809B0];
          v14 = 3221225472;
          v15 = __40__PLBluetoothAgent_localBluetoothDevice__block_invoke;
          v16 = &__block_descriptor_40_e5_v8__0lu32l8;
          v17 = v6;
          if (qword_1ED882AF0 != -1)
            dispatch_once(&qword_1ED882AF0, &block);
          if (byte_1ED882A45)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bluetooth power ERROR: BTLocalDeviceGetDefault: failed! %d\n"), Default, block, v14, v15, v16, v17);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "lastPathComponent");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent localBluetoothDevice]");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 934);

            PLLogCommon();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v19 = v7;
              _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        result = 0;
        *p_localBluetoothDevice = 0;
      }
    }
  }
  return result;
}

- (id)btHardwareChipsetQuery
{
  __CFString *v3;
  NSString *btHardwareChipset;

  if (!self->_btHardwareChipset)
  {
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004001) & 1) != 0)
    {
      v3 = CFSTR("4334");
LABEL_32:
      btHardwareChipset = self->_btHardwareChipset;
      self->_btHardwareChipset = &v3->isa;

      return self->_btHardwareChipset;
    }
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004002) & 1) != 0)
    {
      v3 = CFSTR("43342");
      goto LABEL_32;
    }
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004003) & 1) != 0)
    {
      v3 = CFSTR("4324");
      goto LABEL_32;
    }
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004006) & 1) != 0)
    {
      v3 = CFSTR("4345");
      goto LABEL_32;
    }
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004005) & 1) != 0)
    {
      v3 = CFSTR("4350");
      goto LABEL_32;
    }
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004008) & 1) != 0)
    {
      v3 = CFSTR("43452");
      goto LABEL_32;
    }
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004007) & 1) != 0)
    {
      v3 = CFSTR("4355");
      goto LABEL_32;
    }
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004010) & 1) != 0)
    {
      v3 = CFSTR("4357");
      goto LABEL_32;
    }
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004013) & 1) != 0)
    {
      v3 = CFSTR("4377");
      goto LABEL_32;
    }
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004014) & 1) != 0)
    {
      v3 = CFSTR("4378");
      goto LABEL_32;
    }
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004015) & 1) != 0)
    {
      v3 = CFSTR("4387");
      goto LABEL_32;
    }
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) != 0)
    {
      v3 = CFSTR("4388");
      goto LABEL_32;
    }
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017) & 1) != 0)
    {
      v3 = CFSTR("4399");
      goto LABEL_32;
    }
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004011) & 1) != 0)
    {
      v3 = CFSTR("1001");
      goto LABEL_32;
    }
    if (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004012))
    {
      v3 = CFSTR("2001");
      goto LABEL_32;
    }
  }
  return self->_btHardwareChipset;
}

- (SPBeaconManager)beaconManager
{
  return (SPBeaconManager *)objc_getProperty(self, a2, 200, 1);
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBluetoothAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("Magnet");
  objc_msgSend(a1, "entryEventPointDefinitionMagnet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("MagnetOperation");
  v8[0] = v3;
  objc_msgSend(a1, "entryEventPointDefinitionMagnetOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventPointDefinitionMagnet
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[4];
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1E8652BC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("clientname");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("inputBytesPerSecond");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("packetsPerSecond");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("sessionId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionMagnetOperation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1E8652BC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("value");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventForwardDefinitions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  _QWORD v27[4];
  _QWORD v28[4];
  uint64_t v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];
  _QWORD v34[3];
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x1E0C80C00];
  v40[0] = CFSTR("PairedDevices");
  v37 = *MEMORY[0x1E0D80298];
  v2 = v37;
  v35 = *MEMORY[0x1E0D80318];
  v3 = v35;
  v36 = &unk_1E8652BC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v26;
  v38 = *MEMORY[0x1E0D802F0];
  v4 = v38;
  v33[0] = CFSTR("PairedDevicesName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_StringFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v24;
  v33[1] = CFSTR("PairedDevicesDefaultName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_StringFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v22;
  v33[2] = CFSTR("PairedDevicesMac");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_StringFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v37, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = CFSTR("DeviceState");
  v41[0] = v18;
  v29 = v3;
  v30 = &unk_1E8652BD0;
  v31[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v4;
  v32[0] = v17;
  v27[0] = CFSTR("DevicePowered");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v5;
  v27[1] = CFSTR("DeviceDiscoverable");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v7;
  v27[2] = CFSTR("DeviceConnectable");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_BoolFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v9;
  v27[3] = CFSTR("DeviceConnected");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_BoolFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)entryEventBackwardDefinitions
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[10];
  _QWORD v21[10];
  _QWORD v22[7];
  _QWORD v23[7];
  _QWORD v24[6];
  _QWORD v25[6];
  uint8_t buf[4];
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v27 = objc_msgSend(MEMORY[0x1E0D80020], "kPLWiFiClassOfDevice");
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "Wifi/BT Chipset for Device is  = %d\n", buf, 8u);
  }

  if (objc_msgSend(a1, "shouldLogMarconi"))
  {
    v24[0] = CFSTR("DetailedPowerProfileStats");
    objc_msgSend(a1, "entryEventBackwardDefinitionDetailedPowerProfileStats");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v4;
    v24[1] = CFSTR("HCITrace");
    objc_msgSend(a1, "entryEventBackwardDefinitionHCITrace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v5;
    v24[2] = CFSTR("PowerProfileStats");
    objc_msgSend(a1, "entryEventBackwardDefinitionPowerProfileStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v6;
    v24[3] = CFSTR("BTWakeupVSE");
    objc_msgSend(a1, "entryEventBackwardWakeupVSE");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v7;
    v24[4] = CFSTR("WirelessProxScanDStats");
    objc_msgSend(a1, "entryEventBackwardDefinitionWirelessProxScanDStats");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25[4] = v8;
    v24[5] = CFSTR("CBDiscoveryStats");
    objc_msgSend(a1, "entryEventBackwardDefinitionCBDiscoveryStats");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[5] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_9;
  }
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004007) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004010))
  {
    v22[0] = CFSTR("HFPPower");
    objc_msgSend(a1, "entryEventBackwardDefinitionAHFPPower");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v4;
    v22[1] = CFSTR("A2DPPower");
    objc_msgSend(a1, "entryEventBackwardDefinitionA2DPPower");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v5;
    v22[2] = CFSTR("HCITrace");
    objc_msgSend(a1, "entryEventBackwardDefinitionHCITrace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v6;
    v22[3] = CFSTR("MaxDutyCycle");
    objc_msgSend(a1, "entryEventBackwardDefinitionMaxDutyCycle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v7;
    v22[4] = CFSTR("PowerProfileStats");
    objc_msgSend(a1, "entryEventBackwardDefinitionPowerProfileStats");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[4] = v8;
    v22[5] = CFSTR("WirelessProxScanDStats");
    objc_msgSend(a1, "entryEventBackwardDefinitionWirelessProxScanDStats");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[5] = v9;
    v22[6] = CFSTR("CBDiscoveryStats");
    objc_msgSend(a1, "entryEventBackwardDefinitionCBDiscoveryStats");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[6] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (objc_msgSend(a1, "shouldLogEnhancedStats"))
  {
    v20[0] = CFSTR("PowerProfileStats");
    objc_msgSend(a1, "entryEventBackwardDefinitionPowerProfileStats");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v4;
    v20[1] = CFSTR("EnhancedPowerProfileStats");
    objc_msgSend(a1, "entryEventBackwardDefinitionEnhancedPowerProfileStats");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v5;
    v20[2] = CFSTR("ThreadRadioPowerProfileStats");
    objc_msgSend(a1, "entryEventBackwardDefinitionThreadRadioPowerProfileStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v6;
    v20[3] = CFSTR("HCITrace");
    objc_msgSend(a1, "entryEventBackwardDefinitionHCITrace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v7;
    v20[4] = CFSTR("WirelessProxScanDStats");
    objc_msgSend(a1, "entryEventBackwardDefinitionWirelessProxScanDStats");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[4] = v8;
    v20[5] = CFSTR("CBDiscoveryStats");
    objc_msgSend(a1, "entryEventBackwardDefinitionCBDiscoveryStats");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[5] = v17;
    v20[6] = CFSTR("A2DPPower");
    objc_msgSend(a1, "entryEventBackwardDefinitionA2DPPower");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[6] = v13;
    v20[7] = CFSTR("HFPPower");
    objc_msgSend(a1, "entryEventBackwardDefinitionAHFPPower");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[7] = v14;
    v20[8] = CFSTR("BTWakeupVSE");
    objc_msgSend(a1, "entryEventBackwardWakeupVSE");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[8] = v15;
    v20[9] = CFSTR("MaxDutyCycle");
    objc_msgSend(a1, "entryEventBackwardDefinitionMaxDutyCycle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[9] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 10);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18[0] = CFSTR("HCITrace");
    objc_msgSend(a1, "entryEventBackwardDefinitionHCITrace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v4;
    v18[1] = CFSTR("MaxDutyCycle");
    objc_msgSend(a1, "entryEventBackwardDefinitionMaxDutyCycle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v5;
    v18[2] = CFSTR("PowerProfileStats");
    objc_msgSend(a1, "entryEventBackwardDefinitionPowerProfileStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v6;
    v18[3] = CFSTR("WirelessProxScanDStats");
    objc_msgSend(a1, "entryEventBackwardDefinitionWirelessProxScanDStats");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v7;
    v18[4] = CFSTR("CBDiscoveryStats");
    objc_msgSend(a1, "entryEventBackwardDefinitionCBDiscoveryStats");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[4] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  return v10;
}

+ (id)entryEventBackwardDefinitionAHFPPower
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1E8652BC0;
  v20[1] = CFSTR("log");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("HFPDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("HFPpercantageePA1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("HFPpercentageiPA1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("HFPpercantageePA2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("HFPpercentageiPA2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionA2DPPower
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8652BC0;
  v16[1] = CFSTR("log");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("A2DPDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("A2DPpercantageePA");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("A2DPpercantageiPA");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitionDetailedPowerProfileStats
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  _QWORD v35[14];
  _QWORD v36[14];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[4];

  v40[2] = *MEMORY[0x1E0C80C00];
  v39[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v37[0] = *MEMORY[0x1E0D80318];
  v37[1] = v2;
  v38[0] = &unk_1E8652BC0;
  v38[1] = CFSTR("log");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v34;
  v39[1] = *MEMORY[0x1E0D802F0];
  v35[0] = CFSTR("durationTotal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v32;
  v35[1] = CFSTR("durationActive");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v30;
  v35[2] = CFSTR("durationIdle");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v28;
  v35[3] = CFSTR("durationSleep");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v26;
  v35[4] = CFSTR("disableCounter");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v24;
  v35[5] = CFSTR("iPATxBT");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v22;
  v35[6] = CFSTR("iPATxLE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v20;
  v35[7] = CFSTR("ePATxBT");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v18;
  v35[8] = CFSTR("ePATxLE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[8] = v16;
  v35[9] = CFSTR("connectedRxBT");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[9] = v14;
  v35[10] = CFSTR("connectedRxLE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36[10] = v4;
  v35[11] = CFSTR("scanRxBT");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[11] = v6;
  v35[12] = CFSTR("scanRxLE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[12] = v8;
  v35[13] = CFSTR("totalPHYCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[13] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionHCITrace
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
    return MEMORY[0x1E0C9AA70];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8652BE0;
  v12[1] = CFSTR("log");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("HCIRawData");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_RawDataFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventBackwardDefinitionMaxDutyCycle
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8652BC0;
  v14[1] = CFSTR("log");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("Duration");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventBackwardDefinitionPowerProfileStats
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1E8652BD0;
  v20[1] = CFSTR("log");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("ErrorCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("TXPower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("RXPower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("SleepPower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("OtherPower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionEnhancedPowerProfileStats
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v20;
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
  id v38;
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
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  uint64_t v61;
  void *v62;
  _QWORD v63[2];
  _QWORD v64[2];
  uint64_t v65;
  void *v66;
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[21];
  _QWORD v70[23];

  v70[21] = *MEMORY[0x1E0C80C00];
  v38 = objc_alloc(MEMORY[0x1E0C99E08]);
  v69[0] = CFSTR("ErrorCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v54;
  v69[1] = CFSTR("TXPower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v52;
  v69[2] = CFSTR("RXPower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v50;
  v69[3] = CFSTR("SleepPower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v70[3] = v48;
  v69[4] = CFSTR("OtherPower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v70[4] = v46;
  v69[5] = CFSTR("iPACounter");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v70[5] = v44;
  v69[6] = CFSTR("ePACounter");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v70[6] = v42;
  v69[7] = CFSTR("ActiveDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v70[7] = v40;
  v69[8] = CFSTR("D3SuspendDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v70[8] = v36;
  v69[9] = CFSTR("PerstDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v70[9] = v34;
  v69[10] = CFSTR("DeepSleepDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v70[10] = v32;
  v69[11] = CFSTR("L0Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v70[11] = v30;
  v69[12] = CFSTR("L11Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v70[12] = v28;
  v69[13] = CFSTR("L12Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v70[13] = v26;
  v69[14] = CFSTR("L2Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v70[14] = v24;
  v69[15] = CFSTR("BTTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v70[15] = v22;
  v69[16] = CFSTR("epaTransmitPercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v70[16] = v2;
  v69[17] = CFSTR("txbfTransmitPercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v70[17] = v4;
  v69[18] = CFSTR("txbfEpaTransmitPercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v70[18] = v6;
  v69[19] = CFSTR("mrcReceivePercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v70[19] = v8;
  v69[20] = CFSTR("lpScanReceivePercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v70[20] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v38, "initWithDictionary:", v11);

  objc_msgSend(a1, "getScanCoreKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addEntriesFromDictionary:", v12);

  objc_msgSend(a1, "getBluetooth5GKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addEntriesFromDictionary:", v13);

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017))
  {
    v67[0] = *MEMORY[0x1E0D80298];
    v65 = *MEMORY[0x1E0D80318];
    v66 = &unk_1E8652BF0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v67[1] = *MEMORY[0x1E0D802F0];
    v68[0] = v14;
    v68[1] = v39;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = v68;
    v17 = v67;
  }
  else if (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004015))
  {
    v63[0] = *MEMORY[0x1E0D80298];
    v61 = *MEMORY[0x1E0D80318];
    v62 = &unk_1E8652C00;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = *MEMORY[0x1E0D802F0];
    v64[0] = v14;
    v64[1] = v39;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = v64;
    v17 = v63;
  }
  else
  {
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004013) & 1) == 0
      && !objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004014))
    {
      v18 = (void *)MEMORY[0x1E0C9AA70];
      goto LABEL_5;
    }
    v59[0] = *MEMORY[0x1E0D80298];
    v20 = *MEMORY[0x1E0D802F8];
    v57[0] = *MEMORY[0x1E0D80318];
    v57[1] = v20;
    v58[0] = &unk_1E8652C10;
    v58[1] = CFSTR("log");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = *MEMORY[0x1E0D802F0];
    v60[0] = v14;
    v60[1] = v39;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = v60;
    v17 = v59;
  }
  objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return v18;
}

+ (id)getScanCoreKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004015) & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) == 0
    && !objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017))
  {
    return MEMORY[0x1E0C9AA70];
  }
  v14[0] = CFSTR("rxScanPercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = CFSTR("mainCoreELNAOnPercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  v14[2] = CFSTR("mainCoreELNAOffPercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v6;
  v14[3] = CFSTR("scanCoreELNAOnPercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v8;
  v14[4] = CFSTR("scanCoreELNAOffPercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)getBluetooth5GKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[8];
  _QWORD v21[10];

  v21[8] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) == 0
    && !objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017))
  {
    return MEMORY[0x1E0C9AA70];
  }
  v20[0] = CFSTR("iPA5GCounter");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  v20[1] = CFSTR("ePA5GCounter");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v16;
  v20[2] = CFSTR("txbf5GTransmitPercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v14;
  v20[3] = CFSTR("mrc5GReceivePercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v2;
  v20[4] = CFSTR("epa5GTransmitPercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v4;
  v20[5] = CFSTR("txbf5GEpaTransmitPercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v6;
  v20[6] = CFSTR("Duration5GTx");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v8;
  v20[7] = CFSTR("Duration5GRx");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitionThreadRadioPowerProfileStats
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[6];
  _QWORD v26[8];

  v26[6] = *MEMORY[0x1E0C80C00];
  v17 = objc_alloc(MEMORY[0x1E0C99E08]);
  v25[0] = CFSTR("ErrorCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v19;
  v25[1] = CFSTR("RadioTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v2;
  v25[2] = CFSTR("m154TransmitPercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v4;
  v25[3] = CFSTR("m154ReceivePercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v6;
  v25[4] = CFSTR("iPAThreadCounter");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v8;
  v25[5] = CFSTR("ePAThreadCounter");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "initWithDictionary:", v11);

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017))
  {
    v23[0] = *MEMORY[0x1E0D80298];
    v21 = *MEMORY[0x1E0D80318];
    v22 = &unk_1E8652BC0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = *MEMORY[0x1E0D802F0];
    v24[0] = v12;
    v13 = (void *)v18;
    v24[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA70];
    v13 = (void *)v18;
  }

  return v14;
}

+ (id)entryEventBackwardWakeupVSE
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[8];
  _QWORD v25[8];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  v28[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v26[0] = *MEMORY[0x1E0D80318];
  v26[1] = v2;
  v27[0] = &unk_1E8652C20;
  v27[1] = CFSTR("log");
  v3 = *MEMORY[0x1E0D802A0];
  v26[2] = *MEMORY[0x1E0D80250];
  v26[3] = v3;
  v27[2] = MEMORY[0x1E0C9AAB0];
  v27[3] = &unk_1E864FD78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E0D802F0];
  v24[0] = CFSTR("VSEType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  v24[1] = CFSTR("VSEReasonCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  v24[2] = CFSTR("VSEReasonString");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_StringFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  v24[3] = CFSTR("VSERaw");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_RawDataFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v15;
  v24[4] = CFSTR("WakeEventType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v5;
  v24[5] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v7;
  v24[6] = CFSTR("DeviceName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v9;
  v24[7] = CFSTR("PeerType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventBackwardDefinitionWirelessProxScanDStats
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D80348];
  v15[0] = *MEMORY[0x1E0D80358];
  v15[1] = v2;
  v16[0] = &unk_1E86327A8;
  v16[1] = &unk_1E86327C0;
  v15[2] = *MEMORY[0x1E0D80350];
  v16[2] = &unk_1E86327D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = *MEMORY[0x1E0D80298];
  v4 = *MEMORY[0x1E0D802F8];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v4;
  v12[0] = &unk_1E8652C30;
  v12[1] = CFSTR("log");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9[0] = CFSTR("ClientScanDuration");
  v9[1] = CFSTR("ClientAdvDuration");
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = CFSTR("ClientScanConfig");
  v10[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventBackwardDefinitionCBDiscoveryStats
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[7];
  _QWORD v22[7];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[4];

  v26[2] = *MEMORY[0x1E0C80C00];
  v25[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v23[0] = *MEMORY[0x1E0D80318];
  v23[1] = v2;
  v24[0] = &unk_1E8652BC0;
  v24[1] = CFSTR("log");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v20;
  v25[1] = *MEMORY[0x1E0D802F0];
  v21[0] = CFSTR("apID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_StringFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  v21[1] = CFSTR("apIX");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  v21[2] = CFSTR("sonC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  v21[3] = CFSTR("sofC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v4;
  v21[4] = CFSTR("sonD");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v6;
  v21[5] = CFSTR("sofD");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v8;
  v21[6] = CFSTR("dsFl");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventIntervalDefinitions
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[7];
  _QWORD v23[7];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  const __CFString *v28;
  _QWORD v29[3];

  v29[1] = *MEMORY[0x1E0C80C00];
  v28 = CFSTR("ConnectedDevices");
  v26[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v24[0] = *MEMORY[0x1E0D80318];
  v24[1] = v2;
  v25[0] = &unk_1E8652C40;
  v25[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E0D802F0];
  v22[0] = CFSTR("Name");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_StringFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v22[1] = CFSTR("MAC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_StringFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  v22[2] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_DateFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  v22[3] = CFSTR("DeviceType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v3;
  v22[4] = CFSTR("DefaultName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v5;
  v22[5] = CFSTR("IsRequest");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v7;
  v22[6] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat_withBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLBluetoothAgent)init
{
  PLBluetoothAgent *v2;
  PLBluetoothAgent *v3;
  NSString *btHardwareChipset;
  uint64_t v5;
  NSMutableDictionary *ENScanCache;
  SPBeaconManager *v7;
  SPBeaconManager *beaconManager;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLBluetoothAgent;
  v2 = -[PLAgent init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->session = 0;
    v2->localBluetoothDevice = 0;
    btHardwareChipset = v2->_btHardwareChipset;
    v2->_btHardwareChipset = 0;

    v3->_logCount = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    ENScanCache = v3->_ENScanCache;
    v3->_ENScanCache = (NSMutableDictionary *)v5;

    v7 = (SPBeaconManager *)objc_alloc_init(MEMORY[0x1E0D898D8]);
    beaconManager = v3->_beaconManager;
    v3->_beaconManager = v7;

    -[PLBluetoothAgent attachSession](v3, "attachSession");
  }
  return v3;
}

- (void)initOperatorDependancies
{
  uint64_t v3;
  PLEntryNotificationOperatorComposition *v4;
  PLEntryNotificationOperatorComposition *batteryLevelChanged;
  PLEntryNotificationOperatorComposition *v6;
  PLEntryNotificationOperatorComposition *sbcChanged;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  PLNSNotificationOperatorComposition *v21;
  PLNSNotificationOperatorComposition *thermalMonitorListener;
  PLXPCListenerOperatorComposition *v23;
  PLXPCListenerOperatorComposition *magnetListener;
  PLXPCListenerOperatorComposition *v25;
  PLXPCListenerOperatorComposition *magnetOperationListener;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD block[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[6];

  v3 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke;
  v40[3] = &unk_1E8577F48;
  v40[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v40);
  v4 = (PLEntryNotificationOperatorComposition *)objc_claimAutoreleasedReturnValue();
  batteryLevelChanged = self->_batteryLevelChanged;
  self->_batteryLevelChanged = v4;

  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D7FFA0], "isDevBoard"))
  {
    v39[0] = v3;
    v39[1] = 3221225472;
    v39[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2;
    v39[3] = &unk_1E8577F48;
    v39[4] = self;
    objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v39);
    v6 = (PLEntryNotificationOperatorComposition *)objc_claimAutoreleasedReturnValue();
    sbcChanged = self->_sbcChanged;
    self->_sbcChanged = v6;

  }
  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) == 0)
  {
    v38[0] = v3;
    v38[1] = 3221225472;
    v38[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_279;
    v38[3] = &unk_1E8578610;
    v38[4] = self;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B950, v38);
    -[PLBluetoothAgent setLeConnectionListener:](self, "setLeConnectionListener:", v8);

  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
  {
    v37[0] = v3;
    v37[1] = 3221225472;
    v37[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_293;
    v37[3] = &unk_1E8578610;
    v37[4] = self;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B978, v37);
    -[PLBluetoothAgent setBtHCIListener:](self, "setBtHCIListener:", v9);

  }
  v36[0] = v3;
  v36[1] = 3221225472;
  v36[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_300;
  v36[3] = &unk_1E8578610;
  v36[4] = self;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B9A0, v36);
  -[PLBluetoothAgent setWirelessProxListener:](self, "setWirelessProxListener:", v10);
  v35[0] = v3;
  v35[1] = 3221225472;
  v35[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_309;
  v35[3] = &unk_1E8578610;
  v35[4] = self;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B9C8, v35);
  -[PLBluetoothAgent setCBDiscoveryListener:](self, "setCBDiscoveryListener:", v11);
  v34[0] = v3;
  v34[1] = 3221225472;
  v34[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_318;
  v34[3] = &unk_1E8578610;
  v34[4] = self;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B9F0, v34);
  -[PLBluetoothAgent setENListener:](self, "setENListener:", v12);

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004007) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004010) & 1) != 0
    || +[PLBluetoothAgent shouldLogEnhancedStats](PLBluetoothAgent, "shouldLogEnhancedStats"))
  {
    v33[0] = v3;
    v33[1] = 3221225472;
    v33[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_333;
    v33[3] = &unk_1E8578610;
    v33[4] = self;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864BA18, v33);
    -[PLBluetoothAgent setBtA2DPListener:](self, "setBtA2DPListener:", v13);
    v32[0] = v3;
    v32[1] = 3221225472;
    v32[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_340;
    v32[3] = &unk_1E8578610;
    v32[4] = self;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864BA40, v32);
    -[PLBluetoothAgent setBtHFPListener:](self, "setBtHFPListener:", v14);

  }
  if (+[PLBluetoothAgent shouldLogMarconi](PLBluetoothAgent, "shouldLogMarconi")
    || +[PLBluetoothAgent shouldLogEnhancedStats](PLBluetoothAgent, "shouldLogEnhancedStats"))
  {
    v31[0] = v3;
    v31[1] = 3221225472;
    v31[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_347;
    v31[3] = &unk_1E8578610;
    v31[4] = self;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864BA68, v31);
    -[PLBluetoothAgent setBtHCIVSEListener:](self, "setBtHCIVSEListener:", v15);

  }
  v16 = dispatch_time(0, 2000000000);
  -[PLOperator workQueue](self, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_349;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_after(v16, v17, block);

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 47, &unk_1E864BA90, v18);

  if (objc_msgSend(MEMORY[0x1E0D80020], "isiPhone"))
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 45, &unk_1E864BAB8, v18);

  }
  v29[0] = v3;
  v29[1] = 3221225472;
  v29[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_365;
  v29[3] = &unk_1E8577F48;
  v29[4] = self;
  v21 = (PLNSNotificationOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80010]), "initWithOperator:forNotification:withBlock:", self, CFSTR("PLThermalMonitorNotification"), v29);
  thermalMonitorListener = self->_thermalMonitorListener;
  self->_thermalMonitorListener = v21;

  v28[0] = v3;
  v28[1] = 3221225472;
  v28[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_371;
  v28[3] = &unk_1E8578610;
  v28[4] = self;
  v23 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864BAE0, v28);
  magnetListener = self->_magnetListener;
  self->_magnetListener = v23;

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
  {
    v27[0] = v3;
    v27[1] = 3221225472;
    v27[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_380;
    v27[3] = &unk_1E8578610;
    v27[4] = self;
    v25 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864BB08, v27);
    magnetOperationListener = self->_magnetOperationListener;
    self->_magnetOperationListener = v25;

  }
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "logwithBTOnCheck");
  objc_msgSend(*(id *)(a1 + 32), "ENScanCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "ENScanCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventBackwardMaxDutyCycle:", v5);

    objc_msgSend(*(id *)(a1 + 32), "ENScanCache");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

  }
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logwithBTOnCheck");
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_279(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_280;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (qword_1ED882A88 != -1)
      dispatch_once(&qword_1ED882A88, &block);
    if (_MergedGlobals_1_21)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("got callback! %@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 761);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalLeConnectedDevices:withRequest:", v6, 0);

}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_280(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_21 = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_293(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_294;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (qword_1ED882A90 != -1)
      dispatch_once(&qword_1ED882A90, &block);
    if (byte_1ED882A39)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("got callback! %@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 773);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalHCIRawData:", v6);

}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_294(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A39 = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_301;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (qword_1ED882A98 != -1)
      dispatch_once(&qword_1ED882A98, &block);
    if (byte_1ED882A3A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WirelessProximityListener got callback! %@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 783);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardWirelessProximity:", v6);

}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_301(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A3A = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_309(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_310;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (qword_1ED882AA0 != -1)
      dispatch_once(&qword_1ED882AA0, &block);
    if (byte_1ED882A3B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CBDiscoveryScanListener got callback! %@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 792);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardCBDiscovery:", v6);

}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_310(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A3B = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
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
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  uint64_t v34;
  _QWORD block[5];
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  v7 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_319;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED882AA8 != -1)
      dispatch_once(&qword_1ED882AA8, block);
    if (byte_1ED882A3C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EN BT Status Listener got callback! %@"), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent initOperatorDependancies]_block_invoke");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 800);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CTScanCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ENScanCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("Count"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CTScanDuration"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ENScanCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("Duration"));

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v30 = v8;
    v31 = 3221225472;
    v32 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_324;
    v33 = &__block_descriptor_40_e5_v8__0lu32l8;
    v34 = objc_opt_class();
    if (qword_1ED882AB0 != -1)
      dispatch_once(&qword_1ED882AB0, &v30);
    if (byte_1ED882A3D)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "ENScanCache");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "ENScanCache");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Duration"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("Updated Cache to %@ %@!"), v21, v23, v30, v31, v32, v33, v34);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent initOperatorDependancies]_block_invoke_2");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 803);

      PLLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v24;
        _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_319(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A3C = result;
  return result;
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_324(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A3D = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_333(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_334;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (qword_1ED882AB8 != -1)
      dispatch_once(&qword_1ED882AB8, &block);
    if (byte_1ED882A3E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("got callback! %@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 812);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardA2DP:", v6);

}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_334(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A3E = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_341;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (qword_1ED882AC0 != -1)
      dispatch_once(&qword_1ED882AC0, &block);
    if (byte_1ED882A3F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("got callback! %@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 820);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardHFP:", v6);

}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_341(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A3F = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_347(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_348;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (qword_1ED882AC8 != -1)
      dispatch_once(&qword_1ED882AC8, &block);
    if (byte_1ED882A40)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("got callback! %@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 830);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalWakeVSE:", v6);

}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_348(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A40 = result;
  return result;
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_349(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isConnected");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "logEventIntervalConnectedDevices");
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_365(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t block;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_3;
    v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    v15 = v4;
    if (qword_1ED882AD0 != -1)
      dispatch_once(&qword_1ED882AD0, &block);
    if (byte_1ED882A41)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notification from ThermalMonitor: %@"), v3, block, v12, v13, v14, v15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent initOperatorDependancies]_block_invoke_2");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 860);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardPowerProfileStats");

}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A41 = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_371(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_372;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (qword_1ED882AD8 != -1)
      dispatch_once(&qword_1ED882AD8, &block);
    if (byte_1ED882A42)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Magnet Listener Payload %@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 871);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventPointMagnet:", v6);

}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_372(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A42 = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_381;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (qword_1ED882AE0 != -1)
      dispatch_once(&qword_1ED882AE0, &block);
    if (byte_1ED882A43)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Magnet Operation Listener Payload %@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 880);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventPointMagnetOperation:", v6);

}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_381(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A43 = result;
  return result;
}

- (void)logEventPointMagnet:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", v4, CFSTR("Magnet"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointMagnetOperation:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", v4, CFSTR("MagnetOperation"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_super v12;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  self->keepSessionAlive = 0;
  if (self->session)
  {
    v3 = BTSessionDetachWithQueue();
    if ((_DWORD)v3)
    {
      v4 = v3;
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v5 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __27__PLBluetoothAgent_dealloc__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v5;
        if (qword_1ED882AE8 != -1)
          dispatch_once(&qword_1ED882AE8, block);
        if (byte_1ED882A44)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not detach the Bluetooth session. (error: %d)"), v4);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "lastPathComponent");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent dealloc]");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 916);

          PLLogCommon();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v15 = v6;
            _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PLBluetoothAgent;
  -[PLAgent dealloc](&v12, sel_dealloc);
}

uint64_t __27__PLBluetoothAgent_dealloc__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A44 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_localBluetoothDevice__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A45 = result;
  return result;
}

- (BOOL)bluetoothPresent
{
  return -[PLBluetoothAgent localBluetoothDevice](self, "localBluetoothDevice") != 0;
}

- (BOOL)modulePowered
{
  uint64_t ModulePower;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  int v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  -[PLBluetoothAgent localBluetoothDevice](self, "localBluetoothDevice");
  ModulePower = BTLocalDeviceGetModulePower();
  if ((_DWORD)ModulePower)
  {
    v3 = ModulePower;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v4 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __33__PLBluetoothAgent_modulePowered__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (qword_1ED882AF8 != -1)
        dispatch_once(&qword_1ED882AF8, block);
      if (byte_1ED882A46)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bluetooth power ERROR: BTLocalDeviceGetModulePower: failed! %d\n"), v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modulePowered]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 959);

        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v5;
          _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  return v13 == -1;
}

uint64_t __33__PLBluetoothAgent_modulePowered__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A46 = result;
  return result;
}

- (BOOL)isDiscoverable
{
  uint64_t Discoverable;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  int v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  -[PLBluetoothAgent localBluetoothDevice](self, "localBluetoothDevice");
  Discoverable = BTLocalDeviceGetDiscoverable();
  if ((_DWORD)Discoverable)
  {
    v3 = Discoverable;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v4 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __34__PLBluetoothAgent_isDiscoverable__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (qword_1ED882B00 != -1)
        dispatch_once(&qword_1ED882B00, block);
      if (byte_1ED882A47)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bluetooth power ERROR: BTLocalDeviceGetDiscoverable: failed! %d\n"), v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent isDiscoverable]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 975);

        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v5;
          _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  return v13 == -1;
}

uint64_t __34__PLBluetoothAgent_isDiscoverable__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A47 = result;
  return result;
}

- (BOOL)isConnected
{
  uint64_t ConnectionStatus;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  int v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  -[PLBluetoothAgent localBluetoothDevice](self, "localBluetoothDevice");
  ConnectionStatus = BTLocalDeviceGetConnectionStatus();
  if ((_DWORD)ConnectionStatus)
  {
    v3 = ConnectionStatus;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v4 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __31__PLBluetoothAgent_isConnected__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (qword_1ED882B08 != -1)
        dispatch_once(&qword_1ED882B08, block);
      if (byte_1ED882A48)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bluetooth power ERROR: BTLocalDeviceGetConnectionStatus: failed! %d\n"), v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent isConnected]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 995);

        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v5;
          _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  return v13 == -1;
}

uint64_t __31__PLBluetoothAgent_isConnected__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A48 = result;
  return result;
}

- (BOOL)isConnectable
{
  uint64_t Connectable;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  int v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  -[PLBluetoothAgent localBluetoothDevice](self, "localBluetoothDevice");
  Connectable = BTLocalDeviceGetConnectable();
  if ((_DWORD)Connectable)
  {
    v3 = Connectable;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v4 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __33__PLBluetoothAgent_isConnectable__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (qword_1ED882B10 != -1)
        dispatch_once(&qword_1ED882B10, block);
      if (byte_1ED882A49)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bluetooth power ERROR: BTLocalDeviceGetConnectable: failed! %d\n"), v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent isConnectable]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1018);

        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v5;
          _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  return v13 == -1;
}

uint64_t __33__PLBluetoothAgent_isConnectable__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A49 = result;
  return result;
}

- (void)attachSession
{
  NSObject *v3;
  _QWORD block[5];

  -[PLOperator workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PLBluetoothAgent_attachSession__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __33__PLBluetoothAgent_attachSession__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v2 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __33__PLBluetoothAgent_attachSession__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v2;
      if (qword_1ED882B18 != -1)
        dispatch_once(&qword_1ED882B18, block);
      if (byte_1ED882A4A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempting to attach to session"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastPathComponent");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent attachSession]_block_invoke");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 1038);

        PLLogCommon();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v3;
          _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("PowerLogV2-%@-%u"), v11, getpid());
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_retainAutorelease(v12);
    objc_msgSend(v13, "cStringUsingEncoding:", 4);
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = BTSessionAttachWithQueue();

    if ((_DWORD)v15 && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v16 = objc_opt_class();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __33__PLBluetoothAgent_attachSession__block_invoke_406;
      v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v23[4] = v16;
      if (qword_1ED882B20 != -1)
        dispatch_once(&qword_1ED882B20, v23);
      if (byte_1ED882A4B)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: Could not attach the Bluetooth session. (error: %d)"), v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent attachSession]_block_invoke_2");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 1043);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v17;
          _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }

  }
}

uint64_t __33__PLBluetoothAgent_attachSession__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A4A = result;
  return result;
}

uint64_t __33__PLBluetoothAgent_attachSession__block_invoke_406(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A4B = result;
  return result;
}

- (void)sessionAttached:(BTSessionImpl *)a3 withResult:(int)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  dispatch_time_t v22;
  NSObject *v23;
  _QWORD block[5];
  _QWORD v25[5];
  _QWORD v26[5];
  __int128 v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v27 = xmmword_1E857A1C8;
  v28 = 0;
  if (a4)
  {
    v5 = *(_QWORD *)&a4;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled", a3))
    {
      v6 = objc_opt_class();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __47__PLBluetoothAgent_sessionAttached_withResult___block_invoke;
      v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v26[4] = v6;
      if (qword_1ED882B28 != -1)
        dispatch_once(&qword_1ED882B28, v26);
      if (byte_1ED882A4C)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not attach session. (error: %d)"), v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent sessionAttached:withResult:]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 1055);

        PLLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v7;
          _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  else
  {
    if (self->session != a3)
      self->session = a3;
    -[PLBluetoothAgent localBluetoothDevice](self, "localBluetoothDevice");
    v13 = BTLocalDeviceAddCallbacks();
    if ((_DWORD)v13)
    {
      v14 = v13;
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v15 = objc_opt_class();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __47__PLBluetoothAgent_sessionAttached_withResult___block_invoke_414;
        v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v25[4] = v15;
        if (qword_1ED882B30 != -1)
          dispatch_once(&qword_1ED882B30, v25);
        if (byte_1ED882A4D)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not add local device callbacks. (error: %d)"), v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "lastPathComponent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent sessionAttached:withResult:]");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 1065);

          PLLogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v16;
            _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
    }
    v22 = dispatch_time(0, 2000000000);
    -[PLOperator workQueue](self, "workQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLBluetoothAgent_sessionAttached_withResult___block_invoke_417;
    block[3] = &unk_1E85780C8;
    block[4] = self;
    dispatch_after(v22, v23, block);

  }
}

uint64_t __47__PLBluetoothAgent_sessionAttached_withResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A4C = result;
  return result;
}

uint64_t __47__PLBluetoothAgent_sessionAttached_withResult___block_invoke_414(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A4D = result;
  return result;
}

uint64_t __47__PLBluetoothAgent_sessionAttached_withResult___block_invoke_417(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[6];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  block[5] = 0;
  objc_msgSend(*(id *)(a1 + 32), "localBluetoothDevice");
  v2 = BTLocalDeviceRegisterForPowerProfileStatistics();
  if ((_DWORD)v2)
  {
    v3 = v2;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v4 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__PLBluetoothAgent_sessionAttached_withResult___block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (qword_1ED882B38 != -1)
        dispatch_once(&qword_1ED882B38, block);
      if (byte_1ED882A4E)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not register for Power notifications. (error: %d)"), v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent sessionAttached:withResult:]_block_invoke");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1075);

        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v5;
          _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 176);
  *(_QWORD *)(v11 + 176) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "log");
}

uint64_t __47__PLBluetoothAgent_sessionAttached_withResult___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A4E = result;
  return result;
}

- (void)sessionTerminated:(BTSessionImpl *)a3 withResult:(int)a4
{
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
  _QWORD v17[4];
  id v18;
  _QWORD block[5];
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  self->session = 0;
  self->localBluetoothDevice = 0;
  if (self->keepSessionAlive)
  {
    v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled", a3, *(_QWORD *)&a4);
    v6 = MEMORY[0x1E0C809B0];
    if (v5)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__PLBluetoothAgent_sessionTerminated_withResult___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = objc_opt_class();
      if (qword_1ED882B40 != -1)
        dispatch_once(&qword_1ED882B40, block);
      if (byte_1ED882A4F)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Connection to bluetoothd lost - attempting a reconnect in %d seconds"), 30);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent sessionTerminated:withResult:]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 1093);

        PLLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v7;
          _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)location, 0xCu);
        }

      }
    }
    objc_initWeak(location, self);
    v13 = objc_alloc(MEMORY[0x1E0D80070]);
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDateWithTimeIntervalSinceNow:", 30.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator workQueue](self, "workQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __49__PLBluetoothAgent_sessionTerminated_withResult___block_invoke_423;
    v17[3] = &unk_1E8578C50;
    objc_copyWeak(&v18, location);
    v16 = (void *)objc_msgSend(v13, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v14, 0, 0, v15, v17, 0.0, 0.0);

    objc_msgSend(v16, "arm");
    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }
}

uint64_t __49__PLBluetoothAgent_sessionTerminated_withResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A4F = result;
  return result;
}

void __49__PLBluetoothAgent_sessionTerminated_withResult___block_invoke_423(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "attachSession");

}

- (void)bluetoothSessionEvent:(int)a3 onSession:(BTSessionImpl *)a4 withResult:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    -[PLBluetoothAgent sessionTerminated:withResult:](self, "sessionTerminated:withResult:", a4, *(_QWORD *)&a5);
  }
  else
  {
    v5 = *(_QWORD *)&a3;
    if (a3)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled", *(_QWORD *)&a3, a4, *(_QWORD *)&a5))
      {
        v6 = objc_opt_class();
        block = MEMORY[0x1E0C809B0];
        v14 = 3221225472;
        v15 = __63__PLBluetoothAgent_bluetoothSessionEvent_onSession_withResult___block_invoke;
        v16 = &__block_descriptor_40_e5_v8__0lu32l8;
        v17 = v6;
        if (qword_1ED882B48 != -1)
          dispatch_once(&qword_1ED882B48, &block);
        if (byte_1ED882A50)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected Bluetooth session event. (event: %d)"), v5, block, v14, v15, v16, v17);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastPathComponent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent bluetoothSessionEvent:onSession:withResult:]");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 1117);

          PLLogCommon();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v7;
            _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
    }
    else
    {
      -[PLBluetoothAgent sessionAttached:withResult:](self, "sessionAttached:withResult:", a4, *(_QWORD *)&a5);
    }
  }
}

uint64_t __63__PLBluetoothAgent_bluetoothSessionEvent_onSession_withResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A50 = result;
  return result;
}

- (void)bluetoothDeviceEvent:(int)a3 onDevice:(BTLocalDeviceImpl *)a4 withResult:(int)a5
{
  uint64_t v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v5 = *(_QWORD *)&a3;
  v41 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled", *(_QWORD *)&a3, a4, *(_QWORD *)&a5))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PLBluetoothAgent_bluetoothDeviceEvent_onDevice_withResult___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (qword_1ED882B50 != -1)
      dispatch_once(&qword_1ED882B50, block);
    if (byte_1ED882A51)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bluetooth callback code: %u"), v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent bluetoothDeviceEvent:onDevice:withResult:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 1122);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (v5 >= 4)
  {
    if ((_DWORD)v5 == 4)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v21 = objc_opt_class();
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __61__PLBluetoothAgent_bluetoothDeviceEvent_onDevice_withResult___block_invoke_431;
        v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v37[4] = v21;
        if (qword_1ED882B58 != -1)
          dispatch_once(&qword_1ED882B58, v37);
        if (byte_1ED882A52)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Pairing status changed"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "lastPathComponent");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent bluetoothDeviceEvent:onDevice:withResult:]");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 1134);

          PLLogCommon();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v40 = v22;
            _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
        -[PLBluetoothAgent logEventForwardPairedDevices](self, "logEventForwardPairedDevices");
    }
    else if ((_DWORD)v5 == 5)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v14 = objc_opt_class();
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __61__PLBluetoothAgent_bluetoothDeviceEvent_onDevice_withResult___block_invoke_436;
        v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v36[4] = v14;
        if (qword_1ED882B60 != -1)
          dispatch_once(&qword_1ED882B60, v36);
        if (byte_1ED882A53)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Connection status changed"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lastPathComponent");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent bluetoothDeviceEvent:onDevice:withResult:]");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 1140);

          PLLogCommon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v40 = v15;
            _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
        -[PLBluetoothAgent logEventIntervalConnectedDevices](self, "logEventIntervalConnectedDevices");
    }
    else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v28 = objc_opt_class();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __61__PLBluetoothAgent_bluetoothDeviceEvent_onDevice_withResult___block_invoke_441;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = v28;
      if (qword_1ED882B68 != -1)
        dispatch_once(&qword_1ED882B68, v35);
      if (byte_1ED882A54)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: Unwanted event code for bluetooth callback: %u"), v5);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "lastPathComponent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent bluetoothDeviceEvent:onDevice:withResult:]");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v32, v33, 1146);

        PLLogCommon();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v29;
          _os_log_debug_impl(&dword_1CAF47000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  else
  {
    -[PLBluetoothAgent logEventForwardDeviceState](self, "logEventForwardDeviceState");
  }
}

uint64_t __61__PLBluetoothAgent_bluetoothDeviceEvent_onDevice_withResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A51 = result;
  return result;
}

uint64_t __61__PLBluetoothAgent_bluetoothDeviceEvent_onDevice_withResult___block_invoke_431(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A52 = result;
  return result;
}

uint64_t __61__PLBluetoothAgent_bluetoothDeviceEvent_onDevice_withResult___block_invoke_436(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A53 = result;
  return result;
}

uint64_t __61__PLBluetoothAgent_bluetoothDeviceEvent_onDevice_withResult___block_invoke_441(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A54 = result;
  return result;
}

- (void)log
{
  void *v3;
  double v4;
  double v5;

  if (-[PLBluetoothAgent modulePowered](self, "modulePowered"))
  {
    if (!self->_lastPowerEntryDate
      || (objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "timeIntervalSinceDate:", self->_lastPowerEntryDate),
          v5 = v4,
          v3,
          v5 > 60.0))
    {
      -[PLBluetoothAgent logEventBackwardPowerProfileStats](self, "logEventBackwardPowerProfileStats");
    }
  }
  -[PLBluetoothAgent logEventForwardDeviceState](self, "logEventForwardDeviceState");
}

- (void)logwithBTOnCheck
{
  if (-[PLBluetoothAgent modulePowered](self, "modulePowered"))
    -[PLBluetoothAgent log](self, "log");
  else
    -[PLBluetoothAgent modelBluetoothOffPower](self, "modelBluetoothOffPower");
}

- (void)logEventForwardDeviceState
{
  _BOOL8 v3;
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("DeviceState"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PLBluetoothAgent modulePowered](self, "modulePowered");
  v4 = -[PLBluetoothAgent isDiscoverable](self, "isDiscoverable");
  v5 = -[PLBluetoothAgent isConnected](self, "isConnected");
  v6 = -[PLBluetoothAgent isConnectable](self, "isConnectable");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("DevicePowered"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("DeviceDiscoverable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("DeviceConnected"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("DeviceConnectable"));

  -[PLOperator logEntry:](self, "logEntry:", v7);
}

- (void)logEventForwardPairedDevices
{
  void *v3;
  uint64_t PairedDevices;
  unint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  unint64_t v24;
  uint64_t v25;
  PLBluetoothAgent *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  __int128 v49;
  uint64_t *v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[5];
  _QWORD block[5];
  _QWORD v55[5];
  _QWORD v56[5];
  unint64_t v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[31];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v57 = 0;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBluetoothAgent localBluetoothDevice](self, "localBluetoothDevice");
  PairedDevices = BTLocalDeviceGetPairedDevices();
  v5 = 0x1E0D7F000uLL;
  v6 = (uint64_t *)MEMORY[0x1E0D80378];
  v7 = 0x1E0D7F000uLL;
  v51 = v3;
  if ((_DWORD)PairedDevices)
  {
    v8 = PairedDevices;
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_29;
    v9 = objc_opt_class();
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __48__PLBluetoothAgent_logEventForwardPairedDevices__block_invoke;
    v56[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v56[4] = v9;
    if (qword_1ED882B70 != -1)
      dispatch_once(&qword_1ED882B70, v56);
    if (!byte_1ED882A55)
      goto LABEL_29;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bluetooth power ERROR: BTLocalDeviceGetPairedDevices: failed! %d\n"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventForwardPairedDevices]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 1260);

    PLLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v93) = 138412290;
      *(_QWORD *)((char *)&v93 + 4) = v10;
      _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v93, 0xCu);
    }

    v3 = v51;
    v7 = 0x1E0D7F000uLL;
    v6 = (uint64_t *)MEMORY[0x1E0D80378];
LABEL_28:
    v5 = 0x1E0D7F000uLL;
LABEL_29:
    if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
    {
      v38 = objc_opt_class();
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __48__PLBluetoothAgent_logEventForwardPairedDevices__block_invoke_459;
      v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v53[4] = v38;
      if (qword_1ED882B88 != -1)
        dispatch_once(&qword_1ED882B88, v53);
      if (byte_1ED882A58)
      {
        v39 = v7;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No BT paired device, nothing to log"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "lastPathComponent");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventForwardPairedDevices]");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v43, v44, 1289);

        PLLogCommon();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(v93) = 138412290;
          *(_QWORD *)((char *)&v93 + 4) = v40;
          _os_log_debug_impl(&dword_1CAF47000, v45, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v93, 0xCu);
        }

        v3 = v51;
        v7 = v39;
        v6 = (uint64_t *)MEMORY[0x1E0D80378];
      }
    }
    +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", *v6, CFSTR("PairedDevices"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(objc_alloc(*(Class *)(v7 + 4016)), "initWithEntryKey:", v46);
    objc_msgSend(v47, "setIsErrorEntry:", 1);
    objc_msgSend(v47, "setObject:forKeyedSubscript:", CFSTR("No BT paired device, nothing to log"), CFSTR("__PLEntryErrorString__"));
    -[PLOperator logEntry:](self, "logEntry:", v47);

    goto LABEL_37;
  }
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  memset(v76, 0, sizeof(v76));
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v62 = 0u;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v17 = objc_opt_class();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __48__PLBluetoothAgent_logEventForwardPairedDevices__block_invoke_449;
    v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v55[4] = v17;
    if (qword_1ED882B78 != -1)
      dispatch_once(&qword_1ED882B78, v55);
    if (byte_1ED882A56)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bluetooth: No devices paired"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventForwardPairedDevices]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 1266);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v18;
        _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v3 = v51;
      v7 = 0x1E0D7F000;
      v6 = (uint64_t *)MEMORY[0x1E0D80378];
    }
  }
  if (!v57)
    goto LABEL_28;
  v50 = &v48;
  v24 = 0;
  v52 = *v6;
  *(_QWORD *)&v16 = 138412290;
  v49 = v16;
  do
  {
    BTDeviceGetAddressString();
    BTDeviceGetDefaultName();
    BTDeviceGetName();
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v25 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__PLBluetoothAgent_logEventForwardPairedDevices__block_invoke_454;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v25;
      if (qword_1ED882B80 != -1)
        dispatch_once(&qword_1ED882B80, block);
      if (byte_1ED882A57)
      {
        v26 = self;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bluetooth: Local device is paired to device : \"%s\" (%s) with mac : %s\n"), &v93, &v77, &v62);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastPathComponent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventForwardPairedDevices]");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 1273);

        PLLogCommon();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v49;
          v61 = v27;
          _os_log_debug_impl(&dword_1CAF47000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        self = v26;
        v3 = v51;
        v7 = 0x1E0D7F000uLL;
      }
    }
    +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", v52, CFSTR("PairedDevices"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(objc_alloc(*(Class *)(v7 + 4016)), "initWithEntryKey:", v33);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v77);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v35, CFSTR("PairedDevicesDefaultName"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v93);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v36, CFSTR("PairedDevicesName"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v62);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v37, CFSTR("PairedDevicesMac"));

    objc_msgSend(v34, "setEntryDate:", v3);
    -[PLOperator logEntry:](self, "logEntry:", v34);
    v62 = 0uLL;
    *(_QWORD *)&v63 = 0;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;

    ++v24;
  }
  while (v24 < v57);
  v6 = (uint64_t *)MEMORY[0x1E0D80378];
  v5 = 0x1E0D7F000;
  if (!v57)
    goto LABEL_29;
LABEL_37:

}

uint64_t __48__PLBluetoothAgent_logEventForwardPairedDevices__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A55 = result;
  return result;
}

uint64_t __48__PLBluetoothAgent_logEventForwardPairedDevices__block_invoke_449(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A56 = result;
  return result;
}

uint64_t __48__PLBluetoothAgent_logEventForwardPairedDevices__block_invoke_454(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A57 = result;
  return result;
}

uint64_t __48__PLBluetoothAgent_logEventForwardPairedDevices__block_invoke_459(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A58 = result;
  return result;
}

- (void)logEventIntervalLeConnectedDevices:(id)a3 withRequest:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t);
  void *v42;
  uint64_t v43;
  _QWORD block[5];
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v4 = a4;
  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("ConnectedDevices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v7);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEntryDate:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("IsRequest"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PeerType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    goto LABEL_5;
  v13 = objc_msgSend(v11, "intValue");
  if (v13 == 2)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = 42;
    goto LABEL_7;
  }
  if (v13 != 1)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 48);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("DeviceType"));

    goto LABEL_8;
  }
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = 12;
LABEL_7:
  objc_msgSend(v14, "numberWithInt:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("DeviceType"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsRequest"));
LABEL_8:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Connect"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqual:", v19);

  v21 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  if (v20)
  {
    if (v21)
    {
      v22 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__PLBluetoothAgent_logEventIntervalLeConnectedDevices_withRequest___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v22;
      if (qword_1ED882B90 != -1)
        dispatch_once(&qword_1ED882B90, block);
      if (byte_1ED882A59)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BTLE disconnect"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lastPathComponent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventIntervalLeConnectedDevices:withRequest:]");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 1336);

        PLLogCommon();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v23;
          _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, CFSTR("timestampEnd"));

  }
  else
  {
    if (v21)
    {
      v30 = objc_opt_class();
      v39 = MEMORY[0x1E0C809B0];
      v40 = 3221225472;
      v41 = __67__PLBluetoothAgent_logEventIntervalLeConnectedDevices_withRequest___block_invoke_470;
      v42 = &__block_descriptor_40_e5_v8__0lu32l8;
      v43 = v30;
      if (qword_1ED882B98 != -1)
        dispatch_once(&qword_1ED882B98, &v39);
      if (byte_1ED882A5A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BTLE connect"), v39, v40, v41, v42, v43);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "lastPathComponent");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventIntervalLeConnectedDevices:withRequest:]");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 1340);

        PLLogCommon();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v31;
          _os_log_debug_impl(&dword_1CAF47000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, CFSTR("timestampEnd"), v39, v40, v41, v42, v43);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CBUUID"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v37, CFSTR("Name"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleID"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v38, CFSTR("BundleID"));

  -[PLOperator logEntry:](self, "logEntry:", v8);
}

uint64_t __67__PLBluetoothAgent_logEventIntervalLeConnectedDevices_withRequest___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A59 = result;
  return result;
}

uint64_t __67__PLBluetoothAgent_logEventIntervalLeConnectedDevices_withRequest___block_invoke_470(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A5A = result;
  return result;
}

- (void)logEventIntervalHCIRawData:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D7FFA0];
  v5 = a3;
  if (objc_msgSend(v4, "debugEnabled"))
  {
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLBluetoothAgent_logEventIntervalHCIRawData___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1ED882BA0 != -1)
      dispatch_once(&qword_1ED882BA0, block);
    if (byte_1ED882A5B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inside HCI trace callback logEventIntervalHCIRawData"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventIntervalHCIRawData:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 1354);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("HCITrace"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v13);
  objc_msgSend(v5, "objectForKey:", CFSTR("HCITrace"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("HCIRawData"));
  -[PLOperator logEntry:](self, "logEntry:", v14);

}

uint64_t __47__PLBluetoothAgent_logEventIntervalHCIRawData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A5B = result;
  return result;
}

- (id)advertisingDataDescription:(const char *)a3 :(unint64_t)a4
{
  id v6;
  unint64_t v7;
  BOOL v8;
  int v9;
  int v11;
  int v12;

  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (a4 >= 2)
  {
    do
    {
      v7 = *(unsigned __int8 *)a3;
      if (*a3)
        v8 = a4 > v7;
      else
        v8 = 0;
      if (!v8)
        break;
      v9 = *((unsigned __int8 *)a3 + 1);
      if (v9 == 255)
      {
        if (v7 >= 5 && a3[2] == 76)
        {
          v11 = 4;
          do
          {
            v12 = v11 + (a3[(v11 + 1)] & 0x1F);
            objc_msgSend(v6, "appendFormat:", CFSTR(" --%@: %d,"), CFSTR("LE_adv_type"), a3[v11]);
            v11 = v12 + 2;
          }
          while ((int)v7 + 1 >= (v12 + 2) + 2);
        }
      }
      else if (v9 == 1 && v7 >= 2)
      {
        objc_msgSend(v6, "appendFormat:", CFSTR(" Flags: %#04X,"), *((unsigned __int8 *)a3 + 2));
      }
      a3 += v7 + 1;
      a4 -= v7 + 1;
    }
    while (a4 > 1);
  }
  return v6;
}

- (void)logEventIntervalWakeVSE:(id)a3
{
  id v4;
  uint64_t v5;
  PLBluetoothAgent *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unsigned int v25;
  int v26;
  int v27;
  uint64_t v28;
  unsigned __int8 *v29;
  int v31;
  unsigned __int8 *v32;
  _BYTE *v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  BOOL v44;
  BOOL v45;
  void *v46;
  unint64_t v47;
  __CFString *v48;
  __CFString *v49;
  const __CFString *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  PLBluetoothAgent *v56;
  void *v57;
  _QWORD block[5];
  uint8_t buf[4];
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PLBluetoothAgent_logEventIntervalWakeVSE___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED882BA8 != -1)
      dispatch_once(&qword_1ED882BA8, block);
    if (byte_1ED882A5C)
    {
      v6 = self;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wake payload = %@"), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventIntervalWakeVSE:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 1447);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      self = v6;
    }
  }
  +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BTWakeupVSE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v13);
  objc_msgSend(v4, "objectForKey:", CFSTR("WakeEventType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("HostWakeReport"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");
  v57 = v4;
  if (v15)
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("WakeEventType"));
    if ((int)objc_msgSend(v15, "intValue") >= 1)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("BundleID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("BundleID"));

      objc_msgSend(v4, "objectForKey:", CFSTR("DeviceName"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("DeviceName"));

      objc_msgSend(v4, "objectForKey:", CFSTR("PeerType"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("PeerType"));

      objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("VSERaw"));
      v21 = objc_msgSend(v15, "intValue");
      if ((v21 - 1) < 2)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v36, CFSTR("VSEType"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 62013);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v37, CFSTR("VSEReasonCode"));

        if (v16)
        {
          -[PLBluetoothAgent advertisingDataDescription::](self, "advertisingDataDescription::", objc_msgSend(objc_retainAutorelease(v16), "bytes"), v17);
          v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          v40 = CFSTR("undecodable LE ADV");
          if (v38 && -[__CFString length](v38, "length"))
            v40 = v39;
          v41 = CFSTR("VSEReasonString");
          v42 = v14;
          v43 = v40;
          goto LABEL_52;
        }
      }
      else
      {
        if (v21 == 3)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v46, CFSTR("VSEType"));

          v23 = (void *)MEMORY[0x1E0CB37E8];
          v24 = 3000;
          goto LABEL_51;
        }
        if (v21 == 5)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, CFSTR("VSEType"));

          v23 = (void *)MEMORY[0x1E0CB37E8];
          v24 = 5000;
LABEL_51:
          objc_msgSend(v23, "numberWithInt:", v24);
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v41 = CFSTR("VSEReasonCode");
          v42 = v14;
          v43 = v39;
LABEL_52:
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v43, v41);

        }
      }
LABEL_74:
      -[PLOperator logEntry:](self, "logEntry:", v14);
      goto LABEL_75;
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "isWatch"))
    v25 = 2;
  else
    v25 = 0;
  if (v17 < (v25 | 5))
  {
    v26 = 0;
    v27 = 0;
    v28 = 0xFFFFFFFFLL;
LABEL_73:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v28);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v54, CFSTR("VSEType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v26 + 1000 * v27));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v55, CFSTR("VSEReasonCode"));

    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("VSERaw"));
    goto LABEL_74;
  }
  v56 = self;
  v29 = (unsigned __int8 *)(objc_msgSend(objc_retainAutorelease(v16), "bytes") + v25);
  v28 = *v29;
  v27 = v29[1];
  v26 = v29[3];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004014) & 1) != 0
    || ((_DWORD)v28 == 6 ? (v44 = v27 == 0) : (v44 = 0),
        !v44 && ((_DWORD)v28 != 4 || v27 != 62 || (v26 != 2 ? (v45 = v26 == 13) : (v45 = 1), !v45))))
  {
    if (objc_msgSend(MEMORY[0x1E0D80020], "isWatch"))
    {
      if (v27 == 62 && v17 > (v25 | 8))
        v26 = v29[8];
    }
    v31 = objc_msgSend(MEMORY[0x1E0D80020], "isWatch");
    if ((_DWORD)v28 != 4 || v27 != 62)
    {
      self = v56;
      goto LABEL_73;
    }
    v32 = &v29[v31];
    if (v26 == 2)
    {
      self = v56;
      if (v17 >= 0x19)
      {
        if (v32[5] != 62)
          goto LABEL_68;
        v33 = v32 + 18;
        v34 = v17 - 18;
        v35 = v32[17];
LABEL_57:
        if (v34 >= v35)
          v47 = v35;
        else
          v47 = v34;
        -[PLBluetoothAgent advertisingDataDescription::](self, "advertisingDataDescription::", v33, v47);
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v49 = v48;
        if (v48)
        {
          if (-[__CFString length](v48, "length"))
            v50 = v49;
          else
            v50 = CFSTR("undecodable LE ADV");
        }
        else
        {
          v50 = CFSTR("undecodable LE ADV");
        }
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v50, CFSTR("VSEReasonString"));

        goto LABEL_68;
      }
    }
    else
    {
      self = v56;
      if (v26 == 13 && v17 >= 0x28)
      {
        if (v32[5] != 62)
          goto LABEL_68;
        v33 = v32 + 33;
        v34 = v17 - 33;
        v35 = v32[32];
        goto LABEL_57;
      }
    }
    if (v17 <= 0xD)
    {
LABEL_72:
      v28 = 4;
      v27 = 62;
      goto LABEL_73;
    }
LABEL_68:
    if ((v32[10] & 0xF0) == 0xA0)
    {
      v51 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("VSEReasonString"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("VSEReasonString"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "appendString:", v53);

      }
      objc_msgSend(v51, "appendString:", CFSTR(" passup ADV,"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v51, CFSTR("VSEReasonString"));

    }
    goto LABEL_72;
  }
LABEL_75:

}

uint64_t __44__PLBluetoothAgent_logEventIntervalWakeVSE___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A5C = result;
  return result;
}

- (void)logEventIntervalConnectedDevices
{
  uint64_t ConnectedDevices;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  unint64_t v18;
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
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  char v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t j;
  void *v87;
  void *v88;
  char v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  id v100;
  uint64_t *v101;
  id v102;
  __int128 v103;
  id obj;
  int v105;
  uint64_t v106;
  id v107;
  id v108;
  uint64_t v109;
  id v110;
  id v111;
  uint64_t v112;
  PLBluetoothAgent *v113;
  id v114[2];
  _QWORD v115[5];
  _QWORD v116[7];
  _QWORD v117[5];
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _QWORD v127[5];
  _QWORD block[5];
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD v133[5];
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _QWORD v142[5];
  unsigned int v143;
  _QWORD v144[5];
  unint64_t v145;
  __int128 v146;
  __int128 v147;
  _BYTE v148[128];
  uint8_t v149[128];
  __int128 buf;
  uint64_t v151;
  uint64_t (*v152)(uint64_t, uint64_t);
  void (*v153)(uint64_t);
  id v154;
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  void *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  uint8_t v178[16];
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  uint64_t v194;

  v113 = self;
  v101 = &v99;
  v194 = *MEMORY[0x1E0C80C00];
  v145 = 0;
  v146 = 0u;
  v147 = 0u;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v108 = (id)objc_claimAutoreleasedReturnValue();
  v102 = (id)objc_opt_new();
  -[PLBluetoothAgent localBluetoothDevice](v113, "localBluetoothDevice");
  ConnectedDevices = BTLocalDeviceGetConnectedDevices();
  if ((_DWORD)ConnectedDevices)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v3 = objc_opt_class();
      v144[0] = MEMORY[0x1E0C809B0];
      v144[1] = 3221225472;
      v144[2] = __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke;
      v144[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v144[4] = v3;
      if (qword_1ED882BB0 != -1)
        dispatch_once(&qword_1ED882BB0, v144);
      if (byte_1ED882A5D)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bluetooth power ERROR: BTLocalDeviceGetConnectedDevices: failed! %d\n"), ConnectedDevices);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastPathComponent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventIntervalConnectedDevices]");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 1669);

        PLLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v178 = 138412290;
          *(_QWORD *)&v178[4] = v4;
          _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", v178, 0xCu);
        }

      }
    }
LABEL_111:
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v90 = objc_opt_class();
      v115[0] = MEMORY[0x1E0C809B0];
      v115[1] = 3221225472;
      v115[2] = __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_522;
      v115[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v115[4] = v90;
      if (qword_1ED882BE0 != -1)
        dispatch_once(&qword_1ED882BE0, v115);
      if (byte_1ED882A63)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Nothing changes in BT connected device list"));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "lastPathComponent");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventIntervalConnectedDevices]");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "logMessage:fromFile:fromFunction:fromLineNumber:", v91, v94, v95, 1780);

        PLLogCommon();
        v96 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v178 = 138412290;
          *(_QWORD *)&v178[4] = v91;
          _os_log_debug_impl(&dword_1CAF47000, v96, OS_LOG_TYPE_DEBUG, "%@", v178, 0xCu);
        }

      }
    }
    +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("ConnectedDevices"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v97);
    objc_msgSend(v98, "setIsErrorEntry:", 1);
    objc_msgSend(v98, "setObject:forKeyedSubscript:", CFSTR("Nothing changes in BT connected device list"), CFSTR("__PLEntryErrorString__"));
    -[PLOperator logEntry:](v113, "logEntry:", v98);

    goto LABEL_119;
  }
  *((_QWORD *)&v10 + 1) = 0;
  v193 = 0u;
  v192 = 0u;
  v191 = 0u;
  v190 = 0u;
  v189 = 0u;
  v188 = 0u;
  v187 = 0u;
  v186 = 0u;
  v185 = 0u;
  v184 = 0u;
  v183 = 0u;
  v182 = 0u;
  v181 = 0u;
  v180 = 0u;
  v179 = 0u;
  *(_OWORD *)v178 = 0u;
  v177 = 0u;
  v176 = 0u;
  v175 = 0u;
  v174 = 0u;
  v173 = 0u;
  v172 = 0u;
  v171 = 0u;
  v170 = 0u;
  v169 = 0u;
  v168 = 0u;
  v167 = 0u;
  v166 = 0u;
  v165 = 0u;
  v164 = 0u;
  v163 = 0u;
  v162 = 0u;
  v160 = 0;
  v159 = 0;
  v161 = 0;
  v143 = 0;
  if (v145)
    goto LABEL_18;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v11 = objc_opt_class();
    v142[0] = MEMORY[0x1E0C809B0];
    v142[1] = 3221225472;
    v142[2] = __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_495;
    v142[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v142[4] = v11;
    if (qword_1ED882BB8 != -1)
      dispatch_once(&qword_1ED882BB8, v142);
    if (byte_1ED882A5E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bluetooth: No devices connected"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventIntervalConnectedDevices]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 1676);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v12;
        _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  if (v145)
  {
LABEL_18:
    v18 = 0;
    *(_QWORD *)&v10 = 138412290;
    *(_OWORD *)v114 = v10;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!BTDeviceGetAddressString())
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v159);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("MAC"));

      }
      if (!BTDeviceGetDefaultName())
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v162);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("DefaultName"));

      }
      if (!BTDeviceGetName())
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v178);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("Name"));

      }
      if (objc_msgSend(v19, "count"))
      {
        if (!BTDeviceGetDeviceType())
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v143);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("DeviceType"));

        }
        objc_msgSend(v102, "addObject:", v19);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot get BT device attributes."));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventIntervalConnectedDevices]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 1695);

        PLLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = v114[0];
          *(_QWORD *)((char *)&buf + 4) = v24;
          _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
        }

      }
      v160 = 0;
      v159 = 0;
      v161 = 0;
      v162 = 0u;
      v163 = 0u;
      v164 = 0u;
      v165 = 0u;
      v166 = 0u;
      v167 = 0u;
      v168 = 0u;
      v169 = 0u;
      v170 = 0u;
      v171 = 0u;
      v172 = 0u;
      v173 = 0u;
      v174 = 0u;
      v175 = 0u;
      v176 = 0u;
      v177 = 0u;
      v193 = 0u;
      v192 = 0u;
      v191 = 0u;
      v190 = 0u;
      v189 = 0u;
      v188 = 0u;
      v187 = 0u;
      v186 = 0u;
      v185 = 0u;
      v184 = 0u;
      v183 = 0u;
      v182 = 0u;
      v181 = 0u;
      v180 = 0u;
      v179 = 0u;
      *(_OWORD *)v178 = 0u;

      ++v18;
    }
    while (v18 < v145);
  }
  +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("ConnectedDevices"));
  v107 = (id)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("timestampEnd"), 0, 6);
  v158 = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v158, 1);
  v100 = (id)objc_claimAutoreleasedReturnValue();

  -[PLOperator storage](v113, "storage");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "entriesForKey:withComparisons:", v107, v100);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v110 = (id)objc_opt_new();
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  obj = v32;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v138, v157, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v139;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v139 != v34)
          objc_enumerationMutation(obj);
        v36 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * i);
        if (v36)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v138 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("Name"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("MAC"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (v38)
            {
              objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("DeviceType"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v39 == 0;

              if (!v40)
                objc_msgSend(v110, "addObject:", v36);
            }
            else
            {

            }
          }
        }
      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v138, v157, 16);
    }
    while (v33);
  }

  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v111 = v102;
  v109 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v134, v156, 16);
  if (v109)
  {
    v105 = 0;
    v106 = *(_QWORD *)v135;
    *(_QWORD *)&v41 = 138412290;
    v103 = v41;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v135 != v106)
        {
          v43 = v42;
          objc_enumerationMutation(v111);
          v42 = v43;
        }
        v112 = v42;
        v44 = *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * v42);
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v45 = objc_opt_class();
          v133[0] = MEMORY[0x1E0C809B0];
          v133[1] = 3221225472;
          v133[2] = __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_504;
          v133[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v133[4] = v45;
          if (qword_1ED882BC0 != -1)
            dispatch_once(&qword_1ED882BC0, v133);
          if (byte_1ED882A5F)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bluetooth: Local device is connected to device :%@"), v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "lastPathComponent");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventIntervalConnectedDevices]");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "logMessage:fromFile:fromFunction:fromLineNumber:", v46, v49, v50, 1734);

            PLLogCommon();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(buf) = v103;
              *(_QWORD *)((char *)&buf + 4) = v46;
              _os_log_debug_impl(&dword_1CAF47000, v51, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
            }

          }
        }
        v52 = objc_alloc(MEMORY[0x1E0D7FFB0]);
        v53 = (void *)objc_msgSend(v52, "initWithEntryKey:withRawData:", v107, v44);
        objc_msgSend(v53, "setEntryDate:", v108);
        v131 = 0u;
        v132 = 0u;
        v129 = 0u;
        v130 = 0u;
        v114[0] = v110;
        v54 = objc_msgSend(v114[0], "countByEnumeratingWithState:objects:count:", &v129, v155, 16);
        if (v54)
        {
          v55 = *(_QWORD *)v130;
          while (2)
          {
            v56 = 0;
            do
            {
              if (*(_QWORD *)v130 != v55)
                objc_enumerationMutation(v114[0]);
              v57 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v56);
              if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
              {
                v58 = objc_opt_class();
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_509;
                block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                block[4] = v58;
                if (qword_1ED882BC8 != -1)
                  dispatch_once(&qword_1ED882BC8, block);
                if (byte_1ED882A60)
                {
                  v59 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("MAC"));
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("MAC"));
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "stringWithFormat:", CFSTR("Bluetooth: checking for duplicate |%@| ==?== |%@|"), v60, v61);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();

                  v63 = (void *)MEMORY[0x1E0D7FF98];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "lastPathComponent");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventIntervalConnectedDevices]");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "logMessage:fromFile:fromFunction:fromLineNumber:", v62, v65, v66, 1741);

                  PLLogCommon();
                  v67 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                  {
                    LODWORD(buf) = v103;
                    *(_QWORD *)((char *)&buf + 4) = v62;
                    _os_log_debug_impl(&dword_1CAF47000, v67, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
                  }

                }
              }
              objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("MAC"));
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("MAC"));
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = objc_msgSend(v68, "isEqualToString:", v69);

              if ((v70 & 1) != 0)
              {

                if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
                {
                  v71 = objc_opt_class();
                  v127[0] = MEMORY[0x1E0C809B0];
                  v127[1] = 3221225472;
                  v127[2] = __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_514;
                  v127[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                  v127[4] = v71;
                  if (qword_1ED882BD0 != -1)
                    dispatch_once(&qword_1ED882BD0, v127);
                  if (byte_1ED882A61)
                  {
                    v72 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("MAC"));
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v72, "stringWithFormat:", CFSTR("Bluetooth: Entry already exists for MAC %@"), v73);
                    v74 = (void *)objc_claimAutoreleasedReturnValue();

                    v75 = (void *)MEMORY[0x1E0D7FF98];
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "lastPathComponent");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventIntervalConnectedDevices]");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "logMessage:fromFile:fromFunction:fromLineNumber:", v74, v77, v78, 1754);

                    PLLogCommon();
                    v79 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
                    {
                      LODWORD(buf) = v103;
                      *(_QWORD *)((char *)&buf + 4) = v74;
                      _os_log_debug_impl(&dword_1CAF47000, v79, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
                    }

                  }
                }
                goto LABEL_89;
              }
              ++v56;
            }
            while (v54 != v56);
            v54 = objc_msgSend(v114[0], "countByEnumeratingWithState:objects:count:", &v129, v155, 16);
            if (v54)
              continue;
            break;
          }
        }

        -[PLOperator logEntry:](v113, "logEntry:", v53);
        v105 = 1;
LABEL_89:

        v42 = v112 + 1;
      }
      while (v112 + 1 != v109);
      v109 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v134, v156, 16);
    }
    while (v109);
  }
  else
  {
    v105 = 0;
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v151 = 0x3032000000;
  v152 = __Block_byref_object_copy__5;
  v153 = __Block_byref_object_dispose__5;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v154 = (id)objc_claimAutoreleasedReturnValue();
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v110 = v110;
  v80 = (void *)objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v123, v149, 16);
  if (v80)
  {
    v112 = *(_QWORD *)v124;
    do
    {
      v114[0] = v80;
      v81 = 0;
      do
      {
        if (*(_QWORD *)v124 != v112)
          objc_enumerationMutation(v110);
        v82 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)v81);
        v119 = 0u;
        v120 = 0u;
        v121 = 0u;
        v122 = 0u;
        v83 = v111;
        v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v119, v148, 16);
        if (v84)
        {
          v85 = *(_QWORD *)v120;
          while (2)
          {
            for (j = 0; j != v84; ++j)
            {
              if (*(_QWORD *)v120 != v85)
                objc_enumerationMutation(v83);
              objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("MAC"));
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("MAC"));
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = objc_msgSend(v87, "isEqualToString:", v88);

              if ((v89 & 1) != 0)
              {

                goto LABEL_108;
              }
            }
            v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v119, v148, 16);
            if (v84)
              continue;
            break;
          }
        }

        v117[0] = 0;
        v117[1] = v117;
        v117[2] = 0x3032000000;
        v117[3] = __Block_byref_object_copy__5;
        v117[4] = __Block_byref_object_dispose__5;
        v118 = v82;
        v116[0] = MEMORY[0x1E0C809B0];
        v116[1] = 3221225472;
        v116[2] = __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_517;
        v116[3] = &unk_1E857A1E8;
        v116[5] = v117;
        v116[6] = &buf;
        v116[4] = v113;
        -[PLOperator updateEntry:withBlock:](v113, "updateEntry:withBlock:", v118, v116);
        _Block_object_dispose(v117, 8);

        v105 = 1;
LABEL_108:
        v81 = (char *)v81 + 1;
      }
      while (v81 != v114[0]);
      v80 = (void *)objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v123, v149, 16);
    }
    while (v80);
  }

  _Block_object_dispose(&buf, 8);
  if ((v105 & 1) == 0)
    goto LABEL_111;
LABEL_119:

}

uint64_t __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A5D = result;
  return result;
}

uint64_t __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_495(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A5E = result;
  return result;
}

uint64_t __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_504(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A5F = result;
  return result;
}

uint64_t __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_509(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A60 = result;
  return result;
}

uint64_t __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_514(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A61 = result;
  return result;
}

void __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_517(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t block;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), CFSTR("timestampEnd"));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_2;
    v12 = &__block_descriptor_40_e5_v8__0lu32l8;
    v13 = v2;
    if (qword_1ED882BD8 != -1)
      dispatch_once(&qword_1ED882BD8, &block);
    if (byte_1ED882A62)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bluetooth: Device disconnected:%@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), block, v10, v11, v12, v13);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventIntervalConnectedDevices]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 1772);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
}

uint64_t __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A62 = result;
  return result;
}

uint64_t __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_522(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A63 = result;
  return result;
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A64 = result;
  return result;
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_529(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A65 = result;
  return result;
}

void __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_532(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[6];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  block[5] = 0;
  objc_msgSend(*(id *)(a1 + 32), "localBluetoothDevice");
  v1 = BTLocalDeviceRegisterForPowerProfileStatistics();
  if ((_DWORD)v1)
  {
    v2 = v1;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v3 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v3;
      if (qword_1ED882BF8 != -1)
        dispatch_once(&qword_1ED882BF8, block);
      if (byte_1ED882A66)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not register for Power notifications. (error: %d)"), v2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastPathComponent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventBackwardPowerProfileStats]_block_invoke");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 1857);

        PLLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v12 = v4;
          _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A66 = result;
  return result;
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_535(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A67 = result;
  return result;
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_540(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A68 = result;
  return result;
}

void __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_543(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[6];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  block[5] = 0;
  objc_msgSend(*(id *)(a1 + 32), "localBluetoothDevice");
  v1 = BTLocalDeviceRegisterForPowerProfileStatistics();
  if ((_DWORD)v1)
  {
    v2 = v1;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v3 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_2_544;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v3;
      if (qword_1ED882C10 != -1)
        dispatch_once(&qword_1ED882C10, block);
      if (byte_1ED882A69)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not register for Power notifications. (error: %d)"), v2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastPathComponent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventBackwardPowerProfileStats]_block_invoke");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 1961);

        PLLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v12 = v4;
          _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_2_544(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A69 = result;
  return result;
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_547(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A6A = result;
  return result;
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_552(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A6B = result;
  return result;
}

void __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_553(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[6];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  block[5] = 0;
  objc_msgSend(*(id *)(a1 + 32), "localBluetoothDevice");
  v1 = BTLocalDeviceRegisterForPowerProfileStatistics();
  if ((_DWORD)v1)
  {
    v2 = v1;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v3 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_2_554;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v3;
      if (qword_1ED882C28 != -1)
        dispatch_once(&qword_1ED882C28, block);
      if (byte_1ED882A6C)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not register for Power notifications. (error: %d)"), v2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastPathComponent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventBackwardPowerProfileStats]_block_invoke");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 1988);

        PLLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v12 = v4;
          _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_2_554(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A6C = result;
  return result;
}

+ (BOOL)shouldLogMarconi
{
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004011) & 1) != 0)
    return 1;
  else
    return objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004012);
}

- (void)logEventBackwardCBDiscovery:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
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
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD block[5];
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("CBDiscoveryStats"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v24);
  v25 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("agsE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v7)
    {
      v8 = v7;
      obj = v6;
      v27 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v27)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("apID"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("apID"));

          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("apIX"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("apIX"));

          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sonC"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("sonC"));

          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sofC"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("sofC"));

          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("dsFl"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("dsFl"));

          -[PLOperator logEntry:](self, "logEntry:", v4);
        }
        v6 = obj;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v8);
    }
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v16 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__PLBluetoothAgent_logEventBackwardCBDiscovery___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v16;
      if (qword_1ED882C30 != -1)
        dispatch_once(&qword_1ED882C30, block);
      if (byte_1ED882A6D)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: CBDiscovery return empty dictionary"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventBackwardCBDiscovery:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 2023);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v17;
          _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("apIX"));

    -[PLOperator logEntry:](self, "logEntry:", v4);
  }

}

uint64_t __48__PLBluetoothAgent_logEventBackwardCBDiscovery___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A6D = result;
  return result;
}

- (void)logEventBackwardWirelessProximity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD block[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("WirelessProxScanDStats"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Scan"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("ClientScanDuration"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Advertise"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("ClientAdvDuration"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AggressiveScan"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("ClientScanConfig"));

  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v10 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__PLBluetoothAgent_logEventBackwardWirelessProximity___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v10;
      if (qword_1ED882C38 != -1)
        dispatch_once(&qword_1ED882C38, block);
      if (byte_1ED882A6E)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: WirelessProximity return empty dictionary"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventBackwardWirelessProximity:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 2046);

        PLLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v11;
          _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E864FD90, CFSTR("ClientScanDuration"));
  }
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

uint64_t __54__PLBluetoothAgent_logEventBackwardWirelessProximity___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A6E = result;
  return result;
}

- (void)logEventBackwardMaxDutyCycle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
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
  +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MaxDutyCycle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v5, v4);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __49__PLBluetoothAgent_logEventBackwardMaxDutyCycle___block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (qword_1ED882C40 != -1)
      dispatch_once(&qword_1ED882C40, &block);
    if (byte_1ED882A6F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Write to dB: %@"), v4, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent logEventBackwardMaxDutyCycle:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 2065);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

uint64_t __49__PLBluetoothAgent_logEventBackwardMaxDutyCycle___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A6F = result;
  return result;
}

- (void)logEventBackwardA2DP:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", v4, CFSTR("A2DPPower"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  objc_msgSend(v5, "objectForKey:", CFSTR("Duration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("A2DPDuration"));

  objc_msgSend(v5, "objectForKey:", CFSTR("PercentageEPAPower"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("A2DPpercantageePA"));

  objc_msgSend(v5, "objectForKey:", CFSTR("PercentageIPAPower"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("A2DPpercantageiPA"));
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logEventBackwardHFP:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", v4, CFSTR("HFPPower"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v12);
  objc_msgSend(v5, "objectForKey:", CFSTR("Duration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("HFPDuration"));

  objc_msgSend(v5, "objectForKey:", CFSTR("PercentageEPAPowerFirstWindow"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("HFPpercantageePA1"));

  objc_msgSend(v5, "objectForKey:", CFSTR("PercentageEPAPowerSecondWindow"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("HFPpercantageePA2"));

  objc_msgSend(v5, "objectForKey:", CFSTR("PercentageIPAPowerFirstWindow"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("HFPpercentageiPA1"));

  objc_msgSend(v5, "objectForKey:", CFSTR("PercentageIPAPowerSecondWindow"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("HFPpercentageiPA2"));
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A70 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_633(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A71 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_638(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A72 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_644(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A73 = result;
  return result;
}

void __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_647(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED882C68 != -1)
      dispatch_once(&qword_1ED882C68, block);
    if (byte_1ED882A74)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Count: %lu"), objc_msgSend(v3, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]_block_invoke");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 2244);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "count") != 0;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_652;
    v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v18[4] = objc_opt_class();
    if (qword_1ED882C70 != -1)
      dispatch_once(&qword_1ED882C70, v18);
    if (byte_1ED882A75)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ItemPaired: %d"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 2246);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v12;
        _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A74 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_652(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A75 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_659(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A76 = result;
  return result;
}

void __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_663(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  double v21;
  double v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  double v31;
  double v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  int v41;
  uint64_t v42;
  void *v43;
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
  void *v59;
  NSObject *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t block;
  uint64_t v100;
  uint64_t (*v101)(uint64_t);
  void *v102;
  uint64_t v103;
  _QWORD v104[5];
  _QWORD v105[5];
  _QWORD v106[5];
  _QWORD v107[5];
  _QWORD v108[5];
  _QWORD v109[5];
  _QWORD v110[5];
  _QWORD v111[5];
  _QWORD v112[5];
  uint8_t buf[4];
  void *v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "exposureNotificationEnabled");
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  if (v3)
  {
    v6 = 0.0;
    if (v5)
    {
      v7 = objc_opt_class();
      v112[0] = MEMORY[0x1E0C809B0];
      v112[1] = 3221225472;
      v112[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_2_664;
      v112[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v112[4] = v7;
      if (qword_1ED882C80 != -1)
        dispatch_once(&qword_1ED882C80, v112);
      if (byte_1ED882A77)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ModelBTPower: activateWithCompletionHandler failed: %@"), v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]_block_invoke");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 2287);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
LABEL_7:

          goto LABEL_77;
        }
        *(_DWORD *)buf = 138412290;
        v114 = v8;
LABEL_86:
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        goto LABEL_7;
      }
    }
    goto LABEL_77;
  }
  if (v5)
  {
    v14 = objc_opt_class();
    v111[0] = MEMORY[0x1E0C809B0];
    v111[1] = 3221225472;
    v111[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_669;
    v111[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v111[4] = v14;
    if (qword_1ED882C88 != -1)
      dispatch_once(&qword_1ED882C88, v111);
    if (byte_1ED882A78)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ModelBTPower: activateWithCompletionHandler: %@"), *(_QWORD *)(a1 + 32));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 2291);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v114 = v15;
        _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (v4)
  {
    v21 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v22 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v23 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      if (v21 >= v22)
      {
        if (v23)
        {
          v54 = objc_opt_class();
          v109[0] = MEMORY[0x1E0C809B0];
          v109[1] = 3221225472;
          v109[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_679;
          v109[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v109[4] = v54;
          if (qword_1ED882C98 != -1)
            dispatch_once(&qword_1ED882C98, v109);
          if (byte_1ED882A7A)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ModelBTPower: BTpower %f > %f"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "lastPathComponent");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "logMessage:fromFile:fromFunction:fromLineNumber:", v55, v58, v59, 2300);

            PLLogCommon();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v114 = v55;
              _os_log_debug_impl(&dword_1CAF47000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                + 24);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                + 24);
        goto LABEL_76;
      }
      if (v23)
      {
        v24 = objc_opt_class();
        v110[0] = MEMORY[0x1E0C809B0];
        v110[1] = 3221225472;
        v110[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_674;
        v110[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v110[4] = v24;
        if (qword_1ED882C90 != -1)
          dispatch_once(&qword_1ED882C90, v110);
        if (byte_1ED882A79)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ModelBTPower: BTpower %f < %f"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "lastPathComponent");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 2295);

          PLLogCommon();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v114 = v25;
            _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                              + 24);
    }
    else
    {
      v41 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      if (v21 >= 3.2)
      {
        if (v41)
        {
          v68 = objc_opt_class();
          v107[0] = MEMORY[0x1E0C809B0];
          v107[1] = 3221225472;
          v107[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_687;
          v107[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v107[4] = v68;
          if (qword_1ED882CA8 != -1)
            dispatch_once(&qword_1ED882CA8, v107);
          if (byte_1ED882A7C)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ModelBTPower: BTpower %f > %f"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), 0x400999999999999ALL);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "lastPathComponent");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "logMessage:fromFile:fromFunction:fromLineNumber:", v69, v72, v73, 2313);

            PLLogCommon();
            v74 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v114 = v69;
              _os_log_debug_impl(&dword_1CAF47000, v74, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 0x400999999999999ALL;
        goto LABEL_76;
      }
      if (v41)
      {
        v42 = objc_opt_class();
        v108[0] = MEMORY[0x1E0C809B0];
        v108[1] = 3221225472;
        v108[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_684;
        v108[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v108[4] = v42;
        if (qword_1ED882CA0 != -1)
          dispatch_once(&qword_1ED882CA0, v108);
        if (byte_1ED882A7B)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ModelBTPower: BTpower %f < %f"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), 0x400999999999999ALL);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "lastPathComponent");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "logMessage:fromFile:fromFunction:fromLineNumber:", v43, v46, v47, 2309);

          PLLogCommon();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v114 = v43;
            _os_log_debug_impl(&dword_1CAF47000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
LABEL_76:
    v6 = 9.0;
    goto LABEL_77;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v31 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v32 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
    v33 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    if (v31 >= v32)
    {
      if (v33)
      {
        v61 = objc_opt_class();
        v105[0] = MEMORY[0x1E0C809B0];
        v105[1] = 3221225472;
        v105[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_693;
        v105[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v105[4] = v61;
        if (qword_1ED882CB8 != -1)
          dispatch_once(&qword_1ED882CB8, v105);
        if (byte_1ED882A7E)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ModelBTPower: BTpower %f > %f"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "lastPathComponent");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "logMessage:fromFile:fromFunction:fromLineNumber:", v62, v65, v66, 2326);

          PLLogCommon();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v114 = v62;
            _os_log_debug_impl(&dword_1CAF47000, v67, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                              + 24);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8)
                                                                              + 24);
    }
    else
    {
      if (v33)
      {
        v34 = objc_opt_class();
        v106[0] = MEMORY[0x1E0C809B0];
        v106[1] = 3221225472;
        v106[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_690;
        v106[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v106[4] = v34;
        if (qword_1ED882CB0 != -1)
          dispatch_once(&qword_1ED882CB0, v106);
        if (byte_1ED882A7D)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ModelBTPower: BTpower %f < %f"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "lastPathComponent");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 2322);

          PLLogCommon();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v114 = v35;
            _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                              + 24);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }
    v6 = 0.0;
  }
  else
  {
    v6 = 0.0;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v49 = objc_opt_class();
      v104[0] = MEMORY[0x1E0C809B0];
      v104[1] = 3221225472;
      v104[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_696;
      v104[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v104[4] = v49;
      if (qword_1ED882CC0 != -1)
        dispatch_once(&qword_1ED882CC0, v104);
      if (byte_1ED882A7F)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ModelBTPower: BTPower: %f"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "lastPathComponent");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v52, v53, 2334);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          goto LABEL_7;
        *(_DWORD *)buf = 138412290;
        v114 = v8;
        goto LABEL_86;
      }
    }
  }
LABEL_77:
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = fmax(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 24)- *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)+ 24), 0.0);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v75 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v100 = 3221225472;
    v101 = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_701;
    v102 = &__block_descriptor_40_e5_v8__0lu32l8;
    v103 = v75;
    if (qword_1ED882CC8 != -1)
      dispatch_once(&qword_1ED882CC8, &block);
    if (byte_1ED882A80)
    {
      v76 = (void *)MEMORY[0x1E0CB3940];
      v77 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v78 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 48), "entryDate");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "stringWithFormat:", CFSTR("ModelBTPower: Model %f to node 50, %f to node 58, %f to node 59 at %@"), v77, *(_QWORD *)&v6, v78, v79, block, v100, v101, v102, v103);
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      v81 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "lastPathComponent");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "logMessage:fromFile:fromFunction:fromLineNumber:", v80, v83, v84, 2339);

      PLLogCommon();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v114 = v80;
        _os_log_debug_impl(&dword_1CAF47000, v85, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 48), "entryDate");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 50, v88, v87);

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 58, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), v6);

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "entryDate");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 58, v91, 0.0);

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "entryDate");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 45, &unk_1E864BB30, v93);

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 59, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "entryDate");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 59, v96, 0.0);

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "entryDate");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 47, &unk_1E864BB58, v98);

}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_2_664(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A77 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_669(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A78 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_674(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A79 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_679(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A7A = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_684(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A7B = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_687(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A7C = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_690(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A7D = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_693(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A7E = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_696(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A7F = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_701(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A80 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_713(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A81 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_716(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A82 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_719(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A83 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_725(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A84 = result;
  return result;
}

- (void)modelBluetoothOffPower
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  _QWORD block[5];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 50, v2, 0.0);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 59, v2, 0.0);

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v5 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__PLBluetoothAgent_modelBluetoothOffPower__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (qword_1ED882CF0 != -1)
        dispatch_once(&qword_1ED882CF0, block);
      if (byte_1ED882A85)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ModelBTOffPower"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothOffPower]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 2424);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v6;
          _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    if (objc_msgSend(MEMORY[0x1E0D80020], "isiPhone"))
    {
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 58, v2, 0.0);

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v13 = objc_opt_class();
        v20 = MEMORY[0x1E0C809B0];
        v21 = 3221225472;
        v22 = __42__PLBluetoothAgent_modelBluetoothOffPower__block_invoke_732;
        v23 = &__block_descriptor_40_e5_v8__0lu32l8;
        v24 = v13;
        if (qword_1ED882CF8 != -1)
          dispatch_once(&qword_1ED882CF8, &v20);
        if (byte_1ED882A86)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ModelBTOffPower"), v20, v21, v22, v23, v24);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lastPathComponent");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBluetoothAgent modelBluetoothOffPower]");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 2429);

          PLLogCommon();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v14;
            _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
    }

  }
}

uint64_t __42__PLBluetoothAgent_modelBluetoothOffPower__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A85 = result;
  return result;
}

uint64_t __42__PLBluetoothAgent_modelBluetoothOffPower__block_invoke_732(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882A86 = result;
  return result;
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLEntryNotificationOperatorComposition)sbcChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSbcChanged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)btHardwareChipset
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (PLXPCListenerOperatorComposition)leConnectionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLeConnectionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLXPCListenerOperatorComposition)btHCIListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setBtHCIListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLXPCListenerOperatorComposition)btA2DPListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBtA2DPListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (PLXPCListenerOperatorComposition)btHFPListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBtHFPListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PLXPCListenerOperatorComposition)btHCIVSEListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBtHCIVSEListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (PLXPCListenerOperatorComposition)wirelessProxListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setWirelessProxListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (PLXPCListenerOperatorComposition)CBDiscoveryListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCBDiscoveryListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (PLEntryNotificationOperatorComposition)wakeEntryNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (NSDate)lastPowerEntryDate
{
  return (NSDate *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLastPowerEntryDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (unsigned)logCount
{
  return self->_logCount;
}

- (void)setLogCount:(unsigned __int8)a3
{
  self->_logCount = a3;
}

- (NSMutableDictionary)ENScanCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setENScanCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (PLXPCListenerOperatorComposition)ENListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 192, 1);
}

- (void)setENListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (void)setBeaconManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (PLXPCListenerOperatorComposition)magnetListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 208, 1);
}

- (void)setMagnetListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (PLXPCListenerOperatorComposition)magnetOperationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 216, 1);
}

- (void)setMagnetOperationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magnetOperationListener, 0);
  objc_storeStrong((id *)&self->_magnetListener, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);
  objc_storeStrong((id *)&self->_ENListener, 0);
  objc_storeStrong((id *)&self->_ENScanCache, 0);
  objc_storeStrong((id *)&self->_lastPowerEntryDate, 0);
  objc_storeStrong((id *)&self->_wakeEntryNotifications, 0);
  objc_storeStrong((id *)&self->_CBDiscoveryListener, 0);
  objc_storeStrong((id *)&self->_wirelessProxListener, 0);
  objc_storeStrong((id *)&self->_btHCIVSEListener, 0);
  objc_storeStrong((id *)&self->_btHFPListener, 0);
  objc_storeStrong((id *)&self->_btA2DPListener, 0);
  objc_storeStrong((id *)&self->_btHCIListener, 0);
  objc_storeStrong((id *)&self->_leConnectionListener, 0);
  objc_storeStrong((id *)&self->_btHardwareChipset, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_sbcChanged, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
}

@end
