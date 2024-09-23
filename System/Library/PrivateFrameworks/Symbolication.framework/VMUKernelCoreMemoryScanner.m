@implementation VMUKernelCoreMemoryScanner

+ (void)initialize
{
  char *v2;
  int v3;
  BOOL v4;
  BOOL v6;

  if ((id)objc_opt_class() == a1)
  {
    v2 = getenv("VMUEnumeratorValidation");
    v6 = 0;
    if (v2)
    {
      v3 = *v2;
      v4 = (v3 - 48) > 0x3E || ((1 << (v3 - 48)) & 0x4000000040000001) == 0;
      if (v4 && v3 != 0)
        v6 = 1;
    }
    s_enumeratorDebugging_0 = v6;
  }
}

- (id)vmuTask
{
  return self->_task;
}

- (void)unmapAllRegions
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _VMURegionNode *regions;
  VMUTaskMemoryCache *v7;
  VMUTaskMemoryCache *v8;
  _VMURegionNode *v9;
  void (**v10)(void);
  _QWORD v11[4];
  VMUTaskMemoryCache *v12;
  _VMURegionNode *v13;
  _VMURegionNode *v14;

  if (self->_regionsCount)
  {
    v3 = 0;
    v4 = 0;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      regions = self->_regions;
      v7 = self->_memoryCache;
      v8 = v7;
      if (regions[v3].var7)
      {
        if (&regions[v3] == regions[v3].var8)
        {
          v11[0] = v5;
          v11[1] = 3221225472;
          v11[2] = ___unmapRegion_block_invoke_0;
          v11[3] = &unk_1E4E011E0;
          v12 = v7;
          v13 = &regions[v3];
          v14 = regions;
          v10 = (void (**)(void))MEMORY[0x1A85A995C](v11);
          v10[2]();

        }
        else
        {
          v9 = &regions[v3];
          v9->var6 = 0;
          v9->var7 = 0;
          v9->var8 = 0;
        }
      }

      ++v4;
      ++v3;
    }
    while (v4 < self->_regionsCount);
  }
  -[VMUTaskMemoryCache flushMemoryCache](self->_memoryCache, "flushMemoryCache");
  -[VMUObjectIdentifier flushRemoteMirrorMemoryCache](self->_objectIdentifier, "flushRemoteMirrorMemoryCache");
}

- (VMUKernelCoreMemoryScanner)initWithVMUTask:(id)a3 options:(unint64_t)a4
{
  VMUKernelCoreMemoryScanner *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  os_signpost_id_t v11;
  VMUKernelCoreMemoryScanner *v12;
  uint64_t v13;
  NSString *processDescriptionString;
  uint64_t v15;
  NSDate *suspendDate;
  uint64_t v17;
  NSString *processName;
  uint64_t v19;
  NSString *binaryImagesDescription;
  uint64_t v21;
  NSString *executablePath;
  uint64_t v23;
  NSDictionary *ledger;
  NSObject *v25;
  os_signpost_id_t v26;
  uint64_t v27;
  NSMutableDictionary *mappedFileNameToLengthDict;
  VMUVMRegionIdentifier *v29;
  VMUVMRegionIdentifier *regionIdentifier;
  unsigned int v31;
  _VMURegionNode *regions;
  uint64_t v33;
  unint64_t v34;
  id v35;
  unint64_t regionsCount;
  _VMURegionMap *v37;
  _DWORD *v38;
  uint64_t v39;
  _DWORD *v40;
  id *p_var0;
  unint64_t v42;
  unint64_t v43;
  unint64_t var6;
  unint64_t var7;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unsigned int *var3;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  uint64_t v58;
  VMUTaskMemoryCache *memoryCache;
  unint64_t v60;
  _VMURegionMap *regionMap;
  uint64_t v62;
  uint64_t v63;
  id regionInfoBlock;
  VMURangeArray *v65;
  VMURangeArray *dataSegmentsRangeArrayOutsideSharedCache;
  uint64_t v67;
  VMUTaskThreadStates *threadStates;
  void *v69;
  NSObject *v70;
  os_signpost_id_t v71;
  NSObject *v72;
  os_signpost_id_t v73;
  uint64_t v74;
  NSMutableArray *zoneNames;
  uint64_t v76;
  NSMutableSet *nonScannableZoneNames;
  void *v78;
  NSObject *v79;
  os_signpost_id_t v80;
  size_t zonesCount;
  _VMUZoneNode *zones;
  VMUObjectIdentifier *v83;
  VMUObjectIdentifier *objectIdentifier;
  VMUObjectIdentifier *v85;
  uint64_t v86;
  VMUClassInfoMap *classInfoIndexer;
  void *v88;
  NSObject *v89;
  os_signpost_id_t v90;
  NSObject *v91;
  os_signpost_id_t v92;
  VMUScanOverlay *v93;
  VMUScanOverlay *scanOverlay;
  void *v95;
  NSObject *v96;
  os_signpost_id_t v97;
  uint64_t v98;
  VMUNonOverlappingRangeArray *nonscannableGlobalSymbolsArray;
  uint64_t v100;
  uint64_t v101;
  uint64_t i;
  uint64_t Range;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  int v107;
  int v108;
  FILE *v109;
  int v110;
  FILE *v111;
  void *v112;
  unint64_t v113;
  NSObject *v114;
  id v115;
  void *v116;
  VMUKernelCoreMemoryScanner *v117;
  void *v118;
  unint64_t v120;
  id *p_task;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _QWORD __compar[4];
  VMUKernelCoreMemoryScanner *v131;
  _QWORD v132[6];
  uint8_t buf[8];
  uint8_t *v134;
  uint64_t v135;
  uint64_t (*v136)(uint64_t, uint64_t);
  void (*v137)(uint64_t);
  id v138;
  objc_super v139;
  uint8_t v140[16];
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v122 = a3;
  v139.receiver = self;
  v139.super_class = (Class)VMUKernelCoreMemoryScanner;
  v7 = -[VMUKernelCoreMemoryScanner init](&v139, sel_init);

  if (!v7)
  {
    v12 = 0;
LABEL_126:
    v118 = v122;
    v12 = v12;
    v117 = v12;
    goto LABEL_127;
  }
  +[VMUDebugTimer sharedTimerIfCreated](VMUDebugTimer, "sharedTimerIfCreated");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  p_task = (id *)&v7->_task;
  objc_storeStrong((id *)&v7->_task, a3);
  v7->_pid = -1;
  if (v124)
  {
    if (objc_msgSend(v124, "signpostID"))
    {
      objc_msgSend(v124, "logHandle");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v124, "signpostID");
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v8, OS_SIGNPOST_INTERVAL_END, v9, "initMemoryScanner", ", buf, 2u);
      }

    }
    objc_msgSend(v124, "endEvent:", "initMemoryScanner");
    objc_msgSend(v124, "startWithCategory:message:", "initMemoryScanner", "building VMUProcessDescription");
    objc_msgSend(v124, "logHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v124, "signpostID");
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "initMemoryScanner", "building VMUProcessDescription", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(0, "endEvent:", "initMemoryScanner");
    objc_msgSend(0, "startWithCategory:message:", "initMemoryScanner", "building VMUProcessDescription");
  }
  objc_msgSend(*p_task, "processDescription");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  if (v123)
  {
    objc_msgSend(v123, "description");
    v13 = objc_claimAutoreleasedReturnValue();
    processDescriptionString = v7->_processDescriptionString;
    v7->_processDescriptionString = (NSString *)v13;

    objc_msgSend(v123, "date");
    v15 = objc_claimAutoreleasedReturnValue();
    suspendDate = v7->_suspendDate;
    v7->_suspendDate = (NSDate *)v15;

    objc_msgSend(v123, "processName");
    v17 = objc_claimAutoreleasedReturnValue();
    processName = v7->_processName;
    v7->_processName = (NSString *)v17;

    if ((a4 & 0x8000) != 0)
    {
      objc_msgSend(v123, "binaryImagesDescription");
      v19 = objc_claimAutoreleasedReturnValue();
      binaryImagesDescription = v7->_binaryImagesDescription;
      v7->_binaryImagesDescription = (NSString *)v19;

    }
    objc_msgSend(v123, "executablePath");
    v21 = objc_claimAutoreleasedReturnValue();
    executablePath = v7->_executablePath;
    v7->_executablePath = (NSString *)v21;

    v7->_physicalFootprint = objc_msgSend(v123, "physicalFootprint");
    v7->_physicalFootprintPeak = objc_msgSend(v123, "physicalFootprintPeak");
    v7->_idleExitStatus = objc_msgSend(v123, "idleExitStatus");
  }
  +[VMUProcessLedger ledgerForVMUTask:](VMUProcessLedger, "ledgerForVMUTask:", v7->_task);
  v23 = objc_claimAutoreleasedReturnValue();
  ledger = v7->_ledger;
  v7->_ledger = (NSDictionary *)v23;

  if (v124 && objc_msgSend(v124, "signpostID"))
  {
    objc_msgSend(v124, "logHandle");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v124, "signpostID");
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v25, OS_SIGNPOST_INTERVAL_END, v26, "initMemoryScanner", ", buf, 2u);
    }

  }
  objc_msgSend(v124, "endEvent:", "initMemoryScanner");
  mach_get_times();
  v7->_maxInteriorOffset = *MEMORY[0x1E0C85AD8];
  v7->_scanningMask = VMUScanningMaskForOwningReferences();
  v7->_exactScanningEnabled = 1;
  v7->_abandonedMarkingEnabled = 1;
  v27 = objc_opt_new();
  mappedFileNameToLengthDict = v7->_mappedFileNameToLengthDict;
  v7->_mappedFileNameToLengthDict = (NSMutableDictionary *)v27;

  v120 = VMUGetFlagsForAllVMRegionStatistics() | a4 | 0x180;
  v29 = -[VMUVMRegionIdentifier initWithVMUTask:options:]([VMUVMRegionIdentifier alloc], "initWithVMUTask:options:", v7->_task);
  regionIdentifier = v7->_regionIdentifier;
  v7->_regionIdentifier = v29;

  -[VMUVMRegionIdentifier regions](v7->_regionIdentifier, "regions");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v125, "count");
  v7->_regionsCount = v31;
  if (!v31)
    goto LABEL_116;
  regions = (_VMURegionNode *)malloc_type_calloc(v31, 0x40uLL, 0x10B0040310C8A7FuLL);
  v7->_regions = regions;
  if (v7->_regionsCount)
  {
    v33 = 0;
    v34 = 0;
    do
    {
      v35 = (id)objc_msgSend(v125, "objectAtIndexedSubscript:", v34);
      regions = v7->_regions;
      regions[v33].var0 = v35;
      ++v34;
      regionsCount = v7->_regionsCount;
      ++v33;
    }
    while (v34 < regionsCount);
  }
  else
  {
    LODWORD(regionsCount) = 0;
  }
  v37 = (_VMURegionMap *)malloc_type_calloc(1uLL, 0x200040uLL, 0x30B8EA24uLL);
  v37->var6 = -1;
  v38 = malloc_type_calloc(1uLL, 0x800004uLL, 0xFF42C4F3uLL);
  *v38 = 0x4000000;
  v37->var3 = v38;
  v37->var4 = regions;
  v37->var5 = regionsCount;
  if ((_DWORD)regionsCount)
  {
    v39 = 0;
    v40 = (_DWORD *)MEMORY[0x1E0C85AC8];
    do
    {
      p_var0 = &regions[v39].var0;
      if ((objc_msgSend(*p_var0, "isSpecialPhysFootprintRegion") & 1) == 0)
      {
        v42 = *((_QWORD *)*p_var0 + 1);
        v43 = *((_QWORD *)*p_var0 + 2) + v42;
        var6 = v37->var6;
        var7 = v37->var7;
        if (var6 >= v42)
          var6 = *((_QWORD *)*p_var0 + 1);
        if (var7 <= v43)
          var7 = *((_QWORD *)*p_var0 + 2) + *((_QWORD *)*p_var0 + 1);
        v37->var6 = var6;
        v37->var7 = var7;
        v46 = v42 >> *v40;
        if (v46)
        {
          v47 = (~*MEMORY[0x1E0C85AC0] & (*MEMORY[0x1E0C85AC0] + v43)) >> *v40;
          do
          {
            if (v46 + 1 > v47)
              v48 = v46 + 1;
            else
              v48 = v47;
            var3 = (unsigned int *)v37->var3;
            v50 = v46 & 0x3FFFFFF;
            v51 = *var3;
            if (*var3 > (v46 & 0x3FFFFFF))
            {
              v52 = ((v48 - v46) & 0x3FFFFFF) + v50;
              if (v51 < v52)
                v52 = *var3;
              v53 = (v50 + 7) & 0x7FFFFF8;
              if (v53 >= v52)
                v53 = v52;
              if (v50 < v53)
              {
                do
                {
                  if (v51 > v50)
                    *((_BYTE *)var3 + (v50 >> 3) + 4) |= 1 << (v50 & 7);
                  ++v50;
                }
                while (v53 != v50);
                v50 = v53;
              }
              v54 = v52 & 0x7FFFFF8;
              if ((v52 & 0x7FFFFF8) <= v50)
                v54 = v50;
              if (v52 > v54)
              {
                v55 = v52 - 1;
                do
                {
                  if (v51 > v55)
                    *((_BYTE *)var3 + (v55 >> 3) + 4) |= 1 << (v55 & 7);
                  v56 = v55 - 1;
                }
                while (v55-- > v54);
                v52 = v56 + 1;
              }
              memset((char *)var3 + (v50 >> 3) + 4, 255, (v52 - v50) >> 3);
            }
            v46 >>= 26;
            v47 = v48 >> 26;
          }
          while (v46);
        }
      }
      ++v39;
    }
    while (v39 != regionsCount);
  }
  v7->_regionMap = v37;
  -[VMUTask memoryCache](v7->_task, "memoryCache");
  v58 = objc_claimAutoreleasedReturnValue();
  memoryCache = v7->_memoryCache;
  v7->_memoryCache = (VMUTaskMemoryCache *)v58;

  if (!v7->_memoryCache)
  {
LABEL_116:

    v12 = 0;
    v110 = 1;
    goto LABEL_124;
  }
  v7->_coreSymbolicator._opaque_1 = -[VMUTask createSymbolicatorWithFlags:andNotification:](v7->_task, "createSymbolicatorWithFlags:andNotification:", CSSymbolicatorGetFlagsForNListOnlyData(), 0);
  v7->_coreSymbolicator._opaque_2 = v60;
  regionMap = v7->_regionMap;
  *(_QWORD *)buf = 0;
  v134 = buf;
  v135 = 0x3032000000;
  v136 = __Block_byref_object_copy__0;
  v137 = __Block_byref_object_dispose__0;
  v138 = 0;
  v62 = MEMORY[0x1E0C809B0];
  v132[0] = MEMORY[0x1E0C809B0];
  v132[1] = 3221225472;
  v132[2] = __54__VMUKernelCoreMemoryScanner_initWithVMUTask_options___block_invoke;
  v132[3] = &unk_1E4E00858;
  v132[4] = buf;
  v132[5] = regionMap;
  v63 = MEMORY[0x1A85A995C](v132);
  regionInfoBlock = v7->_regionInfoBlock;
  v7->_regionInfoBlock = (id)v63;

  -[VMUTaskMemoryCache setRegionInfoBlock:](v7->_memoryCache, "setRegionInfoBlock:", v7->_regionInfoBlock);
  v65 = objc_alloc_init(VMURangeArray);
  dataSegmentsRangeArrayOutsideSharedCache = v7->_dataSegmentsRangeArrayOutsideSharedCache;
  v7->_dataSegmentsRangeArrayOutsideSharedCache = v65;

  -[VMUVMRegionIdentifier taskThreadStates](v7->_regionIdentifier, "taskThreadStates");
  v67 = objc_claimAutoreleasedReturnValue();
  threadStates = v7->_threadStates;
  v7->_threadStates = (VMUTaskThreadStates *)v67;

  v69 = v124;
  v7->_threadsCount = -[VMUTaskThreadStates threadCount](v7->_threadStates, "threadCount");
  if (v124 && objc_msgSend(v124, "signpostID"))
  {
    objc_msgSend(v124, "logHandle");
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v124, "signpostID");
    if (v71 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
    {
      *(_WORD *)v140 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v70, OS_SIGNPOST_INTERVAL_END, v71, "initMemoryScanner", ", v140, 2u);
    }

    v69 = v124;
  }
  objc_msgSend(v69, "endEvent:", "initMemoryScanner");
  objc_msgSend(v69, "startWithCategory:message:", "initMemoryScanner", "get malloc zones array");
  if (v69)
  {
    objc_msgSend(v69, "logHandle");
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v69, "signpostID");
    if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
    {
      *(_WORD *)v140 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v72, OS_SIGNPOST_INTERVAL_BEGIN, v73, "initMemoryScanner", "get malloc zones array", v140, 2u);
    }

  }
  v74 = objc_opt_new();
  zoneNames = v7->_zoneNames;
  v7->_zoneNames = (NSMutableArray *)v74;

  v76 = objc_opt_new();
  nonScannableZoneNames = v7->_nonScannableZoneNames;
  v7->_nonScannableZoneNames = (NSMutableSet *)v76;

  -[VMUKernelCoreMemoryScanner _enumerateZallocZones:blocks:](v7, "_enumerateZallocZones:blocks:", 1, 0);
  v78 = v124;
  if (v124 && objc_msgSend(v124, "signpostID"))
  {
    objc_msgSend(v124, "logHandle");
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v124, "signpostID");
    if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
    {
      *(_WORD *)v140 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v79, OS_SIGNPOST_INTERVAL_END, v80, "initMemoryScanner", ", v140, 2u);
    }

    v78 = v124;
  }
  objc_msgSend(v78, "endEvent:", "initMemoryScanner");
  zonesCount = v7->_zonesCount;
  if ((_DWORD)zonesCount && v7->_regions)
  {
    zones = v7->_zones;
    __compar[0] = v62;
    __compar[1] = 3221225472;
    __compar[2] = __54__VMUKernelCoreMemoryScanner_initWithVMUTask_options___block_invoke_2;
    __compar[3] = &unk_1E4E008C8;
    v131 = (VMUKernelCoreMemoryScanner *)&__block_literal_global_0;
    mergesort_b(zones, zonesCount, 0x18uLL, __compar);
    -[NSMutableArray sortUsingComparator:](v7->_zoneNames, "sortUsingComparator:", &__block_literal_global_0);
    v83 = -[VMUObjectIdentifier initWithVMUTask:symbolicator:scanner:]([VMUObjectIdentifier alloc], "initWithVMUTask:symbolicator:scanner:", v7->_task, 0, 0, v7);
    objectIdentifier = v7->_objectIdentifier;
    v7->_objectIdentifier = v83;

    v85 = v7->_objectIdentifier;
    if (v85)
    {
      -[VMUObjectIdentifier realizedClasses](v85, "realizedClasses");
      v86 = objc_claimAutoreleasedReturnValue();
      classInfoIndexer = v7->_classInfoIndexer;
      v7->_classInfoIndexer = (VMUClassInfoMap *)v86;

      v88 = v124;
      if (v124 && objc_msgSend(v124, "signpostID"))
      {
        objc_msgSend(v124, "logHandle");
        v89 = objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v124, "signpostID");
        if (v90 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
        {
          *(_WORD *)v140 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v89, OS_SIGNPOST_INTERVAL_END, v90, "initMemoryScanner", ", v140, 2u);
        }

        v88 = v124;
      }
      objc_msgSend(v88, "endEvent:", "initMemoryScanner");
      objc_msgSend(v88, "startWithCategory:message:", "initMemoryScanner", "setting up VMUScanOverlay");
      if (v88)
      {
        objc_msgSend(v88, "logHandle");
        v91 = objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v88, "signpostID");
        if (v92 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
        {
          *(_WORD *)v140 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v91, OS_SIGNPOST_INTERVAL_BEGIN, v92, "initMemoryScanner", "setting up VMUScanOverlay", v140, 2u);
        }

      }
      v93 = -[VMUScanOverlay initWithScanner:]([VMUScanOverlay alloc], "initWithScanner:", v7);
      scanOverlay = v7->_scanOverlay;
      v7->_scanOverlay = v93;

      -[VMUKernelCoreMemoryScanner refineTypesWithOverlay:](v7, "refineTypesWithOverlay:", v7->_scanOverlay);
      v95 = v124;
      if (v124 && objc_msgSend(v124, "signpostID"))
      {
        objc_msgSend(v124, "logHandle");
        v96 = objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v124, "signpostID");
        if (v97 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
        {
          *(_WORD *)v140 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v96, OS_SIGNPOST_INTERVAL_END, v97, "initMemoryScanner", ", v140, 2u);
        }

        v95 = v124;
      }
      objc_msgSend(v95, "endEvent:", "initMemoryScanner");
      v98 = objc_opt_new();
      nonscannableGlobalSymbolsArray = v7->_nonscannableGlobalSymbolsArray;
      v7->_nonscannableGlobalSymbolsArray = (VMUNonOverlappingRangeArray *)v98;

      CSSymbolicatorGetAOutSymbolOwner();
      v128 = 0u;
      v129 = 0u;
      v126 = 0u;
      v127 = 0u;
      v100 = objc_msgSend(&unk_1E4E20688, "countByEnumeratingWithState:objects:count:", &v126, v141, 16);
      if (v100)
      {
        v101 = *(_QWORD *)v127;
        do
        {
          for (i = 0; i != v100; ++i)
          {
            if (*(_QWORD *)v127 != v101)
              objc_enumerationMutation(&unk_1E4E20688);
            objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v126 + 1) + 8 * i)), "UTF8String");
            CSSymbolOwnerGetSymbolWithMangledName();
            Range = CSSymbolGetRange();
            if (v104)
              -[VMURangeArray addRange:](v7->_nonscannableGlobalSymbolsArray, "addRange:", Range, v104);
          }
          v100 = objc_msgSend(&unk_1E4E20688, "countByEnumeratingWithState:objects:count:", &v126, v141, 16);
        }
        while (v100);
      }
      v7->_regionDescriptionOptions = v120;
      v105 = *MEMORY[0x1E0C85AD8];
      -[VMUTask memoryCache](v7->_task, "memoryCache");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v105) = v105 == objc_msgSend(v106, "pageSize");

      if ((v105 & 1) != 0)
      {
        MEMORY[0x1A85A87D4]();
        v107 = CSArchitectureIs64Bit();
        CSSymbolicatorGetArchitecture();
        v108 = CSArchitectureIs64Bit();
        v109 = (FILE *)*MEMORY[0x1E0C80C10];
        if (v107 == v108)
        {
          fwrite("warning: kernel core support is highly experimental\n", 0x34uLL, 1uLL, v109);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v140 = 0;
            _os_log_impl(&dword_1A4D79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "warning: kernel core support is highly experimental", v140, 2u);
          }
          v110 = 0;
          goto LABEL_122;
        }
        v110 = 1;
        fwrite("error: core's pointer size doesn't match the host system, cannot continue\n", 0x4AuLL, 1uLL, v109);
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
LABEL_122:
          v12 = v7;
          v7 = v131;
          goto LABEL_123;
        }
        -[VMUKernelCoreMemoryScanner initWithVMUTask:options:].cold.1();
      }
      else
      {
        v111 = (FILE *)*MEMORY[0x1E0C80C10];
        objc_msgSend(*p_task, "memoryCache");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = objc_msgSend(v112, "pageSize");
        fprintf(v111, "error: core's page size doesn't match the host system (%u KB vs %u KB), cannot continue\n", v113 >> 10, *MEMORY[0x1E0C85AD8] >> 10);

        v114 = MEMORY[0x1E0C81028];
        v115 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*p_task, "memoryCache");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          -[VMUKernelCoreMemoryScanner initWithVMUTask:options:].cold.2(objc_msgSend(v116, "pageSize"), v140, v116);
        }

      }
    }
    else
    {

      v7 = 0;
    }
    v110 = 1;
    goto LABEL_122;
  }
  v12 = 0;
  v110 = 1;
LABEL_123:

  _Block_object_dispose(buf, 8);
LABEL_124:

  if (!v110)
    goto LABEL_126;
  v117 = 0;
  v118 = v122;
LABEL_127:

  return v117;
}

uint64_t __54__VMUKernelCoreMemoryScanner_initWithVMUTask_options___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  _DWORD *v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  id *v12;
  unint64_t v13;
  id *v14;
  BOOL v15;
  id *v16;
  unint64_t v17;
  unint64_t v18;
  id *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = v4 + 4 * ((a2 >> *MEMORY[0x1E0C85AC8]) & 0x7FFFF);
  v8 = *(_DWORD *)(v5 + 64);
  v7 = (_DWORD *)(v5 + 64);
  v6 = v8;
  v9 = *(_QWORD *)(v4 + 32);
  if (v8)
  {
    v10 = *(_QWORD **)(v9 + ((unint64_t)(v6 - 1) << 6));
    if (a2 - v10[1] < v10[2])
      goto LABEL_25;
  }
  v11 = *(unsigned int *)(v4 + 40);
  if (!(_DWORD)v11)
  {
LABEL_9:
    v14 = 0;
    goto LABEL_12;
  }
  v12 = *(id **)(v4 + 32);
  while (1)
  {
    v13 = v11 >> 1;
    v14 = &v12[8 * (v11 >> 1)];
    if (*((_QWORD *)*v14 + 1) <= a2)
      break;
LABEL_8:
    v15 = v11 > 1;
    v11 = v13;
    if (!v15)
      goto LABEL_9;
  }
  if (*((_QWORD *)*v14 + 2) + *((_QWORD *)*v14 + 1) <= a2)
  {
    v12 = v14 + 8;
    v13 = --v11 >> 1;
    goto LABEL_8;
  }
  if (objc_msgSend(*v14, "isSpecialPhysFootprintRegion"))
    v14 = 0;
LABEL_12:
  if ((*((_BYTE *)*v14 + 132) & 1) != 0)
  {
    v16 = v14 + 8;
    v17 = *(unsigned int *)(v4 + 40) - (((uint64_t)v14 - *(_QWORD *)(v4 + 32) + 64) >> 6);
    if (v17)
    {
      while (1)
      {
        v18 = v17 >> 1;
        v19 = &v16[8 * (v17 >> 1)];
        if (*((_QWORD *)*v19 + 1) <= a2)
        {
          if (*((_QWORD *)*v19 + 2) + *((_QWORD *)*v19 + 1) > a2)
          {
            if (objc_msgSend(*v19, "isSpecialPhysFootprintRegion"))
              v17 = 0;
            else
              v17 = (unint64_t)v19;
            break;
          }
          v16 = v19 + 8;
          v18 = --v17 >> 1;
        }
        v15 = v17 > 1;
        v17 = v18;
        if (!v15)
        {
          v17 = 0;
          break;
        }
      }
    }
    if (v17)
      v14 = (id *)v17;
  }
  *v7 = (((unint64_t)v14 - v9) >> 6) + 1;
  v10 = *v14;
LABEL_25:
  objc_msgSend(v10, "descriptionWithOptions:maximumLength:", 513, 0);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

  return objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)), "UTF8String");
}

uint64_t __54__VMUKernelCoreMemoryScanner_initWithVMUTask_options___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("zalloc (no zone)")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v5, "rangeOfString:", CFSTR("zalloc (no zone)")) == 0x7FFFFFFFFFFFFFFFLL)
      v6 = objc_msgSend(v4, "compare:", v5);
    else
      v6 = 1;
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

uint64_t __54__VMUKernelCoreMemoryScanner_initWithVMUTask_options___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  _VMUBlockNode *blocks;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _VMURegionNode *regions;
  VMUTaskMemoryCache *v8;
  VMUTaskMemoryCache *v9;
  _VMURegionNode *v10;
  void (**v11)(void);
  unsigned int *var1;
  _VMURegionNode *v13;
  _VMUZoneNode *zones;
  _VMUInstanceValues *instanceValues;
  _VMURegionMap *regionMap;
  void *var3;
  void *userMarkedAbandoned;
  objc_super v19;
  _QWORD v20[4];
  VMUTaskMemoryCache *v21;
  _VMURegionNode *v22;
  _VMURegionNode *v23;

  blocks = self->_blocks;
  if (blocks && !self->_processObjectGraph)
  {
    free(blocks);
    self->_blocks = 0;
  }
  CSRelease();
  -[VMUTaskMemoryCache setRegionInfoBlock:](self->_memoryCache, "setRegionInfoBlock:", 0);
  if (self->_regionsCount)
  {
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      regions = self->_regions;
      v8 = self->_memoryCache;
      v9 = v8;
      if (regions[v4].var7)
      {
        if (&regions[v4] == regions[v4].var8)
        {
          v20[0] = v6;
          v20[1] = 3221225472;
          v20[2] = ___unmapRegion_block_invoke_0;
          v20[3] = &unk_1E4E011E0;
          v21 = v8;
          v22 = &regions[v4];
          v23 = regions;
          v11 = (void (**)(void))MEMORY[0x1A85A995C](v20);
          v11[2]();

        }
        else
        {
          v10 = &regions[v4];
          v10->var6 = 0;
          v10->var7 = 0;
          v10->var8 = 0;
        }
      }

      var1 = self->_regions[v4].var1;
      if (var1)
      {
        free(var1);
        self->_regions[v4].var1 = 0;
      }
      ++v5;
      ++v4;
    }
    while (v5 < self->_regionsCount);
  }
  v13 = self->_regions;
  if (v13)
  {
    free(v13);
    self->_regions = 0;
  }
  zones = self->_zones;
  if (zones)
  {
    free(zones);
    self->_zones = 0;
  }
  instanceValues = self->_instanceValues;
  if (instanceValues)
    free(instanceValues);
  self->_instanceValues = 0;
  regionMap = self->_regionMap;
  if (regionMap)
  {
    var3 = regionMap->var3;
    if (var3)
      free(var3);
    free(regionMap);
  }
  userMarkedAbandoned = self->_userMarkedAbandoned;
  if (userMarkedAbandoned)
  {
    free(userMarkedAbandoned);
    self->_userMarkedAbandoned = 0;
  }
  -[VMUKernelCoreMemoryScanner _destroyLinearClassInfos](self, "_destroyLinearClassInfos");
  v19.receiver = self;
  v19.super_class = (Class)VMUKernelCoreMemoryScanner;
  -[VMUKernelCoreMemoryScanner dealloc](&v19, sel_dealloc);
}

- (void)_withMemoryReaderBlock:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__VMUKernelCoreMemoryScanner__withMemoryReaderBlock___block_invoke;
  v5[3] = &unk_1E4E00958;
  v5[4] = self;
  v6 = 0;
  v3 = (void (**)(id, void *))a3;
  v4 = (void *)MEMORY[0x1A85A995C](v5);
  v3[2](v3, v4);

}

uint64_t __53__VMUKernelCoreMemoryScanner__withMemoryReaderBlock___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  _DWORD *v12;
  unint64_t v13;
  unsigned int *v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  _DWORD *v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  int v44;
  id v45;
  id v46;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  BOOL v51;
  int v52;
  unint64_t v53;
  id *v54;
  unint64_t v55;
  unint64_t v56;
  id *v57;
  BOOL v58;
  int v59;
  int v60;
  _BOOL4 v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  id v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  NSObject *v74;
  _QWORD *v75;
  void (**v76)(_QWORD);
  void *v77;
  int v78;
  void *v79;
  id v80;
  FILE *v81;
  FILE *v82;
  uint64_t v83;
  _QWORD v84[4];
  id v85;
  uint64_t v86;
  unint64_t v87;
  _QWORD v88[2];

  result = 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
  v7 = *(_QWORD *)(v5 + 48);
  v6 = *(_QWORD *)(v5 + 56);
  v8 = v6 - v7;
  v9 = v6 < v7;
  if (a2 - v7 >= v8 || v9)
    return result;
  v12 = (_DWORD *)MEMORY[0x1E0C85AC8];
  v13 = a2 >> *MEMORY[0x1E0C85AC8];
  if (v13)
  {
    v14 = *(unsigned int **)(v5 + 24);
    v15 = a2 >> *MEMORY[0x1E0C85AC8];
    do
    {
      if (*v14 <= (v15 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)v14 + ((v15 & 0x3FFFFFF) >> 3) + 4) >> (v15 & 7)) & 1) == 0)
      {
        return 0;
      }
      v15 >>= 26;
    }
    while (v15);
  }
  v16 = v5 + 4 * (v13 & 0x7FFFF);
  v19 = *(_DWORD *)(v16 + 64);
  v18 = (_DWORD *)(v16 + 64);
  v17 = v19;
  v20 = *(_QWORD *)(v5 + 32);
  if (v19)
  {
    v21 = v20 + ((unint64_t)(v17 - 1) << 6);
    if (a2 - *(_QWORD *)(*(_QWORD *)v21 + 8) < *(_QWORD *)(*(_QWORD *)v21 + 16))
      goto LABEL_10;
  }
  v48 = *(unsigned int *)(v5 + 40);
  if (!(_DWORD)v48)
    return 0;
  v49 = *(_QWORD *)(v5 + 32);
  while (1)
  {
    v50 = v48 >> 1;
    v21 = v49 + (v48 >> 1 << 6);
    if (*(_QWORD *)(*(_QWORD *)v21 + 8) <= a2)
      break;
LABEL_30:
    v51 = v48 >= 2;
    v48 = v50;
    if (!v51)
      return 0;
  }
  if (*(_QWORD *)(*(_QWORD *)v21 + 16) + *(_QWORD *)(*(_QWORD *)v21 + 8) <= a2)
  {
    v49 = v21 + 64;
    v50 = --v48 >> 1;
    goto LABEL_30;
  }
  v52 = objc_msgSend(*(id *)v21, "isSpecialPhysFootprintRegion");
  result = 0;
  if (v52)
    v53 = 0;
  else
    v53 = v21;
  if ((v52 & 1) == 0)
  {
    if ((*(_BYTE *)(*(_QWORD *)v53 + 132) & 1) == 0)
      goto LABEL_78;
    v54 = (id *)(v53 + 64);
    v55 = *(unsigned int *)(v5 + 40) - ((uint64_t)(v53 + 64 - *(_QWORD *)(v5 + 32)) >> 6);
    if (!v55)
      goto LABEL_75;
    while (1)
    {
      v56 = v55 >> 1;
      v57 = &v54[8 * (v55 >> 1)];
      if (*((_QWORD *)*v57 + 1) <= a2)
      {
        if (*((_QWORD *)*v57 + 2) + *((_QWORD *)*v57 + 1) > a2)
        {
          if (objc_msgSend(*v57, "isSpecialPhysFootprintRegion"))
            v55 = 0;
          else
            v55 = (unint64_t)v57;
LABEL_75:
          if (v55)
            v53 = v55;
          v21 = v53;
LABEL_78:
          *v18 = ((v53 - v20) >> 6) + 1;
LABEL_10:
          v22 = a3 + a2;
          if (*(_QWORD *)(*(_QWORD *)v21 + 16) + *(_QWORD *)(*(_QWORD *)v21 + 8) < a3 + a2
            && *(_QWORD *)(v21 + 40) + *(_QWORD *)(*(_QWORD *)v21 + 8) < v22)
          {
            LODWORD(v23) = 1;
            do
            {
              v24 = (_QWORD *)(*(_QWORD *)(v21 + ((unint64_t)v23 << 6)) + 8);
              v23 = (v23 + 1);
            }
            while (v24[1] + *v24 < v22);
            v25 = *(_QWORD *)(a1 + 32);
            v26 = *(void **)(a1 + 40);
            v27 = *(void **)(v25 + 72);
            v28 = *(id *)(v25 + 8);
            v80 = v27;
            v81 = v26;
            v29 = 0;
            if ((_DWORD)v23)
            {
              v30 = v23;
              v31 = (uint64_t *)v21;
              do
              {
                v32 = *v31;
                v31 += 8;
                v29 += *(_QWORD *)(v32 + 16);
                --v30;
              }
              while (v30);
            }
            v88[0] = 0;
            v83 = 0;
            v33 = (_QWORD *)objc_msgSend(v80, "findMappedAddress:size:", *(_QWORD *)(*(_QWORD *)v21 + 8), v29);
            if (v33)
            {
              v34 = v33[1];
              v35 = *(_QWORD *)(*(_QWORD *)v21 + 8) - *v33;
              v88[0] = v33[2] + v35;
              v83 = v34 - v35;
              goto LABEL_19;
            }
            v79 = v28;
            if ((_DWORD)v23)
            {
              v72 = 0;
              do
              {
                v73 = v80;
                v74 = v81;
                if (*(_QWORD *)(v21 + v72 + 48))
                {
                  if (v21 + v72 == *(_QWORD *)(v21 + v72 + 56))
                  {
                    v84[0] = MEMORY[0x1E0C809B0];
                    v84[1] = 3221225472;
                    v84[2] = ___unmapRegion_block_invoke_0;
                    v84[3] = &unk_1E4E011E0;
                    v85 = v73;
                    v86 = v21 + v72;
                    v87 = v21;
                    v76 = (void (**)(_QWORD))MEMORY[0x1A85A995C](v84);
                    v77 = v76;
                    if (v81)
                      dispatch_async(v74, v76);
                    else
                      v76[2](v76);

                  }
                  else
                  {
                    v75 = (_QWORD *)(v21 + v72);
                    v75[5] = 0;
                    v75[6] = 0;
                    v75[7] = 0;
                  }
                }

                v72 += 64;
              }
              while ((unint64_t)v23 << 6 != v72);
            }
            v78 = objc_msgSend(v80, "mapAddress:size:returnedAddress:returnedSize:", *(_QWORD *)(*(_QWORD *)v21 + 8), v29, v88, &v83);
            v12 = (_DWORD *)MEMORY[0x1E0C85AC8];
            v28 = v79;
            if (v78)
            {
              if (task_exists(v79))
                fprintf((FILE *)*MEMORY[0x1E0C80C10], "Failed to map remote region at [%#llx-%#llx]\n", *(_QWORD *)(*(_QWORD *)v21 + 8), *(_QWORD *)(*(_QWORD *)v21 + 8) + v29);
            }
            else
            {
LABEL_19:
              if ((_DWORD)v23)
              {
                v36 = 0;
                v37 = v83;
                do
                {
                  v38 = (_QWORD *)(v21 + v36);
                  v38[7] = v21;
                  v38[5] = v37;
                  v39 = v88[0];
                  v38[6] = v88[0];
                  v40 = *(_QWORD *)(v21 + v36) + 8;
                  v88[0] = *(_QWORD *)(*(_QWORD *)(v21 + v36) + 16) + v39;
                  v37 = v83 - *(_QWORD *)(v40 + 8);
                  v83 = v37;
                  v36 += 64;
                }
                while ((unint64_t)v23 << 6 != v36);
              }
            }

          }
          v41 = *(_QWORD *)(a1 + 32);
          v42 = *(void **)(v41 + 72);
          v43 = *(_QWORD *)(v41 + 112);
          v44 = *(_DWORD *)(v41 + 120);
          v45 = *(id *)(v41 + 8);
          v46 = v42;
          v47 = v46;
          if (*(_QWORD *)(v21 + 48))
          {
LABEL_24:

            return *(_QWORD *)(v21 + 48) + a2 - *(_QWORD *)(*(_QWORD *)v21 + 8);
          }
          if ((*(_BYTE *)(*(_QWORD *)v21 + 132) & 2) == 0)
            objc_msgSend(v46, "taskIsTranslated");
          v84[0] = 0;
          v88[0] = 0;
          v59 = objc_msgSend(v47, "mapAddress:size:returnedAddress:returnedSize:", *(_QWORD *)(*(_QWORD *)v21 + 8), *(_QWORD *)(*(_QWORD *)v21 + 16), v84, v88);
          if (!v59)
          {
            v71 = v84[0];
            *(_QWORD *)(v21 + 40) = v88[0];
            *(_QWORD *)(v21 + 48) = v71;
            *(_QWORD *)(v21 + 56) = v21;
            goto LABEL_24;
          }
          if ((*(_DWORD *)(*(_QWORD *)v21 + 52) & 3u) - 1 >= 2)
          {
            v60 = v59;
            v61 = task_exists(v45);
            if (v21 != v43 + ((unint64_t)(v44 - 1) << 6) && v61)
            {
              v82 = (FILE *)*MEMORY[0x1E0C80C10];
              v62 = objc_msgSend(*(id *)v21, "address");
              v63 = *(unsigned int *)(*(_QWORD *)v21 + 24);
              v64 = vm_prot_strings_0[v63];
              v65 = *(_QWORD *)(*(_QWORD *)v21 + 16) + *(_QWORD *)(*(_QWORD *)v21 + 8);
              VMURegionTypeDescriptionForTagShareProtAndPager(*(unsigned __int8 *)(*(_QWORD *)v21 + 104), *(unsigned __int8 *)(*(_QWORD *)v21 + 50), v63, *(unsigned __int8 *)(*(_QWORD *)v21 + 49));
              v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v67 = (const char *)objc_msgSend(v66, "UTF8String");
              v68 = *(_QWORD *)(*(_QWORD *)v21 + 16) >> *v12;
              v69 = "pages";
              if (v68 == 1)
                v69 = "page";
              if (*(_QWORD *)(v21 + 24) == *(_QWORD *)(v21 + 32))
                v70 = "";
              else
                v70 = " [root]";
              fprintf(v82, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v62, v65, v64, v67, v68, v69, v70, v60);

            }
          }

          return 0;
        }
        v54 = v57 + 8;
        v56 = --v55 >> 1;
      }
      v58 = v55 > 1;
      v55 = v56;
      if (!v58)
      {
        v55 = 0;
        goto LABEL_75;
      }
    }
  }
  return result;
}

- (void)_callRemoteMallocEnumerators:(unsigned int)a3 block:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  unsigned int v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke;
  v8[3] = &unk_1E4E010A0;
  v8[4] = self;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[VMUKernelCoreMemoryScanner _withMemoryReaderBlock:](self, "_withMemoryReaderBlock:", v8);

}

void __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;
  int v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke_2;
  v5[3] = &unk_1E4E01078;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(_DWORD *)(a1 + 48);
  _withPeekTransformerFunctionForMemoryReader(a2, v5);

}

void __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  int v10;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 232))
  {
    v5 = 0;
    v6 = 0;
    do
    {
      if (*(_QWORD *)(*(_QWORD *)(v2 + 224) + v5 + 16))
      {
        get_local_zone_count();
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke_3;
        v8[3] = &unk_1E4E00988;
        v9 = *(id *)(a1 + 40);
        v10 = v6;
        v7 = (void *)MEMORY[0x1A85A995C](v8);
        (**(void (***)(uint64_t, void *, _QWORD, _QWORD, uint64_t, uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) + v5 + 16))(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "taskPort"), v7, *(unsigned int *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) + v5), a2, _pointerRecorderBlockContextAdapter_0);
        unregister_new_local_zones();

        v2 = *(_QWORD *)(a1 + 32);
      }
      ++v6;
      v5 += 24;
    }
    while (v6 < *(unsigned int *)(v2 + 232));
  }
}

uint64_t __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), a2, a3, a4);
}

- (void)_destroyLinearClassInfos
{
  _VMUScanLocationCache **scanCaches;
  unint64_t classInfosCount;
  unint64_t i;
  _VMUScanLocationCache *v6;
  void *applySwiftMaskingToIsa;

  +[VMUClassInfoMap _destroyRetainedLinearArray:withCount:](VMUClassInfoMap, "_destroyRetainedLinearArray:withCount:", self->_classInfos, self->_classInfosCount);
  scanCaches = self->_scanCaches;
  if (scanCaches)
  {
    classInfosCount = self->_classInfosCount;
    if ((_DWORD)classInfosCount)
    {
      for (i = 0; i < classInfosCount; ++i)
      {
        v6 = self->_scanCaches[i];
        if (v6)
        {
          free(v6);
          classInfosCount = self->_classInfosCount;
        }
      }
      scanCaches = self->_scanCaches;
    }
    free(scanCaches);
    self->_scanCaches = 0;
  }
  applySwiftMaskingToIsa = self->_applySwiftMaskingToIsa;
  if (applySwiftMaskingToIsa)
  {
    free(applySwiftMaskingToIsa);
    self->_applySwiftMaskingToIsa = 0;
  }
}

- (unsigned)_indexForClassInfo:(id)a3
{
  return -[VMUClassInfoMap indexForClassInfo:](self->_classInfoIndexer, "indexForClassInfo:", a3);
}

- (id)_cachedVariantForGenericInfo:(id)a3 variantKey:(unint64_t)a4
{
  uint64_t v6;
  NSMutableDictionary *variantCachesByIsaIndex;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = -[VMUClassInfoMap indexForClassInfo:](self->_classInfoIndexer, "indexForClassInfo:", a3);
  variantCachesByIsaIndex = self->_variantCachesByIsaIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](variantCachesByIsaIndex, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_registerVariant:(id)a3 forGenericInfo:(id)a4 variantKey:(unint64_t)a5
{
  VMUClassInfoMap *classInfoIndexer;
  id v9;
  uint64_t v10;
  NSMutableDictionary *variantCachesByIsaIndex;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  id v16;

  classInfoIndexer = self->_classInfoIndexer;
  v9 = a3;
  v10 = -[VMUClassInfoMap indexForClassInfo:](classInfoIndexer, "indexForClassInfo:", a4);
  variantCachesByIsaIndex = self->_variantCachesByIsaIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](variantCachesByIsaIndex, "objectForKeyedSubscript:", v12);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v16 = (id)objc_opt_new();
    v13 = self->_variantCachesByIsaIndex;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v16, v14);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, v15);

}

- (void)_updateLinearClassInfos
{
  unsigned int classInfosCount;
  _DWORD *v4;

  -[VMUKernelCoreMemoryScanner _destroyLinearClassInfos](self, "_destroyLinearClassInfos");
  self->_classInfos = -[VMUClassInfoMap _retainedLinearArrayWithReturnedCount:](self->_classInfoIndexer, "_retainedLinearArrayWithReturnedCount:", &self->_classInfosCount);
  self->_scanCaches = (_VMUScanLocationCache **)malloc_type_calloc(self->_classInfosCount, 8uLL, 0x2004093837F09uLL);
  classInfosCount = self->_classInfosCount;
  v4 = malloc_type_calloc(1uLL, ((classInfosCount + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v4 = classInfosCount;
  self->_applySwiftMaskingToIsa = v4;
}

- (void)_addThreadNodesFromTask
{
  unint64_t v3;
  unsigned int blocksCount;
  uint64_t blocksSize;
  _VMUBlockNode *blocks;
  int v7;
  unsigned int v8;
  _VMUBlockNode *v9;

  if (self->_threadsCount)
  {
    v3 = 0;
    blocksCount = self->_blocksCount;
    do
    {
      blocksSize = self->_blocksSize;
      if (blocksSize <= blocksCount)
      {
        if ((2 * blocksSize) <= 0x40000)
          v7 = 0x40000;
        else
          v7 = 2 * blocksSize;
        do
        {
          v8 = v7;
          v7 *= 2;
        }
        while (v8 < blocksCount);
        self->_blocksSize = v8;
        blocks = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v8, 0x1000040451B5BE8uLL);
        self->_blocks = blocks;
        if (!blocks)
        {
          NSLog(CFSTR("Out of memory: failed to expand %s from %u to %u entries"), "_blocks", blocksSize, self->_blocksSize);
          abort();
        }
        blocksCount = self->_blocksCount;
      }
      else
      {
        blocks = self->_blocks;
      }
      v9 = &blocks[blocksCount];
      v9->var0 = v3;
      *((_QWORD *)v9 + 1) = (v3 << 41) | 4;
      blocksCount = self->_blocksCount + 1;
      self->_blocksCount = blocksCount;
      ++v3;
    }
    while (v3 < self->_threadsCount);
  }
}

- (unint64_t)_lengthOfMappedFileOfRegion:(id)a3
{
  _BYTE *v4;
  off_t st_size;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  stat v16[7];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4[49])
    goto LABEL_11;
  if (-[VMUTask rangeIsInSharedCache:](self->_task, "rangeIsInSharedCache:", *((_QWORD *)v4 + 1), *((_QWORD *)v4 + 2)))
  {
    st_size = *((_QWORD *)v4 + 2) + *((_QWORD *)v4 + 15);
    goto LABEL_16;
  }
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_11:
    st_size = 0;
    goto LABEL_16;
  }
  v7 = v6;
  if ((objc_msgSend(v6, "containsString:", CFSTR("*")) & 1) != 0
    || (objc_msgSend(v7, "hasPrefix:", CFSTR("/")) & 1) == 0)
  {
    -[VMUTask memoryCache](self->_task, "memoryCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "procRegionFileNameForAddress:buffer:bufferSize:", *((_QWORD *)v4 + 1), v16, 1024);

    if (v9 >= 1)
    {
      *((_BYTE *)&v16[0].st_dev + v9) = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mappedFileNameToLengthDict, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    st_size = objc_msgSend(v11, "unsignedLongLongValue");
  }
  else
  {
    memset(v16, 0, 144);
    v13 = objc_retainAutorelease(v7);
    if (stat((const char *)objc_msgSend(v13, "UTF8String"), v16))
    {
      st_size = *((_QWORD *)v4 + 2) + *((_QWORD *)v4 + 15);
    }
    else
    {
      st_size = v16[0].st_size;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16[0].st_size);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mappedFileNameToLengthDict, "setObject:forKeyedSubscript:", v14, v13);

    }
  }

LABEL_16:
  return st_size;
}

- (void)_shortenScannableRangeOfMappedFile:(unsigned int)a3
{
  _VMURegionNode *regions;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t var4;
  _QWORD *v9;

  regions = self->_regions;
  v5 = a3;
  v9 = regions[(unint64_t)a3].var0;
  v6 = -[VMUKernelCoreMemoryScanner _lengthOfMappedFileOfRegion:](self, "_lengthOfMappedFileOfRegion:", v9);
  v7 = v9[15];
  if (v6 < v7)
  {
    var4 = regions[v5].var4;
LABEL_5:
    regions[v5].var5 = var4;
    goto LABEL_6;
  }
  if (v6 < v9[2] + v7)
  {
    var4 = v6 - v7 + regions[v5].var4;
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)addRootNodesFromTaskWithError:(id *)a3
{
  unsigned int v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  unsigned int v14;
  BOOL v15;
  _BOOL4 v16;
  _VMURegionNode *v17;
  int v18;
  char v19;
  char v20;
  _VMURegionNode *v21;
  _VMURegionNode *v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  VMURangeArray *v26;
  VMURangeArray *stackRanges;
  unsigned int regionsCount;
  _VMURegionNode *regions;
  _VMURegionNode *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _VMURegionMap *regionMap;
  unint64_t var7;
  unint64_t var6;
  unint64_t v37;
  BOOL v38;
  unint64_t v39;
  unsigned int *var3;
  unint64_t v41;
  char *v42;
  int v43;
  _DWORD *v44;
  int v45;
  _VMURegionNode *var4;
  _VMURegionNode *v47;
  uint64_t *v48;
  uint64_t v49;
  unint64_t v50;
  _VMURegionNode *i;
  _VMURegionNode *j;
  _DWORD *var0;
  uint64_t *v54;
  uint64_t v55;
  unint64_t var5;
  _VMURegionNode *v57;
  unint64_t v58;
  BOOL v59;
  _DWORD *v60;
  _QWORD *v61;
  int v62;
  unint64_t v63;
  id *v64;
  unint64_t v65;
  unint64_t v66;
  id *v67;
  BOOL v68;
  unint64_t v69;
  int v70;
  unint64_t v71;
  unint64_t k;
  _VMURegionNode *v73;
  unsigned int blocksCount;
  uint64_t blocksSize;
  int v76;
  unsigned int v77;
  _VMUBlockNode *v78;
  id v79;
  uint64_t v80;
  _VMUBlockNode *v81;
  _VMURegionNode *v82;
  unint64_t v83;
  unint64_t v84;
  void *v85;
  uint64_t v87;
  unint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  const char *v93;
  _VMURegionNode *v94;
  uint64_t v95;
  const char *v96;
  const char *v97;
  const char *v98;
  unsigned int v99;
  uint64_t v100;
  const char *v101;
  char v102;
  uint64_t v103;
  void *v104;
  FILE *v105;
  _QWORD v106[5];

  -[VMUKernelCoreMemoryScanner _addThreadNodesFromTask](self, "_addThreadNodesFromTask", a3);
  -[VMUKernelCoreMemoryScanner _addSpecialNodesFromTask](self, "_addSpecialNodesFromTask");
  v4 = self->_regionsCount - 1;
  do
  {
    v5 = v4;
    if (!v4)
      break;
    v6 = *((unsigned __int8 *)self->_regions[(unint64_t)v4--].var0 + 50);
  }
  while (v6 == 5);
  v7 = 0;
  do
  {
    v8 = v7;
    v9 = self->_regions[(unint64_t)v7].var0;
    v10 = v9;
    if (v9[50] != 3 && (objc_msgSend(v9, "isSubmap") & 1) == 0)
    {
      v11 = *((_QWORD *)v10 + 1);
      v12 = *((_QWORD *)v10 + 2);
      v13 = -[VMUTask rangeIsInSharedCache:](self->_task, "rangeIsInSharedCache:", v11, v12);
      v14 = *((_DWORD *)v10 + 26);
      v15 = v14 > 0x3D || ((1 << v14) & 0x3000000080103FDELL) == 0;
      if (v15 && v14 != 99)
      {
        v16 = v13;
        if ((~objc_msgSend(v10, "protection") & 3) != 0)
        {
          v18 = *((_DWORD *)v10 + 6);
          v19 = (~v18 & 5) != 0 || v16;
          if ((v19 & 1) == 0 || (v18 != 1 ? (v20 = 1) : (v20 = v16), (v20 & 1) == 0))
          {
            if ((v10[132] & 2) == 0)
            {
              v21 = &self->_regions[v8];
              v21->var4 = *((_QWORD *)v10 + 1);
              v21->var5 = v12 + v11;
            }
          }
        }
        else if ((v10[132] & 4) == 0 || self->_targetProcessHasObjCPatches && objc_msgSend(v10, "dirtyLength"))
        {
          v17 = &self->_regions[v8];
          v17->var4 = v11;
          v17->var5 = v12 + v11;
        }
        else
        {
          v22 = &self->_regions[v8];
          v22->var4 = 0;
          v22->var5 = 0;
        }
        if (*((_DWORD *)v10 + 26) == 78)
          self->_regions[v8].var5 = self->_regions[v8].var4 + 4096;
        if ((v10[132] & 2) != 0
          && (v10[132] & 4) == 0
          && (objc_msgSend(v10, "protection") & 1) != 0
          && (objc_msgSend(v10, "protection") & 4) == 0)
        {
          objc_msgSend(v10, "type");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = objc_msgSend(v104, "isEqualToString:", CFSTR("__LINKEDIT"));

          if ((v102 & 1) == 0)
          {
            v23 = 184;
            if (v16)
              v23 = 168;
            v24 = (unint64_t *)((char *)self + v23);
            v25 = *v24;
            if (!*v24)
            {
              *v24 = v11;
              v25 = v11;
            }
            v24[1] = v12 + v11 - v25;
            if (!v16)
              -[VMURangeArray addRange:](self->_dataSegmentsRangeArrayOutsideSharedCache, "addRange:", v11, v12);
          }
        }
        if (self->_regions[v8].var5 && v10[49])
          -[VMUKernelCoreMemoryScanner _shortenScannableRangeOfMappedFile:](self, "_shortenScannableRangeOfMappedFile:", v8);
      }
    }

    v7 = v8 + 1;
  }
  while ((int)v8 + 1 <= v5);
  v106[0] = MEMORY[0x1E0C809B0];
  v106[1] = 3221225472;
  v106[2] = __60__VMUKernelCoreMemoryScanner_addRootNodesFromTaskWithError___block_invoke;
  v106[3] = &unk_1E4E00B08;
  v106[4] = self;
  -[VMUKernelCoreMemoryScanner _callRemoteMallocEnumerators:block:](self, "_callRemoteMallocEnumerators:block:", 6, v106);
  if (!self->_stackRanges)
  {
    v26 = objc_alloc_init(VMURangeArray);
    stackRanges = self->_stackRanges;
    self->_stackRanges = v26;

  }
  regionsCount = self->_regionsCount;
  if (regionsCount)
  {
    regions = self->_regions;
    v30 = &regions[(unint64_t)(regionsCount - 1)];
  }
  else
  {
    regions = 0;
    v30 = 0;
  }
  if (self->_threadsCount)
  {
    v31 = 0;
    do
    {
      v32 = -[VMUTaskThreadStates stackPointerForThreadNum:](self->_threadStates, "stackPointerForThreadNum:", v31);
      if (v32)
      {
        v33 = v32;
        regionMap = self->_regionMap;
        var6 = regionMap->var6;
        var7 = regionMap->var7;
        v37 = var7 - var6;
        v38 = var7 < var6;
        if (v32 - var6 < v37 && !v38)
        {
          v39 = v32 >> *MEMORY[0x1E0C85AC8];
          if (v39)
          {
            var3 = (unsigned int *)regionMap->var3;
            v41 = v32 >> *MEMORY[0x1E0C85AC8];
            do
            {
              if (*var3 <= (v41 & 0x3FFFFFF)
                || ((*((unsigned __int8 *)var3 + ((v41 & 0x3FFFFFF) >> 3) + 4) >> (v41 & 7)) & 1) == 0)
              {
                goto LABEL_87;
              }
              v41 >>= 26;
            }
            while (v41);
          }
          v42 = (char *)regionMap + 4 * (v39 & 0x7FFFF);
          v45 = *((_DWORD *)v42 + 16);
          v44 = v42 + 64;
          v43 = v45;
          var4 = regionMap->var4;
          if (v45)
          {
            v47 = &var4[(unint64_t)(v43 - 1)];
            if (v32 - *((_QWORD *)v47->var0 + 1) < *((_QWORD *)v47->var0 + 2))
              goto LABEL_63;
          }
          var5 = regionMap->var5;
          if ((_DWORD)var5)
          {
            v57 = regionMap->var4;
            do
            {
              v58 = var5 >> 1;
              v47 = &v57[var5 >> 1];
              if (*((_QWORD *)v47->var0 + 1) <= v32)
              {
                if (*((_QWORD *)v47->var0 + 2) + *((_QWORD *)v47->var0 + 1) > v32)
                {
                  v62 = objc_msgSend(v47->var0, "isSpecialPhysFootprintRegion");
                  if (v62)
                    v63 = 0;
                  else
                    v63 = (unint64_t)v47;
                  if ((v62 & 1) != 0)
                    break;
                  if ((*(_BYTE *)(*(_QWORD *)v63 + 132) & 1) == 0)
                    goto LABEL_102;
                  v64 = (id *)(v63 + 64);
                  v65 = regionMap->var5 - ((uint64_t)(v63 + 64 - (unint64_t)regionMap->var4) >> 6);
                  if (!v65)
                    goto LABEL_99;
                  while (1)
                  {
                    v66 = v65 >> 1;
                    v67 = &v64[8 * (v65 >> 1)];
                    if (*((_QWORD *)*v67 + 1) <= v33)
                    {
                      if (*((_QWORD *)*v67 + 2) + *((_QWORD *)*v67 + 1) > v33)
                      {
                        v69 = v63;
                        v70 = objc_msgSend(*v67, "isSpecialPhysFootprintRegion");
                        v63 = v69;
                        if (v70)
                          v65 = 0;
                        else
                          v65 = (unint64_t)v67;
LABEL_99:
                        if (v65)
                          v63 = v65;
                        v47 = (_VMURegionNode *)v63;
LABEL_102:
                        *v44 = ((v63 - (unint64_t)var4) >> 6) + 1;
LABEL_63:
                        v47->var4 = v33;
                        v48 = (uint64_t *)((char *)v47->var0 + 8);
                        v49 = *v48;
                        v50 = *((_QWORD *)v47->var0 + 2) + *v48;
                        v47->var5 = v50;
                        for (i = v47 - 1; i >= regions; v49 = v55)
                        {
                          var0 = i->var0;
                          v54 = (uint64_t *)((char *)i->var0 + 8);
                          v55 = *v54;
                          if (*((_QWORD *)i->var0 + 2) + *v54 != v49)
                            break;
                          if (var0[26] != 30)
                            break;
                          if (!var0[6])
                            break;
                          i->var4 = 0;
                          i->var5 = 0;
                          --i;
                        }
                        for (j = v47 + 1; j <= v30; ++j)
                        {
                          v60 = j->var0;
                          v61 = (char *)j->var0 + 8;
                          if (v50 != *v61)
                            break;
                          if (v60[26] != 30)
                            break;
                          if (!v60[6])
                            break;
                          j->var4 = v50;
                          v50 = v61[1] + *v61;
                          j->var5 = v50;
                        }
                        -[VMURangeArray addRange:](self->_stackRanges, "addRange:", v33, v50 - v33);
                        goto LABEL_87;
                      }
                      v64 = v67 + 8;
                      v66 = --v65 >> 1;
                    }
                    v68 = v65 > 1;
                    v65 = v66;
                    if (!v68)
                    {
                      v65 = 0;
                      goto LABEL_99;
                    }
                  }
                }
                v57 = v47 + 1;
                v58 = --var5 >> 1;
              }
              v59 = var5 >= 2;
              var5 = v58;
            }
            while (v59);
          }
        }
      }
LABEL_87:
      v31 = (v31 + 1);
    }
    while (v31 < self->_threadsCount);
  }
  if (s_enumeratorDebugging_0)
  {
    fwrite("Region state after claims:\n", 0x1BuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    if (!self->_regionsCount)
      goto LABEL_120;
    v87 = 0;
    v88 = 0;
    do
    {
      v105 = (FILE *)*MEMORY[0x1E0C80C10];
      v103 = objc_msgSend(self->_regions[v87].var0, "address");
      v89 = self->_regions[v87].var0;
      v90 = *((unsigned int *)v89 + 6);
      v91 = v89[2];
      v100 = v89[1];
      v101 = vm_prot_strings_0[v90];
      VMURegionTypeDescriptionForTagShareProtAndPager(*((unsigned __int8 *)v89 + 104), *((unsigned __int8 *)v89 + 50), v90, *((unsigned __int8 *)v89 + 49));
      v92 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v93 = (const char *)objc_msgSend(v92, "UTF8String");
      v94 = &self->_regions[v87];
      v95 = *((_QWORD *)v94->var0 + 2) >> *MEMORY[0x1E0C85AC8];
      if (v95 == 1)
        v96 = "page";
      else
        v96 = "pages";
      v97 = "";
      if (v94->var4 == v94->var5)
        v98 = "";
      else
        v98 = " [root]";
      v99 = *((_DWORD *)v94->var0 + 37);
      if (v99 < self->_zonesCount)
        v97 = (const char *)objc_msgSend(objc_retainAutorelease(self->_zones[v99].var1), "UTF8String");
      fprintf(v105, "region: [%#llx-%#llx] %s %s (%llu %s)%s  %s\n", v103, v91 + v100, v101, v93, v95, v96, v98, v97);

      ++v88;
      v71 = self->_regionsCount;
      ++v87;
    }
    while (v88 < v71);
  }
  else
  {
    v71 = self->_regionsCount;
  }
  if (v71)
  {
    for (k = 0; k < v71; ++k)
    {
      v73 = self->_regions;
      if (v73[k].var4 != v73[k].var5)
      {
        blocksCount = self->_blocksCount;
        blocksSize = self->_blocksSize;
        if (blocksSize <= blocksCount)
        {
          if ((2 * blocksSize) <= 0x40000)
            v76 = 0x40000;
          else
            v76 = 2 * blocksSize;
          do
          {
            v77 = v76;
            v76 *= 2;
          }
          while (v77 < blocksCount);
          self->_blocksSize = v77;
          v78 = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v77, 0x1000040451B5BE8uLL);
          self->_blocks = v78;
          if (!v78)
          {
            NSLog(CFSTR("Out of memory: failed to expand %s from %u to %u entries"), "_blocks", blocksSize, self->_blocksSize);
            abort();
          }
          v73 = self->_regions;
        }
        v79 = v73[k].var0;
        if (objc_msgSend(v79, "isRootRegion"))
          v80 = 2;
        else
          v80 = 5;
        v81 = &self->_blocks[self->_blocksCount];
        v82 = &self->_regions[k];
        v83 = v82->var4;
        v84 = v80 & 0xFFFFFFE00000001FLL | (32 * (LODWORD(v82->var5) - v83)) | (k << 41);
        v81->var0 = v83;
        *((_QWORD *)v81 + 1) = v84;
        ++self->_blocksCount;

        v71 = self->_regionsCount;
      }
    }
  }
LABEL_120:
  if (-[VMUKernelCoreMemoryScanner objectContentLevel](self, "objectContentLevel") == 2)
  {
    -[VMUKernelCoreMemoryScanner _readonlyRegionRanges](self, "_readonlyRegionRanges");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUObjectIdentifier setReadonlyRegionRanges:](self->_objectIdentifier, "setReadonlyRegionRanges:", v85);

  }
  return 1;
}

void __60__VMUKernelCoreMemoryScanner_addRootNodesFromTaskWithError___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  _BYTE *v10;
  unint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unsigned int *v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  _DWORD *v24;
  int v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unsigned int *v38;
  unint64_t v39;
  uint64_t v40;
  int v41;
  _DWORD *v42;
  int v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  int v47;
  uint64_t v48;
  unint64_t v49;
  id *v50;
  unint64_t v51;
  unint64_t v52;
  id *v53;
  BOOL v54;
  unint64_t v55;
  int v56;
  FILE **v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  char *v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  int v66;
  unint64_t v67;
  id *v68;
  unint64_t v69;
  unint64_t v70;
  id *v71;
  unint64_t v72;
  int v73;
  const char *v74;
  const char *v75;
  id v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  FILE *v81;
  unsigned int v82;
  unsigned int v84;
  unsigned int v85;

  if (a5)
  {
    v6 = a1;
    v7 = 0;
    v82 = a2;
    v8 = a5;
    v9 = (_DWORD *)MEMORY[0x1E0C85AC8];
    v10 = &unk_1EE78B000;
    v84 = a2;
    v85 = a3;
    do
    {
      v11 = (unint64_t *)(a4 + 16 * v7);
      v12 = v11 + 1;
      if (v11[1])
      {
        v13 = *(_QWORD *)(*(_QWORD *)(v6 + 32) + 128);
        v14 = *(_QWORD *)(v13 + 48);
        v15 = *(_QWORD *)(v13 + 56);
        v16 = v15 >= v14;
        v17 = v15 - v14;
        if (v16)
        {
          v18 = *v11;
          if (*v11 - v14 < v17)
          {
            v19 = v18 >> *v9;
            if (v19)
            {
              v20 = *(unsigned int **)(v13 + 24);
              v21 = v18 >> *v9;
              do
              {
                if (*v20 <= (v21 & 0x3FFFFFF)
                  || ((*((unsigned __int8 *)v20 + ((v21 & 0x3FFFFFF) >> 3) + 4) >> (v21 & 7)) & 1) == 0)
                {
                  goto LABEL_70;
                }
                v21 >>= 26;
              }
              while (v21);
            }
            v22 = v13 + 4 * (v19 & 0x7FFFF);
            v25 = *(_DWORD *)(v22 + 64);
            v24 = (_DWORD *)(v22 + 64);
            v23 = v25;
            v26 = *(_QWORD *)(v13 + 32);
            if (v25)
            {
              v27 = v26 + ((unint64_t)(v23 - 1) << 6);
              if (v18 - *(_QWORD *)(*(_QWORD *)v27 + 8) < *(_QWORD *)(*(_QWORD *)v27 + 16))
                goto LABEL_14;
            }
            v63 = *(unsigned int *)(v13 + 40);
            if ((_DWORD)v63)
            {
              v64 = *(_QWORD *)(v13 + 32);
              do
              {
                v65 = v63 >> 1;
                v27 = v64 + (v63 >> 1 << 6);
                if (*(_QWORD *)(*(_QWORD *)v27 + 8) <= v18)
                {
                  if (*(_QWORD *)(*(_QWORD *)v27 + 16) + *(_QWORD *)(*(_QWORD *)v27 + 8) > v18)
                  {
                    v66 = objc_msgSend(*(id *)v27, "isSpecialPhysFootprintRegion", a3, &OBJC_IVAR___VMUVMRegion_zone_index, &OBJC_IVAR___VMUVMRegion_mallocTypeFlag, v10);
                    v10 = (_BYTE *)&unk_1EE78B000;
                    v9 = (_DWORD *)MEMORY[0x1E0C85AC8];
                    v6 = a1;
                    a2 = v84;
                    a3 = v85;
                    if (v66)
                      v67 = 0;
                    else
                      v67 = v27;
                    if ((v66 & 1) == 0)
                    {
                      if ((*(_BYTE *)(*(_QWORD *)v67 + 132) & 1) == 0)
                        goto LABEL_85;
                      v68 = (id *)(v67 + 64);
                      v69 = *(unsigned int *)(v13 + 40) - ((uint64_t)(v67 + 64 - *(_QWORD *)(v13 + 32)) >> 6);
                      if (!v69)
                        goto LABEL_82;
                      while (1)
                      {
                        v70 = v69 >> 1;
                        v71 = &v68[8 * (v69 >> 1)];
                        if (*((_QWORD *)*v71 + 1) <= v18)
                        {
                          if (*((_QWORD *)*v71 + 2) + *((_QWORD *)*v71 + 1) > v18)
                          {
                            v72 = v67;
                            v73 = objc_msgSend(*v71, "isSpecialPhysFootprintRegion", v85, &OBJC_IVAR___VMUVMRegion_zone_index, &OBJC_IVAR___VMUVMRegion_mallocTypeFlag, 0x1EE78B000);
                            v67 = v72;
                            v10 = (_BYTE *)&unk_1EE78B000;
                            v9 = (_DWORD *)MEMORY[0x1E0C85AC8];
                            v6 = a1;
                            a2 = v84;
                            a3 = v85;
                            if (v73)
                              v69 = 0;
                            else
                              v69 = (unint64_t)v71;
LABEL_82:
                            if (v69)
                              v27 = v69;
                            else
                              v27 = v67;
LABEL_85:
                            *v24 = ((v27 - v26) >> 6) + 1;
LABEL_14:
                            v28 = *v12 + *v11;
LABEL_15:
                            while (2)
                            {
                              v29 = *(char **)v27;
                              if (v28 <= *(_QWORD *)(*(_QWORD *)v27 + 8))
                                goto LABEL_70;
                              *((_DWORD *)v29 + 37) = a2;
                              *((_DWORD *)v29 + 36) |= a3;
                              *(_QWORD *)(v27 + 24) = 0;
                              *(_QWORD *)(v27 + 32) = 0;
                              if (v10[1320])
                              {
                                v57 = (FILE **)MEMORY[0x1E0C80C10];
                                fprintf((FILE *)*MEMORY[0x1E0C80C10], "zone %s ", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 224)+ 24 * v82+ 8)), "UTF8String"));
                                v81 = *v57;
                                v79 = objc_msgSend(*(id *)v27, "address");
                                v58 = *(unsigned int *)(*(_QWORD *)v27 + 24);
                                v78 = *(_QWORD *)(*(_QWORD *)v27 + 16) + *(_QWORD *)(*(_QWORD *)v27 + 8);
                                v77 = vm_prot_strings_0[v58];
                                VMURegionTypeDescriptionForTagShareProtAndPager(*(unsigned __int8 *)(*(_QWORD *)v27 + 104), *(unsigned __int8 *)(*(_QWORD *)v27 + 50), v58, *(unsigned __int8 *)(*(_QWORD *)v27 + 49));
                                v76 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                                v75 = (const char *)objc_msgSend(v76, "UTF8String");
                                v59 = *(_QWORD *)(*(_QWORD *)v27 + 16) >> *MEMORY[0x1E0C85AC8];
                                v60 = "pages";
                                if (v59 == 1)
                                  v60 = "page";
                                v74 = v60;
                                if (*(_QWORD *)(v27 + 24) == *(_QWORD *)(v27 + 32))
                                  v61 = "";
                                else
                                  v61 = " [root]";
                                v62 = VMUMallocRangeTypeString(v85);
                                fprintf(v81, "claimed region: [%#llx-%#llx] %s %s (%llu %s)%s - type '%s' range: [%#lx-%#lx]\n", v79, v78, v77, v75, v59, v74, v61, v62, *v11, *v12 + *v11);

                                v10 = (_BYTE *)&unk_1EE78B000;
                                v9 = (_DWORD *)MEMORY[0x1E0C85AC8];
                                v6 = a1;
                                a2 = v84;
                                a3 = v85;
                                v29 = *(char **)v27;
                              }
                              v30 = (uint64_t *)(v29 + 8);
                              v32 = *v30;
                              v31 = v30[1];
                              if (v28 <= v31 + v32)
                                goto LABEL_70;
                              v33 = *(_QWORD *)(*(_QWORD *)(v6 + 32) + 128);
                              v34 = *(_QWORD *)(v33 + 48);
                              v35 = *(_QWORD *)(v33 + 56);
                              v16 = v35 >= v34;
                              v36 = v35 - v34;
                              if (!v16)
                                goto LABEL_70;
                              v18 += v31;
                              if (v18 - v34 >= v36)
                                goto LABEL_70;
                              v37 = v18 >> *v9;
                              if (v37)
                              {
                                v38 = *(unsigned int **)(v33 + 24);
                                v39 = v18 >> *v9;
                                while (*v38 > (v39 & 0x3FFFFFF)
                                     && ((*((unsigned __int8 *)v38 + ((v39 & 0x3FFFFFF) >> 3) + 4) >> (v39 & 7)) & 1) != 0)
                                {
                                  v39 >>= 26;
                                  if (!v39)
                                    goto LABEL_26;
                                }
                                goto LABEL_70;
                              }
LABEL_26:
                              v40 = v33 + 4 * (v37 & 0x7FFFF);
                              v43 = *(_DWORD *)(v40 + 64);
                              v42 = (_DWORD *)(v40 + 64);
                              v41 = v43;
                              if (v43)
                              {
                                v27 = *(_QWORD *)(v33 + 32) + ((unint64_t)(v41 - 1) << 6);
                                if (v18 - *(_QWORD *)(*(_QWORD *)v27 + 8) < *(_QWORD *)(*(_QWORD *)v27 + 16))
                                  continue;
                              }
                              break;
                            }
                            v44 = *(unsigned int *)(v33 + 40);
                            if (!(_DWORD)v44)
                              goto LABEL_70;
                            v45 = *(_QWORD *)(v33 + 32);
                            while (1)
                            {
                              v46 = v44 >> 1;
                              v27 = v45 + (v44 >> 1 << 6);
                              if (*(_QWORD *)(*(_QWORD *)v27 + 8) <= v18)
                              {
                                if (*(_QWORD *)(*(_QWORD *)v27 + 16) + *(_QWORD *)(*(_QWORD *)v27 + 8) > v18)
                                {
                                  v80 = *(_QWORD *)(v33 + 32);
                                  v47 = objc_msgSend(*(id *)v27, "isSpecialPhysFootprintRegion");
                                  v48 = v80;
                                  v10 = (_BYTE *)&unk_1EE78B000;
                                  v9 = (_DWORD *)MEMORY[0x1E0C85AC8];
                                  v6 = a1;
                                  a2 = v84;
                                  a3 = v85;
                                  if (v47)
                                    v49 = 0;
                                  else
                                    v49 = v27;
                                  if ((v47 & 1) != 0)
                                    goto LABEL_70;
                                  if ((*(_BYTE *)(*(_QWORD *)v49 + 132) & 1) == 0)
                                    goto LABEL_52;
                                  v50 = (id *)(v49 + 64);
                                  v51 = *(unsigned int *)(v33 + 40) - ((uint64_t)(v49 + 64 - *(_QWORD *)(v33 + 32)) >> 6);
                                  if (!v51)
                                    goto LABEL_49;
                                  while (2)
                                  {
                                    v52 = v51 >> 1;
                                    v53 = &v50[8 * (v51 >> 1)];
                                    if (*((_QWORD *)*v53 + 1) > v18)
                                    {
LABEL_44:
                                      v54 = v51 > 1;
                                      v51 = v52;
                                      if (!v54)
                                      {
                                        v51 = 0;
                                        goto LABEL_49;
                                      }
                                      continue;
                                    }
                                    break;
                                  }
                                  if (*((_QWORD *)*v53 + 2) + *((_QWORD *)*v53 + 1) <= v18)
                                  {
                                    v50 = v53 + 8;
                                    v52 = --v51 >> 1;
                                    goto LABEL_44;
                                  }
                                  v55 = v49;
                                  v56 = objc_msgSend(*v53, "isSpecialPhysFootprintRegion", v85, &OBJC_IVAR___VMUVMRegion_zone_index, &OBJC_IVAR___VMUVMRegion_mallocTypeFlag, 0x1EE78B000);
                                  v49 = v55;
                                  v48 = v80;
                                  v10 = (_BYTE *)&unk_1EE78B000;
                                  v9 = (_DWORD *)MEMORY[0x1E0C85AC8];
                                  v6 = a1;
                                  a2 = v84;
                                  a3 = v85;
                                  if (v56)
                                    v51 = 0;
                                  else
                                    v51 = (unint64_t)v53;
LABEL_49:
                                  if (v51)
                                    v27 = v51;
                                  else
                                    v27 = v49;
LABEL_52:
                                  *v42 = ((v27 - v48) >> 6) + 1;
                                  goto LABEL_15;
                                }
                                v45 = v27 + 64;
                                v46 = --v44 >> 1;
                              }
                              v16 = v44 >= 2;
                              v44 = v46;
                              if (!v16)
                                goto LABEL_70;
                            }
                          }
                          v68 = v71 + 8;
                          v70 = --v69 >> 1;
                        }
                        v54 = v69 > 1;
                        v69 = v70;
                        if (!v54)
                        {
                          v69 = 0;
                          goto LABEL_82;
                        }
                      }
                    }
                    break;
                  }
                  v64 = v27 + 64;
                  v65 = --v63 >> 1;
                }
                v16 = v63 >= 2;
                v63 = v65;
              }
              while (v16);
            }
          }
        }
      }
LABEL_70:
      ++v7;
    }
    while (v7 != v8);
  }
}

- (void)addRootNodesFromTask
{
  -[VMUKernelCoreMemoryScanner addRootNodesFromTaskWithError:](self, "addRootNodesFromTaskWithError:", 0);
}

- (id)_readonlyRegionRanges
{
  VMUNonOverlappingRangeArray *v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;

  v3 = objc_alloc_init(VMUNonOverlappingRangeArray);
  if (self->_regionsCount)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = self->_regions[v4].var0;
      if ((objc_msgSend(v6, "protection") & 1) != 0
        && (objc_msgSend(v6, "isSubmap") & 1) == 0
        && (objc_msgSend(v6, "protection") & 2) == 0
        && (-[VMUTask rangeIsInSharedCache:](self->_task, "rangeIsInSharedCache:", v6[1], v6[2])
         || (*((_BYTE *)v6 + 132) & 2) != 0))
      {
        -[VMUNonOverlappingRangeArray addOrExtendRange:](v3, "addOrExtendRange:", v6[1], v6[2]);
      }

      ++v5;
      ++v4;
    }
    while (v5 < self->_regionsCount);
  }
  return v3;
}

- (unsigned)objectContentLevel
{
  return -[VMUObjectIdentifier objectContentLevel](self->_objectIdentifier, "objectContentLevel");
}

- (void)setObjectContentLevel:(unsigned int)a3
{
  id v5;

  -[VMUObjectIdentifier setObjectContentLevel:](self->_objectIdentifier, "setObjectContentLevel:");
  if (a3 == 2 && self->_regionsCount)
  {
    if (self->_objectIdentifier)
    {
      -[VMUKernelCoreMemoryScanner _readonlyRegionRanges](self, "_readonlyRegionRanges");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[VMUObjectIdentifier setReadonlyRegionRanges:](self->_objectIdentifier, "setReadonlyRegionRanges:", v5);

    }
  }
}

- (void)_sortBlocks
{
  mergesort_b(self->_blocks, self->_blocksCount, 0x10uLL, &__block_literal_global_66_0);
}

uint64_t __41__VMUKernelCoreMemoryScanner__sortBlocks__block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 < *a3)
    return 0xFFFFFFFFLL;
  else
    return *a2 != *a3;
}

- (void)_enumerateZallocZones:(BOOL)a3 blocks:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t Range;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t zonesSize;
  _VMUZoneNode *v18;
  _VMUZoneNode *v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  const char *v25;
  uint64_t i;
  char *v27;
  unsigned int zonesCount;
  uint64_t blocksSize;
  int v30;
  unsigned int v31;
  _VMUZoneNode *v32;
  _VMUZoneNode *v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int16 *v36;
  char v37;
  int v38;
  unint64_t v39;
  uint64_t v40;
  _WORD *v41;
  int v42;
  unsigned int v43;
  unsigned int v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  _WORD *v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v56;
  unsigned int blocksCount;
  _VMUBlockNode *blocks;
  int v59;
  unsigned int v60;
  _VMUBlockNode *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  uint64_t v67;
  unsigned __int16 *v68;
  unsigned __int16 *v69;
  unsigned __int16 *v70;
  uint64_t v71;
  unsigned __int16 *v72;
  void *v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  _BOOL4 v78;
  unsigned int v79;
  uint64_t v80;
  unint64_t v81;
  unsigned __int16 *v82;
  unint64_t v83;
  _WORD *v84;
  uint64_t v85;
  _QWORD *v86;
  _QWORD *v87;
  _OWORD v88[2];
  uint64_t v89;

  v78 = a4;
  v4 = a3;
  v89 = *MEMORY[0x1E0C80C00];
  v86 = 0;
  v87 = 0;
  v85 = 0;
  CSSymbolicatorGetAOutSymbolOwner();
  CSSymbolOwnerGetSymbolWithName();
  Range = CSSymbolGetRange();
  v8 = v7;
  v74 = Range;
  -[VMUTaskMemoryCache peekAtAddress:size:returnsBuf:](self->_memoryCache, "peekAtAddress:size:returnsBuf:");
  v9 = v87;
  CSSymbolOwnerGetSymbolWithName();
  v10 = CSSymbolGetRange();
  v12 = v11;
  -[VMUTaskMemoryCache peekAtAddress:size:returnsBuf:](self->_memoryCache, "peekAtAddress:size:returnsBuf:", v10, v11, &v86);
  CSSymbolOwnerGetSymbolWithName();
  v13 = CSSymbolGetRange();
  v15 = v14;
  -[VMUTaskMemoryCache peekAtAddress:size:returnsBuf:](self->_memoryCache, "peekAtAddress:size:returnsBuf:", v13, v14, &v85);
  v16 = v87;
  if (!v87 || !v86 || !v85 || v8 >> 9 < 0x159 || v12 < 0x70 || v15 < 0xAC8)
    return;
  if (v4)
  {
    -[NSMutableArray addObject:](self->_zoneNames, "addObject:", CFSTR("zalloc (no zone)"));
    zonesSize = self->_zonesSize;
    if (zonesSize <= 1)
    {
      self->_zonesSize = 8;
      v18 = (_VMUZoneNode *)malloc_type_realloc(self->_zones, 0xC0uLL, 0x10A00404568A766uLL);
      self->_zones = v18;
      if (!v18)
      {
        NSLog(CFSTR("Out of memory: failed to expand %s from %u to %u entries"), "_zones", zonesSize, self->_zonesSize);
        goto LABEL_90;
      }
      bzero(&v18[zonesSize], 24 * (self->_zonesSize - zonesSize));
    }
    v19 = &self->_zones[self->_zonesCount];
    v19->var0 = v74;
    v19->var1 = CFSTR("zalloc (no zone)");
    v19->var2 = 0;
    ++self->_zonesCount;
    v16 = v87;
  }
  v20 = (unint64_t)v9 + v8;
  if ((unint64_t)v16 >= v20)
    return;
  v21 = 0;
  v22 = (_QWORD *)MEMORY[0x1E0C85AD8];
  v23 = v16;
  v65 = v20;
  while (!*v16)
  {
LABEL_33:
    ++v21;
    v23 = v87;
    v16 = &v87[32 * v21];
    if ((unint64_t)v16 >= v20)
      return;
  }
  v24 = v85 + 4 * v21;
  v67 = v21;
  v25 = -[VMUTaskMemoryCache peekStringAtAddress:](self->_memoryCache, "peekStringAtAddress:", v23[32 * v21 + 2]);
  v88[0] = xmmword_1E4E01120;
  v88[1] = *(_OWORD *)off_1E4E01130;
  if (v25)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%s"), *((_QWORD *)v88 + (*(_BYTE *)(v24 + 1) & 3)), v25);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnknownZone (%#llx)"), (char *)v16 + v74 - (char *)v87, v64);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 24; i != -8; i -= 8)

  if (v4)
  {
    v27 = (char *)v87;
    zonesCount = self->_zonesCount;
    blocksSize = self->_zonesSize;
    if (blocksSize > zonesCount)
    {
LABEL_28:
      -[NSMutableArray addObject:](self->_zoneNames, "addObject:", v73);
      v33 = &self->_zones[self->_zonesCount];
      v33->var0 = (char *)v16 + v74 - v27;
      v33->var1 = v73;
      v33->var2 = 0;
      if ((*(_WORD *)v24 & 0x4000) != 0 || (*(_WORD *)v24 & 0x300) == 0x200)
        -[NSMutableSet addObject:](self->_nonScannableZoneNames, "addObject:", v73);
      ++self->_zonesCount;
LABEL_32:
      v20 = v65;

      v21 = v67;
      goto LABEL_33;
    }
    if ((2 * blocksSize) <= 8)
      v30 = 8;
    else
      v30 = 2 * blocksSize;
    do
    {
      v31 = v30;
      v30 *= 2;
    }
    while (v31 < zonesCount);
    self->_zonesSize = v31;
    v32 = (_VMUZoneNode *)malloc_type_realloc(self->_zones, 24 * v31, 0x10A00404568A766uLL);
    self->_zones = v32;
    if (v32)
    {
      bzero(&v32[blocksSize], 24 * (self->_zonesSize - blocksSize));
      goto LABEL_28;
    }
    v62 = self->_zonesSize;
    v63 = "_zones";
LABEL_89:
    NSLog(CFSTR("Out of memory: failed to expand %s from %u to %u entries"), v63, blocksSize, v62);
LABEL_90:
    abort();
  }
  v34 = -[NSMutableArray indexOfObject:](self->_zoneNames, "indexOfObject:", v73);
  v35 = 0;
  v36 = (unsigned __int16 *)&v23[32 * v67];
  *(_QWORD *)&v88[0] = v36 + 78;
  *((_QWORD *)&v88[0] + 1) = v36 + 80;
  v70 = v36 + 26;
  v69 = v36 + 29;
  v72 = v36 + 27;
  v82 = v36 + 30;
  v68 = v36 + 28;
  v71 = v34 << 41;
  v37 = 1;
  while (2)
  {
    v66 = v37;
    v38 = **((_DWORD **)v88 + v35);
    if (!v38)
      goto LABEL_84;
LABEL_37:
    v39 = (((*(_QWORD *)&v38 | 0xFFFFFFFF00000000) << *MEMORY[0x1E0C85AC8]) - *v86) >> *MEMORY[0x1E0C85AC8];
    v40 = v86[4];
    v84 = 0;
    v75 = v40 + 16 * v39;
    -[VMUTaskMemoryCache peekAtAddress:size:returnsBuf:](self->_memoryCache, "peekAtAddress:size:returnsBuf:");
    v41 = v84;
    if (v84)
    {
      v42 = *(_DWORD *)v82;
      if ((*(_DWORD *)v82 & 0x100) != 0)
      {
        v80 = (unsigned __int16)v84[2];
        v43 = 1;
        if ((v42 & 0x40) == 0)
          goto LABEL_42;
LABEL_40:
        v44 = *v68;
      }
      else
      {
        v80 = *v70;
        v43 = *v69;
        if ((v42 & 0x40) != 0)
          goto LABEL_40;
LABEL_42:
        v44 = 1;
      }
      v79 = v44;
      if (!v43)
        goto LABEL_83;
      v45 = 0;
      v81 = *v86 + *v22 * v39;
      v76 = v81 + *v72;
      if (v44 <= 1)
        v46 = 1;
      else
        v46 = v44;
      v47 = v43;
      v48 = !v78;
      if (!v44)
        v48 = 1;
      v77 = v48;
LABEL_50:
      if ((*((_BYTE *)v82 + 1) & 1) != 0)
      {
        if ((v77 & 1) == 0)
          goto LABEL_71;
      }
      else
      {
        if (v81 >= v86[10])
        {
          v49 = v84;
          if (v81 > v86[11])
            goto LABEL_56;
          v52 = (*v84 & 0xF000) == 40960;
        }
        else
        {
          v49 = v84;
LABEL_56:
          if ((*v49 & 0x800) != 0)
          {
            v83 = 0;
            -[VMUTaskMemoryCache peekAtAddress:size:returnsBuf:](self->_memoryCache, "peekAtAddress:size:returnsBuf:", v75 + ((v45 >> 1) & 0x3FFFFFF0), 16, &v83);
            if (!v83)
              break;
            v52 = ((*(_DWORD *)(v83 + 4) >> v45) & 1) == 0;
          }
          else
          {
            v50 = v86[6];
            v51 = 8 * (*((_DWORD *)v49 + 1) & 0xFFFFFFF);
            v83 = 0;
            -[VMUTaskMemoryCache readPointerAt:value:](self->_memoryCache, "readPointerAt:value:", v50 + ((v45 >> 3) & 0xFFFFFF8) + v51, &v83);
            v52 = ((v83 >> v45) & 1) == 0;
          }
        }
        if (v52 && v78 && v79 != 0)
        {
LABEL_71:
          v56 = 0;
          blocksCount = self->_blocksCount;
          do
          {
            blocksSize = self->_blocksSize;
            if (blocksSize <= blocksCount)
            {
              if ((2 * blocksSize) <= 0x40000)
                v59 = 0x40000;
              else
                v59 = 2 * blocksSize;
              do
              {
                v60 = v59;
                v59 *= 2;
              }
              while (v60 < blocksCount);
              self->_blocksSize = v60;
              blocks = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v60, 0x1000040451B5BE8uLL);
              self->_blocks = blocks;
              if (!blocks)
              {
                v62 = self->_blocksSize;
                v63 = "_blocks";
                goto LABEL_89;
              }
              blocksCount = self->_blocksCount;
            }
            else
            {
              blocks = self->_blocks;
            }
            v61 = &blocks[blocksCount];
            v61->var0 = v76 + v45 * v80 + *v22 * v56;
            *((_QWORD *)v61 + 1) = v71 | (32 * v80) | 9;
            blocksCount = self->_blocksCount + 1;
            self->_blocksCount = blocksCount;
            ++v56;
          }
          while (v56 != v46);
        }
      }
      if (++v45 == v47)
      {
        v41 = v84;
        v4 = 0;
LABEL_83:
        v38 = *((_DWORD *)v41 + 2);
        if (!v38)
        {
LABEL_84:
          v37 = 0;
          v35 = 1;
          if ((v66 & 1) == 0)
            goto LABEL_32;
          continue;
        }
        goto LABEL_37;
      }
      goto LABEL_50;
    }
    break;
  }

}

- (BOOL)addMallocNodesFromTaskWithError:(id *)a3
{
  -[VMUKernelCoreMemoryScanner _enumerateZallocZones:blocks:](self, "_enumerateZallocZones:blocks:", 0, 1);
  -[VMUKernelCoreMemoryScanner _sortAndClassifyBlocks](self, "_sortAndClassifyBlocks");
  return 1;
}

- (void)addMallocNodesFromTask
{
  -[VMUKernelCoreMemoryScanner addMallocNodesFromTaskWithError:](self, "addMallocNodesFromTaskWithError:", 0);
}

- (void)addMallocNodes:(id)a3
{
  uint64_t blocksSize;
  _DWORD *v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  _VMUBlockNode *v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int blocksCount;
  unint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  _VMUBlockNode *v17;
  _DWORD *v18;

  v18 = a3;
  if (objc_msgSend(v18, "count"))
  {
    blocksSize = self->_blocksSize;
    v5 = v18;
    v6 = v18[2];
    v7 = self->_blocksCount - 1;
    if (blocksSize <= v7 + v6)
    {
      if ((2 * blocksSize) <= 0x40000)
        v8 = 0x40000;
      else
        v8 = 2 * blocksSize;
      do
      {
        v9 = v8;
        self->_blocksSize = v8;
        v8 *= 2;
      }
      while (v9 < v7 + v18[2]);
      v10 = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v9, 0x1000040451B5BE8uLL);
      self->_blocks = v10;
      if (!v10)
      {
        NSLog(CFSTR("Out of memory: failed to expand %s from %u to %u entries"), "_blocks", blocksSize, self->_blocksSize);
        abort();
      }
      v5 = v18;
      v6 = v18[2];
    }
    if (v6)
    {
      v11 = 0;
      v12 = 0;
      blocksCount = self->_blocksCount;
      do
      {
        v14 = (unint64_t *)(*((_QWORD *)v5 + 2) + v11);
        v16 = *v14;
        v15 = v14[1];
        v17 = &self->_blocks[blocksCount];
        if (v15 >= 0xFFFFFFFFFLL)
          v15 = 0xFFFFFFFFFLL;
        v17->var0 = v16;
        *((_QWORD *)v17 + 1) = (32 * v15) | 1;
        blocksCount = self->_blocksCount + 1;
        self->_blocksCount = blocksCount;
        ++v12;
        v11 += 16;
      }
      while (v12 < v5[2]);
    }
    -[VMUKernelCoreMemoryScanner _sortAndClassifyBlocks](self, "_sortAndClassifyBlocks");
  }

}

- (BOOL)addAllNodesFromTaskWithError:(id *)a3
{
  _BOOL4 v5;

  v5 = -[VMUKernelCoreMemoryScanner addRootNodesFromTaskWithError:](self, "addRootNodesFromTaskWithError:");
  if (v5)
    LOBYTE(v5) = -[VMUKernelCoreMemoryScanner addMallocNodesFromTaskWithError:](self, "addMallocNodesFromTaskWithError:", a3);
  return v5;
}

- (void)_sortAndClassifyBlocks
{
  -[VMUKernelCoreMemoryScanner _sortBlocks](self, "_sortBlocks");
  -[VMUKernelCoreMemoryScanner _buildRegionFirstBlockIndexOnPageArrays](self, "_buildRegionFirstBlockIndexOnPageArrays");
  -[VMUKernelCoreMemoryScanner _fixupBlockIsas](self, "_fixupBlockIsas");
  -[VMUKernelCoreMemoryScanner _findMarkedAbandonedBlocks](self, "_findMarkedAbandonedBlocks");
  -[VMUKernelCoreMemoryScanner unmapAllRegions](self, "unmapAllRegions");
}

- (void)setClassStructureFieldScanValueAtSourceAddress:(void *)a3 toCorrectedAddress:(void *)a4
{
  NSMapTable *classStructureAddressToDestinationMapTable;
  NSMapTable *v8;
  NSMapTable *v9;

  classStructureAddressToDestinationMapTable = self->_classStructureAddressToDestinationMapTable;
  if (!classStructureAddressToDestinationMapTable)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 1282);
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_classStructureAddressToDestinationMapTable;
    self->_classStructureAddressToDestinationMapTable = v8;

    classStructureAddressToDestinationMapTable = self->_classStructureAddressToDestinationMapTable;
  }
  NSMapInsert(classStructureAddressToDestinationMapTable, a3, a4);
}

- (void)printRuntimeMetadataInfo
{
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id *v14;
  unint64_t v15;
  _VMUBlockNode *v16;
  uint64_t v17;
  const char *v18;
  _VMUBlockNode *v19;
  id *v20;
  const char *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD);
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __54__VMUKernelCoreMemoryScanner_printRuntimeMetadataInfo__block_invoke;
  v28[3] = &unk_1E4E01148;
  v28[4] = self;
  v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A85A995C](v28, a2);
  -[NSMutableDictionary allKeys](self->_addressToRuntimeMetadataChunkInfoDict, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v25;
    v22 = v3;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_addressToRuntimeMetadataChunkInfoDict, "objectForKeyedSubscript:", v13);
        v14 = (id *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "unsignedLongLongValue");
        v16 = &self->_blocks[v10];
        if (v15 >= ((*((_QWORD *)v16 + 1) >> 5) & 0xFFFFFFFFFLL) + v16->var0)
        {
          v10 = -[VMUKernelCoreMemoryScanner nodeForAddress:](self, "nodeForAddress:", v15);
          v20 = v14;

          v8 = v20;
          v9 = v15;
        }
        else
        {
          if (v9)
          {
            v17 = v11;
            if (objc_msgSend(v14[2], "infoType") == 8)
              v18 = "Swift Metadata";
            else
              v18 = "Metadata";
            putchar(10);
            v19 = &self->_blocks[v10];
            v21 = v18;
            v11 = v17;
            v3 = v22;
            printf("%s %#llx-%#llx[%llu]\n", v21, v19->var0, ((*((_QWORD *)v19 + 1) >> 5) & 0xFFFFFFFFFLL) + v19->var0, (*((_QWORD *)v19 + 1) >> 5) & 0xFFFFFFFFFLL);
            ((void (**)(_QWORD, uint64_t, unint64_t, id *))v3)[2](v3, v10, v9, v8);

            v8 = 0;
          }
          ((void (**)(_QWORD, uint64_t, unint64_t, id *))v3)[2](v3, v10, v15, v14);
          v9 = 0;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

}

void __54__VMUKernelCoreMemoryScanner_printRuntimeMetadataInfo__block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int *a4)
{
  char *v8;
  int v9;
  unsigned int *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  id v14;
  char __s[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = (char *)&VMUObjCClassStructureTypeInfoArray + 24 * a4[3];
  v9 = *((_DWORD *)v8 + 4);
  strchr(*((char **)v8 + 1), 40);
  v10 = a4;
  __strcpy_chk();
  *strchr(__s, 41) = 0;
  v11 = a3 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16 * a2);
  if (*((_BYTE *)v10 + 8))
    v12 = "metaclass";
  else
    v12 = "class";
  v13 = (void *)*((_QWORD *)v10 + 2);

  objc_msgSend(v13, "className");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  printf("    +%5llu %#llx[%u]  %-13s  %s %s\n", v11, a3, v9, __s, v12, (const char *)objc_msgSend(v14, "UTF8String"));

}

- (void)_fixupBlockIsas
{
  unint64_t blocksCount;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  FILE **v9;
  _VMUBlockNode *blocks;
  unint64_t v11;
  unint64_t var0;
  uint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  _VMURegionNode *regions;
  _VMUBlockNode *v19;
  _VMUBlockNode *v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  unint64_t v24;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;

  blocksCount = self->_blocksCount;
  if ((_DWORD)blocksCount)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    LODWORD(v7) = -1;
    v8 = &unk_1EE78B000;
    v9 = (FILE **)MEMORY[0x1E0C80C10];
    do
    {
      blocks = self->_blocks;
      v11 = *((_QWORD *)&blocks[v4] + 1);
      if ((v11 & 7) == 1)
      {
        var0 = blocks[v4].var0;
        if (var0 >= v6)
        {
          v13 = ((uint64_t)(int)v7 << 6) + 64;
          v14 = (int)v7 + 1;
          do
          {
            if (v14 >= (int)self->_regionsCount)
            {
              v5 = -1;
              v6 = -1;
            }
            else
            {
              v15 = (unint64_t *)(*(char **)((char *)&self->_regions->var0 + v13) + 8);
              v5 = *v15;
              v6 = (*(_QWORD **)((char *)&self->_regions->var0 + v13))[2] + *v15;
            }
            LODWORD(v7) = v7 + 1;
            v13 += 64;
            ++v14;
          }
          while (var0 >= v6);
        }
        v16 = var0 + ((v11 >> 5) & 0xFFFFFFFFFLL);
        if (v16 > v5)
        {
          v17 = (uint64_t)(int)v7 << 6;
          v7 = (int)v7;
          regions = self->_regions;
          do
          {
            v19 = self->_blocks;
            v20 = &v19[v4];
            v21 = *((_QWORD *)v20 + 1);
            if ((v21 & 0x18) == 8)
            {
              if (v8[1320])
              {
                v23 = (*(_DWORD **)((char *)&regions->var0 + v17))[37];
                v24 = v21 >> 41;
                if (v23 != -1 && v23 != (_DWORD)v24)
                {
                  fprintf(*v9, "warning: zone fixup failed - block %#llx from zone \"%s\" discovered in region [%#llx-%#llx] already claimed by \"%s\"\n", v20->var0, (const char *)objc_msgSend(objc_retainAutorelease(self->_zones[v24].var1), "UTF8String"), v5, v6, (const char *)objc_msgSend(objc_retainAutorelease(self->_zones[(*(unsigned int **)((char *)&self->_regions->var0+ v17))[37]].var1), "UTF8String"));
                  v9 = (FILE **)MEMORY[0x1E0C80C10];
                  v8 = (_BYTE *)&unk_1EE78B000;
                  v19 = self->_blocks;
                  v21 = *((_QWORD *)&v19[v4] + 1);
                  regions = self->_regions;
                }
              }
              (*(_DWORD **)((char *)&regions->var0 + v17))[37] = v21 >> 41;
              *((_QWORD *)&v19[v4] + 1) &= 0x1FFFFFFFFFFuLL;
              *((_QWORD *)&self->_blocks[v4] + 1) &= 0xFFFFFFFFFFFFFFE7;
              regions = self->_regions;
            }
            v22 = *(uint64_t *)((char *)&regions->var0 + v17);
            *(_DWORD *)(v22 + 144) |= 1u;
            ++*(_QWORD *)(v22 + 136);
            if (v16 <= v6)
              break;
            if (++v7 >= (int)self->_regionsCount)
            {
              v6 = -1;
              v5 = -1;
              break;
            }
            v5 = (*(_QWORD **)((char *)&regions[1].var0 + v17))[1];
            v6 = (*(_QWORD **)((char *)&regions[1].var0 + v17))[2] + v5;
            v17 += 64;
          }
          while (v16 > v5);
          blocksCount = self->_blocksCount;
        }
      }
      ++v4;
    }
    while (v4 < blocksCount);
  }
  self->_initializedRegionMallocBlockCounts = 1;
  -[VMUObjectIdentifier memoryReader](self->_objectIdentifier, "memoryReader");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUObjectIdentifier swiftRuntimeInfoStableABI](self->_objectIdentifier, "swiftRuntimeInfoStableABI");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    v29 = v27;
  }
  else
  {
    -[VMUObjectIdentifier swiftRuntimeInfoPreABI](self->_objectIdentifier, "swiftRuntimeInfoPreABI");
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v30 = v29;

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke;
  v33[3] = &unk_1E4E00C20;
  v34 = v30;
  v35 = v26;
  v33[4] = self;
  v31 = v30;
  v32 = v26;
  -[VMUKernelCoreMemoryScanner _withOrderedNodeMapper:](self, "_withOrderedNodeMapper:", v33);
  -[VMUKernelCoreMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
  -[VMUKernelCoreMemoryScanner _identifyNonObjectsPointedToByTypedIvars:](self, "_identifyNonObjectsPointedToByTypedIvars:", -[VMUClassInfoMap count](self->_classInfoIndexer, "count"));
  -[VMUKernelCoreMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
  -[VMUKernelCoreMemoryScanner _identifyNonObjectsUsingStackBacktrace](self, "_identifyNonObjectsUsingStackBacktrace");
  -[VMUKernelCoreMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
  mergesort_b(self->_instanceValues, self->_instanceValuesCount, 0x10uLL, &__block_literal_global_98);

}

void __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  int v11;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 104))
  {
    v5 = 0;
    v6 = 8;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      if ((*(_QWORD *)(*(_QWORD *)(v2 + 96) + v6) & 0xFFFFFE0000000007) == 1)
      {
        v8[0] = v7;
        v8[1] = 3221225472;
        v8[2] = __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_2;
        v8[3] = &unk_1E4E00BF8;
        v8[4] = v2;
        v11 = v5;
        v10 = *(id *)(a1 + 48);
        v9 = *(id *)(a1 + 40);
        (*(void (**)(uint64_t, unint64_t, uint64_t, _QWORD *))(a2 + 16))(a2, v5, 1, v8);

        v2 = *(_QWORD *)(a1 + 32);
      }
      ++v5;
      v6 += 16;
    }
    while (v5 < *(unsigned int *)(v2 + 104));
  }
}

void __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;

  v4 = (void *)MEMORY[0x1A85A9758]();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 96);
  v7 = *(unsigned int *)(a1 + 56);
  if (HIDWORD(*(_QWORD *)(v6 + 16 * v7)))
    v8 = (*(_QWORD *)(v6 + 16 * v7) & 7) == 0;
  else
    v8 = 0;
  if (v8
    && (objc_msgSend(*(id *)(v5 + 80), "classInfoForMemory:length:remoteAddress:", a2, (*(_QWORD *)(v6 + 16 * v7 + 8) >> 5) & 0xFFFFFFFFFLL), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = v9;
    if (objc_msgSend(v9, "hasSpecificLayout"))
    {
      v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "indexForClassInfo:", v10);
      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 512);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v14 = (void *)objc_opt_new();
        v15 = *(void **)(*(_QWORD *)(a1 + 32) + 512);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

      }
      v17 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16 * *(unsigned int *)(a1 + 56));
      objc_msgSend(v10, "instanceSpecificInfoForObject:ofSize:withScanner:memoryReader:", *v17, v17[1] >> 5);
      v18 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v18;
    }
    v19 = *(void **)(a1 + 40);
    v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16 * *(unsigned int *)(a1 + 56) + 8) >> 5;
    v31[2] = __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_3;
    v31[3] = &unk_1E4E00BA8;
    v21 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v36 = a2;
    v32 = v10;
    v22 = v19;
    v23 = *(_QWORD *)(a1 + 32);
    v33 = v22;
    v34 = v23;
    v35 = *(id *)(a1 + 48);
    v24 = v10;
    objc_msgSend(v24, "enumerateSublayoutsForSize:withBlock:", v20, v31);
    v25 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "indexForClassInfo:", v24);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16 * *(unsigned int *)(a1 + 56);
    *(_QWORD *)(v26 + 8) = *(_QWORD *)(v26 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)v25 << 41);
    v27 = *(_QWORD *)(a1 + 32);
    v28 = *(_QWORD *)(*(_QWORD *)(v27 + 96) + 16 * *(unsigned int *)(a1 + 56) + 8) >> 5;
    v30[0] = v21;
    v30[1] = 3221225472;
    v30[2] = __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_4;
    v30[3] = &unk_1E4E00BD0;
    v30[4] = v27;
    objc_msgSend(v24, "enumerateExternalValuesFromObject:withSize:block:", a2, v28, v30);

  }
  else
  {
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16 * *(unsigned int *)(a1 + 56);
    *(_QWORD *)(v29 + 8) &= 0x1FFFFFFFFFFuLL;
  }
  objc_autoreleasePoolPop(v4);
}

void __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_3(uint64_t a1, void *a2, unsigned int a3, int a4)
{
  unint64_t v6;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  uint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  _DWORD *v21;
  unint64_t v22;
  unsigned int *v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  _DWORD *v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t *v35;
  _QWORD *v36;
  unsigned int *v37;
  uint64_t v38;
  unint64_t *v39;
  uint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  unsigned int v43;
  uint64_t v44;
  BOOL v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  int v50;
  unint64_t v51;
  id *v52;
  unint64_t v53;
  unint64_t v54;
  id *v55;
  BOOL v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t *v66;
  uint64_t v67;
  void *v68;
  void *v69;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + a3);
  if (a4 == 3)
  {
    v6 &= ~1uLL;
  }
  else if (a4 == 5)
  {
    v8 = *(void **)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    v10 = v8;
    if (v10)
    {
      if (objc_msgSend(v9, "usesSwiftRefcounting") && objc_msgSend(v9, "pointerSize") == a3)
      {
        v11 = v10;
        v12 = objc_msgSend(v11, "refcountIsSideTableMarkerMask") & v6;
        if (v12 == objc_msgSend(v11, "refcountIsSideTableMarkerValue"))
        {
          v13 = objc_msgSend(v11, "sideTablePointerMask") & v6;
          v14 = v13 >> objc_msgSend(v11, "sideTablePointerRightShift");
          v6 = v14 << objc_msgSend(v11, "sideTablePointerLeftShift");
        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 &= objc_msgSend(v10, "nativeWeakReferencePointerMask");
      }
    }

  }
  if (HIDWORD(v6))
    v15 = (v6 & 7) == 0;
  else
    v15 = 0;
  if (!v15)
    return;
  v16 = *(uint64_t **)(*(_QWORD *)(a1 + 48) + 128);
  v18 = v16[6];
  v17 = v16[7];
  v19 = v17 - v18;
  v20 = v17 < v18;
  if (v6 - v18 >= v19 || v20)
    return;
  v21 = (_DWORD *)MEMORY[0x1E0C85AC8];
  v22 = v6 >> *MEMORY[0x1E0C85AC8];
  if (v22)
  {
    v23 = (unsigned int *)v16[3];
    v24 = v6 >> *MEMORY[0x1E0C85AC8];
    do
    {
      if (*v23 <= (v24 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)v23 + ((v24 & 0x3FFFFFF) >> 3) + 4) >> (v24 & 7)) & 1) == 0)
      {
        return;
      }
      v24 >>= 26;
    }
    while (v24);
  }
  v25 = (uint64_t)v16 + 4 * (v22 & 0x7FFFF);
  v28 = *(_DWORD *)(v25 + 64);
  v27 = (_DWORD *)(v25 + 64);
  v26 = v28;
  v29 = v16[4];
  if (v28)
  {
    v30 = v29 + ((unint64_t)(v26 - 1) << 6);
    if (v6 - *(_QWORD *)(*(_QWORD *)v30 + 8) < *(_QWORD *)(*(_QWORD *)v30 + 16))
      goto LABEL_27;
  }
  v47 = *((unsigned int *)v16 + 10);
  if (!(_DWORD)v47)
    return;
  v48 = v16[4];
  while (1)
  {
    v49 = v47 >> 1;
    v30 = v48 + (v47 >> 1 << 6);
    if (*(_QWORD *)(*(_QWORD *)v30 + 8) <= v6)
      break;
LABEL_50:
    v45 = v47 >= 2;
    v47 = v49;
    if (!v45)
      return;
  }
  if (*(_QWORD *)(*(_QWORD *)v30 + 16) + *(_QWORD *)(*(_QWORD *)v30 + 8) <= v6)
  {
    v48 = v30 + 64;
    v49 = --v47 >> 1;
    goto LABEL_50;
  }
  v50 = objc_msgSend(*(id *)v30, "isSpecialPhysFootprintRegion");
  if (v50)
    v51 = 0;
  else
    v51 = v30;
  if ((v50 & 1) != 0)
    return;
  if ((*(_BYTE *)(*(_QWORD *)v51 + 132) & 1) == 0)
    goto LABEL_83;
  v52 = (id *)(v51 + 64);
  v53 = *((unsigned int *)v16 + 10) - ((uint64_t)(v51 + 64 - v16[4]) >> 6);
  if (!v53)
    goto LABEL_80;
  while (2)
  {
    v54 = v53 >> 1;
    v55 = &v52[8 * (v53 >> 1)];
    if (*((_QWORD *)*v55 + 1) > v6)
    {
LABEL_61:
      v56 = v53 > 1;
      v53 = v54;
      if (!v56)
      {
        v53 = 0;
        goto LABEL_80;
      }
      continue;
    }
    break;
  }
  if (*((_QWORD *)*v55 + 2) + *((_QWORD *)*v55 + 1) <= v6)
  {
    v52 = v55 + 8;
    v54 = --v53 >> 1;
    goto LABEL_61;
  }
  if (objc_msgSend(*v55, "isSpecialPhysFootprintRegion"))
    v53 = 0;
  else
    v53 = (unint64_t)v55;
LABEL_80:
  if (v53)
    v51 = v53;
  v30 = v51;
LABEL_83:
  *v27 = ((v51 - v29) >> 6) + 1;
LABEL_27:
  v31 = *(_DWORD *)(v30 + 20);
  if (v31)
  {
    v32 = *(_QWORD *)(v30 + 8);
    v33 = *v16;
    v34 = *(unsigned int *)(v30 + 16);
    v35 = (unint64_t *)(*v16 + 16 * v34);
    if (v32)
    {
      if (*v35 > v6)
        return;
      v36 = (_QWORD *)(v33 + 16 * (v31 + v34 - 1));
      if (((v36[1] >> 5) & 0xFFFFFFFFFuLL) + *v36 <= v6)
        return;
      v37 = (unsigned int *)(v32 + 4 * ((v6 - (*v35 & -*MEMORY[0x1E0C85AD8])) >> *v21));
      v38 = *v37;
      v39 = (unint64_t *)(v33 + 16 * v38);
      if (*v39 > v6)
        return;
      v40 = v37[1];
      if (v40 < *((_DWORD *)v16 + 2)
        && (v41 = (unint64_t *)(v33 + 16 * v40), v42 = *v41, *v41 <= v6))
      {
LABEL_63:
        v57 = v41[1];
        if ((v57 & 7) - 2 < 3)
          return;
        v58 = (unint64_t)v41 - v33;
        v59 = v58 >> 4;
        v60 = v6 - v42;
        v61 = v16[2];
        if (v60 >= v61)
        {
          if (((v57 >> 5) & 0xFFFFFFFFFLL) - v60 > v61 || (_DWORD)v59 == -1)
            return;
        }
        else if ((_DWORD)v59 == -1)
        {
          return;
        }
        v63 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96);
        if (v63)
        {
          v64 = (v58 >> 4);
          if (*(_QWORD *)(v63 + 16 * v64) == v6)
          {
            v65 = v63 + 16 * v64;
            v67 = *(_QWORD *)(v65 + 8);
            v66 = (unint64_t *)(v65 + 8);
            if ((v67 & 7) == 1)
            {
              v68 = (void *)MEMORY[0x1A85A9758]();
              objc_msgSend(a2, "instanceSpecificInfoForObject:ofSize:withScanner:memoryReader:", v6, *v66 >> 5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              if (v69)
                *v66 = *v66 & 0x1FFFFFFFFFFLL | ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 288), "indexForClassInfo:", v69) << 41);

              objc_autoreleasePoolPop(v68);
            }
          }
        }
      }
      else
      {
        v43 = v40 - v38;
        if (v43)
        {
          do
          {
            v44 = v43 >> 1;
            v41 = &v39[2 * v44];
            v42 = *v41;
            if (*v41 <= v6)
            {
              if (((v39[2 * v44 + 1] >> 5) & 0xFFFFFFFFFLL) + v42 > v6)
                goto LABEL_63;
              v39 = v41 + 2;
              LODWORD(v44) = --v43 >> 1;
            }
            v45 = v43 >= 2;
            v43 = v44;
          }
          while (v45);
        }
      }
    }
    else
    {
      do
      {
        v46 = v31 >> 1;
        v41 = &v35[2 * v46];
        v42 = *v41;
        if (*v41 <= v6)
        {
          if (((v35[2 * v46 + 1] >> 5) & 0xFFFFFFFFFLL) + v42 > v6)
            goto LABEL_63;
          v35 = v41 + 2;
          LODWORD(v46) = --v31 >> 1;
        }
        v45 = v31 >= 2;
        v31 = v46;
      }
      while (v45);
    }
  }
}

void __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_4(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  uint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  _DWORD *v11;
  unint64_t v12;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  _DWORD *v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t *v25;
  _QWORD *v26;
  unsigned int *v27;
  uint64_t v28;
  unint64_t *v29;
  uint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  unsigned int v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  int v40;
  unint64_t v41;
  id *v42;
  unint64_t v43;
  unint64_t v44;
  id *v45;
  BOOL v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int v57;
  uint64_t v58;
  int v59;
  int v60;
  uint64_t v61;
  unsigned int v62;
  _DWORD *v63;
  uint64_t v64;
  _QWORD *v65;
  id v66;
  id v67;

  v5 = a3;
  v6 = *(uint64_t **)(*(_QWORD *)(a1 + 32) + 128);
  v8 = v6[6];
  v7 = v6[7];
  v9 = v7 - v8;
  v10 = v7 < v8;
  if (a2 - v8 >= v9 || v10)
    goto LABEL_73;
  v11 = (_DWORD *)MEMORY[0x1E0C85AC8];
  v12 = a2 >> *MEMORY[0x1E0C85AC8];
  if (v12)
  {
    v13 = (unsigned int *)v6[3];
    v14 = a2 >> *MEMORY[0x1E0C85AC8];
    do
    {
      if (*v13 <= (v14 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)v13 + ((v14 & 0x3FFFFFF) >> 3) + 4) >> (v14 & 7)) & 1) == 0)
      {
        goto LABEL_73;
      }
      v14 >>= 26;
    }
    while (v14);
  }
  v15 = (uint64_t)v6 + 4 * (v12 & 0x7FFFF);
  v18 = *(_DWORD *)(v15 + 64);
  v17 = (_DWORD *)(v15 + 64);
  v16 = v18;
  v19 = v6[4];
  if (v18)
  {
    v20 = v19 + ((unint64_t)(v16 - 1) << 6);
    if (a2 - *(_QWORD *)(*(_QWORD *)v20 + 8) < *(_QWORD *)(*(_QWORD *)v20 + 16))
      goto LABEL_10;
  }
  v37 = *((unsigned int *)v6 + 10);
  if (!(_DWORD)v37)
    goto LABEL_73;
  v38 = v6[4];
  while (1)
  {
    v39 = v37 >> 1;
    v20 = v38 + (v37 >> 1 << 6);
    if (*(_QWORD *)(*(_QWORD *)v20 + 8) <= a2)
      break;
LABEL_33:
    v35 = v37 >= 2;
    v37 = v39;
    if (!v35)
      goto LABEL_73;
  }
  if (*(_QWORD *)(*(_QWORD *)v20 + 16) + *(_QWORD *)(*(_QWORD *)v20 + 8) <= a2)
  {
    v38 = v20 + 64;
    v39 = --v37 >> 1;
    goto LABEL_33;
  }
  v66 = v5;
  v40 = objc_msgSend(*(id *)v20, "isSpecialPhysFootprintRegion");
  v5 = v66;
  if (v40)
    v41 = 0;
  else
    v41 = v20;
  if ((v40 & 1) != 0)
    goto LABEL_73;
  if ((*(_BYTE *)(*(_QWORD *)v41 + 132) & 1) == 0)
    goto LABEL_64;
  v42 = (id *)(v41 + 64);
  v43 = *((unsigned int *)v6 + 10) - ((uint64_t)(v41 + 64 - v6[4]) >> 6);
  if (!v43)
    goto LABEL_61;
  while (2)
  {
    v44 = v43 >> 1;
    v45 = &v42[8 * (v43 >> 1)];
    if (*((_QWORD *)*v45 + 1) > a2)
    {
LABEL_44:
      v46 = v43 > 1;
      v43 = v44;
      if (!v46)
      {
        v43 = 0;
        goto LABEL_61;
      }
      continue;
    }
    break;
  }
  if (*((_QWORD *)*v45 + 2) + *((_QWORD *)*v45 + 1) <= a2)
  {
    v42 = v45 + 8;
    v44 = --v43 >> 1;
    goto LABEL_44;
  }
  v59 = objc_msgSend(*v45, "isSpecialPhysFootprintRegion");
  v5 = v66;
  if (v59)
    v43 = 0;
  else
    v43 = (unint64_t)v45;
LABEL_61:
  if (v43)
    v41 = v43;
  v20 = v41;
LABEL_64:
  *v17 = ((v41 - v19) >> 6) + 1;
LABEL_10:
  v21 = *(_DWORD *)(v20 + 20);
  if (v21)
  {
    v22 = *(_QWORD *)(v20 + 8);
    v23 = *v6;
    v24 = *(unsigned int *)(v20 + 16);
    v25 = (unint64_t *)(*v6 + 16 * v24);
    if (v22)
    {
      if (*v25 > a2)
        goto LABEL_73;
      v26 = (_QWORD *)(v23 + 16 * (v21 + v24 - 1));
      if (((v26[1] >> 5) & 0xFFFFFFFFFuLL) + *v26 <= a2)
        goto LABEL_73;
      v27 = (unsigned int *)(v22 + 4 * ((a2 - (*v25 & -*MEMORY[0x1E0C85AD8])) >> *v11));
      v28 = *v27;
      v29 = (unint64_t *)(v23 + 16 * v28);
      if (*v29 > a2)
        goto LABEL_73;
      v30 = v27[1];
      if (v30 < *((_DWORD *)v6 + 2)
        && (v31 = (unint64_t *)(v23 + 16 * v30), v32 = *v31, *v31 <= a2))
      {
LABEL_46:
        v47 = v31[1];
        if ((v47 & 7) - 2 < 3)
          goto LABEL_73;
        v48 = (unint64_t)v31 - v23;
        v49 = ((unint64_t)v31 - v23) >> 4;
        v50 = a2 - v32;
        v51 = v6[2];
        if (v50 >= v51)
        {
          if (((v47 >> 5) & 0xFFFFFFFFFLL) - v50 > v51 || (_DWORD)v49 == -1)
            goto LABEL_73;
        }
        else if ((_DWORD)v49 == -1)
        {
          goto LABEL_73;
        }
        v53 = *(_QWORD *)(a1 + 32);
        v54 = *(_QWORD *)(v53 + 96);
        if (v54)
        {
          v55 = (v48 >> 4);
          if ((*(_QWORD *)(v54 + 16 * v55 + 8) & 7) == 1)
          {
            v56 = *(unsigned int *)(v53 + 268);
            v57 = *(_DWORD *)(v53 + 264);
            if (v56 <= v57)
            {
              v60 = 2 * v56;
              if ((2 * v56) <= 0x10)
                v60 = 16;
              *(_DWORD *)(v53 + 268) = v60;
              v61 = *(_QWORD *)(a1 + 32);
              v62 = *(_DWORD *)(v61 + 268);
              v67 = v5;
              if (v62 < *(_DWORD *)(v61 + 264))
              {
                v63 = (_DWORD *)(v61 + 268);
                do
                {
                  *v63 = 2 * v62;
                  v61 = *(_QWORD *)(a1 + 32);
                  v63 = (_DWORD *)(v61 + 268);
                  v62 = *(_DWORD *)(v61 + 268);
                }
                while (v62 < *(_DWORD *)(v61 + 264));
              }
              *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = malloc_type_realloc(*(void **)(v61 + 256), 16 * v62, 0x108004057E67DB5uLL);
              v64 = *(_QWORD *)(a1 + 32);
              v58 = *(_QWORD *)(v64 + 256);
              if (!v58)
              {
                NSLog(CFSTR("Out of memory: failed to expand %s from %u to %u entries"), "_instanceValues", v56, *(unsigned int *)(v64 + 268));
                abort();
              }
              v57 = *(_DWORD *)(v64 + 264);
              v5 = v67;
            }
            else
            {
              v58 = *(_QWORD *)(v53 + 256);
            }
            v65 = (_QWORD *)(v58 + 16 * v57);
            *v65 = v55;
            v65[1] = 0;
            ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 264);
          }
        }
      }
      else
      {
        v33 = v30 - v28;
        if (v33)
        {
          do
          {
            v34 = v33 >> 1;
            v31 = &v29[2 * v34];
            v32 = *v31;
            if (*v31 <= a2)
            {
              if (((v29[2 * v34 + 1] >> 5) & 0xFFFFFFFFFLL) + v32 > a2)
                goto LABEL_46;
              v29 = v31 + 2;
              LODWORD(v34) = --v33 >> 1;
            }
            v35 = v33 >= 2;
            v33 = v34;
          }
          while (v35);
        }
      }
    }
    else
    {
      do
      {
        v36 = v21 >> 1;
        v31 = &v25[2 * v36];
        v32 = *v31;
        if (*v31 <= a2)
        {
          if (((v25[2 * v36 + 1] >> 5) & 0xFFFFFFFFFLL) + v32 > a2)
            goto LABEL_46;
          v25 = v31 + 2;
          LODWORD(v36) = --v21 >> 1;
        }
        v35 = v21 >= 2;
        v21 = v36;
      }
      while (v35);
    }
  }
LABEL_73:

}

uint64_t __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_5(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 < *a3)
    return 0xFFFFFFFFLL;
  else
    return *a2 > *a3;
}

- (void)_identifyNonObjectsPointedToByTypedIvars:(unsigned int)a3
{
  unsigned int v5;
  _DWORD *v6;
  uint64_t v7;
  VMUClassInfoMap *classInfoIndexer;
  id v9;
  _QWORD v10[5];
  id v11;
  _DWORD *v12;
  unsigned int v13;
  _QWORD v14[5];

  v5 = a3 + 1;
  v6 = malloc_type_calloc(1uLL, ((a3 + 8) >> 3) + 4, 0xFF42C4F3uLL);
  *v6 = v5;
  v7 = MEMORY[0x1E0C809B0];
  classInfoIndexer = self->_classInfoIndexer;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke;
  v14[3] = &__block_descriptor_40_e32_v36__0Q8__VMUClassInfo_16I24_B28l;
  v14[4] = v6;
  -[VMUClassInfoMap enumerateInfosWithBlock:](classInfoIndexer, "enumerateInfosWithBlock:", v14);
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 258, 1282);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_2;
  v10[3] = &unk_1E4E00CB8;
  v13 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  v10[4] = self;
  v9 = v11;
  -[VMUKernelCoreMemoryScanner _withOrderedNodeMapper:](self, "_withOrderedNodeMapper:", v10);
  free(v6);

}

void __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned int a4)
{
  void *v6;
  int v7;
  unsigned int *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "infoType") != 1 && objc_msgSend(v9, "infoType") != 128
    || (objc_msgSend(v9, "className"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("__NSMallocBlock__")),
        v6,
        v7))
  {
    v8 = *(unsigned int **)(a1 + 32);
    if (*v8 > a4)
      *((_BYTE *)v8 + (a4 >> 3) + 4) |= 1 << (a4 & 7);
  }

}

void __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _DWORD *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  int v23;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 104))
  {
    v5 = 0;
    v6 = 8;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = *(_QWORD *)(*(_QWORD *)(v2 + 96) + v6);
      if ((v8 & 7) == 1)
      {
        v9 = v8 >> 41;
        if (*(_DWORD *)(a1 + 56) >= v8 >> 41)
        {
          v10 = *(_DWORD **)(a1 + 48);
          if (*v10 <= v9
            || ((*((unsigned __int8 *)v10 + (v9 >> 3) + 4) >> (v9 & 7)) & 1) == 0)
          {
            v11 = *(id *)(*(_QWORD *)(v2 + 272) + 8 * v9);
            v12 = v11;
            if (v11)
            {
              v18[0] = v7;
              v18[1] = 3221225472;
              v18[2] = __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_3;
              v18[3] = &unk_1E4E01190;
              v13 = v11;
              v14 = *(_QWORD *)(a1 + 32);
              v15 = *(void **)(a1 + 40);
              v19 = v13;
              v20 = v14;
              v16 = v15;
              v17 = *(_QWORD *)(a1 + 48);
              v21 = v16;
              v22 = v17;
              v23 = v9;
              (*(void (**)(uint64_t, unint64_t, uint64_t, _QWORD *))(a2 + 16))(a2, v5, 1, v18);

            }
            v2 = *(_QWORD *)(a1 + 32);
          }
        }
      }
      ++v5;
      v6 += 16;
    }
    while (v5 < *(unsigned int *)(v2 + 104));
  }
}

void __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD *v5;
  _DWORD *v6;
  unint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = (void *)MEMORY[0x1A85A9758]();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_4;
  v8[3] = &unk_1E4E00C68;
  v11 = &v13;
  v12 = a2;
  v5 = *(_QWORD **)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 32);
  -[VMUClassInfo enumerateAllPointerFieldsWithBlock:](v5, (uint64_t)v8);
  if (!*((_BYTE *)v14 + 24))
  {
    v6 = *(_DWORD **)(a1 + 56);
    v7 = *(unsigned int *)(a1 + 64);
    if (*v6 > v7)
      *((_BYTE *)v6 + (v7 >> 3) + 4) |= 1 << (v7 & 7);
  }

  _Block_object_dispose(&v13, 8);
  objc_autoreleasePoolPop(v4);
}

void __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_4(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  uint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  _DWORD *v16;
  unint64_t v17;
  unsigned int *v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  _DWORD *v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t *v30;
  _QWORD *v31;
  unsigned int *v32;
  uint64_t v33;
  unint64_t *v34;
  uint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  unsigned int v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  unint64_t v46;
  id *v47;
  unint64_t v48;
  unint64_t v49;
  id *v50;
  BOOL v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t *v61;
  uint64_t v62;
  void *v63;
  unint64_t v64;
  int v65;
  void *v66;
  void *v67;
  int v68;
  id v69;
  __CFString *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  void *v76;
  void *v77;
  unint64_t v78;
  id v79;
  unsigned int v80;

  v8 = *(_QWORD *)(a1 + 64);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  v9 = *(_QWORD *)(v8 + objc_msgSend(a2, "offset") + a4);
  if (HIDWORD(v9))
    v10 = (v9 & 7) == 0;
  else
    v10 = 0;
  if (!v10)
    return;
  v11 = *(uint64_t **)(*(_QWORD *)(a1 + 32) + 128);
  v13 = v11[6];
  v12 = v11[7];
  v14 = v12 - v13;
  v15 = v12 < v13;
  if (v9 - v13 >= v14 || v15)
    return;
  v16 = (_DWORD *)MEMORY[0x1E0C85AC8];
  v17 = v9 >> *MEMORY[0x1E0C85AC8];
  if (v17)
  {
    v18 = (unsigned int *)v11[3];
    v19 = v9 >> *MEMORY[0x1E0C85AC8];
    do
    {
      if (*v18 <= (v19 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)v18 + ((v19 & 0x3FFFFFF) >> 3) + 4) >> (v19 & 7)) & 1) == 0)
      {
        return;
      }
      v19 >>= 26;
    }
    while (v19);
  }
  v20 = (uint64_t)v11 + 4 * (v17 & 0x7FFFF);
  v23 = *(_DWORD *)(v20 + 64);
  v22 = (_DWORD *)(v20 + 64);
  v21 = v23;
  v24 = v11[4];
  if (v23)
  {
    v25 = v24 + ((unint64_t)(v21 - 1) << 6);
    if (v9 - *(_QWORD *)(*(_QWORD *)v25 + 8) < *(_QWORD *)(*(_QWORD *)v25 + 16))
      goto LABEL_15;
  }
  v42 = *((unsigned int *)v11 + 10);
  if (!(_DWORD)v42)
    return;
  v43 = v11[4];
  while (1)
  {
    v44 = v42 >> 1;
    v25 = v43 + (v42 >> 1 << 6);
    if (*(_QWORD *)(*(_QWORD *)v25 + 8) <= v9)
      break;
LABEL_38:
    v40 = v42 >= 2;
    v42 = v44;
    if (!v40)
      return;
  }
  if (*(_QWORD *)(*(_QWORD *)v25 + 16) + *(_QWORD *)(*(_QWORD *)v25 + 8) <= v9)
  {
    v43 = v25 + 64;
    v44 = --v42 >> 1;
    goto LABEL_38;
  }
  v45 = objc_msgSend(*(id *)v25, "isSpecialPhysFootprintRegion");
  v16 = (_DWORD *)MEMORY[0x1E0C85AC8];
  if (v45)
    v46 = 0;
  else
    v46 = v25;
  if ((v45 & 1) != 0)
    return;
  if ((*(_BYTE *)(*(_QWORD *)v46 + 132) & 1) == 0)
    goto LABEL_71;
  v47 = (id *)(v46 + 64);
  v48 = *((unsigned int *)v11 + 10) - ((uint64_t)(v46 + 64 - v11[4]) >> 6);
  if (!v48)
    goto LABEL_68;
  while (2)
  {
    v49 = v48 >> 1;
    v50 = &v47[8 * (v48 >> 1)];
    if (*((_QWORD *)*v50 + 1) > v9)
    {
LABEL_49:
      v51 = v48 > 1;
      v48 = v49;
      if (!v51)
      {
        v48 = 0;
        goto LABEL_68;
      }
      continue;
    }
    break;
  }
  if (*((_QWORD *)*v50 + 2) + *((_QWORD *)*v50 + 1) <= v9)
  {
    v47 = v50 + 8;
    v49 = --v48 >> 1;
    goto LABEL_49;
  }
  v64 = v46;
  v65 = objc_msgSend(*v50, "isSpecialPhysFootprintRegion");
  v46 = v64;
  v16 = (_DWORD *)MEMORY[0x1E0C85AC8];
  if (v65)
    v48 = 0;
  else
    v48 = (unint64_t)v50;
LABEL_68:
  if (v48)
    v46 = v48;
  v25 = v46;
LABEL_71:
  *v22 = ((v46 - v24) >> 6) + 1;
LABEL_15:
  v26 = *(_DWORD *)(v25 + 20);
  if (v26)
  {
    v27 = *(_QWORD *)(v25 + 8);
    v28 = *v11;
    v29 = *(unsigned int *)(v25 + 16);
    v30 = (unint64_t *)(*v11 + 16 * v29);
    if (v27)
    {
      if (*v30 > v9)
        return;
      v31 = (_QWORD *)(v28 + 16 * (v26 + v29 - 1));
      if (((v31[1] >> 5) & 0xFFFFFFFFFuLL) + *v31 <= v9)
        return;
      v32 = (unsigned int *)(v27 + 4 * ((v9 - (*v30 & -*MEMORY[0x1E0C85AD8])) >> *v16));
      v33 = *v32;
      v34 = (unint64_t *)(v28 + 16 * v33);
      if (*v34 > v9)
        return;
      v35 = v32[1];
      if (v35 < *((_DWORD *)v11 + 2)
        && (v36 = (unint64_t *)(v28 + 16 * v35), v37 = *v36, *v36 <= v9))
      {
LABEL_51:
        v52 = v36[1];
        if ((v52 & 7) - 2 < 3)
          return;
        v53 = (unint64_t)v36 - v28;
        v54 = v53 >> 4;
        v55 = v9 - v37;
        v56 = v11[2];
        if (v55 >= v56)
        {
          if (((v52 >> 5) & 0xFFFFFFFFFLL) - v55 > v56 || (_DWORD)v54 == -1)
            return;
        }
        else if ((_DWORD)v54 == -1)
        {
          return;
        }
        v58 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
        if (v58)
        {
          v59 = (v53 >> 4);
          if (*(_QWORD *)(v58 + 16 * v59) == v9)
          {
            v60 = v58 + 16 * v59;
            v62 = *(_QWORD *)(v60 + 8);
            v61 = (unint64_t *)(v60 + 8);
            if ((v62 & 0xFFFFFE0000000007) == 1)
            {
              v63 = NSMapGet(*(NSMapTable **)(a1 + 40), a2);
              if (!v63)
              {
                if (objc_msgSend(*(id *)(a1 + 48), "infoType") == 8)
                  objc_msgSend(a2, "fullIvarNameAtOffset:", a4);
                else
                  objc_msgSend(a2, "ivarName");
                v79 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a3, "typeName");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v66, "length"))
                {
                  objc_msgSend(a3, "typeName");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  v68 = objc_msgSend(v67, "characterAtIndex:", 0);

                  if (v68 == 35)
                  {

                    return;
                  }
                }
                else
                {

                }
                v80 = 0;
                objc_msgSend(a3, "typeName");
                v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                descriptionForTypeOfReferencedAllocation((char *)objc_msgSend(v69, "UTF8String"), &v80);
                v70 = (__CFString *)objc_claimAutoreleasedReturnValue();

                v71 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(*(id *)(a1 + 48), "displayName");
                v72 = objc_claimAutoreleasedReturnValue();
                v73 = (void *)v72;
                v74 = CFSTR("malloc");
                if (v70)
                  v74 = v70;
                objc_msgSend(v71, "stringWithFormat:", CFSTR("%@.%@ (%@)"), v72, v79, v74);
                v75 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(*(id *)(a1 + 48), "binaryPath");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUClassInfo, "classInfoWithClassName:binaryPath:type:", v75, v76, v80);
                v77 = (void *)objc_claimAutoreleasedReturnValue();

                v78 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "indexForClassInfo:", v77);
                NSMapInsert(*(NSMapTable **)(a1 + 40), a3, (const void *)v78);

                LODWORD(v63) = v78;
              }
              *v61 = *v61 & 0x1FFFFFFFFFFLL | ((unint64_t)v63 << 41);
            }
          }
        }
      }
      else
      {
        v38 = v35 - v33;
        if (v38)
        {
          do
          {
            v39 = v38 >> 1;
            v36 = &v34[2 * v39];
            v37 = *v36;
            if (*v36 <= v9)
            {
              if (((v34[2 * v39 + 1] >> 5) & 0xFFFFFFFFFLL) + v37 > v9)
                goto LABEL_51;
              v34 = v36 + 2;
              LODWORD(v39) = --v38 >> 1;
            }
            v40 = v38 >= 2;
            v38 = v39;
          }
          while (v40);
        }
      }
    }
    else
    {
      do
      {
        v41 = v26 >> 1;
        v36 = &v30[2 * v41];
        v37 = *v36;
        if (*v36 <= v9)
        {
          if (((v30[2 * v41 + 1] >> 5) & 0xFFFFFFFFFLL) + v37 > v9)
            goto LABEL_51;
          v30 = v36 + 2;
          LODWORD(v41) = --v26 >> 1;
        }
        v40 = v26 >= 2;
        v26 = v41;
      }
      while (v40);
    }
  }
}

- (id)_typeNameForZoneName:(id)a3
{
  return (id)objc_msgSend(CFSTR("non-object in zone "), "stringByAppendingString:", a3);
}

- (void)_identifyNonObjectsUsingStackBacktrace
{
  void *v3;
  unint64_t blocksCount;
  unint64_t v5;
  uint64_t v6;
  _VMUBlockNode *blocks;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_opt_new();
  blocksCount = self->_blocksCount;
  if ((_DWORD)blocksCount)
  {
    v5 = 0;
    v6 = 8;
    do
    {
      blocks = self->_blocks;
      if ((*(unint64_t *)((_BYTE *)&blocks->var0 + v6) & 7) == 1)
      {
        -[VMUKernelCoreMemoryScanner nodeDetails:](self, "nodeDetails:", v5);
        -[VMUKernelCoreMemoryScanner zoneNameForNode:](self, "zoneNameForNode:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(v9, "unsignedIntValue");
        if (!(_DWORD)v10)
        {
          -[VMUKernelCoreMemoryScanner _typeNameForZoneName:](self, "_typeNameForZoneName:", v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUClassInfo, "classInfoWithClassName:binaryPath:type:", v14, CFSTR("<unknown>"), 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setIsDerivedFromStackBacktrace:", 1);
          v10 = -[VMUClassInfoMap indexForClassInfo:](self->_classInfoIndexer, "indexForClassInfo:", v11);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
          v12 = v3;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, v8);

          v3 = v12;
        }
        *(unint64_t *)((char *)&blocks->var0 + v6) = *(unint64_t *)((_BYTE *)&blocks->var0 + v6) & 0x1FFFFFFFFFFLL | ((unint64_t)v10 << 41);

        blocksCount = self->_blocksCount;
      }
      ++v5;
      v6 += 16;
    }
    while (v5 < blocksCount);
  }

}

- (void)_findMarkedAbandonedBlocks
{
  void *userMarkedAbandoned;
  unint64_t regionsCount;
  unint64_t v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  _VMURegionNode *regions;
  id *p_var0;
  VMUTaskMemoryCache *memoryCache;
  VMUTask *v12;
  VMUTaskMemoryCache *v13;
  _VMURegionNode *v14;
  unint64_t var7;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  BOOL v31;
  VMUTaskMemoryCache *v32;
  VMUTaskMemoryCache *v33;
  _VMURegionNode *v34;
  _VMURegionNode *v35;
  int v36;
  VMUTask *v37;
  _BOOL4 v38;
  uint64_t v39;
  char *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  void (**v46)(void);
  unint64_t v47;
  _VMURegionNode *v48;
  unsigned int blocksCount;
  _DWORD *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  _VMUBlockNode *blocks;
  _QWORD *v55;
  unint64_t v56;
  _DWORD *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  FILE *v61;
  int v62;
  VMUTaskMemoryCache *v63;
  _QWORD v64[4];
  VMUTaskMemoryCache *v65;
  _VMURegionNode *v66;
  _VMURegionNode *v67;
  unint64_t v68;

  userMarkedAbandoned = self->_userMarkedAbandoned;
  if (userMarkedAbandoned)
  {
    free(userMarkedAbandoned);
    self->_userMarkedAbandoned = 0;
  }
  if (!self->_abandonedMarkingEnabled)
    return;
  LODWORD(regionsCount) = self->_regionsCount;
  if (!(_DWORD)regionsCount)
    return;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  do
  {
    regions = self->_regions;
    p_var0 = &regions[v5].var0;
    if (*((_DWORD *)*p_var0 + 26) != 10)
      goto LABEL_51;
    memoryCache = self->_memoryCache;
    v12 = self->_task;
    v13 = memoryCache;
    if (p_var0[6])
      goto LABEL_8;
    v63 = v13;
    if ((*((_BYTE *)*p_var0 + 132) & 2) == 0)
    {
      -[VMUTaskMemoryCache taskIsTranslated](v13, "taskIsTranslated");
      v13 = v63;
    }
    v64[0] = 0;
    v68 = 0;
    v36 = -[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:](v13, "mapAddress:size:returnedAddress:returnedSize:", *((_QWORD *)*p_var0 + 1), *((_QWORD *)*p_var0 + 2), v64, &v68);
    if (!v36)
    {
      v13 = v63;
      v47 = v68;
      p_var0[6] = (id)v64[0];
      v48 = &regions[v5];
      v48->var6 = v47;
      v48->var8 = (_VMURegionNode *)p_var0;
LABEL_8:

      v14 = self->_regions;
      var7 = (unint64_t)v14[v5].var7;
      if (var7)
      {
        v16 = (unint64_t *)MEMORY[0x1E0C85AD8];
        v17 = *MEMORY[0x1E0C85AD8];
        v18 = v8;
        do
        {
          v19 = v17 + var7;
          if (*(_QWORD *)var7 == 0x1DE67829AD1A2FBBLL && *(_DWORD *)(var7 + 8) <= 1u)
          {
            v20 = *(_DWORD *)(var7 + 20);
            v21 = v7 + v20 - 1;
            if (v18 <= v21)
            {
              v22 = v17 >> 3;
              if (v22 <= 2 * (int)v18)
                LODWORD(v22) = 2 * v18;
              if (v22 <= 0x100)
                v22 = 256;
              else
                v22 = v22;
              do
              {
                v8 = v22;
                v22 = (2 * v22);
              }
              while (v8 < v21);
              v23 = malloc_type_realloc(v6, 8 * v8, 0x100004000313F17uLL);
              if (!v23)
              {
                NSLog(CFSTR("Out of memory: failed to expand %s from %u to %u entries"), "allMarkedAddresses", v18, v8);
                abort();
              }
              v6 = v23;
              v20 = *(_DWORD *)(var7 + 20);
            }
            else
            {
              v8 = v18;
            }
            v24 = *(unsigned int *)(var7 + 12) + var7;
            v25 = v20;
            if (v20)
            {
              v26 = (uint64_t *)(*(unsigned int *)(var7 + 12) + var7);
              v27 = v25;
              do
              {
                v29 = *v26++;
                v28 = v29;
                if (v29)
                  *((_QWORD *)v6 + v7++) = v28;
                --v27;
              }
              while (v27);
            }
            v30 = v24 + 8 * v25;
            v17 = *v16;
            v19 = (v30 + *v16 - 1) & -(uint64_t)*v16;
            v14 = self->_regions;
          }
          else
          {
            v8 = v18;
          }
          v31 = (void *)v19 >= (char *)v14[v5].var7 + v14[v5].var6 || v19 == 0;
          v18 = v8;
          var7 = v19;
        }
        while (!v31);
      }
      v32 = self->_memoryCache;
      v33 = v32;
      v34 = &v14[v5];
      if (v34->var7)
      {
        if (v34->var8 == v34)
        {
          v64[0] = MEMORY[0x1E0C809B0];
          v64[1] = 3221225472;
          v64[2] = ___unmapRegion_block_invoke_0;
          v64[3] = &unk_1E4E011E0;
          v65 = v32;
          v66 = &v14[v5];
          v67 = v14;
          v46 = (void (**)(void))MEMORY[0x1A85A995C](v64);
          v46[2]();

        }
        else
        {
          v35 = &v14[v5];
          v35->var6 = 0;
          v35->var7 = 0;
          v35->var8 = 0;
        }
      }

      goto LABEL_51;
    }
    v62 = v36;
    v37 = v12;
    if ((*((_DWORD *)*p_var0 + 13) & 3u) - 1 >= 2)
    {
      v38 = task_exists(v12);
      if (v5 != (_DWORD)regionsCount - 1 && v38)
      {
        v61 = (FILE *)*MEMORY[0x1E0C80C10];
        v60 = objc_msgSend(*p_var0, "address");
        v39 = *((unsigned int *)*p_var0 + 6);
        v59 = *((_QWORD *)*p_var0 + 2) + *((_QWORD *)*p_var0 + 1);
        v40 = vm_prot_strings_0[v39];
        VMURegionTypeDescriptionForTagShareProtAndPager(*((unsigned __int8 *)*p_var0 + 104), *((unsigned __int8 *)*p_var0 + 50), v39, *((unsigned __int8 *)*p_var0 + 49));
        v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v42 = (const char *)objc_msgSend(v41, "UTF8String");
        v43 = *((_QWORD *)*p_var0 + 2) >> *MEMORY[0x1E0C85AC8];
        v44 = "pages";
        if (v43 == 1)
          v44 = "page";
        v45 = " [root]";
        if (regions[v5].var4 == regions[v5].var5)
          v45 = "";
        v58 = v40;
        v37 = v12;
        fprintf(v61, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v60, v59, v58, v42, v43, v44, v45, v62);

      }
    }

LABEL_51:
    ++v5;
    regionsCount = self->_regionsCount;
  }
  while (v5 < regionsCount);
  if (v6)
  {
    blocksCount = self->_blocksCount;
    v50 = malloc_type_calloc(1uLL, ((blocksCount + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *v50 = blocksCount;
    self->_userMarkedAbandoned = v50;
    mergesort_b(v6, v7, 8uLL, &__block_literal_global_116);
    if (v7)
    {
      v51 = 0;
      v52 = 0;
      do
      {
        v53 = self->_blocksCount;
        if (v52 >= v53)
          break;
        blocks = self->_blocks;
        v55 = (_QWORD *)&blocks[v52] + 1;
        while (1)
        {
          if ((*v55 & 7) == 1)
          {
            v56 = *((_QWORD *)v6 + v51);
            if (*(v55 - 1) >= v56)
              break;
          }
          ++v52;
          v55 += 2;
          if (v53 == v52)
            goto LABEL_67;
        }
        v53 = v52;
        if (blocks[v52].var0 != v56)
        {
LABEL_67:
          v52 = v53;
          goto LABEL_68;
        }
        v57 = self->_userMarkedAbandoned;
        if (*v57 > v52)
          *((_BYTE *)v57 + (v52 >> 3) + 4) |= 1 << (v52 & 7);
        v52 = v52;
LABEL_68:
        ++v51;
      }
      while (v51 != v7);
    }
    free(v6);
  }
}

uint64_t __56__VMUKernelCoreMemoryScanner__findMarkedAbandonedBlocks__block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 < *a3)
    return 0xFFFFFFFFLL;
  else
    return *a2 != *a3;
}

- (void)refineTypesWithOverlay:(id)a3
{
  -[VMUClassInfoMap _applyTypeOverlay:](self->_classInfoIndexer, "_applyTypeOverlay:", a3);
  -[VMUKernelCoreMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
}

- (void)applyTypeOverlayToMutableInfo:(id)a3
{
  VMUClassInfoMap *classInfoIndexer;
  VMUScanOverlay *scanOverlay;
  id v5;
  id v6;

  classInfoIndexer = self->_classInfoIndexer;
  scanOverlay = self->_scanOverlay;
  v5 = a3;
  -[VMUScanOverlay refinementRules](scanOverlay, "refinementRules");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[VMUClassInfoMap _applyTypeOverlayRules:toMutableInfo:]((uint64_t)classInfoIndexer, v6, v5);

}

- (void)_buildRegionFirstBlockIndexOnPageArrays
{
  __assert_rtn("_noteBlocksInRegion", "VMUKernelCoreMemoryScanner.m", 1132, "endOfLastPageWithAllocations - startOfFirstPageWithAllocations");
}

- (void)scanLocalMemory:(uint64_t)a3 atOffset:(unsigned int)a4 node:(unint64_t)a5 length:(int)a6 isa:(void *)a7 fieldInfo:(unsigned int)a8 stride:(uint64_t)a9 recorder:
{
  uint64_t v11;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _DWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  unsigned int v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unsigned int v42;
  unsigned int *v43;
  uint64_t *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  BOOL v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unsigned int *v52;
  unint64_t v53;
  uint64_t v54;
  int v55;
  _DWORD *v56;
  int v57;
  unint64_t v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t *v63;
  _QWORD *v64;
  unsigned int *v65;
  uint64_t v66;
  unint64_t *v67;
  uint64_t v68;
  unint64_t *v69;
  unint64_t v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  int v77;
  uint64_t v78;
  unint64_t v79;
  id *v80;
  unint64_t v81;
  unint64_t v82;
  id *v83;
  BOOL v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  int v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  void *v93;
  unsigned int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unsigned int *v104;
  unint64_t v105;
  uint64_t v106;
  int v107;
  _DWORD *v108;
  int v109;
  unint64_t v110;
  unsigned int v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t *v115;
  _QWORD *v116;
  unsigned int *v117;
  uint64_t v118;
  unint64_t *v119;
  uint64_t v120;
  unint64_t *v121;
  unint64_t v122;
  unsigned int v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t v128;
  int v129;
  uint64_t v130;
  unint64_t v131;
  id *v132;
  unint64_t v133;
  unint64_t v134;
  id *v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  int v140;
  uint64_t *v141;
  void *v142;
  unint64_t v143;
  id v144;
  uint64_t v145;
  unint64_t v146;
  char *v147;
  uint64_t v148;
  id v149;
  void *v150;
  uint64_t v151;
  unint64_t v152;
  unint64_t v153;
  void (*v154)(void);
  unint64_t v155;
  id v156;
  uint64_t v157;
  uint64_t v158;
  int v159;
  void *v160;
  void *v161;
  void *v162;
  NSMapTable *v163;
  void *v164;
  uint64_t *v165;
  unint64_t v166;
  unint64_t v167;
  unint64_t v168;
  unint64_t v169;
  unint64_t v170;
  unint64_t v171;
  unsigned int *v172;
  unint64_t v173;
  uint64_t v174;
  int v175;
  _DWORD *v176;
  int v177;
  unint64_t v178;
  unsigned int v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t *v183;
  _QWORD *v184;
  unsigned int *v185;
  uint64_t v186;
  unint64_t *v187;
  uint64_t v188;
  unint64_t *v189;
  unint64_t v190;
  unsigned int v191;
  uint64_t v192;
  uint64_t v193;
  unint64_t v194;
  unint64_t v195;
  unint64_t v196;
  int v197;
  _DWORD *v198;
  uint64_t v199;
  unint64_t v200;
  id *v201;
  unint64_t v202;
  unint64_t v203;
  id *v204;
  unint64_t v205;
  unint64_t v206;
  unint64_t v207;
  unint64_t v209;
  int v210;
  unint64_t v211;
  uint64_t v212;
  void *v213;
  unsigned int v214;
  uint64_t v216;
  int v217;
  unint64_t v218;
  _DWORD *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v224;
  uint64_t v225;
  unsigned int v226;
  void *v227;
  uint64_t v228;
  uint64_t v229;
  unsigned int v230;
  uint64_t v231;
  char *v232;
  _QWORD v233[7];
  int v234;
  uint64_t v235;
  uint64_t *v236;
  uint64_t v237;
  int v238;
  _QWORD v239[3];
  unsigned int v240;

  if (a1)
  {
    LODWORD(v11) = a6;
    objc_msgSend(*(id *)(a1 + 80), "swiftRuntimeInfoStableABI");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 80), "swiftRuntimeInfoPreABI");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v227 = v17;

    v18 = objc_msgSend(*(id *)(a1 + 80), "hasSwiftContent");
    if ((_DWORD)v11 && *(_BYTE *)(a1 + 364))
    {
      v19 = a5 - 8;
      if (a5 < 8)
        goto LABEL_184;
      v20 = v11;
      v21 = *(id *)(*(_QWORD *)(a1 + 272) + 8 * v11);
      v22 = v21;
      v23 = v11 >> 3;
      v230 = v11;
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8 * v11))
      {
        v24 = objc_msgSend(v21, "instanceSize");
        v239[0] = 0;
        v239[1] = v239;
        v239[2] = 0x2020000000;
        v240 = (v24 >> 3) + 2;
        *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8 * v11) = malloc_type_malloc(4 * v240, 0x100004052888210uLL);
        v25 = *(_DWORD **)(a1 + 304);
        if (*v25 > v11)
          *((_BYTE *)v25 + v23 + 4) &= ~(1 << (v11 & 7));
        v235 = 0;
        v236 = &v235;
        v237 = 0x2020000000;
        v238 = 0;
        v233[0] = MEMORY[0x1E0C809B0];
        v233[1] = 3221225472;
        v233[2] = __97__VMUKernelCoreMemoryScanner_scanLocalMemory_atOffset_node_length_isa_fieldInfo_stride_recorder___block_invoke;
        v233[3] = &unk_1E4E00DD8;
        v233[5] = &v235;
        v233[6] = v239;
        v233[4] = a1;
        v234 = v11;
        objc_msgSend(v22, "enumerateScanningLocationsForSize:withBlock:", v24, v233);
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8 * v11);
        v11 = *((unsigned int *)v236 + 6);
        *((_DWORD *)v236 + 6) = v11 + 1;
        *(_DWORD *)(v26 + 4 * v11) = (v24 + 7) & 0xFFFFF8 | (objc_msgSend(v22, "defaultScanType") << 24);
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8 * v20);
        v28 = *((unsigned int *)v236 + 6);
        *((_DWORD *)v236 + 6) = v28 + 1;
        *(_DWORD *)(v27 + 4 * v28) = (objc_msgSend(v22, "defaultScanType") << 24) | 0xFFFFFF;
        _Block_object_dispose(&v235, 8);
        _Block_object_dispose(v239, 8);
        LOBYTE(v11) = v230;
      }
      v213 = v22;
      v29 = 0;
      v30 = 0;
      v228 = a2 + a3;
      v220 = v23 + 4;
      v217 = 1 << (v11 & 7);
      while (1)
      {
        v31 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8 * v20) + 4 * v30);
        v32 = HIBYTE(v31);
        v33 = v29 + 8;
        if (HIBYTE(v31) == 1)
          v33 = v29 + 1;
        if ((v31 & 0xFFFFFF) == 0xFFFFFF)
        {
          v29 = v33;
        }
        else
        {
          ++v30;
          v29 = *(_QWORD *)&v31 & 0xFFFFFFLL;
        }
        if (((*(_DWORD *)(a1 + 376) >> SHIBYTE(v31)) & 1) == 0 || v29 > v19)
          goto LABEL_89;
        v34 = HIBYTE(v31);
        v35 = *(_QWORD *)(v228 + v29);
        if (v34 == 3)
          break;
        if (v34 != 5)
          goto LABEL_30;
        v36 = v213;
        v37 = v227;
        if (v227)
        {
          if (objc_msgSend(v36, "usesSwiftRefcounting")
            && v29 == objc_msgSend(v36, "pointerSize"))
          {
            v38 = v37;
            v39 = objc_msgSend(v38, "refcountIsSideTableMarkerMask") & v35;
            if (v39 == objc_msgSend(v38, "refcountIsSideTableMarkerValue"))
            {
              v40 = objc_msgSend(v38, "sideTablePointerMask") & v35;
              v41 = v40 >> objc_msgSend(v38, "sideTablePointerRightShift");
              v35 = v41 << objc_msgSend(v38, "sideTablePointerLeftShift");
            }
            else
            {
              v35 = 0;
            }

          }
          else
          {
            v35 &= objc_msgSend(v37, "nativeWeakReferencePointerMask");
          }
        }

        v32 = 5;
        v42 = v230;
LABEL_35:
        v43 = *(unsigned int **)(a1 + 304);
        if (*v43 > v42 && (v217 & *((_BYTE *)v43 + v220)) != 0)
          v35 &= 0xFFFFFFFFFFFFF8uLL;
        if (!v35)
          goto LABEL_89;
        v224 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 16 * a4);
        v44 = *(uint64_t **)(a1 + 128);
        v45 = -[VMUTask ptrauthStripDataPointer:](*(_QWORD *)(a1 + 8), v35);
        v46 = v44[6];
        v47 = v44[7];
        v48 = v47 >= v46;
        v49 = v47 - v46;
        if (!v48)
          goto LABEL_89;
        v50 = v45;
        if (v45 - v46 >= v49)
          goto LABEL_89;
        v51 = v45 >> *MEMORY[0x1E0C85AC8];
        if (v51)
        {
          v52 = (unsigned int *)v44[3];
          v53 = v45 >> *MEMORY[0x1E0C85AC8];
          do
          {
            if (*v52 <= (v53 & 0x3FFFFFF)
              || ((*((unsigned __int8 *)v52 + ((v53 & 0x3FFFFFF) >> 3) + 4) >> (v53 & 7)) & 1) == 0)
            {
              goto LABEL_89;
            }
            v53 >>= 26;
          }
          while (v53);
        }
        v54 = (uint64_t)v44 + 4 * (v51 & 0x7FFFF);
        v57 = *(_DWORD *)(v54 + 64);
        v56 = (_DWORD *)(v54 + 64);
        v55 = v57;
        if (v57)
        {
          v58 = v44[4] + ((unint64_t)(v55 - 1) << 6);
          if (v45 - *(_QWORD *)(*(_QWORD *)v58 + 8) < *(_QWORD *)(*(_QWORD *)v58 + 16))
            goto LABEL_49;
        }
        v74 = *((unsigned int *)v44 + 10);
        if (!(_DWORD)v74)
          goto LABEL_89;
        v75 = v44[4];
        while (1)
        {
          v76 = v74 >> 1;
          v58 = v75 + (v74 >> 1 << 6);
          if (*(_QWORD *)(*(_QWORD *)v58 + 8) <= v45)
            break;
LABEL_72:
          v48 = v74 >= 2;
          v74 = v76;
          if (!v48)
            goto LABEL_89;
        }
        if (*(_QWORD *)(*(_QWORD *)v58 + 16) + *(_QWORD *)(*(_QWORD *)v58 + 8) <= v45)
        {
          v75 = v58 + 64;
          v76 = --v74 >> 1;
          goto LABEL_72;
        }
        v212 = v44[4];
        v77 = objc_msgSend(*(id *)v58, "isSpecialPhysFootprintRegion");
        v78 = v212;
        if (v77)
          v79 = 0;
        else
          v79 = v58;
        if ((v77 & 1) != 0)
          goto LABEL_89;
        if ((*(_BYTE *)(*(_QWORD *)v79 + 132) & 1) == 0)
          goto LABEL_103;
        v80 = (id *)(v79 + 64);
        v81 = *((unsigned int *)v44 + 10) - ((uint64_t)(v79 + 64 - v44[4]) >> 6);
        if (!v81)
          goto LABEL_100;
        while (2)
        {
          v82 = v81 >> 1;
          v83 = &v80[8 * (v81 >> 1)];
          if (*((_QWORD *)*v83 + 1) > v50)
          {
LABEL_83:
            v84 = v81 > 1;
            v81 = v82;
            if (!v84)
            {
              v81 = 0;
              goto LABEL_100;
            }
            continue;
          }
          break;
        }
        if (*((_QWORD *)*v83 + 2) + *((_QWORD *)*v83 + 1) <= v50)
        {
          v80 = v83 + 8;
          v82 = --v81 >> 1;
          goto LABEL_83;
        }
        v211 = v79;
        v89 = objc_msgSend(*v83, "isSpecialPhysFootprintRegion");
        v79 = v211;
        v78 = v212;
        if (v89)
          v81 = 0;
        else
          v81 = (unint64_t)v83;
LABEL_100:
        if (v81)
          v79 = v81;
        v58 = v79;
LABEL_103:
        *v56 = ((v79 - v78) >> 6) + 1;
LABEL_49:
        v59 = *(_DWORD *)(v58 + 20);
        if (v59)
        {
          v60 = *(_QWORD *)(v58 + 8);
          v61 = *v44;
          v62 = *(unsigned int *)(v58 + 16);
          v63 = (unint64_t *)(*v44 + 16 * v62);
          if (v60)
          {
            if (*v63 > v50)
              goto LABEL_89;
            v64 = (_QWORD *)(v61 + 16 * (v59 + v62 - 1));
            if (((v64[1] >> 5) & 0xFFFFFFFFFuLL) + *v64 <= v50)
              goto LABEL_89;
            v65 = (unsigned int *)(v60 + 4 * ((v50 - (*v63 & -*MEMORY[0x1E0C85AD8])) >> *MEMORY[0x1E0C85AC8]));
            v66 = *v65;
            v67 = (unint64_t *)(v61 + 16 * v66);
            if (*v67 > v50)
              goto LABEL_89;
            v68 = v65[1];
            if (v68 < *((_DWORD *)v44 + 2))
            {
              v69 = (unint64_t *)(v61 + 16 * v68);
              v70 = *v69;
              if (*v69 <= v50)
              {
LABEL_85:
                v85 = v69[1];
                if ((v85 & 7) - 2 < 3)
                  goto LABEL_89;
                v86 = ((unint64_t)v69 - v61) >> 4;
                v87 = v44[2];
                if (v50 - v70 >= v87)
                {
                  if (((v85 >> 5) & 0xFFFFFFFFFLL) - (v50 - v70) > v87 || (_DWORD)v86 == -1)
                    goto LABEL_89;
                }
                else if ((_DWORD)v86 == -1)
                {
                  goto LABEL_89;
                }
                (*(void (**)(uint64_t, _QWORD, unint64_t, uint64_t))(a9 + 16))(a9, a4, v29 + a3 + v224, v32);
                goto LABEL_89;
              }
            }
            v71 = v68 - v66;
            if (v71)
            {
              do
              {
                v72 = v71 >> 1;
                v69 = &v67[2 * v72];
                v70 = *v69;
                if (*v69 <= v50)
                {
                  if (((v67[2 * v72 + 1] >> 5) & 0xFFFFFFFFFLL) + v70 > v50)
                    goto LABEL_85;
                  v67 = v69 + 2;
                  LODWORD(v72) = --v71 >> 1;
                }
                v48 = v71 >= 2;
                v71 = v72;
              }
              while (v48);
            }
          }
          else
          {
            do
            {
              v73 = v59 >> 1;
              v69 = &v63[2 * v73];
              v70 = *v69;
              if (*v69 <= v50)
              {
                if (((v63[2 * v73 + 1] >> 5) & 0xFFFFFFFFFLL) + v70 > v50)
                  goto LABEL_85;
                v63 = v69 + 2;
                LODWORD(v73) = --v59 >> 1;
              }
              v48 = v59 >= 2;
              v59 = v73;
            }
            while (v48);
          }
        }
LABEL_89:
        if (v29 > v19)
        {

          goto LABEL_184;
        }
      }
      v35 &= ~1uLL;
      if ((*(_QWORD *)(v228 + v29) & 1) != 0)
        v32 = 2;
      else
        v32 = 3;
LABEL_30:
      v42 = v230;
      goto LABEL_35;
    }
    if (a7 && *(_BYTE *)(a1 + 364))
    {
      v90 = (((_DWORD)a3 + 7) & 0xFFFFFFF8) - a3;
      v91 = (v90 + 8);
      if (v91 > a5)
        goto LABEL_184;
      v231 = a2 + a3;
      while (1)
      {
        v92 = v90;
        v90 = v91;
        LODWORD(v239[0]) = 0;
        objc_msgSend(a7, "getLeafFieldAtOffset:leafOffset:", v92, v239);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = LODWORD(v239[0]) + 8;
        if (v94 > objc_msgSend(v93, "size"))
          goto LABEL_160;
        v95 = *(_QWORD *)(v231 + v92);
        v96 = *(_QWORD *)(a1 + 8);
        v225 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 16 * a4);
        v226 = objc_msgSend(v93, "scanType");
        if (!v95)
          goto LABEL_160;
        v97 = *(uint64_t **)(a1 + 128);
        v98 = -[VMUTask ptrauthStripDataPointer:](v96, v95);
        v99 = v97[6];
        v100 = v97[7];
        v48 = v100 >= v99;
        v101 = v100 - v99;
        if (!v48)
          goto LABEL_160;
        v102 = v98;
        if (v98 - v99 >= v101)
          goto LABEL_160;
        v103 = v98 >> *MEMORY[0x1E0C85AC8];
        if (v103)
        {
          v104 = (unsigned int *)v97[3];
          v105 = v98 >> *MEMORY[0x1E0C85AC8];
          do
          {
            if (*v104 <= (v105 & 0x3FFFFFF)
              || ((*((unsigned __int8 *)v104 + ((v105 & 0x3FFFFFF) >> 3) + 4) >> (v105 & 7)) & 1) == 0)
            {
              goto LABEL_160;
            }
            v105 >>= 26;
          }
          while (v105);
        }
        v106 = (uint64_t)v97 + 4 * (v103 & 0x7FFFF);
        v109 = *(_DWORD *)(v106 + 64);
        v108 = (_DWORD *)(v106 + 64);
        v107 = v109;
        if (v109)
        {
          v110 = v97[4] + ((unint64_t)(v107 - 1) << 6);
          if (v98 - *(_QWORD *)(*(_QWORD *)v110 + 8) < *(_QWORD *)(*(_QWORD *)v110 + 16))
            goto LABEL_120;
        }
        v126 = *((unsigned int *)v97 + 10);
        if (!(_DWORD)v126)
          goto LABEL_160;
        v127 = v97[4];
        while (1)
        {
          v128 = v126 >> 1;
          v110 = v127 + (v126 >> 1 << 6);
          if (*(_QWORD *)(*(_QWORD *)v110 + 8) <= v98)
            break;
LABEL_143:
          v48 = v126 >= 2;
          v126 = v128;
          if (!v48)
            goto LABEL_160;
        }
        if (*(_QWORD *)(*(_QWORD *)v110 + 16) + *(_QWORD *)(*(_QWORD *)v110 + 8) <= v98)
          break;
        v221 = v97[4];
        v129 = objc_msgSend(*(id *)v110, "isSpecialPhysFootprintRegion");
        v130 = v221;
        if (v129)
          v131 = 0;
        else
          v131 = v110;
        if ((v129 & 1) != 0)
          goto LABEL_160;
        if ((*(_BYTE *)(*(_QWORD *)v131 + 132) & 1) == 0)
          goto LABEL_174;
        v132 = (id *)(v131 + 64);
        v133 = *((unsigned int *)v97 + 10) - ((uint64_t)(v131 + 64 - v97[4]) >> 6);
        if (!v133)
          goto LABEL_171;
        while (2)
        {
          v134 = v133 >> 1;
          v135 = &v132[8 * (v133 >> 1)];
          if (*((_QWORD *)*v135 + 1) > v102)
          {
LABEL_154:
            v84 = v133 > 1;
            v133 = v134;
            if (!v84)
            {
              v133 = 0;
              goto LABEL_171;
            }
            continue;
          }
          break;
        }
        if (*((_QWORD *)*v135 + 2) + *((_QWORD *)*v135 + 1) <= v102)
        {
          v132 = v135 + 8;
          v134 = --v133 >> 1;
          goto LABEL_154;
        }
        v218 = v131;
        v140 = objc_msgSend(*v135, "isSpecialPhysFootprintRegion");
        v131 = v218;
        v130 = v221;
        if (v140)
          v133 = 0;
        else
          v133 = (unint64_t)v135;
LABEL_171:
        if (v133)
          v131 = v133;
        v110 = v131;
LABEL_174:
        *v108 = ((v131 - v130) >> 6) + 1;
LABEL_120:
        v111 = *(_DWORD *)(v110 + 20);
        if (v111)
        {
          v112 = *(_QWORD *)(v110 + 8);
          v113 = *v97;
          v114 = *(unsigned int *)(v110 + 16);
          v115 = (unint64_t *)(*v97 + 16 * v114);
          if (v112)
          {
            if (*v115 > v102)
              goto LABEL_160;
            v116 = (_QWORD *)(v113 + 16 * (v111 + v114 - 1));
            if (((v116[1] >> 5) & 0xFFFFFFFFFuLL) + *v116 <= v102)
              goto LABEL_160;
            v117 = (unsigned int *)(v112 + 4 * ((v102 - (*v115 & -*MEMORY[0x1E0C85AD8])) >> *MEMORY[0x1E0C85AC8]));
            v118 = *v117;
            v119 = (unint64_t *)(v113 + 16 * v118);
            if (*v119 > v102)
              goto LABEL_160;
            v120 = v117[1];
            if (v120 < *((_DWORD *)v97 + 2))
            {
              v121 = (unint64_t *)(v113 + 16 * v120);
              v122 = *v121;
              if (*v121 <= v102)
              {
LABEL_156:
                v136 = v121[1];
                if ((v136 & 7) - 2 < 3)
                  goto LABEL_160;
                v137 = ((unint64_t)v121 - v113) >> 4;
                v138 = v97[2];
                if (v102 - v122 >= v138)
                {
                  if (((v136 >> 5) & 0xFFFFFFFFFLL) - (v102 - v122) > v138 || (_DWORD)v137 == -1)
                    goto LABEL_160;
                }
                else if ((_DWORD)v137 == -1)
                {
                  goto LABEL_160;
                }
                (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(a9 + 16))(a9, a4, a3 + v92 + v225, v226);
                goto LABEL_160;
              }
            }
            v123 = v120 - v118;
            if (v123)
            {
              do
              {
                v124 = v123 >> 1;
                v121 = &v119[2 * v124];
                v122 = *v121;
                if (*v121 <= v102)
                {
                  if (((v119[2 * v124 + 1] >> 5) & 0xFFFFFFFFFLL) + v122 > v102)
                    goto LABEL_156;
                  v119 = v121 + 2;
                  LODWORD(v124) = --v123 >> 1;
                }
                v48 = v123 >= 2;
                v123 = v124;
              }
              while (v48);
            }
          }
          else
          {
            do
            {
              v125 = v111 >> 1;
              v121 = &v115[2 * v125];
              v122 = *v121;
              if (*v121 <= v102)
              {
                if (((v115[2 * v125 + 1] >> 5) & 0xFFFFFFFFFLL) + v122 > v102)
                  goto LABEL_156;
                v115 = v121 + 2;
                LODWORD(v125) = --v111 >> 1;
              }
              v48 = v111 >= 2;
              v111 = v125;
            }
            while (v48);
          }
        }
LABEL_160:

        v91 = (v90 + 8);
        if (v91 > a5)
        {
LABEL_184:

          return;
        }
      }
      v127 = v110 + 64;
      v128 = --v126 >> 1;
      goto LABEL_143;
    }
    if ((*(_BYTE *)(a1 + 376) & 2) == 0)
      goto LABEL_184;
    v141 = (uint64_t *)(a2 + a3);
    if ((_DWORD)v11)
      v142 = *(void **)(*(_QWORD *)(a1 + 272) + 8 * v11);
    else
      v142 = 0;
    v143 = a2 + a3 + a5 - 8;
    v144 = v142;
    if (*(_DWORD *)(a1 + 316))
      v145 = *(_QWORD *)(objc_msgSend(*(id *)(a1 + 80), "autoreleasePoolPageLayout") + 16);
    else
      v145 = 0;
    if ((unint64_t)v141 > v143)
      goto LABEL_183;
    v229 = a8;
    v222 = a2;
LABEL_187:
    v146 = (unint64_t)v141 - a2;
    v147 = (char *)v141 + *(_QWORD *)(*(_QWORD *)(a1 + 96) + 16 * a4) - a2;
    v148 = *v141;
    v232 = v147;
    if (!*v141)
    {
      if (!*(_DWORD *)(a1 + 316)
        || v146 < *(unsigned int *)(objc_msgSend(*(id *)(a1 + 80), "autoreleasePoolPageLayout") + 8))
      {
        goto LABEL_264;
      }
      v154 = *(void (**)(void))(a9 + 16);
      goto LABEL_199;
    }
    if ((_DWORD)v18)
    {
      if (v144
        && v146 == 8
        && objc_msgSend(v144, "infoType") == 8
        && objc_msgSend(v144, "usesSwiftRefcounting"))
      {
        v149 = v227;
        v150 = v149;
        if (v227
          && (v151 = objc_msgSend(v149, "refcountIsSideTableMarkerMask") & v148,
              v151 == objc_msgSend(v150, "refcountIsSideTableMarkerValue")))
        {
          v152 = objc_msgSend(v150, "sideTablePointerMask") & v148;
          v153 = v152 >> objc_msgSend(v150, "sideTablePointerRightShift");
          v148 = v153 << objc_msgSend(v150, "sideTablePointerLeftShift");
        }
        else
        {
          v148 = 0;
        }

        v147 = v232;
        if (!v145)
          goto LABEL_207;
        goto LABEL_203;
      }
      if ((*(_DWORD *)(*(_QWORD *)(a1 + 96) + 16 * a4 + 8) & 7u) - 2 < 3)
        v148 &= 0xFFFFFFFFFFFFF8uLL;
    }
    if (!v145)
      goto LABEL_207;
LABEL_203:
    if ((objc_msgSend(*(id *)(a1 + 80), "isTaggedPointer:", v148) & 1) == 0)
    {
      v155 = v143;
      v156 = v144;
      v157 = v18;
      v158 = v148 & v145;
      if (v148 != (v148 & v145))
      {
        v159 = objc_msgSend(*(id *)(a1 + 80), "countFromPointerInAutoreleasePool:", v148);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v159 + 1));
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        v161 = *(void **)(a1 + 520);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v232);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "setObject:forKeyedSubscript:", v160, v162);

        v147 = v232;
        v148 = v158;
      }
      v18 = v157;
      v144 = v156;
      v143 = v155;
      a2 = v222;
    }
LABEL_207:
    v163 = *(NSMapTable **)(a1 + 328);
    if (v163)
    {
      if ((*(_QWORD *)(*(_QWORD *)(a1 + 96) + 16 * a4 + 8) & 7) == 2)
      {
        v164 = NSMapGet(v163, v147);
        if (v164)
          v148 = (uint64_t)v164;
      }
    }
    if ((objc_msgSend(*(id *)(a1 + 536), "containsLocation:", v147) & 1) != 0)
      goto LABEL_264;
    if (!v148)
      goto LABEL_264;
    v165 = *(uint64_t **)(a1 + 128);
    v166 = -[VMUTask ptrauthStripDataPointer:](*(_QWORD *)(a1 + 8), v148);
    v167 = v165[6];
    v168 = v165[7];
    v48 = v168 >= v167;
    v169 = v168 - v167;
    if (!v48)
      goto LABEL_264;
    v170 = v166;
    if (v166 - v167 >= v169)
      goto LABEL_264;
    v171 = v166 >> *MEMORY[0x1E0C85AC8];
    if (v171)
    {
      v172 = (unsigned int *)v165[3];
      v173 = v166 >> *MEMORY[0x1E0C85AC8];
      do
      {
        if (*v172 <= (v173 & 0x3FFFFFF)
          || ((*((unsigned __int8 *)v172 + ((v173 & 0x3FFFFFF) >> 3) + 4) >> (v173 & 7)) & 1) == 0)
        {
          goto LABEL_264;
        }
        v173 >>= 26;
      }
      while (v173);
    }
    v174 = (uint64_t)v165 + 4 * (v171 & 0x7FFFF);
    v177 = *(_DWORD *)(v174 + 64);
    v176 = (_DWORD *)(v174 + 64);
    v175 = v177;
    if (v177)
    {
      v178 = v165[4] + ((unint64_t)(v175 - 1) << 6);
      if (v166 - *(_QWORD *)(*(_QWORD *)v178 + 8) < *(_QWORD *)(*(_QWORD *)v178 + 16))
        goto LABEL_223;
    }
    v194 = *((unsigned int *)v165 + 10);
    if (!(_DWORD)v194)
      goto LABEL_264;
    v195 = v165[4];
    while (1)
    {
      v196 = v194 >> 1;
      v178 = v195 + (v194 >> 1 << 6);
      if (*(_QWORD *)(*(_QWORD *)v178 + 8) <= v166)
      {
        if (*(_QWORD *)(*(_QWORD *)v178 + 16) + *(_QWORD *)(*(_QWORD *)v178 + 8) > v166)
        {
          v216 = v165[4];
          v219 = v176;
          v197 = objc_msgSend(*(id *)v178, "isSpecialPhysFootprintRegion");
          v199 = v216;
          v198 = v219;
          if (v197)
            v200 = 0;
          else
            v200 = v178;
          if ((v197 & 1) != 0)
            goto LABEL_264;
          if ((*(_BYTE *)(*(_QWORD *)v200 + 132) & 1) == 0)
            goto LABEL_281;
          v201 = (id *)(v200 + 64);
          v202 = *((unsigned int *)v165 + 10) - ((uint64_t)(v200 + 64 - v165[4]) >> 6);
          if (!v202)
            goto LABEL_278;
          v214 = v18;
          while (1)
          {
            v203 = v202 >> 1;
            v204 = &v201[8 * (v202 >> 1)];
            if (*((_QWORD *)*v204 + 1) <= v170)
            {
              if (*((_QWORD *)*v204 + 2) + *((_QWORD *)*v204 + 1) > v170)
              {
                v209 = v200;
                v210 = objc_msgSend(*v204, "isSpecialPhysFootprintRegion");
                v200 = v209;
                v199 = v216;
                v198 = v219;
                if (v210)
                  v202 = 0;
                else
                  v202 = (unint64_t)v204;
LABEL_277:
                v18 = v214;
LABEL_278:
                if (v202)
                  v200 = v202;
                v178 = v200;
LABEL_281:
                *v198 = ((v200 - v199) >> 6) + 1;
LABEL_223:
                v179 = *(_DWORD *)(v178 + 20);
                if (v179)
                {
                  v180 = *(_QWORD *)(v178 + 8);
                  v181 = *v165;
                  v182 = *(unsigned int *)(v178 + 16);
                  v183 = (unint64_t *)(*v165 + 16 * v182);
                  if (v180)
                  {
                    if (*v183 > v170)
                      goto LABEL_264;
                    v184 = (_QWORD *)(v181 + 16 * (v179 + v182 - 1));
                    if (((v184[1] >> 5) & 0xFFFFFFFFFuLL) + *v184 <= v170)
                      goto LABEL_264;
                    v185 = (unsigned int *)(v180 + 4
                                                 * ((v170 - (*v183 & -*MEMORY[0x1E0C85AD8])) >> *MEMORY[0x1E0C85AC8]));
                    v186 = *v185;
                    v187 = (unint64_t *)(v181 + 16 * v186);
                    if (*v187 > v170)
                      goto LABEL_264;
                    v188 = v185[1];
                    if (v188 >= *((_DWORD *)v165 + 2)
                      || (v189 = (unint64_t *)(v181 + 16 * v188), v190 = *v189, *v189 > v170))
                    {
                      v191 = v188 - v186;
                      if (v191)
                      {
                        do
                        {
                          v192 = v191 >> 1;
                          v189 = &v187[2 * v192];
                          v190 = *v189;
                          if (*v189 <= v170)
                          {
                            if (((v187[2 * v192 + 1] >> 5) & 0xFFFFFFFFFLL) + v190 > v170)
                              goto LABEL_263;
                            v187 = v189 + 2;
                            LODWORD(v192) = --v191 >> 1;
                          }
                          v48 = v191 >= 2;
                          v191 = v192;
                        }
                        while (v48);
                      }
                      goto LABEL_264;
                    }
LABEL_263:
                    v205 = v189[1];
                    if ((v205 & 7) - 2 < 3)
                      goto LABEL_264;
                    v206 = ((unint64_t)v189 - v181) >> 4;
                    v207 = v165[2];
                    if (v170 - v190 >= v207)
                    {
                      if (((v205 >> 5) & 0xFFFFFFFFFLL) - (v170 - v190) > v207 || (_DWORD)v206 == -1)
                        goto LABEL_264;
                    }
                    else if ((_DWORD)v206 == -1)
                    {
                      goto LABEL_264;
                    }
                    v154 = *(void (**)(void))(a9 + 16);
LABEL_199:
                    v154();
                    goto LABEL_264;
                  }
                  do
                  {
                    v193 = v179 >> 1;
                    v189 = &v183[2 * v193];
                    v190 = *v189;
                    if (*v189 <= v170)
                    {
                      if (((v183[2 * v193 + 1] >> 5) & 0xFFFFFFFFFLL) + v190 > v170)
                        goto LABEL_263;
                      v183 = v189 + 2;
                      LODWORD(v193) = --v179 >> 1;
                    }
                    v48 = v179 >= 2;
                    v179 = v193;
                  }
                  while (v48);
                }
LABEL_264:
                v141 = (uint64_t *)((char *)v141 + v229);
                if ((unint64_t)v141 > v143)
                {
LABEL_183:

                  goto LABEL_184;
                }
                goto LABEL_187;
              }
              v201 = v204 + 8;
              v203 = --v202 >> 1;
            }
            v84 = v202 > 1;
            v202 = v203;
            if (!v84)
            {
              v202 = 0;
              goto LABEL_277;
            }
          }
        }
        v195 = v178 + 64;
        v196 = --v194 >> 1;
      }
      v48 = v194 >= 2;
      v194 = v196;
      if (!v48)
        goto LABEL_264;
    }
  }
}

_QWORD *__97__VMUKernelCoreMemoryScanner_scanLocalMemory_atOffset_node_length_isa_fieldInfo_stride_recorder___block_invoke(_QWORD *result, uint64_t a2, int a3, unsigned __int8 a4)
{
  _QWORD *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;

  v6 = result;
  v7 = *(_QWORD *)(result[5] + 8);
  v8 = *(_DWORD *)(v7 + 24);
  v9 = *(_QWORD *)(result[6] + 8);
  v10 = *(_DWORD *)(v9 + 24);
  if (v8 + 2 >= v10)
  {
    *(_DWORD *)(v9 + 24) = 2 * v10;
    result = malloc_type_realloc(*(void **)(*(_QWORD *)(result[4] + 296) + 8 * *((unsigned int *)result + 14)), 4 * *(unsigned int *)(*(_QWORD *)(result[6] + 8) + 24), 0x100004052888210uLL);
    v11 = *((unsigned int *)v6 + 14);
    *(_QWORD *)(*(_QWORD *)(v6[4] + 296) + 8 * v11) = result;
    v7 = *(_QWORD *)(v6[5] + 8);
    v8 = *(_DWORD *)(v7 + 24);
  }
  else
  {
    v11 = *((unsigned int *)result + 14);
  }
  v12 = *(_QWORD *)(*(_QWORD *)(v6[4] + 296) + 8 * v11);
  *(_DWORD *)(v7 + 24) = v8 + 1;
  *(_DWORD *)(v12 + 4 * v8) = a3 & 0xFFFFFF | (a4 << 24);
  return result;
}

- (void)_withOrderedNodeMapper:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD v12[4];
  _QWORD v13[4];
  _QWORD v14[3];
  int v15;
  _QWORD v16[3];
  int v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v17 = -1;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v15 = 0;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__VMUKernelCoreMemoryScanner__withOrderedNodeMapper___block_invoke;
    v6[3] = &unk_1E4E00E00;
    v8 = v16;
    v9 = v12;
    v10 = v14;
    v11 = v13;
    v6[4] = self;
    v7 = 0;
    (*((void (**)(id, _QWORD *))v4 + 2))(v4, v6);

    _Block_object_dispose(v12, 8);
    _Block_object_dispose(v13, 8);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);
  }

}

void __53__VMUKernelCoreMemoryScanner__withOrderedNodeMapper___block_invoke(_QWORD *a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unsigned int v21;
  unsigned int v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  void *v30;
  void *v31;
  id *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  int v43;
  int v44;
  _BOOL4 v45;
  uint64_t v46;
  id v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t *v53;
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  void *v58;
  int v59;
  id v60;
  id v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  _QWORD *v67;
  int v68;
  int v69;
  _BOOL4 v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  id v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  void *v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  unsigned int v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t *v91;
  uint64_t **v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  FILE *v96;
  uint64_t v97;
  uint64_t *v98;
  id v99;
  NSObject *v100;
  void (**v101)(_QWORD);
  void *v102;
  id v103;
  void (**v104)(void);
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t *v116;
  const char *v117;
  int v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  FILE *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  id v128;
  int v129;
  FILE *v130;
  FILE *v131;
  FILE *v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t (*v136)(uint64_t);
  void *v137;
  id v138;
  uint64_t *v139;
  uint64_t *v140;
  _QWORD v141[2];

  if (!a4)
    return;
  v6 = a1[4];
  if (*(_DWORD *)(v6 + 104) <= a2)
    return;
  v7 = (unint64_t *)(*(_QWORD *)(v6 + 96) + 16 * a2);
  v8 = v7[1];
  v9 = (v8 >> 5) & 0xFFFFFFFFFLL;
  if (!v9)
    return;
  v12 = *v7;
  v13 = v8 & 7;
  if (!a3)
  {
    v52 = *(unsigned int *)(*(_QWORD *)(a1[6] + 8) + 24);
    if ((_DWORD)v52 != -1 && *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) <= v12)
    {
      v53 = *(uint64_t **)(v6 + 112);
      v54 = *(id *)(v6 + 72);
      v55 = &v53[8 * v52];
      if (v55[6])
      {
        if ((uint64_t *)v55[7] == v55)
        {
          v134 = MEMORY[0x1E0C809B0];
          v135 = 3221225472;
          v136 = ___unmapRegion_block_invoke_0;
          v137 = &unk_1E4E011E0;
          v103 = v54;
          v138 = v54;
          v139 = v55;
          v140 = v53;
          v104 = (void (**)(void))MEMORY[0x1A85A995C](&v134);
          v104[2]();

          v54 = v103;
        }
        else
        {
          v56 = &v53[8 * v52];
          v56[5] = 0;
          v56[6] = 0;
          v56[7] = 0;
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = -1;
    }
  }
  if (v13 != 1)
  {
    if (!VMUGraphNodeType_IsVMRegion(v13))
    {
      if (v13 == 4)
      {
        v57 = objc_msgSend(*(id *)(a1[4] + 240), "threadStateForThreadNum:", *(_QWORD *)(*(_QWORD *)(a1[4] + 96) + 16 * a2 + 8) >> 41);
        if (v57)
          (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, v57);
        *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = -1;
      }
      return;
    }
    *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[4] + 96) + 16 * a2 + 8) >> 41;
    v32 = (id *)objc_retain(objc_retain(*(id *)(*(_QWORD *)(a1[4] + 112)
                                              + ((unint64_t)*(unsigned int *)(*(_QWORD *)(a1[8] + 8) + 24) << 6))));
    if (_shouldScanVMregion_onceToken != -1)
      dispatch_once(&_shouldScanVMregion_onceToken, &__block_literal_global_538);
    if (!_shouldScanVMregion_scanVMRegionWithUnknownPathsEnvVar
      && *((_BYTE *)v32 + 49)
      && (objc_msgSend(v32, "path"),
          v79 = (void *)objc_claimAutoreleasedReturnValue(),
          v80 = objc_msgSend(v79, "hasPrefix:", kVMUUnknownMappedFileNamePrefix[0]),
          v79,
          (v80 & 1) != 0)
      || (*((_DWORD *)v32 + 13) & 3) == 2)
    {

    }
    else
    {
      if (objc_msgSend(v32, "protection") != 1
        || *((_DWORD *)v32 + 26) == 1
        || objc_msgSend(v32[4], "isEqualToString:", CFSTR("MALLOC metadata")))
      {

LABEL_23:
        *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = objc_msgSend(v32, "address");
        v33 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
        *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v32, "length") + v33;
        v34 = a1[4];
        v35 = *(_QWORD *)(v34 + 112);
        v36 = *(unsigned int *)(*(_QWORD *)(a1[8] + 8) + 24);
        v37 = (uint64_t *)(v35 + (v36 << 6));
        v38 = *(void **)(v34 + 72);
        v129 = *(_DWORD *)(v34 + 120);
        v39 = *(id *)(v34 + 8);
        v40 = v38;
        if (!v37[6])
        {
          v123 = v36;
          v125 = v35;
          v41 = *v37;
          v42 = v40;
          if ((*(_BYTE *)(*v37 + 132) & 2) == 0)
          {
            objc_msgSend(v40, "taskIsTranslated");
            v40 = v42;
            v41 = *v37;
          }
          v134 = 0;
          v141[0] = 0;
          v43 = objc_msgSend(v40, "mapAddress:size:returnedAddress:returnedSize:", *(_QWORD *)(v41 + 8), *(_QWORD *)(v41 + 16), &v134, v141);
          if (v43)
          {
            if ((*(_DWORD *)(*v37 + 52) & 3u) - 1 >= 2)
            {
              v44 = v43;
              v45 = task_exists(v39);
              if ((_DWORD)v123 != v129 - 1 && v45)
              {
                v130 = (FILE *)*MEMORY[0x1E0C80C10];
                v119 = objc_msgSend((id)*v37, "address");
                v46 = *(unsigned int *)(*v37 + 24);
                v117 = vm_prot_strings_0[v46];
                v115 = *(_QWORD *)(*v37 + 16) + *(_QWORD *)(*v37 + 8);
                VMURegionTypeDescriptionForTagShareProtAndPager(*(unsigned __int8 *)(*v37 + 104), *(unsigned __int8 *)(*v37 + 50), v46, *(unsigned __int8 *)(*v37 + 49));
                v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v48 = (const char *)objc_msgSend(v47, "UTF8String");
                v49 = *(_QWORD *)(*v37 + 16) >> *MEMORY[0x1E0C85AC8];
                if (v49 == 1)
                  v50 = "page";
                else
                  v50 = "pages";
                if (*(_QWORD *)(v125 + (v123 << 6) + 24) == *(_QWORD *)(v125 + (v123 << 6) + 32))
                  v51 = "";
                else
                  v51 = " [root]";
                fprintf(v130, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v119, v115, v117, v48, v49, v50, v51, v44);

              }
            }
          }
          else
          {
            v109 = v141[0];
            v37[6] = v134;
            v110 = v125 + (v36 << 6);
            *(_QWORD *)(v110 + 40) = v109;
            *(_QWORD *)(v110 + 56) = v37;
          }
          v40 = v42;
        }

        v111 = *(_QWORD *)(*(_QWORD *)(a1[4] + 112)
                         + ((unint64_t)*(unsigned int *)(*(_QWORD *)(a1[8] + 8) + 24) << 6)
                         + 48);
        if (v111)
        {
          (*(void (**)(uint64_t, unint64_t))(a4 + 16))(a4, v111 + v12 - *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24));
          if (!a3)
            *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
        }
        goto LABEL_102;
      }
      v112 = *((_DWORD *)v32 + 26);

      if (v112 == 78)
        goto LABEL_23;
    }
LABEL_102:

    return;
  }
  for (;
        *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) <= v12;
        *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 112)
                                                                             + ((unint64_t)*(unsigned int *)(*(_QWORD *)(a1[8] + 8) + 24) << 6))
                                                                 + 16)
                                                     + *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 112)
                                                                         + ((unint64_t)++*(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24) << 6))
                                                             + 8);
  }
  v14 = a1[4];
  v15 = *(_QWORD *)(v14 + 112);
  v16 = *(unsigned int *)(*(_QWORD *)(a1[8] + 8) + 24);
  v17 = (id *)(v15 + (v16 << 6));
  if ((*((_DWORD *)*v17 + 13) & 3) != 2)
  {
    v18 = *(_QWORD *)(a1[7] + 8);
    v20 = *(_QWORD *)(v18 + 24);
    v19 = (_QWORD *)(v18 + 24);
    if (v20 >= v9 + v12)
    {
      v131 = *(FILE **)(*(_QWORD *)(a1[9] + 8) + 24);
      v58 = *(void **)(v14 + 72);
      v59 = *(_DWORD *)(v14 + 120);
      v60 = *(id *)(v14 + 8);
      v61 = v58;
      v62 = v16;
      v63 = v61;
      v126 = v62;
      v64 = v15 + (v62 << 6);
      v66 = *(_QWORD *)(v64 + 48);
      v65 = (_QWORD *)(v64 + 48);
      if (!v66)
      {
        v127 = v60;
        v67 = *v17;
        if ((*((_BYTE *)*v17 + 132) & 2) == 0)
        {
          objc_msgSend(v61, "taskIsTranslated");
          v67 = *v17;
        }
        v134 = 0;
        v141[0] = 0;
        v68 = objc_msgSend(v63, "mapAddress:size:returnedAddress:returnedSize:", v67[1], v67[2], &v134, v141);
        if (v68)
        {
          if ((*((_DWORD *)*v17 + 13) & 3u) - 1 >= 2)
          {
            v69 = v68;
            v70 = task_exists(v127);
            if ((_DWORD)v126 != v59 - 1 && v70)
            {
              v124 = (FILE *)*MEMORY[0x1E0C80C10];
              v120 = objc_msgSend(*v17, "address");
              v71 = *((unsigned int *)*v17 + 6);
              v72 = vm_prot_strings_0[v71];
              v73 = *((_QWORD *)*v17 + 2) + *((_QWORD *)*v17 + 1);
              VMURegionTypeDescriptionForTagShareProtAndPager(*((unsigned __int8 *)*v17 + 104), *((unsigned __int8 *)*v17 + 50), v71, *((unsigned __int8 *)*v17 + 49));
              v74 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v75 = (const char *)objc_msgSend(v74, "UTF8String");
              v76 = *((_QWORD *)*v17 + 2) >> *MEMORY[0x1E0C85AC8];
              if (v76 == 1)
                v77 = "page";
              else
                v77 = "pages";
              if (*(_QWORD *)(v15 + (v126 << 6) + 24) == *(_QWORD *)(v15 + (v126 << 6) + 32))
                v78 = "";
              else
                v78 = " [root]";
              fprintf(v124, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v120, v73, v72, v75, v76, v77, v78, v69);

            }
          }
        }
        else
        {
          v105 = v141[0];
          *v65 = v134;
          v106 = v15 + (v126 << 6);
          *(_QWORD *)(v106 + 40) = v105;
          *(_QWORD *)(v106 + 56) = v17;
        }
        v60 = v127;
      }

      v95 = *(_QWORD *)(a1[4] + 112);
      v86 = v126;
      v96 = v131;
      goto LABEL_93;
    }
    v21 = v16 + 1;
    do
    {
      v22 = v21;
      v23 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 112) + ((unint64_t)v21 << 6)) + 8);
      *v19 = v23[1] + *v23;
      ++v21;
      v24 = *(_QWORD *)(a1[7] + 8);
      v25 = *(_QWORD *)(v24 + 24);
      v19 = (_QWORD *)(v24 + 24);
    }
    while (v25 < v9 + v12);
    v26 = *(unsigned int *)(*(_QWORD *)(a1[8] + 8) + 24);
    v27 = v21 - v26;
    v28 = a1[4];
    v122 = v26;
    v114 = *(_QWORD *)(v28 + 112);
    v29 = (uint64_t *)(v114 + (v26 << 6));
    v30 = *(void **)(v28 + 72);
    if (a3 == 1)
      v31 = (void *)a1[5];
    else
      v31 = 0;
    v81 = v22;
    v121 = *(id *)(v28 + 8);
    v128 = v30;
    v132 = v31;
    v118 = v27;
    if (v27)
    {
      v82 = 0;
      v83 = v21 - v122;
      v84 = v29;
      do
      {
        v85 = *v84;
        v84 += 8;
        v82 += *(_QWORD *)(v85 + 16);
        --v83;
      }
      while (v83);
    }
    else
    {
      v82 = 0;
    }
    v86 = v21 - 1;
    v141[0] = 0;
    v133 = 0;
    v87 = (_QWORD *)objc_msgSend(v128, "findMappedAddress:size:", *(_QWORD *)(*v29 + 8), v82);
    if (v87)
    {
      v88 = v87[1];
      v89 = *(_QWORD *)(*v29 + 8) - *v87;
      v141[0] = v87[2] + v89;
      v133 = (uint64_t *)(v88 - v89);
    }
    else
    {
      v113 = v81;
      if (v118)
      {
        v97 = v21 - v122;
        v98 = v29;
        v116 = v29;
        do
        {
          v99 = v128;
          v100 = v132;
          if (v98[6])
          {
            if (v98 == (uint64_t *)v98[7])
            {
              v134 = MEMORY[0x1E0C809B0];
              v135 = 3221225472;
              v136 = ___unmapRegion_block_invoke_0;
              v137 = &unk_1E4E011E0;
              v138 = v99;
              v139 = v98;
              v140 = v29;
              v101 = (void (**)(_QWORD))MEMORY[0x1A85A995C](&v134);
              v102 = v101;
              if (v132)
                dispatch_async(v100, v101);
              else
                v101[2](v101);

              v29 = v116;
            }
            else
            {
              v98[5] = 0;
              v98[6] = 0;
              v98[7] = 0;
            }
          }

          v98 += 8;
          --v97;
        }
        while (v97);
      }
      v86 = v21 - 1;
      v81 = v113;
      if (objc_msgSend(v128, "mapAddress:size:returnedAddress:returnedSize:", *(_QWORD *)(*v29 + 8), v82, v141, &v133))
      {
        if (task_exists(v121))
          fprintf((FILE *)*MEMORY[0x1E0C80C10], "Failed to map remote region at [%#llx-%#llx]\n", *(_QWORD *)(*v29 + 8), *(_QWORD *)(*v29 + 8) + v82);
        goto LABEL_74;
      }
    }
    if (v118)
    {
      v90 = v133;
      v91 = (uint64_t *)v141[0];
      v92 = (uint64_t **)(v114 + (v122 << 6) + 56);
      v93 = v21 - v122;
      do
      {
        *(v92 - 1) = v91;
        *v92 = v29;
        *(v92 - 2) = v90;
        v94 = (uint64_t)(*(v92 - 7) + 1);
        v91 = (uint64_t *)((char *)v91 + (*(v92 - 7))[2]);
        v141[0] = v91;
        v90 = (uint64_t *)((char *)v90 - *(_QWORD *)(v94 + 8));
        v133 = v90;
        v92 += 8;
        --v93;
      }
      while (v93);
    }
LABEL_74:

    v95 = *(_QWORD *)(a1[4] + 112);
    v96 = *(FILE **)(*(_QWORD *)(v95 + (v81 << 6)) + 8);
LABEL_93:
    v107 = *(_QWORD *)(a1[8] + 8);
    v108 = *(_QWORD *)(v95 + ((unint64_t)*(unsigned int *)(v107 + 24) << 6) + 48);
    if (v108)
    {
      (*(void (**)(uint64_t, unint64_t))(a4 + 16))(a4, v108 + v12 - *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24));
      v107 = *(_QWORD *)(a1[8] + 8);
    }
    *(_DWORD *)(v107 + 24) = v86;
    *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = v96;
  }
}

- (void)scanNodesWithReferenceRecorder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t maxInteriorOffset;
  _QWORD v10[5];
  id v11;
  int v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A995C]();
  v6 = MEMORY[0x1E0C809B0];
  if (self->_referenceLogger
    || (maxInteriorOffset = self->_maxInteriorOffset, maxInteriorOffset != -1)
    && (!maxInteriorOffset || (maxInteriorOffset & ~(-1 << *MEMORY[0x1E0C85AC8])) != 0))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke;
    v13[3] = &unk_1E4E00E28;
    v13[4] = self;
    v14 = v4;
    v7 = MEMORY[0x1A85A995C](v13);

    v5 = (void *)v7;
  }
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_2;
  v10[3] = &unk_1E4E00F38;
  v12 = 0;
  v10[4] = self;
  v11 = v5;
  v8 = v5;
  -[VMUKernelCoreMemoryScanner _withOrderedNodeMapper:](self, "_withOrderedNodeMapper:", v10);
  -[VMUKernelCoreMemoryScanner unmapAllRegions](self, "unmapAllRegions");

}

uint64_t __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v6 = *(_QWORD **)(result + 32);
  if ((unint64_t)(a6 - *(_QWORD *)(v6[12] + 16 * a5)) <= v6[46])
  {
    v7 = result;
    if (v6[59])
    {
      v8 = (void *)MEMORY[0x1A85A9758]();
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(v7 + 32) + 472) + 16))();
      objc_autoreleasePoolPop(v8);
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v7 + 40) + 16))();
  }
  return result;
}

void __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  mach_vm_address_t *v15;
  mach_vm_address_t v16;
  _QWORD *v17;
  mach_vm_address_t v18;
  mach_vm_address_t v19;
  mach_vm_address_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  void *v33;
  int v34;
  int v35;
  int v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  _DWORD *v40;
  uint64_t *v41;
  unint64_t v42;
  unint64_t v43;
  BOOL v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unsigned int *v48;
  unint64_t v49;
  uint64_t v50;
  int v51;
  _DWORD *v52;
  int v53;
  uint64_t v54;
  unint64_t v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t *v60;
  _QWORD *v61;
  unsigned int *v62;
  uint64_t v63;
  unint64_t *v64;
  uint64_t v65;
  unint64_t *v66;
  unint64_t v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  int v74;
  unint64_t v75;
  id *v76;
  unint64_t v77;
  unint64_t v78;
  id *v79;
  BOOL v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  int v85;
  void (**v86)(_QWORD, _QWORD, _QWORD);
  mach_vm_address_t v87;
  mach_vm_size_t v88;
  mach_vm_size_t v89;
  mach_vm_address_t v90;
  mach_vm_address_t v91;
  int v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  unint64_t v98;
  void (**v99)(_QWORD, _QWORD, _QWORD);
  _QWORD *v100;
  _QWORD v101[5];
  id v102;
  uint64_t v103;
  int v104;
  _QWORD v105[5];
  id v106;
  int v107;
  _QWORD v108[5];
  id v109;
  id v110;
  mach_vm_size_t *v111;
  mach_vm_address_t *v112;
  mach_vm_address_t v113;
  mach_vm_address_t v114;
  int v115;
  mach_vm_size_t kcd_size[3];
  uint64_t v117;
  mach_vm_address_t kcd_addr_begin[4];
  _QWORD v119[5];
  id v120;
  int v121;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 104))
  {
    v5 = 0;
    v6 = MEMORY[0x1E0C809B0];
    v7 = &unk_1E4E00E98;
    do
    {
      v8 = *(_DWORD *)(*(_QWORD *)(v2 + 96) + 16 * v5 + 8);
      if (*(_QWORD *)(v2 + 480))
      {
        v9 = (void *)MEMORY[0x1A85A9758]();
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 480) + 16))();
        objc_autoreleasePoolPop(v9);
      }
      v10 = v8 & 7;
      if (v10 == 1)
      {
        v11 = *(unsigned int *)(a1 + 48);
        v119[0] = v6;
        v119[1] = 3221225472;
        v119[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_3;
        v119[3] = v7;
        v12 = *(void **)(a1 + 40);
        v119[4] = *(_QWORD *)(a1 + 32);
        v121 = v5;
        v120 = v12;
        (*(void (**)(uint64_t, unint64_t, uint64_t, _QWORD *))(a2 + 16))(a2, v5, v11, v119);
        v13 = v120;
      }
      else
      {
        if (VMUGraphNodeType_IsVMRegion(v8 & 7))
        {
          v14 = *(_QWORD *)(a1 + 32);
          v15 = (mach_vm_address_t *)(*(_QWORD *)(v14 + 96) + 16 * v5);
          v16 = *v15;
          v19 = v15[1];
          v17 = v15 + 1;
          v18 = v19;
          kcd_addr_begin[0] = 0;
          kcd_addr_begin[1] = (mach_vm_address_t)kcd_addr_begin;
          kcd_addr_begin[2] = 0x2020000000;
          kcd_addr_begin[3] = v16;
          kcd_size[0] = 0;
          kcd_size[1] = (mach_vm_size_t)kcd_size;
          kcd_size[2] = 0x2020000000;
          v117 = 0;
          v117 = (*v17 >> 5) & 0xFFFFFFFFFLL;
          if (v117)
          {
            v20 = ((v18 >> 5) & 0xFFFFFFFFFLL) + v16;
            v21 = *(id *)(*(_QWORD *)(v14 + 112) + ((*v17 >> 35) & 0x1FFFFFC0));
            v22 = (void *)MEMORY[0x1A85A995C](*(_QWORD *)(a1 + 40));
            v23 = *(unsigned int *)(a1 + 48);
            v108[0] = v6;
            v108[1] = 3221225472;
            v108[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_6;
            v108[3] = &unk_1E4E00EE8;
            v113 = v16;
            v114 = v20;
            v108[4] = *(_QWORD *)(a1 + 32);
            v111 = kcd_size;
            v112 = kcd_addr_begin;
            v115 = v5;
            v24 = v22;
            v110 = v24;
            v25 = v21;
            v109 = v25;
            (*(void (**)(uint64_t, unint64_t, uint64_t, _QWORD *))(a2 + 16))(a2, v5, v23, v108);

          }
          _Block_object_dispose(kcd_size, 8);
          _Block_object_dispose(kcd_addr_begin, 8);
          goto LABEL_15;
        }
        if (v10 == 3)
        {
          v28 = *(_QWORD *)(a1 + 32);
          v29 = *(void **)(a1 + 40);
          v30 = *(_QWORD *)(*(_QWORD *)(v28 + 96) + 16 * v5);
          v101[0] = v6;
          v101[1] = 3221225472;
          v101[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_8;
          v101[3] = &unk_1E4E00F10;
          v101[4] = v28;
          v31 = v29;
          v104 = v5;
          v102 = v31;
          v103 = v30;
          v32 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85A995C](v101);
          if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isCore"))
          {
            kcd_addr_begin[0] = 0;
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "memoryCache");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = -[VMUTaskMemoryCache getCoreFileUdataPointersIntoBuffer:count:]((uint64_t)v33, 0, kcd_addr_begin);

            if (!v34 && kcd_addr_begin[0])
            {
              if (kcd_addr_begin[0] >> 61)
              {
                NSLog(CFSTR("Failed to get udata pointers for core file."));
              }
              else
              {
                v93 = malloc_type_malloc(8 * kcd_addr_begin[0], 0x919865E5uLL);
                if (v93)
                {
                  v94 = v93;
                  v95 = v7;
                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "memoryCache");
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  v97 = -[VMUTaskMemoryCache getCoreFileUdataPointersIntoBuffer:count:]((uint64_t)v96, (uint64_t)v94, kcd_addr_begin);

                  if (!v97)
                    ((void (**)(_QWORD, void *, mach_vm_address_t))v32)[2](v32, v94, kcd_addr_begin[0]);
                  free(v94);
                  v7 = v95;
                }
              }
            }
LABEL_103:

            v13 = v102;
            goto LABEL_7;
          }
          kcd_addr_begin[0] = 0;
          kcd_size[0] = 0;
          if (!task_map_corpse_info_64(*MEMORY[0x1E0C83DA0], objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "taskPort"), kcd_addr_begin, kcd_size))
          {
            v86 = v32;
            v87 = kcd_addr_begin[0];
            v88 = kcd_size[0];
            v89 = kcd_size[0] + kcd_addr_begin[0];
            v90 = kcd_addr_begin[0] + 16;
            if (v87 + 16 <= kcd_size[0] + v87
              && v90 + *(unsigned int *)(kcd_addr_begin[0] + 4) <= v89
              && *(_DWORD *)kcd_addr_begin[0] == -559025833)
            {
              do
              {
                v91 = v90 + *(unsigned int *)(v87 + 4);
                if (v91 > v89)
                  break;
                v92 = *(_DWORD *)v87;
                if (*(_DWORD *)v87 == -242132755)
                  break;
                if ((v92 == 17 || (v92 & 0xFFFFFFF0) == 0x20) && HIDWORD(*(_QWORD *)(v87 + 8)) == 2076)
                {
                  v86[2](v86, v87 + 16, *(_QWORD *)(v87 + 8));
                  v91 = v90 + *(unsigned int *)(v87 + 4);
                }
                v90 = v91 + 16;
                v87 = v91;
              }
              while (v91 + 16 <= v89);
              v87 = kcd_addr_begin[0];
              v88 = kcd_size[0];
            }
            mach_vm_deallocate(*MEMORY[0x1E0C83DA0], v87, v88);
            v32 = v86;
LABEL_102:
            v7 = &unk_1E4E00E98;
            goto LABEL_103;
          }
          objc_msgSend(*(id *)(a1 + 32), "pid");
          v35 = proc_list_uptrs();
          if (v35 < 1)
            goto LABEL_102;
          v36 = v35;
          v99 = v32;
          v37 = malloc_type_malloc((8 * v35), 0xE235CBCAuLL);
          objc_msgSend(*(id *)(a1 + 32), "pid");
          proc_list_uptrs();
          v38 = v37;
          v39 = 0;
          v40 = (_DWORD *)MEMORY[0x1E0C85AC8];
          v100 = v37;
LABEL_25:
          v41 = *(uint64_t **)(*(_QWORD *)(a1 + 32) + 128);
          v42 = v41[6];
          v43 = v41[7];
          v44 = v43 >= v42;
          v45 = v43 - v42;
          if (!v44)
            goto LABEL_75;
          v46 = v38[v39];
          if (v46 - v42 >= v45)
            goto LABEL_75;
          v47 = v46 >> *v40;
          if (v47)
          {
            v48 = (unsigned int *)v41[3];
            v49 = v46 >> *v40;
            do
            {
              if (*v48 <= (v49 & 0x3FFFFFF)
                || ((*((unsigned __int8 *)v48 + ((v49 & 0x3FFFFFF) >> 3) + 4) >> (v49 & 7)) & 1) == 0)
              {
                goto LABEL_75;
              }
              v49 >>= 26;
            }
            while (v49);
          }
          v50 = (uint64_t)v41 + 4 * (v47 & 0x7FFFF);
          v53 = *(_DWORD *)(v50 + 64);
          v52 = (_DWORD *)(v50 + 64);
          v51 = v53;
          v54 = v41[4];
          if (v53)
          {
            v55 = v54 + ((unint64_t)(v51 - 1) << 6);
            if (v46 - *(_QWORD *)(*(_QWORD *)v55 + 8) < *(_QWORD *)(*(_QWORD *)v55 + 16))
              goto LABEL_35;
          }
          v71 = *((unsigned int *)v41 + 10);
          if (!(_DWORD)v71)
            goto LABEL_75;
          v72 = v41[4];
          while (1)
          {
            v73 = v71 >> 1;
            v55 = v72 + (v71 >> 1 << 6);
            if (*(_QWORD *)(*(_QWORD *)v55 + 8) <= v46)
            {
              if (*(_QWORD *)(*(_QWORD *)v55 + 16) + *(_QWORD *)(*(_QWORD *)v55 + 8) > v46)
              {
                v74 = objc_msgSend(*(id *)v55, "isSpecialPhysFootprintRegion");
                v38 = v100;
                v40 = (_DWORD *)MEMORY[0x1E0C85AC8];
                if (v74)
                  v75 = 0;
                else
                  v75 = v55;
                if ((v74 & 1) != 0)
                  goto LABEL_75;
                if ((*(_BYTE *)(*(_QWORD *)v75 + 132) & 1) == 0)
                  goto LABEL_89;
                v76 = (id *)(v75 + 64);
                v77 = *((unsigned int *)v41 + 10) - ((uint64_t)(v75 + 64 - v41[4]) >> 6);
                if (!v77)
                  goto LABEL_86;
                while (2)
                {
                  v78 = v77 >> 1;
                  v79 = &v76[8 * (v77 >> 1)];
                  if (*((_QWORD *)*v79 + 1) > v46)
                  {
LABEL_69:
                    v80 = v77 > 1;
                    v77 = v78;
                    if (!v80)
                    {
                      v77 = 0;
                      goto LABEL_86;
                    }
                    continue;
                  }
                  break;
                }
                if (*((_QWORD *)*v79 + 2) + *((_QWORD *)*v79 + 1) <= v46)
                {
                  v76 = v79 + 8;
                  v78 = --v77 >> 1;
                  goto LABEL_69;
                }
                v98 = v75;
                v85 = objc_msgSend(*v79, "isSpecialPhysFootprintRegion");
                v75 = v98;
                v38 = v100;
                v40 = (_DWORD *)MEMORY[0x1E0C85AC8];
                if (v85)
                  v77 = 0;
                else
                  v77 = (unint64_t)v79;
LABEL_86:
                if (v77)
                  v75 = v77;
                v55 = v75;
LABEL_89:
                *v52 = ((v75 - v54) >> 6) + 1;
LABEL_35:
                v56 = *(_DWORD *)(v55 + 20);
                if (v56)
                {
                  v57 = *(_QWORD *)(v55 + 8);
                  v58 = *v41;
                  v59 = *(unsigned int *)(v55 + 16);
                  v60 = (unint64_t *)(*v41 + 16 * v59);
                  if (v57)
                  {
                    if (*v60 > v46)
                      goto LABEL_75;
                    v61 = (_QWORD *)(v58 + 16 * (v56 + v59 - 1));
                    if (((v61[1] >> 5) & 0xFFFFFFFFFuLL) + *v61 <= v46)
                      goto LABEL_75;
                    v62 = (unsigned int *)(v57 + 4 * ((v46 - (*v60 & -*MEMORY[0x1E0C85AD8])) >> *v40));
                    v63 = *v62;
                    v64 = (unint64_t *)(v58 + 16 * v63);
                    if (*v64 > v46)
                      goto LABEL_75;
                    v65 = v62[1];
                    if (v65 < *((_DWORD *)v41 + 2))
                    {
                      v66 = (unint64_t *)(v58 + 16 * v65);
                      v67 = *v66;
                      if (*v66 <= v46)
                      {
LABEL_71:
                        v81 = v66[1];
                        if ((v81 & 7) - 2 < 3)
                          goto LABEL_75;
                        v82 = ((unint64_t)v66 - v58) >> 4;
                        v83 = v41[2];
                        if (v46 - v67 >= v83)
                        {
                          if (((v81 >> 5) & 0xFFFFFFFFFLL) - (v46 - v67) > v83 || (_DWORD)v82 == -1)
                            goto LABEL_75;
                        }
                        else if ((_DWORD)v82 == -1)
                        {
                          goto LABEL_75;
                        }
                        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
                        v38 = v100;
                        v40 = (_DWORD *)MEMORY[0x1E0C85AC8];
                        goto LABEL_75;
                      }
                    }
                    v68 = v65 - v63;
                    if (v68)
                    {
                      do
                      {
                        v69 = v68 >> 1;
                        v66 = &v64[2 * v69];
                        v67 = *v66;
                        if (*v66 <= v46)
                        {
                          if (((v64[2 * v69 + 1] >> 5) & 0xFFFFFFFFFLL) + v67 > v46)
                            goto LABEL_71;
                          v64 = v66 + 2;
                          LODWORD(v69) = --v68 >> 1;
                        }
                        v44 = v68 >= 2;
                        v68 = v69;
                      }
                      while (v44);
                    }
                  }
                  else
                  {
                    do
                    {
                      v70 = v56 >> 1;
                      v66 = &v60[2 * v70];
                      v67 = *v66;
                      if (*v66 <= v46)
                      {
                        if (((v60[2 * v70 + 1] >> 5) & 0xFFFFFFFFFLL) + v67 > v46)
                          goto LABEL_71;
                        v60 = v66 + 2;
                        LODWORD(v70) = --v56 >> 1;
                      }
                      v44 = v56 >= 2;
                      v56 = v70;
                    }
                    while (v44);
                  }
                }
LABEL_75:
                if (++v39 == v36)
                {
                  free(v38);
                  v6 = MEMORY[0x1E0C809B0];
                  v32 = v99;
                  goto LABEL_102;
                }
                goto LABEL_25;
              }
              v72 = v55 + 64;
              v73 = --v71 >> 1;
            }
            v44 = v71 >= 2;
            v71 = v73;
            if (!v44)
              goto LABEL_75;
          }
        }
        if (v10 != 4)
          goto LABEL_15;
        v26 = *(unsigned int *)(a1 + 48);
        v105[0] = v6;
        v105[1] = 3221225472;
        v105[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_7;
        v105[3] = v7;
        v27 = *(void **)(a1 + 40);
        v105[4] = *(_QWORD *)(a1 + 32);
        v107 = v5;
        v106 = v27;
        (*(void (**)(uint64_t, unint64_t, uint64_t, _QWORD *))(a2 + 16))(a2, v5, v26, v105);
        v13 = v106;
      }
LABEL_7:

LABEL_15:
      ++v5;
      v2 = *(_QWORD *)(a1 + 32);
    }
    while (v5 < *(unsigned int *)(v2 + 104));
  }
}

void __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  const void *v9;
  size_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  int v30;
  _QWORD __compar[4];
  int v32;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned int *)(a1 + 48);
  v6 = *(_QWORD *)(*(_QWORD *)(v4 + 96) + 16 * v5 + 8);
  v7 = (v6 >> 5) & 0xFFFFFFFFFLL;
  if (v7 >= 0x100
    && (*(_DWORD *)a2 == -1583242847 && !strncmp((const char *)(a2 + 4), "AUTORELEASE!", 0xCuLL)
     || v7 == 10240
     && *(_DWORD *)(a2 + 2048) == -1583242847
     && !strncmp((const char *)(a2 + 2052), "AUTORELEASE!", 0xCuLL)))
  {
    v19 = *(_BYTE *)(v4 + 364);
    *(_DWORD *)(v4 + 316) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 364) = 0;
    v20 = *(_QWORD *)(a1 + 32);
    v21 = (uint64_t *)(*(_QWORD *)(v20 + 96) + 16 * *(unsigned int *)(a1 + 48));
    v22 = *v21;
    v23 = ((unint64_t)v21[1] >> 5) & 0xFFFFFFFFFLL;
    v24 = *(_QWORD *)(a2 + *(unsigned int *)objc_msgSend(*(id *)(v20 + 80), "autoreleasePoolPageLayout")) - v22;
    if (v23 < v24)
      v24 = v23;
    if (v24 >= 0x4000)
      v25 = 0x4000;
    else
      v25 = v24;
    -[VMUKernelCoreMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:](*(_QWORD *)(a1 + 32), a2, 0, *(_DWORD *)(a1 + 48), v25, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16 * *(unsigned int *)(a1 + 48) + 8) >> 41, 0, 8u, *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 364) = v19;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 316) = 0;
  }
  else
  {
    objc_msgSend((id)v4, "zoneNameForNode:", v5);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "containsObject:") & 1) == 0)
      -[VMUKernelCoreMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:](*(_QWORD *)(a1 + 32), a2, 0, *(_DWORD *)(a1 + 48), (v6 >> 5) & 0xFFFFFFFFFLL, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16 * *(unsigned int *)(a1 + 48) + 8) >> 41, 0, 1u, *(_QWORD *)(a1 + 40));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(const void **)(v8 + 256);
    v10 = *(unsigned int *)(v8 + 264);
    v11 = MEMORY[0x1E0C809B0];
    __compar[0] = MEMORY[0x1E0C809B0];
    __compar[1] = 3221225472;
    __compar[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_4;
    __compar[3] = &__block_descriptor_36_e15_i24__0r_v8r_v16l;
    v32 = *(_DWORD *)(a1 + 48);
    v12 = bsearch_b(0, v9, v10, 0x10uLL, __compar);
    if (v12)
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(a1 + 40);
      v15 = *(unsigned int *)(a1 + 48);
      v16 = *(void **)(*(_QWORD *)(v13 + 272) + ((*(_QWORD *)(*(_QWORD *)(v13 + 96) + 16 * v15 + 8) >> 38) & 0x3FFFFF8));
      v17 = v12[1];
      v27[0] = v11;
      v27[1] = 3221225472;
      v27[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_5;
      v27[3] = &unk_1E4E00E70;
      v27[4] = v13;
      v29 = a2;
      v30 = v15;
      v28 = v14;
      v18 = v16;
      objc_msgSend(v18, "enumerateStoredEntriesForObject:ofSize:externalValues:block:", a2, v6 >> 5, v17, v27);

    }
  }
}

uint64_t __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_4(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  BOOL v4;
  _BOOL4 v5;

  v3 = *(unsigned int *)(a1 + 32);
  v4 = *a3 > v3;
  v5 = *a3 != v3;
  if (v4)
    return 0xFFFFFFFFLL;
  else
    return v5;
}

void __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_5(uint64_t a1, void *a2, unsigned int a3, unsigned int a4)
{
  -[VMUKernelCoreMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), a3, *(_DWORD *)(a1 + 56), a4, 0, a2, 1u, *(_QWORD *)(a1 + 40));
}

void __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_6(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _DWORD *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  char v16;
  BOOL v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;

  if (*MEMORY[0x1E0C85AA8] >= *MEMORY[0x1E0C85AD8])
    v4 = *MEMORY[0x1E0C85AD8];
  else
    v4 = *MEMORY[0x1E0C85AA8];
  if (*MEMORY[0x1E0C85AA0] >= *MEMORY[0x1E0C85AC0])
    v5 = *MEMORY[0x1E0C85AC0];
  else
    v5 = *MEMORY[0x1E0C85AA0];
  v6 = *(_QWORD *)(a1 + 72) & ~v5;
  v7 = ((*(_QWORD *)(a1 + 80) + v5) & ~v5) - v6;
  v30 = v7 / v4;
  v8 = malloc_type_malloc(4 * (v7 / v4) + 4, 0x100004052888210uLL);
  v8[v7 / v4] = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "memoryCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "machVMPageRangeQueryWithAddress:size:dispositions:dispositionsCount:", v6, v7, v8, &v30);

  if ((_DWORD)v6)
  {
    free(v8);
  }
  else
  {
    v29 = a2;
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24);
    if (v11)
    {
      v12 = ~v5;
      v13 = *(_QWORD *)(a1 + 72) & ~v5;
      v14 = -1;
      v15 = (char *)v8;
      do
      {
        v16 = *v15;
        v15 += 4;
        v17 = (v16 & 0x11) == 0 || v13 >= *(_QWORD *)(a1 + 80);
        v18 = !v17;
        if (v17)
        {
          v19 = *(_QWORD *)(a1 + 64);
          if (v14 == -1)
          {
            v20 = *(_QWORD *)(*(_QWORD *)(v19 + 8) + 24);
            if (v13 > v20)
            {
              if (v11 >= v13 - v20)
                v21 = v13 - v20;
              else
                v21 = v11;
              -[VMUKernelCoreMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:](*(_QWORD *)(a1 + 32), v29, v20 - *(_QWORD *)(a1 + 72), *(_DWORD *)(a1 + 88), v21, 0, 0, 8u, *(_QWORD *)(a1 + 48));
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += v21;
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) -= v21;
              v19 = *(_QWORD *)(a1 + 64);
            }
          }
          v22 = *(_QWORD *)(v19 + 8);
          v23 = *(_QWORD *)(v22 + 24);
          *(_QWORD *)(v22 + 24) = (v23 & v12) + v4;
          v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) - v23;
          v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v26 = *(_QWORD *)(v25 + 24);
          v17 = v26 >= v24;
          v27 = v26 - v24;
          if (!v17)
            v27 = 0;
          *(_QWORD *)(v25 + 24) = v27;
          v10 = *(_QWORD *)(a1 + 56);
        }
        if (v14 >= v13)
          v28 = v13;
        else
          v28 = v14;
        if (v18)
          v14 = -1;
        else
          v14 = v28;
        v13 += v4;
        v11 = *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24);
      }
      while (v11);
    }
    free(v8);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 49))
      objc_msgSend(*(id *)(a1 + 32), "clearCrashReporterInfoForMappedFileRegion");
  }
}

void __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_7(uint64_t a1, uint64_t a2)
{
  -[VMUKernelCoreMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:](*(_QWORD *)(a1 + 32), a2, 0, *(_DWORD *)(a1 + 48), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "threadStateSize"), 0, 0, 8u, *(_QWORD *)(a1 + 40));
}

uint64_t __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_8(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  int *v8;
  uint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int *v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  _DWORD *v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t *v28;
  _QWORD *v29;
  unsigned int *v30;
  uint64_t v31;
  unint64_t *v32;
  uint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t *v42;
  unint64_t v43;
  uint64_t *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t *v47;
  BOOL v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  _DWORD *v52;
  int *v53;

  if (!a3)
    return result;
  v5 = result;
  v6 = 0;
  v7 = (_DWORD *)MEMORY[0x1E0C85AC8];
  v8 = &OBJC_IVAR___VMUVMRegion_range;
  do
  {
    v9 = *(uint64_t **)(*(_QWORD *)(v5 + 32) + 128);
    v10 = v9[6];
    v11 = v9[7];
    v12 = v11 >= v10;
    v13 = v11 - v10;
    if (!v12)
      goto LABEL_53;
    v14 = *(_QWORD *)(a2 + 8 * v6);
    if (v14 - v10 >= v13)
      goto LABEL_53;
    v15 = v14 >> *v7;
    if (v15)
    {
      v16 = (unsigned int *)v9[3];
      v17 = v14 >> *v7;
      do
      {
        if (*v16 <= (v17 & 0x3FFFFFF)
          || ((*((unsigned __int8 *)v16 + ((v17 & 0x3FFFFFF) >> 3) + 4) >> (v17 & 7)) & 1) == 0)
        {
          goto LABEL_53;
        }
        v17 >>= 26;
      }
      while (v17);
    }
    v18 = (uint64_t)v9 + 4 * (v15 & 0x7FFFF);
    v21 = *(_DWORD *)(v18 + 64);
    v20 = (_DWORD *)(v18 + 64);
    v19 = v21;
    v22 = v9[4];
    if (v21)
    {
      v23 = v22 + ((unint64_t)(v19 - 1) << 6);
      if (v14 - *(_QWORD *)(*(_QWORD *)v23 + *v8) < *(_QWORD *)(*(_QWORD *)v23 + *v8 + 8))
        goto LABEL_13;
    }
    v39 = *((unsigned int *)v9 + 10);
    if (!(_DWORD)v39)
      goto LABEL_53;
    v40 = v9[4];
    while (1)
    {
      v41 = v39 >> 1;
      v23 = v40 + (v39 >> 1 << 6);
      result = *(_QWORD *)v23;
      v42 = (unint64_t *)(*(_QWORD *)v23 + *v8);
      if (*v42 <= v14)
        break;
LABEL_36:
      v12 = v39 >= 2;
      v39 = v41;
      if (!v12)
        goto LABEL_53;
    }
    if (v42[1] + *v42 <= v14)
    {
      v40 = v23 + 64;
      v41 = --v39 >> 1;
      goto LABEL_36;
    }
    result = objc_msgSend((id)result, "isSpecialPhysFootprintRegion");
    v8 = &OBJC_IVAR___VMUVMRegion_range;
    v7 = (_DWORD *)MEMORY[0x1E0C85AC8];
    if ((_DWORD)result)
      v43 = 0;
    else
      v43 = v23;
    if ((result & 1) != 0)
      goto LABEL_53;
    if ((*(_BYTE *)(*(_QWORD *)v43 + 132) & 1) == 0)
      goto LABEL_67;
    v44 = (uint64_t *)(v43 + 64);
    v45 = *((unsigned int *)v9 + 10) - ((uint64_t)(v43 + 64 - v9[4]) >> 6);
    if (!v45)
      goto LABEL_64;
    while (2)
    {
      v46 = v45 >> 1;
      v47 = &v44[8 * (v45 >> 1)];
      result = *v47;
      if (*(_QWORD *)(*v47 + 8) > v14)
      {
LABEL_47:
        v48 = v45 > 1;
        v45 = v46;
        if (!v48)
        {
          v45 = 0;
          goto LABEL_64;
        }
        continue;
      }
      break;
    }
    if (*(_QWORD *)(*v47 + 16) + *(_QWORD *)(*v47 + 8) <= v14)
    {
      v44 = v47 + 8;
      v46 = --v45 >> 1;
      goto LABEL_47;
    }
    result = objc_msgSend((id)result, "isSpecialPhysFootprintRegion");
    v8 = &OBJC_IVAR___VMUVMRegion_range;
    v7 = (_DWORD *)MEMORY[0x1E0C85AC8];
    if ((_DWORD)result)
      v45 = 0;
    else
      v45 = (unint64_t)v47;
LABEL_64:
    if (v45)
      v43 = v45;
    v23 = v43;
LABEL_67:
    *v20 = ((v43 - v22) >> 6) + 1;
LABEL_13:
    v24 = *(_DWORD *)(v23 + 20);
    if (v24)
    {
      v25 = *(_QWORD *)(v23 + 8);
      v26 = *v9;
      v27 = *(unsigned int *)(v23 + 16);
      v28 = (unint64_t *)(*v9 + 16 * v27);
      if (v25)
      {
        if (*v28 > v14)
          goto LABEL_53;
        v29 = (_QWORD *)(v26 + 16 * (v24 + v27 - 1));
        if (((v29[1] >> 5) & 0xFFFFFFFFFuLL) + *v29 <= v14)
          goto LABEL_53;
        v30 = (unsigned int *)(v25 + 4 * ((v14 - (*v28 & -*MEMORY[0x1E0C85AD8])) >> *v7));
        v31 = *v30;
        v32 = (unint64_t *)(v26 + 16 * v31);
        if (*v32 > v14)
          goto LABEL_53;
        v33 = v30[1];
        if (v33 < *((_DWORD *)v9 + 2))
        {
          v34 = (unint64_t *)(v26 + 16 * v33);
          v35 = *v34;
          if (*v34 <= v14)
          {
LABEL_49:
            v49 = v34[1];
            if ((v49 & 7) - 2 < 3)
              goto LABEL_53;
            v50 = ((unint64_t)v34 - v26) >> 4;
            v51 = v9[2];
            if (v14 - v35 >= v51)
            {
              if (((v49 >> 5) & 0xFFFFFFFFFLL) - (v14 - v35) > v51 || (_DWORD)v50 == -1)
                goto LABEL_53;
            }
            else if ((_DWORD)v50 == -1)
            {
              goto LABEL_53;
            }
            v52 = v7;
            v53 = v8;
            result = (*(uint64_t (**)(void))(*(_QWORD *)(v5 + 40) + 16))();
            v8 = v53;
            v7 = v52;
            goto LABEL_53;
          }
        }
        v36 = v33 - v31;
        if (v36)
        {
          do
          {
            v37 = v36 >> 1;
            v34 = &v32[2 * v37];
            v35 = *v34;
            if (*v34 <= v14)
            {
              if (((v32[2 * v37 + 1] >> 5) & 0xFFFFFFFFFLL) + v35 > v14)
                goto LABEL_49;
              v32 = v34 + 2;
              LODWORD(v37) = --v36 >> 1;
            }
            v12 = v36 >= 2;
            v36 = v37;
          }
          while (v12);
        }
      }
      else
      {
        do
        {
          v38 = v24 >> 1;
          v34 = &v28[2 * v38];
          v35 = *v34;
          if (*v34 <= v14)
          {
            if (((v28[2 * v38 + 1] >> 5) & 0xFFFFFFFFFLL) + v35 > v14)
              goto LABEL_49;
            v28 = v34 + 2;
            LODWORD(v38) = --v24 >> 1;
          }
          v12 = v24 >= 2;
          v24 = v38;
        }
        while (v12);
      }
    }
LABEL_53:
    ++v6;
  }
  while (v6 != a3);
  return result;
}

- (unsigned)_removeFalsePositiveLeakedVMregionsFromNodes:(unsigned int *)a3 nodeCount:(unsigned int)a4 recorder:(id)a5
{
  void (**v8)(_QWORD);
  char *v9;
  _BOOL4 v10;
  uint64_t blocksCount;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  int v22;
  uint64_t v23;
  unsigned int v24;
  id *v25;
  int v26;
  int v27;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  int v32;
  _BOOL4 v33;
  void (**v34)(_QWORD);
  unsigned int v35;
  char v36;

  v8 = (void (**)(_QWORD))a5;
  if (!a4)
  {
    v35 = 0;
    goto LABEL_5;
  }
  v9 = getenv("DT_REPORT_IOKIT_REGION_LEAKS");
  if (v9)
    v10 = ((*v9 - 89) & 0xDF) == 0;
  else
    v10 = 0;
  blocksCount = self->_blocksCount;
  if ((_DWORD)blocksCount)
  {
    v13 = 0;
    v14 = (uint64_t *)self->_blocks + 1;
    do
    {
      v15 = *v14;
      v14 += 2;
      if ((v15 & 7) == 3)
        break;
      ++v13;
    }
    while (blocksCount != v13);
  }
  v16 = 0;
  v36 = 0;
  v35 = 0;
  if (a4 <= 1)
    v17 = 1;
  else
    v17 = a4;
  v31 = -1;
  v34 = v8;
  v18 = 0xFFFFFFFFLL;
  v33 = v10;
  do
  {
    v19 = a3[v16];
    if (!(_DWORD)v19 || !VMUGraphNodeType_IsVMRegion(*((_DWORD *)&self->_blocks[v19] + 2) & 7))
      goto LABEL_48;
    v20 = (unsigned __int8 *)objc_retain(*(id *)((char *)&self->_regions->var0
                                               + ((*((_QWORD *)&self->_blocks[v19] + 1) >> 35) & 0x1FFFFFC0)));
    v21 = v20;
    v22 = *((_DWORD *)v20 + 26);
    if (v22 > 87)
    {
      if (v22 == 88 || v22 == 100)
      {
LABEL_23:
        if (v10)
        {
          if ((v36 & 1) != 0)
          {
            v36 = 1;
          }
          else
          {
            v36 = 1;
            fwrite("The DT_REPORT_IOKIT_REGION_LEAKS env var is set so leaked IOKit, IOSurface, or IOAccelerator regions will be reported, if -vmalso is passed to 'leaks'\n", 0x97uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
          }
        }
        else
        {
          v8[2](v8);
        }
LABEL_46:
        v19 = v18;
        goto LABEL_47;
      }
    }
    else if (v22)
    {
      if (v22 == 21)
        goto LABEL_23;
    }
    else if (v20[50] == 5)
    {
      goto LABEL_23;
    }
    if ((_DWORD)v19 == 1)
      goto LABEL_46;
    v23 = (16 * (v19 - 1)) | 8;
    v32 = v19 - 1;
    v24 = v19 - 1;
    while (1)
    {
      if (!VMUGraphNodeType_IsVMRegion(*(_DWORD *)((_BYTE *)&self->_blocks->var0 + v23) & 7))
      {
        a3[v35++] = v19;
LABEL_51:
        v19 = v18;
        v8 = v34;
        v10 = v33;
        goto LABEL_47;
      }
      v25 = (id *)objc_retain(*(id *)((char *)&self->_regions->var0
                                    + ((*(unint64_t *)((char *)&self->_blocks->var0 + v23) >> 35) & 0x1FFFFFC0)));
      if ((objc_msgSend(v25, "isSubmap") & 1) != 0)
        goto LABEL_43;
      v26 = *((_DWORD *)v25 + 26);
      v27 = *((_DWORD *)v21 + 26);
      if (v26 == v27
        && *((unsigned __int8 *)v25 + 49) == v21[49]
        && (v26 == 64 || (char *)v25[1] + (_QWORD)v25[2] == (char *)*((_QWORD *)v21 + 1)))
      {
        break;
      }
      if (!(v27 | v26)
        && (char *)v25[1] + (_QWORD)v25[2] == (char *)*((_QWORD *)v21 + 1)
        && objc_msgSend(*((id *)v21 + 4), "isEqualToString:", VMUmappedFileLabel[0])
        && objc_msgSend(v25[4], "isEqualToString:", CFSTR("__LINKEDIT"))
        && objc_msgSend(*((id *)v21 + 5), "isEqualToString:", v25[5]))
      {
        if ((_DWORD)v18 == v32)
          v30 = v31;
        else
          v30 = v24;
        v8 = v34;
        ((void (*)(void (**)(_QWORD), uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))v34[2])(v34, v30, self->_blocks[v30].var0, 1, v19, self->_blocks[v19].var0);
        v31 = v30;
        goto LABEL_63;
      }
LABEL_43:

      v23 -= 16;
      if (!--v24)
        goto LABEL_51;
    }
    if ((_DWORD)v18 == v32)
      v29 = v31;
    else
      v29 = v24;
    v8 = v34;
    ((void (*)(void (**)(_QWORD), uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))v34[2])(v34, v29, self->_blocks[v29].var0, 1, v19, self->_blocks[v19].var0);
    v31 = v29;
    if (v35)
    {
      if (a3[v35 - 1] >= v29)
        a3[v35++] = v19;
    }
    else
    {
      v35 = 0;
    }
LABEL_63:
    v10 = v33;

LABEL_47:
    v18 = v19;
LABEL_48:
    ++v16;
  }
  while (v16 != v17);
LABEL_5:

  return v35;
}

- (id)processSnapshotGraphWithOptions:(unint64_t)a3
{
  VMUProcessObjectGraph *v4;
  uint64_t pid;
  uint64_t blocksCount;
  NSMutableArray *zoneNames;
  VMUClassInfoMap *classInfoIndexer;
  _VMUBlockNode *blocks;
  void *v10;
  VMUProcessObjectGraph *v11;
  VMUProcessObjectGraph *processObjectGraph;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  VMUDebugTimer *debugTimer;
  uint64_t v20;
  NSObject *v21;
  os_signpost_id_t v22;
  VMUDebugTimer *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  VMUSampler *v26;
  void *v27;
  char *v28;
  void *v29;
  void *v30;
  char v31;
  VMUSymbolStore *v32;
  VMUProcessObjectGraph *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  VMUDebugTimer *v39;
  uint64_t v40;
  NSObject *v41;
  os_signpost_id_t v42;
  VMUDebugTimer *v43;
  NSObject *v44;
  os_signpost_id_t v45;
  size_t regionsCount;
  VMUDebugTimer *v47;
  uint64_t v48;
  NSObject *v49;
  os_signpost_id_t v50;
  VMUDebugTimer *v51;
  NSObject *v52;
  os_signpost_id_t v53;
  char *v54;
  VMUDebugTimer *v55;
  uint64_t v56;
  NSObject *v57;
  os_signpost_id_t v58;
  VMUDebugTimer *v59;
  NSObject *v60;
  os_signpost_id_t v61;
  void *v62;
  void *v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t *v67;
  unint64_t v68;
  unint64_t v69;
  VMUDebugTimer *v70;
  uint64_t v71;
  NSObject *v72;
  os_signpost_id_t v73;
  VMUGraphStackLogReader *v74;
  VMUGraphStackLogReader *v75;
  VMUClassInfoMap *v76;
  VMUProcessObjectGraph *v77;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v83[5];
  _QWORD v84[5];
  _QWORD v85[5];
  VMUSymbolStore *v86;
  id v87;
  VMUSampler *v88;
  _QWORD *v89;
  _QWORD *v90;
  _QWORD *v91;
  uint8_t *v92;
  _QWORD *v93;
  _QWORD *v94;
  _QWORD *v95;
  char *v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD v102[5];
  uint8_t v103[16];
  _QWORD v104[3];
  int v105;
  _QWORD v106[5];
  id v107;
  _QWORD v108[6];
  uint8_t buf[8];
  uint8_t *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[3];
  char v120;
  _QWORD v121[6];
  _QWORD v122[6];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v4 = [VMUProcessObjectGraph alloc];
  pid = self->_pid;
  blocksCount = self->_blocksCount;
  zoneNames = self->_zoneNames;
  classInfoIndexer = self->_classInfoIndexer;
  blocks = self->_blocks;
  -[VMUVMRegionIdentifier regions](self->_regionIdentifier, "regions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[VMUProcessObjectGraph initWithPid:nodes:nodeCount:zoneNames:classInfoMap:regions:pthreadOffsets:userMarked:autoreleasePoolOffsets:](v4, "initWithPid:nodes:nodeCount:zoneNames:classInfoMap:regions:pthreadOffsets:userMarked:autoreleasePoolOffsets:", pid, blocks, blocksCount, zoneNames, classInfoIndexer, v10, 0, self->_userMarkedAbandoned, -[VMUObjectIdentifier autoreleasePoolPageLayout](self->_objectIdentifier, "autoreleasePoolPageLayout"));
  processObjectGraph = self->_processObjectGraph;
  self->_processObjectGraph = v11;

  -[VMUProcessObjectGraph setSnapshotMachTime:](self->_processObjectGraph, "setSnapshotMachTime:", self->_suspendTime);
  -[VMUProcessObjectGraph setSnapshotDate:](self->_processObjectGraph, "setSnapshotDate:", self->_suspendDate);
  -[VMUProcessObjectGraph setScanner:](self->_processObjectGraph, "setScanner:", self);
  -[VMUProcessObjectGraph setDebugTimer:](self->_processObjectGraph, "setDebugTimer:", self->_debugTimer);
  -[VMUProcessObjectGraph setShowRawClassNames:](self->_processObjectGraph, "setShowRawClassNames:", self->_showRawClassNames);
  -[VMUProcessObjectGraph setProcessDescriptionString:](self->_processObjectGraph, "setProcessDescriptionString:", self->_processDescriptionString);
  -[VMUProcessObjectGraph setIsTranslatedByRosetta:](self->_processObjectGraph, "setIsTranslatedByRosetta:", -[VMUKernelCoreMemoryScanner isTranslatedByRosetta](self, "isTranslatedByRosetta"));
  -[VMUProcessObjectGraph setProcessName:](self->_processObjectGraph, "setProcessName:", self->_processName);
  -[VMUProcessObjectGraph setBinaryImagesDescription:](self->_processObjectGraph, "setBinaryImagesDescription:", self->_binaryImagesDescription);
  -[VMUProcessObjectGraph setPhysicalFootprint:](self->_processObjectGraph, "setPhysicalFootprint:", self->_physicalFootprint);
  -[VMUProcessObjectGraph setLedger:](self->_processObjectGraph, "setLedger:", self->_ledger);
  -[VMUProcessObjectGraph setPhysicalFootprintPeak:](self->_processObjectGraph, "setPhysicalFootprintPeak:", self->_physicalFootprintPeak);
  v13 = -[VMUTask taskDyldSharedCacheRange](self->_task, "taskDyldSharedCacheRange");
  -[VMUProcessObjectGraph setDyldSharedCacheRange:](self->_processObjectGraph, "setDyldSharedCacheRange:", v13, v14);
  -[VMUProcessObjectGraph setObjectContentLevel:](self->_processObjectGraph, "setObjectContentLevel:", -[VMUKernelCoreMemoryScanner objectContentLevel](self, "objectContentLevel"));
  -[VMUProcessObjectGraph setObjectContentLevelForNodeLabels:](self->_processObjectGraph, "setObjectContentLevelForNodeLabels:", -[VMUKernelCoreMemoryScanner objectContentLevel](self, "objectContentLevel"));
  -[VMUProcessObjectGraph setSrcAddressToExtraAutoreleaseCountDict:](self->_processObjectGraph, "setSrcAddressToExtraAutoreleaseCountDict:", self->_srcAddressToExtraAutoreleaseCountDict);
  if ((self->_regionDescriptionOptions & 0x10000) != 0)
    -[VMUProcessObjectGraph setShowsPhysFootprint:](self->_processObjectGraph, "setShowsPhysFootprint:", 1);
  v15 = -[VMUTask createSymbolicatorWithFlags:andNotification:](self->_task, "createSymbolicatorWithFlags:andNotification:", 0, 0);
  v17 = v16;
  if (self->_targetProcessHasObjCPatches)
  {
    v80 = CSSymbolicatorCreateForTaskSharedCache();
    v81 = v18;
  }
  else
  {
    v80 = 0;
    v81 = 0;
  }
  v122[0] = 0;
  v122[1] = v122;
  v122[2] = 0x3010000000;
  v122[5] = 0;
  v122[3] = &unk_1A4E39779;
  v122[4] = 0;
  v121[0] = 0;
  v121[1] = v121;
  v121[2] = 0x3010000000;
  v121[5] = 0;
  v121[3] = &unk_1A4E39779;
  v121[4] = 0;
  v119[0] = 0;
  v119[1] = v119;
  v119[2] = 0x2020000000;
  v120 = 0;
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    v20 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = self->_debugTimer;
    if (v20)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v21, OS_SIGNPOST_INTERVAL_END, v22, "processSnapshotGraph", ", buf, 2u);
      }

      debugTimer = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "processSnapshotGraph");
  -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "processSnapshotGraph", "sampling all threads");
  v23 = self->_debugTimer;
  if (v23)
  {
    -[VMUDebugTimer logHandle](v23, "logHandle");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v25, "processSnapshotGraph", "sampling all threads", buf, 2u);
    }

  }
  if (-[VMUTask isCore](self->_task, "isCore"))
  {
    v26 = 0;
    v27 = 0;
  }
  else
  {
    v26 = -[VMUSampler initWithTask:options:]([VMUSampler alloc], "initWithTask:options:", -[VMUTask taskPort](self->_task, "taskPort"), 257);
    -[VMUSampler sampleAllThreadsOnceWithFramePointers:](v26, "sampleAllThreadsOnceWithFramePointers:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = getenv("PreserveMemgraphSampleAndSymbolStore");
  if (v28
    && (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v28),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v29, "uppercaseString"),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("NO")),
        v30,
        v29,
        (v31 & 1) != 0))
  {
    v32 = 0;
  }
  else
  {
    -[VMUProcessObjectGraph setBacktraces:](self->_processObjectGraph, "setBacktraces:", v27);
    v32 = -[VMUSymbolStore initWithSymbolicator:debugTimer:]([VMUSymbolStore alloc], "initWithSymbolicator:debugTimer:", v15, v17, self->_debugTimer);
    -[VMUProcessObjectGraph setSymbolStore:](self->_processObjectGraph, "setSymbolStore:", v32);
    v33 = self->_processObjectGraph;
    -[VMUProcessObjectGraph symbolStore](v33, "symbolStore");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setGraph:", v33);

  }
  if (v27)
  {
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v35 = v27;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v116;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v116 != v37)
            objc_enumerationMutation(v35);
          -[VMUSymbolStore addBacktrace:origin:](v32, "addBacktrace:origin:", *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * i), 0);
        }
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
      }
      while (v36);
    }

  }
  *(_QWORD *)buf = 0;
  v110 = buf;
  v111 = 0x3010000000;
  v114 = 0;
  v112 = &unk_1A4E39779;
  v113 = 0;
  v108[0] = 0;
  v108[1] = v108;
  v108[2] = 0x3010000000;
  v108[4] = 0;
  v108[5] = 0;
  v108[3] = &unk_1A4E39779;
  v106[0] = 0;
  v106[1] = v106;
  v106[2] = 0x3032000000;
  v106[3] = __Block_byref_object_copy__0;
  v106[4] = __Block_byref_object_dispose__0;
  v107 = 0;
  v104[0] = 0;
  v104[1] = v104;
  v104[2] = 0x2020000000;
  v105 = 0;
  if ((a3 & 2) != 0 && (-[VMUKernelCoreMemoryScanner objectContentLevel](self, "objectContentLevel") & 0xFFFFFFFE) == 2)
  {
    v39 = self->_debugTimer;
    if (v39)
    {
      v40 = -[VMUDebugTimer signpostID](v39, "signpostID");
      v39 = self->_debugTimer;
      if (v40)
      {
        -[VMUDebugTimer logHandle](v39, "logHandle");
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
        {
          *(_WORD *)v103 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v41, OS_SIGNPOST_INTERVAL_END, v42, "processSnapshotGraph", ", v103, 2u);
        }

        v39 = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](v39, "endEvent:", "processSnapshotGraph");
    -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "processSnapshotGraph", "getting node labels");
    v43 = self->_debugTimer;
    if (v43)
    {
      -[VMUDebugTimer logHandle](v43, "logHandle");
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        *(_WORD *)v103 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v45, "processSnapshotGraph", "getting node labels", v103, 2u);
      }

    }
    v102[0] = MEMORY[0x1E0C809B0];
    v102[1] = 3221225472;
    v102[2] = __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke;
    v102[3] = &unk_1E4E00F60;
    v102[4] = self;
    -[VMUKernelCoreMemoryScanner enumerateObjectsWithBlock:](self, "enumerateObjectsWithBlock:", v102);
  }
  regionsCount = self->_regionsCount;
  if ((_DWORD)regionsCount)
  {
    v47 = self->_debugTimer;
    if (v47)
    {
      v48 = -[VMUDebugTimer signpostID](v47, "signpostID");
      v47 = self->_debugTimer;
      if (v48)
      {
        -[VMUDebugTimer logHandle](v47, "logHandle");
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          *(_WORD *)v103 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v49, OS_SIGNPOST_INTERVAL_END, v50, "processSnapshotGraph", ", v103, 2u);
        }

        v47 = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](v47, "endEvent:", "processSnapshotGraph");
    -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "processSnapshotGraph", "scan nodes into the graph, while recording symbols of __DATA regions and stacks");
    v51 = self->_debugTimer;
    if (v51)
    {
      -[VMUDebugTimer logHandle](v51, "logHandle");
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
      {
        *(_WORD *)v103 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v52, OS_SIGNPOST_INTERVAL_BEGIN, v53, "processSnapshotGraph", "scan nodes into the graph, while recording symbols of __DATA regions and stacks", v103, 2u);
      }

    }
    v54 = (char *)malloc_type_calloc(regionsCount, 4uLL, 0x100004052888210uLL);
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_141;
    v85[3] = &unk_1E4E011B8;
    v96 = v54;
    v97 = a3;
    v98 = v80;
    v99 = v81;
    v100 = v15;
    v101 = v17;
    v85[4] = self;
    v89 = v122;
    v90 = v119;
    v91 = v121;
    v86 = v32;
    v92 = buf;
    v93 = v108;
    v94 = v106;
    v95 = v104;
    v87 = v27;
    v88 = v26;
    -[VMUKernelCoreMemoryScanner scanNodesWithReferenceRecorder:](self, "scanNodesWithReferenceRecorder:", v85);
    v55 = self->_debugTimer;
    if (v55)
    {
      v56 = -[VMUDebugTimer signpostID](v55, "signpostID");
      v55 = self->_debugTimer;
      if (v56)
      {
        -[VMUDebugTimer logHandle](v55, "logHandle");
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
        {
          *(_WORD *)v103 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v57, OS_SIGNPOST_INTERVAL_END, v58, "processSnapshotGraph", ", v103, 2u);
        }

        v55 = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](v55, "endEvent:", "processSnapshotGraph");
    -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "processSnapshotGraph", "find unreferenced VM regions");
    v59 = self->_debugTimer;
    if (v59)
    {
      -[VMUDebugTimer logHandle](v59, "logHandle");
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
      {
        *(_WORD *)v103 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v60, OS_SIGNPOST_INTERVAL_BEGIN, v61, "processSnapshotGraph", "find unreferenced VM regions", v103, 2u);
      }

    }
    v62 = malloc_type_malloc(4 * regionsCount, 0x100004052888210uLL);
    v63 = v62;
    v64 = self->_blocksCount;
    if ((_DWORD)v64)
    {
      v65 = 0;
      v66 = 0;
      v67 = (unint64_t *)self->_blocks + 1;
      do
      {
        v69 = *v67;
        v67 += 2;
        v68 = v69;
        if ((v69 & 7) == 5 && !*(_DWORD *)&v54[(v68 >> 39) & 0x1FFFFFC])
        {
          *((_DWORD *)v62 + v66) = v65;
          v66 = (v66 + 1);
          v64 = self->_blocksCount;
        }
        ++v65;
      }
      while (v65 < v64);
      if ((_DWORD)v66)
      {
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_155;
        v84[3] = &unk_1E4E01000;
        v84[4] = self;
        -[VMUKernelCoreMemoryScanner _removeFalsePositiveLeakedVMregionsFromNodes:nodeCount:recorder:](self, "_removeFalsePositiveLeakedVMregionsFromNodes:nodeCount:recorder:", v62, v66, v84);
      }
    }
    free(v63);
    free(v54);

  }
  CSRelease();
  -[VMUKernelCoreMemoryScanner unmapAllRegions](self, "unmapAllRegions");
  v70 = self->_debugTimer;
  if (v70)
  {
    v71 = -[VMUDebugTimer signpostID](v70, "signpostID");
    v70 = self->_debugTimer;
    if (v71)
    {
      -[VMUDebugTimer logHandle](v70, "logHandle");
      v72 = objc_claimAutoreleasedReturnValue();
      v73 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
      {
        *(_WORD *)v103 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v72, OS_SIGNPOST_INTERVAL_END, v73, "processSnapshotGraph", ", v103, 2u);
      }

      v70 = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](v70, "endEvent:", "processSnapshotGraph");
  if ((a3 & 1) != 0)
  {
    v74 = [VMUGraphStackLogReader alloc];
    LODWORD(v79) = self->_zonesCount;
    v75 = -[VMUGraphStackLogReader initWithCore:symbolicator:graph:debugTimer:zones:zonesCount:](v74, "initWithCore:symbolicator:graph:debugTimer:zones:zonesCount:", self->_memoryCache, v15, v17, self->_processObjectGraph, self->_debugTimer, self->_zones, v79);
    if (v75)
    {
      -[VMUProcessObjectGraph setStackLogReader:](self->_processObjectGraph, "setStackLogReader:", v75);
      v76 = self->_classInfoIndexer;
      v83[0] = MEMORY[0x1E0C809B0];
      v83[1] = 3221225472;
      v83[2] = __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_157;
      v83[3] = &unk_1E4E00D90;
      v83[4] = self;
      -[VMUStackLogReaderBase identifyNonObjectsUsingStackBacktraces:classInfoMap:classInfoSetterBlock:](v75, "identifyNonObjectsUsingStackBacktraces:classInfoMap:classInfoSetterBlock:", self, v76, v83);
      -[VMUKernelCoreMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
    }

  }
  -[VMUProcessObjectGraph setIdleExitStatus:](self->_processObjectGraph, "setIdleExitStatus:", self->_idleExitStatus);
  CSRelease();
  v77 = self->_processObjectGraph;
  _Block_object_dispose(v104, 8);
  _Block_object_dispose(v106, 8);

  _Block_object_dispose(v108, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v119, 8);
  _Block_object_dispose(v121, 8);
  _Block_object_dispose(v122, 8);
  return v77;
}

void __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;

  if (*(_QWORD *)(a3 + 8) >> 60 == 1)
  {
    v5 = (void *)MEMORY[0x1A85A9758]();
    objc_msgSend(*(id *)(a1 + 32), "labelForNode:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setLabel:forNode:", v6, a2);

    objc_autoreleasePoolPop(v5);
  }
}

void __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_141(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v8;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  uint64_t Range;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  unsigned int v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t Name;

  v8 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "addEdgeFromNode:sourceOffset:withScanType:toNode:destinationOffset:", a2, a3 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16 * a2), a4, a5, a6 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16 * a5)) != -1)
  {
    if (v8 != (_DWORD)a5
      && (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16 * a5 + 8) & 7) == 5)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16 * a5 + 8);
      ++*(_DWORD *)(*(_QWORD *)(a1 + 120) + ((v10 >> 39) & 0x1FFFFFC));
    }
    if ((*(_BYTE *)(a1 + 128) & 4) != 0)
    {
      v11 = v8;
      if (VMUGraphNodeType_IsVMRegion(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16 * v8 + 8) & 7))
      {
        v12 = (void *)MEMORY[0x1A85A9758]();
        v13 = objc_retain(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112)
                                + ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16 * v11 + 8) >> 35) & 0x1FFFFFC0)));
        v14 = v13;
        if ((*((_BYTE *)v13 + 132) & 2) != 0)
        {
          if ((*((_BYTE *)v13 + 132) & 4) == 0)
            goto LABEL_17;
        }
        else if ((*((_BYTE *)v13 + 132) & 4) == 0)
        {
          if (*((_DWORD *)v13 + 26) != 30
            || a3 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32) < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                            + 40))
          {
            goto LABEL_32;
          }
          if (a3 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32) >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                                             + 40))
          {
            v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "indexForLocation:", a3);
            if (v15 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v16 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
              *(_QWORD *)(v16 + 32) = 0;
              *(_QWORD *)(v16 + 40) = 0;
              v17 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
              v18 = *(void **)(v17 + 40);
              *(_QWORD *)(v17 + 40) = 0;

              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 0;
            }
            else
            {
              v33 = v15;
              v34 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "rangeAtIndex:", v15);
              v35 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
              *(_QWORD *)(v35 + 32) = v34;
              *(_QWORD *)(v35 + 40) = v36;
              if (objc_msgSend(*(id *)(a1 + 48), "count"))
              {
                v37 = 0;
                v38 = 0;
                while (1)
                {
                  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v37);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v39, "backtraceLength"))
                  {
                    if (objc_msgSend(v39, "backtraceLength"))
                    {
                      v40 = 0;
                      while (!*(_QWORD *)(objc_msgSend(v39, "stackFramePointers") + 8 * v40))
                      {
                        if (++v40 >= (unint64_t)objc_msgSend(v39, "backtraceLength"))
                          goto LABEL_40;
                      }
                      v41 = *(_QWORD *)(objc_msgSend(v39, "stackFramePointers") + 8 * v40);
                    }
                    else
                    {
LABEL_40:
                      v41 = 0;
                    }
                    if ((unint64_t)(v41 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32)) < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
                      break;
                  }

                  v37 = ++v38;
                  if (objc_msgSend(*(id *)(a1 + 48), "count") <= (unint64_t)v38)
                    goto LABEL_46;
                }
                v42 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
                v43 = *(void **)(v42 + 40);
                *(_QWORD *)(v42 + 40) = v39;

              }
LABEL_46:
              if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
              {
                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 0;
                objc_msgSend(*(id *)(a1 + 56), "threadDescriptionStringForBacktrace:returnedAddress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), 0);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setThreadName:forRange:", v44, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setThreadName:forRange:", v44, v33, 1);

              }
              else
              {
                if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isCore") & 1) != 0)
                {
                  v45 = &stru_1E4E04720;
                }
                else
                {
                  objc_msgSend(*(id *)(a1 + 56), "threadDescriptionStringForBacktrace:returnedAddress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), 0);
                  v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                -[__CFString stringByAppendingString:](v45, "stringByAppendingString:", CFSTR("  no associated pthread"));
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setThreadName:forRange:", v46, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setThreadName:forRange:", v46, v33, 1);

              }
            }
          }
          v47 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
          if (!v47)
            goto LABEL_32;
          v48 = objc_msgSend(v47, "backtraceLength");
          if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) >= v48)
            goto LABEL_32;
          v49 = v48;
          while (1)
          {
            v50 = *(_QWORD *)(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "stackFramePointers")+ 8 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24));
            v51 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "backtrace");
            v52 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
            v53 = *(unsigned int *)(v52 + 24);
            if (v50 > a3)
              break;
            *(_DWORD *)(v52 + 24) = v53 + 1;
            if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) >= v49)
              goto LABEL_32;
          }
          v54 = *(_QWORD *)(v51 + 8 * v53);
          v55 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
          *(_QWORD *)(v55 + 32) = a3;
          *(_QWORD *)(v55 + 40) = v50 - a3;
          CSSymbolicatorGetSymbolWithAddressAtTime();
          CSSymbolGetSymbolOwner();
          Name = CSSymbolOwnerGetName();
          if (CSSymbolIsUnnamed())
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%#llx (in %s)"), v54, Name);
          else
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s (in %s)"), CSSymbolGetName(), Name);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v27)
            goto LABEL_32;
          v31 = *(void **)(*(_QWORD *)(a1 + 32) + 496);
          v32 = *(_QWORD *)(a1 + 88);
          goto LABEL_31;
        }
        CSIsNull();
LABEL_17:
        if (a3 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                           + 40))
        {
          CSSymbolicatorGetSectionWithAddressAtTime();
          v19 = CSRegionGetName();
          if (v19)
          {
            v20 = (const char *)v19;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            Range = CSRegionGetRange();
            v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            *(_QWORD *)(v23 + 32) = Range;
            *(_QWORD *)(v23 + 40) = v24;
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setBinarySectionName:forRange:", v21, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
            v25 = !strncmp(v20, "__DATA __objc_", 0xEuLL)
               || !strncmp(v20, "__AUTH __objc_", 0xEuLL)
               || !strncmp(v20, "__DATA_DIRTY __objc_", 0x14uLL)
               || !strncmp(v20, "__DATA_CONST __objc_", 0x14uLL)
               || !strncmp(v20, "__AUTH_CONST __objc_", 0x14uLL)
               || strncmp(v20, "__OBJC ", 7uLL) == 0;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v25;

          }
        }
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
          goto LABEL_32;
        if (a3 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32) < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                                          + 40))
          goto LABEL_32;
        objc_msgSend(*(id *)(a1 + 40), "addAddress:origin:", a3, 2);
        CSSymbolicatorGetSymbolWithAddressAtTime();
        v26 = CSSymbolGetName();
        if (!v26)
          goto LABEL_32;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = CSSymbolGetRange();
        v29 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        *(_QWORD *)(v29 + 32) = v28;
        *(_QWORD *)(v29 + 40) = v30;
        v31 = *(void **)(*(_QWORD *)(a1 + 32) + 496);
        v32 = *(_QWORD *)(a1 + 80);
LABEL_31:
        objc_msgSend(v31, "setRegionSymbolName:forRange:", v27, *(_QWORD *)(*(_QWORD *)(v32 + 8) + 32), *(_QWORD *)(*(_QWORD *)(v32 + 8) + 40));

LABEL_32:
        objc_autoreleasePoolPop(v12);
      }
    }
  }
}

uint64_t __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_155(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "addEdgeFromNode:sourceOffset:withScanType:toNode:destinationOffset:", a2, a3 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16 * a2), a4, a5, a6 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16 * a5));
}

uint64_t __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_157(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 96) + 16 * a2;
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(v3 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)a3 << 41);
  return result;
}

- (id)processSnapshotGraph
{
  return -[VMUKernelCoreMemoryScanner processSnapshotGraphWithOptions:](self, "processSnapshotGraphWithOptions:", 5);
}

- (VMUClassInfoMap)realizedClasses
{
  return -[VMUObjectIdentifier realizedClasses](self->_objectIdentifier, "realizedClasses");
}

- (BOOL)hasClassInfosDerivedFromStackBacktraces
{
  void *v2;
  char v3;

  -[VMUKernelCoreMemoryScanner realizedClasses](self, "realizedClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasClassInfosDerivedFromStackBacktraces");

  return v3;
}

- ($61A80719B04F7407D3E47539F1B23CAA)nodeDetails:(VMUKernelCoreMemoryScanner *)self
{
  unsigned int v1;
  unint64_t *v2;
  _VMUBlockNode *v3;
  unint64_t v4;
  unint64_t var0;
  unint64_t v6;

  if (self->_blocksCount <= v1)
  {
    *v2 = 0;
    v2[1] = 0;
    v2[2] = 0;
  }
  else
  {
    v3 = &self->_blocks[v1];
    var0 = v3->var0;
    v4 = *((_QWORD *)v3 + 1);
    *v2 = var0;
    v2[1] = ((v4 >> 5) | (v4 << 60)) & 0x7000000FFFFFFFFFLL;
    if ((v4 & 7) == 1)
      v6 = *(unint64_t *)((char *)self->_classInfos + ((v4 >> 38) & 0x3FFFFF8));
    else
      v6 = 0;
    v2[2] = v6;
  }
  return ($61A80719B04F7407D3E47539F1B23CAA)self;
}

- (id)vmuVMRegionForAddress:(unint64_t)a3
{
  id v4;
  _VMURegionMap *regionMap;
  unint64_t var7;
  unint64_t var6;
  unint64_t v8;
  BOOL v9;
  unint64_t v11;
  _DWORD *var3;
  unint64_t v13;
  char *v14;
  int v15;
  _DWORD *v16;
  int v17;
  _VMURegionNode *var4;
  id *p_var0;
  unint64_t var5;
  _VMURegionNode *v21;
  unint64_t v22;
  BOOL v23;
  int v25;
  id *v26;
  id *v27;
  unint64_t v28;
  unint64_t v29;
  id *v30;
  BOOL v31;

  v4 = 0;
  regionMap = self->_regionMap;
  var6 = regionMap->var6;
  var7 = regionMap->var7;
  v8 = var7 - var6;
  v9 = var7 < var6;
  if (a3 - var6 >= v8 || v9)
    return v4;
  v11 = a3 >> *MEMORY[0x1E0C85AC8];
  if (v11)
  {
    var3 = regionMap->var3;
    v13 = a3 >> *MEMORY[0x1E0C85AC8];
    while (*var3 > (v13 & 0x3FFFFFF)
         && ((*((unsigned __int8 *)var3 + ((v13 & 0x3FFFFFF) >> 3) + 4) >> (v13 & 7)) & 1) != 0)
    {
      v13 >>= 26;
      if (!v13)
        goto LABEL_8;
    }
LABEL_17:
    v4 = 0;
    return v4;
  }
LABEL_8:
  v14 = (char *)regionMap + 4 * (v11 & 0x7FFFF);
  v17 = *((_DWORD *)v14 + 16);
  v16 = v14 + 64;
  v15 = v17;
  var4 = regionMap->var4;
  if (v17)
  {
    p_var0 = &var4[(unint64_t)(v15 - 1)].var0;
    if (a3 - *((_QWORD *)*p_var0 + 1) < *((_QWORD *)*p_var0 + 2))
      goto LABEL_10;
  }
  var5 = regionMap->var5;
  if (!(_DWORD)var5)
    goto LABEL_17;
  v21 = regionMap->var4;
  while (1)
  {
    v22 = var5 >> 1;
    p_var0 = &v21[var5 >> 1].var0;
    if (*((_QWORD *)*p_var0 + 1) <= a3)
      break;
LABEL_16:
    v23 = var5 >= 2;
    var5 = v22;
    if (!v23)
      goto LABEL_17;
  }
  if (*((_QWORD *)*p_var0 + 2) + *((_QWORD *)*p_var0 + 1) <= a3)
  {
    v21 = (_VMURegionNode *)(p_var0 + 8);
    v22 = --var5 >> 1;
    goto LABEL_16;
  }
  v25 = objc_msgSend(*p_var0, "isSpecialPhysFootprintRegion");
  v4 = 0;
  if (v25)
    v26 = 0;
  else
    v26 = p_var0;
  if ((v25 & 1) != 0)
    return v4;
  if ((*((_BYTE *)*v26 + 132) & 1) == 0)
    goto LABEL_36;
  v27 = v26 + 8;
  v28 = regionMap->var5 - (((char *)(v26 + 8) - (char *)regionMap->var4) >> 6);
  if (!v28)
    goto LABEL_33;
  while (2)
  {
    v29 = v28 >> 1;
    v30 = &v27[8 * (v28 >> 1)];
    if (*((_QWORD *)*v30 + 1) > a3)
    {
LABEL_28:
      v31 = v28 > 1;
      v28 = v29;
      if (!v31)
      {
        v28 = 0;
        goto LABEL_33;
      }
      continue;
    }
    break;
  }
  if (*((_QWORD *)*v30 + 2) + *((_QWORD *)*v30 + 1) <= a3)
  {
    v27 = v30 + 8;
    v29 = --v28 >> 1;
    goto LABEL_28;
  }
  if (objc_msgSend(*v30, "isSpecialPhysFootprintRegion"))
    v28 = 0;
  else
    v28 = (unint64_t)v30;
LABEL_33:
  if (v28)
    v26 = (id *)v28;
  p_var0 = v26;
LABEL_36:
  *v16 = ((unint64_t)((char *)v26 - (char *)var4) >> 6) + 1;
LABEL_10:
  v4 = *p_var0;
  return v4;
}

- (id)vmuVMRegionForNode:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)&a3;
  if (-[VMUKernelCoreMemoryScanner nodeNamespaceSize](self, "nodeNamespaceSize") <= a3)
  {
    v5 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    -[VMUKernelCoreMemoryScanner nodeDetails:](self, "nodeDetails:", v3);
    -[VMUKernelCoreMemoryScanner vmuVMRegionForAddress:](self, "vmuVMRegionForAddress:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)zoneNameForNode:(unsigned int)a3
{
  uint64_t v4;
  _VMURegionNode *v5;
  id v6;
  unsigned int v7;
  void *v8;
  _VMUBlockNode *blocks;
  _VMURegionMap *regionMap;
  unint64_t var6;
  unint64_t var7;
  BOOL v13;
  unint64_t v14;
  unint64_t var0;
  unint64_t v16;
  unsigned int *var3;
  unint64_t v18;
  char *v19;
  int v20;
  _DWORD *v21;
  int v22;
  _VMURegionNode *var4;
  unint64_t var5;
  _VMURegionNode *v25;
  unint64_t v26;
  int v27;
  _VMURegionNode *v28;
  id *p_var0;
  unint64_t v30;
  unint64_t v31;
  id *v32;
  BOOL v33;

  if (self->_blocksCount <= a3)
    goto LABEL_43;
  v4 = a3;
  if (VMUGraphNodeType_IsVMRegion(*((_DWORD *)&self->_blocks[a3] + 2) & 7))
  {
    v5 = &self->_regions[*((_QWORD *)&self->_blocks[v4] + 1) >> 41];
    if (!v5)
      goto LABEL_43;
    goto LABEL_4;
  }
  blocks = self->_blocks;
  if ((*((_QWORD *)&blocks[v4] + 1) & 7) != 1)
    goto LABEL_43;
  v8 = 0;
  regionMap = self->_regionMap;
  var6 = regionMap->var6;
  var7 = regionMap->var7;
  v13 = var7 >= var6;
  v14 = var7 - var6;
  if (!v13)
    return v8;
  var0 = blocks[v4].var0;
  if (var0 - var6 >= v14)
    return v8;
  v16 = var0 >> *MEMORY[0x1E0C85AC8];
  if (v16)
  {
    var3 = (unsigned int *)regionMap->var3;
    v18 = var0 >> *MEMORY[0x1E0C85AC8];
    do
    {
      if (*var3 <= (v18 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v18 & 0x3FFFFFF) >> 3) + 4) >> (v18 & 7)) & 1) == 0)
      {
        goto LABEL_43;
      }
      v18 >>= 26;
    }
    while (v18);
  }
  v19 = (char *)regionMap + 4 * (v16 & 0x7FFFF);
  v22 = *((_DWORD *)v19 + 16);
  v21 = v19 + 64;
  v20 = v22;
  var4 = regionMap->var4;
  if (v22)
  {
    v6 = var4[(unint64_t)(v20 - 1)].var0;
    if (var0 - *((_QWORD *)v6 + 1) < *((_QWORD *)v6 + 2))
      goto LABEL_5;
  }
  var5 = regionMap->var5;
  if (!(_DWORD)var5)
    goto LABEL_43;
  v25 = regionMap->var4;
  while (1)
  {
    v26 = var5 >> 1;
    v5 = &v25[var5 >> 1];
    if (*((_QWORD *)v5->var0 + 1) <= var0)
      break;
LABEL_23:
    v8 = 0;
    v13 = var5 >= 2;
    var5 = v26;
    if (!v13)
      return v8;
  }
  if (*((_QWORD *)v5->var0 + 2) + *((_QWORD *)v5->var0 + 1) <= var0)
  {
    v25 = v5 + 1;
    v26 = --var5 >> 1;
    goto LABEL_23;
  }
  v27 = objc_msgSend(v5->var0, "isSpecialPhysFootprintRegion");
  v8 = 0;
  if (v27)
    v28 = 0;
  else
    v28 = v5;
  if ((v27 & 1) != 0)
    return v8;
  if ((*((_BYTE *)v28->var0 + 132) & 1) == 0)
    goto LABEL_42;
  p_var0 = &v28[1].var0;
  v30 = regionMap->var5 - (&v28[1] - regionMap->var4);
  if (!v30)
    goto LABEL_39;
  while (2)
  {
    v31 = v30 >> 1;
    v32 = &p_var0[8 * (v30 >> 1)];
    if (*((_QWORD *)*v32 + 1) > var0)
    {
LABEL_34:
      v33 = v30 > 1;
      v30 = v31;
      if (!v33)
      {
        v30 = 0;
        goto LABEL_39;
      }
      continue;
    }
    break;
  }
  if (*((_QWORD *)*v32 + 2) + *((_QWORD *)*v32 + 1) <= var0)
  {
    p_var0 = v32 + 8;
    v31 = --v30 >> 1;
    goto LABEL_34;
  }
  if (objc_msgSend(*v32, "isSpecialPhysFootprintRegion"))
    v30 = 0;
  else
    v30 = (unint64_t)v32;
LABEL_39:
  if (v30)
    v5 = (_VMURegionNode *)v30;
  else
    v5 = v28;
LABEL_42:
  *v21 = ((unint64_t)((char *)v5 - (char *)var4) >> 6) + 1;
  if (!v5)
  {
LABEL_43:
    v8 = 0;
    return v8;
  }
LABEL_4:
  v6 = v5->var0;
LABEL_5:
  v7 = *((_DWORD *)v6 + 37);
  if (self->_zonesCount <= v7)
    goto LABEL_43;
  v8 = (void *)objc_msgSend(self->_zones[v7].var1, "copy");
  return v8;
}

- (id)zoneNameForIndex:(unsigned int)a3
{
  if (self->_zonesCount <= a3)
    return 0;
  else
    return self->_zones[a3].var1;
}

- (BOOL)hasLabelsForNodes
{
  return 1;
}

- (id)labelForNode:(unsigned int)a3
{
  uint64_t v3;
  _VMUBlockNode *v5;
  uint64_t v6;
  id v7;
  void *v8;

  if (self->_blocksCount > a3 && (v3 = *(_QWORD *)&a3, v5 = &self->_blocks[a3], (*((_QWORD *)v5 + 1) & 7) == 1))
  {
    v6 = *((_QWORD *)v5 + 1) >> 41;
    if ((_DWORD)v6 && self->_classInfosCount > v6)
      v7 = self->_classInfos[v6];
    else
      v7 = 0;
    -[VMUObjectIdentifier labelForMemory:length:remoteAddress:classInfo:](self->_objectIdentifier, "labelForMemory:length:remoteAddress:classInfo:", -[VMUKernelCoreMemoryScanner contentForNode:](self, "contentForNode:", v3), (*((_QWORD *)v5 + 1) >> 5) & 0xFFFFFFFFFLL, v5->var0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)shortLabelForNode:(unsigned int)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[VMUKernelCoreMemoryScanner labelForNode:](self, "labelForNode:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    shortenString(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)contentForNode:(unsigned int)a3
{
  void *result;
  _VMURegionMap *regionMap;
  unint64_t var6;
  unint64_t var7;
  BOOL v8;
  unint64_t v9;
  unint64_t var0;
  _DWORD *v12;
  unint64_t v13;
  unsigned int *var3;
  unint64_t v15;
  char *v16;
  int v17;
  _DWORD *v18;
  int v19;
  _VMURegionNode *var4;
  _VMURegionNode *v21;
  uint64_t v22;
  _VMUBlockNode *v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  VMUTaskMemoryCache *v27;
  VMUTaskMemoryCache *v28;
  VMUTaskMemoryCache *v29;
  uint64_t v30;
  uint64_t v31;
  _VMURegionNode *v32;
  _QWORD *v33;
  const mapped_region_node_t *v34;
  unint64_t var1;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  _VMURegionNode *v39;
  uint64_t v40;
  uint64_t v41;
  VMUTask *v42;
  unint64_t var5;
  _VMURegionNode *v44;
  unint64_t v45;
  VMUTaskMemoryCache *memoryCache;
  _VMURegionNode *regions;
  unsigned int regionsCount;
  VMUTaskMemoryCache *v49;
  char *v50;
  int v51;
  unint64_t v52;
  id *v53;
  unint64_t v54;
  unint64_t v55;
  id *v56;
  BOOL v57;
  unint64_t v58;
  VMUTaskMemoryCache *v59;
  VMUTaskMemoryCache *v60;
  _VMURegionNode *v61;
  void (**v62)(void);
  int v63;
  int v64;
  _BOOL4 v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  VMUTask *v69;
  id v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  void *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  VMUTask *v79;
  FILE *v80;
  unint64_t v81;
  _QWORD v82[4];
  VMUTaskMemoryCache *v83;
  _VMURegionNode *v84;
  _VMURegionNode *v85;
  _QWORD v86[2];

  if (self->_blocksCount <= a3)
    return 0;
  result = 0;
  regionMap = self->_regionMap;
  var6 = regionMap->var6;
  var7 = regionMap->var7;
  v8 = var7 >= var6;
  v9 = var7 - var6;
  if (!v8)
    return result;
  var0 = self->_blocks[a3].var0;
  if (var0 - var6 >= v9)
    return result;
  v12 = (_DWORD *)MEMORY[0x1E0C85AC8];
  v13 = var0 >> *MEMORY[0x1E0C85AC8];
  if (v13)
  {
    var3 = (unsigned int *)regionMap->var3;
    v15 = var0 >> *MEMORY[0x1E0C85AC8];
    do
    {
      if (*var3 <= (v15 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v15 & 0x3FFFFFF) >> 3) + 4) >> (v15 & 7)) & 1) == 0)
      {
        return 0;
      }
      v15 >>= 26;
    }
    while (v15);
  }
  v16 = (char *)regionMap + 4 * (v13 & 0x7FFFF);
  v19 = *((_DWORD *)v16 + 16);
  v18 = v16 + 64;
  v17 = v19;
  var4 = regionMap->var4;
  if (v19)
  {
    v21 = &var4[(unint64_t)(v17 - 1)];
    if (var0 - *((_QWORD *)v21->var0 + 1) < *((_QWORD *)v21->var0 + 2))
      goto LABEL_12;
  }
  var5 = regionMap->var5;
  if (!(_DWORD)var5)
    return 0;
  v44 = regionMap->var4;
  while (1)
  {
    v45 = var5 >> 1;
    v21 = &v44[var5 >> 1];
    if (*((_QWORD *)v21->var0 + 1) <= var0)
      break;
LABEL_29:
    v8 = var5 >= 2;
    var5 = v45;
    if (!v8)
      return 0;
  }
  if (*((_QWORD *)v21->var0 + 2) + *((_QWORD *)v21->var0 + 1) <= var0)
  {
    v44 = v21 + 1;
    v45 = --var5 >> 1;
    goto LABEL_29;
  }
  v51 = objc_msgSend(v21->var0, "isSpecialPhysFootprintRegion");
  result = 0;
  if (v51)
    v52 = 0;
  else
    v52 = (unint64_t)v21;
  if ((v51 & 1) == 0)
  {
    if ((*(_BYTE *)(*(_QWORD *)v52 + 132) & 1) == 0)
      goto LABEL_76;
    v53 = (id *)(v52 + 64);
    v54 = regionMap->var5 - ((uint64_t)(v52 + 64 - (unint64_t)regionMap->var4) >> 6);
    if (!v54)
      goto LABEL_73;
    while (1)
    {
      v55 = v54 >> 1;
      v56 = &v53[8 * (v54 >> 1)];
      if (*((_QWORD *)*v56 + 1) <= var0)
      {
        if (*((_QWORD *)*v56 + 2) + *((_QWORD *)*v56 + 1) > var0)
        {
          if (objc_msgSend(*v56, "isSpecialPhysFootprintRegion"))
            v54 = 0;
          else
            v54 = (unint64_t)v56;
LABEL_73:
          if (v54)
            v52 = v54;
          v21 = (_VMURegionNode *)v52;
LABEL_76:
          *v18 = ((v52 - (unint64_t)var4) >> 6) + 1;
LABEL_12:
          v22 = a3;
          v23 = &self->_blocks[a3];
          v24 = ((*((_QWORD *)v23 + 1) >> 5) & 0xFFFFFFFFFLL) + v23->var0;
          if (*((_QWORD *)v21->var0 + 2) + *((_QWORD *)v21->var0 + 1) >= v24)
          {
            memoryCache = self->_memoryCache;
            regions = self->_regions;
            regionsCount = self->_regionsCount;
            v42 = self->_task;
            v49 = memoryCache;
            v29 = v49;
            if (!v21->var7)
            {
              if ((*((_BYTE *)v21->var0 + 132) & 2) == 0)
                -[VMUTaskMemoryCache taskIsTranslated](v49, "taskIsTranslated");
              v82[0] = 0;
              v86[0] = 0;
              v63 = -[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:](v29, "mapAddress:size:returnedAddress:returnedSize:", *((_QWORD *)v21->var0 + 1), *((_QWORD *)v21->var0 + 2), v82, v86);
              if (v63)
              {
                if ((*((_DWORD *)v21->var0 + 13) & 3u) - 1 >= 2)
                {
                  v64 = v63;
                  v65 = task_exists(v42);
                  if (v21 != &regions[(unint64_t)(regionsCount - 1)] && v65)
                  {
                    v80 = (FILE *)*MEMORY[0x1E0C80C10];
                    v78 = objc_msgSend(v21->var0, "address");
                    v66 = *((unsigned int *)v21->var0 + 6);
                    v77 = vm_prot_strings_0[v66];
                    v67 = v22;
                    v68 = *((_QWORD *)v21->var0 + 2) + *((_QWORD *)v21->var0 + 1);
                    VMURegionTypeDescriptionForTagShareProtAndPager(*((unsigned __int8 *)v21->var0 + 104), *((unsigned __int8 *)v21->var0 + 50), v66, *((unsigned __int8 *)v21->var0 + 49));
                    v69 = v42;
                    v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    v71 = (const char *)objc_msgSend(v70, "UTF8String");
                    v72 = *((_QWORD *)v21->var0 + 2) >> *v12;
                    v73 = "pages";
                    if (v72 == 1)
                      v73 = "page";
                    if (v21->var4 == v21->var5)
                      v74 = "";
                    else
                      v74 = " [root]";
                    v76 = v68;
                    v22 = v67;
                    fprintf(v80, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v78, v76, v77, v71, v72, v73, v74, v64);

                    v42 = v69;
                  }
                }
              }
              else
              {
                v75 = (void *)v82[0];
                v21->var6 = v86[0];
                v21->var7 = v75;
                v21->var8 = v21;
              }
            }
          }
          else
          {
            LODWORD(v25) = 1;
            do
            {
              v26 = (char *)v21[(unint64_t)v25].var0 + 8;
              v25 = (v25 + 1);
            }
            while (v26[1] + *v26 < v24);
            v27 = self->_memoryCache;
            v79 = self->_task;
            v28 = v27;
            v29 = v28;
            v30 = 0;
            if ((_DWORD)v25)
            {
              v31 = v25;
              v32 = v21;
              do
              {
                v33 = v32->var0;
                ++v32;
                v30 += v33[2];
                --v31;
              }
              while (v31);
            }
            v86[0] = 0;
            v81 = 0;
            v34 = -[VMUTaskMemoryCache findMappedAddress:size:](v28, "findMappedAddress:size:", *((_QWORD *)v21->var0 + 1), v30);
            if (v34)
            {
              var1 = v34->var1;
              v36 = *((_QWORD *)v21->var0 + 1) - v34->var0;
              v86[0] = v34->var2 + v36;
              v81 = var1 - v36;
              goto LABEL_20;
            }
            if ((_DWORD)v25)
            {
              v58 = 0;
              do
              {
                v59 = v29;
                v60 = v59;
                if (v21[v58 / 0x40].var7)
                {
                  if (&v21[v58 / 0x40] == v21[v58 / 0x40].var8)
                  {
                    v82[0] = MEMORY[0x1E0C809B0];
                    v82[1] = 3221225472;
                    v82[2] = ___unmapRegion_block_invoke_0;
                    v82[3] = &unk_1E4E011E0;
                    v83 = v59;
                    v84 = &v21[v58 / 0x40];
                    v85 = v21;
                    v62 = (void (**)(void))MEMORY[0x1A85A995C](v82);
                    v62[2]();

                  }
                  else
                  {
                    v61 = &v21[v58 / 0x40];
                    v61->var6 = 0;
                    v61->var7 = 0;
                    v61->var8 = 0;
                  }
                }

                v58 += 64;
              }
              while ((unint64_t)v25 << 6 != v58);
            }
            if (-[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:](v29, "mapAddress:size:returnedAddress:returnedSize:", *((_QWORD *)v21->var0 + 1), v30, v86, &v81))
            {
              if (task_exists(v79))
                fprintf((FILE *)*MEMORY[0x1E0C80C10], "Failed to map remote region at [%#llx-%#llx]\n", *((_QWORD *)v21->var0 + 1), *((_QWORD *)v21->var0 + 1) + v30);
            }
            else
            {
LABEL_20:
              if ((_DWORD)v25)
              {
                v37 = 0;
                v38 = v81;
                do
                {
                  v39 = &v21[v37 / 0x40];
                  v39->var8 = v21;
                  v39->var6 = v38;
                  v40 = v86[0];
                  v39->var7 = (void *)v86[0];
                  v41 = (uint64_t)v21[v37 / 0x40].var0 + 8;
                  v86[0] = *((_QWORD *)v21[v37 / 0x40].var0 + 2) + v40;
                  v38 = v81 - *(_QWORD *)(v41 + 8);
                  v81 = v38;
                  v37 += 64;
                }
                while ((unint64_t)v25 << 6 != v37);
              }
            }
            v42 = v79;
          }

          v50 = (char *)v21->var7;
          if (v50)
            return &v50[self->_blocks[v22].var0 - *((_QWORD *)v21->var0 + 1)];
          return 0;
        }
        v53 = v56 + 8;
        v55 = --v54 >> 1;
      }
      v57 = v54 > 1;
      v54 = v55;
      if (!v57)
      {
        v54 = 0;
        goto LABEL_73;
      }
    }
  }
  return result;
}

- (unsigned)mallocNodeCount
{
  uint64_t blocksCount;
  unsigned int result;
  uint64_t *v5;
  uint64_t v6;

  blocksCount = self->_blocksCount;
  if (!(_DWORD)blocksCount)
    return 0;
  result = 0;
  v5 = (uint64_t *)self->_blocks + 1;
  do
  {
    v6 = *v5;
    v5 += 2;
    if ((v6 & 7) == 1)
      ++result;
    --blocksCount;
  }
  while (blocksCount);
  return result;
}

- (id)classInfoForObjectAtAddress:(unint64_t)a3
{
  id v4;
  _VMURegionMap *regionMap;
  unint64_t var7;
  unint64_t var6;
  unint64_t v8;
  BOOL v9;
  _DWORD *v11;
  unint64_t v12;
  _DWORD *var3;
  unint64_t v14;
  char *v15;
  int v16;
  _DWORD *v17;
  int v18;
  _VMURegionNode *var4;
  _VMURegionNode *v20;
  unsigned int v21;
  unsigned int *var1;
  _VMUBlockNode *var0;
  uint64_t var2;
  _VMUBlockNode *v25;
  _VMUBlockNode *v26;
  unsigned int *v27;
  uint64_t v28;
  unint64_t *p_var0;
  uint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  unsigned int v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  unint64_t var5;
  _VMURegionNode *v38;
  unint64_t v39;
  int v41;
  unint64_t v42;
  id *v43;
  unint64_t v44;
  unint64_t v45;
  id *v46;
  BOOL v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  _VMUBlockNode *blocks;
  unint64_t v53;
  unint64_t v54;

  v4 = 0;
  regionMap = self->_regionMap;
  var6 = regionMap->var6;
  var7 = regionMap->var7;
  v8 = var7 - var6;
  v9 = var7 < var6;
  if (a3 - var6 >= v8 || v9)
    return v4;
  v11 = (_DWORD *)MEMORY[0x1E0C85AC8];
  v12 = a3 >> *MEMORY[0x1E0C85AC8];
  if (v12)
  {
    var3 = regionMap->var3;
    v14 = a3 >> *MEMORY[0x1E0C85AC8];
    do
    {
      if (*var3 <= (v14 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v14 & 0x3FFFFFF) >> 3) + 4) >> (v14 & 7)) & 1) == 0)
      {
        goto LABEL_34;
      }
      v14 >>= 26;
    }
    while (v14);
  }
  v15 = (char *)regionMap + 4 * (v12 & 0x7FFFF);
  v18 = *((_DWORD *)v15 + 16);
  v17 = v15 + 64;
  v16 = v18;
  var4 = regionMap->var4;
  if (v18)
  {
    v20 = &var4[(unint64_t)(v16 - 1)];
    if (a3 - *((_QWORD *)v20->var0 + 1) < *((_QWORD *)v20->var0 + 2))
      goto LABEL_10;
  }
  var5 = regionMap->var5;
  if (!(_DWORD)var5)
    goto LABEL_34;
  v38 = regionMap->var4;
  while (1)
  {
    v39 = var5 >> 1;
    v20 = &v38[var5 >> 1];
    if (*((_QWORD *)v20->var0 + 1) <= a3)
      break;
LABEL_33:
    v35 = var5 >= 2;
    var5 = v39;
    if (!v35)
      goto LABEL_34;
  }
  if (*((_QWORD *)v20->var0 + 2) + *((_QWORD *)v20->var0 + 1) <= a3)
  {
    v38 = v20 + 1;
    v39 = --var5 >> 1;
    goto LABEL_33;
  }
  v41 = objc_msgSend(v20->var0, "isSpecialPhysFootprintRegion");
  v4 = 0;
  if (v41)
    v42 = 0;
  else
    v42 = (unint64_t)v20;
  if ((v41 & 1) != 0)
    return v4;
  if ((*(_BYTE *)(*(_QWORD *)v42 + 132) & 1) == 0)
    goto LABEL_61;
  v43 = (id *)(v42 + 64);
  v44 = regionMap->var5 - ((uint64_t)(v42 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v44)
    goto LABEL_58;
  while (2)
  {
    v45 = v44 >> 1;
    v46 = &v43[8 * (v44 >> 1)];
    if (*((_QWORD *)*v46 + 1) > a3)
    {
LABEL_45:
      v47 = v44 > 1;
      v44 = v45;
      if (!v47)
      {
        v44 = 0;
        goto LABEL_58;
      }
      continue;
    }
    break;
  }
  if (*((_QWORD *)*v46 + 2) + *((_QWORD *)*v46 + 1) <= a3)
  {
    v43 = v46 + 8;
    v45 = --v44 >> 1;
    goto LABEL_45;
  }
  if (objc_msgSend(*v46, "isSpecialPhysFootprintRegion"))
    v44 = 0;
  else
    v44 = (unint64_t)v46;
LABEL_58:
  if (v44)
    v42 = v44;
  v20 = (_VMURegionNode *)v42;
LABEL_61:
  *v17 = ((v42 - (unint64_t)var4) >> 6) + 1;
LABEL_10:
  v21 = v20->var3;
  if (!v21)
    goto LABEL_34;
  var1 = v20->var1;
  var0 = regionMap->var0;
  var2 = v20->var2;
  v25 = &regionMap->var0[var2];
  if (var1)
  {
    if (v25->var0 <= a3)
    {
      v26 = &var0[v21 - 1 + var2];
      if (((*((_QWORD *)v26 + 1) >> 5) & 0xFFFFFFFFFLL) + v26->var0 > a3)
      {
        v4 = 0;
        v27 = &var1[(a3 - (v25->var0 & -*MEMORY[0x1E0C85AD8])) >> *v11];
        v28 = *v27;
        p_var0 = &var0[v28].var0;
        if (*p_var0 > a3)
          return v4;
        v30 = v27[1];
        if (v30 < regionMap->var1 && (v31 = &var0[v30].var0, v32 = *v31, *v31 <= a3))
        {
LABEL_47:
          v48 = v31[1];
          if ((v48 & 7) - 2 >= 3)
          {
            v49 = a3 - v32;
            v50 = regionMap->var2;
            if (v49 < v50 || ((v48 >> 5) & 0xFFFFFFFFFLL) - v49 <= v50)
            {
              v51 = (char *)v31 - (char *)var0;
              if (self->_blocksCount > (v51 >> 4))
              {
                blocks = self->_blocks;
                v53 = *((_QWORD *)&blocks[(v51 >> 4)] + 1);
                if ((v53 & 7) == 1)
                {
                  v54 = v53 >> 41;
                  if (v53 >> 41 && self->_classInfosCount > v54)
                  {
                    v4 = self->_classInfos[v54];
                  }
                  else
                  {
                    -[VMUObjectIdentifier classInfoForObjectWithRange:](self->_objectIdentifier, "classInfoForObjectWithRange:", blocks[(v51 >> 4)].var0, (v53 >> 5) & 0xFFFFFFFFFLL);
                    v4 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  return v4;
                }
              }
            }
          }
        }
        else
        {
          v33 = v30 - v28;
          if (v33)
          {
            do
            {
              v34 = v33 >> 1;
              v31 = &p_var0[2 * v34];
              v32 = *v31;
              if (*v31 <= a3)
              {
                if (((p_var0[2 * v34 + 1] >> 5) & 0xFFFFFFFFFLL) + v32 > a3)
                  goto LABEL_47;
                p_var0 = v31 + 2;
                LODWORD(v34) = --v33 >> 1;
              }
              v4 = 0;
              v35 = v33 >= 2;
              v33 = v34;
            }
            while (v35);
            return v4;
          }
        }
      }
    }
LABEL_34:
    v4 = 0;
    return v4;
  }
  do
  {
    v36 = v21 >> 1;
    v31 = &v25[v36].var0;
    v32 = *v31;
    if (*v31 <= a3)
    {
      if (((*((_QWORD *)&v25[v36] + 1) >> 5) & 0xFFFFFFFFFLL) + v32 > a3)
        goto LABEL_47;
      v25 = (_VMUBlockNode *)(v31 + 2);
      LODWORD(v36) = --v21 >> 1;
    }
    v4 = 0;
    v35 = v21 >= 2;
    v21 = v36;
  }
  while (v35);
  return v4;
}

- (BOOL)addressIsInDataSegment:(unint64_t)a3
{
  return a3 - self->_dataSegmentsRangeInSharedCache.location < self->_dataSegmentsRangeInSharedCache.length
      || a3 - self->_dataSegmentsRangeOutsideSharedCache.location < self->_dataSegmentsRangeOutsideSharedCache.length
      && -[VMURangeArray indexForLocation:](self->_dataSegmentsRangeArrayOutsideSharedCache, "indexForLocation:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (unsigned)enumerateObjectsWithBlock:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  _VMUBlockNode *v7;
  unint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD *, unint64_t, _QWORD *, char *);
  _QWORD v13[3];
  char v14;

  v4 = a3;
  if (v4)
  {
    v14 = 0;
    if (self->_blocksCount)
    {
      v5 = 0;
      v6 = 0;
      do
      {
        v7 = &self->_blocks[v5];
        v8 = *((_QWORD *)v7 + 1);
        if ((v8 & 7) == 1)
          v9 = *(uint64_t *)((char *)self->_classInfos + ((v8 >> 38) & 0x3FFFFF8));
        else
          v9 = 0;
        v10 = (void (*)(_QWORD *, unint64_t, _QWORD *, char *))v4[2];
        v13[0] = v7->var0;
        v13[1] = ((v8 & 7) << 60) | (v8 >> 5) & 0xFFFFFFFFFLL;
        v13[2] = v9;
        v10(v4, v6++, v13, &v14);
        ++v5;
      }
      while (v6 < self->_blocksCount && v14 == 0);
    }
    else
    {
      LODWORD(v6) = 0;
    }
  }
  else
  {
    LODWORD(v6) = self->_blocksCount;
  }

  return v6;
}

- (unsigned)enumerateMarkedObjects:(void *)a3 withBlock:(id)a4
{
  _QWORD *v6;
  unint64_t blocksCount;
  uint64_t v8;
  int v9;
  unint64_t v10;
  unsigned int v11;
  _VMUBlockNode *v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  unint64_t var0;
  void (*v17)(_QWORD *, unint64_t, _QWORD *, unsigned __int8 *);
  _QWORD v19[3];
  unsigned __int8 v20;

  v6 = a4;
  if (a3)
  {
    v20 = 0;
    blocksCount = self->_blocksCount;
    if ((_DWORD)blocksCount)
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        if (v10 >= *(unsigned int *)a3
          || ((*((unsigned __int8 *)a3 + (v10 >> 3) + 4) >> (v10 & 7)) & 1) == 0)
        {
          v15 = 0;
          goto LABEL_13;
        }
        v12 = &self->_blocks[v8];
        v13 = *((_QWORD *)v12 + 1);
        if ((v13 & 7) == 1)
          break;
        v14 = 0;
        if (v6)
          goto LABEL_11;
LABEL_12:
        ++v11;
        v15 = v9;
LABEL_13:
        if (++v10 < blocksCount)
        {
          ++v8;
          if (!v15)
            continue;
        }
        goto LABEL_17;
      }
      v14 = *(uint64_t *)((char *)self->_classInfos + ((v13 >> 38) & 0x3FFFFF8));
      if (!v6)
        goto LABEL_12;
LABEL_11:
      var0 = v12->var0;
      v17 = (void (*)(_QWORD *, unint64_t, _QWORD *, unsigned __int8 *))v6[2];
      v19[0] = var0;
      v19[1] = ((v13 & 7) << 60) | (v13 >> 5) & 0xFFFFFFFFFLL;
      v19[2] = v14;
      v17(v6, v10, v19, &v20);
      blocksCount = self->_blocksCount;
      v9 = v20;
      goto LABEL_12;
    }
  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (unsigned)enumerateRegionsWithBlock:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  char v9;

  v9 = 0;
  if (self->_regionsCount)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      (*((void (**)(id, id, char *))a3 + 2))(a3, self->_regions[v5].var0, &v9);
      ++v6;
      ++v5;
    }
    while (v6 < self->_regionsCount && v9 == 0);
  }
  else
  {
    LODWORD(v6) = 0;
  }
  return v6;
}

- (unsigned)enumerateReferencesWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  _QWORD v15[3];
  char v16;

  v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__VMUKernelCoreMemoryScanner_enumerateReferencesWithBlock___block_invoke;
  v7[3] = &unk_1E4E01028;
  v9 = v15;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v10 = &v11;
  -[VMUKernelCoreMemoryScanner scanNodesWithReferenceRecorder:](self, "scanNodesWithReferenceRecorder:", v7);
  LODWORD(self) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v15, 8);

  return self;
}

uint64_t __59__VMUKernelCoreMemoryScanner_enumerateReferencesWithBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v6;
  void *v7;
  void *v8;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v6 = (_QWORD *)result;
    v7 = *(void **)(result + 32);
    if (v7)
    {
      objc_msgSend(v7, "nodeDetails:", a2);
      v8 = (void *)v6[4];
      if (v8)
        objc_msgSend(v8, "nodeDetails:", a5);
    }
    result = (*(uint64_t (**)(void))(v6[5] + 16))();
    ++*(_DWORD *)(*(_QWORD *)(v6[7] + 8) + 24);
  }
  return result;
}

- (unsigned)nodeForAddress:(unint64_t)a3
{
  _VMURegionMap *regionMap;
  unint64_t var7;
  unint64_t var6;
  unint64_t v6;
  BOOL v7;
  _DWORD *v9;
  unint64_t v10;
  _DWORD *var3;
  unint64_t v12;
  char *v13;
  int v14;
  _DWORD *v15;
  int v16;
  _VMURegionNode *var4;
  _VMURegionNode *v18;
  unsigned int v19;
  unsigned int *var1;
  _VMUBlockNode *var0;
  uint64_t var2;
  _VMUBlockNode *v23;
  unint64_t v24;
  _VMUBlockNode *v25;
  unsigned int *v26;
  uint64_t v27;
  unint64_t *p_var0;
  uint64_t v29;
  unint64_t *v30;
  unsigned int v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  unint64_t var5;
  _VMURegionNode *v36;
  unint64_t v37;
  int v38;
  unint64_t v39;
  id *v40;
  unint64_t v41;
  unint64_t v42;
  id *v43;
  BOOL v44;

  regionMap = self->_regionMap;
  var6 = regionMap->var6;
  var7 = regionMap->var7;
  v6 = var7 - var6;
  v7 = var7 < var6;
  LODWORD(self) = -1;
  if (a3 - var6 >= v6 || v7)
    return self;
  v9 = (_DWORD *)MEMORY[0x1E0C85AC8];
  v10 = a3 >> *MEMORY[0x1E0C85AC8];
  if (v10)
  {
    var3 = regionMap->var3;
    v12 = a3 >> *MEMORY[0x1E0C85AC8];
    do
    {
      if (*var3 <= (v12 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v12 & 0x3FFFFFF) >> 3) + 4) >> (v12 & 7)) & 1) == 0)
      {
        goto LABEL_39;
      }
      v12 >>= 26;
    }
    while (v12);
  }
  v13 = (char *)regionMap + 4 * (v10 & 0x7FFFF);
  v16 = *((_DWORD *)v13 + 16);
  v15 = v13 + 64;
  v14 = v16;
  var4 = regionMap->var4;
  if (v16)
  {
    v18 = &var4[(unint64_t)(v14 - 1)];
    if (a3 - *((_QWORD *)v18->var0 + 1) < *((_QWORD *)v18->var0 + 2))
      goto LABEL_10;
  }
  var5 = regionMap->var5;
  if (!(_DWORD)var5)
    goto LABEL_39;
  v36 = regionMap->var4;
  while (1)
  {
    v37 = var5 >> 1;
    v18 = &v36[var5 >> 1];
    if (*((_QWORD *)v18->var0 + 1) <= a3)
      break;
LABEL_33:
    v33 = var5 >= 2;
    var5 = v37;
    if (!v33)
      goto LABEL_39;
  }
  if (*((_QWORD *)v18->var0 + 2) + *((_QWORD *)v18->var0 + 1) <= a3)
  {
    v36 = v18 + 1;
    v37 = --var5 >> 1;
    goto LABEL_33;
  }
  v38 = objc_msgSend(v18->var0, "isSpecialPhysFootprintRegion");
  if (v38)
    v39 = 0;
  else
    v39 = (unint64_t)v18;
  if ((v38 & 1) != 0)
    goto LABEL_39;
  if ((*(_BYTE *)(*(_QWORD *)v39 + 132) & 1) == 0)
    goto LABEL_55;
  v40 = (id *)(v39 + 64);
  v41 = regionMap->var5 - ((uint64_t)(v39 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v41)
    goto LABEL_52;
  while (2)
  {
    v42 = v41 >> 1;
    v43 = &v40[8 * (v41 >> 1)];
    if (*((_QWORD *)*v43 + 1) > a3)
    {
LABEL_46:
      v44 = v41 > 1;
      v41 = v42;
      if (!v44)
      {
        v41 = 0;
        goto LABEL_52;
      }
      continue;
    }
    break;
  }
  if (*((_QWORD *)*v43 + 2) + *((_QWORD *)*v43 + 1) <= a3)
  {
    v40 = v43 + 8;
    v42 = --v41 >> 1;
    goto LABEL_46;
  }
  if (objc_msgSend(*v43, "isSpecialPhysFootprintRegion"))
    v41 = 0;
  else
    v41 = (unint64_t)v43;
LABEL_52:
  if (v41)
    v39 = v41;
  v18 = (_VMURegionNode *)v39;
LABEL_55:
  *v15 = ((v39 - (unint64_t)var4) >> 6) + 1;
LABEL_10:
  v19 = v18->var3;
  if (!v19)
    goto LABEL_39;
  var1 = v18->var1;
  var0 = regionMap->var0;
  var2 = v18->var2;
  v23 = &regionMap->var0[var2];
  if (var1)
  {
    v24 = v23->var0;
    if (v24 <= a3)
    {
      v25 = &var0[v19 - 1 + var2];
      if (((*((_QWORD *)v25 + 1) >> 5) & 0xFFFFFFFFFLL) + v25->var0 > a3)
      {
        v26 = &var1[(a3 - (v24 & -*MEMORY[0x1E0C85AD8])) >> *v9];
        v27 = *v26;
        p_var0 = &var0[v27].var0;
        if (*p_var0 <= a3)
        {
          v29 = v26[1];
          if (v29 < regionMap->var1)
          {
            v30 = &var0[v29].var0;
            if (*v30 <= a3)
              return (unint64_t)((char *)v30 - (char *)var0) >> 4;
          }
          v31 = v29 - v27;
          if (v31)
          {
            do
            {
              v32 = v31 >> 1;
              v30 = &p_var0[2 * v32];
              if (*v30 <= a3)
              {
                if (((p_var0[2 * v32 + 1] >> 5) & 0xFFFFFFFFFLL) + *v30 > a3)
                  return (unint64_t)((char *)v30 - (char *)var0) >> 4;
                p_var0 = v30 + 2;
                LODWORD(v32) = --v31 >> 1;
              }
              LODWORD(self) = -1;
              v33 = v31 >= 2;
              v31 = v32;
            }
            while (v33);
            return self;
          }
        }
      }
    }
LABEL_39:
    LODWORD(self) = -1;
    return self;
  }
  do
  {
    v34 = v19 >> 1;
    v30 = &v23[v34].var0;
    if (*v30 <= a3)
    {
      if (((*((_QWORD *)&v23[v34] + 1) >> 5) & 0xFFFFFFFFFLL) + *v30 > a3)
        return (unint64_t)((char *)v30 - (char *)var0) >> 4;
      v23 = (_VMUBlockNode *)(v30 + 2);
      LODWORD(v34) = --v19 >> 1;
    }
    LODWORD(self) = -1;
    v33 = v19 >= 2;
    v19 = v34;
  }
  while (v33);
  return self;
}

- (unsigned)_nodeForAddress:(unint64_t)a3 checkMaxInteriorOffset:(BOOL)a4
{
  _VMURegionMap *regionMap;
  unint64_t var7;
  unint64_t var6;
  unint64_t v7;
  BOOL v8;
  _BOOL4 v9;
  _DWORD *v11;
  unint64_t v12;
  _DWORD *var3;
  unint64_t v14;
  char *v15;
  int v16;
  _DWORD *v17;
  int v18;
  _VMURegionNode *var4;
  _VMURegionNode *v20;
  unsigned int v21;
  unsigned int *var1;
  _VMUBlockNode *var0;
  uint64_t var2;
  _VMUBlockNode *v25;
  _VMUBlockNode *v26;
  unsigned int *v27;
  uint64_t v28;
  unint64_t *p_var0;
  uint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  unsigned int v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  unint64_t var5;
  _VMURegionNode *v38;
  unint64_t v39;
  int v40;
  unint64_t v41;
  id *v42;
  unint64_t v43;
  unint64_t v44;
  id *v45;
  BOOL v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;

  regionMap = self->_regionMap;
  var6 = regionMap->var6;
  var7 = regionMap->var7;
  v7 = var7 - var6;
  v8 = var7 < var6;
  LODWORD(self) = -1;
  if (a3 - var6 >= v7 || v8)
    return self;
  v9 = a4;
  v11 = (_DWORD *)MEMORY[0x1E0C85AC8];
  v12 = a3 >> *MEMORY[0x1E0C85AC8];
  if (v12)
  {
    var3 = regionMap->var3;
    v14 = a3 >> *MEMORY[0x1E0C85AC8];
    do
    {
      if (*var3 <= (v14 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v14 & 0x3FFFFFF) >> 3) + 4) >> (v14 & 7)) & 1) == 0)
      {
        goto LABEL_39;
      }
      v14 >>= 26;
    }
    while (v14);
  }
  v15 = (char *)regionMap + 4 * (v12 & 0x7FFFF);
  v18 = *((_DWORD *)v15 + 16);
  v17 = v15 + 64;
  v16 = v18;
  var4 = regionMap->var4;
  if (v18)
  {
    v20 = &var4[(unint64_t)(v16 - 1)];
    if (a3 - *((_QWORD *)v20->var0 + 1) < *((_QWORD *)v20->var0 + 2))
      goto LABEL_10;
  }
  var5 = regionMap->var5;
  if (!(_DWORD)var5)
    goto LABEL_39;
  v38 = regionMap->var4;
  while (1)
  {
    v39 = var5 >> 1;
    v20 = &v38[var5 >> 1];
    if (*((_QWORD *)v20->var0 + 1) <= a3)
      break;
LABEL_33:
    v35 = var5 >= 2;
    var5 = v39;
    if (!v35)
      goto LABEL_39;
  }
  if (*((_QWORD *)v20->var0 + 2) + *((_QWORD *)v20->var0 + 1) <= a3)
  {
    v38 = v20 + 1;
    v39 = --var5 >> 1;
    goto LABEL_33;
  }
  v40 = objc_msgSend(v20->var0, "isSpecialPhysFootprintRegion");
  if (v40)
    v41 = 0;
  else
    v41 = (unint64_t)v20;
  if ((v40 & 1) != 0)
    goto LABEL_39;
  if ((*(_BYTE *)(*(_QWORD *)v41 + 132) & 1) == 0)
    goto LABEL_59;
  v42 = (id *)(v41 + 64);
  v43 = regionMap->var5 - ((uint64_t)(v41 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v43)
    goto LABEL_56;
  while (2)
  {
    v44 = v43 >> 1;
    v45 = &v42[8 * (v43 >> 1)];
    if (*((_QWORD *)*v45 + 1) > a3)
    {
LABEL_46:
      v46 = v43 > 1;
      v43 = v44;
      if (!v46)
      {
        v43 = 0;
        goto LABEL_56;
      }
      continue;
    }
    break;
  }
  if (*((_QWORD *)*v45 + 2) + *((_QWORD *)*v45 + 1) <= a3)
  {
    v42 = v45 + 8;
    v44 = --v43 >> 1;
    goto LABEL_46;
  }
  if (objc_msgSend(*v45, "isSpecialPhysFootprintRegion"))
    v43 = 0;
  else
    v43 = (unint64_t)v45;
LABEL_56:
  if (v43)
    v41 = v43;
  v20 = (_VMURegionNode *)v41;
LABEL_59:
  *v17 = ((v41 - (unint64_t)var4) >> 6) + 1;
LABEL_10:
  v21 = v20->var3;
  if (!v21)
    goto LABEL_39;
  var1 = v20->var1;
  var0 = regionMap->var0;
  var2 = v20->var2;
  v25 = &regionMap->var0[var2];
  if (var1)
  {
    if (v25->var0 <= a3)
    {
      v26 = &var0[v21 - 1 + var2];
      if (((*((_QWORD *)v26 + 1) >> 5) & 0xFFFFFFFFFLL) + v26->var0 > a3)
      {
        v27 = &var1[(a3 - (v25->var0 & -*MEMORY[0x1E0C85AD8])) >> *v11];
        v28 = *v27;
        p_var0 = &var0[v28].var0;
        if (*p_var0 <= a3)
        {
          v30 = v27[1];
          if (v30 < regionMap->var1 && (v31 = &var0[v30].var0, v32 = *v31, *v31 <= a3))
          {
LABEL_48:
            if (!v9)
              return (unint64_t)((char *)v31 - (char *)var0) >> 4;
            v47 = v31[1];
            if ((v47 & 7) - 2 >= 3)
            {
              v48 = a3 - v32;
              v49 = regionMap->var2;
              if (v48 < v49 || ((v47 >> 5) & 0xFFFFFFFFFLL) - v48 <= v49)
                return (unint64_t)((char *)v31 - (char *)var0) >> 4;
            }
          }
          else
          {
            v33 = v30 - v28;
            if (v33)
            {
              do
              {
                v34 = v33 >> 1;
                v31 = &p_var0[2 * v34];
                v32 = *v31;
                if (*v31 <= a3)
                {
                  if (((p_var0[2 * v34 + 1] >> 5) & 0xFFFFFFFFFLL) + v32 > a3)
                    goto LABEL_48;
                  p_var0 = v31 + 2;
                  LODWORD(v34) = --v33 >> 1;
                }
                LODWORD(self) = -1;
                v35 = v33 >= 2;
                v33 = v34;
              }
              while (v35);
              return self;
            }
          }
        }
      }
    }
LABEL_39:
    LODWORD(self) = -1;
    return self;
  }
  do
  {
    v36 = v21 >> 1;
    v31 = &v25[v36].var0;
    v32 = *v31;
    if (*v31 <= a3)
    {
      if (((*((_QWORD *)&v25[v36] + 1) >> 5) & 0xFFFFFFFFFLL) + v32 > a3)
        goto LABEL_48;
      v25 = (_VMUBlockNode *)(v31 + 2);
      LODWORD(v36) = --v21 >> 1;
    }
    LODWORD(self) = -1;
    v35 = v21 >= 2;
    v21 = v36;
  }
  while (v35);
  return self;
}

- (void)copyUserMarked
{
  _DWORD *userMarkedAbandoned;
  size_t v3;
  void *v4;

  userMarkedAbandoned = self->_userMarkedAbandoned;
  if (!userMarkedAbandoned)
    return 0;
  v3 = ((*userMarkedAbandoned + 7) >> 3) + 4;
  v4 = malloc_type_malloc(v3, 0x37C10B9BuLL);
  memcpy(v4, userMarkedAbandoned, v3);
  return v4;
}

- (BOOL)is64bit
{
  return 1;
}

- (BOOL)isTranslatedByRosetta
{
  return -[VMUTask isTranslated](self->_task, "isTranslated");
}

- (unsigned)vmPageSize
{
  return *MEMORY[0x1E0C85AD8];
}

- (unsigned)kernelPageSize
{
  return *MEMORY[0x1E0C85AA8];
}

- (unsigned)nodeNamespaceSize
{
  return self->_blocksCount;
}

- (unint64_t)ledgerValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v6 = a3;
  -[VMUKernelCoreMemoryScanner ledger](self, "ledger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (a4)
      *a4 = 1;
    v9 = objc_msgSend(v8, "unsignedLongLongValue");
  }
  else
  {
    v9 = 0;
    if (a4)
      *a4 = 0;
  }

  return v9;
}

- (void)setNodeScanningLogger:(id)a3
{
  void *v4;
  id nodeLogger;

  if (self->_nodeLogger != a3)
  {
    v4 = (void *)MEMORY[0x1A85A995C](a3, a2);
    nodeLogger = self->_nodeLogger;
    self->_nodeLogger = v4;

  }
}

- (void)setReferenceScanningLogger:(id)a3
{
  void *v4;
  id referenceLogger;

  if (self->_referenceLogger != a3)
  {
    v4 = (void *)MEMORY[0x1A85A995C](a3, a2);
    referenceLogger = self->_referenceLogger;
    self->_referenceLogger = v4;

  }
}

- (int)pid
{
  return self->_pid;
}

- (VMUTaskMemoryCache)memoryCache
{
  return self->_memoryCache;
}

- (VMUObjectIdentifier)objectIdentifier
{
  return self->_objectIdentifier;
}

- (unint64_t)maxInteriorOffset
{
  return self->_maxInteriorOffset;
}

- (void)setMaxInteriorOffset:(unint64_t)a3
{
  self->_maxInteriorOffset = a3;
}

- (BOOL)exactScanningEnabled
{
  return self->_exactScanningEnabled;
}

- (void)setExactScanningEnabled:(BOOL)a3
{
  self->_exactScanningEnabled = a3;
}

- (unsigned)nodeCount
{
  return self->_blocksCount;
}

- (unsigned)zoneCount
{
  return self->_zonesCount;
}

- (unsigned)regionCount
{
  return self->_regionsCount;
}

- (unsigned)scanningMask
{
  return self->_scanningMask;
}

- (void)setScanningMask:(unsigned int)a3
{
  self->_scanningMask = a3;
}

- (BOOL)abandonedMarkingEnabled
{
  return self->_abandonedMarkingEnabled;
}

- (void)setAbandonedMarkingEnabled:(BOOL)a3
{
  self->_abandonedMarkingEnabled = a3;
}

- (VMUDebugTimer)debugTimer
{
  return self->_debugTimer;
}

- (void)setDebugTimer:(id)a3
{
  objc_storeStrong((id *)&self->_debugTimer, a3);
}

- (BOOL)showRawClassNames
{
  return self->_showRawClassNames;
}

- (void)setShowRawClassNames:(BOOL)a3
{
  self->_showRawClassNames = a3;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)processDescriptionString
{
  return self->_processDescriptionString;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (NSString)binaryImagesDescription
{
  return self->_binaryImagesDescription;
}

- (unint64_t)physicalFootprint
{
  return self->_physicalFootprint;
}

- (unint64_t)physicalFootprintPeak
{
  return self->_physicalFootprintPeak;
}

- (NSDictionary)ledger
{
  return self->_ledger;
}

- (unsigned)idleExitStatus
{
  return self->_idleExitStatus;
}

- (BOOL)recordRuntimeMetadataChunkInfo
{
  return self->_recordRuntimeMetadataChunkInfo;
}

- (void)setRecordRuntimeMetadataChunkInfo:(BOOL)a3
{
  self->_recordRuntimeMetadataChunkInfo = a3;
}

- (unint64_t)suspendTimeContinuous
{
  return self->_suspendTimeContinuous;
}

- (VMUScanOverlay)scanOverlay
{
  return self->_scanOverlay;
}

- (_VMURegionNode)regions
{
  return self->_regions;
}

- (_VMUBlockNode)blocks
{
  uint64_t v0;

  return *(_VMUBlockNode **)(v0 + 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanOverlay, 0);
  objc_storeStrong((id *)&self->_nonScannableZoneNames, 0);
  objc_storeStrong((id *)&self->_nonscannableGlobalSymbolsArray, 0);
  objc_storeStrong((id *)&self->_srcAddressToExtraAutoreleaseCountDict, 0);
  objc_storeStrong((id *)&self->_variantCachesByIsaIndex, 0);
  objc_storeStrong((id *)&self->_processObjectGraph, 0);
  objc_storeStrong(&self->_nodeLogger, 0);
  objc_storeStrong(&self->_referenceLogger, 0);
  objc_storeStrong((id *)&self->_ledger, 0);
  objc_storeStrong((id *)&self->_binaryImagesDescription, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_processDescriptionString, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_debugTimer, 0);
  objc_storeStrong((id *)&self->_classStructureAddressToDestinationMapTable, 0);
  objc_storeStrong((id *)&self->_mappedFileNameToLengthDict, 0);
  objc_storeStrong((id *)&self->_classInfoIndexer, 0);
  objc_storeStrong((id *)&self->_threadStates, 0);
  objc_storeStrong((id *)&self->_addressToRuntimeMetadataChunkInfoDict, 0);
  objc_storeStrong((id *)&self->_dataSegmentsRangeArrayOutsideSharedCache, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_stackRanges, 0);
  objc_storeStrong(&self->_regionInfoBlock, 0);
  objc_storeStrong((id *)&self->_regionIdentifier, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_memoryCache, 0);
  objc_storeStrong((id *)&self->_suspendDate, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

- (void)initWithVMUTask:options:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A4D79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "error: core's pointer size doesn't match the host system, cannot continue", v0, 2u);
}

- (void)initWithVMUTask:(void *)a3 options:.cold.2(unint64_t a1, uint8_t *buf, void *a3)
{
  uint64_t v4;

  v4 = *MEMORY[0x1E0C85AD8] >> 10;
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1 >> 10;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = v4;
  _os_log_error_impl(&dword_1A4D79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "error: core's page size doesn't match the host system (%u KB vs %u KB), cannot continue", buf, 0xEu);

}

@end
