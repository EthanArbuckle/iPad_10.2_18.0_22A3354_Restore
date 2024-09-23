@implementation PLScreenStateAgent

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "transitionReason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transitionReasons");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413058;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "calling didUpdateDisplayLayout=%@ with context=%@, transitionReason=%@, transitionReasons=%@", (uint8_t *)&v14, 0x2Au);

  }
  objc_msgSend(v8, "transitionReason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = SBSBacklightChangeSourceForDisplayLayoutTransitionReason();

  if (!v11
    || (-[PLScreenStateAgent logEventPointMainBacklightEvent:withContext:](self, "logEventPointMainBacklightEvent:withContext:", v7, v8), v11 > 0x1C)|| ((1 << v11) & 0x1A000050) == 0)
  {
    -[PLScreenStateAgent logEventForwardMainScreenState:](self, "logEventForwardMainScreenState:", v7);
  }

}

- (void)logEventForwardMainScreenState:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PLScreenStateAgent *v9;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke;
  v7[3] = &unk_1E85791E0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  int v83;
  id *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  int v95;
  int v96;
  int v97;
  void *v98;
  void *v99;
  uint64_t v100;
  id obj;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  _QWORD v117[5];
  _QWORD v118[5];
  _QWORD v119[5];
  _QWORD v120[5];
  uint8_t buf[4];
  _BYTE v122[10];
  void *v123;
  __int16 v124;
  void *v125;
  _QWORD v126[5];
  _QWORD v127[5];
  _BYTE v128[128];
  _QWORD v129[5];

  v129[2] = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v94 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v122 = v94;
    _os_log_debug_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEBUG, "calling logEventForwardMainScreenState with displayLayout=%@", buf, 0xCu);
  }

  if (!*(_QWORD *)(a1 + 32))
    return;
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v95 = objc_msgSend(MEMORY[0x1E0D80020], "hasAOD");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v122 = v95;
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "screenState - hasAOD=%d", buf, 8u);
  }

  if ((!_os_feature_enabled_impl() || (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD") & 1) == 0)
    && objc_msgSend(*(id *)(a1 + 32), "displayBacklightLevel") < 1)
  {
    return;
  }
  +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ScreenState"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v7 = v6;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("level"), 0);
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("layoutRole"), 0);
  objc_msgSend(*(id *)(a1 + 32), "elements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = (void *)v9;
  v99 = (void *)v8;
  v129[0] = v8;
  v129[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingDescriptors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v96 = _os_feature_enabled_impl();
    v97 = objc_msgSend(MEMORY[0x1E0D80020], "hasAOD");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v122 = v96;
    *(_WORD *)&v122[4] = 1024;
    *(_DWORD *)&v122[6] = v97;
    _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "dts runtime ff enabled=%d, [PLPlatform hasAOD]=%d]", buf, 0xEu);
  }
  v102 = (void *)v13;

  if (_os_feature_enabled_impl() && objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    objc_msgSend(*(id *)(a1 + 40), "setLastDisplayLayoutContainsLockScreen:", 0);
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  obj = v12;
  v106 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v128, 16);
  if (!v106)
    goto LABEL_62;
  v15 = v5 * v7;
  v105 = *(_QWORD *)v110;
  v100 = *MEMORY[0x1E0D22C78];
  v16 = -1.0;
  v17 = 0.0;
  v103 = a1;
  while (2)
  {
    for (i = 0; i != v106; ++i)
    {
      if (*(_QWORD *)v110 != v105)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v108, v107);
      objc_msgSend(v19, "bundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        objc_msgSend(v19, "bundleIdentifier");
      else
        objc_msgSend(v19, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("bundleID"));

      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("bundleID"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        PLLogCommon();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CAF47000, v48, OS_LOG_TYPE_ERROR, "Screen State element's bundleID/identifier is nil", buf, 2u);
        }
        goto LABEL_45;
      }
      if (_os_feature_enabled_impl())
      {
        if (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
        {
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("bundleID"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqualToString:", v100);

          if (v25)
          {
            objc_msgSend(*(id *)(a1 + 40), "setLastDisplayLayoutContainsLockScreen:", 1);
            PLLogCommon();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("bundleID"));
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = objc_msgSend(*(id *)(a1 + 40), "displayState");
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)v122 = v75;
              *(_WORD *)&v122[8] = 2112;
              v123 = v20;
              v124 = 1024;
              LODWORD(v125) = v76;
              _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "element bundleID=%@, entry=%@, displayState=%d", buf, 0x1Cu);

            }
            if (objc_msgSend(*(id *)(a1 + 40), "displayState") == 2)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v100, CFSTR("aod"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v27, CFSTR("bundleID"));

              PLLogCommon();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v122 = v20;
                _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "entry after transformation = %@", buf, 0xCu);
              }

            }
          }
        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v19, "layoutRole"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v29, CFSTR("AppRole"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "displayType"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v30, CFSTR("Display"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v31, CFSTR("Orientation"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v19, "level"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v32, CFSTR("Level"));

      objc_msgSend(v19, "frame");
      v34 = v33;
      objc_msgSend(v19, "frame");
      v36 = v34 * v35 / v15;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v37, CFSTR("ScreenWeight"));

      if (_os_feature_enabled_impl())
      {
        PLLogCommon();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("bundleID"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v122 = v70;
          _os_log_debug_impl(&dword_1CAF47000, v38, OS_LOG_TYPE_DEBUG, "FBSDisplayLayoutElement currentEntry bundleID: %@", buf, 0xCu);

        }
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "count"))
        {
          PLLogCommon();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("bundleID"));
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v122 = v74;
            _os_log_debug_impl(&dword_1CAF47000, v39, OS_LOG_TYPE_DEBUG, "FBSDisplayLayoutElement searching for currentEntry bundleID in last Dictionary: %@", buf, 0xCu);

          }
          v40 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("bundleID"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKey:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            v126[0] = CFSTR("AppRole");
            objc_msgSend(v20, "objectForKeyedSubscript:");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v127[0] = v43;
            v126[1] = CFSTR("Display");
            objc_msgSend(v20, "objectForKeyedSubscript:");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v127[1] = v44;
            v126[2] = CFSTR("Orientation");
            objc_msgSend(v20, "objectForKeyedSubscript:");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v127[2] = v45;
            v126[3] = CFSTR("Level");
            objc_msgSend(v20, "objectForKeyedSubscript:");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v127[3] = v46;
            v126[4] = CFSTR("ScreenWeight");
            objc_msgSend(v20, "objectForKeyedSubscript:");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v127[4] = v47;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v127, v126, 5);
            v48 = objc_claimAutoreleasedReturnValue();

            a1 = v103;
            v49 = *(void **)(*(_QWORD *)(v103 + 40) + 88);
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("bundleID"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "objectForKey:", v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v45) = objc_msgSend(v51, "isEqualToDictionary:", v48);

            if ((_DWORD)v45)
            {
              PLLogCommon();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("bundleID"));
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ScreenWeight"));
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Level"));
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)v122 = v77;
                *(_WORD *)&v122[8] = 2112;
                v123 = v78;
                v124 = 2112;
                v125 = v79;
                _os_log_debug_impl(&dword_1CAF47000, v52, OS_LOG_TYPE_DEBUG, "current FBSDisplayLayoutElement entry was already logged, skipping logging for  %@ with screenWeight %@ and Level: %@", buf, 0x20u);

              }
              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("bundleID"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v104, "setObject:forKeyedSubscript:", v48, v53);

LABEL_45:
              goto LABEL_58;
            }

          }
        }
        PLLogCommon();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("bundleID"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ScreenWeight"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Level"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v122 = v71;
          *(_WORD *)&v122[8] = 2112;
          v123 = v72;
          v124 = 2112;
          v125 = v73;
          _os_log_debug_impl(&dword_1CAF47000, v54, OS_LOG_TYPE_DEBUG, "FBSDisplayLayoutElement entries was not logged, logging %@ with screenWeight %@ and Level: %@", buf, 0x20u);

        }
        v119[0] = CFSTR("AppRole");
        objc_msgSend(v20, "objectForKeyedSubscript:");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v120[0] = v55;
        v119[1] = CFSTR("Display");
        objc_msgSend(v20, "objectForKeyedSubscript:");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v120[1] = v56;
        v119[2] = CFSTR("Orientation");
        objc_msgSend(v20, "objectForKeyedSubscript:");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v120[2] = v57;
        v119[3] = CFSTR("Level");
        objc_msgSend(v20, "objectForKeyedSubscript:");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v120[3] = v58;
        v119[4] = CFSTR("ScreenWeight");
        objc_msgSend(v20, "objectForKeyedSubscript:");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v120[4] = v59;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, v119, 5);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("bundleID"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "setObject:forKeyedSubscript:", v60, v61);

        a1 = v103;
      }
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
      {
        v117[0] = CFSTR("AppRole");
        objc_msgSend(v20, "objectForKeyedSubscript:");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v118[0] = v62;
        v117[1] = CFSTR("Display");
        objc_msgSend(v20, "objectForKeyedSubscript:");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v118[1] = v63;
        v117[2] = CFSTR("Orientation");
        objc_msgSend(v20, "objectForKeyedSubscript:");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v118[2] = v64;
        v117[3] = CFSTR("Level");
        objc_msgSend(v20, "objectForKeyedSubscript:");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v118[3] = v65;
        v117[4] = CFSTR("ScreenWeight");
        objc_msgSend(v20, "objectForKeyedSubscript:");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v118[4] = v66;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, v117, 5);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("bundleID"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "setObject:forKeyedSubscript:", v67, v68);

        a1 = v103;
      }
      objc_msgSend(v102, "addObject:", v20);
      ++displaySync_block_invoke_screenStateEntriesCounter;
      PLLogCommon();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v122 = displaySync_block_invoke_screenStateEntriesCounter;
        _os_log_debug_impl(&dword_1CAF47000, v69, OS_LOG_TYPE_DEBUG, "Logged %d FBSDisplayLayoutElement entries", buf, 8u);
      }

      if (v16 == (double)objc_msgSend(v19, "level"))
        v36 = v17 + v36;
      else
        v16 = (double)objc_msgSend(v19, "level");
      v17 = v36;
      if (v36 >= 1.0)
      {

        goto LABEL_62;
      }
LABEL_58:

    }
    v106 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v128, 16);
    if (v106)
      continue;
    break;
  }
LABEL_62:

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
  {
    objc_msgSend(*(id *)(a1 + 40), "ioReportingNotification:currentLayout:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96), v104);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "removeAllObjects");
    v80 = objc_msgSend(v104, "mutableCopy");
    v81 = *(_QWORD *)(a1 + 40);
    v82 = *(void **)(v81 + 96);
    *(_QWORD *)(v81 + 96) = v80;

  }
  v83 = _os_feature_enabled_impl();
  v84 = *(id **)(a1 + 40);
  if (v83)
  {
    objc_msgSend(v84[11], "removeAllObjects");
    v85 = objc_msgSend(v104, "mutableCopy");
    v86 = *(_QWORD *)(a1 + 40);
    v87 = *(void **)(v86 + 88);
    *(_QWORD *)(v86 + 88) = v85;

    if (objc_msgSend(v102, "count"))
    {
      v88 = *(void **)(a1 + 40);
      v115 = v108;
      v116 = v102;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "logEntries:withGroupID:", v89, v108);

      PLLogCommon();
      v90 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v122 = v102;
        goto LABEL_78;
      }
      goto LABEL_69;
    }
    PLLogCommon();
    v90 = objc_claimAutoreleasedReturnValue();
    v93 = v98;
    v92 = v99;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CAF47000, v90, OS_LOG_TYPE_DEBUG, "LayoutEntries is empty", buf, 2u);
    }
  }
  else
  {
    v113 = v108;
    v114 = v102;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "logEntries:withGroupID:", v91, v108);

    PLLogCommon();
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v122 = v102;
LABEL_78:
      _os_log_debug_impl(&dword_1CAF47000, v90, OS_LOG_TYPE_DEBUG, "LayoutEntries: %@", buf, 0xCu);
    }
LABEL_69:
    v93 = v98;
    v92 = v99;
  }

  objc_msgSend(*(id *)(a1 + 40), "accountWithLayoutEntries:", v102);
  if (_os_feature_enabled_impl())
  {
    if (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
      objc_msgSend(*(id *)(a1 + 40), "setLastDisplayLayout:", *(_QWORD *)(a1 + 32));
  }

}

- (void)accountWithLayoutEntries:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  v9 = v7;
  if (!v8)
  {
LABEL_20:

    goto LABEL_21;
  }
  v10 = v8;
  v31 = v6;
  v11 = *(_QWORD *)v37;
  v12 = 0.0;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v37 != v11)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("bundleID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ScreenWeight"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v15);

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ScreenWeight"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v12 = v12 + v18;

      }
    }
    v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  }
  while (v10);

  if (v12 > 0.0 && v12 != 1.0)
  {
    objc_msgSend(v4, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v9);
          v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
          v24 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v4, "objectForKeyedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "doubleValue");
          objc_msgSend(v24, "numberWithDouble:", v26 / v12);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, v23);

        }
        v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v20);
      v6 = v31;
    }
    goto LABEL_20;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, v4, v6);

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 2, v30, v6);

}

- (void)setLastDisplayLayoutContainsLockScreen:(BOOL)a3
{
  self->_lastDisplayLayoutContainsLockScreen = a3;
}

- (void)setLastDisplayLayout:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLScreenStateAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("BacklightEvent");
  objc_msgSend(a1, "entryEventPointBacklightEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventPointBacklightEvent
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
  v13 = &unk_1E8652970;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("TransitionReason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("BacklightLevel");
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
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("ScreenState");
  objc_msgSend(a1, "entryEventForwardScreenState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("WindowMode");
  v8[0] = v3;
  objc_msgSend(a1, "entryEventForwardWindowMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventForwardScreenState
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
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[2];
  _QWORD v24[4];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1E8652980;
  v22[1] = MEMORY[0x1E0C9AAB0];
  v21[2] = *MEMORY[0x1E0D80250];
  v22[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("ScreenWeight");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_RealFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = CFSTR("AppRole");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  v19[3] = CFSTR("Display");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  v19[4] = CFSTR("Level");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v19[5] = CFSTR("Orientation");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardWindowMode
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
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isiPad"))
    return MEMORY[0x1E0C9AA70];
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1E8652970;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("displayType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("zoomLevel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("windowingMode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("canvasRatio");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_RealFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("IconDragging");
  objc_msgSend(a1, "entryEventBackwardDefinitionIconDragging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("AlwaysOnEnableState");
  objc_msgSend(a1, "entryEventBackwardDefinitionAlwaysOnEnableState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("BacklightStateChange");
  objc_msgSend(a1, "entryEventBackwardDefinitionBacklightStateChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("FlipbookStatistics");
  objc_msgSend(a1, "entryEventBackwardDefinitionFlipbookStatistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)GetBacklightState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("off")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("suppressed")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("inactiveOnFlipbook")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("inactiveOnLiveFlipbook")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("inactiveOnLive")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("activeDimmed")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("active")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 7;
  }

  return v4;
}

+ (id)entryEventBackwardDefinitionIconDragging
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1E8652970;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventBackwardDefinitionAlwaysOnEnableState
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
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[2];
  _QWORD v20[4];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    return MEMORY[0x1E0C9AA70];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80340];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8652990;
  v18[1] = &unk_1E8632010;
  v17[2] = *MEMORY[0x1E0D80338];
  v18[2] = &unk_1E86529A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("alwaysOnResolvedEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("alwaysOnEnabledSetting");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("lowPowerMode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_BoolFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("focusMode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_BoolFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionBacklightStateChange
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
  if ((objc_msgSend(MEMORY[0x1E0D80020], "hasAOD") & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 102040) & 1) == 0
    && !objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 102041))
  {
    return MEMORY[0x1E0C9AA70];
  }
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1E8652990;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("explanation");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("suppressionChangeType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("suppressionReasons");
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

+ (id)entryEventBackwardDefinitionFlipbookStatistics
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
  _QWORD v54[24];
  _QWORD v55[24];
  uint64_t v56;
  void *v57;
  _QWORD v58[2];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    return MEMORY[0x1E0C9AA70];
  v58[0] = *MEMORY[0x1E0D80298];
  v56 = *MEMORY[0x1E0D80318];
  v57 = &unk_1E8652970;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v53;
  v58[1] = *MEMORY[0x1E0D802F0];
  v54[0] = CFSTR("invalidatedFramesUpTo2mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "commonTypeDict_IntegerFormat");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v51;
  v54[1] = CFSTR("invalidatedFramesUpTo3mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v49;
  v54[2] = CFSTR("invalidatedFramesUpTo4mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v47;
  v54[3] = CFSTR("invalidatedFramesUpTo5mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "commonTypeDict_IntegerFormat");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v45;
  v54[4] = CFSTR("invalidatedFramesUpTo6mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "commonTypeDict_IntegerFormat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v43;
  v54[5] = CFSTR("discardedFramesUpTo2mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "commonTypeDict_IntegerFormat");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v41;
  v54[6] = CFSTR("discardedFramesUpTo3mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "commonTypeDict_IntegerFormat");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v39;
  v54[7] = CFSTR("discardedFramesUpTo4mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v37;
  v54[8] = CFSTR("discardedFramesUpTo5mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v55[8] = v35;
  v54[9] = CFSTR("discardedFramesUpTo6mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v55[9] = v33;
  v54[10] = CFSTR("renderedFramesLessThan1Min");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v55[10] = v31;
  v54[11] = CFSTR("renderedFrames1to2Min");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v55[11] = v29;
  v54[12] = CFSTR("renderedFrames2to3Min");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v55[12] = v27;
  v54[13] = CFSTR("renderedFrames3to4Min");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v55[13] = v25;
  v54[14] = CFSTR("renderedFrames4to5Min");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v55[14] = v23;
  v54[15] = CFSTR("renderedFrames5to6Min");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v55[15] = v21;
  v54[16] = CFSTR("renderedFramesMoreThan6Min");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v55[16] = v19;
  v54[17] = CFSTR("renderedFrameCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v55[17] = v17;
  v54[18] = CFSTR("renderedPartialMinuteCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v55[18] = v15;
  v54[19] = CFSTR("millisecondsDisplayOff");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v55[19] = v13;
  v54[20] = CFSTR("millisecondsDisplayOn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v55[20] = v3;
  v54[21] = CFSTR("millisecondsDisplayDimmed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v55[21] = v5;
  v54[22] = CFSTR("millisecondsShowingAOT");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v55[22] = v7;
  v54[23] = CFSTR("millisecondsSuppressed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v55[23] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("WidgetAdditionAnimation");
  objc_msgSend(a1, "entryAggregateDefinitionWidgetAdditionAnimation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("WidgetFlipAnimation");
  v8[0] = v3;
  objc_msgSend(a1, "entryAggregateDefinitionWidgetFlipAnimation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryAggregateDefinitionWidgetAdditionAnimation
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80330];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8652970;
  v18[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15 = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  v19[2] = *MEMORY[0x1E0D80228];
  v13 = &unk_1E86529B0;
  v11 = *MEMORY[0x1E0D80220];
  v12 = &unk_1E86529A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = *MEMORY[0x1E0D80238];
  v20[2] = v8;
  v20[3] = &unk_1E864FCD0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryAggregateDefinitionWidgetFlipAnimation
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80330];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8652970;
  v18[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15 = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  v19[2] = *MEMORY[0x1E0D80228];
  v13 = &unk_1E86529B0;
  v11 = *MEMORY[0x1E0D80220];
  v12 = &unk_1E86529A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = *MEMORY[0x1E0D80238];
  v20[2] = v8;
  v20[3] = &unk_1E864FCE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryAggregateDefinitionForeground
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLScreenStateAgent)init
{
  PLScreenStateAgent *v3;
  PLScreenStateAgent *v4;
  PLScreenStateAgent *v5;
  uint64_t v6;
  PLScreenStateAgent *v7;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id *v23;
  _QWORD aBlock[4];
  PLScreenStateAgent *v25;
  objc_super v26;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)PLScreenStateAgent;
    v4 = -[PLAgent init](&v26, sel_init);
    v5 = v4;
    if (v4)
    {
      v6 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __26__PLScreenStateAgent_init__block_invoke_2;
      aBlock[3] = &unk_1E8579208;
      v7 = v4;
      v25 = v7;
      v8 = _Block_copy(aBlock);
      v19 = v6;
      v20 = 3221225472;
      v21 = __26__PLScreenStateAgent_init__block_invoke_4;
      v22 = &unk_1E8579208;
      v9 = v7;
      v23 = v9;
      v10 = _Block_copy(&v19);
      v11 = objc_alloc(MEMORY[0x1E0D230D0]);
      v12 = objc_msgSend(v11, "initWithDisplayType:qualityOfService:handler:", 0, 17, &__block_literal_global_148, v19, v20, v21, v22);
      v13 = v9[7];
      v9[7] = (id)v12;

      objc_msgSend(v9[7], "addObserver:", v9);
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D230D0]), "initWithDisplayType:qualityOfService:handler:", 3, 17, v8);
      v15 = v9[9];
      v9[9] = (id)v14;

      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D230D0]), "initWithDisplayType:qualityOfService:handler:", 1, 17, v10);
      v17 = v9[8];
      v9[8] = (id)v16;

    }
    self = v5;
    v3 = self;
  }

  return v3;
}

void __26__PLScreenStateAgent_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __26__PLScreenStateAgent_init__block_invoke_3;
    v5[3] = &unk_1E85791E0;
    v6 = *(id *)(a1 + 32);
    v7 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __26__PLScreenStateAgent_init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logEventForwardCarScreenState:", *(_QWORD *)(a1 + 40));
}

void __26__PLScreenStateAgent_init__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __26__PLScreenStateAgent_init__block_invoke_5;
    v5[3] = &unk_1E85791E0;
    v6 = *(id *)(a1 + 32);
    v7 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __26__PLScreenStateAgent_init__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logEventForwardAirPlayScreenState:", *(_QWORD *)(a1 + 40));
}

- (void)initOperatorDependancies
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  const __CFString *v44;
  void *v45;
  uint8_t buf[4];
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
  {
    objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("SBEnableAlwaysOn"), CFSTR("com.apple.springboard"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    PLLogScreenState();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v47 = v4;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "initial state for EnableAlwaysOn is %d", buf, 8u);
    }

    v44 = CFSTR("alwaysOnEnabledSetting");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLScreenStateAgent logEventBackwardAlwaysOnEnableState:](self, "logEventBackwardAlwaysOnEnableState:", v7);
  }
  if ((objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") & 1) == 0)
  {
    v8 = objc_msgSend(MEMORY[0x1E0D80020], "isiPad");
    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke;
      v43[3] = &unk_1E8578610;
      v43[4] = self;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B298, v43);
      -[PLScreenStateAgent setWindowModeListener:](self, "setWindowModeListener:", v10);

    }
    if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
    {
      v42[0] = v9;
      v42[1] = 3221225472;
      v42[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_168;
      v42[3] = &unk_1E8578610;
      v42[4] = self;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B2C0, v42);
      -[PLScreenStateAgent setIconDraggingListner:](self, "setIconDraggingListner:", v11);

      v41[0] = v9;
      v41[1] = 3221225472;
      v41[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_172;
      v41[3] = &unk_1E8578610;
      v41[4] = self;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B2E8, v41);
      -[PLScreenStateAgent setWidgetAdditionAnimationListener:](self, "setWidgetAdditionAnimationListener:", v12);

      v40[0] = v9;
      v40[1] = 3221225472;
      v40[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_176;
      v40[3] = &unk_1E8578610;
      v40[4] = self;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B310, v40);
      -[PLScreenStateAgent setWidgetFlipAnimationListener:](self, "setWidgetFlipAnimationListener:", v13);

    }
    v39[0] = v9;
    v39[1] = 3221225472;
    v39[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_180;
    v39[3] = &unk_1E8578610;
    v39[4] = self;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B338, v39);
    -[PLScreenStateAgent setSpringBoardAlwaysOnEnableStateListener:](self, "setSpringBoardAlwaysOnEnableStateListener:", v14);

    v38[0] = v9;
    v38[1] = 3221225472;
    v38[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_184;
    v38[3] = &unk_1E8578610;
    v38[4] = self;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B360, v38);
    -[PLScreenStateAgent setSpringBoardBacklightStateChangeListener:](self, "setSpringBoardBacklightStateChangeListener:", v15);

    v37[0] = v9;
    v37[1] = 3221225472;
    v37[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_188;
    v37[3] = &unk_1E8578610;
    v37[4] = self;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B388, v37);
    -[PLScreenStateAgent setSpringBoardFlipbookStatisticsListener:](self, "setSpringBoardFlipbookStatisticsListener:", v16);

    if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
    {
      v17 = objc_alloc(MEMORY[0x1E0D80098]);
      -[PLOperator workQueue](self, "workQueue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v9;
      v36[1] = 3221225472;
      v36[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_193;
      v36[3] = &unk_1E8577F70;
      v36[4] = self;
      v19 = (void *)objc_msgSend(v17, "initWithWorkQueue:withRegistration:withBlock:", v18, &unk_1E864B3B0, v36);
      -[PLScreenStateAgent setSpringBoardAlwaysOnEnableStateResponder:](self, "setSpringBoardAlwaysOnEnableStateResponder:", v19);

      v20 = objc_alloc(MEMORY[0x1E0D80098]);
      -[PLOperator workQueue](self, "workQueue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v9;
      v35[1] = 3221225472;
      v35[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_201;
      v35[3] = &unk_1E8577F70;
      v35[4] = self;
      v22 = (void *)objc_msgSend(v20, "initWithWorkQueue:withRegistration:withBlock:", v21, &unk_1E864B3D8, v35);
      -[PLScreenStateAgent setSpringBoardBacklightStateChangeResponder:](self, "setSpringBoardBacklightStateChangeResponder:", v22);

      v23 = objc_alloc(MEMORY[0x1E0D80098]);
      -[PLOperator workQueue](self, "workQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v9;
      v34[1] = 3221225472;
      v34[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_207;
      v34[3] = &unk_1E8577F70;
      v34[4] = self;
      v25 = (void *)objc_msgSend(v23, "initWithWorkQueue:withRegistration:withBlock:", v24, &unk_1E864B400, v34);
      -[PLScreenStateAgent setSpringBoardFlipbookStatisticsResponder:](self, "setSpringBoardFlipbookStatisticsResponder:", v25);

    }
    if (_os_feature_enabled_impl() && objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    {
      -[PLScreenStateAgent setLastDisplayLayoutContainsLockScreen:](self, "setLastDisplayLayoutContainsLockScreen:", 0);
      -[PLScreenStateAgent setLastDisplayLayout:](self, "setLastDisplayLayout:", 0);
      v26 = *MEMORY[0x1E0D80390];
      +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Display"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator storage](self, "storage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastEntryForKey:withFilters:", v27, &unk_1E864FD00);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Active"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLScreenStateAgent setDisplayState:](self, "setDisplayState:", objc_msgSend(v30, "intValue"));

      }
      else
      {
        -[PLScreenStateAgent setDisplayState:](self, "setDisplayState:", 0);
      }
      +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", v26, CFSTR("Display"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v9;
      v33[1] = 3221225472;
      v33[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_220;
      v33[3] = &unk_1E8577F48;
      v33[4] = self;
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:withBlock:", self, v31, v33);
      -[PLScreenStateAgent setDisplayCallback:](self, "setDisplayCallback:", v32);

    }
  }
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLScreenStateAgent_EventForward_WindowMode: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardWindowMode:", v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLScreenStateAgent_EventBackward_IconDragging: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardIconDragging:", v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_172(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLScreenStateAgent_Aggregate_WidgetAdditionAnimation: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logAggregateWidgetAdditionAnimation:", v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_176(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLScreenStateAgent_Aggregate_WidgetFlipAnimation: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logAggregateWidgetFlipAnimation:", v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLScreenStateAgent_EventBackward_AlwaysOnEnableState: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardAlwaysOnEnableState:", v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLScreenStateAgent_EventBackward_BacklightStateChange: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardBacklightStateChange:", v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLScreenStateAgent_EventBackward_FlipbookStatistics: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardFlipbookStatistics:", v6);
}

id __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_193(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "AlwaysOnEnableState query received with info: %@", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "processQuery:withEntryKey:", v6, CFSTR("PLScreenStateAgent_EventBackward_AlwaysOnEnableState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("AlwaysOnEnableState"));
    PLLogScreenState();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412290;
      v14 = v10;
      _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "AlwaysOnEnableState query received with info: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    PLLogScreenState();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_ERROR, "AlwaysOnEnableState query did not succeed", (uint8_t *)&v13, 2u);
    }
    v10 = 0;
  }

  return v10;
}

id __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_201(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "BacklightStateChange query received with info: %@", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "processQuery:withEntryKey:", v6, CFSTR("PLScreenStateAgent_EventBackward_BacklightStateChange"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("BacklightStateChange"));
    PLLogScreenState();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412290;
      v14 = v10;
      _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "BacklightStateChange query received with info: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    PLLogScreenState();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_ERROR, "BacklightStateChange query did not succeed", (uint8_t *)&v13, 2u);
    }
    v10 = 0;
  }

  return v10;
}

id __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_207(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "FlipbookStatistics query received with info: %@", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "processQuery:withEntryKey:", v6, CFSTR("PLScreenStateAgent_EventBackward_FlipbookStatistics"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("FlipbookStatistics"));
    PLLogScreenState();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412290;
      v14 = v10;
      _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "FlipbookStatistics query received with info: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    PLLogScreenState();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_ERROR, "FlipbookStatistics query did not succeed", (uint8_t *)&v13, 2u);
    }
    v10 = 0;
  }

  return v10;
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_220(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "userInfo=%@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "handleDisplayCallback:", v3);
  }

}

- (void)dealloc
{
  FBSDisplayLayoutMonitor *carPlayDisplayMonitor;
  FBSDisplayLayoutMonitor *airPlayDisplayMonitor;
  FBSDisplayLayoutMonitor *mainDisplayMonitor;
  objc_super v6;

  carPlayDisplayMonitor = self->_carPlayDisplayMonitor;
  if (carPlayDisplayMonitor)
    -[FBSDisplayLayoutMonitor invalidate](carPlayDisplayMonitor, "invalidate");
  airPlayDisplayMonitor = self->_airPlayDisplayMonitor;
  if (airPlayDisplayMonitor)
    -[FBSDisplayLayoutMonitor invalidate](airPlayDisplayMonitor, "invalidate");
  mainDisplayMonitor = self->_mainDisplayMonitor;
  if (mainDisplayMonitor)
    -[FBSDisplayLayoutMonitor invalidate](mainDisplayMonitor, "invalidate");
  v6.receiver = self;
  v6.super_class = (Class)PLScreenStateAgent;
  -[PLAgent dealloc](&v6, sel_dealloc);
}

- (void)log
{
  void *v3;
  id v4;

  -[PLScreenStateAgent mainDisplayMonitor](self, "mainDisplayMonitor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLScreenStateAgent logEventForwardMainScreenState:](self, "logEventForwardMainScreenState:", v3);

}

- (void)logEventPointMainBacklightEvent:(id)a3 withContext:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t block;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D80390];
  v7 = a4;
  v8 = a3;
  +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", v6, CFSTR("BacklightEvent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v9);
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "transitionReason");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "numberWithInteger:", SBSBacklightChangeSourceForDisplayLayoutTransitionReason());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("TransitionReason"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = objc_msgSend(v8, "displayBacklightLevel");

  objc_msgSend(v14, "numberWithInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("BacklightLevel"));

  -[PLOperator logEntry:](self, "logEntry:", v10);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v17 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __66__PLScreenStateAgent_logEventPointMainBacklightEvent_withContext___block_invoke;
    v27 = &__block_descriptor_40_e5_v8__0lu32l8;
    v28 = v17;
    if (qword_1ED882570 != -1)
      dispatch_once(&qword_1ED882570, &block);
    if (_MergedGlobals_1_9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BacklightEvent: %@"), v10, block, v25, v26, v27, v28);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLScreenStateAgent.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLScreenStateAgent logEventPointMainBacklightEvent:withContext:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 559);

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

uint64_t __66__PLScreenStateAgent_logEventPointMainBacklightEvent_withContext___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_9 = result;
  return result;
}

- (void)ioReportingNotification:(id)a3 currentLayout:(id)a4
{
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  void *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "isEqualToDictionary:", a4);
  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      LOWORD(v13[0]) = 0;
      v8 = "current FBSDisplayLayoutElement dictionary is the same than the last, not sending a notification";
      v9 = v6;
      v10 = 2;
LABEL_9:
      _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)v13, v10);
    }
  }
  else
  {
    if (v7)
    {
      LOWORD(v13[0]) = 0;
      _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "current FBSDisplayLayoutElement dictionary is different than the last, notifying EnhancedScreenState Listener", (uint8_t *)v13, 2u);
    }

    ++ioReportingNotification_currentLayout__enhancedScreenStateCounter;
    v11 = (void *)MEMORY[0x1E0D80078];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.powerlog.EnhancedScreenState"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", v12, self, 0);

    PLLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v13[0] = 67109120;
      v13[1] = ioReportingNotification_currentLayout__enhancedScreenStateCounter;
      v8 = "FBSDisplayLayoutElement notification notified, count is now %d";
      v9 = v6;
      v10 = 8;
      goto LABEL_9;
    }
  }

}

- (void)logEventForwardCarScreenState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ScreenState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v4, "bounds");
    v10 = v9;
    objc_msgSend(v4, "bounds");
    v12 = v11;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v4, "elements");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v32)
    {
      v13 = v10 * v12;
      v31 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v34 != v31)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v16 = v5;
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
          v18 = v6;
          objc_msgSend(v17, "setEntryDate:", v6);
          objc_msgSend(v15, "bundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v15, "bundleIdentifier");
          else
            objc_msgSend(v15, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("bundleID"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "layoutRole"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("AppRole"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "displayType"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, CFSTR("Display"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "level"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, CFSTR("Level"));

          objc_msgSend(v15, "frame");
          v25 = v24;
          objc_msgSend(v15, "frame");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25 * v26 / v13);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v27, CFSTR("ScreenWeight"));

          -[PLOperator logEntry:](self, "logEntry:", v17);
          -[PLScreenStateAgent createCarPlayAccountingEvents:](self, "createCarPlayAccountingEvents:", v17);

          v5 = v16;
          v6 = v18;
        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v32);
    }

  }
  else
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
    objc_msgSend(v28, "setEntryDate:", v6);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", 0, CFSTR("bundleID"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", &unk_1E8632040, CFSTR("AppRole"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "displayType"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, CFSTR("Display"));

    objc_msgSend(v28, "setObject:forKeyedSubscript:", &unk_1E8652970, CFSTR("ScreenWeight"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", &unk_1E8632058, CFSTR("Level"));
    -[PLOperator logEntry:](self, "logEntry:", v28);
    -[PLScreenStateAgent createCarPlayAccountingEvents:](self, "createCarPlayAccountingEvents:", v28);

  }
}

- (void)logEventForwardAirPlayScreenState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t i;
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
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ScreenState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v4, "bounds");
    v10 = v9;
    objc_msgSend(v4, "bounds");
    v12 = v11;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v4, "elements");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v33)
    {
      v13 = v10 * v12;
      v32 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v35 != v32)
            objc_enumerationMutation(obj);
          v15 = v4;
          v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v17 = v5;
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
          v19 = v6;
          objc_msgSend(v18, "setEntryDate:", v6);
          objc_msgSend(v16, "bundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v16, "bundleIdentifier");
          else
            objc_msgSend(v16, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("bundleID"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "layoutRole"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("AppRole"));

          v4 = v15;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "displayType"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("Display"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "level"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("Level"));

          objc_msgSend(v16, "frame");
          v26 = v25;
          objc_msgSend(v16, "frame");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26 * v27 / v13);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, CFSTR("ScreenWeight"));

          -[PLScreenStateAgent createAirPlayWiFiAccountingEvent:](self, "createAirPlayWiFiAccountingEvent:", v18);
          v5 = v17;
          v6 = v19;
        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v33);
    }

  }
  else
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
    objc_msgSend(v29, "setEntryDate:", v6);
    objc_msgSend(v29, "setObject:forKeyedSubscript:", 0, CFSTR("bundleID"));
    objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1E8632040, CFSTR("AppRole"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "displayType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, CFSTR("Display"));

    objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1E8652970, CFSTR("ScreenWeight"));
    objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1E8632058, CFSTR("Level"));
    -[PLScreenStateAgent createAirPlayWiFiAccountingEvent:](self, "createAirPlayWiFiAccountingEvent:", v29);

  }
}

- (unint64_t)convertWindowingMode:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Invalid")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Mirroring")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Medusa")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Chamois")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NonInteractive")) & 1) != 0)
  {
    v4 = 4;
  }
  else
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, " Unknown windowingMode %@", (uint8_t *)&v7, 0xCu);
    }

    v4 = 5;
  }

  return v4;
}

- (unint64_t)convertZoomLevel:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Invalid")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LargerText")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Standard")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Dense")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Denser")) & 1) != 0)
  {
    v4 = 4;
  }
  else
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, " Unknown zoomLevel %@", (uint8_t *)&v7, 0xCu);
    }

    v4 = 5;
  }

  return v4;
}

- (void)logEventForwardWindowMode:(id)a3
{
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
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  id v22;

  v22 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80020], "isiPad"))
  {
    +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("WindowMode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v22);
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("displayName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("displayType"));

    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("windowingMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithUnsignedInteger:", -[PLScreenStateAgent convertWindowingMode:](self, "convertWindowingMode:", v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("windowingMode"));

    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("zoomLevel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithUnsignedInteger:", -[PLScreenStateAgent convertZoomLevel:](self, "convertZoomLevel:", v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("zoomLevel"));

    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("canvasSizeHeight"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("canvasSizeWidth"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "intValue") * v14;

    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("nativeSizeHeight"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("nativeSizeWidth"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "intValue");

    if (v16 >= 1 && v20 * v18 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v16 / (double)(v20 * v18));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("canvasRatio"));

    }
    -[PLOperator logEntry:](self, "logEntry:", v5);

  }
}

- (void)logEventBackwardIconDragging:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertFromSystemToMonotonic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Durations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("IconDragging"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __51__PLScreenStateAgent_logEventBackwardIconDragging___block_invoke;
  v18 = &unk_1E8579230;
  v11 = v9;
  v19 = v11;
  v12 = v7;
  v20 = v12;
  v13 = v10;
  v21 = v13;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v15);
  if (objc_msgSend(v13, "count", v15, v16, v17, v18))
  {
    v22 = v11;
    v23[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v14, v11);

  }
}

void __51__PLScreenStateAgent_logEventBackwardIconDragging___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D7FFB0];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithEntryKey:withDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("Duration"));

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
}

- (void)logEventBackwardAlwaysOnEnableState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
  {
    +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("AlwaysOnEnableState"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v8);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("focusMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8632070, CFSTR("focusMode"));
    -[PLOperator logEntry:](self, "logEntry:", v5);

  }
}

- (void)logEventBackwardBacklightStateChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "hasAOD") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 102040) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 102041))
  {
    +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BacklightStateChange"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v9);
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithUnsignedInt:", -[PLScreenStateAgent GetBacklightState:](self, "GetBacklightState:", v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("state"));

    -[PLOperator logEntry:](self, "logEntry:", v5);
  }

}

- (void)logEventBackwardFlipbookStatistics:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
  {
    +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("FlipbookStatistics"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v6);
    -[PLOperator logEntry:](self, "logEntry:", v5);

  }
}

- (id)processQuery:(id)a3 withEntryKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  id v27;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  _BYTE *v32;
  uint8_t v33[4];
  id v34;
  __int16 v35;
  uint64_t v36;
  _BYTE buf[24];
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
  {
    v7 = (void *)MEMORY[0x1D179C2E0]();
    PLLogScreenState();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "process for %@ Received query with payload=%@.", buf, 0x16u);
    }

    if (!v5
      || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("StartEpochTime")),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = v9 == 0,
          v9,
          v10))
    {
      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v6;
        _os_log_error_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_ERROR, "process for %@ Invalid payload!", buf, 0xCu);
      }
      v27 = 0;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("StartEpochTime"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
      v13 = objc_claimAutoreleasedReturnValue();

      -[NSObject convertFromSystemToMonotonic](v13, "convertFromSystemToMonotonic");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PLLogScreenState();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v14;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "process for %@ queryStartDate is =%@.", buf, 0x16u);
      }

      v16 = objc_alloc(MEMORY[0x1E0D80080]);
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v14, "timeIntervalSince1970");
      objc_msgSend(v17, "numberWithDouble:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v18, 3);

      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "storage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "entriesForKey:withComparisons:", v6, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogScreenState();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v23;
        _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "selected query entries for %@ are selectedEntries =%@.", buf, 0x16u);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v38 = __Block_byref_object_copy__0;
      v39 = __Block_byref_object_dispose__0;
      v40 = (id)objc_opt_new();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __48__PLScreenStateAgent_processQuery_withEntryKey___block_invoke;
      v30[3] = &unk_1E8579258;
      v25 = v6;
      v31 = v25;
      v32 = buf;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v30);
      PLLogScreenState();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v29 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v33 = 138412546;
        v34 = v25;
        v35 = 2112;
        v36 = v29;
        _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "process for %@ output response is =%@.", v33, 0x16u);
      }

      v27 = *(id *)(*(_QWORD *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

void __48__PLScreenStateAgent_processQuery_withEntryKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "entryID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("ID"));

  objc_msgSend(v3, "entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertFromMonotonicToSystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("timestamp"));

  PLLogScreenState();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "entryDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    v18 = 2112;
    v19 = v8;
    _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "process for query related to %@ is NSDates=%@ and correctedTimeStamp=%@", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);

}

- (void)logAggregateWidgetAdditionAnimation:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80368];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", v4, CFSTR("WidgetAdditionAnimation"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logAggregateWidgetFlipAnimation:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80368];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", v4, CFSTR("WidgetFlipAnimation"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)createCarPlayAccountingEvents:(id)a3
{
  id v3;
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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v5;
    v18[0] = &unk_1E8652970;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "entryDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 27, v6, v7);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ScreenWeight"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "entryDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 43, v11, v12);
  }
  else
  {
    objc_msgSend(v3, "entryDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 43, MEMORY[0x1E0C9AA70], v13);
  }
}

- (void)createAirPlayWiFiAccountingEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    v10[0] = &unk_1E8652970;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "entryDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 36, v7, v8);

  }
}

- (void)handleDisplayCallback:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  int v16;
  _BYTE v17[10];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412290;
    *(_QWORD *)v17 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "userInfo=%@", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Active"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLScreenStateAgent setDisplayState:](self, "setDisplayState:", objc_msgSend(v7, "intValue"));

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = -[PLScreenStateAgent displayState](self, "displayState");
    v12 = -[PLScreenStateAgent lastDisplayLayoutContainsLockScreen](self, "lastDisplayLayoutContainsLockScreen");
    -[PLScreenStateAgent lastDisplayLayout](self, "lastDisplayLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 67109634;
    *(_DWORD *)v17 = v11;
    *(_WORD *)&v17[4] = 1024;
    *(_DWORD *)&v17[6] = v12;
    v18 = 2112;
    v19 = v13;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "self.displayState=%d, self.lastDisplayLayoutContainsLockScreen=%d,  self.lastDisplayLayout=%@", (uint8_t *)&v16, 0x18u);

  }
  if ((-[PLScreenStateAgent displayState](self, "displayState") == 2
     || -[PLScreenStateAgent displayState](self, "displayState") == 1)
    && -[PLScreenStateAgent lastDisplayLayoutContainsLockScreen](self, "lastDisplayLayoutContainsLockScreen"))
  {
    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v14 = -[PLScreenStateAgent displayState](self, "displayState");
      v15 = -[PLScreenStateAgent lastDisplayLayoutContainsLockScreen](self, "lastDisplayLayoutContainsLockScreen");
      v16 = 67109376;
      *(_DWORD *)v17 = v14;
      *(_WORD *)&v17[4] = 1024;
      *(_DWORD *)&v17[6] = v15;
      _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "self.displayState=%d, self.lastDisplayLayoutContainsLockScreen=%d", (uint8_t *)&v16, 0xEu);
    }

    -[PLScreenStateAgent lastDisplayLayout](self, "lastDisplayLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLScreenStateAgent logEventForwardMainScreenState:](self, "logEventForwardMainScreenState:", v10);

  }
}

- (FBSDisplayLayoutMonitor)mainDisplayMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMainDisplayMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (FBSDisplayLayoutMonitor)airPlayDisplayMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAirPlayDisplayMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (FBSDisplayLayoutMonitor)carPlayDisplayMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCarPlayDisplayMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCListenerOperatorComposition)windowModeListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWindowModeListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableDictionary)lastScreenStateEntries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastScreenStateEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableDictionary)lastLayoutMonitorEntries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastLayoutMonitorEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLXPCListenerOperatorComposition)iconDraggingListner
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIconDraggingListner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLXPCListenerOperatorComposition)widgetAdditionAnimationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setWidgetAdditionAnimationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLXPCListenerOperatorComposition)widgetFlipAnimationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setWidgetFlipAnimationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLXPCListenerOperatorComposition)springBoardAlwaysOnEnableStateListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSpringBoardAlwaysOnEnableStateListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (PLXPCListenerOperatorComposition)springBoardBacklightStateChangeListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSpringBoardBacklightStateChangeListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PLXPCListenerOperatorComposition)springBoardFlipbookStatisticsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSpringBoardFlipbookStatisticsListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (PLXPCResponderOperatorComposition)springBoardAlwaysOnEnableStateResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSpringBoardAlwaysOnEnableStateResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (PLXPCResponderOperatorComposition)springBoardBacklightStateChangeResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSpringBoardBacklightStateChangeResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (PLXPCResponderOperatorComposition)springBoardFlipbookStatisticsResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSpringBoardFlipbookStatisticsResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (PLEntryNotificationOperatorComposition)displayCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDisplayCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (int)displayState
{
  return self->_displayState;
}

- (void)setDisplayState:(int)a3
{
  self->_displayState = a3;
}

- (FBSDisplayLayout)lastDisplayLayout
{
  return (FBSDisplayLayout *)objc_getProperty(self, a2, 184, 1);
}

- (BOOL)lastDisplayLayoutContainsLockScreen
{
  return self->_lastDisplayLayoutContainsLockScreen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDisplayLayout, 0);
  objc_storeStrong((id *)&self->_displayCallback, 0);
  objc_storeStrong((id *)&self->_springBoardFlipbookStatisticsResponder, 0);
  objc_storeStrong((id *)&self->_springBoardBacklightStateChangeResponder, 0);
  objc_storeStrong((id *)&self->_springBoardAlwaysOnEnableStateResponder, 0);
  objc_storeStrong((id *)&self->_springBoardFlipbookStatisticsListener, 0);
  objc_storeStrong((id *)&self->_springBoardBacklightStateChangeListener, 0);
  objc_storeStrong((id *)&self->_springBoardAlwaysOnEnableStateListener, 0);
  objc_storeStrong((id *)&self->_widgetFlipAnimationListener, 0);
  objc_storeStrong((id *)&self->_widgetAdditionAnimationListener, 0);
  objc_storeStrong((id *)&self->_iconDraggingListner, 0);
  objc_storeStrong((id *)&self->_lastLayoutMonitorEntries, 0);
  objc_storeStrong((id *)&self->_lastScreenStateEntries, 0);
  objc_storeStrong((id *)&self->_windowModeListener, 0);
  objc_storeStrong((id *)&self->_carPlayDisplayMonitor, 0);
  objc_storeStrong((id *)&self->_airPlayDisplayMonitor, 0);
  objc_storeStrong((id *)&self->_mainDisplayMonitor, 0);
}

@end
