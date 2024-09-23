@implementation PLDuetServiceWithAccounting

- (id)energyResponse
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _QWORD v33[3];
  _QWORD v34[3];
  uint8_t buf[4];
  void *v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEFAULT, "┏ PLDuetService energyResponse start", buf, 2u);
  }

  -[PLDuetServiceImpl duetService](self, "duetService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLDuetServiceWithAccounting energyResponseWithQualificationID:](self, "energyResponseWithQualificationID:", 11);
    v5 = objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[NSObject count](v5, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v7;
      _os_log_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEFAULT, "┃ PLDuetService discretionaryCumulativeEnergies count: %d", buf, 8u);
    }

    -[PLDuetServiceWithAccounting energyResponseWithQualificationID:](self, "energyResponseWithQualificationID:", 12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v10;
      _os_log_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEFAULT, "┃ PLDuetService complicationCumulativeEnergies count: %d", buf, 8u);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v8);
    v37[0] = CFSTR("BLMEnergyForDuet");
    v37[1] = CFSTR("BLMUUIDForDuet");
    v38[0] = v11;
    -[PLDuetServiceImpl duetService](self, "duetService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "getLastQualifiedEnergyEventDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v17;
      _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "lastQualifiedDate=%@", buf, 0xCu);
    }

    if (v17)
    {
      objc_msgSend(v17, "convertFromMonotonicToSystem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
LABEL_25:

        v34[0] = v11;
        -[PLDuetServiceImpl duetService](self, "duetService", CFSTR("BLMEnergyForDuet"), CFSTR("BLMUUIDForDuet"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "storage");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "uuid");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v33[2] = CFSTR("BLMEnergyResponseTimestamp");
        v34[1] = v30;
        v34[2] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        PLLogCommon();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CAF47000, v31, OS_LOG_TYPE_DEFAULT, "┗ PLDuetService energyResponse created", buf, 2u);
        }

        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      v36 = v19;
      v21 = "After converting to system time, energyResponseTimestamp=%@";
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D7FF60], "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastCompletedDateWithIdentifier:", CFSTR("PLDuetService_duetEnergyAccumulator"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "dateByAddingTimeInterval:", -3600.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v25;
        _os_log_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_INFO, "lastAccumulatedDate=%@", buf, 0xCu);
      }

      objc_msgSend(v25, "convertFromMonotonicToSystem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogCommon();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v19;
        _os_log_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_INFO, "After converting to system time, lastAccumulatedDate=%@", buf, 0xCu);
      }

      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        goto LABEL_25;
      *(_DWORD *)buf = 138412290;
      v36 = v19;
      v21 = "energyResponse timestamp is lastAccumulatedDate=%@";
    }
    _os_log_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
    goto LABEL_25;
  }
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_ERROR, "┗ PLDuetService energyResponse not created: duetService not found", buf, 2u);
  }
  v22 = (void *)MEMORY[0x1E0C9AA70];
LABEL_28:

  return v22;
}

- (id)energyResponseWithQualificationID:(int)a3
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
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
  NSObject *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  unint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  NSObject *v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  double v97;
  void *v98;
  NSObject *v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  double v104;
  uint64_t j;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  NSObject *v113;
  void *v114;
  double v115;
  NSObject *v116;
  uint64_t v117;
  uint64_t v118;
  NSObject *v119;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  NSObject *v126;
  id v128;
  id obj;
  uint64_t v130;
  uint64_t v131;
  unsigned int v132;
  id v133;
  id v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _QWORD block[5];
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _QWORD v144[5];
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _QWORD v149[5];
  _QWORD v150[5];
  uint8_t buf[4];
  uint64_t v152;
  __int16 v153;
  double v154;
  __int16 v155;
  uint64_t v156;
  _QWORD v157[3];
  _QWORD v158[3];
  _BYTE v159[128];
  _BYTE v160[128];
  _QWORD v161[3];
  _BYTE v162[128];
  _QWORD v163[4];

  v3 = *(_QWORD *)&a3;
  v163[1] = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_INFO, "┃ ┏ PLDuetService energyResponseWithQualificationID start", buf, 2u);
  }

  -[PLDuetServiceImpl duetService](self, "duetService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_78:
      v134 = 0;
      goto LABEL_85;
    }
    *(_WORD *)buf = 0;
    v15 = "┃ ┗ PLDuetService energyResponseWithQualificationID: duetService not found";
    v16 = v14;
    v17 = 2;
LABEL_87:
    _os_log_error_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    goto LABEL_78;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    v150[0] = MEMORY[0x1E0C809B0];
    v150[1] = 3221225472;
    v150[2] = __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke;
    v150[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v150[4] = v6;
    if (qword_1ED885378 != -1)
      dispatch_once(&qword_1ED885378, v150);
    if (byte_1ED885334)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("qualificationID=%i"), v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting energyResponseWithQualificationID:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 444);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v152 = (uint64_t)v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if ((_DWORD)v3 == 11)
  {
    v13 = 1;
    goto LABEL_17;
  }
  if ((_DWORD)v3 != 12)
  {
    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_78;
    *(_DWORD *)buf = 67109120;
    LODWORD(v152) = 0;
    v15 = "┃ ┗ PLDuetService energyResponseWithQualificationID: unexpected updateType %d";
    v16 = v14;
    v17 = 8;
    goto LABEL_87;
  }
  v13 = 2;
LABEL_17:
  v132 = v13;
  PLLogCommon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v152) = v132;
    _os_log_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEFAULT, "┃ ┃ PLDuetService energyResponseWithQualificationID: updateType %d", buf, 8u);
  }

  -[PLDuetServiceImpl duetService](self, "duetService");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_opt_class();
  v21 = *MEMORY[0x1E0D80368];
  objc_msgSend(v20, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("DuetEnergyAccumulator"));
  v22 = objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc(MEMORY[0x1E0D80080]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithKey:withValue:withComparisonOperation:", CFSTR("QualificationID"), v24, 0);

  -[PLDuetServiceImpl duetService](self, "duetService");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "storage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v163[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v163, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v22;
  objc_msgSend(v27, "entriesForKey:withComparisons:", v22, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v30 = objc_opt_class();
    v149[0] = MEMORY[0x1E0C809B0];
    v149[1] = 3221225472;
    v149[2] = __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_163;
    v149[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v149[4] = v30;
    if (qword_1ED885380 != -1)
      dispatch_once(&qword_1ED885380, v149);
    if (byte_1ED885335)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("accumulatorEntries=%@"), v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "lastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting energyResponseWithQualificationID:]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 468);

      PLLogCommon();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v152 = (uint64_t)v31;
        _os_log_debug_impl(&dword_1CAF47000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  PLLogCommon();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    v38 = objc_msgSend(v29, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v152) = v38;
    _os_log_impl(&dword_1CAF47000, v37, OS_LOG_TYPE_INFO, "┃ ┃ PLDuetService energyResponseWithQualificationID accumulatorEntries count: %d", buf, 8u);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v133 = (id)objc_claimAutoreleasedReturnValue();
  v145 = 0u;
  v146 = 0u;
  v147 = 0u;
  v148 = 0u;
  obj = v29;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v162, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v146;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v146 != v41)
          objc_enumerationMutation(obj);
        v43 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * i);
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("Energy"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("BundleID"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "setObject:forKeyedSubscript:", v44, v45);

      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v162, 16);
    }
    while (v40);
  }

  objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", v21, *MEMORY[0x1E0D80168]);
  v46 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FF60], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "lastCompletedDateWithIdentifier:", CFSTR("PLDuetService_duetEnergyAccumulator"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "dateByAddingTimeInterval:", -3600.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v50 = objc_alloc(MEMORY[0x1E0D80080]);
  v51 = (void *)MEMORY[0x1E0CB37E8];
  v124 = v49;
  objc_msgSend(v49, "timeIntervalSince1970");
  objc_msgSend(v51, "numberWithDouble:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v50, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v52, 2);

  v54 = objc_alloc(MEMORY[0x1E0D80080]);
  v55 = *MEMORY[0x1E0D80180];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v54, "initWithKey:withValue:withComparisonOperation:", v55, v56, 0);

  v58 = objc_alloc(MEMORY[0x1E0D80080]);
  v131 = *MEMORY[0x1E0D80178];
  v59 = objc_msgSend(v58, "initWithKey:withValue:withComparisonOperation:");
  -[PLDuetServiceImpl duetService](self, "duetService");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "storage");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = (void *)v57;
  v123 = (void *)v53;
  v161[0] = v53;
  v161[1] = v57;
  v121 = (void *)v59;
  v161[2] = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v161, 3);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = (void *)v46;
  objc_msgSend(v61, "entriesForKey:withComparisons:", v46, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = 0x1E0D7F000uLL;
  v65 = v133;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v66 = objc_opt_class();
    v144[0] = MEMORY[0x1E0C809B0];
    v144[1] = 3221225472;
    v144[2] = __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_175;
    v144[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v144[4] = v66;
    if (qword_1ED885388 != -1)
      dispatch_once(&qword_1ED885388, v144);
    if (byte_1ED885336)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aggregateQualificationEnergyEntries=%@"), v63);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "lastPathComponent");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting energyResponseWithQualificationID:]");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "logMessage:fromFile:fromFunction:fromLineNumber:", v67, v70, v71, 501);

      PLLogCommon();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v152 = (uint64_t)v67;
        _os_log_debug_impl(&dword_1CAF47000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v65 = v133;
    }
  }
  PLLogCommon();
  v73 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    v74 = objc_msgSend(v63, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v152) = v74;
    _os_log_impl(&dword_1CAF47000, v73, OS_LOG_TYPE_INFO, "┃ ┃ PLDuetService energyResponseWithQualificationID aggregateQualificationEnergyEntries count: %d", buf, 8u);
  }

  v142 = 0u;
  v143 = 0u;
  v140 = 0u;
  v141 = 0u;
  v128 = v63;
  v75 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v140, v160, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v141;
    v130 = *MEMORY[0x1E0D80170];
    do
    {
      v78 = 0;
      do
      {
        if (*(_QWORD *)v141 != v77)
          objc_enumerationMutation(v128);
        v79 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * v78);
        objc_msgSend(MEMORY[0x1E0D7FEE8], "sharedInstance");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "objectForKeyedSubscript:", v131);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "nodeNameForNodeID:", v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(*(id *)(v64 + 4000), "debugEnabled"))
        {
          v83 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_181;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v83;
          if (qword_1ED885390 != -1)
            dispatch_once(&qword_1ED885390, block);
          if (byte_1ED885337)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleID=%@"), v82);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "lastPathComponent");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting energyResponseWithQualificationID:]");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "logMessage:fromFile:fromFunction:fromLineNumber:", v84, v87, v88, 508);

            PLLogCommon();
            v89 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v152 = (uint64_t)v84;
              _os_log_debug_impl(&dword_1CAF47000, v89, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v64 = 0x1E0D7F000;
            v65 = v133;
          }
        }
        if (v82)
        {
          objc_msgSend(v79, "objectForKeyedSubscript:", v130);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "doubleValue");
          v92 = v91 / 1000.0;

          v93 = fmin(v92, 10000.0);
          objc_msgSend(v65, "objectForKeyedSubscript:", v82);
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          v95 = (void *)MEMORY[0x1E0CB37E8];
          if (v94)
          {
            objc_msgSend(v65, "objectForKeyedSubscript:", v82);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "doubleValue");
            objc_msgSend(v95, "numberWithDouble:", v93 + v97);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "setObject:forKeyedSubscript:", v98, v82);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v93);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "setObject:forKeyedSubscript:", v96, v82);
          }

        }
        ++v78;
      }
      while (v76 != v78);
      v76 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v140, v160, 16);
    }
    while (v76);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v134 = (id)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v99 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAF47000, v99, OS_LOG_TYPE_INFO, "┃ ┃ ┏ PLDuetService energyResponseWithQualificationID cumulativeEnergies", buf, 2u);
  }

  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v100 = v65;
  v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v135, v159, 16);
  if (v101)
  {
    v102 = v101;
    v103 = *(_QWORD *)v136;
    v104 = 0.0;
    do
    {
      for (j = 0; j != v102; ++j)
      {
        if (*(_QWORD *)v136 != v103)
          objc_enumerationMutation(v100);
        v158[0] = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * j);
        v106 = (void *)v158[0];
        v157[0] = CFSTR("bundleID");
        v157[1] = CFSTR("updateType");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v132);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v158[1] = v107;
        v157[2] = CFSTR("energy");
        objc_msgSend(v100, "objectForKeyedSubscript:", v106);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v158[2] = v108;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v158, v157, 3);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "addObject:", v109);

        objc_msgSend(v100, "objectForKeyedSubscript:", v106);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "doubleValue");
        v112 = v111;

        PLLogCommon();
        v113 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v100, "objectForKeyedSubscript:", v106);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "doubleValue");
          *(_DWORD *)buf = 138412546;
          v152 = (uint64_t)v106;
          v153 = 2048;
          v154 = v115;
          _os_log_impl(&dword_1CAF47000, v113, OS_LOG_TYPE_INFO, "┃ ┃ ┃ PLDuetService energyResponseWithQualificationID cumulativeEnergies %@: %f", buf, 0x16u);

        }
        v104 = v104 + v112;

      }
      v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v135, v159, 16);
    }
    while (v102);
  }
  else
  {
    v104 = 0.0;
  }

  PLLogCommon();
  v116 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
  {
    v117 = objc_msgSend(v134, "count");
    objc_msgSend(v124, "timeIntervalSince1970");
    *(_DWORD *)buf = 134218496;
    v152 = v117;
    v153 = 2048;
    v154 = v104;
    v155 = 2048;
    v156 = v118;
    _os_log_impl(&dword_1CAF47000, v116, OS_LOG_TYPE_DEFAULT, "┃ ┃ ┗ PLDuetService energyResponseWithQualificationID cumulativeEnergies %lu items with %f since %f", buf, 0x20u);
  }

  PLLogCommon();
  v119 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAF47000, v119, OS_LOG_TYPE_INFO, "┃ ┗ PLDuetService energyResponseWithQualificationID created", buf, 2u);
  }

  v14 = v126;
LABEL_85:

  return v134;
}

- (void)didReceiveEventWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  int v80;
  void *v81;
  int v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t k;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  int v97;
  NSObject *v98;
  NSObject *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  NSObject *v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  uint64_t v107;
  uint64_t v108;
  NSObject *v109;
  void *context;
  id v111;
  id obj;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  id v119;
  void *v120;
  void *v121;
  PLDuetServiceWithAccounting *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v141;
  __int16 v142;
  uint64_t v143;
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PLDuetServiceWithAccounting_didReceiveEventWithPayload___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED885358 != -1)
      dispatch_once(&qword_1ED885358, block);
    if (_MergedGlobals_1_59)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("payload=%@"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting didReceiveEventWithPayload:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 181);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v141 = (uint64_t)v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  PLLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEFAULT, "┏ PLDuetService didReceiveEventWithPayload start", buf, 2u);
  }

  if (!v4
    || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("events")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    PLLogCommon();
    v109 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAF47000, v109, OS_LOG_TYPE_ERROR, "┗ PLDuetService didReceiveEventWithPayload end: Invalid payload", buf, 2u);
    }
    goto LABEL_91;
  }
  v14 = (void *)MEMORY[0x1D179C2E0]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuetServiceImpl duetService](self, "duetService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    context = v14;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("events"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v141) = v20;
      _os_log_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEFAULT, "┃ ┏ PLDuetService didReceiveEventWithPayload processing %d events", buf, 8u);

    }
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v111 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("events"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v147, 16);
    if (v115)
    {
      v113 = *(_QWORD *)v136;
      v118 = *MEMORY[0x1E0D80380];
      v122 = self;
      v114 = v15;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v136 != v113)
            objc_enumerationMutation(obj);
          v116 = v21;
          v22 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * v21);
          v23 = (void *)objc_opt_new();
          v24 = (void *)objc_opt_class();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("bundleID"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "mapBundleID:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setBundleID:", v26);

          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("processName"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setProcessName:", v27);

          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("updateType"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setUpdateType:", objc_msgSend(v28, "integerValue"));

          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("childBundleIDToWeight"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setChildBundleIDToWeight:", v29);

          PLLogCommon();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v141 = (uint64_t)v23;
            _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "┃ ┃ ┏ PLDuetService didReceiveEventWithPayload processing event: %@", buf, 0xCu);
          }

          objc_msgSend(v23, "childBundleIDToWeight");
          v31 = objc_claimAutoreleasedReturnValue();
          if (v31
            && (v32 = (void *)v31,
                objc_msgSend(v23, "childBundleIDToWeight"),
                v33 = (void *)objc_claimAutoreleasedReturnValue(),
                v34 = objc_msgSend(v33, "count"),
                v33,
                v32,
                v34))
          {
            v120 = v22;
            objc_msgSend(v23, "bundleID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("cloudphotod"));

            if (v36)
              v37 = 35;
            else
              v37 = 0;
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = 0u;
            v132 = 0u;
            v133 = 0u;
            v134 = 0u;
            objc_msgSend(v23, "childBundleIDToWeight");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v131, v146, 16);
            if (v40)
            {
              v41 = v40;
              v42 = *(_QWORD *)v132;
              do
              {
                for (i = 0; i != v41; ++i)
                {
                  if (*(_QWORD *)v132 != v42)
                    objc_enumerationMutation(v39);
                  v44 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * i);
                  objc_msgSend(v23, "childBundleIDToWeight");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:", v44);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)objc_opt_class(), "mapBundleID:", v44);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "setObject:forKeyedSubscript:", v46, v47);

                }
                v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v131, v146, 16);
              }
              while (v41);
            }

            objc_msgSend(v23, "setChildBundleIDToWeight:", v38);
            v22 = v120;
            self = v122;
          }
          else
          {
            v37 = 0;
          }
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          PLLogCommon();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("eventIntervals"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "count");
            *(_DWORD *)buf = 67109120;
            LODWORD(v141) = v50;
            _os_log_impl(&dword_1CAF47000, v48, OS_LOG_TYPE_INFO, "┃ ┃ ┃ ┏ PLDuetService didReceiveEventWithPayload processing %d intervals", buf, 8u);

          }
          v129 = 0u;
          v130 = 0u;
          v127 = 0u;
          v128 = 0u;
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("eventIntervals"));
          v119 = (id)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v127, v145, 16);
          if (v51)
          {
            v52 = v51;
            v53 = *(_QWORD *)v128;
            do
            {
              for (j = 0; j != v52; ++j)
              {
                if (*(_QWORD *)v128 != v53)
                  objc_enumerationMutation(v119);
                v55 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * j);
                v56 = (void *)objc_opt_new();
                objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("startDate"));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "convertFromSystemToMonotonic");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "setStartDate:", v58);

                objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("endDate"));
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "convertFromSystemToMonotonic");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "setEndDate:", v60);

                objc_msgSend(v121, "addObject:", v56);
                PLLogCommon();
                v61 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v141 = (uint64_t)v56;
                  _os_log_debug_impl(&dword_1CAF47000, v61, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ┃ PLDuetService didReceiveEventWithPayload new interval:%@", buf, 0xCu);
                }

                if ((_DWORD)v37)
                {
                  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "childBundleIDToWeight");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "startDate");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "endDate");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "createDistributionEventIntervalWithDistributionID:withChildNodeNameToWeight:withStartDate:withEndDate:", v37, v63, v64, v65);

                  self = v122;
                }
                -[PLDuetServiceImpl duetService](self, "duetService");
                v66 = objc_claimAutoreleasedReturnValue();
                if (v66)
                {
                  v67 = (void *)v66;
                  -[PLDuetServiceImpl duetService](self, "duetService");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  v69 = objc_msgSend(v68, "isDebugEnabled");

                  if (v69)
                  {
                    +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", v118, CFSTR("DuetEvents"));
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v70);
                    objc_msgSend(v23, "bundleID");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v72)
                      objc_msgSend(v23, "bundleID");
                    else
                      objc_msgSend(v23, "processName");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "setObject:forKeyedSubscript:", v73, CFSTR("BundleID"));

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v23, "updateType"));
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "setObject:forKeyedSubscript:", v74, CFSTR("UpdateType"));

                    objc_msgSend(v56, "startDate");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "setObject:forKeyedSubscript:", v75, CFSTR("StartDate"));

                    objc_msgSend(v56, "endDate");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "setObject:forKeyedSubscript:", v76, CFSTR("EndDate"));

                    self = v122;
                    -[PLDuetServiceImpl duetService](v122, "duetService");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v77)
                    {
                      -[PLDuetServiceImpl duetService](v122, "duetService");
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v78, "logEntry:", v71);

                    }
                  }
                }

              }
              v52 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v127, v145, 16);
            }
            while (v52);
          }

          PLLogCommon();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CAF47000, v79, OS_LOG_TYPE_INFO, "┃ ┃ ┃ ┗ PLDuetService didReceiveEventWithPayload finished processing intervals", buf, 2u);
          }

          objc_msgSend(v23, "setEventIntervals:", v121);
          v80 = objc_msgSend(v23, "updateType");
          v15 = v114;
          v81 = v114;
          if (v80 == 1 || (v82 = objc_msgSend(v23, "updateType"), v81 = v117, v82 == 2))
            objc_msgSend(v81, "addObject:", v23);
          objc_msgSend(v23, "childBundleIDToWeight");
          v83 = objc_claimAutoreleasedReturnValue();
          if (v83)
          {
            v84 = (void *)v83;
            objc_msgSend(v23, "childBundleIDToWeight");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = objc_msgSend(v85, "count");

            if (v86)
            {
              v125 = 0u;
              v126 = 0u;
              v123 = 0u;
              v124 = 0u;
              objc_msgSend(v23, "childBundleIDToWeight");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v123, v144, 16);
              if (v88)
              {
                v89 = v88;
                v90 = *(_QWORD *)v124;
                do
                {
                  for (k = 0; k != v89; ++k)
                  {
                    if (*(_QWORD *)v124 != v90)
                      objc_enumerationMutation(v87);
                    v92 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * k);
                    v93 = (void *)objc_opt_new();
                    objc_msgSend(v93, "setBundleID:", v92);
                    objc_msgSend(v93, "setProcessName:", v92);
                    objc_msgSend(v93, "setUpdateType:", objc_msgSend(v23, "updateType"));
                    objc_msgSend(v23, "eventIntervals");
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v93, "setEventIntervals:", v94);

                    v95 = objc_msgSend(v93, "updateType");
                    v96 = v114;
                    if (v95 == 1 || (v97 = objc_msgSend(v93, "updateType"), v96 = v117, v97 == 2))
                      objc_msgSend(v96, "addObject:", v93);
                    PLLogCommon();
                    v98 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v141 = (uint64_t)v92;
                      _os_log_debug_impl(&dword_1CAF47000, v98, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ╸ PLDuetService didReceiveEventWithPayload childEvent for bundleID:%@", buf, 0xCu);
                    }

                  }
                  v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v123, v144, 16);
                }
                while (v89);
              }

            }
          }
          PLLogCommon();
          v99 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1CAF47000, v99, OS_LOG_TYPE_DEBUG, "┃ ┃ ┗ PLDuetService didReceiveEventWithPayload finished processing event", buf, 2u);
          }

          v21 = v116 + 1;
        }
        while (v116 + 1 != v115);
        v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v147, 16);
      }
      while (v115);
    }

    PLLogCommon();
    v100 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAF47000, v100, OS_LOG_TYPE_DEFAULT, "┃ ┗ PLDuetService didReceiveEventWithPayload processing events completed", buf, 2u);
    }

    -[PLDuetServiceWithAccounting eventTransitionsWithEvents:](self, "eventTransitionsWithEvents:", v15);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDuetServiceWithAccounting eventTransitionsWithEvents:](self, "eventTransitionsWithEvents:", v117);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDuetServiceWithAccounting createQualificationEventsWithEventTransitions:withQualificationID:](self, "createQualificationEventsWithEventTransitions:withQualificationID:", v101, 11);
    PLLogCommon();
    v103 = objc_claimAutoreleasedReturnValue();
    v4 = v111;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      v104 = objc_msgSend(v101, "count");
      v105 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 134218240;
      v141 = v104;
      v142 = 2048;
      v143 = v105;
      _os_log_impl(&dword_1CAF47000, v103, OS_LOG_TYPE_DEFAULT, "┃ PLDuetService didReceiveEventWithPayload created %lu disc transitions from %lu events", buf, 0x16u);
    }

    -[PLDuetServiceWithAccounting createQualificationEventsWithEventTransitions:withQualificationID:](self, "createQualificationEventsWithEventTransitions:withQualificationID:", v102, 12);
    PLLogCommon();
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      v107 = objc_msgSend(v102, "count");
      v108 = objc_msgSend(v117, "count");
      *(_DWORD *)buf = 134218240;
      v141 = v107;
      v142 = 2048;
      v143 = v108;
      _os_log_impl(&dword_1CAF47000, v106, OS_LOG_TYPE_DEFAULT, "┃ PLDuetService didReceiveEventWithPayload created %lu comp transitions from %lu events", buf, 0x16u);
    }

    objc_autoreleasePoolPop(context);
    PLLogCommon();
    v109 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAF47000, v109, OS_LOG_TYPE_DEFAULT, "┗ PLDuetService didReceiveEventWithPayload end", buf, 2u);
    }
LABEL_91:

    goto LABEL_92;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_ERROR, "┗ PLDuetService didReceiveEventWithPayload end: duetService not found", buf, 2u);
  }

  objc_autoreleasePoolPop(v14);
LABEL_92:

}

- (id)eventTransitionsWithEvents:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  NSObject *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  unint64_t v50;
  NSObject *v51;
  NSObject *v52;
  id obj;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD block[5];
  _QWORD v59[5];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  _BYTE v65[10];
  __int16 v66;
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_INFO, "┃ ┏ PLDuetService eventTransitionsWithEvents start", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v3;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v56)
  {
    v55 = *(_QWORD *)v61;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v61 != v55)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v6);
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v8 = objc_opt_class();
          v59[0] = MEMORY[0x1E0C809B0];
          v59[1] = 3221225472;
          v59[2] = __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke;
          v59[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v59[4] = v8;
          if (qword_1ED885360 != -1)
            dispatch_once(&qword_1ED885360, v59);
          if (byte_1ED885331)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("event=%@"), v7);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "lastPathComponent");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting eventTransitionsWithEvents:]");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 308);

            PLLogCommon();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v65 = v9;
              _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v65 = v7;
          _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "┃ ┃ ┏ PLDuetService eventTransitionsWithEvents processing event: %@", buf, 0xCu);
        }

        objc_msgSend(v7, "eventIntervals");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17)
        {
          v57 = v6;
          v18 = 0;
          v19 = 0;
          v20 = 0;
          do
          {
            v21 = v19;
            objc_msgSend(v7, "eventIntervals");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndex:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            PLLogCommon();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v65 = v19;
              _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ┏ PLDuetService eventTransitionsWithEvents processing interval: %@", buf, 0xCu);
            }

            LODWORD(v24) = v20 + 1;
            objc_msgSend(v7, "eventIntervals");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "count") <= (unint64_t)(v20 + 1))
            {
LABEL_28:

            }
            else
            {
              v24 = (int)v24;
              while (1)
              {
                objc_msgSend(v7, "eventIntervals");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "objectAtIndex:", v24);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v19, "intersects:", v27);

                if (!v28)
                  break;
                objc_msgSend(v7, "eventIntervals");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "objectAtIndex:", v24);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "joinWithInterval:", v30);
                v31 = objc_claimAutoreleasedReturnValue();

                PLLogCommon();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v65 = v20;
                  *(_WORD *)&v65[4] = 1024;
                  *(_DWORD *)&v65[6] = v24;
                  v66 = 2112;
                  v67 = v31;
                  _os_log_debug_impl(&dword_1CAF47000, v32, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ┃ PLDuetService eventTransitionsWithEvents Joining intervals %d-%d, active interval updated: %@", buf, 0x18u);
                }
                v20 = v24;

                ++v24;
                objc_msgSend(v7, "eventIntervals");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = (void *)v31;
                if (objc_msgSend(v25, "count") <= v24)
                {
                  v19 = (void *)v31;
                  goto LABEL_28;
                }
              }
            }
            v20 = v24;
            if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            {
              v33 = objc_opt_class();
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke_137;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v33;
              if (qword_1ED885368 != -1)
                dispatch_once(&qword_1ED885368, block);
              if (byte_1ED885332)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("eventInterval=%@"), v19);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "lastPathComponent");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting eventTransitionsWithEvents:]");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 325);

                PLLogCommon();
                v39 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v65 = v34;
                  _os_log_debug_impl(&dword_1CAF47000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

              }
            }
            v40 = (void *)objc_opt_new();
            objc_msgSend(v19, "startDate");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setDate:", v41);

            objc_msgSend(v7, "bundleID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setBundleID:", v42);

            objc_msgSend(v40, "setIsStart:", 1);
            objc_msgSend(v5, "addObject:", v40);
            PLLogCommon();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v65 = v40;
              _os_log_impl(&dword_1CAF47000, v43, OS_LOG_TYPE_INFO, "┃ ┃ ┃ ┃ PLDuetService eventTransitionsWithEvents created start transition: %@", buf, 0xCu);
            }

            v44 = (void *)objc_opt_new();
            objc_msgSend(v19, "endDate");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setDate:", v45);

            objc_msgSend(v7, "bundleID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setBundleID:", v46);

            objc_msgSend(v44, "setIsStart:", 0);
            objc_msgSend(v5, "addObject:", v44);
            PLLogCommon();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v65 = v44;
              _os_log_impl(&dword_1CAF47000, v47, OS_LOG_TYPE_INFO, "┃ ┃ ┃ ┃ PLDuetService eventTransitionsWithEvents created end transition: %@", buf, 0xCu);
            }

            PLLogCommon();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1CAF47000, v48, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ┗ PLDuetService eventTransitionsWithEvents finished processing interval", buf, 2u);
            }

            v18 = v20;
            objc_msgSend(v7, "eventIntervals");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "count");

          }
          while (v50 > v20);

          v6 = v57;
        }
        PLLogCommon();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CAF47000, v51, OS_LOG_TYPE_DEBUG, "┃ ┃ ┗ PLDuetService eventTransitionsWithEvents finished processing event", buf, 2u);
        }

        ++v6;
      }
      while (v6 != v56);
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    }
    while (v56);
  }

  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_47);
  PLLogCommon();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAF47000, v52, OS_LOG_TYPE_INFO, "┃ ┗ PLDuetService eventTransitionsWithEvents end", buf, 2u);
  }

  return v5;
}

- (void)createQualificationEventsWithEventTransitions:(id)a3 withQualificationID:(int)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  id obj;
  uint64_t v54;
  _QWORD block[5];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_INFO, "┃ ┏ PLDuetService createQualificationEventsWithEventTransitions start", buf, 2u);
  }

  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v61) = v9;
    _os_log_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_INFO, "┃ ┃ ┏ PLDuetService createQualificationEventsWithEventTransitions processing %d transitions", buf, 8u);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v4;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v54 = *(_QWORD *)v57;
    v13 = *MEMORY[0x1E0D7FF30];
    v51 = v7;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v57 != v54)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v14);
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v16 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __97__PLDuetServiceWithAccounting_createQualificationEventsWithEventTransitions_withQualificationID___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v16;
          if (qword_1ED885370 != -1)
            dispatch_once(&qword_1ED885370, block);
          if (byte_1ED885333)
          {
            v17 = v11;
            v18 = v12;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lastEventTransition=%@, eventTransition=%@"), v6, v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "lastPathComponent");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting createQualificationEventsWithEventTransitions:withQualificationID:]");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 362);

            PLLogCommon();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v61 = v19;
              _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v12 = v18;
            v11 = v17;
            v7 = v51;
          }
        }
        PLLogCommon();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v15;
          _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ PLDuetService createQualificationEventsWithEventTransitions current transition:%@", buf, 0xCu);
        }

        PLLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v7;
          _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ PLDuetService createQualificationEventsWithEventTransitions current eventElements:%@", buf, 0xCu);
        }

        objc_msgSend(v15, "date");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "date");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSinceDate:", v28);
        v30 = v29;

        if (v30 > v13)
        {
          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "allObjects");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "date");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "date");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "createQualificationEventIntervalWithQualificationID:withChildNodeNames:withStartDate:withEndDate:", a4, v32, v33, v34);

          PLLogCommon();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v6, "date");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "timeIntervalSince1970");
            v41 = v40;
            objc_msgSend(v15, "date");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "timeIntervalSince1970");
            v44 = v43;
            objc_msgSend(v15, "date");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "date");
            v46 = v11;
            v47 = v12;
            v12 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "timeIntervalSinceDate:", v12);
            *(_DWORD *)buf = 134218496;
            v61 = v41;
            v62 = 2048;
            v63 = v44;
            v64 = 2048;
            v65 = v48;
            _os_log_debug_impl(&dword_1CAF47000, v35, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ PLDuetService createQualificationEventsWithEventTransitions created event with startDate:%f, endDate:%f, timeRange=%f seconds", buf, 0x20u);

            LODWORD(v12) = v47;
            v11 = v46;
            v7 = v51;

          }
          v36 = v15;

          v12 = (v12 + 1);
          v6 = v36;
        }
        v37 = objc_msgSend(v15, "isStart");
        objc_msgSend(v15, "bundleID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
          objc_msgSend(v7, "addObject:", v38);
        else
          objc_msgSend(v7, "removeObject:", v38);

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    }
    while (v11);
  }
  else
  {
    LODWORD(v12) = 0;
  }

  PLLogCommon();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v61) = v12;
    _os_log_impl(&dword_1CAF47000, v49, OS_LOG_TYPE_INFO, "┃ ┃ ┗ PLDuetService createQualificationEventsWithEventTransitions Created %d qualification events", buf, 8u);
  }

  PLLogCommon();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAF47000, v50, OS_LOG_TYPE_INFO, "┃ ┗ PLDuetService createQualificationEventsWithEventTransitions end", buf, 2u);
  }

}

uint64_t __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "energyResponse");
}

uint64_t __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveEventWithPayload:", a5);
}

- (PLDuetServiceWithAccounting)init
{
  PLDuetServiceWithAccounting *v3;
  PLDuetServiceWithAccounting *v4;
  objc_super v6;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PLDuetServiceWithAccounting;
    v4 = -[PLDuetServiceWithAccounting init](&v6, sel_init);
    -[PLDuetServiceImpl setDuetService:](v4, "setDuetService:", 0);
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies:(id)a3
{
  id v4;
  char v5;
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
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd");
  if (v4 && (v5 & 1) == 0)
  {
    -[PLDuetServiceImpl setDuetService:](self, "setDuetService:", v4);
    v6 = objc_alloc(MEMORY[0x1E0D80090]);
    v7 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke;
    v20[3] = &unk_1E8578610;
    v20[4] = self;
    v8 = (void *)objc_msgSend(v6, "initWithOperator:withRegistration:withBlock:", v4, &unk_1E864DD68, v20);
    -[PLDuetServiceImpl setEventListener:](self, "setEventListener:", v8);

    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke_2;
    v19[3] = &unk_1E8577F70;
    v19[4] = self;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80098]), "initWithOperator:withRegistration:withBlock:", v4, &unk_1E864DD90, v19);
    -[PLDuetServiceImpl setEnergyResponder:](self, "setEnergyResponder:", v9);

    objc_msgSend(MEMORY[0x1E0D7FF58], "timeCriterionWithInterval:", 21600.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    objc_msgSend(MEMORY[0x1E0D7FF50], "pluggedInCriterion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v11;
    objc_msgSend(MEMORY[0x1E0D7FF50], "displayOffCriterion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D7FF60], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke_3;
    v18[3] = &unk_1E8580A68;
    v18[4] = self;
    objc_msgSend(v14, "scheduleActivityWithIdentifier:withCriteria:withMustRunCriterion:withQueue:withInterruptBlock:withActivityBlock:", CFSTR("PLDuetService_duetEnergyAccumulator"), v13, 0, v15, 0, v18);

    if ((objc_msgSend(v4, "isDebugEnabled") & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("PLDuetService_test"), 0))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)testLogEvents, CFSTR("com.apple.powerlogd.PLDuetService.testLogEvents"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v17 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v17, self, (CFNotificationCallback)testReportEnergy, CFSTR("com.apple.powerlogd.PLDuetService.testReportEnergy"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }

  }
}

uint64_t __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "accumulateWithLastCompletedDate:withNow:", a2, a3);
}

uint64_t __58__PLDuetServiceWithAccounting_didReceiveEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_59 = result;
  return result;
}

uint64_t __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885331 = result;
  return result;
}

uint64_t __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke_137(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885332 = result;
  return result;
}

uint64_t __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke_141(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __97__PLDuetServiceWithAccounting_createQualificationEventsWithEventTransitions_withQualificationID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885333 = result;
  return result;
}

uint64_t __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885334 = result;
  return result;
}

uint64_t __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_163(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885335 = result;
  return result;
}

uint64_t __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_175(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885336 = result;
  return result;
}

uint64_t __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_181(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885337 = result;
  return result;
}

- (void)accumulateWithLastCompletedDate:(id)a3 withNow:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD block[5];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1ED885398 != -1)
      dispatch_once(&qword_1ED885398, block);
    if (byte_1ED885338)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lastCompletedDate=%@, now=%@"), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 541);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  PLLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "timeIntervalSince1970");
    v18 = v17;
    objc_msgSend(v7, "timeIntervalSince1970");
    *(_DWORD *)buf = 134218240;
    v22 = v18;
    v23 = 2048;
    v24 = v19;
    _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "┏ PLDuetService accumulateWithLastCompletedDate start, lastCompletedDate=%f, now=%f", buf, 0x16u);
  }

  -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:](self, "accumulateWithLastCompletedDate:withNow:withQualificationID:", v6, v7, 11);
  -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:](self, "accumulateWithLastCompletedDate:withNow:withQualificationID:", v6, v7, 12);
  PLLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "┗ PLDuetService accumulateWithLastCompletedDate end", buf, 2u);
  }

}

uint64_t __71__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885338 = result;
  return result;
}

- (void)accumulateWithLastCompletedDate:(id)a3 withNow:(id)a4 withQualificationID:(int)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  double v53;
  NSObject *v54;
  uint64_t v55;
  PLDuetServiceWithAccounting *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  NSObject *v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  double v85;
  double v86;
  int v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  PLDuetServiceWithAccounting *v97;
  id v98;
  id obj;
  uint64_t v100;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  _QWORD block[5];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _QWORD v115[5];
  void *v116;
  void *v117;
  uint8_t buf[4];
  double v119;
  __int16 v120;
  void *v121;
  __int16 v122;
  void *v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _QWORD v126[7];

  v126[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v119) = a5;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "┃ ┏ PLDuetService accumulateWithLastCompletedDate start for qualificationID:%d", buf, 8u);
  }

  -[PLDuetServiceImpl duetService](self, "duetService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v97 = self;
    v11 = *MEMORY[0x1E0D80368];
    objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", *MEMORY[0x1E0D80368], *MEMORY[0x1E0D80168]);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingTimeInterval:", -3600.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "┃ ┃ PLDuetService accumulateWithLastCompletedDate !lastBucketAlreadyAccumulated", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    PLLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v13, "timeIntervalSince1970");
      *(_DWORD *)buf = 134217984;
      v119 = v85;
      _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "┃ ┃ PLDuetService accumulateWithLastCompletedDate lastBucketAlreadyAccumulated=%f", buf, 0xCu);
    }
    v95 = v7;

    objc_msgSend(v8, "dateByAddingTimeInterval:", -3600.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v16, "timeIntervalSince1970");
      *(_DWORD *)buf = 134217984;
      v119 = v86;
      _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "┃ ┃ PLDuetService accumulateWithLastCompletedDate lastBucketToAccumulate=%f", buf, 0xCu);
    }

    v18 = objc_alloc(MEMORY[0x1E0D80080]);
    v19 = (void *)MEMORY[0x1E0CB37E8];
    v93 = v13;
    objc_msgSend(v13, "timeIntervalSince1970");
    objc_msgSend(v19, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v20, 2);

    v22 = objc_alloc(MEMORY[0x1E0D80080]);
    v23 = (void *)MEMORY[0x1E0CB37E8];
    v92 = v16;
    objc_msgSend(v16, "timeIntervalSince1970");
    objc_msgSend(v23, "numberWithDouble:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v22, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v24, 4);

    v26 = objc_alloc(MEMORY[0x1E0D80080]);
    v27 = *MEMORY[0x1E0D80180];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v26, "initWithKey:withValue:withComparisonOperation:", v27, v28, 0);

    v30 = objc_alloc(MEMORY[0x1E0D80080]);
    v105 = *MEMORY[0x1E0D80178];
    v31 = objc_msgSend(v30, "initWithKey:withValue:withComparisonOperation:");
    -[PLDuetServiceImpl duetService](v97, "duetService");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "storage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = (void *)v25;
    v91 = (void *)v21;
    v126[0] = v21;
    v126[1] = v25;
    v88 = (void *)v31;
    v89 = (void *)v29;
    v126[2] = v29;
    v126[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = (void *)v12;
    objc_msgSend(v33, "entriesForKey:withComparisons:", v12, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v96 = v8;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v36 = objc_opt_class();
      v115[0] = MEMORY[0x1E0C809B0];
      v115[1] = 3221225472;
      v115[2] = __91__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow_withQualificationID___block_invoke;
      v115[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v115[4] = v36;
      if (qword_1ED8853A0 != -1)
        dispatch_once(&qword_1ED8853A0, v115);
      if (byte_1ED885339)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aggregateQualificationEnergyEntries=%@"), v35);
        v37 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v38 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "lastPathComponent");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:]");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v37, v40, v41, 590);

        PLLogCommon();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v119 = v37;
          _os_log_debug_impl(&dword_1CAF47000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    PLLogCommon();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      v87 = objc_msgSend(v35, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v119) = v87;
      _os_log_debug_impl(&dword_1CAF47000, v43, OS_LOG_TYPE_DEBUG, "┃ ┃ PLDuetService accumulateWithLastCompletedDate %d aggregate entries found", buf, 8u);
    }

    -[PLDuetServiceImpl duetService](v97, "duetService");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", v11, CFSTR("DuetEnergyAccumulator"));
    v45 = objc_claimAutoreleasedReturnValue();

    -[PLDuetServiceImpl duetService](v97, "duetService");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "storage");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = (void *)v45;
    objc_msgSend(v47, "entriesForKey:", v45);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    obj = v48;
    v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v112;
      do
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v112 != v51)
            objc_enumerationMutation(obj);
          v53 = *(double *)(*((_QWORD *)&v111 + 1) + 8 * i);
          PLLogCommon();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v119 = v53;
            _os_log_debug_impl(&dword_1CAF47000, v54, OS_LOG_TYPE_DEBUG, "┃ ┃ ╸ PLDuetService accumulateWithLastCompletedDate existing entry:%@", buf, 0xCu);
          }

        }
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
      }
      while (v50);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v98 = v35;
    v55 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
    v8 = v96;
    v56 = v97;
    if (v55)
    {
      v57 = v55;
      v103 = *(_QWORD *)v108;
      v100 = *MEMORY[0x1E0D80170];
      do
      {
        v58 = 0;
        do
        {
          if (*(_QWORD *)v108 != v103)
            objc_enumerationMutation(v98);
          v59 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v58);
          v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v104, v8);
          objc_msgSend(MEMORY[0x1E0D7FEE8], "sharedInstance");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectForKeyedSubscript:", v105);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "nodeNameForNodeID:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v64 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __91__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow_withQualificationID___block_invoke_190;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v64;
            if (qword_1ED8853A8 != -1)
              dispatch_once(&qword_1ED8853A8, block);
            if (byte_1ED88533A)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleID=%@"), v63);
              v65 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              v66 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "lastPathComponent");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:]");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v65, v68, v69, 607);

              PLLogCommon();
              v70 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v119 = v65;
                _os_log_debug_impl(&dword_1CAF47000, v70, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v8 = v96;
              v56 = v97;
            }
          }
          PLLogCommon();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v59, "objectForKeyedSubscript:", v105);
            v79 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("timestamp"));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v119 = v79;
            v120 = 2112;
            v121 = v63;
            v122 = 2112;
            v123 = v80;
            _os_log_debug_impl(&dword_1CAF47000, v71, OS_LOG_TYPE_DEBUG, "┃ ┃ ┏ PLDuetService accumulateWithLastCompletedDate entry for nodeID:%@, bundleID:%@, timestamp:%@", buf, 0x20u);

            v56 = v97;
          }

          if (v63)
          {
            objc_msgSend(v60, "setObject:forKeyedSubscript:", v63, CFSTR("BundleID"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a5);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "setObject:forKeyedSubscript:", v72, CFSTR("QualificationID"));

            objc_msgSend(v59, "objectForKeyedSubscript:", v100);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "doubleValue");
            v75 = v74 / 1000.0;

            v76 = fmin(v75, 10000.0);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "setObject:forKeyedSubscript:", v77, CFSTR("Energy"));

            PLLogCommon();
            v78 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              v119 = v76;
              _os_log_debug_impl(&dword_1CAF47000, v78, OS_LOG_TYPE_DEBUG, "┃ ┃ ┗ PLDuetService accumulateWithLastCompletedDate entry energy:%fmWh", buf, 0xCu);
            }

            objc_msgSend(v102, "addObject:", v60);
          }

          ++v58;
        }
        while (v57 != v58);
        v57 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
      }
      while (v57);
    }

    if (objc_msgSend(v102, "count"))
    {
      -[PLDuetServiceImpl duetService](v56, "duetService");
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      if (v81)
      {
        -[PLDuetServiceImpl duetService](v56, "duetService");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = v104;
        v117 = v102;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "logEntries:withGroupID:", v83, v104);

      }
    }
    PLLogCommon();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CAF47000, v84, OS_LOG_TYPE_DEBUG, "┃ ┗ PLDuetService accumulateWithLastCompletedDate end", buf, 2u);
    }

    v7 = v95;
  }

}

uint64_t __91__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow_withQualificationID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885339 = result;
  return result;
}

uint64_t __91__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow_withQualificationID___block_invoke_190(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88533A = result;
  return result;
}

+ (id)mapBundleID:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = qword_1ED8853B0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED8853B0, &__block_literal_global_191);
  objc_msgSend((id)qword_1ED8853B8, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

void __43__PLDuetServiceWithAccounting_mapBundleID___block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ED8853B8;
  qword_1ED8853B8 = (uint64_t)&unk_1E864DDB8;

}

@end
