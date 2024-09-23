@implementation VMUDuplicatesAnalyzer

- (const)analyzerName
{
  return "DUPLICATE OBJECTS";
}

- (id)_analysisSummaryWithGraphOrScanner:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  VMUDebugTimer *debugTimer;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  VMUDebugTimer *v12;
  NSObject *v13;
  unint64_t v14;
  os_signpost_id_t v15;
  id v16;
  id v17;
  VMUDebugTimer *v18;
  uint64_t v19;
  NSObject *v20;
  unint64_t v21;
  os_signpost_id_t v22;
  VMUDebugTimer *v23;
  NSObject *v24;
  unint64_t v25;
  os_signpost_id_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  VMUDebugTimer *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  unint64_t v39;
  os_signpost_id_t v40;
  id v41;
  __int128 v42;
  VMUVMRegionIdentifier *regionIdentifier;
  float v44;
  unint64_t v45;
  VMUAnalyzerSummaryField *v46;
  char v47;
  VMUAnalyzerSummaryField *v48;
  VMUAnalyzerSummaryField *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t j;
  NSMapTable *v57;
  VMUAnalyzerSummaryField *v58;
  void *v59;
  VMUAnalyzerSummaryField *v60;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[16];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  VMUDuplicatesAnalyzer *v79;
  id v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_new();
  v6 = (void *)objc_opt_new();
  debugTimer = self->super._debugTimer;
  if (debugTimer)
  {
    v8 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = self->super._debugTimer;
    if (v8)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = -[VMUDebugTimer signpostID](self->super._debugTimer, "signpostID");
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v9, OS_SIGNPOST_INTERVAL_END, v11, "VMUDuplicatesAnalyzer", ", buf, 2u);
        }
      }

      debugTimer = self->super._debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMUDuplicatesAnalyzer");
  -[VMUDebugTimer startWithCategory:message:](self->super._debugTimer, "startWithCategory:message:", "VMUDuplicatesAnalyzer", "Exctracting labels");
  v12 = self->super._debugTimer;
  if (v12)
  {
    -[VMUDebugTimer logHandle](v12, "logHandle");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = -[VMUDebugTimer signpostID](self->super._debugTimer, "signpostID");
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VMUDuplicatesAnalyzer", "Exctracting labels", buf, 2u);
      }
    }

  }
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __60__VMUDuplicatesAnalyzer__analysisSummaryWithGraphOrScanner___block_invoke;
  v77[3] = &unk_1E4E04060;
  v16 = v4;
  v78 = v16;
  v79 = self;
  v17 = v6;
  v80 = v17;
  v62 = v16;
  VMUEnumerateVMAnnotatedMallocObjectsWithBlock(v16, v77);
  v18 = self->super._debugTimer;
  v63 = (void *)v5;
  if (v18)
  {
    v19 = -[VMUDebugTimer signpostID](v18, "signpostID");
    v18 = self->super._debugTimer;
    if (v19)
    {
      -[VMUDebugTimer logHandle](v18, "logHandle");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = -[VMUDebugTimer signpostID](self->super._debugTimer, "signpostID");
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v22 = v21;
        if (os_signpost_enabled(v20))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v20, OS_SIGNPOST_INTERVAL_END, v22, "VMUDuplicatesAnalyzer", ", buf, 2u);
        }
      }

      v18 = self->super._debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](v18, "endEvent:", "VMUDuplicatesAnalyzer");
  -[VMUDebugTimer startWithCategory:message:](self->super._debugTimer, "startWithCategory:message:", "VMUDuplicatesAnalyzer", "Selecting labels that have duplicates");
  v23 = self->super._debugTimer;
  if (v23)
  {
    -[VMUDebugTimer logHandle](v23, "logHandle");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = -[VMUDebugTimer signpostID](self->super._debugTimer, "signpostID");
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v26 = v25;
      if (os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v26, "VMUDuplicatesAnalyzer", "Selecting labels that have duplicates", buf, 2u);
      }
    }

  }
  v27 = (void *)objc_opt_new();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  objc_msgSend(v17, "allKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v74 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_msgSend(v17, "objectForKeyedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v34, "count") >= 2)
          objc_msgSend(v27, "addObject:", v33);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    }
    while (v30);
  }

  v35 = self->super._debugTimer;
  if (v35)
  {
    v36 = -[VMUDebugTimer signpostID](v35, "signpostID");
    v35 = self->super._debugTimer;
    v37 = v63;
    if (v36)
    {
      -[VMUDebugTimer logHandle](v35, "logHandle");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = -[VMUDebugTimer signpostID](self->super._debugTimer, "signpostID");
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v40 = v39;
        if (os_signpost_enabled(v38))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v38, OS_SIGNPOST_INTERVAL_END, v40, "VMUDuplicatesAnalyzer", ", buf, 2u);
        }
      }

      v35 = self->super._debugTimer;
    }
  }
  else
  {
    v37 = v63;
  }
  -[VMUDebugTimer endEvent:](v35, "endEvent:", "VMUDuplicatesAnalyzer");
  v41 = v27;
  if (objc_msgSend(v41, "count"))
  {
    v42 = 0uLL;
    v71 = 0u;
    v72 = 0u;
    v70 = 0u;
    *(_OWORD *)buf = 0u;
    v69 = 0u;
    regionIdentifier = self->super._regionIdentifier;
    v44 = 0.0;
    if (regionIdentifier)
    {
      -[VMUVMRegionIdentifier summaryStatisticsOfAllZones](regionIdentifier, "summaryStatisticsOfAllZones");
      v45 = *(_QWORD *)buf;
      if (*(_QWORD *)buf)
      {
        v46 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]([VMUAnalyzerSummaryField alloc], "initWithKey:numericalValue:objectValue:fieldType:", CFSTR("Total allocations size"), *(_QWORD *)buf, 0, 2);
        objc_msgSend(v37, "addObject:", v46);
        v44 = (float)v45;

        v47 = 0;
      }
      else
      {
        v47 = 1;
      }
      v42 = 0uLL;
    }
    else
    {
      v47 = 1;
    }
    v66 = v42;
    v67 = v42;
    v64 = v42;
    v65 = v42;
    v50 = v41;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
    if (v51)
    {
      v52 = v51;
      v53 = 0;
      v54 = 0;
      v55 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v52; ++j)
        {
          if (*(_QWORD *)v65 != v55)
            objc_enumerationMutation(v50);
          objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j));
          v57 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
          v53 += -[NSMapTable count](v57, "count");
          v54 += totalSizeOfRanges(v57);

        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
      }
      while (v52);
    }
    else
    {
      v53 = 0;
      v54 = 0;
    }

    v58 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]([VMUAnalyzerSummaryField alloc], "initWithKey:numericalValue:objectValue:fieldType:", CFSTR("Duplicates total size"), v54, 0, 2);
    v37 = v63;
    objc_msgSend(v63, "addObject:", v58);
    if ((v47 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%2.1f"), (float)((float)((float)v54 / v44) * 100.0));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]([VMUAnalyzerSummaryField alloc], "initWithKey:numericalValue:objectValue:fieldType:", CFSTR("% of total allocations"), 0, v59, 0);

      objc_msgSend(v63, "addObject:", v60);
      v58 = v60;
    }
    v49 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]([VMUAnalyzerSummaryField alloc], "initWithKey:numericalValue:objectValue:fieldType:", CFSTR("Duplicates count"), v53, 0, 1);

  }
  else
  {
    v48 = [VMUAnalyzerSummaryField alloc];
    v49 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:](v48, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisSummaryKey[0], 0, CFSTR("No duplicates detected"), 0);
  }
  objc_msgSend(v37, "addObject:", v49);

  return v37;
}

void __60__VMUDuplicatesAnalyzer__analysisSummaryWithGraphOrScanner___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSMapTable *v12;

  if (*(_QWORD *)(a3 + 8) >> 60 == 1)
  {
    v6 = (void *)MEMORY[0x1A85A9758]();
    objc_msgSend(*(id *)(a1 + 32), "labelForNode:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = *(void **)(a3 + 16);
      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 33))
        objc_msgSend(v8, "className");
      else
        objc_msgSend(v8, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_QWORD *)(a3 + 16))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  %@"), v9, v7);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = v7;
      }
      v11 = v10;
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v10);
      v12 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 258, 1282);
        v12 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v12, v11);
      }
      NSMapInsert(v12, *(const void **)a3, (const void *)(*(_QWORD *)(a3 + 8) & 0xFFFFFFFFFFFFFFFLL));

    }
    objc_autoreleasePoolPop(v6);
  }
}

- (id)analysisSummaryWithError:(id *)a3
{
  return -[VMUDuplicatesAnalyzer _analysisSummaryWithGraphOrScanner:](self, "_analysisSummaryWithGraphOrScanner:", self->super._graph);
}

- (BOOL)findStringDupsInGraph:(id)a3 symbolicator:(_CSTypeRef)a4 stackLogReader:(id)a5 fieldBlock:(id)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  NSMapTable *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _UNKNOWN **v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  NSMapTable *v37;
  uint64_t v38;
  NSMapTable *v39;
  unint64_t v40;
  uint64_t v41;
  double v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  VMUCallTreeRoot *v49;
  uint64_t v50;
  VMUCallTreeRoot *v51;
  VMUBacktrace *v52;
  unsigned int v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  unsigned int v57;
  id v58;
  VMUCallTreeRoot *v59;
  void *v60;
  const char *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  void *v68;
  int v69;
  id v70;
  id obj;
  uint64_t v72;
  uint64_t v73;
  id v74;
  void *v75;
  uint64_t i;
  id v77;
  uint64_t v79;
  void *v80;
  id v81;
  uint64_t v83;
  void *context;
  void (**v85)(id, void *);
  NSMapTable *table;
  void *v87;
  void *value;
  void *key;
  NSMapEnumerator enumerator;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[4];
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[4];
  NSMapTable *v102;
  _QWORD v103[4];
  id v104;
  _QWORD v105[5];
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  char v109;
  _QWORD v110[5];
  _QWORD v111[5];
  id v112;
  id v113;
  id v114;
  NSMapTable *v115;
  int v116;
  _QWORD v117[512];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v85 = (void (**)(id, void *))a6;
  v10 = (void *)objc_opt_new();
  v80 = v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 258, 258);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v8, "zoneCount"))
  {
    v11 = 0;
    do
    {
      v12 = (void *)objc_opt_new();
      objc_msgSend(v8, "zoneNameForIndex:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v13);

      v11 = (v11 + 1);
    }
    while (v11 < objc_msgSend(v8, "zoneCount"));
  }
  v14 = VMULiteZoneIndex(v8);
  v111[0] = MEMORY[0x1E0C809B0];
  v111[1] = 3221225472;
  v111[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke;
  v111[3] = &unk_1E4E04088;
  v111[4] = self;
  v112 = v8;
  v70 = v10;
  v113 = v70;
  v15 = v80;
  v114 = v15;
  v116 = v14;
  v16 = (NSMapTable *)v9;
  v115 = v16;
  v68 = v112;
  VMUEnumerateVMAnnotatedMallocObjectsWithBlock(v112, v111);
  if (self->_minimumLabelCount > 1)
  {
    v110[0] = MEMORY[0x1E0C809B0];
    v110[1] = 3221225472;
    v110[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_2;
    v110[3] = &unk_1E4E040B0;
    v110[4] = self;
    objc_msgSend(v70, "enumerateKeysAndObjectsUsingBlock:", v110);
  }
  v106 = 0;
  v107 = &v106;
  v108 = 0x2020000000;
  v109 = 0;
  v105[0] = MEMORY[0x1E0C809B0];
  v105[1] = 3221225472;
  v105[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_3;
  v105[3] = &unk_1E4E040D8;
  v105[4] = &v106;
  objc_msgSend(v70, "enumerateKeysAndObjectsUsingBlock:", v105);
  v69 = *((unsigned __int8 *)v107 + 24);
  if (*((_BYTE *)v107 + 24))
  {
    objc_msgSend(v70, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = MEMORY[0x1E0C809B0];
    v103[1] = 3221225472;
    v103[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_4;
    v103[3] = &unk_1E4E04100;
    v74 = v70;
    v104 = v74;
    objc_msgSend(v17, "sortedArrayUsingComparator:", v103);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80
      && (!objc_msgSend(v15, "usesLiteMode") || (objc_msgSend(v15, "inspectingLiveProcess") & 1) == 0))
    {
      v101[0] = MEMORY[0x1E0C809B0];
      v101[1] = 3221225472;
      v101[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_5;
      v101[3] = &unk_1E4E01458;
      v102 = v16;
      objc_msgSend(v15, "enumerateMSLRecordsAndPayloads:", v101);

    }
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    obj = v18;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v119, 16);
    if (v19)
    {
      v20 = 0;
      v21 = &off_1E4DFF000;
      v72 = v19;
      v73 = *(_QWORD *)v98;
      do
      {
        for (i = 0; i != v72; ++i)
        {
          if (*(_QWORD *)v98 != v73)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
          v23 = objc_alloc((Class)v21[149]);
          v24 = (void *)objc_msgSend(v23, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisHeaderKey[0], 0, CFSTR("-----------------------------------------------------------------------"), 0);

          v85[2](v85, v24);
          v25 = (void *)MEMORY[0x1E0CB3940];
          v26 = objc_retainAutorelease(v22);
          objc_msgSend(v25, "stringWithFormat:", CFSTR("Zone %s\n"), objc_msgSend(v26, "UTF8String"));
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_alloc((Class)v21[149]);
          v87 = (void *)objc_msgSend(v27, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisHeaderKey[0], 0, v75, 0);

          v85[2](v85, v87);
          objc_msgSend(v74, "objectForKeyedSubscript:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "allKeys");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v95[0] = MEMORY[0x1E0C809B0];
          v95[1] = 3221225472;
          v95[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_6;
          v95[3] = &unk_1E4E04100;
          v81 = v28;
          v96 = v81;
          objc_msgSend(v29, "sortedArrayUsingComparator:", v95);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v80)
          {
            v31 = objc_alloc((Class)v21[149]);
            v32 = (void *)objc_msgSend(v31, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisHeaderKey[0], 0, CFSTR("    COUNT     BYTES   AVERAGE   CONTENT"), 0);

            v85[2](v85, v32);
            v33 = objc_alloc((Class)v21[149]);
            v87 = (void *)objc_msgSend(v33, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisHeaderKey[0], 0, CFSTR("    =====     =====   =======   ======="), 0);

            v85[2](v85, v87);
          }
          v93 = 0u;
          v94 = 0u;
          v91 = 0u;
          v92 = 0u;
          v77 = v30;
          v34 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v91, v118, 16);
          if (v34)
          {
            v79 = *(_QWORD *)v92;
            do
            {
              v83 = v34;
              for (j = 0; j != v83; ++j)
              {
                if (*(_QWORD *)v92 != v79)
                  objc_enumerationMutation(v77);
                v36 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * j);
                objc_msgSend(v81, "objectForKeyedSubscript:", v36);
                v37 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
                v38 = -[NSMapTable count](v37, "count");
                v39 = v37;
                v40 = v38;
                table = v39;
                v41 = totalSizeOfRanges(v39);
                *(float *)&v42 = (float)(unint64_t)v41 / (float)v40;
                if (v80)
                {
                  if (v40 < 2)
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Instances: %lu   Bytes: %lu   %@"), v42, v40, v41, v36);
                  else
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Instances: %lu   Total bytes: %lu   Average bytes: %.1f   %@"), v40, v41, *(float *)&v42, v36, v68);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = objc_alloc((Class)v21[149]);
                  v45 = objc_msgSend(v44, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisDataKey[0], 0, v43, 0);

                  v85[2](v85, (void *)v45);
                  v87 = (void *)v45;

                  context = (void *)MEMORY[0x1A85A9758]();
                  LODWORD(v45) = objc_msgSend(v15, "coldestFrameIsNotThreadId");
                  v49 = [VMUCallTreeRoot alloc];
                  if ((_DWORD)v45)
                    v50 = 12;
                  else
                    v50 = 8;
                  v51 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:](v49, "initWithSymbolicator:sampler:options:", a4._opaque_1, a4._opaque_2, 0, v50);
                  -[VMUCallTreeRoot setStackLogReader:](v51, "setStackLogReader:", v15);
                  v52 = objc_alloc_init(VMUBacktrace);
                  v52->_callstack.frames = v117;
                  v52->_flavor = 32;
                  memset(&enumerator, 0, sizeof(enumerator));
                  NSEnumerateMapTable(&enumerator, table);
                  v53 = 0;
                  value = 0;
                  key = 0;
                  v54 = -1;
                  while (NSNextMapEnumeratorPair(&enumerator, &key, &value))
                  {
                    v55 = NSMapGet(v16, key);
                    if ((void *)v54 != v55)
                    {
                      v53 = objc_msgSend(v15, "getFramesForStackID:stackFramesBuffer:", v55, v117);
                      v54 = (uint64_t)v55;
                    }
                    if (v53)
                    {
                      if ((objc_msgSend(v15, "coldestFrameIsNotThreadId") & 1) != 0)
                      {
                        LODWORD(v56) = 0;
                        v57 = v53;
                      }
                      else
                      {
                        v57 = v53 - 1;
                        v56 = v117[v53 - 1];
                      }
                      v52->_callstack.context.thread = v56;
                      v52->_callstack.length = v57;
                      v58 = -[VMUCallTreeRoot addBacktrace:count:numBytes:](v51, "addBacktrace:count:numBytes:", v52, 1, value);
                    }
                  }
                  NSEndMapTableEnumeration(&enumerator);
                  v52->_callstack.frames = 0;
                  -[VMUCallTreeRoot allBacktracesHaveBeenAdded](v51, "allBacktracesHaveBeenAdded");
                  if (self->_invertCallTrees)
                  {
                    -[VMUCallTreeNode invertedNode](v51, "invertedNode");
                    v21 = &off_1E4DFF000;
                    v59 = (VMUCallTreeRoot *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v59 = v51;
                    v21 = &off_1E4DFF000;
                  }
                  -[VMUCallTreeNode stringFromCallTreeIndentIfNoBranches:](v59, "stringFromCallTreeIndentIfNoBranches:", 1);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v60, "length"))
                  {
                    v61 = "Inverted call tree:";
                    if (!self->_invertCallTrees)
                      v61 = "Call tree:";
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), v61);
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    v63 = objc_alloc((Class)v21[149]);
                    v64 = (void *)objc_msgSend(v63, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisHeaderKey[0], 0, v62, 0);

                    v85[2](v85, v64);
                    v65 = objc_alloc((Class)v21[149]);
                    v87 = (void *)objc_msgSend(v65, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisDataKey[0], 0, v60, 0);

                    v85[2](v85, v87);
                  }

                  objc_autoreleasePoolPop(context);
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%9lu %9lu %9.1f   %@"), v40, v41, *(float *)&v42, v36);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = objc_alloc((Class)v21[149]);
                  v48 = objc_msgSend(v47, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisDataKey[0], 0, v46, 0);

                  v85[2](v85, (void *)v48);
                  v87 = (void *)v48;
                }

              }
              v34 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v91, v118, 16);
            }
            while (v34);
          }

          v66 = objc_alloc((Class)v21[149]);
          v20 = (void *)objc_msgSend(v66, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisDataKey[0], 0, &stru_1E4E04720, 0);

          v85[2](v85, v20);
        }
        v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v119, 16);
      }
      while (v72);

    }
  }
  _Block_object_dispose(&v106, 8);

  return v69 != 0;
}

void __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSMapTable *v17;
  uint64_t uniquing_table_index;

  if (a3[1] >> 60 == 1)
  {
    v8 = (void *)MEMORY[0x1A85A9758]();
    if (shouldGetLabelForObject((void *)a3[2], *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 34)))
    {
      objc_msgSend(*(id *)(a1 + 40), "zoneNameForIndex:", *(unsigned int *)(a4 + 148));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(a1 + 56), "usesLiteMode"))
        v11 = *(_DWORD *)(a4 + 148) != *(_DWORD *)(a1 + 72);
      else
        v11 = 1;
      objc_msgSend(*(id *)(a1 + 40), "labelForNode:", a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)a3[2];
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 33))
          objc_msgSend(v13, "className");
        else
          objc_msgSend(v13, "displayName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (a3[2])
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  %@"), v14, v12);
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = v12;
        }
        v16 = v15;
        objc_msgSend(v10, "objectForKeyedSubscript:", v15);
        v17 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 258, 1282);
          v17 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v16);
        }
        NSMapInsert(v17, (const void *)*a3, (const void *)(a3[1] & 0xFFFFFFFFFFFFFFFLL));
        if (*(_QWORD *)(a1 + 64))
        {
          if (((objc_msgSend(*(id *)(a1 + 56), "inspectingLiveProcess") ^ 1 | v11) & 1) != 0)
          {
            uniquing_table_index = -1;
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 56), "liteMSLPayloadforMallocAddress:size:", *a3, a3[1] & 0xFFFFFFFFFFFFFFFLL);
            uniquing_table_index = msl_payload_get_uniquing_table_index();
          }
          NSMapInsert(*(NSMapTable **)(a1 + 64), (const void *)*a3, (const void *)uniquing_table_index);
        }

      }
    }
    objc_autoreleasePoolPop(v8);
  }
}

void __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v11, "count") < *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
          objc_msgSend(v4, "removeObjectForKey:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

uint64_t __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  if (result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  if (v8 <= v10)
    v11 = 0;
  else
    v11 = -1;
  if (v8 < v10)
    return 1;
  else
    return v11;
}

void __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_5(uint64_t a1, int a2, void *key)
{
  const void *uniquing_table_index;

  if (a2 == 2)
  {
    if (NSMapGet(*(NSMapTable **)(a1 + 32), key))
    {
      uniquing_table_index = (const void *)msl_payload_get_uniquing_table_index();
      NSMapInsert(*(NSMapTable **)(a1 + 32), key, uniquing_table_index);
    }
  }
}

uint64_t __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  NSMapTable *v6;
  NSMapTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a3);
  v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSMapTable count](v6, "count");
  v9 = -[NSMapTable count](v7, "count") - v8;
  if (!v9)
  {
    v10 = totalSizeOfRanges(v6);
    v9 = totalSizeOfRanges(v7) - v10;
    if (!v9)
      v9 = objc_msgSend(a2, "compare:", a3);
  }

  return v9;
}

- (BOOL)findStringDupsByStack:(id)a3 stackLogReader:(id)a4 fieldBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  id v16;
  NSMapTable *v17;
  NSMapTable *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int64x2_t *v22;
  void *v23;
  int64x2_t v24;
  _QWORD *v25;
  int64x2_t *v26;
  int64x2_t v27;
  void *i;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSMapTable *v41;
  void *v42;
  void *v43;
  void *v44;
  _UNKNOWN **v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  _UNKNOWN **v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  _QWORD *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  uint64_t v77;
  id v78;
  void *v79;
  NSMapTable *v80;
  void *v81;
  id v82;
  NSMapTable *v83;
  NSMapTable *v84;
  uint64_t v85;
  void *v86;
  NSMapTable *v87;
  void *v88;
  id obj;
  id obja;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *context[2];
  void *contexta;
  uint64_t contextb;
  VMUDuplicatesAnalyzer *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[5];
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[4];
  NSMapTable *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  void *value;
  NSMapEnumerator enumerator;
  _QWORD v120[4];
  NSMapTable *v121;
  _QWORD v122[4];
  id v123;
  VMUDuplicatesAnalyzer *v124;
  id v125;
  id v126;
  NSMapTable *v127;
  int v128;
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v81 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 258, 259);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  v13 = VMULiteZoneIndex(v8);
  v122[0] = MEMORY[0x1E0C809B0];
  v122[1] = 3221225472;
  v122[2] = __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke;
  v122[3] = &unk_1E4E04088;
  v128 = v13;
  v123 = v9;
  v98 = self;
  v124 = self;
  v14 = v8;
  v15 = v123;
  v16 = v14;
  v125 = v14;
  v78 = v12;
  v126 = v78;
  v17 = v11;
  v127 = v17;
  v79 = v16;
  VMUEnumerateVMAnnotatedMallocObjectsWithBlock(v16, v122);
  if (v15
    && (!objc_msgSend(v15, "usesLiteMode") || (objc_msgSend(v15, "inspectingLiveProcess") & 1) == 0))
  {
    v120[0] = MEMORY[0x1E0C809B0];
    v120[1] = 3221225472;
    v120[2] = __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_2;
    v120[3] = &unk_1E4E01458;
    v121 = v17;
    objc_msgSend(v15, "enumerateMSLRecordsAndPayloads:", v120);

  }
  v88 = v15;
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 259);
  v18 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  memset(&enumerator, 0, sizeof(enumerator));
  v80 = v17;
  NSEnumerateMapTable(&enumerator, v17);
  value = 0;
  if (NSNextMapEnumeratorPair(&enumerator, 0, &value))
  {
    *(int64x2_t *)context = vdupq_n_s64(1uLL);
    do
    {
      v19 = (void *)MEMORY[0x1A85A9758]();
      v20 = *((_QWORD *)value + 2);
      if (v20 != -1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)value + 2));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[NSMapTable objectForKey:](v18, "objectForKey:", v21);

        if (!v22)
        {
          v22 = (int64x2_t *)malloc_type_malloc(0x18uLL, 0x108004098BBCF0FuLL);
          v22->i64[0] = 0;
          v22->i64[1] = 0;
          objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 2, 259);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "addObject:", v23);
          v22[1].i64[0] = (uint64_t)v23;
          NSMapInsertKnownAbsent(v18, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20), v22);

        }
        v24.i64[1] = (uint64_t)context[1];
        v24.i64[0] = *(_QWORD *)value;
        v25 = (char *)value + 8;
        *v22 = vaddq_s64(*v22, v24);
        v26 = (int64x2_t *)objc_msgSend((id)v22[1].i64[0], "objectForKey:", *v25);
        if (!v26)
        {
          v26 = (int64x2_t *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
          v26->i64[0] = 0;
          v26->i64[1] = 0;
          NSMapInsertKnownAbsent((NSMapTable *)v22[1].i64[0], *((const void **)value + 1), v26);
        }
        v27 = vdupq_n_s64(1uLL);
        v27.i64[0] = *(_QWORD *)value;
        *v26 = vaddq_s64(*v26, v27);
      }
      objc_autoreleasePoolPop(v19);
    }
    while (NSNextMapEnumeratorPair(&enumerator, 0, &value));
  }
  NSEndMapTableEnumeration(&enumerator);
  if (self->_minimumLabelCount >= 2)
  {
    v86 = (void *)MEMORY[0x1A85A9758]();
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    NSAllMapTableKeys(v18);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v93 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v132, 16);
    if (v93)
    {
      v91 = *(_QWORD *)v115;
      v83 = v18;
      do
      {
        for (i = 0; i != v93; i = (char *)i + 1)
        {
          if (*(_QWORD *)v115 != v91)
            objc_enumerationMutation(obj);
          v29 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * (_QWORD)i);
          contexta = (void *)MEMORY[0x1A85A9758]();
          v30 = -[NSMapTable objectForKey:](v18, "objectForKey:", v29);
          v112 = 0u;
          v113 = 0u;
          v110 = 0u;
          v111 = 0u;
          NSAllMapTableKeys(*(NSMapTable **)(v30 + 16));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v110, v131, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v111;
            do
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v111 != v34)
                  objc_enumerationMutation(v31);
                v36 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * j);
                v37 = (_QWORD *)objc_msgSend(*(id *)(v30 + 16), "objectForKey:", v36);
                v38 = v37[1];
                if (v38 < v98->_minimumLabelCount)
                {
                  v39 = *(_QWORD *)v30;
                  *(_QWORD *)(v30 + 8) -= v38;
                  *(_QWORD *)v30 = v39 - *v37;
                  objc_msgSend(*(id *)(v30 + 16), "removeObjectForKey:", v36);
                }
              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v110, v131, 16);
            }
            while (v33);
          }

          v18 = v83;
          if (!objc_msgSend(*(id *)(v30 + 16), "count"))
            -[NSMapTable removeObjectForKey:](v83, "removeObjectForKey:", v29);
          objc_autoreleasePoolPop(contexta);
        }
        v93 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v132, 16);
      }
      while (v93);
    }

    objc_autoreleasePoolPop(v86);
  }
  v40 = -[NSMapTable count](v18, "count");
  v41 = v80;
  if (v40)
  {
    NSAllMapTableKeys(v18);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v108[0] = MEMORY[0x1E0C809B0];
    v108[1] = 3221225472;
    v108[2] = __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_3;
    v108[3] = &unk_1E4E036D8;
    v87 = v18;
    v109 = v87;
    objc_msgSend(v42, "sortedArrayUsingComparator:", v108);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v82 = v43;
    obja = (id)objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v104, v130, 16);
    if (obja)
    {
      v77 = v40;
      v84 = v18;
      v44 = 0;
      v45 = &off_1E4DFF000;
      v85 = *(_QWORD *)v105;
      do
      {
        v46 = 0;
        do
        {
          if (*(_QWORD *)v105 != v85)
            objc_enumerationMutation(v82);
          v92 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v46);
          v94 = (void *)MEMORY[0x1A85A9758]();
          v47 = -[NSMapTable objectForKey:](v87, "objectForKey:", v92);
          v48 = objc_alloc((Class)v45[149]);
          v49 = (void *)objc_msgSend(v48, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisHeaderKey[0], 0, CFSTR("    COUNT     BYTES   AVERAGE   CONTENT"), 0);

          v10[2](v10, v49);
          v50 = objc_alloc((Class)v45[149]);
          v51 = (void *)objc_msgSend(v50, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisHeaderKey[0], 0, CFSTR("    =====     =====   =======   ======="), 0);

          v10[2](v10, v51);
          contextb = v46;
          if ((unint64_t)objc_msgSend(*(id *)(v47 + 16), "count") >= 2)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%9lu %9lu %9.1f   %s"), *(_QWORD *)(v47 + 8), *(_QWORD *)v47, (float)((float)*(unint64_t *)v47 / (float)*(unint64_t *)(v47 + 8)), "TOTAL FOR STACK");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_alloc((Class)v45[149]);
            v54 = (void *)objc_msgSend(v53, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisDataKey[0], 0, v52, 0);

            v10[2](v10, v54);
            v55 = objc_alloc((Class)v45[149]);
            v51 = (void *)objc_msgSend(v55, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisHeaderKey[0], 0, CFSTR("    =====     =====   =======   ======="), 0);

            v10[2](v10, v51);
          }
          v56 = v45;
          NSAllMapTableKeys(*(NSMapTable **)(v47 + 16));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v103[0] = MEMORY[0x1E0C809B0];
          v103[1] = 3221225472;
          v103[2] = __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_4;
          v103[3] = &__block_descriptor_40_e11_q24__0_8_16l;
          v103[4] = v47;
          objc_msgSend(v57, "sortedArrayUsingComparator:", v103);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          v59 = v58;
          v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v99, v129, 16);
          if (v60)
          {
            v61 = v60;
            v62 = *(_QWORD *)v100;
            do
            {
              v63 = 0;
              v64 = v51;
              do
              {
                if (*(_QWORD *)v100 != v62)
                  objc_enumerationMutation(v59);
                v65 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v63);
                v66 = (_QWORD *)objc_msgSend(*(id *)(v47 + 16), "objectForKey:", v65);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%9lu %9lu %9.1f   %@"), v66[1], *v66, (float)((float)(unint64_t)*v66 / (float)(unint64_t)v66[1]), v65);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                v68 = objc_alloc((Class)v56[149]);
                v51 = (void *)objc_msgSend(v68, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisDataKey[0], 0, v67, 0);

                v10[2](v10, v51);
                ++v63;
                v64 = v51;
              }
              while (v61 != v63);
              v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v99, v129, 16);
            }
            while (v61);
          }

          v45 = v56;
          v69 = objc_alloc((Class)v56[149]);
          v70 = (void *)objc_msgSend(v69, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisHeaderKey[0], 0, CFSTR("======"), 0);

          v10[2](v10, v70);
          objc_msgSend(v88, "symbolicatedBacktraceForStackID:options:", objc_msgSend(v92, "unsignedLongLongValue"), 4 * v98->_fullStacks);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("STACK: "), v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_alloc((Class)v56[149]);
          v74 = (void *)objc_msgSend(v73, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisDataKey[0], 0, v72, 0);

          v10[2](v10, v74);
          v75 = objc_alloc((Class)v56[149]);
          v44 = (void *)objc_msgSend(v75, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisDataKey[0], 0, &stru_1E4E04720, 0);

          v10[2](v10, v44);
          objc_autoreleasePoolPop(v94);
          v46 = contextb + 1;
        }
        while ((id)(contextb + 1) != obja);
        obja = (id)objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v104, v130, 16);
      }
      while (obja);

      v41 = v80;
      v18 = v84;
      v40 = v77;
    }

  }
  return v40 != 0;
}

void __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD *v18;
  uint64_t uniquing_table_index;

  if (objc_msgSend(*(id *)(a1 + 32), "usesLiteMode"))
    v8 = *(_DWORD *)(a4 + 148) != *(_DWORD *)(a1 + 72);
  else
    v8 = 1;
  if (a3[1] >> 60 == 1)
  {
    v9 = (void *)MEMORY[0x1A85A9758]();
    if (shouldGetLabelForObject((void *)a3[2], *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 34)))
    {
      objc_msgSend(*(id *)(a1 + 48), "labelForNode:", a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)a3[2];
        if (v11)
        {
          if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 33))
            objc_msgSend(v11, "className");
          else
            objc_msgSend(v11, "displayName");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@  %@"), v12, v10);
          v17 = *(id *)(a1 + 56);
          v13 = v16;
          objc_msgSend(v17, "member:", v13);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            objc_msgSend(v17, "addObject:", v13);
            v15 = v13;
          }

        }
        else
        {
          v12 = *(id *)(a1 + 56);
          v13 = v10;
          objc_msgSend(v12, "member:", v13);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            objc_msgSend(v12, "addObject:", v13);
            v14 = v13;
          }
          v15 = v14;
        }

        v18 = malloc_type_malloc(0x18uLL, 0x10800401842DC26uLL);
        *v18 = a3[1] & 0xFFFFFFFFFFFFFFFLL;
        v18[1] = v15;
        if (((objc_msgSend(*(id *)(a1 + 32), "inspectingLiveProcess") ^ 1 | v8) & 1) != 0)
        {
          uniquing_table_index = -1;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "liteMSLPayloadforMallocAddress:size:", *a3, a3[1] & 0xFFFFFFFFFFFFFFFLL);
          uniquing_table_index = msl_payload_get_uniquing_table_index();
        }
        v18[2] = uniquing_table_index;
        NSMapInsert(*(NSMapTable **)(a1 + 64), (const void *)*a3, v18);

      }
    }
    objc_autoreleasePoolPop(v9);
  }
}

uint64_t __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_2(uint64_t result, int a2, void *key)
{
  uint64_t v3;

  if (a2 == 2)
  {
    result = (uint64_t)NSMapGet(*(NSMapTable **)(result + 32), key);
    if (result)
    {
      v3 = result;
      result = msl_payload_get_uniquing_table_index();
      *(_QWORD *)(v3 + 16) = result;
    }
  }
  return result;
}

uint64_t __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = (_QWORD *)objc_msgSend(v5, "objectForKey:", a2);
  v8 = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);

  if (*v7 <= *v8)
    v9 = 0;
  else
    v9 = -1;
  if (*v7 < *v8)
    return 1;
  else
    return v9;
}

uint64_t __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  v7 = (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v5);
  v8 = (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v6);
  if (*v7 <= *v8)
    v9 = 0;
  else
    v9 = -1;
  if (*v7 < *v8)
    v10 = 1;
  else
    v10 = v9;
  if (*v7 == *v8)
    v10 = objc_msgSend(v5, "compare:", v6);

  return v10;
}

- (void)summaryWithGraph:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  -[VMUDuplicatesAnalyzer _analysisSummaryWithGraphOrScanner:](self, "_analysisSummaryWithGraphOrScanner:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__VMUDuplicatesAnalyzer_summaryWithGraph_block___block_invoke;
  v10[3] = &unk_1E4E04148;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

void __48__VMUDuplicatesAnalyzer_summaryWithGraph_block___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "longestKeyLength");
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "key");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "UTF8String");
  objc_msgSend(v4, "formattedValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v9);
  objc_msgSend(v6, "stringWithFormat:", CFSTR("    %*s:  %s"), v5, v8, objc_msgSend(v10, "UTF8String"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)findStringDupsInGraph:(id)a3 symbolicator:(_CSTypeRef)a4 stackLogReader:(id)a5 block:(id)a6
{
  unint64_t opaque_2;
  unint64_t opaque_1;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;

  opaque_2 = a4._opaque_2;
  opaque_1 = a4._opaque_1;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_block___block_invoke;
  v14[3] = &unk_1E4E04170;
  v15 = v11;
  v12 = v11;
  LOBYTE(a5) = -[VMUDuplicatesAnalyzer findStringDupsInGraph:symbolicator:stackLogReader:fieldBlock:](self, "findStringDupsInGraph:symbolicator:stackLogReader:fieldBlock:", a3, opaque_1, opaque_2, a5, v14);

  return (char)a5;
}

void __81__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "formattedValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (BOOL)findStringDupsByStack:(id)a3 stackLogReader:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_block___block_invoke;
  v11[3] = &unk_1E4E04170;
  v12 = v8;
  v9 = v8;
  LOBYTE(a4) = -[VMUDuplicatesAnalyzer findStringDupsByStack:stackLogReader:fieldBlock:](self, "findStringDupsByStack:stackLogReader:fieldBlock:", a3, a4, v11);

  return (char)a4;
}

void __68__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "formattedValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)fullAnalysisWithBlock:(id)a3
{
  void (**v4)(id, void *);
  VMUAnalyzerSummaryField *v5;
  VMUAnalyzerSummaryField *v6;
  VMUAnalyzerSummaryField *v7;
  __CFString *v8;
  void *v9;
  VMUAnalyzerSummaryField *v10;
  void *v11;
  VMUAnalyzerSummaryField *v12;
  VMUAnalyzerSummaryField *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  VMUProcessObjectGraph *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  VMUAnalyzerSummaryField *v23;
  uint64_t v24;
  VMUProcessObjectGraph *graph;
  VMUAnalyzerSummaryField *v26;
  __CFString *v27;
  uint64_t v28;
  char v29;
  _QWORD v30[4];
  void (**v31)(id, void *);
  _QWORD v32[4];
  void (**v33)(id, void *);

  v4 = (void (**)(id, void *))a3;
  if (self->_objectContentLevel != 1)
  {
    if (!self->_quiet)
    {
      v7 = [VMUAnalyzerSummaryField alloc];
      v8 = kVMUAnalysisDataKey[0];
      -[VMUProcessObjectGraph processDescriptionString](self->super._graph, "processDescriptionString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:](v7, "initWithKey:numericalValue:objectValue:fieldType:", v8, 0, v9, 0);

      v4[2](v4, v10);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Showing object labels that have at least %lu duplicates.  Pass the \"-minimumCount <count>\" argument to change the threshold.\n"), self->_minimumLabelCount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [VMUAnalyzerSummaryField alloc];
    v6 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:](v12, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisWarningKey[0], 0, v11, 0);
    v4[2](v4, v6);
    if (self->_objectContentLevel == 2)
    {
      v13 = [VMUAnalyzerSummaryField alloc];
      v14 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:](v13, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisWarningKey[0], 0, CFSTR("The memory graph file only contains labels for contents of readonly memory of the target process, so only those items can be shown.\n"), 0);

      v4[2](v4, (void *)v14);
      v6 = (VMUAnalyzerSummaryField *)v14;
    }
    if (self->_showStacks)
    {
      -[VMUProcessObjectGraph stackLogReader](self->super._graph, "stackLogReader");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        if (!self->_showCallTrees)
        {
          graph = self->super._graph;
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __47__VMUDuplicatesAnalyzer_fullAnalysisWithBlock___block_invoke;
          v32[3] = &unk_1E4E04170;
          v33 = v4;
          LOBYTE(graph) = -[VMUDuplicatesAnalyzer findStringDupsByStack:stackLogReader:fieldBlock:](self, "findStringDupsByStack:stackLogReader:fieldBlock:", graph, v15, v32);

          if ((graph & 1) != 0)
          {
LABEL_20:
            if (self->_quiet)
              goto LABEL_21;
            v26 = [VMUAnalyzerSummaryField alloc];
            v27 = kVMUAnalysisDataKey[0];
            -[VMUProcessObjectGraph binaryImagesDescription](self->super._graph, "binaryImagesDescription");
            v28 = objc_claimAutoreleasedReturnValue();
            v24 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:](v26, "initWithKey:numericalValue:objectValue:fieldType:", v27, 0, v28, 0);

            v6 = (VMUAnalyzerSummaryField *)v28;
LABEL_18:

            v4[2](v4, (void *)v24);
            v6 = (VMUAnalyzerSummaryField *)v24;
LABEL_21:

            goto LABEL_22;
          }
LABEL_17:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No object labels had %lu duplicates."), self->_minimumLabelCount);
          v22 = objc_claimAutoreleasedReturnValue();

          v23 = [VMUAnalyzerSummaryField alloc];
          v24 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:](v23, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisWarningKey[0], 0, v22, 0);
          v11 = (void *)v22;
          goto LABEL_18;
        }
        v16 = v11;
        v29 = 0;
LABEL_14:
        v17 = self->super._graph;
        -[VMUProcessObjectGraph symbolStore](v17, "symbolStore");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "symbolicator");
        v21 = v20;
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __47__VMUDuplicatesAnalyzer_fullAnalysisWithBlock___block_invoke_2;
        v30[3] = &unk_1E4E04170;
        v31 = v4;
        LOBYTE(v17) = -[VMUDuplicatesAnalyzer findStringDupsInGraph:symbolicator:stackLogReader:fieldBlock:](self, "findStringDupsInGraph:symbolicator:stackLogReader:fieldBlock:", v17, v19, v21, v15, v30);

        v11 = v16;
        if ((v17 & 1) != 0)
        {
          if ((v29 & 1) != 0)
            goto LABEL_21;
          goto LABEL_20;
        }
        goto LABEL_17;
      }
      v16 = v11;
    }
    else
    {
      v16 = v11;
      v15 = 0;
    }
    v29 = 1;
    goto LABEL_14;
  }
  v5 = [VMUAnalyzerSummaryField alloc];
  v6 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:](v5, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisErrorKey[0], 0, CFSTR("The memory graph file does not contain any labels for allocations."), 0);
  v4[2](v4, v6);
LABEL_22:

}

uint64_t __47__VMUDuplicatesAnalyzer_fullAnalysisWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__VMUDuplicatesAnalyzer_fullAnalysisWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)invertCallTrees
{
  return self->_invertCallTrees;
}

- (void)setInvertCallTrees:(BOOL)a3
{
  self->_invertCallTrees = a3;
}

- (BOOL)showRawClassNames
{
  return self->_showRawClassNames;
}

- (void)setShowRawClassNames:(BOOL)a3
{
  self->_showRawClassNames = a3;
}

- (BOOL)stringsOnly
{
  return self->_stringsOnly;
}

- (void)setStringsOnly:(BOOL)a3
{
  self->_stringsOnly = a3;
}

- (unint64_t)minimumLabelCount
{
  return self->_minimumLabelCount;
}

- (void)setMinimumLabelCount:(unint64_t)a3
{
  self->_minimumLabelCount = a3;
}

- (BOOL)showStacks
{
  return self->_showStacks;
}

- (void)setShowStacks:(BOOL)a3
{
  self->_showStacks = a3;
}

- (BOOL)fullStacks
{
  return self->_fullStacks;
}

- (void)setFullStacks:(BOOL)a3
{
  self->_fullStacks = a3;
}

- (BOOL)showCallTrees
{
  return self->_showCallTrees;
}

- (void)setShowCallTrees:(BOOL)a3
{
  self->_showCallTrees = a3;
}

- (BOOL)quiet
{
  return self->_quiet;
}

- (void)setQuiet:(BOOL)a3
{
  self->_quiet = a3;
}

- (unsigned)objectContentLevel
{
  return self->_objectContentLevel;
}

- (void)setObjectContentLevel:(unsigned int)a3
{
  self->_objectContentLevel = a3;
}

@end
