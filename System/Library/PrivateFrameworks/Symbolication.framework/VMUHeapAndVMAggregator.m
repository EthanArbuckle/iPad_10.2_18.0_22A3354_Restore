@implementation VMUHeapAndVMAggregator

- (VMUHeapAndVMAggregator)initWithGraph:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  VMUHeapAndVMAggregator *v9;
  VMUHeapAndVMAggregator *v10;
  uint64_t v11;
  VMUClassPatternMatcher *classFilterPatternMatcher;
  uint64_t v13;
  VMUClassInfo *nonObjectInfo;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VMUHeapAndVMAggregator;
  v9 = -[VMUHeapAndVMAggregator init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_heapAndVMOptions, a4);
    objc_storeStrong((id *)&v10->_graph, a3);
    -[VMUHeapAndVMAggregatorOptions classFilterPatternMatcher](v10->_heapAndVMOptions, "classFilterPatternMatcher");
    v11 = objc_claimAutoreleasedReturnValue();
    classFilterPatternMatcher = v10->_classFilterPatternMatcher;
    v10->_classFilterPatternMatcher = (VMUClassPatternMatcher *)v11;

    +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUClassInfo, "classInfoWithClassName:binaryPath:type:", CFSTR("non-object"), &stru_1E4E04720, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    nonObjectInfo = v10->_nonObjectInfo;
    v10->_nonObjectInfo = (VMUClassInfo *)v13;

  }
  return v10;
}

- (NSArray)heapZoneAggregates
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_heapZoneAggregates, "copy");
}

- (id)_classDisplayName:(id)a3
{
  VMUHeapAndVMAggregatorOptions *heapAndVMOptions;
  id v4;
  void *v5;

  heapAndVMOptions = self->_heapAndVMOptions;
  v4 = a3;
  if (-[VMUHeapAndVMAggregatorOptions showRawClassNames](heapAndVMOptions, "showRawClassNames"))
    objc_msgSend(v4, "className");
  else
    objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_countAllocation:(id)a3 inRegion:(id)a4
{
  VMUClassInfo *v6;
  VMUClassInfo *nonObjectInfo;
  VMUClassInfo *v8;
  void *v9;
  unsigned int *v10;

  v10 = (unsigned int *)a4;
  objc_msgSend(*(id *)(a3.var0 + 16), "genericInfo");
  v6 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
  nonObjectInfo = v6;
  if (!v6)
    nonObjectInfo = self->_nonObjectInfo;
  v8 = nonObjectInfo;

  -[VMUMallocZoneAggregate incrementAllocationCountForClassInfo:size:](self->_allZonesAggregate, "incrementAllocationCountForClassInfo:size:", v8, *(_QWORD *)(a3.var0 + 8) & 0xFFFFFFFFFFFFFFFLL);
  if (-[VMUHeapAndVMAggregatorOptions separateByZone](self->_heapAndVMOptions, "separateByZone"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_heapZoneAggregates, "objectAtIndexedSubscript:", v10[37]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "incrementAllocationCountForClassInfo:size:", v8, *(_QWORD *)(a3.var0 + 8) & 0xFFFFFFFFFFFFFFFLL);

  }
}

- (void)analyzeMemgraph
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  os_signpost_id_t v15;
  VMUMallocZoneAggregate *v16;
  VMUMallocZoneAggregate *allZonesAggregate;
  NSMutableArray *v18;
  NSMutableArray *heapZoneAggregates;
  unsigned int v20;
  NSMutableArray *v21;
  VMUMallocZoneAggregate *v22;
  VMUHeapAndVMAggregator *v23;
  VMUVMRegionIdentifier *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  VMUCommonGraphInterface *graph;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  NSObject *v39;
  void *v40;
  os_signpost_id_t v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  void *v46;
  NSObject *v47;
  void *v48;
  os_signpost_id_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  os_signpost_id_t v56;
  void *v57;
  VMUCommonGraphInterface *v58;
  void *v59;
  void *v60;
  BOOL v61;
  void *v62;
  NSObject *v63;
  void *v64;
  os_signpost_id_t v65;
  void *v66;
  void *v67;
  int v68;
  unsigned int v69;
  void *__b;
  _QWORD v72[6];
  _QWORD v73[5];
  id v74;
  _QWORD *v75;
  void *v76;
  unsigned int v77;
  int v78;
  uint8_t buf[16];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[3];
  int v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "signpostID");

    if (v4)
    {
      -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logHandle");
      v6 = objc_claimAutoreleasedReturnValue();

      -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "signpostID");

      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v6, OS_SIGNPOST_INTERVAL_END, v8, "VMUHeapAndVMAggregator", ", buf, 2u);
      }

    }
  }
  -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endEvent:", "VMUHeapAndVMAggregator");

  -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startWithCategory:message:", "VMUHeapAndVMAggregator", "counting allocations");

  -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logHandle");
    v13 = objc_claimAutoreleasedReturnValue();

    -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "signpostID");

    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VMUHeapAndVMAggregator", "counting allocations", buf, 2u);
    }

  }
  v16 = -[VMUMallocZoneAggregate initWithZoneName:options:]([VMUMallocZoneAggregate alloc], "initWithZoneName:options:", 0, self->_heapAndVMOptions);
  allZonesAggregate = self->_allZonesAggregate;
  self->_allZonesAggregate = v16;

  if (-[VMUHeapAndVMAggregatorOptions separateByZone](self->_heapAndVMOptions, "separateByZone"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    heapZoneAggregates = self->_heapZoneAggregates;
    self->_heapZoneAggregates = v18;

    if (-[VMUCommonGraphInterface zoneCount](self->_graph, "zoneCount"))
    {
      v20 = 0;
      do
      {
        v21 = self->_heapZoneAggregates;
        v22 = -[VMUMallocZoneAggregate initWithZoneName:options:]([VMUMallocZoneAggregate alloc], "initWithZoneName:options:", 0, self->_heapAndVMOptions);
        -[NSMutableArray addObject:](v21, "addObject:", v22);

        ++v20;
      }
      while (v20 < -[VMUCommonGraphInterface zoneCount](self->_graph, "zoneCount"));
    }
  }
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x2020000000;
  v89 = 0;
  v23 = self;
  v69 = -[VMUCommonGraphInterface nodeNamespaceSize](self->_graph, "nodeNamespaceSize");
  v68 = -[VMUCommonGraphInterface zoneCount](self->_graph, "zoneCount");
  v67 = (void *)objc_opt_new();
  if (-[VMUHeapAndVMAggregatorOptions guessNonObjects](self->_heapAndVMOptions, "guessNonObjects"))
  {
    __b = malloc_type_malloc(4 * v69, 0x100004052888210uLL);
    *(_DWORD *)buf = -1;
    memset_pattern4(__b, buf, 4 * v69);
  }
  else
  {
    __b = 0;
  }
  if ((-[VMUHeapAndVMAggregatorOptions scope](self->_heapAndVMOptions, "scope") == 2
     || -[VMUHeapAndVMAggregatorOptions scope](self->_heapAndVMOptions, "scope") == 1)
    && -[VMUCommonGraphInterface isMemberOfClass:](self->_graph, "isMemberOfClass:", objc_opt_class()))
  {
    v24 = -[VMUVMRegionIdentifier initWithGraph:options:]([VMUVMRegionIdentifier alloc], "initWithGraph:options:", self->_graph, 0);
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    -[VMUVMRegionIdentifier zoneNames](v24, "zoneNames");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v85 != v27)
            objc_enumerationMutation(v25);
          v29 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i);
          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          *(_OWORD *)buf = 0u;
          if (v24)
          {
            -[VMUVMRegionIdentifier computedStatisticsForZoneWithName:](v24, "computedStatisticsForZoneWithName:", v29);
            if (*((_QWORD *)&v83 + 1))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VM: %@ fragmentation"), v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUClassInfo, "classInfoWithClassName:binaryPath:type:", v30, &stru_1E4E04720, 0);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[VMUMallocZoneAggregate modifySize:count:forClassInfo:](self->_allZonesAggregate, "modifySize:count:forClassInfo:", *((_QWORD *)&v83 + 1), 1, v31);

            }
          }
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
      }
      while (v26);
    }

    v23 = self;
  }
  graph = v23->_graph;
  v33 = MEMORY[0x1E0C809B0];
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __41__VMUHeapAndVMAggregator_analyzeMemgraph__block_invoke;
  v73[3] = &unk_1E4E04198;
  v77 = v69;
  v75 = v88;
  v73[4] = v23;
  v76 = __b;
  v34 = v67;
  v74 = v34;
  v78 = v68;
  -[VMUCommonGraphInterface enumerateRegionsWithBlock:](graph, "enumerateRegionsWithBlock:", v73);

  -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "signpostID") == 0;

    if (!v37)
    {
      -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "logHandle");
      v39 = objc_claimAutoreleasedReturnValue();

      -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "signpostID");

      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v39, OS_SIGNPOST_INTERVAL_END, v41, "VMUHeapAndVMAggregator", ", buf, 2u);
      }

    }
  }
  -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "endEvent:", "VMUHeapAndVMAggregator");

  if (-[VMUHeapAndVMAggregatorOptions guessNonObjects](self->_heapAndVMOptions, "guessNonObjects"))
  {
    -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "signpostID") == 0;

      if (!v45)
      {
        -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "logHandle");
        v47 = objc_claimAutoreleasedReturnValue();

        -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "signpostID");

        if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v47, OS_SIGNPOST_INTERVAL_END, v49, "VMUHeapAndVMAggregator", ", buf, 2u);
        }

      }
    }
    -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "endEvent:", "VMUHeapAndVMAggregator");

    -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "startWithCategory:message:", "VMUHeapAndVMAggregator", "enumerating references for guessNonObjects");

    -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "logHandle");
      v54 = objc_claimAutoreleasedReturnValue();

      -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "signpostID");

      if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v56, "VMUHeapAndVMAggregator", "enumerating references for guessNonObjects", buf, 2u);
      }

    }
    v57 = (void *)MEMORY[0x1A85A9758]();
    v58 = self->_graph;
    v72[0] = v33;
    v72[1] = 3221225472;
    v72[2] = __41__VMUHeapAndVMAggregator_analyzeMemgraph__block_invoke_19;
    v72[3] = &unk_1E4E041C0;
    v72[4] = self;
    v72[5] = __b;
    -[VMUCommonGraphInterface enumerateReferencesWithBlock:](v58, "enumerateReferencesWithBlock:", v72);
    objc_autoreleasePoolPop(v57);
    -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "signpostID") == 0;

      if (!v61)
      {
        -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "logHandle");
        v63 = objc_claimAutoreleasedReturnValue();

        -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "signpostID");

        if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v63, OS_SIGNPOST_INTERVAL_END, v65, "VMUHeapAndVMAggregator", ", buf, 2u);
        }

      }
    }
    -[VMUHeapAndVMAggregatorOptions debugTimer](self->_heapAndVMOptions, "debugTimer");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "endEvent:", "VMUHeapAndVMAggregator");

    free(__b);
  }

  _Block_object_dispose(v88, 8);
}

void __41__VMUHeapAndVMAggregator_analyzeMemgraph__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  uint64_t v8;
  void *v9;
  int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void **v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(v4 + 8);
  v5 = v4 + 8;
  if (*(_DWORD *)(v6 + 24) < *(_DWORD *)(a1 + 64))
  {
    v7 = (void **)&off_1E4DFF000;
    do
    {
      v26 = 0;
      v25 = 0uLL;
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 16);
      if (v9)
      {
        objc_msgSend(v9, "nodeDetails:", *(unsigned int *)(*(_QWORD *)v5 + 24));
        v8 = *(_QWORD *)(a1 + 32);
      }
      v10 = objc_msgSend(*(id *)(v8 + 8), "scope");
      if (v10 == 2)
      {
        v11 = *((_QWORD *)&v25 + 1);
        if (*((_QWORD *)&v25 + 1) >> 60 != 5)
          goto LABEL_29;
      }
      else if (v10 == 1)
      {
        v11 = *((_QWORD *)&v25 + 1);
        if (*((_QWORD *)&v25 + 1) >> 60 != 1)
        {
          if (!VMUGraphNodeType_IsVMRegion(*((_QWORD *)&v25 + 1) >> 60))
            goto LABEL_29;
          v11 = *((_QWORD *)&v25 + 1);
        }
      }
      else
      {
        if (v10)
          abort();
        v11 = *((_QWORD *)&v25 + 1);
        if (*((_QWORD *)&v25 + 1) >> 60 != 1)
          goto LABEL_29;
      }
      if ((v11 & 0xFFFFFFFFFFFFFFFLL) != 0)
      {
        if ((unint64_t)v25 >= v3[2] + v3[1])
          break;
        v12 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        if (!v12)
          goto LABEL_20;
        v23 = v25;
        v24 = v26;
        if (objc_msgSend(v12, "matchesNodeDetails:orNodeDescription:", &v23, 0))
        {
          v11 = *((_QWORD *)&v25 + 1);
LABEL_20:
          if (v11 >> 60 == 1)
          {
            v13 = *(void **)(a1 + 32);
            v23 = v25;
            v24 = v26;
            objc_msgSend(v13, "_countAllocation:inRegion:", &v23, v3);
            if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "guessNonObjects"))
              *(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)) = *((_DWORD *)v3 + 37) + 1;
          }
          else if (VMUGraphNodeType_IsVMRegion(v11 >> 60) && (objc_msgSend(v3, "isMallocHeapRelated") & 1) == 0)
          {
            v14 = v3[22] + v3[23];
            v15 = v3[24];
            v16 = v14 - v15;
            if (v14 != v15)
            {
              v17 = v7;
              objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3[4]);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v18)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VM: %@"), v3[4]);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17[156], "classInfoWithClassName:binaryPath:type:", v19, &stru_1E4E04720, 0);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v18, v3[4]);

              }
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "modifySize:count:forClassInfo:", v16, 1, v18);

              v7 = v17;
            }
          }
        }
      }
LABEL_29:
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v20 = *(_QWORD *)(a1 + 48);
      v21 = *(_QWORD *)(v20 + 8);
      v5 = v20 + 8;
    }
    while (*(_DWORD *)(v21 + 24) < *(_DWORD *)(a1 + 64));
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "separateByZone")
    && *((_DWORD *)v3 + 37) < *(_DWORD *)(a1 + 68))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectAtIndexedSubscript:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "incrementVirtualSize:", v3[2]);

  }
}

void __41__VMUHeapAndVMAggregator_analyzeMemgraph__block_invoke_19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v5;
  uint64_t v7;
  int v8;
  void *v10;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  id v28;
  __int128 v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  if (!*(_QWORD *)(a5 + 24))
  {
    v5 = a4;
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_DWORD *)(v7 + 4 * a4);
    if (v8)
    {
      if (*(_DWORD *)(v7 + 4 * a3) == v8)
      {
        v32 = 0;
        v33 = 0;
        v31 = 0;
        v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
        if (v10
          && (objc_msgSend(v10, "nodeDetails:", a4),
              v12 = *(void **)(*(_QWORD *)(a1 + 32) + 16),
              v29 = 0uLL,
              v30 = 0,
              v12))
        {
          objc_msgSend(v12, "nodeDetails:", a3);
          v13 = v30;
          v14 = v13;
          if (v13)
          {
            if (!v33)
            {
              objc_msgSend(v13, "className");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "hasSuffix:", CFSTR("Storage)"));

              if ((v16 & 1) == 0)
              {
                v17 = *(_QWORD *)(a1 + 32);
                v18 = *(void **)(v17 + 48);
                if (!v18)
                {
LABEL_13:
                  v19 = v5;
                  v20 = *(id *)(v17 + 24);
                  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "separateByZone"))
                  {
                    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectAtIndexedSubscript:", (*(_DWORD *)(*(_QWORD *)(a1 + 40) + 4 * v19) - 1));
                    v21 = objc_claimAutoreleasedReturnValue();

                    v20 = (id)v21;
                  }
                  objc_msgSend(v20, "modifySize:count:forClassInfo:", -(v32 & 0xFFFFFFFFFFFFFFFLL), -1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
                  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sumObjectFields"))
                  {
                    objc_msgSend(v20, "modifySize:count:forClassInfo:", v32 & 0xFFFFFFFFFFFFFFFLL, 0, v14);
                  }
                  else
                  {
                    v22 = (void *)MEMORY[0x1A85A9758]();
                    objc_msgSend(*(id *)(a1 + 32), "_classDisplayName:", v14);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("[%llu]"), *(_QWORD *)(a5 + 8));
                    v24 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v14, "binaryPath");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUClassInfo, "classInfoWithClassName:binaryPath:type:", v24, v25, objc_msgSend(v14, "infoType"));
                    v26 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v20, "modifySize:count:forClassInfo:", v32 & 0xFFFFFFFFFFFFFFFLL, 1, v26);
                    objc_autoreleasePoolPop(v22);
                  }
                  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 4 * v19) = 0;

                  goto LABEL_18;
                }
                v27 = v29;
                v28 = v30;
                if (objc_msgSend(v18, "matchesNodeDetails:orNodeDescription:", &v27, 0))
                {
                  v17 = *(_QWORD *)(a1 + 32);
                  goto LABEL_13;
                }
              }
            }
          }
        }
        else
        {
          v14 = 0;
          v29 = 0uLL;
          v30 = 0;
        }
LABEL_18:

      }
    }
  }
}

- (void)enumerateHeapAndVMSortedBy:(unsigned int)a3 withBlock:(id)a4
{
  -[VMUMallocZoneAggregate enumerateHeapAndVMSortedBy:withBlock:](self->_allZonesAggregate, "enumerateHeapAndVMSortedBy:withBlock:", *(_QWORD *)&a3, a4);
}

- (void)enumerateBinaryCountDataSortedBy:(unsigned int)a3 withBlock:(id)a4
{
  -[VMUMallocZoneAggregate enumerateBinaryCountDataSortedBy:withBlock:](self->_allZonesAggregate, "enumerateBinaryCountDataSortedBy:withBlock:", *(_QWORD *)&a3, a4);
}

- (VMUMallocZoneAggregate)allZonesAggregate
{
  return self->_allZonesAggregate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classFilterPatternMatcher, 0);
  objc_storeStrong((id *)&self->_nonObjectInfo, 0);
  objc_storeStrong((id *)&self->_heapZoneAggregates, 0);
  objc_storeStrong((id *)&self->_allZonesAggregate, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_heapAndVMOptions, 0);
}

@end
