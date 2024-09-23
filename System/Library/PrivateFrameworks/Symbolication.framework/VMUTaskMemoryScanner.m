@implementation VMUTaskMemoryScanner

+ (void)initialize
{
  char *v2;
  int v3;
  BOOL v4;
  BOOL v6;
  pthread_t v7;

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
    s_enumeratorDebugging = v6;
    v7 = 0;
    if (pthread_create(&v7, 0, (void *(__cdecl *)(void *))_determine_pthread_offsets, (void *)0x123456789ABCDEF1))
    {
      fwrite("couldn't create new pthread for determine_pthread_offsets\n", 0x3AuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
      exit(1);
    }
    pthread_join(v7, 0);
  }
}

- (unsigned)task
{
  return -[VMUTask taskPort](self->_task, "taskPort");
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
  VMUTaskMemoryCache *memoryCache;
  VMUObjectIdentifier *v8;
  VMUTaskMemoryCache *v9;
  VMUTaskMemoryCache *v10;
  _VMURegionNode *v11;
  void (**v12)(void);
  _QWORD v13[4];
  VMUTaskMemoryCache *v14;
  VMUObjectIdentifier *v15;
  _VMURegionNode *v16;
  _VMURegionNode *v17;

  if (self->_regionsCount)
  {
    v3 = 0;
    v4 = 0;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      regions = self->_regions;
      memoryCache = self->_memoryCache;
      v8 = self->_objectIdentifier;
      v9 = memoryCache;
      v10 = v9;
      if (regions[v3].var7)
      {
        if (&regions[v3] == regions[v3].var8)
        {
          v13[0] = v5;
          v13[1] = 3221225472;
          v13[2] = ___unmapRegion_block_invoke;
          v13[3] = &unk_1E4E01050;
          v14 = v9;
          v16 = &regions[v3];
          v15 = v8;
          v17 = regions;
          v12 = (void (**)(void))MEMORY[0x1A85A995C](v13);
          v12[2]();

        }
        else
        {
          v11 = &regions[v3];
          v11->var6 = 0;
          v11->var7 = 0;
          v11->var8 = 0;
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

- (VMUTaskMemoryScanner)initWithVMUTask:(id)a3 options:(unint64_t)a4
{
  id v7;
  VMUTaskMemoryScanner *v8;
  VMUTaskMemoryScanner *v9;
  void *v10;
  VMUTaskMemoryScanner *v11;
  VMUTaskMemoryScanner *v12;
  objc_class *v13;
  void *v14;
  NSObject *v16;
  uint64_t v17;
  os_signpost_id_t v18;
  NSObject *v19;
  uint64_t v20;
  os_signpost_id_t v21;
  void *v22;
  uint64_t v23;
  NSString *processDescriptionString;
  uint64_t v25;
  NSDate *suspendDate;
  uint64_t v27;
  NSString *processName;
  uint64_t v29;
  NSString *binaryImagesDescription;
  uint64_t v31;
  NSString *executablePath;
  NSObject *v33;
  uint64_t v34;
  os_signpost_id_t v35;
  uint64_t v36;
  NSMutableDictionary *variantCachesByIsaIndex;
  uint64_t v38;
  NSMutableDictionary *srcAddressToExtraAutoreleaseCountDict;
  uint64_t v40;
  NSMutableDictionary *mappedFileNameToLengthDict;
  unint64_t v42;
  VMUVMRegionIdentifier *v43;
  VMUVMRegionIdentifier *regionIdentifier;
  void *v45;
  unsigned int v46;
  _VMURegionNode *v47;
  uint64_t v48;
  unint64_t i;
  id v50;
  _VMURegionNode *regions;
  unint64_t regionsCount;
  int v53;
  _QWORD *v54;
  _DWORD *v55;
  uint64_t v56;
  _DWORD *v57;
  uint64_t v58;
  id *p_var0;
  unint64_t *v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unsigned int *v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  uint64_t v77;
  VMUTaskMemoryCache *memoryCache;
  _VMURegionMap *regionMap;
  uint64_t v80;
  uint64_t v81;
  id regionInfoBlock;
  VMURangeArray *v83;
  VMURangeArray *dataSegmentsRangeArrayOutsideSharedCache;
  uint64_t v85;
  VMUTaskThreadStates *threadStates;
  NSObject *v87;
  os_signpost_id_t v88;
  NSObject *v89;
  os_signpost_id_t v90;
  uint64_t v91;
  NSMutableArray *zoneNames;
  VMUTask *task;
  id *v94;
  NSObject *v95;
  os_signpost_id_t v96;
  size_t v97;
  id v98;
  VMUObjectIdentifier *v99;
  id v100;
  id v101;
  uint64_t v102;
  id v103;
  NSObject *v104;
  os_signpost_id_t v105;
  NSObject *v106;
  os_signpost_id_t v107;
  VMUScanOverlay *v108;
  id v109;
  NSObject *v110;
  os_signpost_id_t v111;
  VMUTask *v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  void *v116;
  id v117;
  VMUTask **p_task;
  void *v119;
  int v120;
  uint8_t v121[16];
  _QWORD __compar[4];
  id *v123;
  _QWORD v124[4];
  id *v125;
  _QWORD v126[6];
  _QWORD buf[5];
  id v128;
  objc_super v129;

  v7 = a3;
  v129.receiver = self;
  v129.super_class = (Class)VMUTaskMemoryScanner;
  v8 = -[VMUTaskMemoryScanner init](&v129, sel_init);
  if (v8)
  {
    v9 = v8;
    +[VMUDebugTimer sharedTimerIfCreated](VMUDebugTimer, "sharedTimerIfCreated");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v9->_task, a3);
    v9->_pid = -[VMUTask pid](v9->_task, "pid");
    if (-[VMUTask pid](v9->_task, "pid") < 0)
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("[%@] Invalid task port provided to initializer."), v14);

      goto LABEL_8;
    }
    if (objc_msgSend(v7, "taskType") == 2)
    {
      NSLog(CFSTR("VMUTaskMemoryScanner does not support kernel cores."));
LABEL_8:

LABEL_9:
      v11 = 0;
LABEL_10:
      v12 = 0;
      goto LABEL_11;
    }
    if (v10)
    {
      if (objc_msgSend(v10, "signpostID"))
      {
        objc_msgSend(v10, "logHandle");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v10, "signpostID");
        if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v18 = v17;
          if (os_signpost_enabled(v16))
          {
            LOWORD(buf[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v16, OS_SIGNPOST_INTERVAL_END, v18, "initMemoryScanner", ", (uint8_t *)buf, 2u);
          }
        }

      }
      objc_msgSend(v10, "endEvent:", "initMemoryScanner");
      objc_msgSend(v10, "startWithCategory:message:", "initMemoryScanner", "building VMUProcessDescription");
      objc_msgSend(v10, "logHandle");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v10, "signpostID");
      if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v21 = v20;
        if (os_signpost_enabled(v19))
        {
          LOWORD(buf[0]) = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "initMemoryScanner", "building VMUProcessDescription", (uint8_t *)buf, 2u);
        }
      }

    }
    else
    {
      objc_msgSend(0, "endEvent:", "initMemoryScanner");
      objc_msgSend(0, "startWithCategory:message:", "initMemoryScanner", "building VMUProcessDescription");
    }
    -[VMUTask processDescription](v9->_task, "processDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)objc_msgSend(v22, "pid") >= 1)
    {
      objc_msgSend(v22, "description");
      v23 = objc_claimAutoreleasedReturnValue();
      processDescriptionString = v9->_processDescriptionString;
      v9->_processDescriptionString = (NSString *)v23;

      objc_msgSend(v22, "date");
      v25 = objc_claimAutoreleasedReturnValue();
      suspendDate = v9->_suspendDate;
      v9->_suspendDate = (NSDate *)v25;

      objc_msgSend(v22, "processName");
      v27 = objc_claimAutoreleasedReturnValue();
      processName = v9->_processName;
      v9->_processName = (NSString *)v27;

      if ((a4 & 0x8000) != 0)
      {
        objc_msgSend(v22, "binaryImagesDescription");
        v29 = objc_claimAutoreleasedReturnValue();
        binaryImagesDescription = v9->_binaryImagesDescription;
        v9->_binaryImagesDescription = (NSString *)v29;

      }
      objc_msgSend(v22, "executablePath");
      v31 = objc_claimAutoreleasedReturnValue();
      executablePath = v9->_executablePath;
      v9->_executablePath = (NSString *)v31;

      v9->_physicalFootprint = objc_msgSend(v22, "physicalFootprint");
      v9->_physicalFootprintPeak = objc_msgSend(v22, "physicalFootprintPeak");
      v9->_idleExitStatus = objc_msgSend(v22, "idleExitStatus");
    }
    if (v10 && objc_msgSend(v10, "signpostID"))
    {
      objc_msgSend(v10, "logHandle");
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v10, "signpostID");
      if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v35 = v34;
        if (os_signpost_enabled(v33))
        {
          LOWORD(buf[0]) = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v33, OS_SIGNPOST_INTERVAL_END, v35, "initMemoryScanner", ", (uint8_t *)buf, 2u);
        }
      }

    }
    objc_msgSend(v10, "endEvent:", "initMemoryScanner");
    if (!-[VMUTaskMemoryScanner _suspend](v9, "_suspend"))
    {

      goto LABEL_9;
    }
    p_task = &v9->_task;
    mach_get_times();
    v9->_maxInteriorOffset = *MEMORY[0x1E0C85AD8];
    v9->_scanningMask = VMUScanningMaskForOwningReferences();
    v9->_exactScanningEnabled = 1;
    v9->_abandonedMarkingEnabled = 1;
    v36 = objc_opt_new();
    variantCachesByIsaIndex = v9->_variantCachesByIsaIndex;
    v9->_variantCachesByIsaIndex = (NSMutableDictionary *)v36;

    v38 = objc_opt_new();
    srcAddressToExtraAutoreleaseCountDict = v9->_srcAddressToExtraAutoreleaseCountDict;
    v9->_srcAddressToExtraAutoreleaseCountDict = (NSMutableDictionary *)v38;

    v40 = objc_opt_new();
    mappedFileNameToLengthDict = v9->_mappedFileNameToLengthDict;
    v9->_mappedFileNameToLengthDict = (NSMutableDictionary *)v40;

    v42 = VMUGetFlagsForAllVMRegionStatistics() | a4 | 0x180;
    v43 = -[VMUVMRegionIdentifier initWithVMUTask:options:]([VMUVMRegionIdentifier alloc], "initWithVMUTask:options:", v9->_task, v42);
    regionIdentifier = v9->_regionIdentifier;
    v9->_regionIdentifier = v43;

    -[VMUVMRegionIdentifier regions](v9->_regionIdentifier, "regions");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "count");
    v9->_regionsCount = v46;
    v119 = v22;
    if (v46)
    {
      v115 = v42;
      v47 = (_VMURegionNode *)malloc_type_calloc(v46, 0x40uLL, 0x10B0040310C8A7FuLL);
      v9->_regions = v47;
      v116 = v45;
      v117 = v7;
      if (v9->_regionsCount)
      {
        v48 = 0;
        for (i = 0; i < regionsCount; ++i)
        {
          v50 = (id)objc_msgSend(v45, "objectAtIndexedSubscript:", i);
          regions = v9->_regions;
          regions[v48].var0 = v50;
          regionsCount = v9->_regionsCount;
          ++v48;
        }
      }
      else
      {
        regions = v47;
        LODWORD(regionsCount) = 0;
      }
      v54 = malloc_type_calloc(1uLL, 0x200040uLL, 0x518382DFuLL);
      v54[6] = -1;
      v55 = malloc_type_calloc(1uLL, 0x800004uLL, 0xFF42C4F3uLL);
      *v55 = 0x4000000;
      v54[3] = v55;
      v54[4] = regions;
      *((_DWORD *)v54 + 10) = regionsCount;
      if ((_DWORD)regionsCount)
      {
        v56 = 0;
        v57 = (_DWORD *)MEMORY[0x1E0C85AC8];
        v58 = regionsCount;
        do
        {
          p_var0 = &regions[v56].var0;
          if ((objc_msgSend(*p_var0, "isSpecialPhysFootprintRegion") & 1) == 0)
          {
            v60 = (unint64_t *)((char *)*p_var0 + 8);
            v61 = *v60;
            v62 = *((_QWORD *)*p_var0 + 2) + *v60;
            v63 = v54[6];
            v64 = v54[7];
            if (v63 >= v61)
              v63 = v61;
            if (v64 <= v62)
              v64 = v62;
            v54[6] = v63;
            v54[7] = v64;
            v65 = v61 >> *v57;
            if (v65)
            {
              v66 = (~*MEMORY[0x1E0C85AC0] & (*MEMORY[0x1E0C85AC0] + v62)) >> *v57;
              do
              {
                if (v65 + 1 > v66)
                  v67 = v65 + 1;
                else
                  v67 = v66;
                v68 = (unsigned int *)v54[3];
                v69 = v65 & 0x3FFFFFF;
                v70 = *v68;
                if (*v68 > (v65 & 0x3FFFFFF))
                {
                  v71 = ((v67 - v65) & 0x3FFFFFF) + v69;
                  if (v70 < v71)
                    v71 = *v68;
                  v72 = (v69 + 7) & 0x7FFFFF8;
                  if (v72 >= v71)
                    v72 = v71;
                  if (v69 < v72)
                  {
                    do
                    {
                      if (v70 > v69)
                        *((_BYTE *)v68 + (v69 >> 3) + 4) |= 1 << (v69 & 7);
                      ++v69;
                    }
                    while (v72 != v69);
                    v69 = v72;
                  }
                  v73 = v71 & 0x7FFFFF8;
                  if ((v71 & 0x7FFFFF8) <= v69)
                    v73 = v69;
                  if (v71 > v73)
                  {
                    v74 = v71 - 1;
                    do
                    {
                      if (v70 > v74)
                        *((_BYTE *)v68 + (v74 >> 3) + 4) |= 1 << (v74 & 7);
                      v75 = v74 - 1;
                    }
                    while (v74-- > v73);
                    v71 = v75 + 1;
                  }
                  memset((char *)v68 + (v69 >> 3) + 4, 255, (v71 - v69) >> 3);
                }
                v65 >>= 26;
                v66 = v67 >> 26;
              }
              while (v65);
            }
          }
          ++v56;
        }
        while (v56 != v58);
      }
      v9->_regionMap = (_VMURegionMap *)v54;
      -[VMUTask memoryCache](v9->_task, "memoryCache");
      v77 = objc_claimAutoreleasedReturnValue();
      memoryCache = v9->_memoryCache;
      v9->_memoryCache = (VMUTaskMemoryCache *)v77;

      if (v9->_memoryCache)
      {
        -[VMUTaskMemoryScanner unmapAllRegions](v9, "unmapAllRegions");
        v45 = v116;
        -[VMUTaskMemoryScanner mapDyldSharedCacheFromTargetWithRegions:](v9, "mapDyldSharedCacheFromTargetWithRegions:", v116);
        regionMap = v9->_regionMap;
        buf[0] = 0;
        buf[1] = buf;
        buf[2] = 0x3032000000;
        buf[3] = __Block_byref_object_copy_;
        buf[4] = __Block_byref_object_dispose_;
        v128 = 0;
        v80 = MEMORY[0x1E0C809B0];
        v126[0] = MEMORY[0x1E0C809B0];
        v126[1] = 3221225472;
        v126[2] = __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke;
        v126[3] = &unk_1E4E00858;
        v126[4] = buf;
        v126[5] = regionMap;
        v81 = MEMORY[0x1A85A995C](v126);
        regionInfoBlock = v9->_regionInfoBlock;
        v9->_regionInfoBlock = (id)v81;

        -[VMUTaskMemoryCache setRegionInfoBlock:](v9->_memoryCache, "setRegionInfoBlock:", v9->_regionInfoBlock);
        v7 = v117;
        v83 = objc_alloc_init(VMURangeArray);
        dataSegmentsRangeArrayOutsideSharedCache = v9->_dataSegmentsRangeArrayOutsideSharedCache;
        v9->_dataSegmentsRangeArrayOutsideSharedCache = v83;

        -[VMUVMRegionIdentifier taskThreadStates](v9->_regionIdentifier, "taskThreadStates");
        v85 = objc_claimAutoreleasedReturnValue();
        threadStates = v9->_threadStates;
        v9->_threadStates = (VMUTaskThreadStates *)v85;

        v9->_threadsCount = -[VMUTaskThreadStates threadCount](v9->_threadStates, "threadCount");
        if (v10 && objc_msgSend(v10, "signpostID"))
        {
          objc_msgSend(v10, "logHandle");
          v87 = objc_claimAutoreleasedReturnValue();
          v88 = objc_msgSend(v10, "signpostID");
          if (v88 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v87))
          {
            *(_WORD *)v121 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v87, OS_SIGNPOST_INTERVAL_END, v88, "initMemoryScanner", ", v121, 2u);
          }

        }
        objc_msgSend(v10, "endEvent:", "initMemoryScanner");
        objc_msgSend(v10, "startWithCategory:message:", "initMemoryScanner", "get malloc zones array");
        if (v10)
        {
          objc_msgSend(v10, "logHandle");
          v89 = objc_claimAutoreleasedReturnValue();
          v90 = objc_msgSend(v10, "signpostID");
          if (v90 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
          {
            *(_WORD *)v121 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v89, OS_SIGNPOST_INTERVAL_BEGIN, v90, "initMemoryScanner", "get malloc zones array", v121, 2u);
          }

        }
        v91 = objc_opt_new();
        zoneNames = v9->_zoneNames;
        v9->_zoneNames = (NSMutableArray *)v91;

        task = v9->_task;
        v124[0] = v80;
        v124[1] = 3221225472;
        v124[2] = __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke_38;
        v124[3] = &unk_1E4E00880;
        v94 = v9;
        v125 = v94;
        VMUTask_foreach_malloc_zone(task, v124);
        if (v10 && objc_msgSend(v10, "signpostID"))
        {
          objc_msgSend(v10, "logHandle");
          v95 = objc_claimAutoreleasedReturnValue();
          v96 = objc_msgSend(v10, "signpostID");
          if (v96 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v95))
          {
            *(_WORD *)v121 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v95, OS_SIGNPOST_INTERVAL_END, v96, "initMemoryScanner", ", v121, 2u);
          }

        }
        objc_msgSend(v10, "endEvent:", "initMemoryScanner");
        v97 = *((unsigned int *)v94 + 54);
        if ((_DWORD)v97 && v9->_regions)
        {
          v98 = v94[26];
          __compar[0] = v80;
          __compar[1] = 3221225472;
          __compar[2] = __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke_2;
          __compar[3] = &unk_1E4E008C8;
          v123 = (id *)&__block_literal_global;
          mergesort_b(v98, v97, 0x18uLL, __compar);
          -[NSMutableArray sortUsingComparator:](v9->_zoneNames, "sortUsingComparator:", &__block_literal_global);
          v99 = -[VMUObjectIdentifier initWithVMUTask:symbolicator:scanner:]([VMUObjectIdentifier alloc], "initWithVMUTask:symbolicator:scanner:", *p_task, 0, 0, v94);
          v100 = v94[8];
          v94[8] = v99;

          v101 = v94[8];
          if (!v101)
            goto LABEL_120;
          objc_msgSend(v101, "realizedClasses");
          v102 = objc_claimAutoreleasedReturnValue();
          v103 = v94[34];
          v94[34] = (id)v102;

          if (v10 && objc_msgSend(v10, "signpostID"))
          {
            objc_msgSend(v10, "logHandle");
            v104 = objc_claimAutoreleasedReturnValue();
            v105 = objc_msgSend(v10, "signpostID");
            if (v105 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v104))
            {
              *(_WORD *)v121 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A4D79000, v104, OS_SIGNPOST_INTERVAL_END, v105, "initMemoryScanner", ", v121, 2u);
            }

          }
          objc_msgSend(v10, "endEvent:", "initMemoryScanner");
          objc_msgSend(v10, "startWithCategory:message:", "initMemoryScanner", "setting up VMUScanOverlay");
          if (v10)
          {
            objc_msgSend(v10, "logHandle");
            v106 = objc_claimAutoreleasedReturnValue();
            v107 = objc_msgSend(v10, "signpostID");
            if (v107 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v106))
            {
              *(_WORD *)v121 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A4D79000, v106, OS_SIGNPOST_INTERVAL_BEGIN, v107, "initMemoryScanner", "setting up VMUScanOverlay", v121, 2u);
            }

          }
          v108 = -[VMUScanOverlay initWithScanner:]([VMUScanOverlay alloc], "initWithScanner:", v94);
          v109 = v94[69];
          v94[69] = v108;

          objc_msgSend(v94, "refineTypesWithOverlay:", v94[69]);
          if (v10 && objc_msgSend(v10, "signpostID"))
          {
            objc_msgSend(v10, "logHandle");
            v110 = objc_claimAutoreleasedReturnValue();
            v111 = objc_msgSend(v10, "signpostID");
            if (v111 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v110))
            {
              *(_WORD *)v121 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A4D79000, v110, OS_SIGNPOST_INTERVAL_END, v111, "initMemoryScanner", ", v121, 2u);
            }

          }
          objc_msgSend(v10, "endEvent:", "initMemoryScanner");
          v94[66] = (id)objc_msgSend(v94[8], "addressOfSymbol:inLibrary:", "___CFPasteboardReservedBase", "CoreFoundation");
          *((_BYTE *)v94 + 192) = objc_msgSend(v94, "doesTargetProcessHaveObjCPatches");
          v94[58] = (id)v115;
          *(_QWORD *)v121 = 0;
          v120 = 0;
          v112 = *p_task;
          v113 = objc_msgSend(v94[8], "symbolicator");
          if (task_get_malloc_zones_array_address_and_count(v112, v113, v114, v121, &v120, 0))
          {
            v53 = 0;
            if (v120)
              v94[67] = *(id *)v121;
          }
          else
          {
LABEL_120:

            v94 = 0;
            v53 = 1;
          }
          v11 = (VMUTaskMemoryScanner *)v94;
          v94 = v123;
        }
        else
        {
          v11 = 0;
          v53 = 1;
        }

        _Block_object_dispose(buf, 8);
      }
      else
      {

        v11 = 0;
        v53 = 1;
        v45 = v116;
        v7 = v117;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[VMUTaskMemoryScanner initWithVMUTask:options:].cold.1();

      v11 = 0;
      v53 = 1;
    }

    if (v53)
      goto LABEL_10;
  }
  else
  {
    v11 = 0;
  }
  v11 = v11;
  v12 = v11;
LABEL_11:

  return v12;
}

uint64_t __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke(uint64_t a1, unint64_t a2)
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

uint64_t __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke_38(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;

  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(unsigned int *)(v8 + 220);
  if (v9 <= *(_DWORD *)(v8 + 216))
  {
    v10 = 2 * v9;
    if ((2 * v9) <= 8)
      v10 = 8;
    *(_DWORD *)(v8 + 220) = v10;
    while (1)
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_DWORD *)(v11 + 220);
      if (v12 >= *(_DWORD *)(v11 + 216))
        break;
      *(_DWORD *)(v11 + 220) = 2 * v12;
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = malloc_type_realloc(*(void **)(v11 + 208), 24 * v12, 0x10A00404568A766uLL);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(v13 + 208);
    if (!v14)
    {
      NSLog(CFSTR("Out of memory: failed to expand %s from %u to %u entries"), "_zones", v9, *(unsigned int *)(v13 + 220));
      abort();
    }
    bzero((void *)(v14 + 24 * v9), 24 * (*(_DWORD *)(v13 + 220) - v9));
  }
  if (!v7)
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UnknownZone (%#llx)"), a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "addObject:", v7);
  v15 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) + 24 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 216));
  *v15 = a2;
  v15[1] = (uint64_t)v7;
  v15[2] = a3;
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 216);

  return 0;
}

uint64_t __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("DefaultMallocZone")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v5, "rangeOfString:", CFSTR("DefaultMallocZone")) == 0x7FFFFFFFFFFFFFFFLL)
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

uint64_t __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_initWithTask:(unsigned int)a3 options:(unint64_t)a4
{
  VMUTask *v6;
  VMUTaskMemoryScanner *v7;

  v6 = -[VMUTask initWithTask:]([VMUTask alloc], "initWithTask:", *(_QWORD *)&a3);
  v7 = -[VMUTaskMemoryScanner initWithVMUTask:options:](self, "initWithVMUTask:options:", v6, a4);

  return v7;
}

- (VMUTaskMemoryScanner)initWithSelfTaskAndOptions:(unint64_t)a3
{
  return (VMUTaskMemoryScanner *)-[VMUTaskMemoryScanner _initWithTask:options:](self, "_initWithTask:options:", *MEMORY[0x1E0C83DA0], a3);
}

- (VMUTaskMemoryScanner)initWithTask:(unsigned int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  VMUTaskMemoryScanner *v7;

  v5 = *(_QWORD *)&a3;
  if ((VMUTaskIsSelf() & 1) != 0)
  {
    NSLog(CFSTR("Illegal attempt to scan memory of mach_task_self()"));
    v7 = 0;
  }
  else
  {
    self = (VMUTaskMemoryScanner *)-[VMUTaskMemoryScanner _initWithTask:options:](self, "_initWithTask:options:", v5, a4);
    v7 = self;
  }

  return v7;
}

- (id)initFullyWithTask:(unsigned int)a3 error:(id *)a4
{
  VMUTaskMemoryScanner *v5;
  _BOOL4 v6;
  VMUTaskMemoryScanner *v7;

  v5 = -[VMUTaskMemoryScanner initWithTask:options:](self, "initWithTask:options:", *(_QWORD *)&a3, 0);
  v6 = -[VMUTaskMemoryScanner addAllNodesFromTaskWithError:](v5, "addAllNodesFromTaskWithError:", a4);
  v7 = 0;
  if (v6)
    v7 = v5;

  return v7;
}

- (id)initFullyWithTask:(unsigned int)a3
{
  return -[VMUTaskMemoryScanner initFullyWithTask:error:](self, "initFullyWithTask:error:", *(_QWORD *)&a3, 0);
}

- (VMUTaskMemoryScanner)initWithTask:(unsigned int)a3
{
  return -[VMUTaskMemoryScanner initWithTask:options:](self, "initWithTask:options:", *(_QWORD *)&a3, 0);
}

- (BOOL)doesTargetProcessHaveObjCPatches
{
  unint64_t v3;
  unint64_t v4;
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD);
  _BYTE *v6;

  v3 = -[VMUObjectIdentifier addressOfSymbol:inLibrary:](self->_objectIdentifier, "addressOfSymbol:inLibrary:", "_dyld_process_has_objc_patches", "libdyld.dylib");
  if (v3)
  {
    v4 = v3;
    -[VMUObjectIdentifier memoryReader](self->_objectIdentifier, "memoryReader");
    v5 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = (_BYTE *)v5[2](v5, v4, 1);

    if (v6)
      LOBYTE(v3) = *v6 != 0;
    else
      LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)mapDyldSharedCacheFromTargetWithRegions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v4);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend((id)v12, "isSubmap", (_QWORD)v15) & 1) == 0)
        {
          if (-[VMUTask rangeIsInSharedCache:](self->_task, "rangeIsInSharedCache:", *(_QWORD *)(v12 + 8), *(_QWORD *)(v12 + 16)))
          {
            v13 = *(_DWORD *)(v12 + 24);
            if (v13 == v9)
            {
              v14 = *(_QWORD *)(v12 + 8);
            }
            else
            {
              if (v7 && v8)
              {
                -[VMUTaskMemoryCache mapAddress:size:](self->_memoryCache, "mapAddress:size:", v7, v8);
                v13 = *(_DWORD *)(v12 + 24);
              }
              v14 = *(_QWORD *)(v12 + 8);
              v7 = v14;
              v9 = v13;
            }
            v8 = v14 - v7 + *(_QWORD *)(v12 + 16);
          }
          else if (v7)
          {
            goto LABEL_19;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
LABEL_19:

    if (v7 && v8)
      -[VMUTaskMemoryCache mapAddress:size:](self->_memoryCache, "mapAddress:size:", v7, v8);
  }
  else
  {

  }
}

- (BOOL)_suspend
{
  unsigned int v3;
  kern_return_t v4;
  mach_error_t v5;
  FILE *v6;
  char *v7;
  VMUTask *task;

  if (-[VMUTask isCore](self->_task, "isCore"))
    goto LABEL_2;
  v3 = -[VMUTask taskPort](self->_task, "taskPort");
  if (!v3)
    return v3;
  if (-[VMUTask taskPort](self->_task, "taskPort") == -1)
  {
LABEL_10:
    LOBYTE(v3) = 0;
    return v3;
  }
  -[VMUTask taskPort](self->_task, "taskPort");
  if ((VMUTaskIsSelf() & 1) == 0)
  {
    v4 = task_suspend2(-[VMUTask taskPort](self->_task, "taskPort"), &self->_suspensionToken);
    if (v4)
    {
      v5 = v4;
      if (task_exists(self->_task))
      {
        v6 = (FILE *)*MEMORY[0x1E0C80C10];
        v7 = mach_error_string(v5);
        fprintf(v6, "Unable to suspend target task: %s (%d)\n", v7, v5);
      }
      task = self->_task;
      self->_task = 0;

      goto LABEL_10;
    }
  }
LABEL_2:
  LOBYTE(v3) = 1;
  return v3;
}

- (void)detachFromTask
{
  kern_return_t v3;
  mach_error_t v4;
  FILE *v5;
  char *v6;
  VMUTask *task;

  if (!-[VMUTask isCore](self->_task, "isCore"))
  {
    if (-[VMUTask taskPort](self->_task, "taskPort"))
    {
      if (-[VMUTask taskPort](self->_task, "taskPort") != -1)
      {
        -[VMUTask taskPort](self->_task, "taskPort");
        if ((VMUTaskIsSelf() & 1) == 0)
        {
          v3 = task_resume2(self->_suspensionToken);
          if (v3)
          {
            v4 = v3;
            if (task_exists(self->_task))
            {
              v5 = (FILE *)*MEMORY[0x1E0C80C10];
              v6 = mach_error_string(v4);
              fprintf(v5, "Unable to resume target task: %s (%d)\n", v6, v4);
            }
          }
          task = self->_task;
          self->_task = 0;

          -[VMUTaskMemoryScanner setNodeScanningLogger:](self, "setNodeScanningLogger:", 0);
          -[VMUTaskMemoryScanner setReferenceScanningLogger:](self, "setReferenceScanningLogger:", 0);
        }
      }
    }
  }
}

- (void)dealloc
{
  _VMUBlockNode *blocks;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _VMURegionNode *regions;
  VMUTaskMemoryCache *memoryCache;
  VMUObjectIdentifier *v9;
  VMUTaskMemoryCache *v10;
  VMUTaskMemoryCache *v11;
  _VMURegionNode *v12;
  void (**v13)(void);
  unsigned int *var1;
  _VMURegionNode *v15;
  _VMUZoneNode *zones;
  _VMUInstanceValues *instanceValues;
  _VMURegionMap *regionMap;
  void *var3;
  void *userMarkedAbandoned;
  objc_super v21;
  _QWORD v22[4];
  VMUTaskMemoryCache *v23;
  VMUObjectIdentifier *v24;
  _VMURegionNode *v25;
  _VMURegionNode *v26;

  -[VMUTaskMemoryScanner detachFromTask](self, "detachFromTask");
  blocks = self->_blocks;
  if (blocks && !self->_processObjectGraph)
  {
    free(blocks);
    self->_blocks = 0;
  }
  -[VMUTaskMemoryCache setRegionInfoBlock:](self->_memoryCache, "setRegionInfoBlock:", 0);
  if (self->_regionsCount)
  {
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      regions = self->_regions;
      memoryCache = self->_memoryCache;
      v9 = self->_objectIdentifier;
      v10 = memoryCache;
      v11 = v10;
      if (regions[v4].var7)
      {
        if (&regions[v4] == regions[v4].var8)
        {
          v22[0] = v6;
          v22[1] = 3221225472;
          v22[2] = ___unmapRegion_block_invoke;
          v22[3] = &unk_1E4E01050;
          v23 = v10;
          v25 = &regions[v4];
          v24 = v9;
          v26 = regions;
          v13 = (void (**)(void))MEMORY[0x1A85A995C](v22);
          v13[2]();

        }
        else
        {
          v12 = &regions[v4];
          v12->var6 = 0;
          v12->var7 = 0;
          v12->var8 = 0;
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
  v15 = self->_regions;
  if (v15)
  {
    free(v15);
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
  -[VMUTaskMemoryScanner _destroyLinearClassInfos](self, "_destroyLinearClassInfos");
  v21.receiver = self;
  v21.super_class = (Class)VMUTaskMemoryScanner;
  -[VMUTaskMemoryScanner dealloc](&v21, sel_dealloc);
}

- (void)_withMemoryReaderBlock:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__VMUTaskMemoryScanner__withMemoryReaderBlock___block_invoke;
  v5[3] = &unk_1E4E00958;
  v5[4] = self;
  v6 = 0;
  v3 = (void (**)(id, void *))a3;
  v4 = (void *)MEMORY[0x1A85A995C](v5);
  v3[2](v3, v4);

}

uint64_t __47__VMUTaskMemoryScanner__withMemoryReaderBlock___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
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
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  int v45;
  id v46;
  id v47;
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
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  id v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  id v73;
  id v74;
  NSObject *v75;
  _QWORD *v76;
  void (**v77)(_QWORD);
  void *v78;
  int v79;
  uint64_t v80;
  void *v81;
  id v82;
  id v83;
  FILE *v84;
  FILE *v85;
  uint64_t v86;
  _QWORD v87[4];
  id v88;
  id v89;
  uint64_t v90;
  unint64_t v91;
  _QWORD v92[2];

  result = 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
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
      goto LABEL_79;
    v54 = (id *)(v53 + 64);
    v55 = *(unsigned int *)(v5 + 40) - ((uint64_t)(v53 + 64 - *(_QWORD *)(v5 + 32)) >> 6);
    if (!v55)
      goto LABEL_76;
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
LABEL_76:
          if (v55)
            v53 = v55;
          v21 = v53;
LABEL_79:
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
            v28 = *(void **)(v25 + 56);
            v27 = *(void **)(v25 + 64);
            v29 = *(id *)(v25 + 8);
            v82 = v27;
            v83 = v28;
            v84 = v26;
            v30 = 0;
            if ((_DWORD)v23)
            {
              v31 = v23;
              v32 = (uint64_t *)v21;
              do
              {
                v33 = *v32;
                v32 += 8;
                v30 += *(_QWORD *)(v33 + 16);
                --v31;
              }
              while (v31);
            }
            v92[0] = 0;
            v86 = 0;
            v34 = (_QWORD *)objc_msgSend(v83, "findMappedAddress:size:", *(_QWORD *)(*(_QWORD *)v21 + 8), v30);
            if (v34)
            {
              v35 = v34[1];
              v36 = *(_QWORD *)(*(_QWORD *)v21 + 8) - *v34;
              v92[0] = v34[2] + v36;
              v86 = v35 - v36;
              goto LABEL_19;
            }
            v81 = v29;
            if ((_DWORD)v23)
            {
              v72 = 0;
              do
              {
                v73 = v82;
                v74 = v83;
                v75 = v84;
                if (*(_QWORD *)(v21 + v72 + 48))
                {
                  if (v21 + v72 == *(_QWORD *)(v21 + v72 + 56))
                  {
                    v87[0] = MEMORY[0x1E0C809B0];
                    v87[1] = 3221225472;
                    v87[2] = ___unmapRegion_block_invoke;
                    v87[3] = &unk_1E4E01050;
                    v88 = v74;
                    v90 = v21 + v72;
                    v89 = v73;
                    v91 = v21;
                    v77 = (void (**)(_QWORD))MEMORY[0x1A85A995C](v87);
                    v78 = v77;
                    if (v84)
                      dispatch_async(v75, v77);
                    else
                      v77[2](v77);

                  }
                  else
                  {
                    v76 = (_QWORD *)(v21 + v72);
                    v76[5] = 0;
                    v76[6] = 0;
                    v76[7] = 0;
                  }
                }

                v72 += 64;
              }
              while ((unint64_t)v23 << 6 != v72);
            }
            v79 = objc_msgSend(v83, "mapAddress:size:returnedAddress:returnedSize:", *(_QWORD *)(*(_QWORD *)v21 + 8), v30, v92, &v86);
            v12 = (_DWORD *)MEMORY[0x1E0C85AC8];
            v29 = v81;
            if (v79)
            {
              if (task_exists(v81))
                fprintf((FILE *)*MEMORY[0x1E0C80C10], "Failed to map remote region at [%#llx-%#llx]\n", *(_QWORD *)(*(_QWORD *)v21 + 8), *(_QWORD *)(*(_QWORD *)v21 + 8) + v30);
            }
            else
            {
LABEL_19:
              if ((_DWORD)v23)
              {
                v37 = 0;
                v38 = v86;
                do
                {
                  v39 = (_QWORD *)(v21 + v37);
                  v39[7] = v21;
                  v39[5] = v38;
                  v40 = v92[0];
                  v39[6] = v92[0];
                  v41 = *(_QWORD *)(v21 + v37) + 8;
                  v92[0] = *(_QWORD *)(*(_QWORD *)(v21 + v37) + 16) + v40;
                  v38 = v86 - *(_QWORD *)(v41 + 8);
                  v86 = v38;
                  v37 += 64;
                }
                while ((unint64_t)v23 << 6 != v37);
              }
            }

          }
          v42 = *(_QWORD *)(a1 + 32);
          v43 = *(void **)(v42 + 56);
          v44 = *(_QWORD *)(v42 + 96);
          v45 = *(_DWORD *)(v42 + 104);
          v46 = *(id *)(v42 + 8);
          v47 = v43;
          if (*(_QWORD *)(v21 + 48))
          {
LABEL_24:

            return *(_QWORD *)(v21 + 48) + a2 - *(_QWORD *)(*(_QWORD *)v21 + 8);
          }
          if (!objc_msgSend(*(id *)v21, "isSpecialPhysFootprintRegion"))
          {
            v87[0] = 0;
            v92[0] = 0;
            v59 = objc_msgSend(v47, "mapAddress:size:returnedAddress:returnedSize:", *(_QWORD *)(*(_QWORD *)v21 + 8), *(_QWORD *)(*(_QWORD *)v21 + 16), v87, v92);
            if (!v59)
            {
              v80 = v87[0];
              *(_QWORD *)(v21 + 40) = v92[0];
              *(_QWORD *)(v21 + 48) = v80;
              *(_QWORD *)(v21 + 56) = v21;
              goto LABEL_24;
            }
            if ((*(_DWORD *)(*(_QWORD *)v21 + 52) & 3u) - 1 >= 2)
            {
              v60 = v59;
              v61 = task_exists(v46);
              if (v21 != v44 + ((unint64_t)(v45 - 1) << 6) && v61)
              {
                v85 = (FILE *)*MEMORY[0x1E0C80C10];
                v63 = objc_msgSend(*(id *)v21, "address");
                v64 = *(unsigned int *)(*(_QWORD *)v21 + 24);
                v65 = vm_prot_strings[v64];
                v66 = *(_QWORD *)(*(_QWORD *)v21 + 16) + *(_QWORD *)(*(_QWORD *)v21 + 8);
                VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(*(unsigned __int8 *)(*(_QWORD *)v21 + 232), *(unsigned __int8 *)(*(_QWORD *)v21 + 104), *(unsigned __int8 *)(*(_QWORD *)v21 + 50), v64, *(unsigned __int8 *)(*(_QWORD *)v21 + 49));
                v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v68 = (const char *)objc_msgSend(v67, "UTF8String");
                v69 = *(_QWORD *)(*(_QWORD *)v21 + 16) >> *v12;
                v70 = "pages";
                if (v69 == 1)
                  v70 = "page";
                if (*(_QWORD *)(v21 + 24) == *(_QWORD *)(v21 + 32))
                  v71 = "";
                else
                  v71 = " [root]";
                fprintf(v85, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v63, v66, v65, v68, v69, v70, v71, v60);

              }
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
        goto LABEL_76;
      }
    }
  }
  return result;
}

- (BOOL)_callRemoteMallocEnumerators:(unsigned int)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  unsigned int v15;
  uint8_t buf[16];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  if (self->_mallocEnumerationShouldFail && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4D79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Passing bad task peek function to malloc enumerators because VMUTaskMemoryScanner.mallocEnumerationShouldFail is YES", buf, 2u);
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke;
  v12[3] = &unk_1E4E009D8;
  v12[4] = self;
  v9 = v8;
  v15 = a3;
  v13 = v9;
  v14 = &v17;
  -[VMUTaskMemoryScanner _withMemoryReaderBlock:](self, "_withMemoryReaderBlock:", v12);
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v10 = v18[5] == 0;

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  int v10;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_2;
  v7[3] = &unk_1E4E009B0;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v5 = v4;
  v10 = *(_DWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  _withPeekTransformerFunctionForMemoryReader(a2, v7);

}

void __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_2(uint64_t a1, uint64_t (*a2)())
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  unint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  int v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 544))
    a2 = failingPeekFunction;
  if (*(_DWORD *)(v2 + 216))
  {
    v6 = 0;
    for (i = 0; i < *(unsigned int *)(v2 + 216); ++i)
    {
      if (*(_QWORD *)(*(_QWORD *)(v2 + 208) + v6 + 16))
      {
        get_local_zone_count();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_3;
        v17[3] = &unk_1E4E00988;
        v18 = *(id *)(a1 + 40);
        v19 = i;
        v8 = (void *)MEMORY[0x1A85A995C](v17);
        v9 = (**(uint64_t (***)(uint64_t, void *, _QWORD, _QWORD, uint64_t (*)(), uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) + v6 + 16))(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "taskPort"), v8, *(unsigned int *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) + v6), a2, _pointerRecorderBlockContextAdapter);
        unregister_new_local_zones();
        if ((_DWORD)v9)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_2_cold_1((uint64_t)v3, i, v9);
          v10 = (void *)MEMORY[0x1E0CB35C8];
          v20 = *MEMORY[0x1E0CB2D50];
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) + v6 + 8))
            v11 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) + v6 + 8);
          else
            v11 = CFSTR("UNKNOWN");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malloc enumeration of zone \"%@\" failed to get full information about malloc metadata and/or allocations with the error \"%s (%d)\". It is likely that the target was suspended while malloc metadata was being modified."), v11, mach_error_string(v9), v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("Malloc enumeration"), (int)v9, v13);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v16 = *(void **)(v15 + 40);
          *(_QWORD *)(v15 + 40) = v14;

          return;
        }

        v2 = *v3;
      }
      v6 += 24;
    }
  }
}

uint64_t __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), a2, a3, a4);
}

- (uint64_t)_shouldScanVMregion:(uint64_t)a1
{
  uint64_t v2;
  id *v4;
  id *v5;
  void *v6;
  char v7;

  v2 = a1;
  if (a1)
  {
    if (_shouldScanVMregion__onceToken != -1)
      dispatch_once(&_shouldScanVMregion__onceToken, &__block_literal_global_80);
    if (*(_QWORD *)(a2 + 32) - *(_QWORD *)(a2 + 24) >= 8uLL)
    {
      v4 = (id *)*(id *)a2;
      v5 = v4;
      if (!_shouldScanVMregion__scanVMRegionWithUnknownPathsEnvVar
        && *((_BYTE *)v4 + 49)
        && (objc_msgSend(v4, "path"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            v7 = objc_msgSend(v6, "hasPrefix:", kVMUUnknownMappedFileNamePrefix[0]),
            v6,
            (v7 & 1) != 0)
        || (*((_DWORD *)v5 + 13) & 3) == 2)
      {
        v2 = 0;
      }
      else
      {
        v2 = objc_msgSend(v5, "protection") != 1
          || (objc_msgSend(v5[4], "isEqualToString:", CFSTR("MALLOC metadata")) & 1) != 0
          || (objc_msgSend(v5, "isActivityTracing") & 1) != 0
          || objc_msgSend(v5, "address") == *(_QWORD *)(v2 + 536);
      }

    }
    else
    {
      return 0;
    }
  }
  return v2;
}

char *__44__VMUTaskMemoryScanner__shouldScanVMregion___block_invoke()
{
  char *result;

  result = getenv("SCAN_VM_REGIONS_WITH_UNKNOWN_PATHS");
  _shouldScanVMregion__scanVMRegionWithUnknownPathsEnvVar = (uint64_t)result;
  return result;
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

  -[VMUTaskMemoryScanner _destroyLinearClassInfos](self, "_destroyLinearClassInfos");
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

- (void)_addSpecialNodesFromTask
{
  unsigned int blocksCount;
  uint64_t blocksSize;
  _VMUBlockNode *blocks;
  int v6;
  unsigned int v7;
  unint64_t v8;
  _VMUBlockNode *v9;
  unint64_t v10;
  unsigned int v11;
  _VMUBlockNode *v12;
  int v13;
  unsigned int v14;
  unint64_t v15;
  _VMUBlockNode *v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  unsigned int v23;
  _VMUBlockNode *v24;
  int v25;
  unsigned int v26;
  unint64_t v27;
  _VMUBlockNode *v28;
  uint64_t v29;
  unsigned int v30;

  blocksCount = self->_blocksCount;
  blocksSize = self->_blocksSize;
  if (blocksSize <= blocksCount)
  {
    if ((2 * blocksSize) <= 0x40000)
      v6 = 0x40000;
    else
      v6 = 2 * blocksSize;
    do
    {
      v7 = v6;
      v6 *= 2;
    }
    while (v7 < blocksCount);
    self->_blocksSize = v7;
    blocks = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v7, 0x1000040451B5BE8uLL);
    self->_blocks = blocks;
    if (!blocks)
      goto LABEL_41;
    blocksCount = self->_blocksCount;
  }
  else
  {
    blocks = self->_blocks;
  }
  v8 = blocksCount;
  v9 = &blocks[blocksCount];
  v9->var0 = v8;
  *((_QWORD *)v9 + 1) = 3;
  ++self->_blocksCount;
  v10 = -[VMUObjectIdentifier ObjCclassCount](self->_objectIdentifier, "ObjCclassCount");
  if (v10 + -[VMUObjectIdentifier SwiftClassCount](self->_objectIdentifier, "SwiftClassCount"))
  {
    if (_addSpecialNodesFromTask_onceToken != -1)
      dispatch_once(&_addSpecialNodesFromTask_onceToken, &__block_literal_global_85);
    v11 = self->_blocksCount;
    blocksSize = self->_blocksSize;
    if (blocksSize <= v11)
    {
      if ((2 * blocksSize) <= 0x40000)
        v13 = 0x40000;
      else
        v13 = 2 * blocksSize;
      do
      {
        v14 = v13;
        v13 *= 2;
      }
      while (v14 < v11);
      self->_blocksSize = v14;
      v12 = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v14, 0x1000040451B5BE8uLL);
      self->_blocks = v12;
      if (!v12)
        goto LABEL_41;
      v11 = self->_blocksCount;
    }
    else
    {
      v12 = self->_blocks;
    }
    v15 = v11;
    v16 = &v12[v11];
    v17 = -[VMUClassInfoMap indexForClassInfo:](self->_classInfoIndexer, "indexForClassInfo:", _addSpecialNodesFromTask_autoreleasePoolBoundaryClassInfo);
    v16->var0 = v15;
    *((_QWORD *)v16 + 1) = (v17 << 41) | 1;
    v18 = self->_blocksCount;
    self->_autoreleasePoolBoundaryNode = v18;
    self->_blocksCount = v18 + 1;
  }
  self->_webKitZoneIndex = -1;
  if (!getenv("SYMBOLICATION_DISABLE_WEBKIT_POINTER_PACKING_WORKAROUND") && self->_zonesCount)
  {
    v19 = 0;
    v20 = 8;
    do
    {
      v21 = *(id *)((char *)&self->_zones->var0 + v20);
      v22 = v21;
      if (v21 && objc_msgSend(v21, "hasPrefix:", CFSTR("WebKit Malloc")))
        self->_webKitZoneIndex = v19;

      ++v19;
      v20 += 24;
    }
    while (v19 < self->_zonesCount);
    if (self->_webKitZoneIndex != -1)
    {
      if (_addSpecialNodesFromTask_onceToken_92 != -1)
        dispatch_once(&_addSpecialNodesFromTask_onceToken_92, &__block_literal_global_93);
      v23 = self->_blocksCount;
      blocksSize = self->_blocksSize;
      if (blocksSize > v23)
      {
        v24 = self->_blocks;
LABEL_40:
        v27 = v23;
        v28 = &v24[v23];
        v29 = -[VMUClassInfoMap indexForClassInfo:](self->_classInfoIndexer, "indexForClassInfo:", _addSpecialNodesFromTask_webKitMallocFakeRootClassInfo);
        v28->var0 = v27;
        *((_QWORD *)v28 + 1) = (v29 << 41) | 1;
        v30 = self->_blocksCount;
        self->_webKitMallocFakeRootNode = v30;
        self->_blocksCount = v30 + 1;
        return;
      }
      if ((2 * blocksSize) <= 0x40000)
        v25 = 0x40000;
      else
        v25 = 2 * blocksSize;
      do
      {
        v26 = v25;
        v25 *= 2;
      }
      while (v26 < v23);
      self->_blocksSize = v26;
      v24 = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v26, 0x1000040451B5BE8uLL);
      self->_blocks = v24;
      if (v24)
      {
        v23 = self->_blocksCount;
        goto LABEL_40;
      }
LABEL_41:
      NSLog(CFSTR("Out of memory: failed to expand %s from %u to %u entries"), "_blocks", blocksSize, self->_blocksSize);
      abort();
    }
  }
}

void __48__VMUTaskMemoryScanner__addSpecialNodesFromTask__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUClassInfo, "classInfoWithClassName:binaryPath:type:", kVMUAutoreleasePoolBoundaryClassName, CFSTR("/usr/lib/libobjc.A.dylib"), 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_addSpecialNodesFromTask_autoreleasePoolBoundaryClassInfo;
  _addSpecialNodesFromTask_autoreleasePoolBoundaryClassInfo = v0;

}

void __48__VMUTaskMemoryScanner__addSpecialNodesFromTask__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUClassInfo, "classInfoWithClassName:binaryPath:type:", CFSTR("WebKit Malloc Fake Root"), CFSTR("/System/Library/Frameworks/WebKit.framework/Versions/A/WebKit"), 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_addSpecialNodesFromTask_webKitMallocFakeRootClassInfo;
  _addSpecialNodesFromTask_webKitMallocFakeRootClassInfo = v0;

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
  v6 = -[VMUTaskMemoryScanner _lengthOfMappedFileOfRegion:](self, "_lengthOfMappedFileOfRegion:", v9);
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
  unsigned int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  _VMURegionNode *v15;
  _VMURegionNode *v16;
  int v17;
  char v18;
  char v19;
  _VMURegionNode *v20;
  _VMURegionNode *v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  int v25;
  BOOL v26;
  VMURangeArray *v27;
  VMURangeArray *stackRanges;
  unsigned int regionsCount;
  _VMURegionNode *regions;
  _VMURegionNode *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _VMURegionMap *regionMap;
  unint64_t var6;
  unint64_t var7;
  BOOL v38;
  unint64_t v39;
  unint64_t v40;
  unsigned int *var3;
  unint64_t v42;
  char *v43;
  int v44;
  _DWORD *v45;
  int v46;
  _VMURegionNode *var4;
  _VMURegionNode *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t var5;
  _VMURegionNode *v54;
  unint64_t v55;
  _QWORD *v56;
  int v57;
  unint64_t v58;
  unint64_t v59;
  id *v60;
  unint64_t v61;
  unint64_t v62;
  id *v63;
  BOOL v64;
  unint64_t mallocZonesBufferAddress;
  id *p_var0;
  _VMURegionMap *v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  BOOL v71;
  unint64_t v72;
  unsigned int *v73;
  unint64_t v74;
  char *v75;
  int v76;
  _DWORD *v77;
  int v78;
  _VMURegionNode *v79;
  unint64_t v80;
  _VMURegionNode *v81;
  unint64_t v82;
  id *v83;
  unsigned int zonesCount;
  unint64_t v85;
  uint64_t v86;
  int v87;
  int v88;
  unint64_t v89;
  char v90;
  uint64_t v91;
  void *v92;
  void *v93;
  id *v94;
  _VMURegionMap *v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t var0;
  unint64_t v100;
  unsigned int *v101;
  unint64_t v102;
  char *v103;
  int v104;
  _DWORD *v105;
  int v106;
  _VMURegionNode *v107;
  unint64_t v108;
  _VMURegionNode *v109;
  unint64_t v110;
  id *v111;
  _VMUZoneNode *zones;
  void *v113;
  uint64_t v114;
  _QWORD *v115;
  void *v116;
  int v117;
  id *v118;
  int v119;
  id *v120;
  id *v121;
  id *v122;
  unint64_t v123;
  unint64_t v124;
  id *v125;
  unint64_t v126;
  unint64_t i;
  _VMURegionNode *v128;
  unsigned int blocksCount;
  uint64_t blocksSize;
  int v131;
  unsigned int v132;
  _VMUBlockNode *v133;
  id v134;
  uint64_t v135;
  _VMUBlockNode *v136;
  _VMURegionNode *v137;
  unint64_t v138;
  unint64_t v139;
  void *v140;
  int v142;
  id *v143;
  id *v144;
  unint64_t v145;
  unint64_t v146;
  id *v147;
  uint64_t v148;
  unint64_t v149;
  _QWORD *v150;
  uint64_t v151;
  uint64_t v152;
  id v153;
  const char *v154;
  _VMURegionNode *v155;
  uint64_t v156;
  const char *v157;
  const char *v158;
  const char *v159;
  unsigned int v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  char v164;
  FILE *v165;
  void *v166;
  BOOL v167;
  _QWORD v168[6];
  char v169;
  uint64_t v170;
  uint64_t *v171;
  uint64_t v172;
  uint64_t (*v173)(uint64_t, uint64_t);
  void (*v174)(uint64_t);
  id v175;

  -[VMUTaskMemoryScanner _addThreadNodesFromTask](self, "_addThreadNodesFromTask");
  -[VMUTaskMemoryScanner _addSpecialNodesFromTask](self, "_addSpecialNodesFromTask");
  v5 = self->_regionsCount - 1;
  do
  {
    v6 = v5;
    if (!v5)
      break;
    v7 = *((unsigned __int8 *)self->_regions[(unint64_t)v5--].var0 + 50);
  }
  while (v7 == 5);
  v8 = 0;
  do
  {
    v9 = v8;
    v10 = self->_regions[(unint64_t)v8].var0;
    v11 = v10;
    if (v10[50] != 3
      && (objc_msgSend(v10, "isSubmap") & 1) == 0
      && (objc_msgSend(v11, "isSpecialPhysFootprintRegion") & 1) == 0)
    {
      v12 = *((_QWORD *)v11 + 1);
      v13 = *((_QWORD *)v11 + 2);
      v14 = -[VMUTask rangeIsInSharedCache:](self->_task, "rangeIsInSharedCache:", v12, v13);
      if ((objc_msgSend(v11, "isMallocHeapRelated") & 1) == 0
        && (objc_msgSend(v11, "ignoreRegionDuringScanning") & 1) == 0)
      {
        if (objc_msgSend(v11, "willNotHoldPointers"))
        {
          v15 = &self->_regions[v9];
          v15->var4 = v12;
          v15->var5 = v12 + 1;
        }
        else
        {
          if ((~objc_msgSend(v11, "protection") & 3) != 0)
          {
            v17 = *((_DWORD *)v11 + 6);
            v18 = (~v17 & 5) != 0 || v14;
            if ((v18 & 1) == 0 || (v17 != 1 ? (v19 = 1) : (v19 = v14), (v19 & 1) == 0))
            {
              if ((v11[132] & 2) == 0)
              {
                v20 = &self->_regions[v9];
                v20->var4 = *((_QWORD *)v11 + 1);
                v20->var5 = v13 + v12;
              }
            }
          }
          else if ((v11[132] & 4) == 0 || self->_targetProcessHasObjCPatches && objc_msgSend(v11, "dirtyLength"))
          {
            v16 = &self->_regions[v9];
            v16->var4 = v12;
            v16->var5 = v13 + v12;
          }
          else
          {
            v21 = &self->_regions[v9];
            v21->var4 = 0;
            v21->var5 = 0;
          }
          if (objc_msgSend(v11, "isActivityTracing"))
            self->_regions[v9].var5 = self->_regions[v9].var4 + 4096;
          if ((v11[132] & 2) != 0
            && (v11[132] & 4) == 0
            && (objc_msgSend(v11, "protection") & 1) != 0
            && (objc_msgSend(v11, "protection") & 4) == 0)
          {
            objc_msgSend(v11, "type");
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            v164 = objc_msgSend(v166, "isEqualToString:", CFSTR("__LINKEDIT"));

            if ((v164 & 1) == 0)
            {
              v22 = 168;
              if (v14)
                v22 = 152;
              v23 = (unint64_t *)((char *)self + v22);
              v24 = *v23;
              if (!*v23)
              {
                *v23 = v12;
                v24 = v12;
              }
              v23[1] = v13 + v12 - v24;
              if (!v14)
                -[VMURangeArray addRange:](self->_dataSegmentsRangeArrayOutsideSharedCache, "addRange:", v12, v13);
            }
          }
          if (self->_regions[v9].var5 && v11[49])
            -[VMUTaskMemoryScanner _shortenScannableRangeOfMappedFile:](self, "_shortenScannableRangeOfMappedFile:", v9);
        }
      }
    }

    v8 = v9 + 1;
  }
  while ((int)v9 + 1 <= v6);
  v170 = 0;
  v171 = &v170;
  v172 = 0x3032000000;
  v173 = __Block_byref_object_copy_;
  v174 = __Block_byref_object_dispose_;
  v175 = (id)objc_opt_new();
  v25 = (LODWORD(self->_regionDescriptionOptions) >> 23) & 1;
  v168[0] = MEMORY[0x1E0C809B0];
  v168[1] = 3221225472;
  v168[2] = __54__VMUTaskMemoryScanner_addRootNodesFromTaskWithError___block_invoke;
  v168[3] = &unk_1E4E00AA0;
  v168[4] = self;
  v168[5] = &v170;
  v169 = v25;
  v26 = -[VMUTaskMemoryScanner _callRemoteMallocEnumerators:error:block:](self, "_callRemoteMallocEnumerators:error:block:", 6, a3, v168);
  if (!v26)
    goto LABEL_195;
  if (!self->_stackRanges)
  {
    v27 = objc_alloc_init(VMURangeArray);
    stackRanges = self->_stackRanges;
    self->_stackRanges = v27;

  }
  regionsCount = self->_regionsCount;
  v167 = v26;
  if (regionsCount)
  {
    regions = self->_regions;
    v31 = &regions[(unint64_t)(regionsCount - 1)];
  }
  else
  {
    regions = 0;
    v31 = 0;
  }
  if (!self->_threadsCount)
    goto LABEL_105;
  v32 = 0;
  do
  {
    v33 = -[VMUTaskThreadStates stackPointerForThreadNum:](self->_threadStates, "stackPointerForThreadNum:", v32);
    v34 = v33;
    if (!v33)
      goto LABEL_88;
    regionMap = self->_regionMap;
    var6 = regionMap->var6;
    var7 = regionMap->var7;
    v38 = var7 >= var6;
    v39 = var7 - var6;
    if (!v38 || v33 - var6 >= v39)
      goto LABEL_88;
    v40 = v33 >> *MEMORY[0x1E0C85AC8];
    if (v40)
    {
      var3 = (unsigned int *)regionMap->var3;
      v42 = v33 >> *MEMORY[0x1E0C85AC8];
      do
      {
        if (*var3 <= (v42 & 0x3FFFFFF)
          || ((*((unsigned __int8 *)var3 + ((v42 & 0x3FFFFFF) >> 3) + 4) >> (v42 & 7)) & 1) == 0)
        {
          goto LABEL_88;
        }
        v42 >>= 26;
      }
      while (v42);
    }
    v43 = (char *)regionMap + 4 * (v40 & 0x7FFFF);
    v46 = *((_DWORD *)v43 + 16);
    v45 = v43 + 64;
    v44 = v46;
    var4 = regionMap->var4;
    if (v46)
    {
      v48 = &var4[(unint64_t)(v44 - 1)];
      if (v33 - *((_QWORD *)v48->var0 + 1) < *((_QWORD *)v48->var0 + 2))
        goto LABEL_64;
    }
    var5 = regionMap->var5;
    if (!(_DWORD)var5)
      goto LABEL_88;
    v54 = regionMap->var4;
    while (1)
    {
      v55 = var5 >> 1;
      v48 = &v54[var5 >> 1];
      if (*((_QWORD *)v48->var0 + 1) <= v33)
        break;
LABEL_77:
      v38 = var5 >= 2;
      var5 = v55;
      if (!v38)
        goto LABEL_88;
    }
    if (*((_QWORD *)v48->var0 + 2) + *((_QWORD *)v48->var0 + 1) <= v33)
    {
      v54 = v48 + 1;
      v55 = --var5 >> 1;
      goto LABEL_77;
    }
    v57 = objc_msgSend(v48->var0, "isSpecialPhysFootprintRegion");
    if (v57)
      v58 = 0;
    else
      v58 = (unint64_t)v48;
    if ((v57 & 1) != 0)
      goto LABEL_88;
    if ((*(_BYTE *)(*(_QWORD *)v58 + 132) & 1) != 0)
    {
      v59 = v58;
      v60 = (id *)(v58 + 64);
      v61 = regionMap->var5 - ((uint64_t)(v58 + 64 - (unint64_t)regionMap->var4) >> 6);
      if (v61)
      {
        while (1)
        {
          v62 = v61 >> 1;
          v63 = &v60[8 * (v61 >> 1)];
          if (*((_QWORD *)*v63 + 1) <= v34)
          {
            if (*((_QWORD *)*v63 + 2) + *((_QWORD *)*v63 + 1) > v34)
            {
              if (objc_msgSend(*v63, "isSpecialPhysFootprintRegion"))
                v61 = 0;
              else
                v61 = (unint64_t)v63;
              break;
            }
            v60 = v63 + 8;
            v62 = --v61 >> 1;
          }
          v64 = v61 > 1;
          v61 = v62;
          if (!v64)
          {
            v61 = 0;
            break;
          }
        }
      }
      if (v61)
        v58 = v61;
      else
        v58 = v59;
      v48 = (_VMURegionNode *)v58;
    }
    *v45 = ((v58 - (unint64_t)var4) >> 6) + 1;
LABEL_64:
    v48->var4 = v34;
    v49 = *((_QWORD *)v48->var0 + 1);
    v50 = *((_QWORD *)v48->var0 + 2) + v49;
    v48->var5 = v50;
    v51 = (unint64_t)&v48[-1];
    if (&v48[-1] >= regions)
    {
      do
      {
        if (*(_QWORD *)(*(_QWORD *)v51 + 16) + *(_QWORD *)(*(_QWORD *)v51 + 8) != v49)
          break;
        if (!objc_msgSend(*(id *)v51, "isStack"))
          break;
        if (!*(_DWORD *)(*(_QWORD *)v51 + 24))
          break;
        v49 = *(_QWORD *)(*(_QWORD *)v51 + 8);
        *(_QWORD *)(v51 + 24) = 0;
        *(_QWORD *)(v51 + 32) = 0;
        v51 -= 64;
      }
      while (v51 >= (unint64_t)regions);
    }
    v52 = (unint64_t)&v48[1];
    if (&v48[1] <= v31)
    {
      do
      {
        if (v50 != *(_QWORD *)(*(_QWORD *)v52 + 8))
          break;
        if (!objc_msgSend(*(id *)v52, "isStack"))
          break;
        if (!*(_DWORD *)(*(_QWORD *)v52 + 24))
          break;
        v56 = (_QWORD *)(*(_QWORD *)v52 + 8);
        *(_QWORD *)(v52 + 24) = *v56;
        v50 = v56[1] + *v56;
        *(_QWORD *)(v52 + 32) = v50;
        v52 += 64;
      }
      while (v52 <= (unint64_t)v31);
    }
    -[VMURangeArray addRange:](self->_stackRanges, "addRange:", v34, v50 - v34);
LABEL_88:
    v32 = (v32 + 1);
  }
  while (v32 < self->_threadsCount);
LABEL_105:
  mallocZonesBufferAddress = self->_mallocZonesBufferAddress;
  if (!mallocZonesBufferAddress)
    goto LABEL_123;
  p_var0 = 0;
  v67 = self->_regionMap;
  v69 = v67->var6;
  v68 = v67->var7;
  v70 = v68 - v69;
  v71 = v68 < v69;
  if (mallocZonesBufferAddress - v69 >= v70 || v71)
    goto LABEL_122;
  v72 = mallocZonesBufferAddress >> *MEMORY[0x1E0C85AC8];
  if (v72)
  {
    v73 = (unsigned int *)v67->var3;
    v74 = mallocZonesBufferAddress >> *MEMORY[0x1E0C85AC8];
    while (*v73 > (v74 & 0x3FFFFFF)
         && ((*((unsigned __int8 *)v73 + ((v74 & 0x3FFFFFF) >> 3) + 4) >> (v74 & 7)) & 1) != 0)
    {
      v74 >>= 26;
      if (!v74)
        goto LABEL_113;
    }
LABEL_121:
    p_var0 = 0;
    goto LABEL_122;
  }
LABEL_113:
  v75 = (char *)v67 + 4 * (v72 & 0x7FFFF);
  v78 = *((_DWORD *)v75 + 16);
  v77 = v75 + 64;
  v76 = v78;
  v79 = v67->var4;
  if (v78)
  {
    p_var0 = &v79[(unint64_t)(v76 - 1)].var0;
    if (mallocZonesBufferAddress - *((_QWORD *)*p_var0 + 1) < *((_QWORD *)*p_var0 + 2))
      goto LABEL_122;
  }
  v80 = v67->var5;
  if (!(_DWORD)v80)
    goto LABEL_121;
  v81 = v67->var4;
  while (2)
  {
    v82 = v80 >> 1;
    v83 = &v81[v80 >> 1].var0;
    if (*((_QWORD *)*v83 + 1) > mallocZonesBufferAddress)
    {
LABEL_120:
      v38 = v80 >= 2;
      v80 = v82;
      if (!v38)
        goto LABEL_121;
      continue;
    }
    break;
  }
  if (*((_QWORD *)*v83 + 2) + *((_QWORD *)*v83 + 1) <= mallocZonesBufferAddress)
  {
    v81 = (_VMURegionNode *)(v83 + 8);
    v82 = --v80 >> 1;
    goto LABEL_120;
  }
  v142 = objc_msgSend(*v83, "isSpecialPhysFootprintRegion");
  p_var0 = 0;
  if (v142)
    v143 = 0;
  else
    v143 = v83;
  if ((v142 & 1) != 0)
    goto LABEL_122;
  if ((*((_BYTE *)*v143 + 132) & 1) == 0)
    goto LABEL_213;
  v144 = v143 + 8;
  v145 = v67->var5 - (((char *)(v143 + 8) - (char *)v67->var4) >> 6);
  if (!v145)
    goto LABEL_210;
  while (2)
  {
    v146 = v145 >> 1;
    v147 = &v144[8 * (v145 >> 1)];
    if (*((_QWORD *)*v147 + 1) > mallocZonesBufferAddress)
    {
LABEL_205:
      v64 = v145 > 1;
      v145 = v146;
      if (!v64)
      {
        v145 = 0;
        goto LABEL_210;
      }
      continue;
    }
    break;
  }
  if (*((_QWORD *)*v147 + 2) + *((_QWORD *)*v147 + 1) <= mallocZonesBufferAddress)
  {
    v144 = v147 + 8;
    v146 = --v145 >> 1;
    goto LABEL_205;
  }
  if (objc_msgSend(*v147, "isSpecialPhysFootprintRegion"))
    v145 = 0;
  else
    v145 = (unint64_t)v147;
LABEL_210:
  if (v145)
    v83 = (id *)v145;
  else
    v83 = v143;
LABEL_213:
  *v77 = ((unint64_t)((char *)v83 - (char *)v79) >> 6) + 1;
  p_var0 = v83;
LABEL_122:
  zonesCount = self->_zonesCount;
  p_var0[3] = (id)objc_msgSend(*p_var0, "address");
  p_var0[4] = (id)(objc_msgSend(*p_var0, "address") + 8 * zonesCount);
LABEL_123:
  if (!self->_zonesCount)
    goto LABEL_176;
  v85 = 1;
  v86 = 8;
  do
  {
    v87 = objc_msgSend(*(id *)((char *)&self->_zones->var0 + v86), "hasPrefix:", CFSTR("MallocHelperZone_0x"));
    v88 = v87;
    v89 = self->_zonesCount;
    if (v85 >= v89)
      v90 = 1;
    else
      v90 = v87;
    ++v85;
    v86 += 24;
  }
  while ((v90 & 1) == 0);
  if (!(_DWORD)v89)
    goto LABEL_176;
  v91 = 0;
  while (2)
  {
    v92 = (void *)v171[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v91);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v92) = objc_msgSend(v92, "containsObject:", v93);

    if ((v92 & 1) != 0)
      goto LABEL_156;
    v94 = 0;
    v95 = self->_regionMap;
    v96 = v95->var6;
    v97 = v95->var7;
    v38 = v97 >= v96;
    v98 = v97 - v96;
    if (!v38)
      goto LABEL_149;
    var0 = self->_zones[v91].var0;
    if (var0 - v96 >= v98)
      goto LABEL_149;
    v100 = var0 >> *MEMORY[0x1E0C85AC8];
    if (v100)
    {
      v101 = (unsigned int *)v95->var3;
      v102 = var0 >> *MEMORY[0x1E0C85AC8];
      while (*v101 > (v102 & 0x3FFFFFF)
           && ((*((unsigned __int8 *)v101 + ((v102 & 0x3FFFFFF) >> 3) + 4) >> (v102 & 7)) & 1) != 0)
      {
        v102 >>= 26;
        if (!v102)
          goto LABEL_140;
      }
LABEL_148:
      v94 = 0;
      goto LABEL_149;
    }
LABEL_140:
    v103 = (char *)v95 + 4 * (v100 & 0x7FFFF);
    v106 = *((_DWORD *)v103 + 16);
    v105 = v103 + 64;
    v104 = v106;
    v107 = v95->var4;
    if (v106)
    {
      v94 = &v107[(unint64_t)(v104 - 1)].var0;
      if (var0 - *((_QWORD *)*v94 + 1) < *((_QWORD *)*v94 + 2))
        goto LABEL_149;
    }
    v108 = v95->var5;
    if (!(_DWORD)v108)
      goto LABEL_148;
    v109 = v95->var4;
    while (2)
    {
      v110 = v108 >> 1;
      v111 = &v109[v108 >> 1].var0;
      if (*((_QWORD *)*v111 + 1) > var0)
      {
LABEL_147:
        v38 = v108 >= 2;
        v108 = v110;
        if (!v38)
          goto LABEL_148;
        continue;
      }
      break;
    }
    if (*((_QWORD *)*v111 + 2) + *((_QWORD *)*v111 + 1) <= var0)
    {
      v109 = (_VMURegionNode *)(v111 + 8);
      v110 = --v108 >> 1;
      goto LABEL_147;
    }
    v119 = objc_msgSend(*v111, "isSpecialPhysFootprintRegion");
    v94 = 0;
    if (v119)
      v120 = 0;
    else
      v120 = v111;
    if ((v119 & 1) != 0)
      goto LABEL_149;
    if ((*((_BYTE *)*v120 + 132) & 1) == 0)
      goto LABEL_175;
    v121 = v120;
    v122 = v120 + 8;
    v123 = v95->var5 - (((char *)(v120 + 8) - (char *)v95->var4) >> 6);
    if (!v123)
      goto LABEL_172;
    while (2)
    {
      v124 = v123 >> 1;
      v125 = &v122[8 * (v123 >> 1)];
      if (*((_QWORD *)*v125 + 1) > var0)
      {
LABEL_167:
        v64 = v123 > 1;
        v123 = v124;
        if (!v64)
        {
          v123 = 0;
          goto LABEL_172;
        }
        continue;
      }
      break;
    }
    if (*((_QWORD *)*v125 + 2) + *((_QWORD *)*v125 + 1) <= var0)
    {
      v122 = v125 + 8;
      v124 = --v123 >> 1;
      goto LABEL_167;
    }
    if (objc_msgSend(*v125, "isSpecialPhysFootprintRegion"))
      v123 = 0;
    else
      v123 = (unint64_t)v125;
LABEL_172:
    if (v123)
      v111 = (id *)v123;
    else
      v111 = v121;
LABEL_175:
    *v105 = ((unint64_t)((char *)v111 - (char *)v107) >> 6) + 1;
    v94 = v111;
LABEL_149:
    if ((objc_msgSend(*v94, "protection") & 1) != 0)
    {
      zones = self->_zones;
      v113 = (void *)zones[v91].var0;
      v114 = ((unint64_t)v113 + *MEMORY[0x1E0C85AD8] + 199) & -*MEMORY[0x1E0C85AD8];
      v94[3] = v113;
      v94[4] = (id)v114;
      if (v88)
      {
        if (objc_msgSend(zones[v91].var1, "hasPrefix:", CFSTR("DefaultMallocZone_0x")))
        {
          v115 = v94[8];
          if (*((_QWORD *)*v94 + 2) + *((_QWORD *)*v94 + 1) == v115[1]
            && objc_msgSend(v115, "protection") == 3)
          {
            objc_msgSend(v94[8], "type");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            v117 = objc_msgSend(v116, "isEqualToString:", CFSTR("MALLOC metadata"));

            if (v117)
            {
              v118 = (id *)((char *)v94[8] + 8);
              v94[11] = *v118;
              v94[12] = (char *)*v118 + (_QWORD)v118[1];
            }
          }
        }
      }
    }
LABEL_156:
    if (++v91 < (unint64_t)self->_zonesCount)
      continue;
    break;
  }
LABEL_176:
  if (!s_enumeratorDebugging)
  {
    v126 = self->_regionsCount;
    goto LABEL_178;
  }
  fwrite("Region state after claims:\n", 0x1BuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  if (self->_regionsCount)
  {
    v148 = 0;
    v149 = 0;
    do
    {
      v165 = (FILE *)*MEMORY[0x1E0C80C10];
      v163 = objc_msgSend(self->_regions[v148].var0, "address");
      v150 = self->_regions[v148].var0;
      v151 = v150[2];
      v161 = v150[1];
      v152 = *((unsigned int *)v150 + 6);
      v162 = vm_prot_strings[v152];
      VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(*((unsigned __int8 *)v150 + 232), *((unsigned __int8 *)v150 + 104), *((unsigned __int8 *)v150 + 50), v152, *((unsigned __int8 *)v150 + 49));
      v153 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v154 = (const char *)objc_msgSend(v153, "UTF8String");
      v155 = &self->_regions[v148];
      v156 = *((_QWORD *)v155->var0 + 2) >> *MEMORY[0x1E0C85AC8];
      if (v156 == 1)
        v157 = "page";
      else
        v157 = "pages";
      v158 = "";
      if (v155->var4 == v155->var5)
        v159 = "";
      else
        v159 = " [root]";
      v160 = *((_DWORD *)v155->var0 + 37);
      if (v160 < self->_zonesCount)
        v158 = (const char *)objc_msgSend(objc_retainAutorelease(self->_zones[v160].var1), "UTF8String");
      fprintf(v165, "region: [%#llx-%#llx] %s %s (%llu %s)%s  %s\n", v163, v151 + v161, v162, v154, v156, v157, v159, v158);

      ++v149;
      v126 = self->_regionsCount;
      ++v148;
    }
    while (v149 < v126);
LABEL_178:
    if (v126)
    {
      for (i = 0; i < v126; ++i)
      {
        v128 = self->_regions;
        if (v128[i].var4 < v128[i].var5)
        {
          blocksCount = self->_blocksCount;
          blocksSize = self->_blocksSize;
          if (blocksSize <= blocksCount)
          {
            if ((2 * blocksSize) <= 0x40000)
              v131 = 0x40000;
            else
              v131 = 2 * blocksSize;
            do
            {
              v132 = v131;
              v131 *= 2;
            }
            while (v132 < blocksCount);
            self->_blocksSize = v132;
            v133 = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v132, 0x1000040451B5BE8uLL);
            self->_blocks = v133;
            if (!v133)
            {
              NSLog(CFSTR("Out of memory: failed to expand %s from %u to %u entries"), "_blocks", blocksSize, self->_blocksSize);
              abort();
            }
            v128 = self->_regions;
          }
          v134 = v128[i].var0;
          if (objc_msgSend(v134, "isRootRegion"))
            v135 = 2;
          else
            v135 = 5;
          v136 = &self->_blocks[self->_blocksCount];
          v137 = &self->_regions[i];
          v138 = v137->var4;
          v139 = v135 & 0xFFFFFFE00000001FLL | (32 * (LODWORD(v137->var5) - v138)) | (i << 41);
          v136->var0 = v138;
          *((_QWORD *)v136 + 1) = v139;
          ++self->_blocksCount;

          v126 = self->_regionsCount;
        }
      }
    }
  }
  v26 = v167;
  if (-[VMUTaskMemoryScanner objectContentLevel](self, "objectContentLevel") == 2)
  {
    -[VMUTaskMemoryScanner _readonlyRegionRanges](self, "_readonlyRegionRanges");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUObjectIdentifier setReadonlyRegionRanges:](self->_objectIdentifier, "setReadonlyRegionRanges:", v140);

  }
LABEL_195:
  _Block_object_dispose(&v170, 8);

  return v26;
}

void __54__VMUTaskMemoryScanner_addRootNodesFromTaskWithError___block_invoke(uint64_t a1, unsigned int a2, int a3, uint64_t a4, unsigned int a5)
{
  uint64_t v5;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int *v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  _DWORD *v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  char *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unsigned int *v45;
  unint64_t v46;
  uint64_t v47;
  int v48;
  _DWORD *v49;
  int v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  int v54;
  uint64_t v55;
  unint64_t v56;
  id *v57;
  unint64_t v58;
  unint64_t v59;
  id *v60;
  BOOL v61;
  unint64_t v62;
  int v63;
  FILE **v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  char *v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  int v73;
  unint64_t v74;
  id *v75;
  unint64_t v76;
  unint64_t v77;
  id *v78;
  unint64_t v79;
  int v80;
  const char *v81;
  const char *v82;
  id v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  FILE *v88;
  uint64_t v93;

  if (a5)
  {
    v5 = a4;
    v7 = 0;
    v93 = a5;
    do
    {
      v8 = (unint64_t *)(v5 + 16 * v7);
      v10 = v8 + 1;
      v9 = v8[1];
      if (v9)
      {
        v11 = *v8;
        v12 = *(_QWORD *)(a1 + 32);
        if (a3 == 2 && *(_DWORD *)(v12 + 216))
        {
          v13 = 0;
          v14 = 0;
          do
          {
            if (*(_QWORD *)(*(_QWORD *)(v12 + 208) + v13) - v11 < v9)
            {
              v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v16);

              v12 = *(_QWORD *)(a1 + 32);
            }
            ++v14;
            v13 += 24;
          }
          while (v14 < *(unsigned int *)(v12 + 216));
          v11 = *v8;
          v5 = a4;
        }
        v17 = *(_QWORD *)(v12 + 112);
        v18 = *(_QWORD *)(v17 + 48);
        v19 = *(_QWORD *)(v17 + 56);
        v20 = v19 >= v18;
        v21 = v19 - v18;
        if (v20 && v11 - v18 < v21)
        {
          v22 = v11 >> *MEMORY[0x1E0C85AC8];
          if (v22)
          {
            v23 = *(unsigned int **)(v17 + 24);
            v24 = v11 >> *MEMORY[0x1E0C85AC8];
            do
            {
              if (*v23 <= (v24 & 0x3FFFFFF)
                || ((*((unsigned __int8 *)v23 + ((v24 & 0x3FFFFFF) >> 3) + 4) >> (v24 & 7)) & 1) == 0)
              {
                goto LABEL_81;
              }
              v24 >>= 26;
            }
            while (v24);
          }
          v25 = v17 + 4 * (v22 & 0x7FFFF);
          v28 = *(_DWORD *)(v25 + 64);
          v27 = (_DWORD *)(v25 + 64);
          v26 = v28;
          v29 = *(_QWORD *)(v17 + 32);
          if (v28)
          {
            v30 = v29 + ((unint64_t)(v26 - 1) << 6);
            if (v11 - *(_QWORD *)(*(_QWORD *)v30 + 8) < *(_QWORD *)(*(_QWORD *)v30 + 16))
              goto LABEL_21;
          }
          v70 = *(unsigned int *)(v17 + 40);
          if ((_DWORD)v70)
          {
            v71 = *(_QWORD *)(v17 + 32);
            do
            {
              v72 = v70 >> 1;
              v30 = v71 + (v70 >> 1 << 6);
              if (*(_QWORD *)(*(_QWORD *)v30 + 8) <= v11)
              {
                if (*(_QWORD *)(*(_QWORD *)v30 + 16) + *(_QWORD *)(*(_QWORD *)v30 + 8) > v11)
                {
                  v73 = objc_msgSend(*(id *)v30, "isSpecialPhysFootprintRegion");
                  if (v73)
                    v74 = 0;
                  else
                    v74 = v30;
                  if ((v73 & 1) == 0)
                  {
                    if ((*(_BYTE *)(*(_QWORD *)v74 + 132) & 1) == 0)
                      goto LABEL_96;
                    v75 = (id *)(v74 + 64);
                    v76 = *(unsigned int *)(v17 + 40) - ((uint64_t)(v74 + 64 - *(_QWORD *)(v17 + 32)) >> 6);
                    if (!v76)
                      goto LABEL_93;
                    while (1)
                    {
                      v77 = v76 >> 1;
                      v78 = &v75[8 * (v76 >> 1)];
                      if (*((_QWORD *)*v78 + 1) <= v11)
                      {
                        if (*((_QWORD *)*v78 + 2) + *((_QWORD *)*v78 + 1) > v11)
                        {
                          v79 = v74;
                          v80 = objc_msgSend(*v78, "isSpecialPhysFootprintRegion");
                          v74 = v79;
                          if (v80)
                            v76 = 0;
                          else
                            v76 = (unint64_t)v78;
LABEL_93:
                          if (v76)
                            v30 = v76;
                          else
                            v30 = v74;
LABEL_96:
                          *v27 = ((v30 - v29) >> 6) + 1;
LABEL_21:
                          v31 = *v10 + *v8;
LABEL_22:
                          while (2)
                          {
                            v32 = *(id *)v30;
                            if (v31 <= *(_QWORD *)(*(_QWORD *)v30 + 8))
                              goto LABEL_81;
                            *((_DWORD *)v32 + 37) = a2;
                            if (!objc_msgSend(*((id *)v32 + 5), "length"))
                            {
                              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "objectAtIndexedSubscript:", a2);
                              v33 = objc_claimAutoreleasedReturnValue();
                              v34 = *(void **)(*(_QWORD *)v30 + 40);
                              *(_QWORD *)(*(_QWORD *)v30 + 40) = v33;

                              if (*(_BYTE *)(a1 + 48))
                              {
                                objc_msgSend(*(id *)v30, "description");
                                v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                                printf("Setting region name in %s based on _zoneNames[zone_index] for  %s\n", "-[VMUTaskMemoryScanner addRootNodesFromTaskWithError:]_block_invoke", (const char *)objc_msgSend(v35, "UTF8String"));

                              }
                            }
                            v36 = *(char **)v30;
                            *(_DWORD *)(*(_QWORD *)v30 + 144) |= a3;
                            *(_QWORD *)(v30 + 24) = 0;
                            *(_QWORD *)(v30 + 32) = 0;
                            if (s_enumeratorDebugging)
                            {
                              v64 = (FILE **)MEMORY[0x1E0C80C10];
                              fprintf((FILE *)*MEMORY[0x1E0C80C10], "zone %s ", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208)+ 24 * a2+ 8)), "UTF8String"));
                              v88 = *v64;
                              v86 = objc_msgSend(*(id *)v30, "address");
                              v85 = *(_QWORD *)(*(_QWORD *)v30 + 16) + *(_QWORD *)(*(_QWORD *)v30 + 8);
                              v65 = *(unsigned int *)(*(_QWORD *)v30 + 24);
                              v84 = vm_prot_strings[v65];
                              VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(*(unsigned __int8 *)(*(_QWORD *)v30 + 232), *(unsigned __int8 *)(*(_QWORD *)v30 + 104), *(unsigned __int8 *)(*(_QWORD *)v30 + 50), v65, *(unsigned __int8 *)(*(_QWORD *)v30 + 49));
                              v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                              v82 = (const char *)objc_msgSend(v83, "UTF8String");
                              v66 = *(_QWORD *)(*(_QWORD *)v30 + 16) >> *MEMORY[0x1E0C85AC8];
                              if (v66 == 1)
                                v67 = "page";
                              else
                                v67 = "pages";
                              if (*(_QWORD *)(v30 + 24) == *(_QWORD *)(v30 + 32))
                                v68 = "";
                              else
                                v68 = " [root]";
                              v69 = VMUMallocRangeTypeString(a3);
                              v81 = v67;
                              v5 = a4;
                              fprintf(v88, "claimed region: [%#llx-%#llx] %s %s (%llu %s)%s - type '%s' range: [%#lx-%#lx]\n", v86, v85, v84, v82, v66, v81, v68, v69, *v8, *v10 + *v8);

                              v36 = *(char **)v30;
                            }
                            v37 = (uint64_t *)(v36 + 8);
                            v39 = *v37;
                            v38 = v37[1];
                            if (v31 <= v38 + v39)
                              goto LABEL_81;
                            v40 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
                            v41 = *(_QWORD *)(v40 + 48);
                            v42 = *(_QWORD *)(v40 + 56);
                            v20 = v42 >= v41;
                            v43 = v42 - v41;
                            if (!v20)
                              goto LABEL_81;
                            v11 += v38;
                            if (v11 - v41 >= v43)
                              goto LABEL_81;
                            v44 = v11 >> *MEMORY[0x1E0C85AC8];
                            if (v44)
                            {
                              v45 = *(unsigned int **)(v40 + 24);
                              v46 = v11 >> *MEMORY[0x1E0C85AC8];
                              while (*v45 > (v46 & 0x3FFFFFF)
                                   && ((*((unsigned __int8 *)v45 + ((v46 & 0x3FFFFFF) >> 3) + 4) >> (v46 & 7)) & 1) != 0)
                              {
                                v46 >>= 26;
                                if (!v46)
                                  goto LABEL_36;
                              }
                              goto LABEL_81;
                            }
LABEL_36:
                            v47 = v40 + 4 * (v44 & 0x7FFFF);
                            v50 = *(_DWORD *)(v47 + 64);
                            v49 = (_DWORD *)(v47 + 64);
                            v48 = v50;
                            if (v50)
                            {
                              v30 = *(_QWORD *)(v40 + 32) + ((unint64_t)(v48 - 1) << 6);
                              if (v11 - *(_QWORD *)(*(_QWORD *)v30 + 8) < *(_QWORD *)(*(_QWORD *)v30 + 16))
                                continue;
                            }
                            break;
                          }
                          v51 = *(unsigned int *)(v40 + 40);
                          if (!(_DWORD)v51)
                            goto LABEL_81;
                          v52 = *(_QWORD *)(v40 + 32);
                          while (1)
                          {
                            v53 = v51 >> 1;
                            v30 = v52 + (v51 >> 1 << 6);
                            if (*(_QWORD *)(*(_QWORD *)v30 + 8) <= v11)
                            {
                              if (*(_QWORD *)(*(_QWORD *)v30 + 16) + *(_QWORD *)(*(_QWORD *)v30 + 8) > v11)
                              {
                                v87 = *(_QWORD *)(v40 + 32);
                                v54 = objc_msgSend(*(id *)v30, "isSpecialPhysFootprintRegion");
                                v55 = v87;
                                if (v54)
                                  v56 = 0;
                                else
                                  v56 = v30;
                                if ((v54 & 1) != 0)
                                  goto LABEL_81;
                                if ((*(_BYTE *)(*(_QWORD *)v56 + 132) & 1) == 0)
                                  goto LABEL_62;
                                v57 = (id *)(v56 + 64);
                                v58 = *(unsigned int *)(v40 + 40) - ((uint64_t)(v56 + 64 - *(_QWORD *)(v40 + 32)) >> 6);
                                if (!v58)
                                  goto LABEL_59;
                                while (2)
                                {
                                  v59 = v58 >> 1;
                                  v60 = &v57[8 * (v58 >> 1)];
                                  if (*((_QWORD *)*v60 + 1) > v11)
                                  {
LABEL_54:
                                    v61 = v58 > 1;
                                    v58 = v59;
                                    if (!v61)
                                    {
                                      v58 = 0;
                                      goto LABEL_59;
                                    }
                                    continue;
                                  }
                                  break;
                                }
                                if (*((_QWORD *)*v60 + 2) + *((_QWORD *)*v60 + 1) <= v11)
                                {
                                  v57 = v60 + 8;
                                  v59 = --v58 >> 1;
                                  goto LABEL_54;
                                }
                                v62 = v56;
                                v63 = objc_msgSend(*v60, "isSpecialPhysFootprintRegion");
                                v56 = v62;
                                v55 = v87;
                                if (v63)
                                  v58 = 0;
                                else
                                  v58 = (unint64_t)v60;
LABEL_59:
                                if (v58)
                                  v30 = v58;
                                else
                                  v30 = v56;
LABEL_62:
                                *v49 = ((v30 - v55) >> 6) + 1;
                                goto LABEL_22;
                              }
                              v52 = v30 + 64;
                              v53 = --v51 >> 1;
                            }
                            v20 = v51 >= 2;
                            v51 = v53;
                            if (!v20)
                              goto LABEL_81;
                          }
                        }
                        v75 = v78 + 8;
                        v77 = --v76 >> 1;
                      }
                      v61 = v76 > 1;
                      v76 = v77;
                      if (!v61)
                      {
                        v76 = 0;
                        goto LABEL_93;
                      }
                    }
                  }
                  break;
                }
                v71 = v30 + 64;
                v72 = --v70 >> 1;
              }
              v20 = v70 >= 2;
              v70 = v72;
            }
            while (v20);
          }
        }
      }
LABEL_81:
      ++v7;
    }
    while (v7 != v93);
  }
}

- (void)addRootNodesFromTask
{
  -[VMUTaskMemoryScanner addRootNodesFromTaskWithError:](self, "addRootNodesFromTaskWithError:", 0);
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
      -[VMUTaskMemoryScanner _readonlyRegionRanges](self, "_readonlyRegionRanges");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[VMUObjectIdentifier setReadonlyRegionRanges:](self->_objectIdentifier, "setReadonlyRegionRanges:", v5);

    }
  }
}

- (void)_sortBlocks
{
  mergesort_b(self->_blocks, self->_blocksCount, 0x10uLL, &__block_literal_global_120);
}

uint64_t __35__VMUTaskMemoryScanner__sortBlocks__block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 < *a3)
    return 0xFFFFFFFFLL;
  else
    return *a2 != *a3;
}

- (BOOL)addMallocNodesFromTaskWithError:(id *)a3
{
  _BOOL4 v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__VMUTaskMemoryScanner_addMallocNodesFromTaskWithError___block_invoke;
  v6[3] = &unk_1E4E00B08;
  v6[4] = self;
  v4 = -[VMUTaskMemoryScanner _callRemoteMallocEnumerators:error:block:](self, "_callRemoteMallocEnumerators:error:block:", 1, a3, v6);
  if (v4)
    -[VMUTaskMemoryScanner _sortAndClassifyBlocks](self, "_sortAndClassifyBlocks");
  return v4;
}

void __56__VMUTaskMemoryScanner_addMallocNodesFromTaskWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  BOOL v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int *v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  _DWORD *v27;
  int v28;
  uint64_t v29;
  id *v30;
  char *v31;
  unint64_t v32;
  uint64_t v33;
  _DWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  const char *v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t v43;
  id *v44;
  unint64_t v45;
  int v46;
  id *v47;
  uint64_t v48;
  char *v49;
  unint64_t v50;
  uint64_t v51;
  id *v52;
  unint64_t v53;
  unint64_t v54;
  id *v55;
  BOOL v56;
  id *v57;
  int v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  const char *v66;
  char *v67;
  const char *v68;
  uint64_t v69;
  FILE *v70;
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  char *v75;
  __int16 v76;
  unint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  const char *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(unsigned int *)(v8 + 92);
  if (v9 <= a5 - 1 + *(_DWORD *)(v8 + 88))
  {
    v10 = 2 * v9;
    if ((2 * v9) <= 0x40000)
      v10 = 0x40000;
    *(_DWORD *)(v8 + 92) = v10;
    while (1)
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_DWORD *)(v11 + 92);
      if (v12 >= a5 - 1 + *(_DWORD *)(v11 + 88))
        break;
      *(_DWORD *)(v11 + 92) = 2 * v12;
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = malloc_type_realloc(*(void **)(v11 + 80), 16 * *(unsigned int *)(v11 + 92), 0x1000040451B5BE8uLL);
    v13 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v13 + 80))
    {
      NSLog(CFSTR("Out of memory: failed to expand %s from %u to %u entries"), "_blocks", v9, *(unsigned int *)(v13 + 92));
      abort();
    }
  }
  if (!a5)
    return;
  v14 = 0;
  do
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
    v16 = (unint64_t *)(a4 + 16 * v14);
    v17 = *(_QWORD *)(v15 + 48);
    v18 = *(_QWORD *)(v15 + 56);
    v19 = v18 >= v17;
    v20 = v18 - v17;
    if (!v19)
      goto LABEL_40;
    v21 = *v16;
    if (*v16 - v17 >= v20)
      goto LABEL_40;
    v22 = v21 >> *MEMORY[0x1E0C85AC8];
    if (v22)
    {
      v23 = *(unsigned int **)(v15 + 24);
      v24 = v21 >> *MEMORY[0x1E0C85AC8];
      while (*v23 > (v24 & 0x3FFFFFF)
           && ((*((unsigned __int8 *)v23 + ((v24 & 0x3FFFFFF) >> 3) + 4) >> (v24 & 7)) & 1) != 0)
      {
        v24 >>= 26;
        if (!v24)
          goto LABEL_18;
      }
LABEL_40:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v48 = objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) + 24 * a2 + 8)), "UTF8String");
        v49 = VMUMallocRangeTypeString(1);
        v50 = *v16;
        v51 = *(_QWORD *)(a4 + 16 * v14 + 8);
        *(_DWORD *)buf = 136315906;
        v73 = v48;
        v74 = 2080;
        v75 = v49;
        v76 = 2048;
        v77 = v50;
        v78 = 2048;
        v79 = v51;
        _os_log_error_impl(&dword_1A4D79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "error: zone enumerator for \"%s\" reported '%s' %#llx (%llu bytes), in non-existent region, ignoring block.", buf, 0x2Au);
      }
      goto LABEL_42;
    }
LABEL_18:
    v25 = v15 + 4 * (v22 & 0x7FFFF);
    v28 = *(_DWORD *)(v25 + 64);
    v27 = (_DWORD *)(v25 + 64);
    v26 = v28;
    v29 = *(_QWORD *)(v15 + 32);
    if (v28)
    {
      v30 = (id *)(v29 + ((unint64_t)(v26 - 1) << 6));
      if (v21 - *((_QWORD *)*v30 + 1) < *((_QWORD *)*v30 + 2))
        goto LABEL_20;
    }
    v43 = *(unsigned int *)(v15 + 40);
    if (!(_DWORD)v43)
      goto LABEL_40;
    v44 = *(id **)(v15 + 32);
    while (1)
    {
      v45 = v43 >> 1;
      v30 = &v44[8 * (v43 >> 1)];
      if (*((_QWORD *)*v30 + 1) <= v21)
        break;
LABEL_34:
      v19 = v43 >= 2;
      v43 = v45;
      if (!v19)
        goto LABEL_40;
    }
    if (*((_QWORD *)*v30 + 2) + *((_QWORD *)*v30 + 1) <= v21)
    {
      v44 = v30 + 8;
      v45 = --v43 >> 1;
      goto LABEL_34;
    }
    v46 = objc_msgSend(*v30, "isSpecialPhysFootprintRegion");
    if (v46)
      v47 = 0;
    else
      v47 = v30;
    if ((v46 & 1) != 0)
      goto LABEL_40;
    if ((*((_BYTE *)*v47 + 132) & 1) == 0)
      goto LABEL_57;
    v52 = v47 + 8;
    v53 = *(unsigned int *)(v15 + 40) - (((uint64_t)v47 - *(_QWORD *)(v15 + 32) + 64) >> 6);
    if (!v53)
      goto LABEL_54;
    while (2)
    {
      v54 = v53 >> 1;
      v55 = &v52[8 * (v53 >> 1)];
      if (*((_QWORD *)*v55 + 1) > v21)
      {
LABEL_49:
        v56 = v53 > 1;
        v53 = v54;
        if (!v56)
        {
          v53 = 0;
          goto LABEL_54;
        }
        continue;
      }
      break;
    }
    if (*((_QWORD *)*v55 + 2) + *((_QWORD *)*v55 + 1) <= v21)
    {
      v52 = v55 + 8;
      v54 = --v53 >> 1;
      goto LABEL_49;
    }
    v57 = v47;
    v58 = objc_msgSend(*v55, "isSpecialPhysFootprintRegion");
    v47 = v57;
    if (v58)
      v53 = 0;
    else
      v53 = (unint64_t)v55;
LABEL_54:
    if (v53)
      v47 = (id *)v53;
    v30 = v47;
LABEL_57:
    *v27 = (((unint64_t)v47 - v29) >> 6) + 1;
LABEL_20:
    if (*((_DWORD *)*v30 + 37) != (_DWORD)a2)
    {
      if (s_enumeratorDebugging)
      {
        v70 = (FILE *)*MEMORY[0x1E0C80C10];
        v68 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208)+ 24 * a2+ 8)), "UTF8String");
        v59 = VMUMallocRangeTypeString(1);
        v60 = *v16;
        v61 = *(_QWORD *)(a4 + 16 * v14 + 8);
        v63 = *((_QWORD *)*v30 + 1);
        v62 = *((_QWORD *)*v30 + 2);
        v64 = *((_DWORD *)*v30 + 37);
        v65 = *(_QWORD *)(a1 + 32);
        v66 = "<unclaimed>";
        if (v64 < *(_DWORD *)(v65 + 216))
        {
          v67 = v59;
          v66 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(v65 + 208) + 24 * v64 + 8)), "UTF8String");
          v59 = v67;
        }
        fprintf(v70, "warning: zone enumerator for \"%s\" reported '%s' %#llx (%llu bytes) in region: [%#llx-%#llx] %s\n", v68, v59, v60, v61, v63, v62 + v63, v66);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v69 = objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) + 24 * a2 + 8)), "UTF8String");
        v31 = VMUMallocRangeTypeString(1);
        v32 = *v16;
        v33 = *(_QWORD *)(a4 + 16 * v14 + 8);
        v34 = *v30;
        v35 = (uint64_t *)((char *)*v30 + 8);
        v36 = *v35;
        v37 = v35[1];
        v38 = v34[37];
        v39 = *(_QWORD *)(a1 + 32);
        v40 = "<unclaimed>";
        if (v38 < *(_DWORD *)(v39 + 216))
          v40 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(v39 + 208) + 24 * v38 + 8)), "UTF8String");
        *(_DWORD *)buf = 136316674;
        v73 = v69;
        v74 = 2080;
        v75 = v31;
        v76 = 2048;
        v77 = v32;
        v78 = 2048;
        v79 = v33;
        v80 = 2048;
        v81 = v36;
        v82 = 2048;
        v83 = v37 + v36;
        v84 = 2080;
        v85 = v40;
        _os_log_impl(&dword_1A4D79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "warning: zone enumerator for \"%s\" reported '%s' %#llx (%llu bytes) in region: [%#llx-%#llx] %s", buf, 0x48u);
      }
    }
    v41 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80)
                             + 16 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 88));
    v42 = *(_QWORD *)(a4 + 16 * v14 + 8);
    if (v42 >= 0xFFFFFFFFFLL)
      v42 = 0xFFFFFFFFFLL;
    *v41 = *v16;
    v41[1] = (a2 << 41) | (32 * v42) | 9;
    ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 88);
LABEL_42:
    ++v14;
  }
  while (v14 != a5);
}

- (void)addMallocNodesFromTask
{
  -[VMUTaskMemoryScanner addMallocNodesFromTaskWithError:](self, "addMallocNodesFromTaskWithError:", 0);
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
    -[VMUTaskMemoryScanner _sortAndClassifyBlocks](self, "_sortAndClassifyBlocks");
  }

}

- (BOOL)addAllNodesFromTaskWithError:(id *)a3
{
  _BOOL4 v5;

  v5 = -[VMUTaskMemoryScanner addRootNodesFromTaskWithError:](self, "addRootNodesFromTaskWithError:");
  if (v5)
    LOBYTE(v5) = -[VMUTaskMemoryScanner addMallocNodesFromTaskWithError:](self, "addMallocNodesFromTaskWithError:", a3);
  return v5;
}

- (void)_sortAndClassifyBlocks
{
  -[VMUTaskMemoryScanner _sortBlocks](self, "_sortBlocks");
  -[VMUTaskMemoryScanner _buildRegionFirstBlockIndexOnPageArrays](self, "_buildRegionFirstBlockIndexOnPageArrays");
  -[VMUTaskMemoryScanner _fixupBlockIsas](self, "_fixupBlockIsas");
  -[VMUTaskMemoryScanner _findMarkedAbandonedBlocks](self, "_findMarkedAbandonedBlocks");
  if ((self->_regionDescriptionOptions & 0x200000) == 0)
    -[VMUTaskMemoryScanner unmapAllRegions](self, "unmapAllRegions");
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

- (void)_identifyObjCClassStructureBlocks
{
  unint64_t v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *addressToRuntimeMetadataChunkInfoDict;
  VMUObjectIdentifier *objectIdentifier;
  _QWORD v7[5];

  v3 = -[VMUObjectIdentifier ObjCclassCount](self->_objectIdentifier, "ObjCclassCount");
  if (v3 + -[VMUObjectIdentifier SwiftClassCount](self->_objectIdentifier, "SwiftClassCount"))
  {
    -[VMUObjectIdentifier _generateClassInfosForObjCClassStructurePointerTypes](self->_objectIdentifier, "_generateClassInfosForObjCClassStructurePointerTypes");
    self->_objcClassStructureClassInfoIndex = -[VMUObjectIdentifier classInfoIndexForObjCClassStructurePointerType:](self->_objectIdentifier, "classInfoIndexForObjCClassStructurePointerType:", 0);
    self->_classDataMethodsClassInfoIndex = -[VMUObjectIdentifier classInfoIndexForObjCClassStructurePointerType:](self->_objectIdentifier, "classInfoIndexForObjCClassStructurePointerType:", 6);
    self->_swiftClassStructureClassInfoIndex = -[VMUObjectIdentifier classInfoIndexForObjCClassStructurePointerType:](self->_objectIdentifier, "classInfoIndexForObjCClassStructurePointerType:", 1);
    self->_swiftMetadataClassInfoIndex = -[VMUObjectIdentifier classInfoIndexForObjCClassStructurePointerType:](self->_objectIdentifier, "classInfoIndexForObjCClassStructurePointerType:", 12);
    v4 = (NSMutableDictionary *)objc_opt_new();
    addressToRuntimeMetadataChunkInfoDict = self->_addressToRuntimeMetadataChunkInfoDict;
    self->_addressToRuntimeMetadataChunkInfoDict = v4;

    objectIdentifier = self->_objectIdentifier;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__VMUTaskMemoryScanner__identifyObjCClassStructureBlocks__block_invoke;
    v7[3] = &unk_1E4E00B58;
    v7[4] = self;
    -[VMUObjectIdentifier enumerateRealizedClassInfosWithBlock:](objectIdentifier, "enumerateRealizedClassInfosWithBlock:", v7);
  }
  else
  {
    *(_QWORD *)&self->_objcClassStructureClassInfoIndex = -1;
    *(_QWORD *)&self->_swiftClassStructureClassInfoIndex = -1;
  }
}

void __57__VMUTaskMemoryScanner__identifyObjCClassStructureBlocks__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__VMUTaskMemoryScanner__identifyObjCClassStructureBlocks__block_invoke_2;
  v7[3] = &unk_1E4E00B30;
  v7[4] = v5;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v6, "identifyObjCClassStructureBlocksWithScanner:addressIdentifierBlock:", v5, v7);

}

uint64_t __57__VMUTaskMemoryScanner__identifyObjCClassStructureBlocks__block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v27;
  uint64_t v28;

  if (!a2 || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addressIsInSharedCache:", a2) & 1) != 0)
    return 0xFFFFFFFFLL;
  v8 = objc_msgSend(*(id *)(a1 + 32), "nodeForAddress:", a2);
  v9 = v8;
  if ((_DWORD)v8 == -1)
    return v9;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v10 + 80);
  v12 = *(_QWORD *)(v11 + 16 * v8 + 8);
  if ((v12 & 7) != 1)
    return 0xFFFFFFFFLL;
  if (*(_BYTE *)(v10 + 193))
  {
    if (*(_QWORD *)(v11 + 16 * v8) + 16 < a2
      || ((v13 = *((unsigned int *)&VMUObjCClassStructureTypeInfoArray + 6 * a3 + 4),
           v14 = (v12 >> 5) & 0xFFFFFFFFFLL,
           (_DWORD)v13)
        ? (v15 = v14 > v13)
        : (v15 = 0),
          v15))
    {
      v16 = objc_opt_new();
      *(_BYTE *)(v16 + 8) = a4;
      *(_DWORD *)(v16 + 12) = a3;
      objc_storeStrong((id *)(v16 + 16), *(id *)(a1 + 40));
      v17 = *(void **)(*(_QWORD *)(a1 + 32) + 200);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

    }
  }
  v19 = objc_msgSend(*(id *)(a1 + 40), "infoType");
  v20 = *(_QWORD *)(a1 + 32);
  if (v19 == 8 && (v21 = *(_QWORD *)(v20 + 80), *(_QWORD *)(v21 + 16 * v9) + 16 < a2))
  {
    *(_QWORD *)(v21 + 16 * v9 + 8) = *(_QWORD *)(v21 + 16 * v9 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)*(unsigned int *)(v20 + 340) << 41);
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(_DWORD *)(v22 + 348);
    if (v23 >= v9)
      v23 = v9;
    *(_DWORD *)(v22 + 348) = v23;
    v24 = *(_QWORD *)(a1 + 32);
    if (!*(_DWORD *)(v24 + 348))
    {
      *(_DWORD *)(v24 + 348) = v9;
      v24 = *(_QWORD *)(a1 + 32);
    }
    v25 = *(_DWORD *)(v24 + 352);
    if (v25 <= v9)
      v25 = v9;
    *(_DWORD *)(v24 + 352) = v25;
  }
  else
  {
    v27 = objc_msgSend(*(id *)(v20 + 64), "classInfoIndexForObjCClassStructurePointerType:", a3);
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16 * v9;
    *(_QWORD *)(v28 + 8) = *(_QWORD *)(v28 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)v27 << 41);
  }
  return v9;
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
  v28[2] = __48__VMUTaskMemoryScanner_printRuntimeMetadataInfo__block_invoke;
  v28[3] = &unk_1E4E00B80;
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
          v10 = -[VMUTaskMemoryScanner nodeForAddress:](self, "nodeForAddress:", v15);
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

void __48__VMUTaskMemoryScanner_printRuntimeMetadataInfo__block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int *a4)
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
  v11 = a3 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16 * a2);
  if (*((_BYTE *)v10 + 8))
    v12 = "metaclass";
  else
    v12 = "class";
  v13 = (void *)*((_QWORD *)v10 + 2);

  objc_msgSend(v13, "className");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  printf("    +%5llu %#llx[%u]  %-13s  %s %s\n", v11, a3, v9, __s, v12, (const char *)objc_msgSend(v14, "UTF8String"));

}

- (void)_findSwiftClassesInExclaveCore
{
  uint64_t v3;
  unint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  VMUMutableClassInfo *v9;
  VMUClassInfoMap *classInfoIndexer;
  VMUObjectIdentifier *objectIdentifier;
  void *v12;
  VMUMutableClassInfo *v13;
  _QWORD v14[2];
  int v15;

  if (self->_blocksCount)
  {
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = (uint64_t *)&self->_blocks[v3];
      if ((v5[1] & 0xFFFFFE0000000007) == 1)
      {
        if (vmu_swift_reflection_interop_ownsObject(*(_QWORD *)-[VMUObjectIdentifier swiftMirror](self->_objectIdentifier, "swiftMirror")))
        {
          v6 = vmu_swift_reflection_interop_metadataForObject(*(_QWORD *)-[VMUObjectIdentifier swiftMirror](self->_objectIdentifier, "swiftMirror"), *v5);
          if (v6)
          {
            v7 = v6;
            -[VMUClassInfoMap classInfoForAddress:](self->_classInfoIndexer, "classInfoForAddress:", v6);
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v8)
            {
              v14[0] = 0;
              v14[1] = 0;
              v15 = 0;
              vmu_swift_reflection_infoForInstance(*(_QWORD *)-[VMUObjectIdentifier swiftMirror](self->_objectIdentifier, "swiftMirror"), *v5, (uint64_t)v14);
              if (LODWORD(v14[0]) == 17)
              {
                v9 = [VMUMutableClassInfo alloc];
                classInfoIndexer = self->_classInfoIndexer;
                objectIdentifier = self->_objectIdentifier;
                -[VMUObjectIdentifier memoryReader](objectIdentifier, "memoryReader");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = -[VMUClassInfo initWithClass:type:infoMap:objectIdentifier:reader:](v9, "initWithClass:type:infoMap:objectIdentifier:reader:", v7, 8, classInfoIndexer, objectIdentifier, v12);

                -[VMUTaskMemoryScanner applyTypeOverlayToMutableInfo:](self, "applyTypeOverlayToMutableInfo:", v13);
              }
            }
          }
        }
      }
      ++v4;
      ++v3;
    }
    while (v4 < self->_blocksCount);
  }
}

- (void)_fixupBlockIsas
{
  unint64_t blocksCount;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _VMUBlockNode *blocks;
  unint64_t v9;
  unint64_t var0;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  _VMURegionNode *regions;
  _VMUBlockNode *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  unint64_t regionDescriptionOptions;
  _QWORD v36[5];
  id v37;
  id v38;

  if (-[VMUTask isExclaveCore](self->_task, "isExclaveCore"))
  {
    -[VMUTaskMemoryScanner _findSwiftClassesInExclaveCore](self, "_findSwiftClassesInExclaveCore");
    -[VMUTaskMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
  }
  blocksCount = self->_blocksCount;
  if ((_DWORD)blocksCount)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    regionDescriptionOptions = self->_regionDescriptionOptions;
    LODWORD(v7) = -1;
    do
    {
      blocks = self->_blocks;
      v9 = *((_QWORD *)&blocks[v4] + 1);
      if ((v9 & 7) == 1)
      {
        var0 = blocks[v4].var0;
        if (var0 >= v5)
        {
          v11 = ((uint64_t)(int)v7 << 6) + 64;
          v12 = (int)v7 + 1;
          do
          {
            if (v12 >= (int)self->_regionsCount)
            {
              v6 = -1;
              v5 = -1;
            }
            else
            {
              v13 = (unint64_t *)(*(char **)((char *)&self->_regions->var0 + v11) + 8);
              v6 = *v13;
              v5 = (*(_QWORD **)((char *)&self->_regions->var0 + v11))[2] + *v13;
            }
            LODWORD(v7) = v7 + 1;
            v11 += 64;
            ++v12;
          }
          while (var0 >= v5);
        }
        v14 = var0 + ((v9 >> 5) & 0xFFFFFFFFFLL);
        if (v14 > v6)
        {
          v15 = (uint64_t)(int)v7 << 6;
          v7 = (int)v7;
          regions = self->_regions;
          do
          {
            v17 = &self->_blocks[v4];
            v18 = *((_QWORD *)v17 + 1);
            if ((v18 & 0x18) == 8)
            {
              if (s_enumeratorDebugging)
              {
                v25 = (*(_DWORD **)((char *)&regions->var0 + v15))[37];
                v26 = v18 >> 41;
                if (v25 != -1 && v25 != (_DWORD)v26)
                {
                  fprintf((FILE *)*MEMORY[0x1E0C80C10], "warning: zone fixup failed - block %#llx from zone \"%s\" discovered in region [%#llx-%#llx] already claimed by \"%s\"\n", v17->var0, (const char *)objc_msgSend(objc_retainAutorelease(self->_zones[v26].var1), "UTF8String"), v6, v5, (const char *)objc_msgSend(objc_retainAutorelease(self->_zones[(*(unsigned int **)((char *)&self->_regions->var0+ v15))[37]].var1), "UTF8String"));
                  v18 = *((_QWORD *)&self->_blocks[v4] + 1);
                  regions = self->_regions;
                }
              }
              v19 = *(uint64_t *)((char *)&regions->var0 + v15);
              *(_DWORD *)(v19 + 148) = v18 >> 41;
              if (!objc_msgSend(*(id *)(v19 + 40), "length"))
              {
                -[NSMutableArray objectAtIndexedSubscript:](self->_zoneNames, "objectAtIndexedSubscript:", *((_QWORD *)&self->_blocks[v4] + 1) >> 41);
                v20 = objc_claimAutoreleasedReturnValue();
                v21 = *(uint64_t *)((char *)&self->_regions->var0 + v15);
                v22 = *(void **)(v21 + 40);
                *(_QWORD *)(v21 + 40) = v20;

                if ((regionDescriptionOptions & 0x800000) != 0)
                {
                  objc_msgSend(*(id *)((char *)&self->_regions->var0 + v15), "description");
                  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  printf("Setting region name in %s based on _zoneNames[_blocks[i].isa_index for  %s\n", "-[VMUTaskMemoryScanner _fixupBlockIsas]", (const char *)objc_msgSend(v23, "UTF8String"));

                }
              }
              *((_QWORD *)&self->_blocks[v4] + 1) &= 0x1FFFFFFFFFFuLL;
              *((_QWORD *)&self->_blocks[v4] + 1) &= 0xFFFFFFFFFFFFFFE7;
              regions = self->_regions;
            }
            v24 = *(uint64_t *)((char *)&regions->var0 + v15);
            ++*(_QWORD *)(v24 + 136);
            *(_DWORD *)(v24 + 144) |= 1u;
            if (v14 <= v5)
              break;
            if (++v7 >= (int)self->_regionsCount)
            {
              v6 = -1;
              v5 = -1;
              break;
            }
            v6 = (*(_QWORD **)((char *)&regions[1].var0 + v15))[1];
            v5 = (*(_QWORD **)((char *)&regions[1].var0 + v15))[2] + v6;
            v15 += 64;
          }
          while (v14 > v6);
          blocksCount = self->_blocksCount;
        }
      }
      ++v4;
    }
    while (v4 < blocksCount);
  }
  self->_initializedRegionMallocBlockCounts = 1;
  -[VMUObjectIdentifier memoryReader](self->_objectIdentifier, "memoryReader");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUObjectIdentifier swiftRuntimeInfoStableABI](self->_objectIdentifier, "swiftRuntimeInfoStableABI");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    v31 = v29;
  }
  else
  {
    -[VMUObjectIdentifier swiftRuntimeInfoPreABI](self->_objectIdentifier, "swiftRuntimeInfoPreABI");
    v31 = (id)objc_claimAutoreleasedReturnValue();
  }
  v32 = v31;

  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke;
  v36[3] = &unk_1E4E00C20;
  v37 = v32;
  v38 = v28;
  v36[4] = self;
  v33 = v32;
  v34 = v28;
  -[VMUTaskMemoryScanner _withOrderedNodeMapper:](self, "_withOrderedNodeMapper:", v36);
  -[VMUTaskMemoryScanner _identifySwiftTypeNameCache](self, "_identifySwiftTypeNameCache");
  -[VMUTaskMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
  -[VMUTaskMemoryScanner _identifyObjCClassStructureBlocks](self, "_identifyObjCClassStructureBlocks");
  -[VMUTaskMemoryScanner _identifyNonObjectsPointingToSwiftMetadata](self, "_identifyNonObjectsPointingToSwiftMetadata");
  -[VMUTaskMemoryScanner _identifySwiftAsyncTaskSlabs](self, "_identifySwiftAsyncTaskSlabs");
  -[VMUTaskMemoryScanner _identifyAttributeGraphAllocations](self, "_identifyAttributeGraphAllocations");
  -[VMUTaskMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
  -[VMUTaskMemoryScanner _identifyNonObjectsPointedToByTypedIvars](self, "_identifyNonObjectsPointedToByTypedIvars");
  -[VMUTaskMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
  -[VMUTaskMemoryScanner _identifyNonObjectsUsingStackBacktrace](self, "_identifyNonObjectsUsingStackBacktrace");
  -[VMUTaskMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
  mergesort_b(self->_instanceValues, self->_instanceValuesCount, 0x10uLL, &__block_literal_global_145);

}

void __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke(uint64_t a1, uint64_t a2)
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
  if (*(_DWORD *)(v2 + 88))
  {
    v5 = 0;
    v6 = 8;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      if ((*(_QWORD *)(*(_QWORD *)(v2 + 80) + v6) & 0xFFFFFE0000000007) == 1)
      {
        v8[0] = v7;
        v8[1] = 3221225472;
        v8[2] = __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_2;
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
    while (v5 < *(unsigned int *)(v2 + 88));
  }
}

void __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_2(uint64_t a1, uint64_t a2)
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
  v6 = *(_QWORD *)(v5 + 80);
  v7 = *(unsigned int *)(a1 + 56);
  if (HIDWORD(*(_QWORD *)(v6 + 16 * v7)))
    v8 = (*(_QWORD *)(v6 + 16 * v7) & 7) == 0;
  else
    v8 = 0;
  if (v8
    && (objc_msgSend(*(id *)(v5 + 64), "classInfoForMemory:length:remoteAddress:", a2, (*(_QWORD *)(v6 + 16 * v7 + 8) >> 5) & 0xFFFFFFFFFLL), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = v9;
    if (objc_msgSend(v9, "hasSpecificLayout"))
    {
      v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "indexForClassInfo:", v10);
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
      v17 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16 * *(unsigned int *)(a1 + 56));
      objc_msgSend(v10, "instanceSpecificInfoForObject:ofSize:withScanner:memoryReader:", *v17, v17[1] >> 5);
      v18 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v18;
    }
    v19 = *(void **)(a1 + 40);
    v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16 * *(unsigned int *)(a1 + 56) + 8) >> 5;
    v31[2] = __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_3;
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
    v25 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "indexForClassInfo:", v24);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16 * *(unsigned int *)(a1 + 56);
    *(_QWORD *)(v26 + 8) = *(_QWORD *)(v26 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)v25 << 41);
    v27 = *(_QWORD *)(a1 + 32);
    v28 = *(_QWORD *)(*(_QWORD *)(v27 + 80) + 16 * *(unsigned int *)(a1 + 56) + 8) >> 5;
    v30[0] = v21;
    v30[1] = 3221225472;
    v30[2] = __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_4;
    v30[3] = &unk_1E4E00BD0;
    v30[4] = v27;
    objc_msgSend(v24, "enumerateExternalValuesFromObject:withSize:block:", a2, v28, v30);

  }
  else
  {
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16 * *(unsigned int *)(a1 + 56);
    *(_QWORD *)(v29 + 8) &= 0x1FFFFFFFFFFuLL;
  }
  objc_autoreleasePoolPop(v4);
}

void __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_3(uint64_t a1, void *a2, unsigned int a3, int a4)
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
  v16 = *(uint64_t **)(*(_QWORD *)(a1 + 48) + 112);
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
        v63 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 80);
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
                *v66 = *v66 & 0x1FFFFFFFFFFLL | ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 272), "indexForClassInfo:", v69) << 41);

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

void __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_4(uint64_t a1, unint64_t a2, void *a3)
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
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  int v60;
  uint64_t v61;
  unsigned int v62;
  _DWORD *v63;
  uint64_t v64;
  _QWORD *v65;
  id v66;
  id i;

  v5 = a3;
  v6 = *(uint64_t **)(*(_QWORD *)(a1 + 32) + 112);
  v8 = v6[6];
  v7 = v6[7];
  v9 = v7 - v8;
  v10 = v7 < v8;
  if (a2 - v8 >= v9 || v10)
    goto LABEL_72;
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
        goto LABEL_72;
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
    goto LABEL_72;
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
      goto LABEL_72;
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
    goto LABEL_72;
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
        goto LABEL_72;
      v26 = (_QWORD *)(v23 + 16 * (v21 + v24 - 1));
      if (((v26[1] >> 5) & 0xFFFFFFFFFuLL) + *v26 <= a2)
        goto LABEL_72;
      v27 = (unsigned int *)(v22 + 4 * ((a2 - (*v25 & -*MEMORY[0x1E0C85AD8])) >> *v11));
      v28 = *v27;
      v29 = (unint64_t *)(v23 + 16 * v28);
      if (*v29 > a2)
        goto LABEL_72;
      v30 = v27[1];
      if (v30 < *((_DWORD *)v6 + 2)
        && (v31 = (unint64_t *)(v23 + 16 * v30), v32 = *v31, *v31 <= a2))
      {
LABEL_46:
        v47 = v31[1];
        if ((v47 & 7) - 2 < 3)
          goto LABEL_72;
        v48 = (unint64_t)v31 - v23;
        v49 = ((unint64_t)v31 - v23) >> 4;
        v50 = a2 - v32;
        v51 = v6[2];
        if (v50 >= v51)
        {
          if (((v47 >> 5) & 0xFFFFFFFFFLL) - v50 > v51 || (_DWORD)v49 == -1)
            goto LABEL_72;
        }
        else if ((_DWORD)v49 == -1)
        {
          goto LABEL_72;
        }
        v53 = *(_QWORD *)(a1 + 32);
        v54 = *(_QWORD *)(v53 + 80);
        if (v54)
        {
          v55 = (v48 >> 4);
          if ((*(_QWORD *)(v54 + 16 * v55 + 8) & 7) == 1)
          {
            v56 = *(_DWORD *)(v53 + 248);
            v57 = *(unsigned int *)(v53 + 252);
            if (v57 <= v56)
            {
              v60 = 2 * v57;
              if ((2 * v57) <= 0x10)
                v60 = 16;
              *(_DWORD *)(v53 + 252) = v60;
              v61 = *(_QWORD *)(a1 + 32);
              v63 = (_DWORD *)(v61 + 252);
              v62 = *(_DWORD *)(v61 + 252);
              for (i = v5; v62 < *(_DWORD *)(v61 + 248); v62 = *(_DWORD *)(v61 + 252))
              {
                *v63 = 2 * v62;
                v61 = *(_QWORD *)(a1 + 32);
                v63 = (_DWORD *)(v61 + 252);
              }
              *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = malloc_type_realloc(*(void **)(v61 + 240), 16 * v62, 0x108004057E67DB5uLL);
              v64 = *(_QWORD *)(a1 + 32);
              v58 = *(_QWORD *)(v64 + 240);
              if (!v58)
              {
                NSLog(CFSTR("Out of memory: failed to expand %s from %u to %u entries"), "_instanceValues", v57, *(unsigned int *)(v64 + 252));
                abort();
              }
              v56 = *(_DWORD *)(v64 + 248);
              v5 = i;
            }
            else
            {
              v58 = *(_QWORD *)(v53 + 240);
            }
            v65 = (_QWORD *)(v58 + 16 * v56);
            *v65 = v55;
            v65[1] = 0;
            ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 248);
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
LABEL_72:

}

uint64_t __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_5(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 < *a3)
    return 0xFFFFFFFFLL;
  else
    return *a2 > *a3;
}

- (void)_identifySwiftTypeNameCache
{
  _BOOL4 v3;
  uint64_t SymbolOwner;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  _VMURegionMap *regionMap;
  unint64_t var7;
  unint64_t var6;
  unint64_t v13;
  BOOL v14;
  _DWORD *v15;
  unint64_t v16;
  unsigned int *var3;
  unint64_t v18;
  char *v19;
  int v20;
  _DWORD *v21;
  int v22;
  _VMURegionNode *var4;
  _VMURegionNode *v24;
  unsigned int v25;
  unsigned int *var1;
  _VMUBlockNode *var0;
  uint64_t var2;
  _VMUBlockNode *v29;
  _VMUBlockNode *v30;
  unsigned int *v31;
  uint64_t v32;
  unint64_t *p_var0;
  uint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  unsigned int v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  unint64_t var5;
  _VMURegionNode *v42;
  unint64_t v43;
  int v44;
  unint64_t v45;
  id *v46;
  unint64_t v47;
  unint64_t v48;
  id *v49;
  BOOL v50;
  unint64_t v51;
  int64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  VMUClassInfo *v56;
  void *v57;
  uint64_t Path;
  const char *v59;
  void *v60;
  VMUClassInfo *v61;
  unint64_t v63;
  int v64;
  unint64_t v65;

  v3 = -[VMUTask isExclaveCore](self->_task, "isExclaveCore");
  -[VMUObjectIdentifier symbolicator](self->_objectIdentifier, "symbolicator");
  if (v3)
    SymbolOwner = CSSymbolicatorGetSymbolOwner();
  else
    SymbolOwner = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  v6 = SymbolOwner;
  v7 = v5;
  if ((CSIsNull() & 1) != 0)
    return;
  v65 = 0;
  -[VMUObjectIdentifier memoryReader](self->_objectIdentifier, "memoryReader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _copy_remote_mangled_symbol_value(v8, (uint64_t)"__ZL13TypeNameCache", v6, v7, 8uLL, &v65);

  v9 = v65;
  if (!v65)
    return;
  regionMap = self->_regionMap;
  var6 = regionMap->var6;
  var7 = regionMap->var7;
  v13 = var7 - var6;
  v14 = var7 < var6;
  if (v65 - var6 >= v13 || v14)
    return;
  v15 = (_DWORD *)MEMORY[0x1E0C85AC8];
  v16 = v65 >> *MEMORY[0x1E0C85AC8];
  if (v16)
  {
    var3 = (unsigned int *)regionMap->var3;
    v18 = v65 >> *MEMORY[0x1E0C85AC8];
    do
    {
      if (*var3 <= (v18 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v18 & 0x3FFFFFF) >> 3) + 4) >> (v18 & 7)) & 1) == 0)
      {
        return;
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
    v24 = &var4[(unint64_t)(v20 - 1)];
    if (v65 - *((_QWORD *)v24->var0 + 1) < *((_QWORD *)v24->var0 + 2))
      goto LABEL_15;
  }
  var5 = regionMap->var5;
  if (!(_DWORD)var5)
    return;
  v42 = regionMap->var4;
  while (1)
  {
    v43 = var5 >> 1;
    v24 = &v42[var5 >> 1];
    if (*((_QWORD *)v24->var0 + 1) <= v65)
      break;
LABEL_38:
    v39 = var5 >= 2;
    var5 = v43;
    if (!v39)
      return;
  }
  if (*((_QWORD *)v24->var0 + 2) + *((_QWORD *)v24->var0 + 1) <= v65)
  {
    v42 = v24 + 1;
    v43 = --var5 >> 1;
    goto LABEL_38;
  }
  v44 = objc_msgSend(v24->var0, "isSpecialPhysFootprintRegion");
  if (v44)
    v45 = 0;
  else
    v45 = (unint64_t)v24;
  if ((v44 & 1) != 0)
    return;
  if ((*(_BYTE *)(*(_QWORD *)v45 + 132) & 1) == 0)
    goto LABEL_71;
  v46 = (id *)(v45 + 64);
  v47 = regionMap->var5 - ((uint64_t)(v45 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v47)
    goto LABEL_68;
  while (2)
  {
    v48 = v47 >> 1;
    v49 = &v46[8 * (v47 >> 1)];
    if (*((_QWORD *)*v49 + 1) > v9)
    {
LABEL_49:
      v50 = v47 > 1;
      v47 = v48;
      if (!v50)
      {
        v47 = 0;
        goto LABEL_68;
      }
      continue;
    }
    break;
  }
  if (*((_QWORD *)*v49 + 2) + *((_QWORD *)*v49 + 1) <= v9)
  {
    v46 = v49 + 8;
    v48 = --v47 >> 1;
    goto LABEL_49;
  }
  v63 = v45;
  v64 = objc_msgSend(*v49, "isSpecialPhysFootprintRegion");
  v45 = v63;
  if (v64)
    v47 = 0;
  else
    v47 = (unint64_t)v49;
LABEL_68:
  if (v47)
    v45 = v47;
  v24 = (_VMURegionNode *)v45;
LABEL_71:
  *v21 = ((v45 - (unint64_t)var4) >> 6) + 1;
LABEL_15:
  v25 = v24->var3;
  if (v25)
  {
    var1 = v24->var1;
    var0 = regionMap->var0;
    var2 = v24->var2;
    v29 = &regionMap->var0[var2];
    if (var1)
    {
      if (v29->var0 > v9)
        return;
      v30 = &var0[v25 - 1 + var2];
      if (((*((_QWORD *)v30 + 1) >> 5) & 0xFFFFFFFFFLL) + v30->var0 <= v9)
        return;
      v31 = &var1[(v9 - (v29->var0 & -*MEMORY[0x1E0C85AD8])) >> *v15];
      v32 = *v31;
      p_var0 = &var0[v32].var0;
      if (*p_var0 > v9)
        return;
      v34 = v31[1];
      if (v34 < regionMap->var1)
      {
        v35 = &var0[v34].var0;
        v36 = *v35;
        if (*v35 <= v9)
        {
LABEL_51:
          v51 = v35[1];
          if ((v51 & 7) - 2 < 3)
            return;
          v52 = (char *)v35 - (char *)var0;
          v53 = (unint64_t)((char *)v35 - (char *)var0) >> 4;
          v54 = v9 - v36;
          v55 = regionMap->var2;
          if (v54 >= v55)
          {
            if (((v51 >> 5) & 0xFFFFFFFFFLL) - v54 > v55 || (_DWORD)v53 == -1)
              return;
          }
          else if ((_DWORD)v53 == -1)
          {
            return;
          }
          v56 = [VMUClassInfo alloc];
          v57 = (void *)MEMORY[0x1E0CB3940];
          Path = CSSymbolOwnerGetPath();
          if (Path)
            v59 = (const char *)Path;
          else
            v59 = "";
          objc_msgSend(v57, "stringWithUTF8String:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = -[VMUClassInfo initWithClassName:binaryPath:type:](v56, "initWithClassName:binaryPath:type:", CFSTR("llvm::DenseMap<TypeNameCacheKey, std::pair<const char *, size_t>>"), v60, 2);

          *(_QWORD *)((char *)self->_blocks + (v52 & 0xFFFFFFFF0) + 8) = *(_QWORD *)((char *)self->_blocks
                                                                                     + (v52 & 0xFFFFFFFF0)
                                                                                     + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)-[VMUClassInfoMap indexForClassInfo:](self->_classInfoIndexer, "indexForClassInfo:", v61) << 41);

          return;
        }
      }
      v37 = v34 - v32;
      if (v37)
      {
        do
        {
          v38 = v37 >> 1;
          v35 = &p_var0[2 * v38];
          v36 = *v35;
          if (*v35 <= v9)
          {
            if (((p_var0[2 * v38 + 1] >> 5) & 0xFFFFFFFFFLL) + v36 > v9)
              goto LABEL_51;
            p_var0 = v35 + 2;
            LODWORD(v38) = --v37 >> 1;
          }
          v39 = v37 >= 2;
          v37 = v38;
        }
        while (v39);
      }
    }
    else
    {
      do
      {
        v40 = v25 >> 1;
        v35 = &v29[v40].var0;
        v36 = *v35;
        if (*v35 <= v9)
        {
          if (((*((_QWORD *)&v29[v40] + 1) >> 5) & 0xFFFFFFFFFLL) + v36 > v9)
            goto LABEL_51;
          v29 = (_VMUBlockNode *)(v35 + 2);
          LODWORD(v40) = --v25 >> 1;
        }
        v39 = v25 >= 2;
        v25 = v40;
      }
      while (v39);
    }
  }
}

- (void)_identifyNonObjectsPointedToByTypedIvars
{
  unsigned int classInfosCount;
  _DWORD *v4;
  uint64_t v5;
  VMUClassInfoMap *classInfoIndexer;
  id v7;
  _QWORD v8[5];
  id v9;
  _DWORD *v10;
  unsigned int v11;
  _QWORD v12[5];

  classInfosCount = self->_classInfosCount;
  v4 = malloc_type_calloc(1uLL, ((classInfosCount + 8) >> 3) + 4, 0xFF42C4F3uLL);
  *v4 = classInfosCount + 1;
  v5 = MEMORY[0x1E0C809B0];
  classInfoIndexer = self->_classInfoIndexer;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke;
  v12[3] = &__block_descriptor_40_e32_v36__0Q8__VMUClassInfo_16I24_B28l;
  v12[4] = v4;
  -[VMUClassInfoMap enumerateInfosWithBlock:](classInfoIndexer, "enumerateInfosWithBlock:", v12);
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 258, 1282);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_2;
  v8[3] = &unk_1E4E00CB8;
  v11 = classInfosCount;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v8[4] = self;
  v7 = v9;
  -[VMUTaskMemoryScanner _withOrderedNodeMapper:](self, "_withOrderedNodeMapper:", v8);
  free(v4);

}

void __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned int a4)
{
  void *v6;
  int v7;
  unsigned int *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "infoType") != 1
    && objc_msgSend(v9, "infoType") != 128
    && objc_msgSend(v9, "infoType") != 8
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

void __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  int v16;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 88))
  {
    v5 = 0;
    v6 = 8;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = *(_QWORD *)(*(_QWORD *)(v2 + 80) + v6) >> 41;
      if ((*(_QWORD *)(*(_QWORD *)(v2 + 80) + v6) & 7) == 1
        && (_DWORD)v8 != 0
        && *(_DWORD *)(a1 + 56) > v8)
      {
        v10 = *(_DWORD **)(a1 + 48);
        if (*v10 <= v8
          || ((*((unsigned __int8 *)v10 + (v8 >> 3) + 4) >> (v8 & 7)) & 1) == 0)
        {
          v13[0] = v7;
          v13[1] = 3221225472;
          v13[2] = __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_3;
          v13[3] = &unk_1E4E00C90;
          v13[4] = v2;
          v16 = v8;
          v11 = *(id *)(a1 + 40);
          v12 = *(_QWORD *)(a1 + 48);
          v14 = v11;
          v15 = v12;
          (*(void (**)(uint64_t, unint64_t, uint64_t, _QWORD *))(a2 + 16))(a2, v5, 1, v13);

          v2 = *(_QWORD *)(a1 + 32);
        }
      }
      ++v5;
      v6 += 16;
    }
    while (v5 < *(unsigned int *)(v2 + 88));
  }
}

void __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;
  _QWORD *v7;
  _DWORD *v8;
  unint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = (void *)MEMORY[0x1A85A9758]();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) + 8 * *(unsigned int *)(a1 + 56));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_4;
  v10[3] = &unk_1E4E00C68;
  v13 = &v15;
  v14 = a2;
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v7 = v5;
  v12 = v7;
  -[VMUClassInfo enumerateAllPointerFieldsWithBlock:](v7, (uint64_t)v10);
  if (!*((_BYTE *)v16 + 24))
  {
    v8 = *(_DWORD **)(a1 + 48);
    v9 = *(unsigned int *)(a1 + 56);
    if (*v8 > v9)
      *((_BYTE *)v8 + (v9 >> 3) + 4) |= 1 << (v9 & 7);
  }

  _Block_object_dispose(&v15, 8);
  objc_autoreleasePoolPop(v4);
}

void __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_4(uint64_t a1, void *a2, void *a3, uint64_t a4)
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
  v11 = *(uint64_t **)(*(_QWORD *)(a1 + 32) + 112);
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
        v58 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
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
              v63 = NSMapGet(*(NSMapTable **)(a1 + 40), a3);
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

                v78 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "indexForClassInfo:", v77);
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

- (void)_identifyNonObjectsPointingToSwiftMetadata
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t Range;
  uint64_t v6;
  void *v7;
  unsigned int swiftMetadataMinBlockIndex;
  unsigned int swiftMetadataMaxBlockIndex;
  _VMUBlockNode *v10;
  unsigned int v11;
  uint64_t v12;
  _VMUBlockNode *blocks;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _VMUBlockNode *v18;
  _QWORD v19[8];
  unsigned int v20;

  v3 = -[VMUTask isExclaveCore](self->_task, "isExclaveCore");
  -[VMUObjectIdentifier symbolicator](self->_objectIdentifier, "symbolicator");
  if (v3)
    CSSymbolicatorGetSymbolOwner();
  else
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  if ((CSIsNull() & 1) != 0 || (CSSymbolOwnerGetSymbolWithMangledName(), CSIsNull()))
  {
    -[VMUTask isExclaveCore](self->_task, "isExclaveCore");
    v4 = 0;
  }
  else
  {
    Range = CSSymbolGetRange();
    v4 = v6;
    -[VMUTask isExclaveCore](self->_task, "isExclaveCore");
    if (Range)
      goto LABEL_10;
  }
  if (!self->_swiftMetadataMaxBlockIndex)
    return;
  Range = 0;
LABEL_10:
  +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUClassInfo, "classInfoWithClassName:binaryPath:type:", CFSTR("Swift HeapGenericLocalVariable"), CFSTR("/usr/lib/swift/libswiftCore.dylib"), 16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_swiftHeapGenericLocalVariableClassInfoIndex = -[VMUClassInfoMap indexForClassInfo:](self->_classInfoIndexer, "indexForClassInfo:", v7);
  swiftMetadataMinBlockIndex = self->_swiftMetadataMinBlockIndex;
  swiftMetadataMaxBlockIndex = self->_swiftMetadataMaxBlockIndex;
  if (swiftMetadataMinBlockIndex <= swiftMetadataMaxBlockIndex)
  {
    v11 = 0;
    v12 = 0;
    v10 = 0;
    do
    {
      blocks = self->_blocks;
      v14 = swiftMetadataMinBlockIndex;
      v15 = *((_QWORD *)&blocks[swiftMetadataMinBlockIndex] + 1);
      if ((v15 & 7) == 1 && self->_swiftMetadataClassInfoIndex == v15 >> 41)
      {
        if (v12 <= v11)
        {
          LODWORD(v17) = 2 * v12;
          if ((2 * v12) <= 0x100)
            v17 = 256;
          else
            v17 = v17;
          do
          {
            v16 = v17;
            v17 = (2 * v17);
          }
          while (v16 < v11);
          v18 = (_VMUBlockNode *)malloc_type_realloc(v10, 16 * v16, 0x1000040451B5BE8uLL);
          if (!v18)
          {
            NSLog(CFSTR("Out of memory: failed to expand %s from %u to %u entries"), "swiftMetadataBlocks", v12, v16);
            abort();
          }
          v10 = v18;
          bzero(&v18[v12], 16 * (v16 - v12));
          blocks = self->_blocks;
        }
        else
        {
          v16 = v12;
        }
        v10[v11++] = blocks[v14];
        swiftMetadataMaxBlockIndex = self->_swiftMetadataMaxBlockIndex;
        v12 = v16;
      }
      swiftMetadataMinBlockIndex = v14 + 1;
    }
    while ((int)v14 + 1 <= swiftMetadataMaxBlockIndex);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__VMUTaskMemoryScanner__identifyNonObjectsPointingToSwiftMetadata__block_invoke;
  v19[3] = &unk_1E4E00D08;
  v19[4] = self;
  v19[5] = Range;
  v19[6] = v4;
  v19[7] = v10;
  v20 = v11;
  -[VMUTaskMemoryScanner _withOrderedNodeMapper:](self, "_withOrderedNodeMapper:", v19);
  if (v10)
    free(v10);

}

uint64_t __66__VMUTaskMemoryScanner__identifyNonObjectsPointingToSwiftMetadata__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __int128 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  int v15;

  v2 = *(_QWORD *)(result + 32);
  if (*(_DWORD *)(v2 + 88))
  {
    v4 = result;
    v5 = 0;
    v6 = 0;
    v7 = (__int128 *)(result + 40);
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = *(_QWORD *)(v2 + 80) + v5;
      if ((*(_QWORD *)(v9 + 8) & 0xFFFFFE0000000007) == 1)
      {
        v11[0] = v8;
        v11[1] = 3221225472;
        v11[2] = __66__VMUTaskMemoryScanner__identifyNonObjectsPointingToSwiftMetadata__block_invoke_2;
        v11[3] = &unk_1E4E00CE0;
        v12 = *v7;
        v10 = *(_QWORD *)(v4 + 56);
        v11[4] = v2;
        v13 = v10;
        v14 = v9;
        v15 = *(_DWORD *)(v4 + 64);
        result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, _QWORD *))(a2 + 16))(a2, v6, 1, v11);
        v2 = *(_QWORD *)(v4 + 32);
      }
      ++v6;
      v5 += 16;
    }
    while (v6 < *(unsigned int *)(v2 + 88));
  }
  return result;
}

void __66__VMUTaskMemoryScanner__identifyNonObjectsPointingToSwiftMetadata__block_invoke_2(uint64_t a1, uint64_t *a2)
{
  unint64_t v3;
  BOOL v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  unsigned int v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t *v11;
  BOOL v12;
  uint64_t (**v13)(id, _QWORD, uint64_t);

  v3 = -[VMUTask ptrauthStripDataPointer:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *a2);
  if (HIDWORD(v3))
    v4 = (v3 & 7) == 0;
  else
    v4 = 0;
  if (v4)
  {
    v5 = v3;
    if (v3 - *(_QWORD *)(a1 + 40) >= *(_QWORD *)(a1 + 48))
    {
      v8 = *(_DWORD *)(a1 + 72);
      if (v8)
      {
        v9 = *(_QWORD **)(a1 + 56);
        do
        {
          v10 = v8 >> 1;
          v11 = &v9[2 * v10];
          if (*v11 <= v3)
          {
            if (((v9[2 * v10 + 1] >> 5) & 0xFFFFFFFFFLL) + *v11 > v3)
              goto LABEL_7;
            v9 = v11 + 2;
            LODWORD(v10) = --v8 >> 1;
          }
          v12 = v8 >= 2;
          v8 = v10;
        }
        while (v12);
      }
    }
    else
    {
LABEL_7:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "memoryReader");
      v13 = (uint64_t (**)(id, _QWORD, uint64_t))objc_claimAutoreleasedReturnValue();
      v6 = (uint64_t *)v13[2](v13, v5, 8);
      if (v6)
      {
        v7 = *v6;

        if (v7 == 1280)
          *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)*(unsigned int *)(*(_QWORD *)(a1 + 32) + 344) << 41);
      }
      else
      {

      }
    }
  }
}

- (id)_recursivelyIdentifySwiftAsyncTaskSlabs:(unint64_t)a3 containerRange:(_VMURange)a4 remoteBlock:(unint64_t)a5 mappedBlock:(unint64_t)a6 asyncTaskSlabMetadataIsa:(unint64_t)a7 nestingLevel:(unsigned int)a8
{
  unint64_t length;
  unint64_t location;
  uint64_t v15;
  VMUMutableFieldInfo *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  VMUMutableFieldInfo *v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  void *context;
  VMUTaskMemoryScanner *v37;
  __int128 v38;
  __int128 v39;

  length = a4.length;
  location = a4.location;
  v38 = 0u;
  v39 = 0u;
  vmu_reflection_interop_asyncTaskSlabAllocations(*(_QWORD *)-[VMUObjectIdentifier swiftMirror](self->_objectIdentifier, "swiftMirror"), &v38);
  if (!(_QWORD)v38)
  {
    v15 = v39;
    if (!VMURangeContainsRange(location, length, a3, v39))
    {
      if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1)
        dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_163);
      if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1)
        _debugSwiftAsyncPrintf(a8, "Bailing because slab %p [%llu] does not fit inside container\n");
      goto LABEL_31;
    }
    if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1)
      dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_163);
    v37 = self;
    if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1)
      _debugSwiftAsyncPrintf(a8, "Slab %p [%llu], next slab %p\n", (const void *)a3, v15, *((const void **)&v38 + 1));
    v16 = [VMUMutableFieldInfo alloc];
    v17 = -[VMUFieldInfo initWithName:type:scan:offset:size:](v16, "initWithName:type:scan:offset:size:", CFSTR("slab"), 0, 0, (a3 - location), v39);
    v18 = (void *)v17;
    if (DWORD1(v39))
    {
      v19 = 0;
      v32 = v15;
      v33 = a3;
      v34 = (void *)v17;
      while (2)
      {
        v20 = (void *)MEMORY[0x1A85A9758]();
        v21 = *((_QWORD *)&v39 + 1) + 16 * v19;
        v22 = *(_QWORD *)v21;
        v23 = *(unsigned int *)(v21 + 8);
        if (!VMURangeContainsRange(a3, v15, *(_QWORD *)v21, v23))
        {
          objc_autoreleasePoolPop(v20);
          v29 = 0;
          goto LABEL_35;
        }
        if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1)
          dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_163);
        v35 = v19;
        context = v20;
        if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1)
        {
          VMURangeDescription(v22, v23);
          v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          _debugSwiftAsyncPrintf(a8 + 1, "Chunk %s\n", (const char *)objc_msgSend(v24, "UTF8String"));

        }
        v25 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("chunk"), 0, 1, (v22 - a3), v23);
        objc_msgSend(v18, "addSubField:", v25);
        v26 = ((v22 + 7) & 0xFFFFFFFFFFFFFFF8) - a5;
        while (v26 <= v22 - a5 + v23 - 8)
        {
          if (!VMURangeContainsRange(v22, v23, v26 + a5, 8))
            goto LABEL_33;
          if (*(_QWORD *)(v26 + a6) == a7)
          {
            LODWORD(v31) = a8 + 2;
            -[VMUTaskMemoryScanner _recursivelyIdentifySwiftAsyncTaskSlabs:containerRange:remoteBlock:mappedBlock:asyncTaskSlabMetadataIsa:nestingLevel:](v37, "_recursivelyIdentifySwiftAsyncTaskSlabs:containerRange:remoteBlock:mappedBlock:asyncTaskSlabMetadataIsa:nestingLevel:", v26 + a5, v22, v23, a5, a6, a7, v31);
            v27 = objc_claimAutoreleasedReturnValue();
            if (!v27)
            {
LABEL_33:

              objc_autoreleasePoolPop(context);
              v29 = 0;
              v18 = v34;
              goto LABEL_35;
            }
            v28 = (void *)v27;
            -[VMUMutableFieldInfo addSubField:](v25, "addSubField:", v27);
            v26 = ((v26 + a5 + objc_msgSend(v28, "size") + 7) & 0xFFFFFFFFFFFFFFF8) - a5;

          }
          else
          {
            v26 += 8;
          }
        }

        objc_autoreleasePoolPop(context);
        v18 = v34;
        v19 = v35 + 1;
        v15 = v32;
        a3 = v33;
        if (v35 + 1 < (unint64_t)DWORD1(v39))
          continue;
        break;
      }
    }
    v29 = v18;
LABEL_35:

    return v29;
  }
  if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1)
    dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_163);
  if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1)
    _debugSwiftAsyncPrintf(a8, "Bailing because vmu_reflection_interop_asyncTaskSlabAllocations error: %s\n");
LABEL_31:
  v29 = 0;
  return v29;
}

- (void)_identifyAttributeGraphAllocations
{
  _BOOL4 v3;
  unint64_t v4;
  unsigned int v5;
  _VMURegionNode *regions;
  unsigned int *v7;
  _VMURegionNode *v8;
  uint64_t v9;
  unsigned int *p_var2;
  unsigned int var2;
  unsigned int v12;
  unsigned int v13;
  _VMUBlockNode *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t Path;
  __CFString *v19;
  VMUMutableClassInfo *v20;
  id v22;

  v3 = -[VMUTask isExclaveCore](self->_task, "isExclaveCore");
  -[VMUObjectIdentifier symbolicator](self->_objectIdentifier, "symbolicator");
  if (v3)
    CSSymbolicatorGetSymbolOwner();
  else
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  if ((CSIsNull() & 1) == 0)
  {
    -[NSMutableArray indexesOfObjectsPassingTest:](self->_zoneNames, "indexesOfObjectsPassingTest:", &__block_literal_global_181);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count") && self->_regionsCount)
    {
      v4 = 0;
      v5 = -1;
      do
      {
        regions = self->_regions;
        v7 = (unsigned int *)regions[v4].var0;
        if (objc_msgSend(v22, "containsIndex:", v7[37]))
        {
          v8 = &regions[v4];
          var2 = v8->var2;
          p_var2 = &v8->var2;
          v9 = var2;
          if (*((_QWORD *)v7 + 17) + (unint64_t)var2 > var2)
          {
            v12 = v9 + 1;
            v13 = v9;
            do
            {
              v14 = &self->_blocks[v9];
              v17 = *((_QWORD *)v14 + 1);
              v16 = (unint64_t *)v14 + 1;
              v15 = v17;
              if (!(v17 >> 41))
              {
                if (v5 == -1)
                {
                  Path = CSSymbolOwnerGetPath();
                  if (Path)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Path);
                    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v19 = &stru_1E4E04720;
                  }
                  v20 = -[VMUClassInfo initWithClassName:binaryPath:type:]([VMUMutableClassInfo alloc], "initWithClassName:binaryPath:type:", CFSTR("AttributeGraph Data"), v19, 8);
                  -[VMUMutableClassInfo setDefaultScanType:](v20, "setDefaultScanType:", 1);
                  v5 = -[VMUTaskMemoryScanner _indexForClassInfo:](self, "_indexForClassInfo:", v20);

                  v15 = *v16;
                }
                *v16 = v15 & 0x1FFFFFFFFFFLL | ((unint64_t)v5 << 41);
                v13 = *p_var2;
              }
              v9 = v12;
            }
            while (*((_QWORD *)v7 + 17) + (unint64_t)v13 > v12++);
          }
        }
        else if (objc_msgSend(*((id *)v7 + 4), "isEqualToString:", CFSTR("AttributeGraph Data")))
        {
          self->_attributeGraphVMRegionBlockIndex = regions[v4].var2;
        }

        ++v4;
      }
      while (v4 < self->_regionsCount);
    }

  }
}

uint64_t __58__VMUTaskMemoryScanner__identifyAttributeGraphAllocations__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsString:", CFSTR("AttributeGraph graph data"));
}

- (void)_identifySwiftAsyncTaskSlabs
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t blocksCount;
  unsigned int v12;
  uint64_t v13;
  unint64_t v14;
  _VMUBlockNode *v15;
  unint64_t v16;
  const void *var0;
  uint64_t v19;
  const char *v20;
  const char *v21;
  unint64_t v22;
  const char *v23;
  void *v24;
  const void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  const char *v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v3 = -[VMUObjectIdentifier swiftConcurrencyDebugAsyncTaskMetadataIsa](self->_objectIdentifier, "swiftConcurrencyDebugAsyncTaskMetadataIsa");
  v4 = -[VMUObjectIdentifier swiftConcurrencyDebugAsyncTaskSlabMetadataIsa](self->_objectIdentifier, "swiftConcurrencyDebugAsyncTaskSlabMetadataIsa");
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
  {
    if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1)
      dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_163);
    if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1)
      _debugSwiftAsyncPrintf(0, "One or both of the AsyncTask and AsyncTask Slab metadata isas isn't known, so skipping precise scanning of AsyncTasks and AsyncTask Slabs.\n");
  }
  else
  {
    v6 = v4;
    -[VMUClassInfoMap classInfoForAddress:](self->_classInfoIndexer, "classInfoForAddress:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
    v32 = v6;
    -[VMUClassInfoMap classInfoForAddress:](self->_classInfoIndexer, "classInfoForAddress:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v7;
    v9 = -[VMUClassInfoMap indexForClassInfo:](self->_classInfoIndexer, "indexForClassInfo:", v7);
    v34 = (void *)v8;
    v10 = -[VMUClassInfoMap indexForClassInfo:](self->_classInfoIndexer, "indexForClassInfo:", v8);
    blocksCount = self->_blocksCount;
    if ((_DWORD)blocksCount)
    {
      v12 = v10;
      v13 = 0;
      v14 = 0;
      while (1)
      {
        v15 = &self->_blocks[v13];
        v16 = *((_QWORD *)v15 + 1);
        if ((v16 & 7) != 1)
          goto LABEL_49;
        if (v9 != v16 >> 41 && v12 != v16 >> 41)
          goto LABEL_49;
        var0 = (const void *)v15->var0;
        if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1)
          dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_163);
        v19 = (v16 >> 5) & 0xFFFFFFFFFLL;
        if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1)
        {
          v20 = "AsyncTask Slab";
          if (v9 == *((_QWORD *)v15 + 1) >> 41)
            v20 = "AsyncTask";
          _debugSwiftAsyncPrintf(0, "Block %p [%llu] is %s\n", var0, (v16 >> 5) & 0xFFFFFFFFFLL, v20);
        }
        if (v9 != *((_QWORD *)v15 + 1) >> 41)
          break;
        v21 = vmu_swift_reflection_asyncTaskSlabPointer(*(_QWORD *)-[VMUObjectIdentifier swiftMirror](self->_objectIdentifier, "swiftMirror"));
        if (!v21)
        {
          v25 = (const void *)v22;
          v29 = VMURangeContainsRange((unint64_t)var0, v19, v22, 8);
          if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1)
            dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_163);
          if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1)
          {
            v30 = " not";
            if (v29)
              v30 = "";
            _debugSwiftAsyncPrintf(1, "Found first slab at %p,%s in same block\n", v25, v30);
          }
          if (!v29)
            goto LABEL_48;
          v24 = (void *)objc_msgSend(v33, "mutableCopy");
          goto LABEL_31;
        }
        v23 = v21;
        if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1)
          dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_163);
        if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1)
          _debugSwiftAsyncPrintf(1, "vmu_swift_reflection_asyncTaskSlabPointer error: %s\n", v23);
LABEL_48:
        blocksCount = self->_blocksCount;
LABEL_49:
        ++v14;
        ++v13;
        if (v14 >= blocksCount)
          goto LABEL_50;
      }
      v24 = (void *)objc_msgSend(v34, "mutableCopy");
      objc_msgSend(v24, "setDefaultScanType:", 0);
      v25 = var0;
LABEL_31:
      v35 = 0;
      v36 = 0;
      if (!-[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:](self->_memoryCache, "mapAddress:size:returnedAddress:returnedSize:", var0, v19, &v36, &v35))
      {
        LODWORD(v31) = 1;
        -[VMUTaskMemoryScanner _recursivelyIdentifySwiftAsyncTaskSlabs:containerRange:remoteBlock:mappedBlock:asyncTaskSlabMetadataIsa:nestingLevel:](self, "_recursivelyIdentifySwiftAsyncTaskSlabs:containerRange:remoteBlock:mappedBlock:asyncTaskSlabMetadataIsa:nestingLevel:", v25, var0, v19, var0, v36, v32, v31);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v26;
        if (v26)
        {
          v37[0] = v26;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setFields:", v28);

          *((_QWORD *)v15 + 1) = *((_QWORD *)v15 + 1) & 0x1FFFFFFFFFFLL | ((unint64_t)-[VMUClassInfoMap addClassInfo:forAddress:](self->_classInfoIndexer, "addClassInfo:forAddress:", v24, 0) << 41);
        }
        else
        {
          if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1)
            dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_163);
          if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1)
            _debugSwiftAsyncPrintf(1, "Error getting info for slab, scanning block %p [%llu] conservatively\n", var0, v19);
        }

      }
      goto LABEL_48;
    }
LABEL_50:

  }
}

- (void)_identifyNonObjectsUsingStackBacktrace
{
  VMUTaskStackLogReader *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  VMUClassInfoMap *classInfoIndexer;
  VMUTaskStackLogReader *v8;
  _QWORD v9[5];

  if (!-[VMUTask isCore](self->_task, "isCore"))
  {
    v3 = [VMUTaskStackLogReader alloc];
    v4 = -[VMUTask taskPort](self->_task, "taskPort");
    v5 = -[VMUObjectIdentifier symbolicator](self->_objectIdentifier, "symbolicator");
    v8 = -[VMUTaskStackLogReader initWithTask:symbolicator:](v3, "initWithTask:symbolicator:", v4, v5, v6);
    classInfoIndexer = self->_classInfoIndexer;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__VMUTaskMemoryScanner__identifyNonObjectsUsingStackBacktrace__block_invoke;
    v9[3] = &unk_1E4E00D90;
    v9[4] = self;
    -[VMUStackLogReaderBase identifyNonObjectsUsingStackBacktraces:classInfoMap:classInfoSetterBlock:](v8, "identifyNonObjectsUsingStackBacktraces:classInfoMap:classInfoSetterBlock:", self, classInfoIndexer, v9);

  }
}

uint64_t __62__VMUTaskMemoryScanner__identifyNonObjectsUsingStackBacktrace__block_invoke(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 80) + 16 * a2;
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(v3 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)a3 << 41);
  return result;
}

- (void)_findMarkedAbandonedBlocks
{
  void *userMarkedAbandoned;
  unint64_t v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  _VMURegionNode *regions;
  _VMURegionNode *v9;
  VMUTaskMemoryCache *memoryCache;
  unsigned int regionsCount;
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
  VMUObjectIdentifier *v33;
  VMUTaskMemoryCache *v34;
  VMUTaskMemoryCache *v35;
  _VMURegionNode *v36;
  _VMURegionNode *v37;
  int v38;
  VMUTask *v39;
  _BOOL4 v40;
  uint64_t v41;
  char *v42;
  id v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  void (**v48)(void);
  unint64_t v49;
  _VMURegionNode *v50;
  unsigned int blocksCount;
  _DWORD *v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  _VMUBlockNode *blocks;
  _QWORD *v57;
  unint64_t v58;
  _DWORD *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  FILE *v63;
  int v64;
  VMUTaskMemoryCache *v65;
  _QWORD v66[4];
  VMUTaskMemoryCache *v67;
  VMUObjectIdentifier *v68;
  _VMURegionNode *v69;
  _VMURegionNode *v70;
  unint64_t v71;

  userMarkedAbandoned = self->_userMarkedAbandoned;
  if (userMarkedAbandoned)
  {
    free(userMarkedAbandoned);
    self->_userMarkedAbandoned = 0;
  }
  if (!self->_abandonedMarkingEnabled || !self->_regionsCount)
    return;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  do
  {
    if (!objc_msgSend(self->_regions[v4].var0, "isAnalysisToolRegion"))
      goto LABEL_51;
    regions = self->_regions;
    v9 = &regions[v4];
    memoryCache = self->_memoryCache;
    regionsCount = self->_regionsCount;
    v12 = self->_task;
    v13 = memoryCache;
    if (v9->var7)
      goto LABEL_8;
    v65 = v13;
    if (objc_msgSend(v9->var0, "isSpecialPhysFootprintRegion"))
    {

      goto LABEL_51;
    }
    v66[0] = 0;
    v71 = 0;
    v38 = -[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:](v65, "mapAddress:size:returnedAddress:returnedSize:", *((_QWORD *)v9->var0 + 1), *((_QWORD *)v9->var0 + 2), v66, &v71);
    if (!v38)
    {
      v13 = v65;
      v49 = v71;
      v9->var7 = (void *)v66[0];
      v50 = &regions[v4];
      v50->var6 = v49;
      v50->var8 = v9;
LABEL_8:

      v14 = self->_regions;
      var7 = (unint64_t)v14[v4].var7;
      if (var7)
      {
        v16 = (unint64_t *)MEMORY[0x1E0C85AD8];
        v17 = *MEMORY[0x1E0C85AD8];
        v18 = v7;
        do
        {
          v19 = v17 + var7;
          if (*(_QWORD *)var7 == 0x1DE67829AD1A2FBBLL && *(_DWORD *)(var7 + 8) <= 1u)
          {
            v20 = *(_DWORD *)(var7 + 20);
            v21 = v6 + v20 - 1;
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
                v7 = v22;
                v22 = (2 * v22);
              }
              while (v7 < v21);
              v23 = malloc_type_realloc(v5, 8 * v7, 0x100004000313F17uLL);
              if (!v23)
              {
                NSLog(CFSTR("Out of memory: failed to expand %s from %u to %u entries"), "allMarkedAddresses", v18, v7);
                abort();
              }
              v5 = v23;
              v20 = *(_DWORD *)(var7 + 20);
            }
            else
            {
              v7 = v18;
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
                  *((_QWORD *)v5 + v6++) = v28;
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
            v7 = v18;
          }
          v31 = (void *)v19 >= (char *)v14[v4].var7 + v14[v4].var6 || v19 == 0;
          v18 = v7;
          var7 = v19;
        }
        while (!v31);
      }
      v32 = self->_memoryCache;
      v33 = self->_objectIdentifier;
      v34 = v32;
      v35 = v34;
      v36 = &v14[v4];
      if (v36->var7)
      {
        if (v36->var8 == v36)
        {
          v66[0] = MEMORY[0x1E0C809B0];
          v66[1] = 3221225472;
          v66[2] = ___unmapRegion_block_invoke;
          v66[3] = &unk_1E4E01050;
          v67 = v34;
          v69 = &v14[v4];
          v68 = v33;
          v70 = v14;
          v48 = (void (**)(void))MEMORY[0x1A85A995C](v66);
          v48[2]();

        }
        else
        {
          v37 = &v14[v4];
          v37->var6 = 0;
          v37->var7 = 0;
          v37->var8 = 0;
        }
      }

      goto LABEL_51;
    }
    v64 = v38;
    v39 = v12;
    if ((*((_DWORD *)v9->var0 + 13) & 3u) - 1 >= 2)
    {
      v40 = task_exists(v12);
      if (v4 != regionsCount - 1 && v40)
      {
        v63 = (FILE *)*MEMORY[0x1E0C80C10];
        v62 = objc_msgSend(v9->var0, "address");
        v61 = *((_QWORD *)v9->var0 + 2) + *((_QWORD *)v9->var0 + 1);
        v41 = *((unsigned int *)v9->var0 + 6);
        v42 = vm_prot_strings[v41];
        VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(*((unsigned __int8 *)v9->var0 + 232), *((unsigned __int8 *)v9->var0 + 104), *((unsigned __int8 *)v9->var0 + 50), v41, *((unsigned __int8 *)v9->var0 + 49));
        v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v44 = (const char *)objc_msgSend(v43, "UTF8String");
        v45 = *((_QWORD *)v9->var0 + 2) >> *MEMORY[0x1E0C85AC8];
        v46 = "pages";
        if (v45 == 1)
          v46 = "page";
        v47 = " [root]";
        if (regions[v4].var4 == regions[v4].var5)
          v47 = "";
        v60 = v42;
        v39 = v12;
        fprintf(v63, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v62, v61, v60, v44, v45, v46, v47, v64);

      }
    }

LABEL_51:
    ++v4;
  }
  while (v4 < self->_regionsCount);
  if (v5)
  {
    blocksCount = self->_blocksCount;
    v52 = malloc_type_calloc(1uLL, ((blocksCount + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *v52 = blocksCount;
    self->_userMarkedAbandoned = v52;
    mergesort_b(v5, v6, 8uLL, &__block_literal_global_200);
    if (v6)
    {
      v53 = 0;
      v54 = 0;
      do
      {
        v55 = self->_blocksCount;
        if (v54 >= v55)
          break;
        blocks = self->_blocks;
        v57 = (_QWORD *)&blocks[v54] + 1;
        while (1)
        {
          if ((*v57 & 7) == 1)
          {
            v58 = *((_QWORD *)v5 + v53);
            if (*(v57 - 1) >= v58)
              break;
          }
          ++v54;
          v57 += 2;
          if (v55 == v54)
            goto LABEL_67;
        }
        v55 = v54;
        if (blocks[v54].var0 != v58)
        {
LABEL_67:
          v54 = v55;
          goto LABEL_68;
        }
        v59 = self->_userMarkedAbandoned;
        if (*v59 > v54)
          *((_BYTE *)v59 + (v54 >> 3) + 4) |= 1 << (v54 & 7);
        v54 = v54;
LABEL_68:
        ++v53;
      }
      while (v53 != v6);
    }
    free(v5);
  }
}

uint64_t __50__VMUTaskMemoryScanner__findMarkedAbandonedBlocks__block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 < *a3)
    return 0xFFFFFFFFLL;
  else
    return *a2 != *a3;
}

- (void)refineTypesWithOverlay:(id)a3
{
  -[VMUClassInfoMap _applyTypeOverlay:](self->_classInfoIndexer, "_applyTypeOverlay:", a3);
  -[VMUTaskMemoryScanner _updateLinearClassInfos](self, "_updateLinearClassInfos");
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
  __assert_rtn("_noteBlocksInRegion", "VMUTaskMemoryScanner.m", 1186, "endOfLastPageWithAllocations - startOfFirstPageWithAllocations");
}

- (uint64_t)getCachedScanInfoForClassWithIsa:(void *)a3 classInfo:(_BYTE *)a4 returnedShouldApplySwiftPointerMaskingToIsa:
{
  uint64_t v7;
  int v8;
  unsigned int v9;
  _BOOL4 v10;
  unsigned int *v11;
  int v12;
  char *v13;
  char v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int *v26;
  int v27;
  _QWORD v28[7];
  unsigned int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  _QWORD v34[3];
  unsigned int v35;

  if (result)
  {
    if (a2 && a3)
    {
      v7 = result;
      if (!*(_QWORD *)(*(_QWORD *)(result + 280) + 8 * a2))
      {
        v8 = *(_DWORD *)(result + 344);
        v9 = objc_msgSend(a3, "infoType") - 8;
        v10 = v9 <= 0x38 && ((1 << v9) & 0x100000001000001) != 0 || v8 == a2;
        v11 = *(unsigned int **)(v7 + 288);
        if (*v11 > a2)
        {
          v12 = 1 << (a2 & 7);
          v13 = (char *)v11 + (a2 >> 3);
          v14 = v13[4];
          v15 = v14 | v12;
          v16 = v14 & ~(_BYTE)v12;
          if (v10)
            v17 = v15;
          else
            v17 = v16;
          v13[4] = v17;
        }
        v18 = objc_msgSend(a3, "instanceSize");
        v34[0] = 0;
        v34[1] = v34;
        v34[2] = 0x2020000000;
        v35 = (v18 >> 3) + 2;
        *(_QWORD *)(*(_QWORD *)(v7 + 280) + 8 * a2) = malloc_type_malloc(4 * v35, 0x100004052888210uLL);
        v30 = 0;
        v31 = &v30;
        v32 = 0x2020000000;
        v33 = 0;
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __111__VMUTaskMemoryScanner_getCachedScanInfoForClassWithIsa_classInfo_returnedShouldApplySwiftPointerMaskingToIsa___block_invoke;
        v28[3] = &unk_1E4E00DD8;
        v28[5] = &v30;
        v28[6] = v34;
        v28[4] = v7;
        v29 = a2;
        objc_msgSend(a3, "enumerateScanningLocationsForSize:withBlock:", v18, v28);
        v19 = objc_msgSend(a3, "defaultScanType");
        v20 = *(_QWORD *)(*(_QWORD *)(v7 + 280) + 8 * a2);
        v21 = *((unsigned int *)v31 + 6);
        *((_DWORD *)v31 + 6) = v21 + 1;
        v22 = objc_msgSend(a3, "defaultScanType");
        v23 = (v18 + 7) & 0xFFFFF8;
        if (v19 == 1)
          v23 = v18;
        *(_DWORD *)(v20 + 4 * v21) = v23 & 0xFFFFFF | ((v22 & 0x7F) << 24);
        v24 = *(_QWORD *)(*(_QWORD *)(v7 + 280) + 8 * a2);
        v25 = *((unsigned int *)v31 + 6);
        *((_DWORD *)v31 + 6) = v25 + 1;
        *(_DWORD *)(v24 + 4 * v25) = ((objc_msgSend(a3, "defaultScanType") & 0x7F) << 24) | 0xFFFFFF;
        _Block_object_dispose(&v30, 8);
        _Block_object_dispose(v34, 8);
      }
      if (a4)
      {
        v26 = *(unsigned int **)(v7 + 288);
        if (*v26 <= a2)
          LOBYTE(v27) = 0;
        else
          v27 = (*((unsigned __int8 *)v26 + (a2 >> 3) + 4) >> (a2 & 7)) & 1;
        *a4 = v27;
      }
      return *(_QWORD *)(*(_QWORD *)(v7 + 280) + 8 * a2);
    }
    else
    {
      result = 0;
      if (a4)
        *a4 = 0;
    }
  }
  return result;
}

void __111__VMUTaskMemoryScanner_getCachedScanInfoForClassWithIsa_classInfo_returnedShouldApplySwiftPointerMaskingToIsa___block_invoke(uint64_t a1, void *a2, int a3, char a4)
{
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(_DWORD *)(v8 + 24);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(_DWORD *)(v10 + 24);
  if (v9 + 2 >= v11)
  {
    *(_DWORD *)(v10 + 24) = 2 * v11;
    v13 = malloc_type_realloc(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) + 8 * *(unsigned int *)(a1 + 56)), 4 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 0x100004052888210uLL);
    v12 = *(unsigned int *)(a1 + 56);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) + 8 * v12) = v13;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(_DWORD *)(v8 + 24);
  }
  else
  {
    v12 = *(unsigned int *)(a1 + 56);
  }
  v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) + 8 * v12);
  *(_DWORD *)(v8 + 24) = v9 + 1;
  v15 = v9;
  v16 = a3 & 0xFFFFFF | ((a4 & 0x7F) << 24);
  if (a2)
  {
    objc_msgSend(a2, "typeName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v19 = v17;
      objc_msgSend(a2, "typeName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(v14 + 4 * v15) = v16 | ((objc_msgSend(v18, "length") == 0) << 31);

      v17 = v19;
    }
    else
    {
      *(_DWORD *)(v14 + 4 * v15) = v16;
    }

  }
  else
  {
    *(_DWORD *)(v14 + 4 * v9) = v16;
  }
}

- (void)scanLocalMemory:(uint64_t)a3 atOffset:(unsigned int)a4 node:(unint64_t)a5 length:(unsigned int)a6 isa:(void *)a7 fieldInfo:(unsigned int)a8 stride:(uint64_t)a9 recorder:
{
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  unsigned int v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unsigned int *v34;
  unint64_t v35;
  uint64_t v36;
  int v37;
  _DWORD *v38;
  int v39;
  unint64_t v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t *v45;
  _QWORD *v46;
  unsigned int *v47;
  uint64_t v48;
  unint64_t *v49;
  uint64_t v50;
  unint64_t *v51;
  unint64_t v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  int v59;
  uint64_t v60;
  unint64_t v61;
  id *v62;
  unint64_t v63;
  unint64_t v64;
  id *v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  int v70;
  unint64_t *v71;
  void *v72;
  unint64_t v73;
  id v74;
  uint64_t v75;
  unint64_t v76;
  unsigned int v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unsigned int v82;
  unint64_t v83;
  id v84;
  id v85;
  id v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t *v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unsigned int *v96;
  unint64_t v97;
  uint64_t v98;
  int v99;
  _DWORD *v100;
  int v101;
  unint64_t v102;
  unsigned int v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t *v107;
  _QWORD *v108;
  unsigned int *v109;
  uint64_t v110;
  unint64_t *v111;
  uint64_t v112;
  unint64_t *v113;
  unint64_t v114;
  unsigned int v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  int v121;
  uint64_t v122;
  unint64_t v123;
  id *v124;
  unint64_t v125;
  unint64_t v126;
  id *v127;
  unint64_t v128;
  unint64_t v129;
  unint64_t v130;
  int v132;
  int v133;
  uint64_t v134;
  _BOOL4 v135;
  unint64_t v136;
  unsigned int v137;
  char *v138;
  char *v139;
  unint64_t v140;
  _BOOL4 v141;
  char v142;
  int v143;
  unint64_t v144;
  BOOL v145;
  BOOL v146;
  id v148;
  void *v149;
  uint64_t v150;
  unint64_t v151;
  unint64_t v152;
  uint64_t v153;
  unint64_t v154;
  void *v155;
  void *v156;
  void *v157;
  NSMapTable *v158;
  void *v159;
  uint64_t *v160;
  unint64_t v161;
  unint64_t v162;
  unint64_t v163;
  unint64_t v164;
  unint64_t v165;
  unint64_t v166;
  unsigned int *v167;
  unint64_t v168;
  uint64_t v169;
  int v170;
  _DWORD *v171;
  int v172;
  unint64_t v173;
  unsigned int v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  unint64_t *v178;
  _QWORD *v179;
  unsigned int *v180;
  uint64_t v181;
  unint64_t *v182;
  uint64_t v183;
  unint64_t *v184;
  unint64_t v185;
  unsigned int v186;
  uint64_t v187;
  unint64_t v188;
  unint64_t v189;
  unint64_t v190;
  int v191;
  unint64_t v192;
  uint64_t v193;
  _DWORD *v194;
  uint64_t v195;
  id *v196;
  unint64_t v197;
  unint64_t v198;
  id *v199;
  unint64_t v200;
  unint64_t v201;
  unint64_t v202;
  int v204;
  unint64_t v205;
  uint64_t v206;
  _DWORD *v207;
  _BOOL4 v208;
  BOOL v209;
  uint64_t v210;
  unint64_t v212;
  unint64_t v213;
  uint64_t v214;
  void *v215;
  unint64_t v217;
  int v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  unsigned int v225;
  id v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  char v230;
  int v231;
  char v232;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 64), "swiftRuntimeInfoStableABI");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 64), "swiftRuntimeInfoPreABI");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v215 = v17;

    v218 = objc_msgSend(*(id *)(a1 + 64), "hasSwiftContent");
    if (*(_DWORD *)(a1 + 328) == a6 || *(_DWORD *)(a1 + 332) == a6 || *(_DWORD *)(a1 + 336) == a6)
    {
      v18 = 1;
      if (!a6)
        goto LABEL_13;
    }
    else
    {
      v18 = *(_DWORD *)(a1 + 340) == a6;
      if (!a6)
        goto LABEL_13;
    }
    if (*(_BYTE *)(a1 + 360))
      v19 = v18;
    else
      v19 = 1;
    if ((v19 & 1) == 0)
    {
      v73 = a5 - 8;
      if (a5 < 8)
        goto LABEL_193;
      v74 = *(id *)(*(_QWORD *)(a1 + 256) + 8 * a6);
      v232 = 0;
      v226 = v74;
      v75 = -[VMUTaskMemoryScanner getCachedScanInfoForClassWithIsa:classInfo:returnedShouldApplySwiftPointerMaskingToIsa:](a1, a6, v74, &v232);
      v76 = 0;
      v77 = 0;
      v228 = a2 + a3;
LABEL_88:
      v78 = *(_DWORD *)(v75 + 4 * v77);
      v79 = HIBYTE(v78) & 0x7F;
      v80 = *(_QWORD *)&v78 & 0xFFFFFFLL;
      v81 = v76 + 8;
      if ((_DWORD)v79 == 1)
        v81 = v76 + 1;
      if ((_DWORD)v80 == 0xFFFFFF)
        v82 = v77;
      else
        v82 = v77 + 1;
      if ((_DWORD)v80 == 0xFFFFFF)
        v76 = v81;
      else
        v76 = v80;
      if (((*(_DWORD *)(a1 + 376) >> HIBYTE(*(_DWORD *)(v75 + 4 * v77))) & 1) == 0 || v76 > v73)
        goto LABEL_116;
      v83 = *(_QWORD *)(v228 + v76);
      if ((_DWORD)v79 == 3)
      {
        v83 &= ~1uLL;
        v79 = (*(_QWORD *)(v228 + v76) & 1) != 0 ? 2 : 3;
      }
      else if ((_DWORD)v79 == 5)
      {
        v84 = v226;
        v85 = v215;
        if (v215)
        {
          if (objc_msgSend(v84, "usesSwiftRefcounting")
            && v76 == objc_msgSend(v84, "pointerSize"))
          {
            v86 = v85;
            v222 = objc_msgSend(v86, "refcountIsSideTableMarkerMask") & v83;
            if (v222 == objc_msgSend(v86, "refcountIsSideTableMarkerValue"))
            {
              v87 = objc_msgSend(v86, "sideTablePointerMask") & v83;
              v88 = v87 >> objc_msgSend(v86, "sideTablePointerRightShift");
              v83 = v88 << objc_msgSend(v86, "sideTablePointerLeftShift");
            }
            else
            {
              v83 = 0;
            }

          }
          else
          {
            v83 &= objc_msgSend(v85, "nativeWeakReferencePointerMask");
          }
        }

        v79 = 5;
      }
      if (v232 || (*(_DWORD *)(v75 + 4 * v77) & 0x80000000) != 0)
        v83 &= 0xFFFFFFFFFFFFF8uLL;
      v89 = *(uint64_t **)(a1 + 112);
      if (v89[6] > v83)
        goto LABEL_116;
      v223 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 16 * a4);
      v90 = -[VMUTask ptrauthStripDataPointer:](*(_QWORD *)(a1 + 8), v83);
      v91 = v89[6];
      v92 = v89[7];
      v146 = v92 >= v91;
      v93 = v92 - v91;
      if (!v146)
        goto LABEL_116;
      v94 = v90;
      if (v90 - v91 >= v93)
        goto LABEL_116;
      v95 = v90 >> *MEMORY[0x1E0C85AC8];
      if (v95)
      {
        v96 = (unsigned int *)v89[3];
        v97 = v90 >> *MEMORY[0x1E0C85AC8];
        do
        {
          if (*v96 <= (v97 & 0x3FFFFFF)
            || ((*((unsigned __int8 *)v96 + ((v97 & 0x3FFFFFF) >> 3) + 4) >> (v97 & 7)) & 1) == 0)
          {
            goto LABEL_116;
          }
          v97 >>= 26;
        }
        while (v97);
      }
      v98 = (uint64_t)v89 + 4 * (v95 & 0x7FFFF);
      v101 = *(_DWORD *)(v98 + 64);
      v100 = (_DWORD *)(v98 + 64);
      v99 = v101;
      if (v101)
      {
        v102 = v89[4] + ((unint64_t)(v99 - 1) << 6);
        if (v90 - *(_QWORD *)(*(_QWORD *)v102 + 8) < *(_QWORD *)(*(_QWORD *)v102 + 16))
          goto LABEL_128;
      }
      v118 = *((unsigned int *)v89 + 10);
      if (!(_DWORD)v118)
        goto LABEL_116;
      v119 = v89[4];
      while (1)
      {
        v120 = v118 >> 1;
        v102 = v119 + (v118 >> 1 << 6);
        if (*(_QWORD *)(*(_QWORD *)v102 + 8) <= v90)
        {
          if (*(_QWORD *)(*(_QWORD *)v102 + 16) + *(_QWORD *)(*(_QWORD *)v102 + 8) > v90)
          {
            v220 = v89[4];
            v121 = objc_msgSend(*(id *)v102, "isSpecialPhysFootprintRegion");
            v122 = v220;
            if (v121)
              v123 = 0;
            else
              v123 = v102;
            if ((v121 & 1) != 0)
              goto LABEL_116;
            if ((*(_BYTE *)(*(_QWORD *)v123 + 132) & 1) == 0)
              goto LABEL_179;
            v124 = (id *)(v123 + 64);
            v125 = *((unsigned int *)v89 + 10) - ((uint64_t)(v123 + 64 - v89[4]) >> 6);
            if (!v125)
              goto LABEL_176;
            while (1)
            {
              v126 = v125 >> 1;
              v127 = &v124[8 * (v125 >> 1)];
              if (*((_QWORD *)*v127 + 1) <= v94)
              {
                if (*((_QWORD *)*v127 + 2) + *((_QWORD *)*v127 + 1) > v94)
                {
                  v213 = v123;
                  v132 = objc_msgSend(*v127, "isSpecialPhysFootprintRegion");
                  v123 = v213;
                  v122 = v220;
                  if (v132)
                    v125 = 0;
                  else
                    v125 = (unint64_t)v127;
LABEL_176:
                  if (v125)
                    v123 = v125;
                  v102 = v123;
LABEL_179:
                  *v100 = ((v123 - v122) >> 6) + 1;
LABEL_128:
                  v103 = *(_DWORD *)(v102 + 20);
                  if (v103)
                  {
                    v104 = *(_QWORD *)(v102 + 8);
                    v105 = *v89;
                    v106 = *(unsigned int *)(v102 + 16);
                    v107 = (unint64_t *)(*v89 + 16 * v106);
                    if (v104)
                    {
                      if (*v107 > v94)
                        goto LABEL_116;
                      v108 = (_QWORD *)(v105 + 16 * (v103 + v106 - 1));
                      if (((v108[1] >> 5) & 0xFFFFFFFFFuLL) + *v108 <= v94)
                        goto LABEL_116;
                      v109 = (unsigned int *)(v104
                                            + 4 * ((v94 - (*v107 & -*MEMORY[0x1E0C85AD8])) >> *MEMORY[0x1E0C85AC8]));
                      v110 = *v109;
                      v111 = (unint64_t *)(v105 + 16 * v110);
                      if (*v111 > v94)
                        goto LABEL_116;
                      v112 = v109[1];
                      if (v112 < *((_DWORD *)v89 + 2)
                        && (v113 = (unint64_t *)(v105 + 16 * v112), v114 = *v113, *v113 <= v94))
                      {
LABEL_164:
                        v128 = v113[1];
                        if ((v128 & 7) - 2 >= 3)
                        {
                          v129 = ((unint64_t)v113 - v105) >> 4;
                          v130 = v89[2];
                          if (v94 - v114 >= v130)
                          {
                            if (((v128 >> 5) & 0xFFFFFFFFFLL) - (v94 - v114) > v130 || (_DWORD)v129 == -1)
                              goto LABEL_116;
                          }
                          else if ((_DWORD)v129 == -1)
                          {
                            goto LABEL_116;
                          }
                          (*(void (**)(uint64_t, _QWORD, unint64_t, uint64_t))(a9 + 16))(a9, a4, v76 + a3 + v223, v79);
                        }
                      }
                      else
                      {
                        v115 = v112 - v110;
                        if (v115)
                        {
                          do
                          {
                            v116 = v115 >> 1;
                            v113 = &v111[2 * v116];
                            v114 = *v113;
                            if (*v113 <= v94)
                            {
                              if (((v111[2 * v116 + 1] >> 5) & 0xFFFFFFFFFLL) + v114 > v94)
                                goto LABEL_164;
                              v111 = v113 + 2;
                              LODWORD(v116) = --v115 >> 1;
                            }
                            v146 = v115 >= 2;
                            v115 = v116;
                          }
                          while (v146);
                        }
                      }
                    }
                    else
                    {
                      do
                      {
                        v117 = v103 >> 1;
                        v113 = &v107[2 * v117];
                        v114 = *v113;
                        if (*v113 <= v94)
                        {
                          if (((v107[2 * v117 + 1] >> 5) & 0xFFFFFFFFFLL) + v114 > v94)
                            goto LABEL_164;
                          v107 = v113 + 2;
                          LODWORD(v117) = --v103 >> 1;
                        }
                        v146 = v103 >= 2;
                        v103 = v117;
                      }
                      while (v146);
                    }
                  }
LABEL_116:
                  v77 = v82;
                  if (v76 > v73)
                    goto LABEL_192;
                  goto LABEL_88;
                }
                v124 = v127 + 8;
                v126 = --v125 >> 1;
              }
              v145 = v125 > 1;
              v125 = v126;
              if (!v145)
              {
                v125 = 0;
                goto LABEL_176;
              }
            }
          }
          v119 = v102 + 64;
          v120 = --v118 >> 1;
        }
        v146 = v118 >= 2;
        v118 = v120;
        if (!v146)
          goto LABEL_116;
      }
    }
LABEL_13:
    if (a7 && *(_BYTE *)(a1 + 360))
    {
      v20 = (((_DWORD)a3 + 7) & 0xFFFFFFF8) - a3;
      v21 = (v20 + 8);
      if (v21 > a5)
        goto LABEL_193;
      v227 = a2 + a3;
      while (1)
      {
        v22 = v20;
        v20 = v21;
        v231 = 0;
        objc_msgSend(a7, "getLeafFieldAtOffset:leafOffset:", v22, &v231);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v231 + 8;
        if (v24 > objc_msgSend(v23, "size"))
          goto LABEL_19;
        v25 = *(_QWORD *)(v227 + v22);
        v26 = *(_QWORD *)(a1 + 8);
        v221 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 16 * a4);
        v225 = objc_msgSend(v23, "scanType");
        v27 = *(uint64_t **)(a1 + 112);
        if (v27[6] > v25)
          goto LABEL_19;
        v28 = -[VMUTask ptrauthStripDataPointer:](v26, v25);
        v29 = v27[6];
        v30 = v27[7];
        v146 = v30 >= v29;
        v31 = v30 - v29;
        if (!v146)
          goto LABEL_19;
        v32 = v28;
        if (v28 - v29 >= v31)
          goto LABEL_19;
        v33 = v28 >> *MEMORY[0x1E0C85AC8];
        if (v33)
        {
          v34 = (unsigned int *)v27[3];
          v35 = v28 >> *MEMORY[0x1E0C85AC8];
          do
          {
            if (*v34 <= (v35 & 0x3FFFFFF)
              || ((*((unsigned __int8 *)v34 + ((v35 & 0x3FFFFFF) >> 3) + 4) >> (v35 & 7)) & 1) == 0)
            {
              goto LABEL_19;
            }
            v35 >>= 26;
          }
          while (v35);
        }
        v36 = (uint64_t)v27 + 4 * (v33 & 0x7FFFF);
        v39 = *(_DWORD *)(v36 + 64);
        v38 = (_DWORD *)(v36 + 64);
        v37 = v39;
        if (v39)
        {
          v40 = v27[4] + ((unint64_t)(v37 - 1) << 6);
          if (v28 - *(_QWORD *)(*(_QWORD *)v40 + 8) < *(_QWORD *)(*(_QWORD *)v40 + 16))
            goto LABEL_31;
        }
        v56 = *((unsigned int *)v27 + 10);
        if (!(_DWORD)v56)
          goto LABEL_19;
        v57 = v27[4];
        while (1)
        {
          v58 = v56 >> 1;
          v40 = v57 + (v56 >> 1 << 6);
          if (*(_QWORD *)(*(_QWORD *)v40 + 8) <= v28)
            break;
LABEL_54:
          v146 = v56 >= 2;
          v56 = v58;
          if (!v146)
            goto LABEL_19;
        }
        if (*(_QWORD *)(*(_QWORD *)v40 + 16) + *(_QWORD *)(*(_QWORD *)v40 + 8) <= v28)
          break;
        v219 = v27[4];
        v59 = objc_msgSend(*(id *)v40, "isSpecialPhysFootprintRegion");
        v60 = v219;
        if (v59)
          v61 = 0;
        else
          v61 = v40;
        if ((v59 & 1) != 0)
          goto LABEL_19;
        if ((*(_BYTE *)(*(_QWORD *)v61 + 132) & 1) == 0)
          goto LABEL_82;
        v62 = (id *)(v61 + 64);
        v63 = *((unsigned int *)v27 + 10) - ((uint64_t)(v61 + 64 - v27[4]) >> 6);
        if (!v63)
          goto LABEL_79;
        while (2)
        {
          v64 = v63 >> 1;
          v65 = &v62[8 * (v63 >> 1)];
          if (*((_QWORD *)*v65 + 1) > v32)
          {
LABEL_65:
            v145 = v63 > 1;
            v63 = v64;
            if (!v145)
            {
              v63 = 0;
              goto LABEL_79;
            }
            continue;
          }
          break;
        }
        if (*((_QWORD *)*v65 + 2) + *((_QWORD *)*v65 + 1) <= v32)
        {
          v62 = v65 + 8;
          v64 = --v63 >> 1;
          goto LABEL_65;
        }
        v212 = v61;
        v70 = objc_msgSend(*v65, "isSpecialPhysFootprintRegion");
        v61 = v212;
        v60 = v219;
        if (v70)
          v63 = 0;
        else
          v63 = (unint64_t)v65;
LABEL_79:
        if (v63)
          v61 = v63;
        v40 = v61;
LABEL_82:
        *v38 = ((v61 - v60) >> 6) + 1;
LABEL_31:
        v41 = *(_DWORD *)(v40 + 20);
        if (v41)
        {
          v42 = *(_QWORD *)(v40 + 8);
          v43 = *v27;
          v44 = *(unsigned int *)(v40 + 16);
          v45 = (unint64_t *)(*v27 + 16 * v44);
          if (v42)
          {
            if (*v45 > v32)
              goto LABEL_19;
            v46 = (_QWORD *)(v43 + 16 * (v41 + v44 - 1));
            if (((v46[1] >> 5) & 0xFFFFFFFFFuLL) + *v46 <= v32)
              goto LABEL_19;
            v47 = (unsigned int *)(v42 + 4 * ((v32 - (*v45 & -*MEMORY[0x1E0C85AD8])) >> *MEMORY[0x1E0C85AC8]));
            v48 = *v47;
            v49 = (unint64_t *)(v43 + 16 * v48);
            if (*v49 > v32)
              goto LABEL_19;
            v50 = v47[1];
            if (v50 < *((_DWORD *)v27 + 2))
            {
              v51 = (unint64_t *)(v43 + 16 * v50);
              v52 = *v51;
              if (*v51 <= v32)
              {
LABEL_67:
                v66 = v51[1];
                if ((v66 & 7) - 2 < 3)
                  goto LABEL_19;
                v67 = ((unint64_t)v51 - v43) >> 4;
                v68 = v27[2];
                if (v32 - v52 >= v68)
                {
                  if (((v66 >> 5) & 0xFFFFFFFFFLL) - (v32 - v52) > v68 || (_DWORD)v67 == -1)
                    goto LABEL_19;
                }
                else if ((_DWORD)v67 == -1)
                {
                  goto LABEL_19;
                }
                (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(a9 + 16))(a9, a4, a3 + v22 + v221, v225);
                goto LABEL_19;
              }
            }
            v53 = v50 - v48;
            if (v53)
            {
              do
              {
                v54 = v53 >> 1;
                v51 = &v49[2 * v54];
                v52 = *v51;
                if (*v51 <= v32)
                {
                  if (((v49[2 * v54 + 1] >> 5) & 0xFFFFFFFFFLL) + v52 > v32)
                    goto LABEL_67;
                  v49 = v51 + 2;
                  LODWORD(v54) = --v53 >> 1;
                }
                v146 = v53 >= 2;
                v53 = v54;
              }
              while (v146);
            }
          }
          else
          {
            do
            {
              v55 = v41 >> 1;
              v51 = &v45[2 * v55];
              v52 = *v51;
              if (*v51 <= v32)
              {
                if (((v45[2 * v55 + 1] >> 5) & 0xFFFFFFFFFLL) + v52 > v32)
                  goto LABEL_67;
                v45 = v51 + 2;
                LODWORD(v55) = --v41 >> 1;
              }
              v146 = v41 >= 2;
              v41 = v55;
            }
            while (v146);
          }
        }
LABEL_19:

        v21 = (v20 + 8);
        if (v21 > a5)
        {
LABEL_193:

          return;
        }
      }
      v57 = v40 + 64;
      v58 = --v56 >> 1;
      goto LABEL_54;
    }
    if ((*(_BYTE *)(a1 + 376) & 2) == 0)
      goto LABEL_193;
    v71 = (unint64_t *)(a2 + a3);
    if (a6)
      v72 = *(void **)(*(_QWORD *)(a1 + 256) + 8 * a6);
    else
      v72 = 0;
    v226 = v72;
    if ((*(_DWORD *)(*(_QWORD *)(a1 + 80) + 16 * a4 + 8) & 7u) - 2 < 3
      || (v133 = *(_DWORD *)(a1 + 356)) != 0 && v133 == a4)
    {
      v134 = 0;
      v135 = 1;
    }
    else
    {
      v230 = 0;
      v134 = -[VMUTaskMemoryScanner getCachedScanInfoForClassWithIsa:classInfo:returnedShouldApplySwiftPointerMaskingToIsa:](a1, a6, v226, &v230);
      v135 = v230 != 0;
    }
    v208 = v135;
    v136 = (unint64_t)v71 + a5 - 8;
    if (*(_DWORD *)(a1 + 300))
    {
      v224 = *(_QWORD *)(objc_msgSend(*(id *)(a1 + 64), "autoreleasePoolPageLayout") + 16);
      v217 = *(unsigned int *)(objc_msgSend(*(id *)(a1 + 64), "autoreleasePoolPageLayout") + 8);
    }
    else
    {
      v224 = 0;
      v217 = 0;
    }
    if ((unint64_t)v71 > v136)
      goto LABEL_192;
    v209 = v18;
    v137 = 0;
    v229 = a8;
    v214 = a2;
    v210 = (uint64_t)v71 + a5 - 8;
LABEL_196:
    v138 = (char *)v71 - a2;
    v139 = (char *)v71 + *(_QWORD *)(*(_QWORD *)(a1 + 80) + 16 * a4) - a2;
    v140 = *v71;
    if (!*v71)
    {
      if (*(_DWORD *)(a1 + 300))
        v146 = (unint64_t)v138 >= v217;
      else
        v146 = 0;
      if (v146)
        (*(void (**)(uint64_t, _QWORD, char *, uint64_t))(a9 + 16))(a9, a4, v139, 1);
      goto LABEL_245;
    }
    if (v218)
    {
      v141 = v208;
      if (v134)
        v142 = v208;
      else
        v142 = 1;
      if ((v142 & 1) == 0)
      {
        do
        {
          v143 = *(_DWORD *)(v134 + 4 * v137);
          v144 = *(_QWORD *)&v143 & 0xFFFFFFLL;
          ++v137;
          v145 = (v143 & 0xFFFFFF) != 0xFFFFFF && (unint64_t)v138 > v144;
        }
        while (v145);
        --v137;
        if ((_DWORD)v144 == 0xFFFFFF)
        {
          v134 = 0;
          v141 = 0;
        }
        else
        {
          v141 = v138 == (char *)v144 && v143 < 0;
        }
      }
      if (v226
        && v138 == (char *)8
        && objc_msgSend(v226, "infoType") == 8
        && objc_msgSend(v226, "usesSwiftRefcounting"))
      {
        v148 = v215;
        v149 = v148;
        if (v215
          && (v150 = objc_msgSend(v148, "refcountIsSideTableMarkerMask") & v140,
              v150 == objc_msgSend(v149, "refcountIsSideTableMarkerValue")))
        {
          v151 = objc_msgSend(v149, "sideTablePointerMask") & v140;
          v152 = v151 >> objc_msgSend(v149, "sideTablePointerRightShift");
          v140 = v152 << objc_msgSend(v149, "sideTablePointerLeftShift");
        }
        else
        {
          v140 = 0;
        }
        a2 = v214;

      }
      else
      {
        if (v141)
          v140 &= 0xFFFFFFFFFFFFF8uLL;
        a2 = v214;
      }
    }
    v153 = 1;
    if (v224 && (unint64_t)v138 >= v217)
    {
      v154 = v140 & v224;
      if (v140 == (v140 & v224))
      {
        v153 = 2;
      }
      else
      {
        if (objc_msgSend(*(id *)(a1 + 64), "countFromPointerInAutoreleasePool:", v140) + 1 >= 2)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          v156 = *(void **)(a1 + 520);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v139);
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "setObject:forKeyedSubscript:", v155, v157);

        }
        v153 = 2;
        v140 = v154;
      }
      a2 = v214;
    }
    v158 = *(NSMapTable **)(a1 + 320);
    if (v158 && (v209 || (*(_QWORD *)(*(_QWORD *)(a1 + 80) + 16 * a4 + 8) & 7) == 2))
    {
      v159 = NSMapGet(v158, v139);
      if (v159)
        v140 = (unint64_t)v159;
    }
    v160 = *(uint64_t **)(a1 + 112);
    if (v160[6] > v140)
      goto LABEL_244;
    v161 = -[VMUTask ptrauthStripDataPointer:](*(_QWORD *)(a1 + 8), v140);
    v162 = v160[6];
    v163 = v160[7];
    v146 = v163 >= v162;
    v164 = v163 - v162;
    if (!v146)
      goto LABEL_244;
    v165 = v161;
    if (v161 - v162 >= v164)
      goto LABEL_244;
    v166 = v161 >> *MEMORY[0x1E0C85AC8];
    if (v166)
    {
      v167 = (unsigned int *)v160[3];
      v168 = v161 >> *MEMORY[0x1E0C85AC8];
      do
      {
        if (*v167 <= (v168 & 0x3FFFFFF)
          || ((*((unsigned __int8 *)v167 + ((v168 & 0x3FFFFFF) >> 3) + 4) >> (v168 & 7)) & 1) == 0)
        {
          goto LABEL_244;
        }
        v168 >>= 26;
      }
      while (v168);
    }
    v169 = (uint64_t)v160 + 4 * (v166 & 0x7FFFF);
    v172 = *(_DWORD *)(v169 + 64);
    v171 = (_DWORD *)(v169 + 64);
    v170 = v172;
    if (v172)
    {
      v173 = v160[4] + ((unint64_t)(v170 - 1) << 6);
      if (v161 - *(_QWORD *)(*(_QWORD *)v173 + 8) < *(_QWORD *)(*(_QWORD *)v173 + 16))
        goto LABEL_257;
    }
    v188 = *((unsigned int *)v160 + 10);
    if (!(_DWORD)v188)
    {
LABEL_283:
      a2 = v214;
      goto LABEL_244;
    }
    v189 = v160[4];
    while (1)
    {
      v190 = v188 >> 1;
      v173 = v189 + (v188 >> 1 << 6);
      if (*(_QWORD *)(*(_QWORD *)v173 + 8) <= v161)
      {
        if (*(_QWORD *)(*(_QWORD *)v173 + 16) + *(_QWORD *)(*(_QWORD *)v173 + 8) > v161)
        {
          v206 = v160[4];
          v207 = v171;
          v191 = objc_msgSend(*(id *)v173, "isSpecialPhysFootprintRegion");
          if (v191)
            v192 = 0;
          else
            v192 = v173;
          if ((v191 & 1) != 0)
            goto LABEL_283;
          v195 = v206;
          v194 = v207;
          if ((*(_BYTE *)(*(_QWORD *)v192 + 132) & 1) == 0)
            goto LABEL_312;
          v196 = (id *)(v192 + 64);
          v197 = *((unsigned int *)v160 + 10) - ((uint64_t)(v192 + 64 - v160[4]) >> 6);
          if (!v197)
            goto LABEL_309;
          while (2)
          {
            v198 = v197 >> 1;
            v199 = &v196[8 * (v197 >> 1)];
            if (*((_QWORD *)*v199 + 1) > v165)
            {
LABEL_295:
              v145 = v197 > 1;
              v197 = v198;
              if (!v145)
              {
                v197 = 0;
                goto LABEL_309;
              }
              continue;
            }
            break;
          }
          if (*((_QWORD *)*v199 + 2) + *((_QWORD *)*v199 + 1) <= v165)
          {
            v196 = v199 + 8;
            v198 = --v197 >> 1;
            goto LABEL_295;
          }
          v205 = v192;
          v204 = objc_msgSend(*v199, "isSpecialPhysFootprintRegion");
          v192 = v205;
          v195 = v206;
          v194 = v207;
          if (v204)
            v197 = 0;
          else
            v197 = (unint64_t)v199;
LABEL_309:
          if (v197)
            v192 = v197;
          v173 = v192;
LABEL_312:
          *v194 = ((v192 - v195) >> 6) + 1;
LABEL_257:
          v174 = *(_DWORD *)(v173 + 20);
          if (!v174)
            goto LABEL_283;
          v175 = *(_QWORD *)(v173 + 8);
          v176 = *v160;
          v177 = *(unsigned int *)(v173 + 16);
          v178 = (unint64_t *)(*v160 + 16 * v177);
          if (v175)
          {
            a2 = v214;
            if (*v178 > v165)
              goto LABEL_244;
            v179 = (_QWORD *)(v176 + 16 * (v174 + v177 - 1));
            if (((v179[1] >> 5) & 0xFFFFFFFFFuLL) + *v179 <= v165)
              goto LABEL_244;
            v180 = (unsigned int *)(v175 + 4 * ((v165 - (*v178 & -*MEMORY[0x1E0C85AD8])) >> *MEMORY[0x1E0C85AC8]));
            v181 = *v180;
            v182 = (unint64_t *)(v176 + 16 * v181);
            if (*v182 > v165)
              goto LABEL_244;
            v183 = v180[1];
            if (v183 < *((_DWORD *)v160 + 2))
            {
              v184 = (unint64_t *)(v176 + 16 * v183);
              v185 = *v184;
              if (*v184 <= v165)
              {
LABEL_297:
                v200 = v184[1];
                if ((v200 & 7) - 2 < 3)
                  goto LABEL_244;
                v201 = ((unint64_t)v184 - v176) >> 4;
                v202 = v160[2];
                if (v165 - v185 >= v202)
                {
                  if (((v200 >> 5) & 0xFFFFFFFFFLL) - (v165 - v185) > v202 || (_DWORD)v201 == -1)
                    goto LABEL_244;
                }
                else if ((_DWORD)v201 == -1)
                {
                  goto LABEL_244;
                }
                (*(void (**)(uint64_t, _QWORD, char *, uint64_t))(a9 + 16))(a9, a4, v139, v153);
                goto LABEL_244;
              }
            }
            v186 = v183 - v181;
            if (v186)
            {
              do
              {
                v187 = v186 >> 1;
                v184 = &v182[2 * v187];
                v185 = *v184;
                if (*v184 <= v165)
                {
                  if (((v182[2 * v187 + 1] >> 5) & 0xFFFFFFFFFLL) + v185 > v165)
                    goto LABEL_297;
                  v182 = v184 + 2;
                  LODWORD(v187) = --v186 >> 1;
                }
                v146 = v186 >= 2;
                v186 = v187;
              }
              while (v146);
            }
          }
          else
          {
            a2 = v214;
            do
            {
              v193 = v174 >> 1;
              v184 = &v178[2 * v193];
              v185 = *v184;
              if (*v184 <= v165)
              {
                if (((v178[2 * v193 + 1] >> 5) & 0xFFFFFFFFFLL) + v185 > v165)
                  goto LABEL_297;
                v178 = v184 + 2;
                LODWORD(v193) = --v174 >> 1;
              }
              v146 = v174 >= 2;
              v174 = v193;
            }
            while (v146);
          }
LABEL_244:
          v136 = v210;
LABEL_245:
          v71 = (unint64_t *)((char *)v71 + v229);
          if ((unint64_t)v71 > v136)
          {
LABEL_192:

            goto LABEL_193;
          }
          goto LABEL_196;
        }
        v189 = v173 + 64;
        v190 = --v188 >> 1;
      }
      v146 = v188 >= 2;
      v188 = v190;
      if (!v146)
        goto LABEL_283;
    }
  }
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
    v6[2] = __47__VMUTaskMemoryScanner__withOrderedNodeMapper___block_invoke;
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

void __47__VMUTaskMemoryScanner__withOrderedNodeMapper___block_invoke(uint64_t *a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v5;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unsigned int v23;
  unsigned int v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD *v39;
  void *v40;
  _QWORD *v41;
  _QWORD *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  int v50;
  id v51;
  int v52;
  int v53;
  _BOOL4 v54;
  uint64_t v55;
  id v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  int v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  void *v68;
  _QWORD *v69;
  uint64_t v70;
  void *v71;
  char v72;
  int v73;
  int v74;
  _BOOL4 v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  const char *v82;
  _QWORD *v83;
  void (**v84)(void);
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t *v90;
  unint64_t *v91;
  uint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  _QWORD *v104;
  id v105;
  id v106;
  NSObject *v107;
  void (**v108)(_QWORD);
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  int v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  const char *v124;
  uint64_t v125;
  _QWORD *v126;
  uint64_t v127;
  const char *v128;
  FILE *v129;
  uint64_t v130;
  id v131;
  id v132;
  FILE *v133;
  id v134;
  unint64_t *v135;
  uint64_t v136;
  unint64_t *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t (*v141)(uint64_t);
  void *v142;
  id v143;
  id v144;
  _QWORD *v145;
  _QWORD *v146;
  _QWORD v147[2];

  if (!a4)
    return;
  v5 = a1[4];
  if (*(_DWORD *)(v5 + 88) <= a2)
    return;
  v8 = (unint64_t *)(*(_QWORD *)(v5 + 80) + 16 * a2);
  v9 = *v8;
  v11 = v8 + 1;
  v10 = v8[1];
  if (a3 || (v34 = *(unsigned int *)(*(_QWORD *)(a1[6] + 8) + 24), (_DWORD)v34 == -1))
  {
    v12 = v8[1];
  }
  else
  {
    v12 = v8[1];
    if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) <= v9)
    {
      v136 = *(_QWORD *)(v5 + 80) + 16 * a2;
      v35 = *(_QWORD **)(v5 + 96);
      v36 = *(void **)(v5 + 56);
      v37 = *(id *)(v5 + 64);
      v38 = v36;
      v39 = v35;
      v40 = v38;
      v41 = &v35[8 * v34];
      if (v41[6])
      {
        if ((_QWORD *)v41[7] == v41)
        {
          v139 = MEMORY[0x1E0C809B0];
          v140 = 3221225472;
          v83 = v39;
          v141 = ___unmapRegion_block_invoke;
          v142 = &unk_1E4E01050;
          v143 = v38;
          v145 = v41;
          v144 = v37;
          v146 = v83;
          v84 = (void (**)(void))MEMORY[0x1A85A995C](&v139);
          v84[2]();

        }
        else
        {
          v42 = &v39[8 * v34];
          v42[5] = 0;
          v42[6] = 0;
          v42[7] = 0;
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = -1;
      v12 = *v11;
      v8 = (unint64_t *)v136;
    }
  }
  v13 = v12 & 7;
  if (v13 == 4)
  {
    v14 = objc_msgSend(*(id *)(a1[4] + 224), "threadStateForThreadNum:", v12 >> 41);
    if (v14)
      (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, v14);
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = -1;
    return;
  }
  if ((v12 & 0x1FFFFFFFFE0) == 0)
    return;
  if (v13 == 1)
  {
    for (;
          *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) <= *v8;
          *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 96)
                                                                             + ((unint64_t)*(unsigned int *)(*(_QWORD *)(a1[8] + 8) + 24) << 6))
                                                                 + 16)
                                                     + *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24))
    {
      *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 96)
                                                                         + ((unint64_t)++*(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24) << 6))
                                                             + 8);
    }
    v15 = a1[4];
    v16 = *(_QWORD *)(v15 + 96);
    v17 = *(unsigned int *)(*(_QWORD *)(a1[8] + 8) + 24);
    v18 = (id *)(v16 + (v17 << 6));
    if ((*((_DWORD *)*v18 + 13) & 3) != 2)
    {
      v19 = ((v10 >> 5) & 0xFFFFFFFFFLL) + v9;
      v20 = *(_QWORD *)(a1[7] + 8);
      v22 = *(_QWORD *)(v20 + 24);
      v21 = (_QWORD *)(v20 + 24);
      v135 = v8;
      if (v22 < v19)
      {
        v23 = v17 + 1;
        do
        {
          v24 = v23;
          v25 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 96) + ((unint64_t)v23 << 6)) + 8);
          *v21 = v25[1] + *v25;
          ++v23;
          v26 = *(_QWORD *)(a1[7] + 8);
          v27 = *(_QWORD *)(v26 + 24);
          v21 = (_QWORD *)(v26 + 24);
        }
        while (v27 < v19);
        v28 = *(unsigned int *)(*(_QWORD *)(a1[8] + 8) + 24);
        v29 = v23 - v28;
        v30 = a1[4];
        v121 = v28;
        v126 = (_QWORD *)(*(_QWORD *)(v30 + 96) + (v28 << 6));
        v31 = *(void **)(v30 + 56);
        v32 = *(void **)(v30 + 64);
        v119 = *(_QWORD *)(v30 + 96);
        if (a3 == 1)
          v33 = (void *)a1[5];
        else
          v33 = 0;
        v85 = v24;
        v86 = *(id *)(v30 + 8);
        v123 = v32;
        v131 = v31;
        v134 = v33;
        v120 = v29;
        if (v29)
        {
          v87 = 0;
          v88 = v23 - v121;
          v89 = v126;
          v90 = v126;
          v91 = v135;
          do
          {
            v92 = *v90;
            v90 += 8;
            v87 += *(_QWORD *)(v92 + 16);
            --v88;
          }
          while (v88);
        }
        else
        {
          v87 = 0;
          v91 = v135;
          v89 = v126;
        }
        LODWORD(v125) = v23 - 1;
        v147[0] = 0;
        v138 = 0;
        v93 = (_QWORD *)objc_msgSend(v131, "findMappedAddress:size:", *(_QWORD *)(*v89 + 8), v87);
        if (v93)
        {
          v94 = v93[1];
          v95 = *(_QWORD *)(*v89 + 8) - *v93;
          v147[0] = v93[2] + v95;
          v138 = v94 - v95;
        }
        else
        {
          v117 = v86;
          v118 = v85;
          v102 = v123;
          if (v120)
          {
            v103 = v23 - v121;
            v104 = v126;
            do
            {
              v105 = v102;
              v106 = v131;
              v107 = v134;
              if (v104[6])
              {
                if (v104 == (_QWORD *)v104[7])
                {
                  v139 = MEMORY[0x1E0C809B0];
                  v140 = 3221225472;
                  v141 = ___unmapRegion_block_invoke;
                  v142 = &unk_1E4E01050;
                  v143 = v106;
                  v145 = v104;
                  v144 = v105;
                  v146 = v126;
                  v108 = (void (**)(_QWORD))MEMORY[0x1A85A995C](&v139);
                  v109 = v108;
                  if (v134)
                    dispatch_async(v107, v108);
                  else
                    v108[2](v108);

                  v102 = v123;
                }
                else
                {
                  v104[5] = 0;
                  v104[6] = 0;
                  v104[7] = 0;
                }
              }

              v104 += 8;
              --v103;
            }
            while (v103);
          }
          v89 = v126;
          v91 = v135;
          v86 = v117;
          v85 = v118;
          if (objc_msgSend(v131, "mapAddress:size:returnedAddress:returnedSize:", *(_QWORD *)(*v126 + 8), v87, v147, &v138))
          {
            if (task_exists(v117))
              fprintf((FILE *)*MEMORY[0x1E0C80C10], "Failed to map remote region at [%#llx-%#llx]\n", *(_QWORD *)(*v126 + 8), *(_QWORD *)(*v126 + 8) + v87);
            goto LABEL_65;
          }
        }
        if (v120)
        {
          v96 = v138;
          v97 = v147[0];
          v98 = (_QWORD *)(v119 + (v121 << 6) + 56);
          v99 = v23 - v121;
          do
          {
            *(v98 - 1) = v97;
            *v98 = v89;
            *(v98 - 2) = v96;
            v100 = *(v98 - 7) + 8;
            v97 += *(_QWORD *)(*(v98 - 7) + 16);
            v147[0] = v97;
            v96 -= *(_QWORD *)(v100 + 8);
            v138 = v96;
            v98 += 8;
            --v99;
          }
          while (v99);
        }
LABEL_65:

        v101 = *(_QWORD *)(a1[4] + 96);
        v61 = *(_QWORD *)(*(_QWORD *)(v101 + (v85 << 6)) + 8);
LABEL_87:
        v115 = *(_QWORD *)(a1[8] + 8);
        v116 = *(_QWORD *)(v101 + ((unint64_t)*(unsigned int *)(v115 + 24) << 6) + 48);
        if (v116)
        {
          (*(void (**)(uint64_t, unint64_t))(a4 + 16))(a4, v116 + *v91 - *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24));
          v115 = *(_QWORD *)(a1[8] + 8);
        }
        *(_DWORD *)(v115 + 24) = v125;
        *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = v61;
        return;
      }
      v61 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
      v62 = *(void **)(v15 + 56);
      v63 = *(_DWORD *)(v15 + 104);
      v64 = *(unsigned int *)(*(_QWORD *)(a1[8] + 8) + 24);
      v65 = *(id *)(v15 + 8);
      v66 = v62;
      v125 = v64;
      v67 = v16 + (v64 << 6);
      v68 = v65;
      v70 = *(_QWORD *)(v67 + 48);
      v69 = (_QWORD *)(v67 + 48);
      if (!v70)
      {
        v71 = v66;
        v72 = objc_msgSend(*v18, "isSpecialPhysFootprintRegion");
        v66 = v71;
        if ((v72 & 1) == 0)
        {
          v139 = 0;
          v147[0] = 0;
          v73 = objc_msgSend(v71, "mapAddress:size:returnedAddress:returnedSize:", *((_QWORD *)*v18 + 1), *((_QWORD *)*v18 + 2), &v139, v147);
          if (v73)
          {
            v66 = v71;
            if ((*((_DWORD *)*v18 + 13) & 3u) - 1 < 2)
              goto LABEL_86;
            v74 = v73;
            v75 = task_exists(v68);
            v66 = v71;
            if ((_DWORD)v125 == v63 - 1 || !v75)
              goto LABEL_86;
            v133 = (FILE *)*MEMORY[0x1E0C80C10];
            v130 = objc_msgSend(*v18, "address");
            v76 = *((unsigned int *)*v18 + 6);
            v128 = vm_prot_strings[v76];
            v77 = *((_QWORD *)*v18 + 2) + *((_QWORD *)*v18 + 1);
            VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(*((unsigned __int8 *)*v18 + 232), *((unsigned __int8 *)*v18 + 104), *((unsigned __int8 *)*v18 + 50), v76, *((unsigned __int8 *)*v18 + 49));
            v78 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v79 = (const char *)objc_msgSend(v78, "UTF8String");
            v80 = *((_QWORD *)*v18 + 2) >> *MEMORY[0x1E0C85AC8];
            if (v80 == 1)
              v81 = "page";
            else
              v81 = "pages";
            if (*(_QWORD *)(v16 + (v125 << 6) + 24) == *(_QWORD *)(v16 + (v125 << 6) + 32))
              v82 = "";
            else
              v82 = " [root]";
            fprintf(v133, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v130, v77, v128, v79, v80, v81, v82, v74);

          }
          else
          {
            v113 = v147[0];
            *v69 = v139;
            v114 = v16 + (v125 << 6);
            *(_QWORD *)(v114 + 40) = v113;
            *(_QWORD *)(v114 + 56) = v18;
          }
          v66 = v71;
        }
      }
LABEL_86:

      v101 = *(_QWORD *)(a1[4] + 96);
      v91 = v135;
      goto LABEL_87;
    }
  }
  else if (VMUGraphNodeType_IsVMRegion(v13))
  {
    *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = *v11 >> 41;
    v43 = objc_retain(*(id *)(*(_QWORD *)(a1[4] + 96)
                            + ((unint64_t)*(unsigned int *)(*(_QWORD *)(a1[8] + 8) + 24) << 6)));
    if (-[VMUTaskMemoryScanner _shouldScanVMregion:](a1[4], *(_QWORD *)(a1[4] + 96)+ ((unint64_t)*(unsigned int *)(*(_QWORD *)(a1[8] + 8) + 24) << 6)))
    {
      v137 = v8;
      *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = objc_msgSend(v43, "address");
      v44 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
      *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v43, "length") + v44;
      v45 = a1[4];
      v46 = *(_QWORD *)(v45 + 96);
      v47 = *(unsigned int *)(*(_QWORD *)(a1[8] + 8) + 24);
      v48 = v46 + (v47 << 6);
      v49 = *(void **)(v45 + 56);
      v50 = *(_DWORD *)(v45 + 104);
      v132 = *(id *)(v45 + 8);
      v51 = v49;
      if (!*(_QWORD *)(v48 + 48) && (objc_msgSend(*(id *)v48, "isSpecialPhysFootprintRegion") & 1) == 0)
      {
        v139 = 0;
        v147[0] = 0;
        v52 = objc_msgSend(v51, "mapAddress:size:returnedAddress:returnedSize:", *(_QWORD *)(*(_QWORD *)v48 + 8), *(_QWORD *)(*(_QWORD *)v48 + 16), &v139, v147);
        if (v52)
        {
          if ((*(_DWORD *)(*(_QWORD *)v48 + 52) & 3u) - 1 >= 2)
          {
            v53 = v52;
            v54 = task_exists(v132);
            if ((_DWORD)v47 != v50 - 1 && v54)
            {
              v129 = (FILE *)*MEMORY[0x1E0C80C10];
              v127 = objc_msgSend(*(id *)v48, "address");
              v55 = *(unsigned int *)(*(_QWORD *)v48 + 24);
              v124 = vm_prot_strings[v55];
              v122 = *(_QWORD *)(*(_QWORD *)v48 + 16) + *(_QWORD *)(*(_QWORD *)v48 + 8);
              VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(*(unsigned __int8 *)(*(_QWORD *)v48 + 232), *(unsigned __int8 *)(*(_QWORD *)v48 + 104), *(unsigned __int8 *)(*(_QWORD *)v48 + 50), v55, *(unsigned __int8 *)(*(_QWORD *)v48 + 49));
              v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v57 = (const char *)objc_msgSend(v56, "UTF8String");
              v58 = *(_QWORD *)(*(_QWORD *)v48 + 16) >> *MEMORY[0x1E0C85AC8];
              if (v58 == 1)
                v59 = "page";
              else
                v59 = "pages";
              if (*(_QWORD *)(v46 + (v47 << 6) + 24) == *(_QWORD *)(v46 + (v47 << 6) + 32))
                v60 = "";
              else
                v60 = " [root]";
              fprintf(v129, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v127, v122, v124, v57, v58, v59, v60, v53);

            }
          }
        }
        else
        {
          v110 = v147[0];
          *(_QWORD *)(v48 + 48) = v139;
          v111 = v46 + (v47 << 6);
          *(_QWORD *)(v111 + 40) = v110;
          *(_QWORD *)(v111 + 56) = v48;
        }
      }

      v112 = *(_QWORD *)(*(_QWORD *)(a1[4] + 96)
                       + ((unint64_t)*(unsigned int *)(*(_QWORD *)(a1[8] + 8) + 24) << 6)
                       + 48);
      if (v112)
      {
        (*(void (**)(uint64_t, unint64_t))(a4 + 16))(a4, v112 + *v137 - *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24));
        if (!a3)
          *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
      }
    }

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
    v13[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke;
    v13[3] = &unk_1E4E00E28;
    v13[4] = self;
    v14 = v4;
    v7 = MEMORY[0x1A85A995C](v13);

    v5 = (void *)v7;
  }
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_2;
  v10[3] = &unk_1E4E00F38;
  v10[4] = self;
  v11 = v5;
  v12 = 0;
  v8 = v5;
  -[VMUTaskMemoryScanner _withOrderedNodeMapper:](self, "_withOrderedNodeMapper:", v10);
  -[VMUTaskMemoryScanner unmapAllRegions](self, "unmapAllRegions");

}

uint64_t __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v6 = *(_QWORD **)(result + 32);
  if ((unint64_t)(a6 - *(_QWORD *)(v6[10] + 16 * a5)) <= v6[46])
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

void __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
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
  id *v23;
  uint64_t v24;
  mach_vm_address_t *v25;
  mach_vm_address_t v26;
  _QWORD *v27;
  mach_vm_address_t v28;
  mach_vm_address_t v29;
  mach_vm_address_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  mach_vm_address_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  _BOOL4 IsVMRegion;
  _BYTE *v47;
  void *v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  void (**v59)(_QWORD, _QWORD, _QWORD);
  void *v60;
  int v61;
  unint64_t v62;
  id *v63;
  unint64_t v64;
  int v65;
  int v66;
  _QWORD *v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t *v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unsigned int *v76;
  unint64_t v77;
  uint64_t v78;
  int v79;
  _DWORD *v80;
  int v81;
  uint64_t v82;
  unint64_t v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t *v88;
  _QWORD *v89;
  unsigned int *v90;
  uint64_t v91;
  unint64_t *v92;
  uint64_t v93;
  unint64_t *v94;
  unint64_t v95;
  unsigned int v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  int v102;
  unint64_t v103;
  id *v104;
  unint64_t v105;
  unint64_t v106;
  id *v107;
  BOOL v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  int v113;
  mach_vm_address_t v114;
  mach_vm_size_t v115;
  mach_vm_size_t v116;
  mach_vm_address_t v117;
  mach_vm_address_t v118;
  int v119;
  int v120;
  id *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  int v127;
  id *v128;
  unint64_t v129;
  unint64_t v130;
  id *v131;
  unint64_t v132;
  void (**v133)(_QWORD, _QWORD, _QWORD);
  _QWORD *v134;
  _QWORD v135[5];
  id v136;
  uint64_t v137;
  int v138;
  _QWORD v139[5];
  id v140;
  int v141;
  _QWORD v142[5];
  id v143;
  id v144;
  mach_vm_size_t *v145;
  mach_vm_address_t *v146;
  mach_vm_address_t v147;
  mach_vm_address_t v148;
  int v149;
  _QWORD v150[5];
  id v151;
  _QWORD v152[5];
  id v153;
  mach_vm_address_t v154;
  int v155;
  mach_vm_size_t kcd_size;
  mach_vm_size_t *p_kcd_size;
  uint64_t v158;
  unint64_t v159;
  mach_vm_address_t kcd_addr_begin[4];
  _QWORD v161[5];
  id v162;
  int v163;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 88))
  {
    v5 = 0;
    while (1)
    {
      v6 = *(_DWORD *)(*(_QWORD *)(v2 + 80) + 16 * v5 + 8);
      if (*(_QWORD *)(v2 + 480))
      {
        v7 = (void *)MEMORY[0x1A85A9758]();
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 480) + 16))();
        objc_autoreleasePoolPop(v7);
      }
      v8 = v6 & 7;
      if (v8 == 1)
      {
        v9 = *(_QWORD *)(a1 + 32);
        if (*(_DWORD *)(v9 + 308) != -1)
        {
          v10 = *(_QWORD *)(v9 + 112);
          v11 = *(_QWORD *)(v10 + 48);
          v12 = *(_QWORD *)(v10 + 56);
          v35 = v12 >= v11;
          v13 = v12 - v11;
          if (v35)
          {
            v14 = *(_QWORD *)(*(_QWORD *)(v9 + 80) + 16 * v5);
            if (v14 - v11 < v13)
            {
              v15 = v14 >> *MEMORY[0x1E0C85AC8];
              if (v15)
              {
                v16 = *(unsigned int **)(v10 + 24);
                v17 = v14 >> *MEMORY[0x1E0C85AC8];
                do
                {
                  if (*v16 <= (v17 & 0x3FFFFFF)
                    || ((*((unsigned __int8 *)v16 + ((v17 & 0x3FFFFFF) >> 3) + 4) >> (v17 & 7)) & 1) == 0)
                  {
                    goto LABEL_137;
                  }
                  v17 >>= 26;
                }
                while (v17);
              }
              v18 = v10 + 4 * (v15 & 0x7FFFF);
              v21 = *(_DWORD *)(v18 + 64);
              v20 = (_DWORD *)(v18 + 64);
              v19 = v21;
              v22 = *(_QWORD *)(v10 + 32);
              if (v21)
              {
                v23 = (id *)(v22 + ((unint64_t)(v19 - 1) << 6));
                if (v14 - *((_QWORD *)*v23 + 1) < *((_QWORD *)*v23 + 2))
                  goto LABEL_17;
              }
              v62 = *(unsigned int *)(v10 + 40);
              if ((_DWORD)v62)
              {
                v63 = *(id **)(v10 + 32);
                do
                {
                  v64 = v62 >> 1;
                  v23 = &v63[8 * (v62 >> 1)];
                  if (*((_QWORD *)*v23 + 1) <= v14)
                  {
                    if (*((_QWORD *)*v23 + 2) + *((_QWORD *)*v23 + 1) > v14)
                    {
                      v120 = objc_msgSend(*v23, "isSpecialPhysFootprintRegion");
                      if (v120)
                        v121 = 0;
                      else
                        v121 = v23;
                      if ((v120 & 1) != 0)
                        break;
                      if ((*((_BYTE *)*v121 + 132) & 1) == 0)
                        goto LABEL_159;
                      v128 = v121 + 8;
                      v129 = *(unsigned int *)(v10 + 40) - (((uint64_t)v121 - *(_QWORD *)(v10 + 32) + 64) >> 6);
                      if (!v129)
                        goto LABEL_156;
                      while (1)
                      {
                        v130 = v129 >> 1;
                        v131 = &v128[8 * (v129 >> 1)];
                        if (*((_QWORD *)*v131 + 1) <= v14)
                        {
                          if (*((_QWORD *)*v131 + 2) + *((_QWORD *)*v131 + 1) > v14)
                          {
                            if (objc_msgSend(*v131, "isSpecialPhysFootprintRegion"))
                              v129 = 0;
                            else
                              v129 = (unint64_t)v131;
LABEL_156:
                            if (v129)
                              v121 = (id *)v129;
                            v23 = v121;
LABEL_159:
                            *v20 = (((unint64_t)v121 - v22) >> 6) + 1;
LABEL_17:
                            if (*((_DWORD *)*v23 + 37) == *(_DWORD *)(*(_QWORD *)(a1 + 32) + 308))
                              (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
                            goto LABEL_137;
                          }
                          v128 = v131 + 8;
                          v130 = --v129 >> 1;
                        }
                        v108 = v129 > 1;
                        v129 = v130;
                        if (!v108)
                        {
                          v129 = 0;
                          goto LABEL_156;
                        }
                      }
                    }
                    v63 = v23 + 8;
                    v64 = --v62 >> 1;
                  }
                  v35 = v62 >= 2;
                  v62 = v64;
                }
                while (v35);
              }
            }
          }
        }
LABEL_137:
        v122 = *(unsigned int *)(a1 + 48);
        v161[0] = MEMORY[0x1E0C809B0];
        v161[1] = 3221225472;
        v161[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_3;
        v161[3] = &unk_1E4E00E98;
        v123 = *(void **)(a1 + 40);
        v161[4] = *(_QWORD *)(a1 + 32);
        v163 = v5;
        v162 = v123;
        (*(void (**)(uint64_t, unint64_t, uint64_t, _QWORD *))(a2 + 16))(a2, v5, v122, v161);
        v54 = v162;
        goto LABEL_138;
      }
      if (VMUGraphNodeType_IsVMRegion(v6 & 7))
        break;
      if (v8 == 3)
      {
        v55 = *(_QWORD *)(a1 + 32);
        v56 = *(void **)(a1 + 40);
        v57 = *(_QWORD *)(*(_QWORD *)(v55 + 80) + 16 * v5);
        v135[0] = MEMORY[0x1E0C809B0];
        v135[1] = 3221225472;
        v135[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_10;
        v135[3] = &unk_1E4E00F10;
        v135[4] = v55;
        v58 = v56;
        v138 = v5;
        v136 = v58;
        v137 = v57;
        v59 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85A995C](v135);
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isCore"))
        {
          kcd_addr_begin[0] = 0;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "memoryCache");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = -[VMUTaskMemoryCache getCoreFileUdataPointersIntoBuffer:count:]((uint64_t)v60, 0, kcd_addr_begin);

          if (!v61 && kcd_addr_begin[0])
          {
            if (kcd_addr_begin[0] >> 61)
            {
              NSLog(CFSTR("Failed to get udata pointers for core file."));
            }
            else
            {
              v124 = malloc_type_malloc(8 * kcd_addr_begin[0], 0x9C3CF025uLL);
              if (v124)
              {
                v125 = v124;
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "memoryCache");
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                v127 = -[VMUTaskMemoryCache getCoreFileUdataPointersIntoBuffer:count:]((uint64_t)v126, (uint64_t)v125, kcd_addr_begin);

                if (!v127)
                  ((void (**)(_QWORD, void *, mach_vm_address_t))v59)[2](v59, v125, kcd_addr_begin[0]);
                free(v125);
              }
            }
          }
LABEL_145:

          v54 = v136;
          goto LABEL_138;
        }
        kcd_addr_begin[0] = 0;
        kcd_size = 0;
        if (!task_map_corpse_info_64(*MEMORY[0x1E0C83DA0], objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "taskPort"), kcd_addr_begin, &kcd_size))
        {
          v114 = kcd_addr_begin[0];
          v115 = kcd_size;
          v116 = kcd_size + kcd_addr_begin[0];
          v117 = kcd_addr_begin[0] + 16;
          if (v114 + 16 <= kcd_size + v114
            && v117 + *(unsigned int *)(kcd_addr_begin[0] + 4) <= v116
            && *(_DWORD *)kcd_addr_begin[0] == -559025833)
          {
            do
            {
              v118 = v117 + *(unsigned int *)(v114 + 4);
              if (v118 > v116)
                break;
              v119 = *(_DWORD *)v114;
              if (*(_DWORD *)v114 == -242132755)
                break;
              if ((v119 == 17 || (v119 & 0xFFFFFFF0) == 0x20) && HIDWORD(*(_QWORD *)(v114 + 8)) == 2076)
              {
                v59[2](v59, v114 + 16, *(_QWORD *)(v114 + 8));
                v118 = v117 + *(unsigned int *)(v114 + 4);
              }
              v117 = v118 + 16;
              v114 = v118;
            }
            while (v118 + 16 <= v116);
            v114 = kcd_addr_begin[0];
            v115 = kcd_size;
          }
          mach_vm_deallocate(*MEMORY[0x1E0C83DA0], v114, v115);
          goto LABEL_145;
        }
        objc_msgSend(*(id *)(a1 + 32), "pid");
        v65 = proc_list_uptrs();
        if (v65 < 1)
          goto LABEL_145;
        v66 = v65;
        v133 = v59;
        v67 = malloc_type_malloc((8 * v65), 0x1BE60CC1uLL);
        objc_msgSend(*(id *)(a1 + 32), "pid");
        proc_list_uptrs();
        v68 = v67;
        v69 = 0;
        v134 = v67;
LABEL_56:
        v70 = *(uint64_t **)(*(_QWORD *)(a1 + 32) + 112);
        v71 = v70[6];
        v72 = v70[7];
        v35 = v72 >= v71;
        v73 = v72 - v71;
        if (!v35)
          goto LABEL_106;
        v74 = v68[v69];
        if (v74 - v71 >= v73)
          goto LABEL_106;
        v75 = v74 >> *MEMORY[0x1E0C85AC8];
        if (v75)
        {
          v76 = (unsigned int *)v70[3];
          v77 = v74 >> *MEMORY[0x1E0C85AC8];
          do
          {
            if (*v76 <= (v77 & 0x3FFFFFF)
              || ((*((unsigned __int8 *)v76 + ((v77 & 0x3FFFFFF) >> 3) + 4) >> (v77 & 7)) & 1) == 0)
            {
              goto LABEL_106;
            }
            v77 >>= 26;
          }
          while (v77);
        }
        v78 = (uint64_t)v70 + 4 * (v75 & 0x7FFFF);
        v81 = *(_DWORD *)(v78 + 64);
        v80 = (_DWORD *)(v78 + 64);
        v79 = v81;
        v82 = v70[4];
        if (v81)
        {
          v83 = v82 + ((unint64_t)(v79 - 1) << 6);
          if (v74 - *(_QWORD *)(*(_QWORD *)v83 + 8) < *(_QWORD *)(*(_QWORD *)v83 + 16))
            goto LABEL_66;
        }
        v99 = *((unsigned int *)v70 + 10);
        if (!(_DWORD)v99)
          goto LABEL_106;
        v100 = v70[4];
        while (1)
        {
          v101 = v99 >> 1;
          v83 = v100 + (v99 >> 1 << 6);
          if (*(_QWORD *)(*(_QWORD *)v83 + 8) <= v74)
          {
            if (*(_QWORD *)(*(_QWORD *)v83 + 16) + *(_QWORD *)(*(_QWORD *)v83 + 8) > v74)
            {
              v102 = objc_msgSend(*(id *)v83, "isSpecialPhysFootprintRegion");
              v68 = v134;
              if (v102)
                v103 = 0;
              else
                v103 = v83;
              if ((v102 & 1) != 0)
                goto LABEL_106;
              if ((*(_BYTE *)(*(_QWORD *)v103 + 132) & 1) == 0)
                goto LABEL_120;
              v104 = (id *)(v103 + 64);
              v105 = *((unsigned int *)v70 + 10) - ((uint64_t)(v103 + 64 - v70[4]) >> 6);
              if (!v105)
                goto LABEL_117;
              while (2)
              {
                v106 = v105 >> 1;
                v107 = &v104[8 * (v105 >> 1)];
                if (*((_QWORD *)*v107 + 1) > v74)
                {
LABEL_100:
                  v108 = v105 > 1;
                  v105 = v106;
                  if (!v108)
                  {
                    v105 = 0;
                    goto LABEL_117;
                  }
                  continue;
                }
                break;
              }
              if (*((_QWORD *)*v107 + 2) + *((_QWORD *)*v107 + 1) <= v74)
              {
                v104 = v107 + 8;
                v106 = --v105 >> 1;
                goto LABEL_100;
              }
              v132 = v103;
              v113 = objc_msgSend(*v107, "isSpecialPhysFootprintRegion");
              v103 = v132;
              v68 = v134;
              if (v113)
                v105 = 0;
              else
                v105 = (unint64_t)v107;
LABEL_117:
              if (v105)
                v103 = v105;
              v83 = v103;
LABEL_120:
              *v80 = ((v103 - v82) >> 6) + 1;
LABEL_66:
              v84 = *(_DWORD *)(v83 + 20);
              if (v84)
              {
                v85 = *(_QWORD *)(v83 + 8);
                v86 = *v70;
                v87 = *(unsigned int *)(v83 + 16);
                v88 = (unint64_t *)(*v70 + 16 * v87);
                if (v85)
                {
                  if (*v88 > v74)
                    goto LABEL_106;
                  v89 = (_QWORD *)(v86 + 16 * (v84 + v87 - 1));
                  if (((v89[1] >> 5) & 0xFFFFFFFFFuLL) + *v89 <= v74)
                    goto LABEL_106;
                  v90 = (unsigned int *)(v85 + 4 * ((v74 - (*v88 & -*MEMORY[0x1E0C85AD8])) >> *MEMORY[0x1E0C85AC8]));
                  v91 = *v90;
                  v92 = (unint64_t *)(v86 + 16 * v91);
                  if (*v92 > v74)
                    goto LABEL_106;
                  v93 = v90[1];
                  if (v93 < *((_DWORD *)v70 + 2))
                  {
                    v94 = (unint64_t *)(v86 + 16 * v93);
                    v95 = *v94;
                    if (*v94 <= v74)
                    {
LABEL_102:
                      v109 = v94[1];
                      if ((v109 & 7) - 2 < 3)
                        goto LABEL_106;
                      v110 = ((unint64_t)v94 - v86) >> 4;
                      v111 = v70[2];
                      if (v74 - v95 >= v111)
                      {
                        if (((v109 >> 5) & 0xFFFFFFFFFLL) - (v74 - v95) > v111 || (_DWORD)v110 == -1)
                          goto LABEL_106;
                      }
                      else if ((_DWORD)v110 == -1)
                      {
                        goto LABEL_106;
                      }
                      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
                      v68 = v134;
                      goto LABEL_106;
                    }
                  }
                  v96 = v93 - v91;
                  if (v96)
                  {
                    do
                    {
                      v97 = v96 >> 1;
                      v94 = &v92[2 * v97];
                      v95 = *v94;
                      if (*v94 <= v74)
                      {
                        if (((v92[2 * v97 + 1] >> 5) & 0xFFFFFFFFFLL) + v95 > v74)
                          goto LABEL_102;
                        v92 = v94 + 2;
                        LODWORD(v97) = --v96 >> 1;
                      }
                      v35 = v96 >= 2;
                      v96 = v97;
                    }
                    while (v35);
                  }
                }
                else
                {
                  do
                  {
                    v98 = v84 >> 1;
                    v94 = &v88[2 * v98];
                    v95 = *v94;
                    if (*v94 <= v74)
                    {
                      if (((v88[2 * v98 + 1] >> 5) & 0xFFFFFFFFFLL) + v95 > v74)
                        goto LABEL_102;
                      v88 = v94 + 2;
                      LODWORD(v98) = --v84 >> 1;
                    }
                    v35 = v84 >= 2;
                    v84 = v98;
                  }
                  while (v35);
                }
              }
LABEL_106:
              if (++v69 == v66)
              {
                free(v68);
                v59 = v133;
                goto LABEL_145;
              }
              goto LABEL_56;
            }
            v100 = v83 + 64;
            v101 = --v99 >> 1;
          }
          v35 = v99 >= 2;
          v99 = v101;
          if (!v35)
            goto LABEL_106;
        }
      }
      if (v8 == 4)
      {
        v52 = *(unsigned int *)(a1 + 48);
        v139[0] = MEMORY[0x1E0C809B0];
        v139[1] = 3221225472;
        v139[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_9;
        v139[3] = &unk_1E4E00E98;
        v53 = *(void **)(a1 + 40);
        v139[4] = *(_QWORD *)(a1 + 32);
        v141 = v5;
        v140 = v53;
        (*(void (**)(uint64_t, unint64_t, uint64_t, _QWORD *))(a2 + 16))(a2, v5, v52, v139);
        v54 = v140;
LABEL_138:

      }
LABEL_139:
      ++v5;
      v2 = *(_QWORD *)(a1 + 32);
      if (v5 >= *(unsigned int *)(v2 + 88))
        return;
    }
    v24 = *(_QWORD *)(a1 + 32);
    v25 = (mach_vm_address_t *)(*(_QWORD *)(v24 + 80) + 16 * v5);
    v26 = *v25;
    v29 = v25[1];
    v27 = v25 + 1;
    v28 = v29;
    kcd_addr_begin[0] = 0;
    kcd_addr_begin[1] = (mach_vm_address_t)kcd_addr_begin;
    kcd_addr_begin[2] = 0x2020000000;
    kcd_addr_begin[3] = v26;
    kcd_size = 0;
    p_kcd_size = &kcd_size;
    v158 = 0x2020000000;
    v159 = 0;
    v159 = (*v27 >> 5) & 0xFFFFFFFFFLL;
    if (v159 < 8)
    {
LABEL_37:
      _Block_object_dispose(&kcd_size, 8);
      _Block_object_dispose(kcd_addr_begin, 8);
      goto LABEL_139;
    }
    v30 = ((v28 >> 5) & 0xFFFFFFFFFLL) + v26;
    v31 = *(id *)(*(_QWORD *)(v24 + 96) + ((*v27 >> 35) & 0x1FFFFFC0));
    v32 = (void *)MEMORY[0x1A85A995C](*(_QWORD *)(a1 + 40));
    v33 = *(_QWORD *)(a1 + 32);
    v34 = *(_QWORD *)(v33 + 528);
    v35 = v26 > v34 || v34 >= v30;
    if (!v35)
    {
      v36 = *(unsigned int *)(a1 + 48);
      v37 = MEMORY[0x1E0C809B0];
      v152[0] = MEMORY[0x1E0C809B0];
      v152[1] = 3221225472;
      v152[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_6;
      v152[3] = &unk_1E4E00EC0;
      v152[4] = v33;
      v154 = v26;
      v155 = v5;
      v153 = *(id *)(a1 + 40);
      (*(void (**)(uint64_t, unint64_t, uint64_t, _QWORD *))(a2 + 16))(a2, v5, v36, v152);
      v150[0] = v37;
      v150[1] = 3221225472;
      v150[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_7;
      v150[3] = &unk_1E4E00E28;
      v38 = *(void **)(a1 + 40);
      v150[4] = *(_QWORD *)(a1 + 32);
      v151 = v38;
      v39 = MEMORY[0x1A85A995C](v150);

      v32 = (void *)v39;
    }
    v40 = objc_msgSend(v31, "isFoundation");
    v41 = *(_QWORD *)(a1 + 32);
    if (v40)
    {
      v42 = v5 + 1;
      if (v5 + 1 < *(unsigned int *)(v41 + 88))
      {
        v43 = *(_QWORD *)(v41 + 80);
        if (*(_QWORD *)(v43 + 16 * v42) == v30)
        {
          v44 = *(_QWORD *)(v43 + 16 * v42 + 8);
          v45 = MEMORY[0x1E0C809B0];
          if (p_kcd_size[3] != ((v44 >> 5) & 0xFFFFFFFFFLL))
          {
LABEL_36:
            v49 = *(unsigned int *)(a1 + 48);
            v142[0] = v45;
            v142[1] = 3221225472;
            v142[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_8;
            v142[3] = &unk_1E4E00EE8;
            v147 = v26;
            v148 = v30;
            v142[4] = v41;
            v145 = &kcd_size;
            v146 = kcd_addr_begin;
            v149 = v5;
            v50 = v32;
            v144 = v50;
            v51 = v31;
            v143 = v51;
            (*(void (**)(uint64_t, unint64_t, uint64_t, _QWORD *))(a2 + 16))(a2, v5, v49, v142);

            goto LABEL_37;
          }
          IsVMRegion = VMUGraphNodeType_IsVMRegion(v44 & 7);
          v41 = *(_QWORD *)(a1 + 32);
          if (IsVMRegion)
          {
            v47 = objc_retain(*(id *)(*(_QWORD *)(v41 + 96)
                                    + ((*(_QWORD *)(*(_QWORD *)(v41 + 80) + 16 * v42 + 8) >> 35) & 0x1FFFFFC0)));
            v48 = v47;
            if (v47[49] && objc_msgSend(v47, "protection") == 5)
              (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

            v41 = *(_QWORD *)(a1 + 32);
          }
        }
      }
    }
    v45 = MEMORY[0x1E0C809B0];
    goto LABEL_36;
  }
}

void __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  int v30;
  _QWORD __compar[4];
  int v32;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned int *)(a1 + 48);
  v6 = *(_QWORD *)(*(_QWORD *)(v4 + 80) + 16 * v5 + 8);
  v7 = (v6 >> 5) & 0xFFFFFFFFFLL;
  if (v7 >= 0x100
    && (*(_DWORD *)a2 == -1583242847 && !strncmp((const char *)(a2 + 4), "AUTORELEASE!", 0xCuLL)
     || v7 == 10240
     && *(_DWORD *)(v2 + 2048) == -1583242847
     && !strncmp((const char *)(v2 + 2052), "AUTORELEASE!", 0xCuLL)))
  {
    v18 = *(_BYTE *)(v4 + 360);
    *(_DWORD *)(v4 + 300) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 360) = 0;
    v19 = *(_QWORD *)(a1 + 32);
    v20 = (uint64_t *)(*(_QWORD *)(v19 + 80) + 16 * *(unsigned int *)(a1 + 48));
    v21 = *v20;
    v22 = ((unint64_t)v20[1] >> 5) & 0xFFFFFFFFFLL;
    if (v22 == 10240)
    {
      if (*(_DWORD *)(v2 + 2048) == -1583242847)
      {
        v23 = strncmp((const char *)(v2 + 2052), "AUTORELEASE!", 0xCuLL);
        if (v23)
          v22 = 10240;
        else
          v22 = 0x2000;
        if (!v23)
        {
          v21 += 2048;
          v2 += 2048;
        }
      }
      else
      {
        v22 = 10240;
      }
    }
    v24 = *(_QWORD *)(v2 + *(unsigned int *)objc_msgSend(*(id *)(v19 + 64), "autoreleasePoolPageLayout")) - v21;
    if (v22 < v24)
      v24 = v22;
    if (v24 >= 0x4000)
      v25 = 0x4000;
    else
      v25 = v24;
    -[VMUTaskMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:](*(_QWORD *)(a1 + 32), v2, 0, *(_DWORD *)(a1 + 48), v25, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16 * *(unsigned int *)(a1 + 48) + 8) >> 41, 0, 8u, *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 360) = v18;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 300) = 0;
  }
  else
  {
    -[VMUTaskMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:](v4, v2, 0, v5, (v6 >> 5) & 0xFFFFFFFFFLL, v6 >> 41, 0, 1u, *(_QWORD *)(a1 + 40));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(const void **)(v8 + 240);
    v10 = *(unsigned int *)(v8 + 248);
    v11 = MEMORY[0x1E0C809B0];
    __compar[0] = MEMORY[0x1E0C809B0];
    __compar[1] = 3221225472;
    __compar[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_4;
    __compar[3] = &__block_descriptor_36_e15_i24__0r_v8r_v16l;
    v32 = *(_DWORD *)(a1 + 48);
    v12 = bsearch_b(0, v9, v10, 0x10uLL, __compar);
    if (v12)
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(a1 + 40);
      v15 = *(unsigned int *)(a1 + 48);
      v16 = *(void **)(*(_QWORD *)(v13 + 256) + ((*(_QWORD *)(*(_QWORD *)(v13 + 80) + 16 * v15 + 8) >> 38) & 0x3FFFFF8));
      v17 = v12[1];
      v27[0] = v11;
      v27[1] = 3221225472;
      v27[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_5;
      v27[3] = &unk_1E4E00E70;
      v27[4] = v13;
      v29 = v2;
      v30 = v15;
      v28 = v14;
      v26 = v16;
      objc_msgSend(v26, "enumerateStoredEntriesForObject:ofSize:externalValues:block:", v2, v6 >> 5, v17, v27);

    }
  }
}

uint64_t __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_4(uint64_t a1, uint64_t a2, unint64_t *a3)
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

void __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_5(uint64_t a1, void *a2, unsigned int a3, unsigned int a4)
{
  -[VMUTaskMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), a3, *(_DWORD *)(a1 + 56), a4, 0, a2, 1u, *(_QWORD *)(a1 + 40));
}

uint64_t __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_6(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  _DWORD *v13;
  unint64_t v14;
  unsigned int *v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  _DWORD *v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t *v27;
  _QWORD *v28;
  unsigned int *v29;
  uint64_t v30;
  unint64_t *v31;
  uint64_t v32;
  unint64_t *v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t *v36;
  BOOL v37;
  uint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t *v47;
  BOOL v48;

  v4 = *(_QWORD *)(result + 32);
  v5 = *(_QWORD *)(a2 + *(_QWORD *)(v4 + 528) - *(_QWORD *)(result + 48));
  if (v5)
  {
    v6 = result;
    v7 = v5 + 0x2000;
    v8 = *(uint64_t **)(v4 + 112);
    v10 = v8[6];
    v9 = v8[7];
    v11 = v9 - v10;
    v12 = v9 < v10;
    if (v7 - v10 < v11 && !v12)
    {
      v13 = (_DWORD *)MEMORY[0x1E0C85AC8];
      v14 = v7 >> *MEMORY[0x1E0C85AC8];
      if (v14)
      {
        v15 = (unsigned int *)v8[3];
        v16 = v7 >> *MEMORY[0x1E0C85AC8];
        do
        {
          if (*v15 <= (v16 & 0x3FFFFFF)
            || ((*((unsigned __int8 *)v15 + ((v16 & 0x3FFFFFF) >> 3) + 4) >> (v16 & 7)) & 1) == 0)
          {
            goto LABEL_47;
          }
          v16 >>= 26;
        }
        while (v16);
      }
      v17 = (uint64_t)v8 + 4 * (v14 & 0x7FFFF);
      v20 = *(_DWORD *)(v17 + 64);
      v19 = (_DWORD *)(v17 + 64);
      v18 = v20;
      v21 = v8[4];
      if (v20)
      {
        v22 = v21 + ((unint64_t)(v18 - 1) << 6);
        if (v7 - *(_QWORD *)(*(_QWORD *)v22 + 8) < *(_QWORD *)(*(_QWORD *)v22 + 16))
          goto LABEL_11;
      }
      v40 = *((unsigned int *)v8 + 10);
      if ((_DWORD)v40)
      {
        v41 = v8[4];
        do
        {
          v42 = v40 >> 1;
          v22 = v41 + (v40 >> 1 << 6);
          result = *(_QWORD *)v22;
          if (*(_QWORD *)(*(_QWORD *)v22 + 8) <= v7)
          {
            if (*(_QWORD *)(*(_QWORD *)v22 + 16) + *(_QWORD *)(*(_QWORD *)v22 + 8) > v7)
            {
              result = objc_msgSend((id)result, "isSpecialPhysFootprintRegion", a3, a4, 0xFFFFFFFFLL);
              if ((_DWORD)result)
                v43 = 0;
              else
                v43 = v22;
              if ((result & 1) != 0)
                break;
              if ((*(_BYTE *)(*(_QWORD *)v43 + 132) & 1) == 0)
                goto LABEL_56;
              v44 = (uint64_t *)(v43 + 64);
              v45 = *((unsigned int *)v8 + 10) - ((uint64_t)(v43 + 64 - v8[4]) >> 6);
              if (!v45)
                goto LABEL_53;
              while (1)
              {
                v46 = v45 >> 1;
                v47 = &v44[8 * (v45 >> 1)];
                result = *v47;
                if (*(_QWORD *)(*v47 + 8) <= v7)
                {
                  if (*(_QWORD *)(*v47 + 16) + *(_QWORD *)(*v47 + 8) > v7)
                  {
                    result = objc_msgSend((id)result, "isSpecialPhysFootprintRegion");
                    if ((_DWORD)result)
                      v45 = 0;
                    else
                      v45 = (unint64_t)v47;
LABEL_53:
                    if (v45)
                      v43 = v45;
                    v22 = v43;
LABEL_56:
                    *v19 = ((v43 - v21) >> 6) + 1;
LABEL_11:
                    v23 = *(_DWORD *)(v22 + 20);
                    if (v23)
                    {
                      v24 = *(_QWORD *)(v22 + 8);
                      v25 = *v8;
                      v26 = *(unsigned int *)(v22 + 16);
                      v27 = (unint64_t *)(*v8 + 16 * v26);
                      if (v24)
                      {
                        if (*v27 <= v7)
                        {
                          v28 = (_QWORD *)(v25 + 16 * (v23 + v26 - 1));
                          if (((v28[1] >> 5) & 0xFFFFFFFFFuLL) + *v28 > v7)
                          {
                            v29 = (unsigned int *)(v24 + 4 * ((v7 - (*v27 & -*MEMORY[0x1E0C85AD8])) >> *v13));
                            v30 = *v29;
                            v31 = (unint64_t *)(v25 + 16 * v30);
                            if (*v31 <= v7)
                            {
                              v32 = v29[1];
                              if (v32 >= *((_DWORD *)v8 + 2)
                                || (v33 = (unint64_t *)(v25 + 16 * v32), *v33 > v7))
                              {
                                v34 = v32 - v30;
                                if (v34)
                                {
                                  do
                                  {
                                    v35 = v34 >> 1;
                                    v36 = &v31[2 * v35];
                                    if (*v36 <= v7)
                                    {
                                      if (((v31[2 * v35 + 1] >> 5) & 0xFFFFFFFFFLL) + *v36 > v7)
                                        goto LABEL_47;
                                      v31 = v36 + 2;
                                      LODWORD(v35) = --v34 >> 1;
                                    }
                                    v37 = v34 >= 2;
                                    v34 = v35;
                                  }
                                  while (v37);
                                }
                              }
                            }
                          }
                        }
                      }
                      else
                      {
                        do
                        {
                          v38 = v23 >> 1;
                          v39 = &v27[2 * v38];
                          if (*v39 <= v7)
                          {
                            if (((v27[2 * v38 + 1] >> 5) & 0xFFFFFFFFFLL) + *v39 > v7)
                              goto LABEL_47;
                            v27 = v39 + 2;
                            LODWORD(v38) = --v23 >> 1;
                          }
                          v37 = v23 >= 2;
                          v23 = v38;
                        }
                        while (v37);
                      }
                    }
                    goto LABEL_47;
                  }
                  v44 = v47 + 8;
                  v46 = --v45 >> 1;
                }
                v48 = v45 > 1;
                v45 = v46;
                if (!v48)
                {
                  v45 = 0;
                  goto LABEL_53;
                }
              }
            }
            v41 = v22 + 64;
            v42 = --v40 >> 1;
          }
          v37 = v40 >= 2;
          v40 = v42;
        }
        while (v37);
      }
    }
LABEL_47:
    if (*(_DWORD *)(v6 + 56) != -1)
      return (*(uint64_t (**)(void))(*(_QWORD *)(v6 + 40) + 16))();
  }
  return result;
}

uint64_t __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_7(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 528) != a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
  return result;
}

void __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_8(uint64_t a1, uint64_t a2)
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
              -[VMUTaskMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:](*(_QWORD *)(a1 + 32), v29, v20 - *(_QWORD *)(a1 + 72), *(_DWORD *)(a1 + 88), v21, 0, 0, 8u, *(_QWORD *)(a1 + 48));
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

void __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_9(uint64_t a1, uint64_t a2)
{
  -[VMUTaskMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:](*(_QWORD *)(a1 + 32), a2, 0, *(_DWORD *)(a1 + 48), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "threadStateSize"), 0, 0, 8u, *(_QWORD *)(a1 + 40));
}

uint64_t __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_10(uint64_t result, uint64_t a2, uint64_t a3)
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
    v9 = *(uint64_t **)(*(_QWORD *)(v5 + 32) + 112);
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
  uint64_t v5;
  id v8;
  char *v9;
  _BOOL4 v10;
  uint64_t blocksCount;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  unsigned int v21;
  id *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  int v27;
  _BOOL4 v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  char v33;

  LODWORD(v5) = a4;
  v8 = a5;
  if (!(_DWORD)v5)
  {
    v32 = 0;
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
    while (1)
    {
      v15 = *v14;
      v14 += 2;
      if ((v15 & 7) == 3)
        break;
      if (blocksCount == ++v13)
        goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    LODWORD(v13) = -1;
  }
  v16 = 0;
  v33 = 0;
  v32 = 0;
  if (v5 <= 1)
    v5 = 1;
  else
    v5 = v5;
  v26 = -1;
  v31 = v13;
  v29 = v8;
  v30 = v13;
  v17 = 0xFFFFFFFFLL;
  v28 = v10;
  do
  {
    v18 = a3[v16];
    if (!(_DWORD)v18 || !VMUGraphNodeType_IsVMRegion(*((_DWORD *)&self->_blocks[v18] + 2) & 7))
      goto LABEL_47;
    v19 = (id *)objc_retain(*(id *)((char *)&self->_regions->var0
                                  + ((*((_QWORD *)&self->_blocks[v18] + 1) >> 35) & 0x1FFFFFC0)));
    if ((objc_msgSend(v19, "willNotHoldPointers") & 1) != 0 || !*((_DWORD *)v19 + 26) && *((_BYTE *)v19 + 50) == 5)
    {
      if (v10)
      {
        if ((v33 & 1) != 0)
        {
          v33 = 1;
        }
        else
        {
          v33 = 1;
          fwrite("The DT_REPORT_IOKIT_REGION_LEAKS env var is set so leaked IOKit, IOSurface, or IOAccelerator regions will be reported, if -vmalso is passed to 'leaks'\n", 0x97uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
        }
      }
      else
      {
        (*((void (**)(id, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))v8 + 2))(v8, v31, self->_blocks[v30].var0, 1, v18, self->_blocks[v18].var0);
      }
LABEL_43:
      v18 = v17;
      goto LABEL_46;
    }
    if ((_DWORD)v18 == 1)
      goto LABEL_43;
    v20 = (16 * (v18 - 1)) | 8;
    v27 = v18 - 1;
    v21 = v18 - 1;
    while (1)
    {
      if (!VMUGraphNodeType_IsVMRegion(*(_DWORD *)((_BYTE *)&self->_blocks->var0 + v20) & 7))
      {
        a3[v32++] = v18;
LABEL_45:
        v18 = v17;
        v8 = v29;
        v10 = v28;
        goto LABEL_46;
      }
      v22 = (id *)objc_retain(*(id *)((char *)&self->_regions->var0
                                    + ((*(unint64_t *)((char *)&self->_blocks->var0 + v20) >> 35) & 0x1FFFFFC0)));
      if ((objc_msgSend(v22, "isSubmap") & 1) == 0)
        break;
LABEL_39:

      v20 -= 16;
      if (!--v21)
        goto LABEL_45;
    }
    v23 = *((_DWORD *)v19 + 26);
    if (*((_DWORD *)v22 + 26) != v23)
      goto LABEL_33;
    v23 = *((_DWORD *)v22 + 26);
    if (*((unsigned __int8 *)v22 + 49) != *((unsigned __int8 *)v19 + 49))
      goto LABEL_33;
    if ((char *)v22[1] + (_QWORD)v22[2] != v19[1] && (objc_msgSend(v19, "isJavascriptJitExecutableAllocator") & 1) == 0)
    {
      v23 = *((_DWORD *)v19 + 26);
LABEL_33:
      if (v23
        || *((_DWORD *)v22 + 26)
        || (char *)v22[1] + (_QWORD)v22[2] != v19[1]
        || !objc_msgSend(v19[4], "isEqualToString:", VMUmappedFileLabel[0])
        || !objc_msgSend(v22[4], "isEqualToString:", CFSTR("__LINKEDIT"))
        || !objc_msgSend(v19[5], "isEqualToString:", v22[5]))
      {
        goto LABEL_39;
      }
      if ((_DWORD)v17 == v27)
        v25 = v26;
      else
        v25 = v21;
      v8 = v29;
      (*((void (**)(id, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))v29 + 2))(v29, v25, self->_blocks[v25].var0, 1, v18, self->_blocks[v18].var0);
      v26 = v25;
LABEL_56:
      v10 = v28;
      goto LABEL_57;
    }
    if ((_DWORD)v17 == v27)
      v24 = v26;
    else
      v24 = v21;
    v8 = v29;
    (*((void (**)(id, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))v29 + 2))(v29, v24, self->_blocks[v24].var0, 1, v18, self->_blocks[v18].var0);
    v26 = v24;
    if (!v32)
    {
      v32 = 0;
      goto LABEL_56;
    }
    v10 = v28;
    if (a3[v32 - 1] >= v24)
      a3[v32++] = v18;
LABEL_57:

LABEL_46:
    v17 = v18;
LABEL_47:
    ++v16;
  }
  while (v16 != v5);
LABEL_5:

  return v32;
}

- (id)processSnapshotGraphWithOptions:(unint64_t)a3
{
  uint64_t pid;
  _VMUBlockNode *blocks;
  uint64_t blocksCount;
  NSMutableArray *zoneNames;
  VMUClassInfoMap *classInfoIndexer;
  void *v9;
  VMUProcessObjectGraph *v10;
  VMUProcessObjectGraph *processObjectGraph;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  VMUDebugTimer *debugTimer;
  uint64_t v19;
  NSObject *v20;
  os_signpost_id_t v21;
  VMUDebugTimer *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  VMUSampler *v25;
  void *v26;
  char *v27;
  void *v28;
  void *v29;
  char v30;
  VMUSymbolStore *v31;
  VMUProcessObjectGraph *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  VMUDebugTimer *v38;
  uint64_t v39;
  NSObject *v40;
  os_signpost_id_t v41;
  VMUDebugTimer *v42;
  NSObject *v43;
  os_signpost_id_t v44;
  size_t regionsCount;
  VMUDebugTimer *v46;
  uint64_t v47;
  NSObject *v48;
  os_signpost_id_t v49;
  VMUDebugTimer *v50;
  NSObject *v51;
  os_signpost_id_t v52;
  char *v53;
  VMUProcessObjectGraph *v54;
  uint64_t v55;
  VMUDebugTimer *v56;
  uint64_t v57;
  NSObject *v58;
  os_signpost_id_t v59;
  VMUDebugTimer *v60;
  NSObject *v61;
  os_signpost_id_t v62;
  void *v63;
  void *v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t *v68;
  unint64_t v69;
  unint64_t v70;
  VMUDebugTimer *v71;
  uint64_t v72;
  NSObject *v73;
  os_signpost_id_t v74;
  VMUGraphStackLogReader *v75;
  VMUProcessObjectGraph *v76;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  VMUProcessObjectGraph *v81;
  uint64_t v82;
  _QWORD v84[5];
  uint8_t v85[16];
  _QWORD v86[5];
  VMUSymbolStore *v87;
  id v88;
  VMUSampler *v89;
  _QWORD *v90;
  _QWORD *v91;
  _QWORD *v92;
  uint8_t *v93;
  _QWORD *v94;
  _QWORD *v95;
  _QWORD *v96;
  uint8_t *v97;
  char *v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD v104[6];
  uint8_t v105[8];
  uint8_t *v106;
  uint64_t v107;
  char v108;
  _QWORD v109[5];
  _QWORD v110[3];
  int v111;
  _QWORD v112[5];
  id v113;
  _QWORD v114[6];
  uint8_t buf[8];
  uint8_t *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD v125[3];
  char v126;
  _QWORD v127[6];
  _QWORD v128[6];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v81 = [VMUProcessObjectGraph alloc];
  pid = self->_pid;
  blocks = self->_blocks;
  blocksCount = self->_blocksCount;
  zoneNames = self->_zoneNames;
  classInfoIndexer = self->_classInfoIndexer;
  -[VMUVMRegionIdentifier regions](self->_regionIdentifier, "regions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VMUProcessObjectGraph initWithPid:nodes:nodeCount:zoneNames:classInfoMap:regions:pthreadOffsets:userMarked:autoreleasePoolOffsets:](v81, "initWithPid:nodes:nodeCount:zoneNames:classInfoMap:regions:pthreadOffsets:userMarked:autoreleasePoolOffsets:", pid, blocks, blocksCount, zoneNames, classInfoIndexer, v9, gPthreadOffsets, self->_userMarkedAbandoned, -[VMUObjectIdentifier autoreleasePoolPageLayout](self->_objectIdentifier, "autoreleasePoolPageLayout"));
  processObjectGraph = self->_processObjectGraph;
  self->_processObjectGraph = v10;

  -[VMUProcessObjectGraph setSnapshotMachTime:](self->_processObjectGraph, "setSnapshotMachTime:", self->_suspendTime);
  -[VMUProcessObjectGraph setSnapshotDate:](self->_processObjectGraph, "setSnapshotDate:", self->_suspendDate);
  -[VMUProcessObjectGraph setScanner:](self->_processObjectGraph, "setScanner:", self);
  -[VMUProcessObjectGraph setDebugTimer:](self->_processObjectGraph, "setDebugTimer:", self->_debugTimer);
  -[VMUProcessObjectGraph setShowRawClassNames:](self->_processObjectGraph, "setShowRawClassNames:", self->_showRawClassNames);
  -[VMUProcessObjectGraph setProcessDescriptionString:](self->_processObjectGraph, "setProcessDescriptionString:", self->_processDescriptionString);
  -[VMUProcessObjectGraph setIsTranslatedByRosetta:](self->_processObjectGraph, "setIsTranslatedByRosetta:", -[VMUTaskMemoryScanner isTranslatedByRosetta](self, "isTranslatedByRosetta"));
  -[VMUProcessObjectGraph setProcessName:](self->_processObjectGraph, "setProcessName:", self->_processName);
  -[VMUProcessObjectGraph setBinaryImagesDescription:](self->_processObjectGraph, "setBinaryImagesDescription:", self->_binaryImagesDescription);
  -[VMUProcessObjectGraph setPhysicalFootprint:](self->_processObjectGraph, "setPhysicalFootprint:", self->_physicalFootprint);
  -[VMUTaskMemoryScanner ledger](self, "ledger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUProcessObjectGraph setLedger:](self->_processObjectGraph, "setLedger:", v12);

  -[VMUProcessObjectGraph setPhysicalFootprintPeak:](self->_processObjectGraph, "setPhysicalFootprintPeak:", self->_physicalFootprintPeak);
  v13 = -[VMUTask taskDyldSharedCacheRange](self->_task, "taskDyldSharedCacheRange");
  -[VMUProcessObjectGraph setDyldSharedCacheRange:](self->_processObjectGraph, "setDyldSharedCacheRange:", v13, v14);
  -[VMUProcessObjectGraph setObjectContentLevel:](self->_processObjectGraph, "setObjectContentLevel:", -[VMUTaskMemoryScanner objectContentLevel](self, "objectContentLevel"));
  -[VMUProcessObjectGraph setObjectContentLevelForNodeLabels:](self->_processObjectGraph, "setObjectContentLevelForNodeLabels:", -[VMUTaskMemoryScanner objectContentLevel](self, "objectContentLevel"));
  -[VMUProcessObjectGraph setSrcAddressToExtraAutoreleaseCountDict:](self->_processObjectGraph, "setSrcAddressToExtraAutoreleaseCountDict:", self->_srcAddressToExtraAutoreleaseCountDict);
  -[VMUProcessObjectGraph setShowsPhysFootprint:](self->_processObjectGraph, "setShowsPhysFootprint:", -[VMUVMRegionIdentifier recordedPhysFootprint](self->_regionIdentifier, "recordedPhysFootprint"));
  -[VMUProcessObjectGraph setDidPhysFootprintDirtyAccounting:](self->_processObjectGraph, "setDidPhysFootprintDirtyAccounting:", -[VMUVMRegionIdentifier didPhysFootprintDirtyAccounting](self->_regionIdentifier, "didPhysFootprintDirtyAccounting"));
  v15 = -[VMUObjectIdentifier symbolicator](self->_objectIdentifier, "symbolicator");
  v78 = v16;
  v79 = v15;
  if (self->_targetProcessHasObjCPatches)
  {
    v80 = CSSymbolicatorCreateForTaskSharedCache();
    v82 = v17;
  }
  else
  {
    v80 = 0;
    v82 = 0;
  }
  v128[0] = 0;
  v128[1] = v128;
  v128[2] = 0x3010000000;
  v128[5] = 0;
  v128[3] = &unk_1A4E39779;
  v128[4] = 0;
  v127[0] = 0;
  v127[1] = v127;
  v127[2] = 0x3010000000;
  v127[5] = 0;
  v127[3] = &unk_1A4E39779;
  v127[4] = 0;
  v125[0] = 0;
  v125[1] = v125;
  v125[2] = 0x2020000000;
  v126 = 0;
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    v19 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = self->_debugTimer;
    if (v19)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v20, OS_SIGNPOST_INTERVAL_END, v21, "processSnapshotGraph", ", buf, 2u);
      }

      debugTimer = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "processSnapshotGraph");
  -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "processSnapshotGraph", "sampling all threads");
  v22 = self->_debugTimer;
  if (v22)
  {
    -[VMUDebugTimer logHandle](v22, "logHandle");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v24, "processSnapshotGraph", "sampling all threads", buf, 2u);
    }

  }
  if (-[VMUTask isCore](self->_task, "isCore"))
  {
    v25 = 0;
    v26 = 0;
  }
  else
  {
    v25 = -[VMUSampler initWithTask:options:]([VMUSampler alloc], "initWithTask:options:", -[VMUTask taskPort](self->_task, "taskPort"), 257);
    -[VMUSampler sampleAllThreadsOnceWithFramePointers:](v25, "sampleAllThreadsOnceWithFramePointers:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = getenv("PreserveMemgraphSampleAndSymbolStore");
  if (v27
    && (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v27),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v28, "uppercaseString"),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("NO")),
        v29,
        v28,
        (v30 & 1) != 0))
  {
    v31 = 0;
  }
  else
  {
    -[VMUProcessObjectGraph setBacktraces:](self->_processObjectGraph, "setBacktraces:", v26);
    v31 = -[VMUSymbolStore initWithSymbolicator:debugTimer:]([VMUSymbolStore alloc], "initWithSymbolicator:debugTimer:", v79, v78, self->_debugTimer);
    -[VMUProcessObjectGraph setSymbolStore:](self->_processObjectGraph, "setSymbolStore:", v31);
    v32 = self->_processObjectGraph;
    -[VMUProcessObjectGraph symbolStore](v32, "symbolStore");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setGraph:", v32);

  }
  if (v26)
  {
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v34 = v26;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v121, v129, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v122;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v122 != v36)
            objc_enumerationMutation(v34);
          -[VMUSymbolStore addBacktrace:origin:](v31, "addBacktrace:origin:", *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * i), 0);
        }
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v121, v129, 16);
      }
      while (v35);
    }

  }
  *(_QWORD *)buf = 0;
  v116 = buf;
  v117 = 0x3010000000;
  v120 = 0;
  v118 = &unk_1A4E39779;
  v119 = 0;
  v113 = 0;
  v114[0] = 0;
  v114[1] = v114;
  v114[2] = 0x3010000000;
  v114[5] = 0;
  v114[3] = &unk_1A4E39779;
  v114[4] = 0;
  v112[0] = 0;
  v112[1] = v112;
  v112[2] = 0x3032000000;
  v112[3] = __Block_byref_object_copy_;
  v112[4] = __Block_byref_object_dispose_;
  v110[0] = 0;
  v110[1] = v110;
  v110[2] = 0x2020000000;
  v111 = 0;
  if ((a3 & 2) != 0 && (-[VMUTaskMemoryScanner objectContentLevel](self, "objectContentLevel") & 0xFFFFFFFE) == 2)
  {
    v38 = self->_debugTimer;
    if (v38)
    {
      v39 = -[VMUDebugTimer signpostID](v38, "signpostID");
      v38 = self->_debugTimer;
      if (v39)
      {
        -[VMUDebugTimer logHandle](v38, "logHandle");
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
        {
          *(_WORD *)v105 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v40, OS_SIGNPOST_INTERVAL_END, v41, "processSnapshotGraph", ", v105, 2u);
        }

        v38 = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](v38, "endEvent:", "processSnapshotGraph");
    -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "processSnapshotGraph", "getting node labels");
    v42 = self->_debugTimer;
    if (v42)
    {
      -[VMUDebugTimer logHandle](v42, "logHandle");
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
      {
        *(_WORD *)v105 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v43, OS_SIGNPOST_INTERVAL_BEGIN, v44, "processSnapshotGraph", "getting node labels", v105, 2u);
      }

    }
    v109[0] = MEMORY[0x1E0C809B0];
    v109[1] = 3221225472;
    v109[2] = __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke;
    v109[3] = &unk_1E4E00F60;
    v109[4] = self;
    -[VMUTaskMemoryScanner enumerateObjectsWithBlock:](self, "enumerateObjectsWithBlock:", v109);
    -[VMUProcessObjectGraph parseAddressesFromNodeLabelsIntoSymbolStore](self->_processObjectGraph, "parseAddressesFromNodeLabelsIntoSymbolStore");
  }
  regionsCount = self->_regionsCount;
  if ((_DWORD)regionsCount)
  {
    v46 = self->_debugTimer;
    if (v46)
    {
      v47 = -[VMUDebugTimer signpostID](v46, "signpostID");
      v46 = self->_debugTimer;
      if (v47)
      {
        -[VMUDebugTimer logHandle](v46, "logHandle");
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
        {
          *(_WORD *)v105 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v48, OS_SIGNPOST_INTERVAL_END, v49, "processSnapshotGraph", ", v105, 2u);
        }

        v46 = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](v46, "endEvent:", "processSnapshotGraph");
    -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "processSnapshotGraph", "scan nodes into the graph, while recording symbols of __DATA regions and stacks");
    v50 = self->_debugTimer;
    if (v50)
    {
      -[VMUDebugTimer logHandle](v50, "logHandle");
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
      {
        *(_WORD *)v105 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v52, "processSnapshotGraph", "scan nodes into the graph, while recording symbols of __DATA regions and stacks", v105, 2u);
      }

    }
    v53 = (char *)malloc_type_calloc(regionsCount, 4uLL, 0x100004052888210uLL);
    *(_QWORD *)v105 = 0;
    v106 = v105;
    v107 = 0x2020000000;
    v108 = 0;
    v54 = self->_processObjectGraph;
    v55 = MEMORY[0x1E0C809B0];
    v104[0] = MEMORY[0x1E0C809B0];
    v104[1] = 3221225472;
    v104[2] = __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_225;
    v104[3] = &unk_1E4E00FB0;
    v104[4] = self;
    v104[5] = v105;
    -[VMUObjectGraph enumerateObjectsWithBlock:](v54, "enumerateObjectsWithBlock:", v104);
    v86[0] = v55;
    v86[1] = 3221225472;
    v86[2] = __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_3;
    v86[3] = &unk_1E4E00FD8;
    v98 = v53;
    v99 = a3;
    v100 = v80;
    v101 = v82;
    v102 = v79;
    v103 = v78;
    v86[4] = self;
    v90 = v128;
    v91 = v125;
    v92 = v127;
    v87 = v31;
    v93 = buf;
    v94 = v114;
    v95 = v112;
    v96 = v110;
    v88 = v26;
    v89 = v25;
    v97 = v105;
    -[VMUTaskMemoryScanner scanNodesWithReferenceRecorder:](self, "scanNodesWithReferenceRecorder:", v86);
    v56 = self->_debugTimer;
    if (v56)
    {
      v57 = -[VMUDebugTimer signpostID](v56, "signpostID");
      v56 = self->_debugTimer;
      if (v57)
      {
        -[VMUDebugTimer logHandle](v56, "logHandle");
        v58 = objc_claimAutoreleasedReturnValue();
        v59 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
        {
          *(_WORD *)v85 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v58, OS_SIGNPOST_INTERVAL_END, v59, "processSnapshotGraph", ", v85, 2u);
        }

        v56 = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](v56, "endEvent:", "processSnapshotGraph");
    -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "processSnapshotGraph", "find unreferenced VM regions");
    v60 = self->_debugTimer;
    if (v60)
    {
      -[VMUDebugTimer logHandle](v60, "logHandle");
      v61 = objc_claimAutoreleasedReturnValue();
      v62 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
      {
        *(_WORD *)v85 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v61, OS_SIGNPOST_INTERVAL_BEGIN, v62, "processSnapshotGraph", "find unreferenced VM regions", v85, 2u);
      }

    }
    v63 = malloc_type_malloc(4 * regionsCount, 0x100004052888210uLL);
    v64 = v63;
    v65 = self->_blocksCount;
    if ((_DWORD)v65)
    {
      v66 = 0;
      v67 = 0;
      v68 = (unint64_t *)self->_blocks + 1;
      do
      {
        v70 = *v68;
        v68 += 2;
        v69 = v70;
        if ((v70 & 7) == 5 && !*(_DWORD *)&v53[(v69 >> 39) & 0x1FFFFFC])
        {
          *((_DWORD *)v63 + v67) = v66;
          v67 = (v67 + 1);
          v65 = self->_blocksCount;
        }
        ++v66;
      }
      while (v66 < v65);
      if ((_DWORD)v67)
      {
        v84[0] = v55;
        v84[1] = 3221225472;
        v84[2] = __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_246;
        v84[3] = &unk_1E4E01000;
        v84[4] = self;
        -[VMUTaskMemoryScanner _removeFalsePositiveLeakedVMregionsFromNodes:nodeCount:recorder:](self, "_removeFalsePositiveLeakedVMregionsFromNodes:nodeCount:recorder:", v63, v67, v84);
      }
    }
    free(v64);
    free(v53);

    _Block_object_dispose(v105, 8);
  }
  CSRelease();
  -[VMUTaskMemoryScanner unmapAllRegions](self, "unmapAllRegions");
  v71 = self->_debugTimer;
  if (v71)
  {
    v72 = -[VMUDebugTimer signpostID](v71, "signpostID");
    v71 = self->_debugTimer;
    if (v72)
    {
      -[VMUDebugTimer logHandle](v71, "logHandle");
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
      {
        *(_WORD *)v105 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v73, OS_SIGNPOST_INTERVAL_END, v74, "processSnapshotGraph", ", v105, 2u);
      }

      v71 = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](v71, "endEvent:", "processSnapshotGraph");
  if ((a3 & 1) != 0 && !-[VMUTask isCore](self->_task, "isCore"))
  {
    v75 = -[VMUGraphStackLogReader initWithTask:symbolicator:graph:debugTimer:collectDisklogs:]([VMUGraphStackLogReader alloc], "initWithTask:symbolicator:graph:debugTimer:collectDisklogs:", self->_task, v79, v78, self->_processObjectGraph, self->_debugTimer, (a3 >> 3) & 1);
    if (v75)
      -[VMUProcessObjectGraph setStackLogReader:](self->_processObjectGraph, "setStackLogReader:", v75);

  }
  -[VMUProcessObjectGraph setIdleExitStatus:](self->_processObjectGraph, "setIdleExitStatus:", self->_idleExitStatus);
  v76 = self->_processObjectGraph;
  _Block_object_dispose(v110, 8);
  _Block_object_dispose(v112, 8);

  _Block_object_dispose(v114, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v125, 8);
  _Block_object_dispose(v127, 8);
  _Block_object_dispose(v128, 8);
  return v76;
}

void __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

void __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_225(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[7];

  if (a3[1] >> 60 == 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "vmuVMRegionForNode:", a2);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "hasPrefix:", CFSTR("__DATA")) & 1) != 0)
    {
      objc_msgSend(v19, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("dyld"));

      if (v11)
      {
        v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "rangeForSymbolName:inRegion:", CFSTR("_main_thread"), v19);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = v12;
          v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "is64bit");
          v15 = 348;
          if (v14)
            v15 = 568;
          v16 = v13 - *a3 + v15;
          v17 = *(_QWORD *)(a1 + 40);
          v18 = *(void **)(*(_QWORD *)(a1 + 32) + 496);
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_2;
          v20[3] = &unk_1E4E00F88;
          v20[4] = v17;
          v20[5] = v16;
          v20[6] = a4;
          objc_msgSend(v18, "enumerateReferencesOfNode:withBlock:", a2, v20);
        }
      }
    }
    else
    {

    }
  }
}

uint64_t __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  if (*(_QWORD *)(a5 + 8) == *(_QWORD *)(result + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a6 = 1;
    **(_BYTE **)(result + 48) = 1;
  }
  return result;
}

void __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v8;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  _BYTE *v13;
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
  uint64_t v45;
  void *v46;
  uint64_t v47;
  __CFString *v48;
  void *v49;
  void *v50;
  unsigned int v51;
  unsigned int v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t Name;

  v8 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "addEdgeFromNode:sourceOffset:withScanType:toNode:destinationOffset:", a2, a3 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16 * a2), a4, a5, a6 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16 * a5)) != -1)
  {
    if (v8 != (_DWORD)a5
      && (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16 * a5 + 8) & 7) == 5)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16 * a5 + 8);
      ++*(_DWORD *)(*(_QWORD *)(a1 + 128) + ((v10 >> 39) & 0x1FFFFFC));
    }
    if ((*(_BYTE *)(a1 + 136) & 4) != 0)
    {
      v11 = v8;
      if (VMUGraphNodeType_IsVMRegion(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16 * v8 + 8) & 7))
      {
        v12 = (void *)MEMORY[0x1A85A9758]();
        v13 = objc_retain(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96)
                                + ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16 * v11 + 8) >> 35) & 0x1FFFFFC0)));
        v14 = v13;
        if ((v13[132] & 2) != 0)
        {
          if ((v13[132] & 4) == 0)
            goto LABEL_17;
        }
        else if ((v13[132] & 4) == 0)
        {
          if (!objc_msgSend(v13, "isStack")
            || a3 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32) < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                            + 40))
          {
            goto LABEL_32;
          }
          if (a3 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32) >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                                             + 40))
          {
            v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "indexForLocation:", a3);
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
              v34 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "rangeAtIndex:", v15);
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
                if (v33 || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24))
                {
                  v45 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40)
                      + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32);
                  objc_msgSend((id)gPthreadOffsets, "objectForKeyedSubscript:", CFSTR("RegionEndOffsetKey"));
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = objc_msgSend(v46, "unsignedLongLongValue");

                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setRegionSymbolName:forRange:", CFSTR("<PTHREAD_T>"), v45 - v47, v47);
                }

              }
              else
              {
                if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isCore") & 1) != 0)
                {
                  v48 = &stru_1E4E04720;
                }
                else
                {
                  objc_msgSend(*(id *)(a1 + 56), "threadDescriptionStringForBacktrace:returnedAddress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), 0);
                  v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                -[__CFString stringByAppendingString:](v48, "stringByAppendingString:", CFSTR("  no associated pthread"));
                v49 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setThreadName:forRange:", v49, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setThreadName:forRange:", v49, v33, 1);

              }
            }
          }
          v50 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
          if (!v50)
            goto LABEL_32;
          v51 = objc_msgSend(v50, "backtraceLength");
          if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) >= v51)
            goto LABEL_32;
          v52 = v51;
          while (1)
          {
            v53 = *(_QWORD *)(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "stackFramePointers")+ 8 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24));
            v54 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "backtrace");
            v55 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
            v56 = *(unsigned int *)(v55 + 24);
            if (v53 > a3)
              break;
            *(_DWORD *)(v55 + 24) = v56 + 1;
            if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) >= v52)
              goto LABEL_32;
          }
          v57 = *(_QWORD *)(v54 + 8 * v56);
          v58 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
          *(_QWORD *)(v58 + 32) = a3;
          *(_QWORD *)(v58 + 40) = v53 - a3;
          CSSymbolicatorGetSymbolWithAddressAtTime();
          CSSymbolGetSymbolOwner();
          Name = CSSymbolOwnerGetName();
          if (CSSymbolIsUnnamed())
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%#llx (in %s)"), v57, Name);
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

uint64_t __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_246(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "addEdgeFromNode:sourceOffset:withScanType:toNode:destinationOffset:", a2, a3 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16 * a2), a4, a5, a6 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16 * a5));
}

- (id)processSnapshotGraph
{
  return -[VMUTaskMemoryScanner processSnapshotGraphWithOptions:](self, "processSnapshotGraphWithOptions:", 5);
}

- (VMUClassInfoMap)realizedClasses
{
  return -[VMUObjectIdentifier realizedClasses](self->_objectIdentifier, "realizedClasses");
}

- (BOOL)hasClassInfosDerivedFromStackBacktraces
{
  void *v2;
  char v3;

  -[VMUTaskMemoryScanner realizedClasses](self, "realizedClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasClassInfosDerivedFromStackBacktraces");

  return v3;
}

- ($61A80719B04F7407D3E47539F1B23CAA)nodeDetails:(VMUTaskMemoryScanner *)self
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
  if (-[VMUTaskMemoryScanner nodeNamespaceSize](self, "nodeNamespaceSize") <= a3)
  {
    v5 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    -[VMUTaskMemoryScanner nodeDetails:](self, "nodeDetails:", v3);
    -[VMUTaskMemoryScanner vmuVMRegionForAddress:](self, "vmuVMRegionForAddress:", v7);
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
    -[VMUObjectIdentifier labelForMemory:length:remoteAddress:classInfo:](self->_objectIdentifier, "labelForMemory:length:remoteAddress:classInfo:", -[VMUTaskMemoryScanner contentForNode:](self, "contentForNode:", v3), (*((_QWORD *)v5 + 1) >> 5) & 0xFFFFFFFFFLL, v5->var0, v7);
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

  -[VMUTaskMemoryScanner labelForNode:](self, "labelForNode:", *(_QWORD *)&a3);
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
  VMUObjectIdentifier *objectIdentifier;
  VMUTaskMemoryCache *v28;
  VMUTask *v29;
  VMUTaskMemoryCache *v30;
  VMUTaskMemoryCache *v31;
  uint64_t v32;
  uint64_t v33;
  _VMURegionNode *v34;
  _QWORD *v35;
  const mapped_region_node_t *v36;
  unint64_t var1;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  _VMURegionNode *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t var5;
  _VMURegionNode *v45;
  unint64_t v46;
  VMUTaskMemoryCache *memoryCache;
  _VMURegionNode *regions;
  unsigned int regionsCount;
  int v50;
  int v51;
  _BOOL4 v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  VMUTask *v57;
  id v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  int v63;
  unint64_t v64;
  id *v65;
  unint64_t v66;
  unint64_t v67;
  id *v68;
  BOOL v69;
  unint64_t v70;
  VMUTaskMemoryCache *v71;
  VMUTaskMemoryCache *v72;
  VMUTaskMemoryCache *v73;
  _VMURegionNode *v74;
  void (**v75)(void);
  void *v76;
  char *v77;
  uint64_t v78;
  FILE *v79;
  VMUTask *v80;
  uint64_t v81;
  uint64_t v82;
  VMUTaskMemoryCache *v83;
  unint64_t v84;
  _QWORD v85[4];
  VMUTaskMemoryCache *v86;
  VMUTaskMemoryCache *v87;
  _VMURegionNode *v88;
  _VMURegionNode *v89;
  _QWORD v90[2];

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
  v45 = regionMap->var4;
  while (1)
  {
    v46 = var5 >> 1;
    v21 = &v45[var5 >> 1];
    if (*((_QWORD *)v21->var0 + 1) <= var0)
      break;
LABEL_29:
    v8 = var5 >= 2;
    var5 = v46;
    if (!v8)
      return 0;
  }
  if (*((_QWORD *)v21->var0 + 2) + *((_QWORD *)v21->var0 + 1) <= var0)
  {
    v45 = v21 + 1;
    v46 = --var5 >> 1;
    goto LABEL_29;
  }
  v63 = objc_msgSend(v21->var0, "isSpecialPhysFootprintRegion");
  result = 0;
  if (v63)
    v64 = 0;
  else
    v64 = (unint64_t)v21;
  if ((v63 & 1) == 0)
  {
    if ((*(_BYTE *)(*(_QWORD *)v64 + 132) & 1) == 0)
      goto LABEL_75;
    v65 = (id *)(v64 + 64);
    v66 = regionMap->var5 - ((uint64_t)(v64 + 64 - (unint64_t)regionMap->var4) >> 6);
    if (!v66)
      goto LABEL_72;
    while (1)
    {
      v67 = v66 >> 1;
      v68 = &v65[8 * (v66 >> 1)];
      if (*((_QWORD *)*v68 + 1) <= var0)
      {
        if (*((_QWORD *)*v68 + 2) + *((_QWORD *)*v68 + 1) > var0)
        {
          if (objc_msgSend(*v68, "isSpecialPhysFootprintRegion"))
            v66 = 0;
          else
            v66 = (unint64_t)v68;
LABEL_72:
          if (v66)
            v64 = v66;
          v21 = (_VMURegionNode *)v64;
LABEL_75:
          *v18 = ((v64 - (unint64_t)var4) >> 6) + 1;
LABEL_12:
          v22 = a3;
          v23 = &self->_blocks[a3];
          v24 = ((*((_QWORD *)v23 + 1) >> 5) & 0xFFFFFFFFFLL) + v23->var0;
          if (*((_QWORD *)v21->var0 + 2) + *((_QWORD *)v21->var0 + 1) >= v24)
          {
            memoryCache = self->_memoryCache;
            regions = self->_regions;
            regionsCount = self->_regionsCount;
            v29 = self->_task;
            v83 = memoryCache;
            if (!v21->var7 && (objc_msgSend(v21->var0, "isSpecialPhysFootprintRegion") & 1) == 0)
            {
              v85[0] = 0;
              v90[0] = 0;
              v50 = -[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:](v83, "mapAddress:size:returnedAddress:returnedSize:", *((_QWORD *)v21->var0 + 1), *((_QWORD *)v21->var0 + 2), v85, v90);
              if (v50)
              {
                if ((*((_DWORD *)v21->var0 + 13) & 3u) - 1 >= 2)
                {
                  v51 = v50;
                  v52 = task_exists(v29);
                  if (v21 != &regions[(unint64_t)(regionsCount - 1)] && v52)
                  {
                    v79 = (FILE *)*MEMORY[0x1E0C80C10];
                    v81 = v22;
                    v53 = objc_msgSend(v21->var0, "address");
                    v54 = *((unsigned int *)v21->var0 + 6);
                    v55 = vm_prot_strings[v54];
                    v56 = *((_QWORD *)v21->var0 + 2) + *((_QWORD *)v21->var0 + 1);
                    VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(*((unsigned __int8 *)v21->var0 + 232), *((unsigned __int8 *)v21->var0 + 104), *((unsigned __int8 *)v21->var0 + 50), v54, *((unsigned __int8 *)v21->var0 + 49));
                    v57 = v29;
                    v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    v59 = (const char *)objc_msgSend(v58, "UTF8String");
                    v60 = *((_QWORD *)v21->var0 + 2) >> *v12;
                    v61 = "pages";
                    if (v60 == 1)
                      v61 = "page";
                    if (v21->var4 == v21->var5)
                      v62 = "";
                    else
                      v62 = " [root]";
                    v78 = v53;
                    v22 = v81;
                    fprintf(v79, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v78, v56, v55, v59, v60, v61, v62, v51);

                    v29 = v57;
                  }
                }
              }
              else
              {
                v76 = (void *)v85[0];
                v21->var6 = v90[0];
                v21->var7 = v76;
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
            v28 = self->_memoryCache;
            objectIdentifier = self->_objectIdentifier;
            v29 = self->_task;
            v83 = objectIdentifier;
            v30 = v28;
            v31 = v30;
            v32 = 0;
            if ((_DWORD)v25)
            {
              v33 = v25;
              v34 = v21;
              do
              {
                v35 = v34->var0;
                ++v34;
                v32 += v35[2];
                --v33;
              }
              while (v33);
            }
            v90[0] = 0;
            v84 = 0;
            v36 = -[VMUTaskMemoryCache findMappedAddress:size:](v30, "findMappedAddress:size:", *((_QWORD *)v21->var0 + 1), v32);
            if (v36)
            {
              var1 = v36->var1;
              v38 = *((_QWORD *)v21->var0 + 1) - v36->var0;
              v90[0] = v36->var2 + v38;
              v84 = var1 - v38;
              goto LABEL_20;
            }
            v80 = v29;
            v82 = v22;
            if ((_DWORD)v25)
            {
              v70 = 0;
              do
              {
                v71 = v83;
                v72 = v31;
                v73 = v72;
                if (v21[v70 / 0x40].var7)
                {
                  if (&v21[v70 / 0x40] == v21[v70 / 0x40].var8)
                  {
                    v85[0] = MEMORY[0x1E0C809B0];
                    v85[1] = 3221225472;
                    v85[2] = ___unmapRegion_block_invoke;
                    v85[3] = &unk_1E4E01050;
                    v86 = v72;
                    v88 = &v21[v70 / 0x40];
                    v87 = v71;
                    v89 = v21;
                    v75 = (void (**)(void))MEMORY[0x1A85A995C](v85);
                    v75[2]();

                  }
                  else
                  {
                    v74 = &v21[v70 / 0x40];
                    v74->var6 = 0;
                    v74->var7 = 0;
                    v74->var8 = 0;
                  }
                }

                v70 += 64;
              }
              while ((unint64_t)v25 << 6 != v70);
            }
            v29 = v80;
            v22 = v82;
            if (-[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:](v31, "mapAddress:size:returnedAddress:returnedSize:", *((_QWORD *)v21->var0 + 1), v32, v90, &v84))
            {
              if (task_exists(v80))
                fprintf((FILE *)*MEMORY[0x1E0C80C10], "Failed to map remote region at [%#llx-%#llx]\n", *((_QWORD *)v21->var0 + 1), *((_QWORD *)v21->var0 + 1) + v32);
            }
            else
            {
LABEL_20:
              if ((_DWORD)v25)
              {
                v39 = 0;
                v40 = v84;
                do
                {
                  v41 = &v21[v39 / 0x40];
                  v41->var8 = v21;
                  v41->var6 = v40;
                  v42 = v90[0];
                  v41->var7 = (void *)v90[0];
                  v43 = (uint64_t)v21[v39 / 0x40].var0 + 8;
                  v90[0] = *((_QWORD *)v21[v39 / 0x40].var0 + 2) + v42;
                  v40 = v84 - *(_QWORD *)(v43 + 8);
                  v84 = v40;
                  v39 += 64;
                }
                while ((unint64_t)v25 << 6 != v39);
              }
            }

          }
          v77 = (char *)v21->var7;
          if (v77)
            return &v77[self->_blocks[v22].var0 - *((_QWORD *)v21->var0 + 1)];
          return 0;
        }
        v65 = v68 + 8;
        v67 = --v66 >> 1;
      }
      v69 = v66 > 1;
      v66 = v67;
      if (!v69)
      {
        v66 = 0;
        goto LABEL_72;
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

- (_VMURegionNode)validateAddressRangeForSwiftRemoteMirror:(_VMURange)a3 allowUnusedSplitLibs:(BOOL)a4
{
  _VMURegionNode *v4;
  _VMURegionMap *regionMap;
  unint64_t var6;
  unint64_t var7;
  BOOL v8;
  unint64_t v9;
  unint64_t location;
  _BOOL4 v11;
  unint64_t length;
  _DWORD *v14;
  unint64_t v15;
  _DWORD *var3;
  unint64_t v17;
  char *v18;
  int v19;
  _DWORD *v20;
  int v21;
  _VMURegionNode *var4;
  _VMURegionNode *v23;
  id v24;
  _QWORD *v25;
  unint64_t var5;
  _VMURegionNode *v27;
  unint64_t v28;
  int v29;
  unint64_t v30;
  id *v31;
  unint64_t v32;
  unint64_t v33;
  id *v34;
  BOOL v35;
  unsigned int v36;
  _VMURegionMap *v37;
  unsigned int *var1;
  _VMUBlockNode *var0;
  uint64_t var2;
  _VMUBlockNode *v41;
  unint64_t v42;
  _VMUBlockNode *v43;
  _DWORD *v44;
  unsigned int *v45;
  uint64_t v46;
  unint64_t *p_var0;
  uint64_t v48;
  unint64_t *v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  int v54;
  unint64_t v55;

  v4 = 0;
  regionMap = self->_regionMap;
  var6 = regionMap->var6;
  var7 = regionMap->var7;
  v8 = var7 >= var6;
  v9 = var7 - var6;
  if (!v8)
    return v4;
  location = a3.location;
  if (a3.location - var6 >= v9)
    return v4;
  v11 = a4;
  length = a3.length;
  v14 = (_DWORD *)MEMORY[0x1E0C85AC8];
  v15 = a3.location >> *MEMORY[0x1E0C85AC8];
  if (v15)
  {
    var3 = regionMap->var3;
    v17 = a3.location >> *MEMORY[0x1E0C85AC8];
    while (*var3 > (v17 & 0x3FFFFFF)
         && ((*((unsigned __int8 *)var3 + ((v17 & 0x3FFFFFF) >> 3) + 4) >> (v17 & 7)) & 1) != 0)
    {
      v17 >>= 26;
      if (!v17)
        goto LABEL_9;
    }
    return 0;
  }
LABEL_9:
  v18 = (char *)regionMap + 4 * (v15 & 0x7FFFF);
  v21 = *((_DWORD *)v18 + 16);
  v20 = v18 + 64;
  v19 = v21;
  var4 = regionMap->var4;
  if (v21)
  {
    v23 = &var4[(unint64_t)(v19 - 1)];
    if (a3.location - *((_QWORD *)v23->var0 + 1) < *((_QWORD *)v23->var0 + 2))
      goto LABEL_11;
  }
  var5 = regionMap->var5;
  if (!(_DWORD)var5)
    return 0;
  v27 = regionMap->var4;
  while (1)
  {
    v28 = var5 >> 1;
    v23 = &v27[var5 >> 1];
    if (*((_QWORD *)v23->var0 + 1) <= a3.location)
      break;
LABEL_20:
    v8 = var5 >= 2;
    var5 = v28;
    if (!v8)
      return 0;
  }
  if (*((_QWORD *)v23->var0 + 2) + *((_QWORD *)v23->var0 + 1) <= a3.location)
  {
    v27 = v23 + 1;
    v28 = --var5 >> 1;
    goto LABEL_20;
  }
  v29 = objc_msgSend(v23->var0, "isSpecialPhysFootprintRegion");
  v4 = 0;
  if (v29)
    v30 = 0;
  else
    v30 = (unint64_t)v23;
  if ((v29 & 1) != 0)
    return v4;
  v14 = (_DWORD *)MEMORY[0x1E0C85AC8];
  if ((*(_BYTE *)(*(_QWORD *)v30 + 132) & 1) == 0)
    goto LABEL_66;
  v31 = (id *)(v30 + 64);
  v32 = regionMap->var5 - ((uint64_t)(v30 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v32)
    goto LABEL_63;
  while (2)
  {
    v33 = v32 >> 1;
    v34 = &v31[8 * (v32 >> 1)];
    if (*((_QWORD *)*v34 + 1) > location)
    {
LABEL_34:
      v35 = v32 > 1;
      v32 = v33;
      if (!v35)
      {
        v32 = 0;
        goto LABEL_62;
      }
      continue;
    }
    break;
  }
  if (*((_QWORD *)*v34 + 2) + *((_QWORD *)*v34 + 1) <= location)
  {
    v31 = v34 + 8;
    v33 = --v32 >> 1;
    goto LABEL_34;
  }
  v53 = v30;
  v54 = objc_msgSend(*v34, "isSpecialPhysFootprintRegion");
  v30 = v53;
  if (v54)
    v32 = 0;
  else
    v32 = (unint64_t)v34;
LABEL_62:
  v14 = (_DWORD *)MEMORY[0x1E0C85AC8];
LABEL_63:
  if (v32)
    v30 = v32;
  v23 = (_VMURegionNode *)v30;
LABEL_66:
  *v20 = ((v30 - (unint64_t)var4) >> 6) + 1;
LABEL_11:
  v24 = v23->var0;
  v25 = v24;
  if ((*((_BYTE *)v24 + 132) & 2) != 0)
  {
    if (objc_msgSend(*((id *)v24 + 4), "isEqualToString:", CFSTR("__LINKEDIT")))
      v4 = 0;
    else
      v4 = v23;
    goto LABEL_71;
  }
  if (v11 && (objc_msgSend(*((id *)v24 + 4), "isEqualToString:", VMUunusedSharedLibTextLabel[0]) & 1) != 0)
  {
LABEL_14:
    v4 = v23;
    goto LABEL_71;
  }
  if (!self->_initializedRegionMallocBlockCounts)
  {
    if (objc_msgSend(v25, "isMallocHeapRelated"))
      v4 = v23;
    else
      v4 = 0;
    goto LABEL_71;
  }
  if (!v25[17])
    goto LABEL_70;
  v36 = v23->var3;
  if (!v36)
    goto LABEL_70;
  v37 = self->_regionMap;
  var1 = v23->var1;
  var0 = v37->var0;
  var2 = v23->var2;
  v41 = &v37->var0[var2];
  if (var1)
  {
    v42 = v41->var0;
    if (v42 <= location)
    {
      v43 = &var0[v36 - 1 + var2];
      if (((*((_QWORD *)v43 + 1) >> 5) & 0xFFFFFFFFFLL) + v43->var0 > location)
      {
        v44 = v14;
        v4 = 0;
        v45 = &var1[(location - (v42 & -*MEMORY[0x1E0C85AD8])) >> *v44];
        v46 = *v45;
        p_var0 = &var0[v46].var0;
        if (*p_var0 > location)
          goto LABEL_71;
        v48 = v45[1];
        if (v48 < v37->var1 && (v49 = &var0[v48].var0, *v49 <= location))
        {
LABEL_67:
          v55 = (char *)v49 - (char *)var0;
          if (self->_blocksCount > (v55 >> 4)
            && (!length
             || ((*(_QWORD *)((char *)self->_blocks + (v55 & 0xFFFFFFFF0) + 8) >> 5) & 0xFFFFFFFFFLL)
              + *(unint64_t *)((char *)&self->_blocks->var0 + (v55 & 0xFFFFFFFF0)) >= location + length))
          {
            goto LABEL_14;
          }
        }
        else
        {
          v50 = v48 - v46;
          if ((_DWORD)v48 != (_DWORD)v46)
          {
            do
            {
              v51 = v50 >> 1;
              v49 = &p_var0[2 * v51];
              if (*v49 <= location)
              {
                if (((p_var0[2 * v51 + 1] >> 5) & 0xFFFFFFFFFLL) + *v49 > location)
                  goto LABEL_67;
                p_var0 = v49 + 2;
                LODWORD(v51) = --v50 >> 1;
              }
              v4 = 0;
              v8 = v50 >= 2;
              v50 = v51;
            }
            while (v8);
            goto LABEL_71;
          }
        }
      }
    }
LABEL_70:
    v4 = 0;
    goto LABEL_71;
  }
  do
  {
    v52 = v36 >> 1;
    v49 = &v41[v52].var0;
    if (*v49 <= location)
    {
      if (((*((_QWORD *)&v41[v52] + 1) >> 5) & 0xFFFFFFFFFLL) + *v49 > location)
        goto LABEL_67;
      v41 = (_VMUBlockNode *)(v49 + 2);
      LODWORD(v52) = --v36 >> 1;
    }
    v4 = 0;
    v8 = v36 >= 2;
    v36 = v52;
  }
  while (v8);
LABEL_71:

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
  v7[2] = __53__VMUTaskMemoryScanner_enumerateReferencesWithBlock___block_invoke;
  v7[3] = &unk_1E4E01028;
  v9 = v15;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v10 = &v11;
  -[VMUTaskMemoryScanner scanNodesWithReferenceRecorder:](self, "scanNodesWithReferenceRecorder:", v7);
  LODWORD(self) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v15, 8);

  return self;
}

uint64_t __53__VMUTaskMemoryScanner_enumerateReferencesWithBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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

- (NSDictionary)ledger
{
  return -[VMUVMRegionIdentifier ledger](self->_regionIdentifier, "ledger");
}

- (unint64_t)ledgerValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v6 = a3;
  -[VMUTaskMemoryScanner ledger](self, "ledger");
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

- (BOOL)mallocEnumerationShouldFail
{
  return self->_mallocEnumerationShouldFail;
}

- (void)setMallocEnumerationShouldFail:(BOOL)a3
{
  self->_mallocEnumerationShouldFail = a3;
}

- (_VMURegionNode)regions
{
  return self->_regions;
}

- (_VMUBlockNode)blocks
{
  uint64_t v0;

  return *(_VMUBlockNode **)(v0 + 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanOverlay, 0);
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
  _os_log_error_impl(&dword_1A4D79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "-[VMUTaskMemoryScanner _initWithTask:options:]: region identifier detected no regions, so returning nil VMUTaskMemoryScanner", v0, 2u);
}

void __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, mach_error_t error_value)
{
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  mach_error_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 208) + 24 * a2 + 8))
    v4 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)a1 + 208) + 24 * a2 + 8);
  else
    v4 = CFSTR("UNKNOWN");
  v5 = 138412802;
  v6 = v4;
  v7 = 2080;
  v8 = mach_error_string(error_value);
  v9 = 1024;
  v10 = error_value;
  _os_log_error_impl(&dword_1A4D79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "error: malloc enumeration of zone \"%@\" failed to get full information about malloc metadata and/or allocations with the error \"%s (%d)\". It is likely that the target was suspended while malloc metadata was being modified.", (uint8_t *)&v5, 0x1Cu);
}

@end
