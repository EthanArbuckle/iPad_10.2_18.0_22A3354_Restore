@implementation PLPowerAssertionAgent

void __37__PLPowerAssertionAgent_logInterval___block_invoke_2(uint64_t a1, void *a2, unsigned int a3, void *a4)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  uint64_t v62;
  _QWORD *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  void *v94;
  double v95;
  double v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  uint64_t v114;
  _QWORD *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  NSObject *v121;
  uint64_t v122;
  _QWORD *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  NSObject *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  _QWORD *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  NSObject *v144;
  int v145;
  uint64_t v146;
  _QWORD *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  NSObject *v153;
  uint64_t v154;
  _QWORD *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  NSObject *v161;
  void *v162;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  id obj;
  id v170;
  void *v171;
  void *v172;
  uint64_t v173;
  void *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  void *v181;
  void *v182;
  _QWORD v183[5];
  _QWORD v184[5];
  _QWORD v185[5];
  _QWORD v186[5];
  _QWORD v187[5];
  _QWORD v188[5];
  _QWORD v189[5];
  _QWORD v190[5];
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  _QWORD v195[5];
  _QWORD v196[5];
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  void *v201;
  void *v202;
  _BYTE v203[128];
  void *v204;
  void *v205;
  uint8_t buf[4];
  void *v207;
  _BYTE v208[128];
  uint64_t v209;

  v209 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D7FFA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", logInterval__prevRefCnt);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:saveToDisk:", v6, CFSTR("assertionCookie"), 1);

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a4;
  v9 = (void *)objc_opt_new();
  v177 = *MEMORY[0x1E0D80390];
  +[PLOperator entryKeyForType:andName:](PLPowerAssertionAgent, "entryKeyForType:andName:");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v197 = 0u;
  v198 = 0u;
  v199 = 0u;
  v200 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v197, v208, 16);
  v167 = v9;
  v168 = v7;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v198;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v198 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v197 + 1) + 8 * v13);
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v15 = objc_opt_class();
          v196[0] = MEMORY[0x1E0C809B0];
          v196[1] = 3221225472;
          v196[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_3;
          v196[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v196[4] = v15;
          v16 = v196;
          if (qword_1ED8828E8 != -1)
            dispatch_once(&qword_1ED8828E8, v16);

          if (byte_1ED882826)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("timedOutProcessLog=%@"), v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "lastPathComponent");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logInterval:]_block_invoke_2");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 771);

            PLLogCommon();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v207 = v17;
              _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v9 = v167;
            v7 = v168;
          }
        }
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v174, v7);
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v14, CFSTR("ProcessName"));
        objc_msgSend(v9, "addObject:", v23);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v197, v208, 16);
    }
    while (v11);
  }

  v24 = a1;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v25 = objc_opt_class();
    v195[0] = MEMORY[0x1E0C809B0];
    v195[1] = 3221225472;
    v195[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_356;
    v195[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v195[4] = v25;
    v26 = v195;
    if (qword_1ED8828F0 != -1)
      dispatch_once(&qword_1ED8828F0, v26);

    if (byte_1ED882827)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("processCreates=%@\n"), v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "lastPathComponent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logInterval:]_block_invoke_2");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 776);

      PLLogCommon();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v207 = v27;
        _os_log_debug_impl(&dword_1CAF47000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v24 = a1;
    }
  }
  if (objc_msgSend(v9, "count"))
  {
    v33 = *(void **)(v24 + 32);
    v204 = v174;
    v205 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v205, &v204, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "logEntries:withGroupID:", v34, v174);

  }
  +[PLOperator entryKeyForType:andName:](PLPowerAssertionAgent, "entryKeyForType:andName:", v177, CFSTR("BufferStatus"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = a2;
  v172 = (void *)objc_opt_new();
  +[PLOperator entryKeyForType:andName:](PLPowerAssertionAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Assertion"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = 0u;
  v192 = 0u;
  v193 = 0u;
  v194 = 0u;
  v170 = v35;
  v175 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v191, v203, 16);
  if (v175)
  {
    v173 = *(_QWORD *)v192;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v192 != v173)
          objc_enumerationMutation(v170);
        v37 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * v36);
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v38 = objc_opt_class();
          v190[0] = MEMORY[0x1E0C809B0];
          v190[1] = 3221225472;
          v190[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_361;
          v190[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v190[4] = v38;
          v39 = v190;
          if (qword_1ED8828F8 != -1)
            dispatch_once(&qword_1ED8828F8, v39);

          if (byte_1ED882828)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("activityLog=%@"), v37);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "lastPathComponent");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logInterval:]_block_invoke_2");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v43, v44, 790);

            PLLogCommon();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v207 = v40;
              _os_log_debug_impl(&dword_1CAF47000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v24 = a1;
          }
        }
        v46 = (void *)MEMORY[0x1D179C2E0]();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("GlobalUniqueID"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("AssertPID"));
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Action"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v24 + 32), "startEndActionsToEnum");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectForKeyedSubscript:", v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v50)
          v50 = &unk_1E8632640;
        if (*(_BYTE *)(v24 + 56) || (objc_msgSend(v50, "isEqualToNumber:", &unk_1E8632490) & 1) == 0)
        {
          v176 = v36;
          v178 = v48;
          v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v171, v7);
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("IsCoalesced"));
          v52 = objc_claimAutoreleasedReturnValue();
          if (v52)
          {
            v53 = (void *)v52;
            v54 = objc_msgSend(v50, "intValue");

            if (v54 == 4)
            {
              objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("IsCoalesced"));
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "setObject:forKeyedSubscript:", v55, CFSTR("IsCoalesced"));

            }
          }
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("ActivityTime"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          v181 = v47;
          if (v56)
          {
            objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("ActivityTime"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "entryDate");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "timeIntervalSinceDate:", v58);
            v60 = v59 * 1000.0;

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setObject:forKeyedSubscript:", v61, CFSTR("timestampActionOffset"));

          }
          else
          {
            if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            {
              v62 = objc_opt_class();
              v189[0] = MEMORY[0x1E0C809B0];
              v189[1] = 3221225472;
              v189[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_368;
              v189[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v189[4] = v62;
              v63 = v189;
              if (qword_1ED882900 != -1)
                dispatch_once(&qword_1ED882900, v63);

              if (byte_1ED882829)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing key: ActivityTime, in the payload"));
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "lastPathComponent");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logInterval:]_block_invoke_2");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "logMessage:fromFile:fromFunction:fromLineNumber:", v64, v67, v68, 809);

                PLLogCommon();
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v207 = v64;
                  _os_log_debug_impl(&dword_1CAF47000, v69, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v7 = v168;
                v24 = a1;
                v47 = v181;
              }
            }
            objc_msgSend(v51, "setObject:forKeyedSubscript:", 0, CFSTR("timestampActionOffset"));
          }
          objc_msgSend(v51, "setObject:forKeyedSubscript:", v47, CFSTR("GlobalUniqueID"));
          objc_msgSend(v51, "setObject:forKeyedSubscript:", v182, CFSTR("pid"));
          objc_msgSend(*(id *)(v24 + 32), "logAssertNameForActions");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v70, "containsObject:", v50);

          if (v71)
          {
            objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Category"));
            v72 = (void *)objc_claimAutoreleasedReturnValue();

            if (v72)
            {
              objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Category"));
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "setObject:forKeyedSubscript:", v73, CFSTR("Category"));

            }
            objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("InstanceMetadata"));
            v74 = (void *)objc_claimAutoreleasedReturnValue();

            if (v74)
            {
              objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("InstanceMetadata"));
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              if ((unint64_t)objc_msgSend(v75, "length") >= 0x21)
              {
                objc_msgSend(v75, "substringToIndex:", 32);
                v76 = objc_claimAutoreleasedReturnValue();

                v75 = (void *)v76;
              }
              objc_msgSend(v51, "setObject:forKeyedSubscript:", v75, CFSTR("InstanceMetadata"));

            }
            objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("FrameworkBundleID"));
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            if (v77)
            {
              objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("FrameworkBundleID"));
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "setObject:forKeyedSubscript:", v78, CFSTR("FrameworkBundleID"));

            }
          }
          objc_msgSend(*(id *)(v24 + 32), "logAssertNameForActions");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v79, "containsObject:", v50);

          if (v80)
          {
            v81 = *(void **)(v24 + 32);
            objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("AssertName"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "sanitizeAssertionNameForEntry:", v82);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setObject:forKeyedSubscript:", v83, CFSTR("AssertName"));

          }
          else
          {
            objc_msgSend(v51, "setObject:forKeyedSubscript:", 0, CFSTR("AssertName"));
          }
          objc_msgSend(v51, "setObject:forKeyedSubscript:", v50, CFSTR("Action"));
          objc_msgSend(*(id *)(v24 + 32), "assertTypeToEnum");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("AssertType"));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "objectForKeyedSubscript:", v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setObject:forKeyedSubscript:", v86, CFSTR("AssertType"));

          objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("AssertType"));
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v87)
            objc_msgSend(v51, "setObject:forKeyedSubscript:", &unk_1E8632520, CFSTR("AssertType"));
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("AssertionOnBehalfOfPID"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setObject:forKeyedSubscript:", v88, CFSTR("AssertionOnBehalfOfPID"));

          objc_msgSend(v172, "addObject:", v51);
          v24 = a1;
          v47 = v181;
          if (+[PLPowerAssertionAgent shouldOptimizeSmallAssertions](PLPowerAssertionAgent, "shouldOptimizeSmallAssertions"))
          {
            if (objc_msgSend(v50, "intValue") == 4)
            {
              objc_msgSend(*(id *)(a1 + 32), "UUIDStartEntryCache");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "objectForKeyedSubscript:", v181);
              v90 = (void *)objc_claimAutoreleasedReturnValue();

              if (v90)
              {
                objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("timestampActionOffset"));
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "doubleValue");
                v93 = v92;
                objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("timestampActionOffset"));
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v94, "doubleValue");
                v96 = v93 - v95;

                if (v96 >= 1000.0)
                {
                  v47 = v181;
                }
                else
                {
                  objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("AssertName"));
                  v165 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(a1 + 40), "stringByReplacingMatchesInString:options:range:withTemplate:", v165, 0, 0, objc_msgSend(v165, "length"), CFSTR("HEX"));
                  v97 = objc_claimAutoreleasedReturnValue();
                  v98 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("pid"));
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("AssertionOnBehalfOfPID"));
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("AssertType"));
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  v164 = (void *)v97;
                  objc_msgSend(v98, "stringWithFormat:", CFSTR("%@,%@,%@,%@"), v99, v100, v101, v97);
                  v102 = (void *)objc_claimAutoreleasedReturnValue();

                  v24 = a1;
                  objc_msgSend(*(id *)(a1 + 32), "assertionUUIDCache");
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v103, "valueForKey:", v102);
                  v104 = objc_claimAutoreleasedReturnValue();

                  v166 = (void *)v104;
                  if (!v104)
                  {
                    objc_msgSend(*(id *)(a1 + 32), "assertionUUIDCache");
                    v116 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = v181;
                    objc_msgSend(v116, "setObject:forKey:", v181, v102);
                    goto LABEL_90;
                  }
                  v47 = v181;
                  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
                  {
                    v105 = objc_opt_class();
                    v188[0] = MEMORY[0x1E0C809B0];
                    v188[1] = 3221225472;
                    v188[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_377;
                    v188[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                    v188[4] = v105;
                    v106 = v188;
                    if (qword_1ED882908 != -1)
                      dispatch_once(&qword_1ED882908, v106);

                    if (byte_1ED88282A)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion before optimization=%@\n"), v90);
                      v107 = (void *)objc_claimAutoreleasedReturnValue();
                      v108 = (void *)MEMORY[0x1E0D7FF98];
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
                      v109 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v109, "lastPathComponent");
                      v110 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logInterval:]_block_invoke_2");
                      v111 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v108, "logMessage:fromFile:fromFunction:fromLineNumber:", v107, v110, v111, 862);

                      PLLogCommon();
                      v112 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v207 = v107;
                        _os_log_debug_impl(&dword_1CAF47000, v112, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }

                      v7 = v168;
                      v24 = a1;
                      v47 = v181;
                    }
                  }
                  objc_msgSend(v90, "setObject:forKeyedSubscript:", &stru_1E8587D00, CFSTR("AssertName"));
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v166, "unsignedLongLongValue"));
                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v90, "setObject:forKeyedSubscript:", v113, CFSTR("GlobalUniqueIDReference"));

                  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
                  {
                    v114 = objc_opt_class();
                    v187[0] = MEMORY[0x1E0C809B0];
                    v187[1] = 3221225472;
                    v187[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_382;
                    v187[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                    v187[4] = v114;
                    v115 = v187;
                    if (qword_1ED882910 != -1)
                      dispatch_once(&qword_1ED882910, v115);

                    if (byte_1ED88282B)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion after optimization=%@\n"), v90);
                      v116 = (void *)objc_claimAutoreleasedReturnValue();
                      v117 = (void *)MEMORY[0x1E0D7FF98];
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v118, "lastPathComponent");
                      v119 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logInterval:]_block_invoke_2");
                      v120 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v117, "logMessage:fromFile:fromFunction:fromLineNumber:", v116, v119, v120, 865);

                      PLLogCommon();
                      v121 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v207 = v116;
                        _os_log_debug_impl(&dword_1CAF47000, v121, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }

                      v7 = v168;
                      v24 = a1;
                      v47 = v181;
LABEL_90:

                    }
                  }

                }
              }
LABEL_92:

            }
            else if (!objc_msgSend(v50, "intValue"))
            {
              objc_msgSend(*(id *)(a1 + 32), "UUIDStartEntryCache");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "setObject:forKey:", v51, v181);
              goto LABEL_92;
            }
          }

          v36 = v176;
          v48 = v178;
        }

        objc_autoreleasePoolPop(v46);
        ++v36;
      }
      while (v175 != v36);
      v175 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v191, v203, 16);
    }
    while (v175);
  }

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v122 = objc_opt_class();
    v186[0] = MEMORY[0x1E0C809B0];
    v186[1] = 3221225472;
    v186[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_387;
    v186[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v186[4] = v122;
    v123 = v186;
    if (qword_1ED882918 != -1)
      dispatch_once(&qword_1ED882918, v123);

    if (byte_1ED88282C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("creates=%@\n"), v172);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "lastPathComponent");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logInterval:]_block_invoke_2");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "logMessage:fromFile:fromFunction:fromLineNumber:", v124, v127, v128, 876);

      PLLogCommon();
      v129 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v207 = v124;
        _os_log_debug_impl(&dword_1CAF47000, v129, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v24 = a1;
    }
  }
  if (objc_msgSend(v172, "count"))
  {
    v130 = *(void **)(v24 + 32);
    v201 = v171;
    v202 = v172;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v202, &v201, 1);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "logEntries:withGroupID:", v131, v171);
  }
  else
  {
    v131 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v171);
    objc_msgSend(v131, "setIsErrorEntry:", 1);
    objc_msgSend(v131, "setObject:forKeyedSubscript:", CFSTR("No assertions created"), CFSTR("__PLEntryErrorString__"));
    objc_msgSend(*(id *)(v24 + 32), "logEntry:", v131);
  }

  objc_msgSend(*(id *)(v24 + 32), "assertionUUIDCache");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "removeAllObjects");

  objc_msgSend(*(id *)(v24 + 32), "UUIDStartEntryCache");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "removeAllObjects");

  v134 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v162);
  if (objc_msgSend(*(id *)(v24 + 32), "firstBufferDrain"))
    v135 = &unk_1E8632508;
  else
    v135 = *(void **)(v24 + 48);
  objc_msgSend(v134, "setObject:forKeyedSubscript:", v135, CFSTR("Reason"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v170, "count"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "setObject:forKeyedSubscript:", v136, CFSTR("TotalCount"));

  objc_msgSend(*(id *)(v24 + 32), "logEntry:", v134);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v137 = objc_opt_class();
    v185[0] = MEMORY[0x1E0C809B0];
    v185[1] = 3221225472;
    v185[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_394;
    v185[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v185[4] = v137;
    v138 = v185;
    if (qword_1ED882920 != -1)
      dispatch_once(&qword_1ED882920, v138);

    if (byte_1ED88282D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Buffer usage: %@"), v134);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "lastPathComponent");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logInterval:]_block_invoke_2");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "logMessage:fromFile:fromFunction:fromLineNumber:", v139, v142, v143, 898);

      PLLogCommon();
      v144 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v144, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v207 = v139;
        _os_log_debug_impl(&dword_1CAF47000, v144, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v24 = a1;
    }
  }
  v145 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  if (a3)
  {
    if (v145)
    {
      v146 = objc_opt_class();
      v184[0] = MEMORY[0x1E0C809B0];
      v184[1] = 3221225472;
      v184[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_399;
      v184[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v184[4] = v146;
      v147 = v184;
      if (qword_1ED882928 != -1)
        dispatch_once(&qword_1ED882928, v147);

      if (byte_1ED88282E)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("buffer overflowed (%lu), taking snapshot"), objc_msgSend(v170, "count"));
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "lastPathComponent");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logInterval:]_block_invoke_2");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "logMessage:fromFile:fromFunction:fromLineNumber:", v148, v151, v152, 902);

        PLLogCommon();
        v153 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v153, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v207 = v148;
          _os_log_debug_impl(&dword_1CAF47000, v153, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v24 = a1;
      }
    }
    objc_msgSend(*(id *)(v24 + 32), "logEventForwardAssertionWithReason:asSnapshot:", &unk_1E86324D8, 1);
  }
  else if (v145)
  {
    v154 = objc_opt_class();
    v183[0] = MEMORY[0x1E0C809B0];
    v183[1] = 3221225472;
    v183[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_404;
    v183[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v183[4] = v154;
    v155 = v183;
    if (qword_1ED882930 != -1)
      dispatch_once(&qword_1ED882930, v155);

    if (byte_1ED88282F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No buffer overflow (%lu)"), objc_msgSend(v170, "count"));
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "lastPathComponent");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logInterval:]_block_invoke_2");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "logMessage:fromFile:fromFunction:fromLineNumber:", v156, v159, v160, 905);

      PLLogCommon();
      v161 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v161, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v207 = v156;
        _os_log_debug_impl(&dword_1CAF47000, v161, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v24 = a1;
    }
  }
  objc_msgSend(*(id *)(v24 + 32), "setFirstBufferDrain:", 0);
  objc_msgSend(*(id *)(v24 + 32), "setLastActivityOverflow:", a3);

}

- (NSSet)logAssertNameForActions
{
  return (NSSet *)objc_getProperty(self, a2, 192, 1);
}

- (NSDictionary)startEndActionsToEnum
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (NSDictionary)assertTypeToEnum
{
  return (NSDictionary *)objc_getProperty(self, a2, 184, 1);
}

+ (BOOL)shouldOptimizeSmallAssertions
{
  if (qword_1ED8828C0 != -1)
    dispatch_once(&qword_1ED8828C0, &__block_literal_global_15);
  return byte_1ED882821;
}

- (NSMutableDictionary)UUIDStartEntryCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (id)sanitizeAssertionNameForEntry:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ((unint64_t)objc_msgSend(v3, "length") >= 0x3E9)
    {
      objc_msgSend(v3, "substringToIndex:", 1000);
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v4;
    }
    if (objc_msgSend(v3, "rangeOfString:", CFSTR("@")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v3 = v3;
      v5 = v3;
    }
    else
    {
      objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(";"), &stru_1E8587D00);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), &stru_1E8587D00);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("*"), &stru_1E8587D00);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("?"), &stru_1E8587D00);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("@"), &stru_1E8587D00);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\"), &stru_1E8587D00);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E8587D00);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)assertionUUIDCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLastActivityOverflow:(BOOL)a3
{
  self->_lastActivityOverflow = a3;
}

- (void)setFirstBufferDrain:(BOOL)a3
{
  self->_firstBufferDrain = a3;
}

- (BOOL)firstBufferDrain
{
  return self->_firstBufferDrain;
}

- (void)logInterval:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t block;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  const __CFString *v23;
  char v24;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v21 = __37__PLPowerAssertionAgent_logInterval___block_invoke;
  v22 = &unk_1E8579C80;
  v20 = 3221225472;
  v23 = CFSTR("logAssertNameChange");
  v24 = 0;
  if (qword_1ED8828E0 == -1)
  {
    v6 = CFSTR("logAssertNameChange");
  }
  else
  {
    dispatch_once(&qword_1ED8828E0, &block);
    v6 = (__CFString *)v23;
  }
  v7 = byte_1ED882825;

  if (logInterval__prevRefCnt == -1)
    logInterval__prevRefCnt = objc_msgSend(MEMORY[0x1E0D7FFA0], "longForKey:ifNotSet:", CFSTR("assertionCookie"), 0xFFFFFFFFLL);
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("0[xX][0-9a-fA-F]+"), 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator workQueue](self, "workQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v5;
  LOBYTE(v18) = v7;
  v10 = v8;
  v16 = v10;
  v11 = v4;
  v17 = v11;
  v12 = IOPMCopyAssertionActivityUpdateWithCallback();

  if (v12)
  {
    +[PLOperator entryKeyForType:andName:](PLPowerAssertionAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("BufferStatus"), v15, 3221225472, __37__PLPowerAssertionAgent_logInterval___block_invoke_2, &unk_1E8579CA8, self, v10, v11, v18, block, v20, v21, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v13);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E8632670, CFSTR("TotalCount"));
    -[PLOperator logEntry:](self, "logEntry:", v14);

  }
}

- (void)logEventForwardAssertionWithReason:(id)a3 asSnapshot:(BOOL)a4
{
  if (a4)
    -[PLPowerAssertionAgent logSnapshot:](self, "logSnapshot:", a3);
  else
    -[PLPowerAssertionAgent logInterval:](self, "logInterval:", a3);
}

- (void)checkAssertionBufferFullNotificationRate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
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
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
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
  _QWORD v45[5];
  _QWORD v46[5];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD block[5];
  uint8_t buf[4];
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D179C2E0](self, a2);
  v4 = (void *)MEMORY[0x1E0C99D68];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PLPowerAssertionAgent_checkAssertionBufferFullNotificationRate__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  if (qword_1ED882858 != -1)
    dispatch_once(&qword_1ED882858, block);
  objc_msgSend(v4, "dateWithTimeIntervalSinceNow:", 0.0 - *(double *)&qword_1ED882860);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[PLPowerAssertionAgent assertionBufferNotificationTracking](self, "assertionBufferNotificationTracking");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v48 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if (objc_msgSend(v12, "compare:", v5) == -1)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v9);
  }

  -[PLPowerAssertionAgent assertionBufferNotificationTracking](self, "assertionBufferNotificationTracking");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectsInArray:", v6);

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (void *)MEMORY[0x1E0D80088];
    -[PLPowerAssertionAgent assertionBufferNotificationTracking](self, "assertionBufferNotificationTracking");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "formattedStringForDate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v3;
    v19 = (void *)MEMORY[0x1E0D80088];
    -[PLPowerAssertionAgent assertionBufferNotificationTracking](self, "assertionBufferNotificationTracking");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "formattedStringForDate:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("start=%@ end=%@"), v17, v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v3 = v18;
    v24 = (void *)v23;

  }
  else
  {
    v24 = 0;
  }
  v25 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __65__PLPowerAssertionAgent_checkAssertionBufferFullNotificationRate__block_invoke_2;
  v46[3] = &unk_1E85780C8;
  v46[4] = self;
  if (qword_1ED882868 != -1)
    dispatch_once(&qword_1ED882868, v46);
  v26 = qword_1ED882870;
  -[PLPowerAssertionAgent assertionBufferNotificationTracking](self, "assertionBufferNotificationTracking");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (v28 >= v26)
  {
    -[PLPowerAssertionAgent setAssertionBufferFullNotificationActive:withReason:](self, "setAssertionBufferFullNotificationActive:withReason:", 0, CFSTR("CheckRate"));
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v45[0] = v25;
      v45[1] = 3221225472;
      v45[2] = __65__PLPowerAssertionAgent_checkAssertionBufferFullNotificationRate__block_invoke_3;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = objc_opt_class();
      if (qword_1ED882878 != -1)
        dispatch_once(&qword_1ED882878, v45);
      if (byte_1ED88281C)
      {
        v37 = (void *)MEMORY[0x1E0CB3940];
        -[PLPowerAssertionAgent assertionBufferNotificationTracking](self, "assertionBufferNotificationTracking");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringWithFormat:", CFSTR("assertion storm! count=%lu %@"), objc_msgSend(v38, "count"), v24);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "lastPathComponent");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent checkAssertionBufferFullNotificationRate]");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v41, v42, 555);

        PLLogCommon();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v31;
          goto LABEL_32;
        }
LABEL_29:

      }
    }
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v44[0] = v25;
    v44[1] = 3221225472;
    v44[2] = __65__PLPowerAssertionAgent_checkAssertionBufferFullNotificationRate__block_invoke_283;
    v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v44[4] = objc_opt_class();
    if (qword_1ED882880 != -1)
      dispatch_once(&qword_1ED882880, v44);
    if (byte_1ED88281D)
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      -[PLPowerAssertionAgent assertionBufferNotificationTracking](self, "assertionBufferNotificationTracking");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("no storm! count=%lu %@"), objc_msgSend(v30, "count"), v24);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "lastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent checkAssertionBufferFullNotificationRate]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 557);

      PLLogCommon();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v31;
LABEL_32:
        _os_log_debug_impl(&dword_1CAF47000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        goto LABEL_29;
      }
      goto LABEL_29;
    }
  }

  objc_autoreleasePoolPop(v3);
}

- (NSMutableArray)assertionBufferNotificationTracking
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLPowerAssertionAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return &unk_1E864B6D0;
}

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("SnapshotReason");
  objc_msgSend(a1, "entryEventPointDefinitionSnapshotReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("BufferStatus");
  objc_msgSend(a1, "entryEventPointDefinitionBufferStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("AggregateReset");
  objc_msgSend(a1, "entryEventPointDefinitionAggregateReset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("TimedOutProcesses");
  objc_msgSend(a1, "entryEventPointDefinitionTimedOutProcesses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionAggregateReset
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
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8652B00;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("PidCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("Reason");
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

+ (id)entryEventPointDefinitionTimedOutProcesses
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
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8652B00;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withProcessName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("Assertion");
  objc_msgSend(a1, "entryEventForwardDefinitionAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitionAssertion
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[12];
  _QWORD v35[12];
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[2];
  _QWORD v39[4];

  v39[2] = *MEMORY[0x1E0C80C00];
  v38[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80248];
  v36[0] = *MEMORY[0x1E0D80318];
  v36[1] = v2;
  v37[0] = &unk_1E8652B10;
  v37[1] = MEMORY[0x1E0C9AAB0];
  v3 = *MEMORY[0x1E0D80250];
  v36[2] = *MEMORY[0x1E0D80288];
  v36[3] = v3;
  v37[2] = MEMORY[0x1E0C9AAB0];
  v37[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v31;
  v38[1] = *MEMORY[0x1E0D802F0];
  v34[0] = CFSTR("Action");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v29;
  v34[1] = CFSTR("timestampActionOffset");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v27;
  v34[2] = CFSTR("GlobalUniqueID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v25;
  v34[3] = CFSTR("pid");
  v4 = *MEMORY[0x1E0D802E8];
  v32[0] = *MEMORY[0x1E0D80358];
  v32[1] = v4;
  v33[0] = &unk_1E8632478;
  v33[1] = &unk_1E864FD60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v24;
  v34[4] = CFSTR("AssertName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_StringFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v22;
  v34[5] = CFSTR("AssertType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v20;
  v34[6] = CFSTR("AssertionOnBehalfOfPID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v18;
  v34[7] = CFSTR("GlobalUniqueIDReference");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v16;
  v34[8] = CFSTR("FrameworkBundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v6;
  v34[9] = CFSTR("InstanceMetadata");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v8;
  v34[10] = CFSTR("Category");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35[10] = v10;
  v34[11] = CFSTR("IsCoalesced");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commonTypeDict_BoolFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[11] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)entryEventPointDefinitionSnapshotReason
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
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8652B20;
  v12[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("Reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionBufferStatus
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
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8652B20;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("Reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("TotalCount");
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

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLPowerAssertionAgent)init
{
  PLPowerAssertionAgent *v2;
  PLPowerAssertionAgent *v3;
  PLTimer *assertionBufferFullNotificationRearmTimer;
  uint64_t v5;
  NSMutableArray *assertionBufferNotificationTracking;
  NSMutableDictionary *v7;
  NSMutableDictionary *assertionUUIDCache;
  NSMutableDictionary *v9;
  NSMutableDictionary *UUIDStartEntryCache;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PLPowerAssertionAgent;
  v2 = -[PLAgent init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    assertionBufferFullNotificationRearmTimer = v2->_assertionBufferFullNotificationRearmTimer;
    v2->_assertionBufferFullNotificationRearmTimer = 0;

    v3->_assertionBufferFullNotificationActive = 0;
    v5 = objc_opt_new();
    assertionBufferNotificationTracking = v3->_assertionBufferNotificationTracking;
    v3->_assertionBufferNotificationTracking = (NSMutableArray *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assertionUUIDCache = v3->_assertionUUIDCache;
    v3->_assertionUUIDCache = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    UUIDStartEntryCache = v3->_UUIDStartEntryCache;
    v3->_UUIDStartEntryCache = v9;

  }
  return v3;
}

- (void)initOperatorDependancies
{
  NSDictionary *v3;
  NSDictionary *startEndActionsToEnum;
  NSDictionary *v5;
  NSDictionary *assertTypeToEnum;
  NSSet *v7;
  NSSet *logAssertNameForActions;
  NSMutableDictionary *v9;
  NSMutableDictionary *assertionAggregatedLastSamplePLDataStructure;
  NSMutableDictionary *v11;
  NSMutableDictionary *assertionAggregatedLastSample;
  uint64_t v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  -[PLPowerAssertionAgent startEndActionsToEnumMapping](self, "startEndActionsToEnumMapping");
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  startEndActionsToEnum = self->_startEndActionsToEnum;
  self->_startEndActionsToEnum = v3;

  -[PLPowerAssertionAgent assertTypeToEnumMapping](self, "assertTypeToEnumMapping");
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  assertTypeToEnum = self->_assertTypeToEnum;
  self->_assertTypeToEnum = v5;

  v7 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E8632490, &unk_1E86324A8, &unk_1E86324C0, &unk_1E86324D8, 0);
  logAssertNameForActions = self->_logAssertNameForActions;
  self->_logAssertNameForActions = v7;

  v9 = (NSMutableDictionary *)objc_opt_new();
  assertionAggregatedLastSamplePLDataStructure = self->_assertionAggregatedLastSamplePLDataStructure;
  self->_assertionAggregatedLastSamplePLDataStructure = v9;

  v11 = (NSMutableDictionary *)objc_opt_new();
  assertionAggregatedLastSample = self->_assertionAggregatedLastSample;
  self->_assertionAggregatedLastSample = v11;

  -[PLPowerAssertionAgent resetIOPMSetAssertionActivityAggregateWithReason:withPidCount:](self, "resetIOPMSetAssertionActivityAggregateWithReason:withPidCount:", 1, 0);
  self->_firstBufferDrain = 1;
  self->_lastActivityOverflow = 0;
  v13 = IOPMSetAssertionActivityLog();
  -[PLOperator defaultDoubleForKey:](self, "defaultDoubleForKey:", CFSTR("AggregateAssertionResetTime"));
  v15 = v14;
  v16 = objc_alloc(MEMORY[0x1E0D80070]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator workQueue](self, "workQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke;
  v50[3] = &unk_1E8578078;
  v50[4] = self;
  v20 = (void *)objc_msgSend(v16, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v17, 1, 0, v18, v50, v15, 0.0);
  -[PLPowerAssertionAgent setRunQueryTimer:](self, "setRunQueryTimer:", v20);

  if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
  {
    if ((_DWORD)v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("******  ERROR ********* 0x%x"), v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent initOperatorDependancies]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 333);

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v21;
LABEL_11:
        _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("We have assertion Activity logging"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent initOperatorDependancies]");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v29, v30, 335);

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v21;
        goto LABEL_11;
      }
    }

  }
  if (-[PLOperator defaultBoolForKey:](self, "defaultBoolForKey:", CFSTR("AnyChange")))
  {
    v49[0] = v19;
    v49[1] = 3221225472;
    v49[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_102;
    v49[3] = &unk_1E8577F48;
    v49[4] = self;
    v31 = (void *)objc_msgSend((id)objc_opt_new(), "initWithOperator:forNotification:requireState:withBlock:", self, CFSTR("com.apple.system.powermanagement.assertions.anychange"), 0, v49);
    -[PLPowerAssertionAgent setAssertionNotification:](self, "setAssertionNotification:", v31);

    IOPMAssertionNotify();
  }
  v32 = objc_alloc(MEMORY[0x1E0D7FF80]);
  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v19;
  v48[1] = 3221225472;
  v48[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_112;
  v48[3] = &unk_1E8577F48;
  v48[4] = self;
  v34 = (void *)objc_msgSend(v32, "initWithWorkQueue:forNotification:requireState:withBlock:", v33, CFSTR("com.apple.powerlogd.flushAssertionBuffer"), 0, v48);

  -[PLPowerAssertionAgent setFlushAssertionBufferCFNotification:](self, "setFlushAssertionBufferCFNotification:", v34);
  v47[0] = v19;
  v47[1] = 3221225472;
  v47[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_119;
  v47[3] = &unk_1E8577F48;
  v47[4] = self;
  v35 = (void *)objc_msgSend((id)objc_opt_new(), "initWithOperator:forNotification:requireState:withBlock:", self, CFSTR("com.apple.powermanagement.assertions.logHighWM"), 0, v47);
  -[PLPowerAssertionAgent setAssertionBufferFullNotification:](self, "setAssertionBufferFullNotification:", v35);

  -[PLPowerAssertionAgent setAssertionBufferFullNotificationActive:withReason:](self, "setAssertionBufferFullNotificationActive:withReason:", 1, CFSTR("init"));
  v46[0] = v19;
  v46[1] = 3221225472;
  v46[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_126;
  v46[3] = &unk_1E8577F48;
  v46[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v46);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerAssertionAgent setBatteryLevelNotificiations:](self, "setBatteryLevelNotificiations:", v36);

  v45[0] = v19;
  v45[1] = 3221225472;
  v45[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_130;
  v45[3] = &unk_1E8577F48;
  v45[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "wakeEntryNotificationWithOperator:withBlock:", self, v45);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerAssertionAgent setWakeNotification:](self, "setWakeNotification:", v37);

  -[PLPowerAssertionAgent setAssertionSnapshotTimerActive:](self, "setAssertionSnapshotTimerActive:", 1);
  v44[0] = v19;
  v44[1] = 3221225472;
  v44[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_2_133;
  v44[3] = &unk_1E8577F48;
  v44[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "canSleepEntryNotificationWithOperator:withBlock:", self, v44);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerAssertionAgent setCanSleepNotification:](self, "setCanSleepNotification:", v38);

  v39 = objc_alloc(MEMORY[0x1E0D80010]);
  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForClass:", objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = *MEMORY[0x1E0C99690];
  v43[0] = v19;
  v43[1] = 3221225472;
  v43[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_3;
  v43[3] = &unk_1E8577F48;
  v43[4] = self;
  v42 = (void *)objc_msgSend(v39, "initWithWorkQueue:forNotification:withBlock:", v40, v41, v43);

  -[PLPowerAssertionAgent setDailyTaskNotification:](self, "setDailyTaskNotification:", v42);
  self->_aggregateMaxPIDCount = -[PLOperator defaultLongForKey:](self, "defaultLongForKey:", CFSTR("AggregateMaxPidCount"));
  self->_aggregteZeroDeltaCount = -[PLOperator defaultLongForKey:](self, "defaultLongForKey:", CFSTR("AggregateZeroDeltaCount"));

}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetIOPMSetAssertionActivityAggregateWithReason:withPidCount:", 2, 0xFFFFFFFFLL);
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_102(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (qword_1ED882838 != -1)
      dispatch_once(&qword_1ED882838, block);
    if (_MergedGlobals_1_18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("assertion notification handler"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent initOperatorDependancies]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 341);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v3;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "logEventForwardAssertionWithReason:asSnapshot:", &unk_1E86324A8, 0);
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_18 = result;
  return result;
}

void __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_112(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logInterval:", &unk_1E86324F0);
  if ((objc_msgSend(*(id *)(a1 + 32), "lastActivityOverflow") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "logSnapshot:", &unk_1E8632508);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Flushing the assertion buffer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent initOperatorDependancies]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 355);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v8, 0xCu);
  }

}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_119(uint64_t a1)
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
  _QWORD block[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_2_120;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (qword_1ED882840 != -1)
      dispatch_once(&qword_1ED882840, block);
    if (byte_1ED882819)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("assertion buffer notification handler"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent initOperatorDependancies]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 361);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v3;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAssertionWithReason:asSnapshot:", &unk_1E86324D8, 0);
  objc_msgSend(*(id *)(a1 + 32), "assertionBufferNotificationTracking");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  return objc_msgSend(*(id *)(a1 + 32), "checkAssertionBufferFullNotificationRate");
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_2_120(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882819 = result;
  return result;
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_126(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_2_127;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (qword_1ED882848 != -1)
      dispatch_once(&qword_1ED882848, block);
    if (byte_1ED88281A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fired on Battery level"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent initOperatorDependancies]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 369);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v3;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAssertionWithReason:asSnapshot:", &unk_1E8632490, 0);
  return objc_msgSend(*(id *)(a1 + 32), "logAggregatedAssertionActivityPLDataStructure");
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_2_127(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88281A = result;
  return result;
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_130(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAssertionSnapshotTimerActive:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setAssertionBufferFullNotificationActive:withReason:", 1, CFSTR("wake"));
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_2_133(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAssertionSnapshotTimerActive:", 0);
}

void __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  __CFString *v12;
  int v13;
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
  _QWORD v24[4];
  id v25;
  _QWORD block[4];
  const __CFString *v27;
  uint64_t v28;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_4;
    block[3] = &unk_1E8578738;
    v27 = CFSTR("DailyTasks");
    v28 = objc_opt_class();
    if (qword_1ED882850 == -1)
    {
      v12 = CFSTR("DailyTasks");
    }
    else
    {
      dispatch_once(&qword_1ED882850, block);
      v12 = (__CFString *)v27;
    }
    v13 = byte_1ED88281B;

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DailyTasks notification!"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent initOperatorDependancies]_block_invoke_3");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 390);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)location, 0xCu);
      }

    }
  }
  objc_initWeak(location, *(id *)(a1 + 32));
  v20 = objc_alloc(MEMORY[0x1E0D80070]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 30.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_140;
  v24[3] = &unk_1E8578C50;
  objc_copyWeak(&v25, location);
  v23 = (void *)objc_msgSend(v20, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v21, 0, 0, v22, v24, 0.0, 0.0);

  objc_msgSend(v23, "arm");
  objc_destroyWeak(&v25);
  objc_destroyWeak(location);

}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  byte_1ED88281B = result;
  return result;
}

void __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_140(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "logSnapshotAtMidnight:", 0);

}

- (void)logSnapshotAtMidnight:(id)a3
{
  -[PLPowerAssertionAgent logEventForwardAssertionWithReason:asSnapshot:](self, "logEventForwardAssertionWithReason:asSnapshot:", &unk_1E8632490, 1);
}

- (id)startEndActionsToEnumMapping
{
  NSDictionary *startEndActionsToEnum;

  startEndActionsToEnum = self->_startEndActionsToEnum;
  if (!startEndActionsToEnum)
  {
    self->_startEndActionsToEnum = (NSDictionary *)&unk_1E864B6F8;
    startEndActionsToEnum = self->_startEndActionsToEnum;
  }
  return startEndActionsToEnum;
}

- (id)assertTypeToEnumMapping
{
  NSDictionary *assertTypeToEnum;

  assertTypeToEnum = self->_assertTypeToEnum;
  if (!assertTypeToEnum)
  {
    self->_assertTypeToEnum = (NSDictionary *)&unk_1E864B720;
    assertTypeToEnum = self->_assertTypeToEnum;
  }
  return assertTypeToEnum;
}

- (void)resetIOPMSetAssertionActivityAggregateWithReason:(signed __int16)a3 withPidCount:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 buf;
  uint64_t v21;
  int v22;
  uint64_t v23;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  if (a4 == -1)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v21 = 0x2020000000;
    v22 = 0;
    -[PLPowerAssertionAgent assertionAggregatedLastSample](self, "assertionAggregatedLastSample");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("assertionAggregated"));
    IOReportIterate();

    v4 = *(unsigned int *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
  }
  -[PLPowerAssertionAgent logEventPointAggregateResetWithReason:withPidCount:](self, "logEventPointAggregateResetWithReason:withPidCount:", v5, v4);
  v8 = (void *)objc_opt_new();
  -[PLPowerAssertionAgent setAssertionAggregatedLastSample:](self, "setAssertionAggregatedLastSample:", v8);

  IOPMSetAssertionActivityAggregate();
  v9 = IOPMSetAssertionActivityAggregate();
  if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
  {
    if ((_DWORD)v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("******  ERROR ********* 0x%x"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent resetIOPMSetAssertionActivityAggregateWithReason:withPidCount:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 504);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v10;
LABEL_11:
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("We have assertion Activity logging"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent resetIOPMSetAssertionActivityAggregateWithReason:withPidCount:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v18, v19, 506);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v10;
        goto LABEL_11;
      }
    }

  }
}

uint64_t __87__PLPowerAssertionAgent_resetIOPMSetAssertionActivityAggregateWithReason_withPidCount___block_invoke(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 0;
}

- (void)resetIOPMSetAssertionActivityAggregatePLDataStructureWithReason:(signed __int16)a3 withPidCount:(int)a4
{
  uint64_t v4;
  uint64_t v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  if (a4 == -1)
  {
    -[PLPowerAssertionAgent assertionAggregatedLastSamplePLDataStructure](self, "assertionAggregatedLastSamplePLDataStructure");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("assertionAggregated"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v8, "count");

  }
  -[PLPowerAssertionAgent logEventPointAggregateResetWithReason:withPidCount:](self, "logEventPointAggregateResetWithReason:withPidCount:", v5, v4);
  v9 = (void *)objc_opt_new();
  -[PLPowerAssertionAgent setAssertionAggregatedLastSamplePLDataStructure:](self, "setAssertionAggregatedLastSamplePLDataStructure:", v9);

  IOPMSetAssertionActivityAggregate();
  v10 = IOPMSetAssertionActivityAggregate();
  if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
  {
    if ((_DWORD)v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("******  ERROR ********* 0x%x"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent resetIOPMSetAssertionActivityAggregatePLDataStructureWithReason:withPidCount:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 526);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v11;
LABEL_11:
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("We have assertion Activity logging"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent resetIOPMSetAssertionActivityAggregatePLDataStructureWithReason:withPidCount:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v19, v20, 528);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v11;
        goto LABEL_11;
      }
    }

  }
}

uint64_t __65__PLPowerAssertionAgent_checkAssertionBufferFullNotificationRate__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultDoubleForKey:", CFSTR("HWTimeWindow"));
  qword_1ED882860 = v2;
  return result;
}

uint64_t __65__PLPowerAssertionAgent_checkAssertionBufferFullNotificationRate__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultLongForKey:", CFSTR("HWCountLimit"));
  qword_1ED882870 = result;
  return result;
}

uint64_t __65__PLPowerAssertionAgent_checkAssertionBufferFullNotificationRate__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88281C = result;
  return result;
}

uint64_t __65__PLPowerAssertionAgent_checkAssertionBufferFullNotificationRate__block_invoke_283(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88281D = result;
  return result;
}

- (void)setAssertionBufferFullNotificationActive:(BOOL)a3 withReason:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
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
  double v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  _QWORD v95[5];
  _QWORD v96[5];
  _QWORD v97[5];
  _QWORD v98[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v101;
  uint64_t v102;

  v4 = a3;
  v102 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (qword_1ED882888 != -1)
      dispatch_once(&qword_1ED882888, block);
    if (byte_1ED88281E)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromBOOL();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("assertionBufferFullNotificationActive: current=%@ new=%@"), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent setAssertionBufferFullNotificationActive:withReason:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 563);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v101 = v11;
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (-[PLPowerAssertionAgent assertionBufferFullNotificationActive](self, "assertionBufferFullNotificationActive") != v4)
  {
    -[PLPowerAssertionAgent setAssertionBufferFullNotificationActive:](self, "setAssertionBufferFullNotificationActive:", v4);
    +[PLOperator entryKeyForType:andName:](PLPowerAssertionAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Assertion"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    v93 = (void *)v17;
    v94 = v6;
    if (v4)
    {
      if (v18)
      {
        v19 = objc_opt_class();
        v98[0] = MEMORY[0x1E0C809B0];
        v98[1] = 3221225472;
        v98[2] = __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke_291;
        v98[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v98[4] = v19;
        if (qword_1ED882890 != -1)
          dispatch_once(&qword_1ED882890, v98);
        if (byte_1ED88281F)
        {
          v20 = v17;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("assertionBufferFullNotificationActive YES"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent setAssertionBufferFullNotificationActive:withReason:]");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 570);

          PLLogCommon();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v101 = v21;
            _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v17 = v20;
        }
      }
      -[PLPowerAssertionAgent assertionBufferFullNotificationRearmTimer](self, "assertionBufferFullNotificationRearmTimer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        -[PLPowerAssertionAgent assertionBufferFullNotificationRearmTimer](self, "assertionBufferFullNotificationRearmTimer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "invalidate");

      }
      -[PLPowerAssertionAgent setAssertionBufferFullNotificationRearmTimer:](self, "setAssertionBufferFullNotificationRearmTimer:", 0);
      -[PLPowerAssertionAgent assertionBufferFullNotification](self, "assertionBufferFullNotification");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "listenForNotifications:", 1);

      IOPMAssertionNotify();
      v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v17);
      v30 = (void *)MEMORY[0x1E0CB3940];
      -[PLPowerAssertionAgent assertionBufferNotificationTracking](self, "assertionBufferNotificationTracking");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");
      v33 = (void *)MEMORY[0x1E0D80088];
      -[PLPowerAssertionAgent assertionBufferNotificationTracking](self, "assertionBufferNotificationTracking");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "formattedStringForDate:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x1E0D80088];
      -[PLPowerAssertionAgent assertionBufferNotificationTracking](self, "assertionBufferNotificationTracking");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "lastObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "formattedStringForDate:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("AssertionStorm, count=%lu start=%@ end=%@"), v32, v36, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v92;
      objc_msgSend(v92, "setObject:forKeyedSubscript:", v41, CFSTR("AssertName"));

      objc_msgSend(v92, "setObject:forKeyedSubscript:", &unk_1E86324F0, CFSTR("AssertType"));
      -[PLPowerAssertionAgent startEndActionsToEnum](self, "startEndActionsToEnum");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v94;
      objc_msgSend(v43, "objectForKeyedSubscript:", v94);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "setObject:forKeyedSubscript:", v44, CFSTR("Action"));

      objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("Action"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v45)
        objc_msgSend(v92, "setObject:forKeyedSubscript:", &unk_1E8632640, CFSTR("Action"));
      objc_msgSend(v92, "setObject:forKeyedSubscript:", &unk_1E8632658, CFSTR("GlobalUniqueID"));
      v46 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "numberWithInt:", objc_msgSend(v47, "processIdentifier"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "setObject:forKeyedSubscript:", v48, CFSTR("pid"));

      v49 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0D80068], "sharedInstance");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "timeOffsetForTimeReference:", 1);
      objc_msgSend(v49, "numberWithInt:", (int)(v51 * 1000.0));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "setObject:forKeyedSubscript:", v52, CFSTR("timestampActionOffset"));

      -[PLOperator logEntry:](self, "logEntry:", v92);
    }
    else
    {
      v53 = MEMORY[0x1E0C809B0];
      if (v18)
      {
        v97[0] = MEMORY[0x1E0C809B0];
        v97[1] = 3221225472;
        v97[2] = __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke_304;
        v97[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v97[4] = objc_opt_class();
        if (qword_1ED882898 != -1)
          dispatch_once(&qword_1ED882898, v97);
        if (byte_1ED882820)
        {
          v54 = v17;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("assertionBufferFullNotificationActive NO"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "lastPathComponent");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent setAssertionBufferFullNotificationActive:withReason:]");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "logMessage:fromFile:fromFunction:fromLineNumber:", v55, v58, v59, 588);

          PLLogCommon();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v101 = v55;
            _os_log_debug_impl(&dword_1CAF47000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v17 = v54;
          v53 = MEMORY[0x1E0C809B0];
        }
      }
      v61 = (void *)MEMORY[0x1E0C99D68];
      v96[0] = v53;
      v96[1] = 3221225472;
      v96[2] = __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke_308;
      v96[3] = &unk_1E85780C8;
      v96[4] = self;
      if (qword_1ED8828A0 != -1)
        dispatch_once(&qword_1ED8828A0, v96);
      objc_msgSend(v61, "dateWithTimeIntervalSinceNow:", *(double *)&qword_1ED8828A8);
      v62 = objc_claimAutoreleasedReturnValue();
      v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v17);
      v89 = (void *)MEMORY[0x1E0CB3940];
      -[PLPowerAssertionAgent assertionBufferNotificationTracking](self, "assertionBufferNotificationTracking");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v91, "count");
      v65 = (void *)MEMORY[0x1E0D80088];
      -[PLPowerAssertionAgent assertionBufferNotificationTracking](self, "assertionBufferNotificationTracking");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "firstObject");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "formattedStringForDate:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = (void *)MEMORY[0x1E0D80088];
      -[PLPowerAssertionAgent assertionBufferNotificationTracking](self, "assertionBufferNotificationTracking");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "lastObject");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "formattedStringForDate:", v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D80088], "formattedStringForDate:", v62);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "stringWithFormat:", CFSTR("AssertionStorm, count=%lu start=%@ end=%@ rearm=%@"), v64, v67, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setObject:forKeyedSubscript:", v73, CFSTR("AssertName"));

      objc_msgSend(v63, "setObject:forKeyedSubscript:", &unk_1E86324F0, CFSTR("AssertType"));
      -[PLPowerAssertionAgent startEndActionsToEnum](self, "startEndActionsToEnum");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v94;
      objc_msgSend(v74, "objectForKeyedSubscript:", v94);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setObject:forKeyedSubscript:", v75, CFSTR("Action"));

      objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("Action"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v76)
        objc_msgSend(v63, "setObject:forKeyedSubscript:", &unk_1E8632640, CFSTR("Action"));
      objc_msgSend(v63, "setObject:forKeyedSubscript:", &unk_1E8632658, CFSTR("GlobalUniqueID"));
      v77 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "numberWithInt:", objc_msgSend(v78, "processIdentifier"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setObject:forKeyedSubscript:", v79, CFSTR("pid"));

      v80 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0D80068], "sharedInstance");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "timeOffsetForTimeReference:", 1);
      objc_msgSend(v80, "numberWithInt:", (int)(v82 * 1000.0));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setObject:forKeyedSubscript:", v83, CFSTR("timestampActionOffset"));

      IOPMAssertionNotify();
      -[PLPowerAssertionAgent assertionBufferFullNotification](self, "assertionBufferFullNotification");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "listenForNotifications:", 0);

      -[PLPowerAssertionAgent assertionBufferNotificationTracking](self, "assertionBufferNotificationTracking");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "removeAllObjects");

      -[PLOperator logEntry:](self, "logEntry:", v63);
      v86 = objc_alloc(MEMORY[0x1E0D80070]);
      -[PLOperator workQueue](self, "workQueue");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v95[0] = MEMORY[0x1E0C809B0];
      v95[1] = 3221225472;
      v95[2] = __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke_2;
      v95[3] = &unk_1E8578078;
      v95[4] = self;
      v42 = (void *)v62;
      v88 = (void *)objc_msgSend(v86, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v62, 0, 0, v87, v95, 0.0, 0.0);
      -[PLPowerAssertionAgent setAssertionBufferFullNotificationRearmTimer:](self, "setAssertionBufferFullNotificationRearmTimer:", v88);

    }
  }

}

uint64_t __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88281E = result;
  return result;
}

uint64_t __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke_291(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88281F = result;
  return result;
}

uint64_t __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke_304(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882820 = result;
  return result;
}

uint64_t __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke_308(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultDoubleForKey:", CFSTR("HWRearmTimeInterval"));
  qword_1ED8828A8 = v2;
  return result;
}

uint64_t __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAssertionBufferFullNotificationActive:withReason:", 1, CFSTR("rearmTimer"));
}

- (void)setAssertionSnapshotTimerActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD block[5];

  v3 = a3;
  -[PLPowerAssertionAgent assertionSnapShotTimer](self, "assertionSnapShotTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PLPowerAssertionAgent assertionSnapShotTimer](self, "assertionSnapShotTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

  }
  if (v3)
  {
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PLPowerAssertionAgent_setAssertionSnapshotTimerActive___block_invoke;
    block[3] = &unk_1E85780C8;
    block[4] = self;
    if (qword_1ED8828B0 != -1)
      dispatch_once(&qword_1ED8828B0, block);
    v8 = *(double *)&qword_1ED8828B8;
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
      v8 = v8 * 6.0;
    v9 = objc_alloc(MEMORY[0x1E0D80070]);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator workQueue](self, "workQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __57__PLPowerAssertionAgent_setAssertionSnapshotTimerActive___block_invoke_2;
    v13[3] = &unk_1E8578078;
    v13[4] = self;
    v12 = (void *)objc_msgSend(v9, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v10, 1, 0, v11, v13, v8, 0.0);
    -[PLPowerAssertionAgent setAssertionSnapShotTimer:](self, "setAssertionSnapShotTimer:", v12);

  }
  else
  {
    -[PLPowerAssertionAgent setAssertionSnapShotTimer:](self, "setAssertionSnapShotTimer:", 0);
  }
}

uint64_t __57__PLPowerAssertionAgent_setAssertionSnapshotTimerActive___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultDoubleForKey:", CFSTR("SnapShotInterval"));
  qword_1ED8828B8 = v2;
  return result;
}

uint64_t __57__PLPowerAssertionAgent_setAssertionSnapshotTimerActive___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logEventForwardAssertionWithReason:asSnapshot:", &unk_1E86324A8, 1);
}

- (BOOL)assertionSnapshotTimerActive
{
  void *v2;
  BOOL v3;

  -[PLPowerAssertionAgent assertionSnapShotTimer](self, "assertionSnapShotTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __54__PLPowerAssertionAgent_shouldOptimizeSmallAssertions__block_invoke()
{
  uint64_t result;

  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "liteMode") & 1) != 0)
    result = 1;
  else
    result = objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode");
  byte_1ED882821 = result;
  return result;
}

- (void)logEventForwardAssertion
{
  -[PLPowerAssertionAgent logEventForwardAssertionWithReason:asSnapshot:](self, "logEventForwardAssertionWithReason:asSnapshot:", &unk_1E8632430, 0);
  -[PLPowerAssertionAgent logEventForwardAssertionWithReason:asSnapshot:](self, "logEventForwardAssertionWithReason:asSnapshot:", &unk_1E8632490, 1);
}

- (void)logSnapshot:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  CFDictionaryRef v14;
  unint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  char isKindOfClass;
  const __CFString *v31;
  unint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  double v36;
  double v37;
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
  uint64_t v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  unint64_t v64;
  void *v65;
  void *v66;
  id v67;
  id obj;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  NSObject *v79;
  uint64_t v80;
  _QWORD v81[5];
  _QWORD block[5];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[5];
  CFDictionaryRef AssertionsByPID;
  uint64_t v93;
  NSObject *v94;
  _BYTE v95[128];
  uint8_t v96[128];
  uint8_t buf[4];
  uint64_t v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AssertionsByPID = 0;
  v5 = IOPMCopyAssertionsByProcess(&AssertionsByPID);
  if ((_DWORD)v5)
  {
    v6 = v5;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v7 = objc_opt_class();
      v91[0] = MEMORY[0x1E0C809B0];
      v91[1] = 3221225472;
      v91[2] = __37__PLPowerAssertionAgent_logSnapshot___block_invoke;
      v91[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v91[4] = v7;
      if (qword_1ED8828C8 != -1)
        dispatch_once(&qword_1ED8828C8, v91);
      if (byte_1ED882822)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Call to IOPMCopyAssertionsByProcess failed with error 0x%x"), v6);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logSnapshot:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = (void *)v8;
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 687);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v98 = v8;
          _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        goto LABEL_52;
      }
    }
    goto LABEL_53;
  }
  v67 = v4;
  v75 = objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = AssertionsByPID;
  +[PLOperator entryKeyForType:andName:](PLPowerAssertionAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Assertion"));
  v73 = objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v70 = v14;
  -[__CFDictionary allKeys](v14, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
  if (!v71)
    goto LABEL_48;
  v69 = *(_QWORD *)v88;
  v15 = 0x1E0CB3000;
  v16 = CFSTR("Category");
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v88 != v69)
        objc_enumerationMutation(obj);
      v72 = v17;
      v18 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v17);
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v77 = v18;
      objc_msgSend(v70, "objectForKey:");
      v78 = (id)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
      if (v80)
      {
        v19 = *(_QWORD *)v84;
        v76 = *(_QWORD *)v84;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v84 != v19)
              objc_enumerationMutation(v78);
            v21 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v20);
            if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            {
              v22 = objc_opt_class();
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __37__PLPowerAssertionAgent_logSnapshot___block_invoke_331;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v22;
              if (qword_1ED8828D0 != -1)
                dispatch_once(&qword_1ED8828D0, block);
              if (byte_1ED882823)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rawAssertion=%@"), v21);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "lastPathComponent");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logSnapshot:]");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 698);

                PLLogCommon();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v98 = (uint64_t)v23;
                  _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v15 = 0x1E0CB3000uLL;
              }
            }
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("GlobalUniqueID"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              v31 = v16;
              v32 = v15;
              v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v73);
              objc_msgSend(v33, "setEntryDate:", v74);
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AssertStartWhen"));
              v34 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "entryDate");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = v34;
              -[NSObject timeIntervalSinceDate:](v34, "timeIntervalSinceDate:", v35);
              v37 = v36 * 1000.0;

              objc_msgSend(*(id *)(v32 + 2024), "numberWithDouble:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v38, CFSTR("timestampActionOffset"));

              objc_msgSend(v33, "setObject:forKeyedSubscript:", v77, CFSTR("pid"));
              objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1E8632430, CFSTR("Action"));
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("GlobalUniqueID"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v39, CFSTR("GlobalUniqueID"));

              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AssertName"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLPowerAssertionAgent sanitizeAssertionNameForEntry:](self, "sanitizeAssertionNameForEntry:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v41, CFSTR("AssertName"));

              -[PLPowerAssertionAgent assertTypeToEnum](self, "assertTypeToEnum");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AssertType"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "objectForKeyedSubscript:", v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v44, CFSTR("AssertType"));

              objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("AssertType"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v45)
                objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1E8632520, CFSTR("AssertType"));
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AssertionOnBehalfOfPID"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v46, CFSTR("AssertionOnBehalfOfPID"));

              v16 = v31;
              objc_msgSend(v21, "objectForKeyedSubscript:", v31);
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              if (v47)
              {
                objc_msgSend(v21, "objectForKeyedSubscript:", v31);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "setObject:forKeyedSubscript:", v48, v31);

              }
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("InstanceMetadata"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              if (v49)
              {
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("InstanceMetadata"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                if ((unint64_t)objc_msgSend(v50, "length") >= 0x21)
                {
                  objc_msgSend(v50, "substringToIndex:", 32);
                  v51 = objc_claimAutoreleasedReturnValue();

                  v50 = (void *)v51;
                }
                objc_msgSend(v33, "setObject:forKeyedSubscript:", v50, CFSTR("InstanceMetadata"));

              }
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("FrameworkBundleID"));
              v52 = (void *)objc_claimAutoreleasedReturnValue();

              if (v52)
              {
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("FrameworkBundleID"));
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "setObject:forKeyedSubscript:", v53, CFSTR("FrameworkBundleID"));

              }
              -[NSObject addObject:](v75, "addObject:", v33);
              v19 = v76;
              v54 = v79;
LABEL_43:

              v15 = 0x1E0CB3000;
              goto LABEL_44;
            }
            if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            {
              v55 = objc_opt_class();
              v81[0] = MEMORY[0x1E0C809B0];
              v81[1] = 3221225472;
              v81[2] = __37__PLPowerAssertionAgent_logSnapshot___block_invoke_338;
              v81[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v81[4] = v55;
              if (qword_1ED8828D8 != -1)
                dispatch_once(&qword_1ED8828D8, v81);
              if (byte_1ED882824)
              {
                v56 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("GlobalUniqueID"));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "stringWithFormat:", CFSTR("ERROR: GlobalUniqueID for assertion is not a number: %@"), v57);
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                v58 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "lastPathComponent");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logSnapshot:]");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v60, v61, 728);

                PLLogCommon();
                v54 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v98 = (uint64_t)v33;
                  _os_log_debug_impl(&dword_1CAF47000, v54, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
                goto LABEL_43;
              }
            }
LABEL_44:
            ++v20;
          }
          while (v80 != v20);
          v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
        }
        while (v80);
      }

      v17 = v72 + 1;
    }
    while (v72 + 1 != v71);
    v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
  }
  while (v71);
LABEL_48:

  v13 = v75;
  if (-[NSObject count](v75, "count"))
  {
    v62 = (void *)v73;
    v93 = v73;
    v94 = v75;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v63, v73);
    v4 = v67;
    v64 = 0x1E0D7F000;
  }
  else
  {
    v64 = 0x1E0D7F000uLL;
    v62 = (void *)v73;
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v73);
    objc_msgSend(v63, "setIsErrorEntry:", 1);
    objc_msgSend(v63, "setObject:forKeyedSubscript:", CFSTR("No assertions open"), CFSTR("__PLEntryErrorString__"));
    -[PLOperator logEntry:](self, "logEntry:", v63);
    v4 = v67;
  }

  +[PLOperator entryKeyForType:andName:](PLPowerAssertionAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("SnapshotReason"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend(objc_alloc(*(Class *)(v64 + 4016)), "initWithEntryKey:", v65);
  objc_msgSend(v66, "setObject:forKeyedSubscript:", v4, CFSTR("Reason"));
  -[PLOperator logEntry:](self, "logEntry:", v66);

LABEL_52:
LABEL_53:

}

uint64_t __37__PLPowerAssertionAgent_logSnapshot___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882822 = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logSnapshot___block_invoke_331(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882823 = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logSnapshot___block_invoke_338(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882824 = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  byte_1ED882825 = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882826 = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_356(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882827 = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_361(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882828 = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_368(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882829 = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_377(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88282A = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_382(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88282B = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_387(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88282C = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_394(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88282D = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_399(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88282E = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_404(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88282F = result;
  return result;
}

- (void)logEventPointAggregateResetWithReason:(signed __int16)a3 withPidCount:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLPowerAssertionAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("AggregateReset"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("Reason"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("PidCount"));

  -[PLOperator logEntry:](self, "logEntry:", v7);
}

- (void)logAggregatedAssertionActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *SamplesDelta;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[5];
  _QWORD block[19];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[4];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  int v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    v3 = (void *)IOPMCopyAssertionActivityAggregate();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = 0;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    if (v3)
    {
      -[PLPowerAssertionAgent assertionAggregatedLastSample](self, "assertionAggregatedLastSample");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("assertionAggregated"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[PLPowerAssertionAgent assertionAggregatedLastSample](self, "assertionAggregatedLastSample");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("assertionAggregatedDate"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        -[PLPowerAssertionAgent assertionAggregatedLastSample](self, "assertionAggregatedLastSample");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("assertionAggregated"));
        SamplesDelta = (void *)IOReportCreateSamplesDelta();

        v43[0] = 0;
        v43[1] = v43;
        v43[2] = 0x2020000000;
        v43[3] = 0;
        v37 = 0;
        v38 = &v37;
        v39 = 0x3032000000;
        v40 = __Block_byref_object_copy__3;
        v41 = __Block_byref_object_dispose__3;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v42 = (id)objc_claimAutoreleasedReturnValue();
        block[13] = MEMORY[0x1E0C809B0];
        block[14] = 3221225472;
        block[15] = __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke;
        block[16] = &unk_1E8579CD0;
        block[17] = v43;
        block[18] = &v48;
        IOReportIterate();
        block[5] = MEMORY[0x1E0C809B0];
        block[6] = 3221225472;
        block[7] = __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_2;
        block[8] = &unk_1E8579CF8;
        block[9] = self;
        block[10] = &v44;
        block[11] = v43;
        block[12] = &v37;
        IOReportIterate();
        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "createDistributionEventIntervalWithDistributionID:withChildNodeNameToWeight:withStartDate:withEndDate:", 22, v38[5], v34, v4);

        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v11 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_420;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v11;
          if (qword_1ED882948 != -1)
            dispatch_once(&qword_1ED882948, block);
          if (byte_1ED882832)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+++++++++++++++++++++++++++++++++++++++++"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "lastPathComponent");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logAggregatedAssertionActivity]");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 1006);

            PLLogCommon();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v53 = v12;
              _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v18 = objc_opt_class();
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_425;
          v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v35[4] = v18;
          if (qword_1ED882950 != -1)
            dispatch_once(&qword_1ED882950, v35);
          if (byte_1ED882833)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OLDlogging: start date: %@, end dat %@, accounting:%@"), v34, v4, v38[5]);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "lastPathComponent");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logAggregatedAssertionActivity]");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 1007);

            PLLogCommon();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v53 = v19;
              _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        _Block_object_dispose(&v37, 8);

        _Block_object_dispose(v43, 8);
      }
      -[PLPowerAssertionAgent assertionAggregatedLastSample](self, "assertionAggregatedLastSample");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKey:", v3, CFSTR("assertionAggregated"));

      -[PLPowerAssertionAgent assertionAggregatedLastSample](self, "assertionAggregatedLastSample");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v4, CFSTR("assertionAggregatedDate"));

      v27 = *((int *)v49 + 6);
      v28 = -[PLPowerAssertionAgent aggregateMaxPIDCount](self, "aggregateMaxPIDCount");
      v29 = *((unsigned int *)v49 + 6);
      if (v28 >= v27)
      {
        v31 = *((_DWORD *)v45 + 6);
        v32 = -[PLPowerAssertionAgent aggregteZeroDeltaCount](self, "aggregteZeroDeltaCount");
        v33 = (_DWORD)v29 == v31;
        v29 = *((unsigned int *)v49 + 6);
        if (v32 != v33)
        {
          -[PLPowerAssertionAgent logEventPointAggregateResetWithReason:withPidCount:](self, "logEventPointAggregateResetWithReason:withPidCount:", 0, *((unsigned int *)v49 + 6));
          goto LABEL_25;
        }
        v30 = 4;
      }
      else
      {
        v30 = 3;
      }
    }
    else
    {
      v29 = 0;
      v30 = 1;
    }
    -[PLPowerAssertionAgent resetIOPMSetAssertionActivityAggregateWithReason:withPidCount:](self, "resetIOPMSetAssertionActivityAggregateWithReason:withPidCount:", v30, v29);
LABEL_25:
    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v48, 8);

  }
}

uint64_t __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += IOReportArrayGetValueAtIndex();
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return 0;
}

uint64_t __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_2(uint64_t a1)
{
  uint64_t ChannelID;
  uint64_t ValueAtIndex;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  _QWORD block[5];
  _QWORD v28[5];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  ChannelID = IOReportChannelGetChannelID();
  ValueAtIndex = IOReportArrayGetValueAtIndex();
  v4 = IOReportArrayGetValueAtIndex();
  v5 = IOReportArrayGetValueAtIndex();
  if (ValueAtIndex < 0 || v4 < 0 || (v6 = v5, v5 < 0))
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  else
  {
    if (ValueAtIndex || v4 || v5)
    {
      if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= 1)
      {
        v7 = (double)IOReportArrayGetValueAtIndex()
           / (double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        if (v7 > 0.05)
        {
          objc_msgSend(*(id *)(a1 + 32), "bundleIDForAssertionProcessPID:", ChannelID);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v9, v8);

          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v10 = objc_opt_class();
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_3;
            v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v28[4] = v10;
            if (qword_1ED882938 != -1)
              dispatch_once(&qword_1ED882938, v28);
            if (byte_1ED882830)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Total %llu, name %@, contribution %d, weight %f"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v8, ChannelID, *(_QWORD *)&v7);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "lastPathComponent");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logAggregatedAssertionActivity]_block_invoke_2");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v12, v13, 991);

              PLLogCommon();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v30 = v11;
                _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

            }
          }

        }
      }
    }
    else
    {
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v15 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_416;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v15;
      if (qword_1ED882940 != -1)
        dispatch_once(&qword_1ED882940, block);
      if (byte_1ED882831)
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 32), "bundleIDForAssertionProcessPID:", ChannelID);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("pid=%d name=%@ eff1=%lld eff2=%lld eff3=%lld"), ChannelID, v17, ValueAtIndex, v4, v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logAggregatedAssertionActivity]_block_invoke_2");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 997);

        PLLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v18;
          _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  return 0;
}

uint64_t __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882830 = result;
  return result;
}

uint64_t __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_416(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882831 = result;
  return result;
}

uint64_t __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_420(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882832 = result;
  return result;
}

uint64_t __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_425(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882833 = result;
  return result;
}

- (void)logAggregatedAssertionActivityPLDataStructure
{
  void *v2;
  BOOL v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  int v53;
  int64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  unsigned int v59;
  void *v60;
  _QWORD v62[5];
  _QWORD block[5];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t);
  void *v75;
  id v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  int v81;
  uint8_t buf[4];
  void *v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    v57 = (void *)IOPMCopyAssertionActivityAggregate();
    v58 = (void *)objc_opt_new();
    v78 = 0;
    v79 = &v78;
    v80 = 0x2020000000;
    v81 = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      v72 = MEMORY[0x1E0C809B0];
      v73 = 3221225472;
      v74 = __70__PLPowerAssertionAgent_logAggregatedAssertionActivityPLDataStructure__block_invoke;
      v75 = &unk_1E8579D20;
      v77 = &v78;
      v76 = v58;
      IOReportIterate();

    }
    if (v58 && objc_msgSend(v58, "count"))
    {
      -[PLPowerAssertionAgent assertionAggregatedLastSamplePLDataStructure](self, "assertionAggregatedLastSamplePLDataStructure");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "count") == 0;

      if (v3)
      {
        v59 = 0;
      }
      else
      {
        -[PLPowerAssertionAgent assertionAggregatedLastSamplePLDataStructure](self, "assertionAggregatedLastSamplePLDataStructure");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assertionAggregatedDate"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v5 = v58;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
        if (v6)
        {
          v59 = 0;
          v7 = *(_QWORD *)v69;
          v8 = 0.0;
          do
          {
            v9 = 0;
            v59 += v6;
            do
            {
              if (*(_QWORD *)v69 != v7)
                objc_enumerationMutation(v5);
              v10 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v9);
              objc_msgSend(v5, "objectForKeyedSubscript:", v10);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLPowerAssertionAgent assertionAggregatedLastSamplePLDataStructure](self, "assertionAggregatedLastSamplePLDataStructure");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("assertionAggregated"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", v10);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v11, "doubleValue");
              v16 = v15;
              objc_msgSend(v14, "doubleValue");
              v18 = v17;

              v8 = v8 + v16 - v18;
              ++v9;
            }
            while (v6 != v9);
            v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
          }
          while (v6);
        }
        else
        {
          v59 = 0;
          v8 = 0.0;
        }

        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v21 = v5;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v65;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v65 != v23)
                objc_enumerationMutation(v21);
              v25 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
              objc_msgSend(v21, "objectForKeyedSubscript:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLPowerAssertionAgent assertionAggregatedLastSamplePLDataStructure](self, "assertionAggregatedLastSamplePLDataStructure");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("assertionAggregated"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectForKeyedSubscript:", v25);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (v8 > 0.0)
              {
                objc_msgSend(v26, "doubleValue");
                v31 = v30;
                objc_msgSend(v29, "doubleValue");
                v33 = (v31 - v32) / v8;
                if (v33 > 0.05)
                {
                  -[PLPowerAssertionAgent bundleIDForAssertionProcessPID:](self, "bundleIDForAssertionProcessPID:", objc_msgSend(v25, "integerValue"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "setObject:forKeyedSubscript:", v35, v34);

                }
              }

            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
          }
          while (v22);
        }

        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "createDistributionEventIntervalWithDistributionID:withChildNodeNameToWeight:withStartDate:withEndDate:", 22, v60, v55, v56);

        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v37 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __70__PLPowerAssertionAgent_logAggregatedAssertionActivityPLDataStructure__block_invoke_2;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v37;
          if (qword_1ED882958 != -1)
            dispatch_once(&qword_1ED882958, block);
          if (byte_1ED882834)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+++++++++++++++++++++++++++++++++++++++++"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "lastPathComponent");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logAggregatedAssertionActivityPLDataStructure]");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v38, v41, v42, 1091);

            PLLogCommon();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v83 = v38;
              _os_log_debug_impl(&dword_1CAF47000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v44 = objc_opt_class();
          v62[0] = MEMORY[0x1E0C809B0];
          v62[1] = 3221225472;
          v62[2] = __70__PLPowerAssertionAgent_logAggregatedAssertionActivityPLDataStructure__block_invoke_430;
          v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v62[4] = v44;
          if (qword_1ED882960 != -1)
            dispatch_once(&qword_1ED882960, v62);
          if (byte_1ED882835)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Newlogging: start date: %@, end dat %@, accounting:%@"), v55, v56, v60);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "lastPathComponent");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPowerAssertionAgent logAggregatedAssertionActivityPLDataStructure]");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "logMessage:fromFile:fromFunction:fromLineNumber:", v45, v48, v49, 1092);

            PLLogCommon();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v83 = v45;
              _os_log_debug_impl(&dword_1CAF47000, v50, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }

      }
      -[PLPowerAssertionAgent assertionAggregatedLastSamplePLDataStructure](self, "assertionAggregatedLastSamplePLDataStructure");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setObject:forKeyedSubscript:", v58, CFSTR("assertionAggregated"));

      -[PLPowerAssertionAgent assertionAggregatedLastSamplePLDataStructure](self, "assertionAggregatedLastSamplePLDataStructure");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setObject:forKeyedSubscript:", v56, CFSTR("assertionAggregatedDate"));

      if (-[PLPowerAssertionAgent aggregateMaxPIDCount](self, "aggregateMaxPIDCount") >= (int)v59)
      {
        v53 = *((_DWORD *)v79 + 6);
        v54 = -[PLPowerAssertionAgent aggregteZeroDeltaCount](self, "aggregteZeroDeltaCount");
        v19 = v59;
        if (v54 != (v59 == v53))
        {
          -[PLPowerAssertionAgent logEventPointAggregateResetWithReason:withPidCount:](self, "logEventPointAggregateResetWithReason:withPidCount:", 0);
          goto LABEL_48;
        }
        v20 = 4;
      }
      else
      {
        v20 = 3;
        v19 = v59;
      }
    }
    else
    {
      v19 = 0;
      v20 = 1;
    }
    -[PLPowerAssertionAgent resetIOPMSetAssertionActivityAggregatePLDataStructureWithReason:withPidCount:](self, "resetIOPMSetAssertionActivityAggregatePLDataStructureWithReason:withPidCount:", v20, v19);
LABEL_48:

    _Block_object_dispose(&v78, 8);
  }
}

uint64_t __70__PLPowerAssertionAgent_logAggregatedAssertionActivityPLDataStructure__block_invoke(uint64_t a1)
{
  uint64_t ChannelID;
  uint64_t ValueAtIndex;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  ChannelID = IOReportChannelGetChannelID();
  ValueAtIndex = IOReportArrayGetValueAtIndex();
  v4 = IOReportArrayGetValueAtIndex();
  v5 = IOReportArrayGetValueAtIndex();
  if (ValueAtIndex < 0 || v4 < 0 || v5 < 0)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  else if (ValueAtIndex || v4 || v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)IOReportArrayGetValueAtIndex());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", ChannelID);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  return 0;
}

uint64_t __70__PLPowerAssertionAgent_logAggregatedAssertionActivityPLDataStructure__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882834 = result;
  return result;
}

uint64_t __70__PLPowerAssertionAgent_logAggregatedAssertionActivityPLDataStructure__block_invoke_430(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882835 = result;
  return result;
}

- (id)bundleIDForAssertionProcessPID:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v3 = *(_QWORD *)&a3;
  -[PLOperator storage](self, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processIDEntryForPid:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_6;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BundleID"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BundleID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", &stru_1E8587D00);

    if ((v10 & 1) == 0)
    {
      v17 = CFSTR("BundleID");
LABEL_9:
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ProcessName"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ProcessName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", &stru_1E8587D00);

    if ((v15 & 1) == 0)
    {
      v17 = CFSTR("ProcessName");
      goto LABEL_9;
    }
  }
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AssertionPID-%d"), v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v16;
}

- (PLCFNotificationOperatorComposition)assertionNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAssertionNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLCFNotificationOperatorComposition)assertionBufferFullNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAssertionBufferFullNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLTimer)assertionBufferFullNotificationRearmTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAssertionBufferFullNotificationRearmTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)assertionBufferFullNotificationActive
{
  return self->_assertionBufferFullNotificationActive;
}

- (void)setAssertionBufferFullNotificationActive:(BOOL)a3
{
  self->_assertionBufferFullNotificationActive = a3;
}

- (void)setAssertionBufferNotificationTracking:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLEntryNotificationOperatorComposition)batteryLevelNotificiations
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBatteryLevelNotificiations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLEntryNotificationOperatorComposition)wakeNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setWakeNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLEntryNotificationOperatorComposition)canSleepNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCanSleepNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLNSNotificationOperatorComposition)dailyTaskNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDailyTaskNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLCFNotificationOperatorComposition)flushAssertionBufferCFNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFlushAssertionBufferCFNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLTimer)runQueryTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRunQueryTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (PLTimer)assertionSnapShotTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAssertionSnapShotTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (int64_t)aggregateMaxPIDCount
{
  return self->_aggregateMaxPIDCount;
}

- (void)setAggregateMaxPIDCount:(int64_t)a3
{
  self->_aggregateMaxPIDCount = a3;
}

- (int64_t)aggregteZeroDeltaCount
{
  return self->_aggregteZeroDeltaCount;
}

- (void)setAggregteZeroDeltaCount:(int64_t)a3
{
  self->_aggregteZeroDeltaCount = a3;
}

- (NSMutableDictionary)assertionAggregatedLastSamplePLDataStructure
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAssertionAggregatedLastSamplePLDataStructure:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSMutableDictionary)assertionAggregatedLastSample
{
  return self->_assertionAggregatedLastSample;
}

- (void)setAssertionAggregatedLastSample:(id)a3
{
  objc_storeStrong((id *)&self->_assertionAggregatedLastSample, a3);
}

- (BOOL)lastActivityOverflow
{
  return self->_lastActivityOverflow;
}

- (void)setAssertionUUIDCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (void)setUUIDStartEntryCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUIDStartEntryCache, 0);
  objc_storeStrong((id *)&self->_assertionUUIDCache, 0);
  objc_storeStrong((id *)&self->_logAssertNameForActions, 0);
  objc_storeStrong((id *)&self->_assertTypeToEnum, 0);
  objc_storeStrong((id *)&self->_startEndActionsToEnum, 0);
  objc_storeStrong((id *)&self->_assertionAggregatedLastSample, 0);
  objc_storeStrong((id *)&self->_assertionAggregatedLastSamplePLDataStructure, 0);
  objc_storeStrong((id *)&self->_assertionSnapShotTimer, 0);
  objc_storeStrong((id *)&self->_runQueryTimer, 0);
  objc_storeStrong((id *)&self->_flushAssertionBufferCFNotification, 0);
  objc_storeStrong((id *)&self->_dailyTaskNotification, 0);
  objc_storeStrong((id *)&self->_canSleepNotification, 0);
  objc_storeStrong((id *)&self->_wakeNotification, 0);
  objc_storeStrong((id *)&self->_batteryLevelNotificiations, 0);
  objc_storeStrong((id *)&self->_assertionBufferNotificationTracking, 0);
  objc_storeStrong((id *)&self->_assertionBufferFullNotificationRearmTimer, 0);
  objc_storeStrong((id *)&self->_assertionBufferFullNotification, 0);
  objc_storeStrong((id *)&self->_assertionNotification, 0);
}

@end
