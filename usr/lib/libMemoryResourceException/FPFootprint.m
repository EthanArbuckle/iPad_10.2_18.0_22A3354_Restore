@implementation FPFootprint

+ (BOOL)breakDownPhysFootprint
{
  int v2;
  size_t v4;
  int v5;

  v2 = byte_253D9A9F0;
  if (byte_253D9A9F0 == 2)
  {
    v5 = 0;
    v4 = 4;
    if (sysctlbyname("vm.self_region_footprint", &v5, &v4, 0, 0) && *__error() != 2)
    {
      perror("Unable to retrieve status of physical footprint data collection");
      v5 = 0;
    }
    v2 = v5 != 0;
    byte_253D9A9F0 = v5 != 0;
  }
  return v2 == 1;
}

+ (void)setBreakDownPhysFootprint:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (sysctlbyname("vm.self_region_footprint", 0, 0, &v3, 4uLL) && *__error() != 2)
    perror("Unable to configure physical footprint data collection");
  byte_253D9A9F0 = 2;
}

+ (int)vmRegionInfoFlags
{
  size_t v3;
  int v4;

  v4 = 0;
  v3 = 4;
  if (sysctlbyname("vm.self_region_info_flags", &v4, &v3, 0, 0) && *__error() != 2)
    perror("Unable to retrieve current VM region info flags");
  return v4;
}

+ (void)setVmRegionInfoFlags:(int)a3
{
  int v3;

  v3 = a3;
  if (sysctlbyname("vm.self_region_info_flags", 0, 0, &v3, 4uLL))
  {
    if (*__error() != 2)
      perror("Unable to configure VM region info flags");
  }
}

+ (BOOL)isSharingAnalysisDisabled
{
  return byte_253D9AAF0;
}

+ (void)setSharingAnalysisDisabled:(BOOL)a3
{
  byte_253D9AAF0 = a3;
}

- (FPFootprint)initWithProcesses:(id)a3
{
  id v5;
  FPFootprint *v6;
  FPFootprint *v7;
  NSMutableArray *v8;
  NSMutableArray *outputFormatters;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPFootprint;
  v6 = -[FPFootprint init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_processes, a3);
    v7->_earlyExit = 0;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    outputFormatters = v7->_outputFormatters;
    v7->_outputFormatters = v8;

    v7->_qualityOfService = 17;
    v7->_allPIDsIOSurfaceDescriptionsLock._os_unfair_lock_opaque = 0;
    v7->_allPIDsIOAccelMemoryInfosLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  __CFDictionary *memoryObjects;
  NSMutableDictionary *sharedCacheMemoryObjectsTable;
  __CFDictionary *textMemoryObjects;
  __CFDictionary *linkeditMemoryObjects;
  objc_super v7;

  memoryObjects = self->_memoryObjects;
  if (memoryObjects)
    CFRelease(memoryObjects);
  sharedCacheMemoryObjectsTable = self->_sharedCacheMemoryObjectsTable;
  self->_sharedCacheMemoryObjectsTable = 0;

  textMemoryObjects = self->_textMemoryObjects;
  if (textMemoryObjects)
    CFRelease(textMemoryObjects);
  linkeditMemoryObjects = self->_linkeditMemoryObjects;
  if (linkeditMemoryObjects)
    CFRelease(linkeditMemoryObjects);
  v7.receiver = self;
  v7.super_class = (Class)FPFootprint;
  -[FPFootprint dealloc](&v7, sel_dealloc);
}

+ (id)installCancelHandler:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  v4 = dispatch_source_create(MEMORY[0x24BDACA08], 2uLL, 0, 0);
  dispatch_source_set_event_handler(v4, v3);

  signal(2, (void (__cdecl *)(int))1);
  dispatch_resume(v4);
  return v4;
}

- (void)cancel
{
  self->_earlyExit = 1;
}

- (BOOL)gatherData
{
  return -[FPFootprint gatherData:](self, "gatherData:", 1);
}

- (BOOL)gatherData:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  FPTime *v10;
  FPTime *gatherStartTime;
  size_t v12;
  id v13;
  void *v14;
  FPTime *v15;
  FPTime *gatherEndTime;
  char v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void *v22;
  FPFootprint *v23;
  id v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v5, (dispatch_qos_class_t)self->_qualityOfService, 0);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = dispatch_queue_create("com.apple.footprint.gatherdata", v6);
  -[FPFootprint processes](self, "processes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  objc_msgSend(v8, "sortedArrayUsingComparator:", &unk_24CFC9328);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[FPTime now](FPTime, "now");
  v10 = (FPTime *)objc_claimAutoreleasedReturnValue();
  gatherStartTime = self->_gatherStartTime;
  self->_gatherStartTime = v10;

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v12 = objc_msgSend(v9, "count");
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = sub_21345EE8C;
  v22 = &unk_24CFC9290;
  v23 = self;
  v25 = &v27;
  v13 = v9;
  v24 = v13;
  v26 = a3;
  dispatch_apply(v12, v7, &v19);
  if (*((_BYTE *)v28 + 24))
  {
    objc_msgSend(v13, "lastObject", v19, v20, v21, v22, v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_addGlobalError:", CFSTR("Footprint exited early due to SIGINT and did not finish gathering all data"));

  }
  +[FPTime now](FPTime, "now", v19, v20, v21, v22, v23);
  v15 = (FPTime *)objc_claimAutoreleasedReturnValue();
  gatherEndTime = self->_gatherEndTime;
  self->_gatherEndTime = v15;

  v17 = *((_BYTE *)v28 + 24);
  _Block_object_dispose(&v27, 8);

  return v17;
}

- (void)analyzeData
{
  NSMutableDictionary *v3;
  NSMutableDictionary *pidToFootprint;
  const __CFAllocator *v5;
  NSUInteger v6;
  const CFDictionaryValueCallBacks *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *sharedCacheMemoryObjectsTable;
  NSArray *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  CFMutableDictionaryRef Mutable;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const __CFDictionary *linkeditMemoryObjects;
  const void *v27;
  int v28;
  int v29;
  void *v30;
  FPMemoryObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFDictionary *textMemoryObjects;
  __CFDictionary *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  __CFArray *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  const void *v57;
  void *v58;
  uint64_t v59;
  void *m;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t n;
  void *v69;
  uint64_t v70;
  id v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t ii;
  void *v78;
  uint64_t v79;
  void *v80;
  NSMutableDictionary *v81;
  void *v82;
  NSArray *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const __CFAllocator *allocator;
  uint64_t v90;
  void *context;
  void *contexta;
  const __CFDictionary *v93;
  uint64_t v94;
  id v95;
  id v96;
  _BOOL4 obj;
  id obja;
  id objb;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  FPFootprint *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD v125[3];
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x24BDAC8D0];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  pidToFootprint = self->_pidToFootprint;
  self->_pidToFootprint = v3;

  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v6 = -[NSArray count](self->_processes, "count");
  v7 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  self->_memoryObjects = CFDictionaryCreateMutable(v5, 100 * v6, &stru_24CFC92B0, MEMORY[0x24BDBD6B0]);
  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  sharedCacheMemoryObjectsTable = self->_sharedCacheMemoryObjectsTable;
  self->_sharedCacheMemoryObjectsTable = v8;

  self->_textMemoryObjects = CFDictionaryCreateMutable(v5, 2 * -[NSArray count](self->_processes, "count"), &stru_24CFC92B0, v7);
  allocator = v5;
  self->_linkeditMemoryObjects = CFDictionaryCreateMutable(v5, 2 * -[NSArray count](self->_processes, "count"), &stru_24CFC92B0, v7);
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v103 = self;
  v10 = self->_processes;
  v84 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
  if (v84)
  {
    v85 = *(_QWORD *)v105;
    v83 = v10;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v105 != v85)
          objc_enumerationMutation(v10);
        v12 = *(id *)(*((_QWORD *)&v104 + 1) + 8 * v11);
        obj = +[FPFootprint breakDownPhysFootprint](FPFootprint, "breakDownPhysFootprint");
        v88 = objc_msgSend(v12, "pageSize");
        v87 = *MEMORY[0x24BDB03A8];
        v95 = v12;
        objc_msgSend(v12, "sharedCache");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        context = (void *)objc_msgSend(v13, "baseAddress");
        v86 = v11;
        if (v13)
        {
          v14 = v103->_sharedCacheMemoryObjectsTable;
          objc_msgSend(v13, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v93 = (const __CFDictionary *)v16;
          if (!v16)
          {
            Mutable = CFDictionaryCreateMutable(allocator, 0, &stru_24CFC92B0, MEMORY[0x24BDBD6B0]);
            v18 = v103->_sharedCacheMemoryObjectsTable;
            objc_msgSend(v13, "uuid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", Mutable, v19);

            v93 = Mutable;
          }
        }
        else
        {
          v93 = 0;
        }
        v128 = 0u;
        v129 = 0u;
        v126 = 0u;
        v127 = 0u;
        objc_msgSend(v95, "memoryRegions", v83);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v127;
          v90 = *(_QWORD *)v127;
          do
          {
            v24 = 0;
            v100 = v22;
            do
            {
              if (*(_QWORD *)v127 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v24);
              if (objc_msgSend(v25, "inSharedCache"))
              {
                if (!v13)
                {
                  _os_assert_log();
                  _os_crash();
                  __break(1u);
                }
                if ((objc_msgSend(v25, "privateSharedCacheRegion") & 1) != 0)
                {
LABEL_25:
                  objc_msgSend(v25, "setMemoryObject:", v25);
                  goto LABEL_44;
                }
                linkeditMemoryObjects = v93;
                v27 = (const void *)(objc_msgSend(v25, "start") - (_QWORD)context + 1);
              }
              else
              {
                v27 = (const void *)objc_msgSend(v25, "object_id");
                v28 = objc_msgSend(v25, "segment");
                if (v28 == 4)
                {
                  linkeditMemoryObjects = v103->_linkeditMemoryObjects;
                }
                else if (v28 == 2)
                {
                  linkeditMemoryObjects = v103->_textMemoryObjects;
                }
                else
                {
                  linkeditMemoryObjects = v103->_memoryObjects;
                }
              }
              if ((unint64_t)v27 + 1 <= 1)
                goto LABEL_25;
              if (obj)
                v29 = objc_msgSend(v25, "ownedExclusivelyByParentProcess");
              else
                v29 = 0;
              CFDictionaryGetValue(linkeditMemoryObjects, v27);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v30)
              {
                if ((v29 & 1) != 0 || (objc_msgSend(v25, "eligibleForProcessView") & 1) != 0 || v88 != v87)
                  v31 = objc_alloc_init(FPMemoryObject);
                else
                  v31 = v25;
                v30 = v31;
                CFDictionaryAddValue(linkeditMemoryObjects, v27, v31);
              }
              v32 = v25;
              if (v30 != v25)
              {
                v33 = v20;
                v34 = v13;
                objc_msgSend(v30, "ensureMemoryObject");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = v35;
                if (v35 == v30)
                {
                  v32 = v30;
                }
                else
                {
                  v32 = v35;

                  CFDictionaryReplaceValue(linkeditMemoryObjects, v27, v32);
                }
                sub_21345B780((uint64_t)v36, v25, v95);
                if (v29)
                  objc_msgSend(v36, "setOwnerPid:", objc_msgSend(v95, "pid"));

                v13 = v34;
                v20 = v33;
                v23 = v90;
              }
              objc_msgSend(v25, "setMemoryObject:", v32);

              v22 = v100;
LABEL_44:
              ++v24;
            }
            while (v22 != v24);
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
          }
          while (v22);
        }

        v11 = v86 + 1;
        v10 = v83;
      }
      while (v86 + 1 != v84);
      v84 = -[NSArray countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
    }
    while (v84);
  }

  contexta = (void *)MEMORY[0x2199B3174]();
  textMemoryObjects = v103->_textMemoryObjects;
  v38 = v103->_linkeditMemoryObjects;
  v125[0] = v103->_memoryObjects;
  v125[1] = textMemoryObjects;
  v125[2] = v38;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v125, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "mutableCopy");

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  -[NSMutableDictionary objectEnumerator](v103->_sharedCacheMemoryObjectsTable, "objectEnumerator");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v117;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v117 != v44)
          objc_enumerationMutation(v41);
        objc_msgSend(v40, "addObject:", *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * i));
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
    }
    while (v43);
  }

  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  obja = v40;
  v46 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v112, &v126, 16);
  if (v46)
  {
    v47 = v46;
    v101 = *(_QWORD *)v113;
    do
    {
      for (j = 0; j != v47; ++j)
      {
        if (*(_QWORD *)v113 != v101)
          objc_enumerationMutation(obja);
        v49 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * j);
        v50 = CFArrayCreateMutable(allocator, 0, 0);
        v51 = (void *)MEMORY[0x2199B3174]();
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v52 = v49;
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v108, &v121, 16);
        if (v53)
        {
          v54 = v53;
          v55 = *(_QWORD *)v109;
          do
          {
            for (k = 0; k != v54; ++k)
            {
              if (*(_QWORD *)v109 != v55)
                objc_enumerationMutation(v52);
              v57 = *(const void **)(*((_QWORD *)&v108 + 1) + 8 * k);
              CFDictionaryGetValue((CFDictionaryRef)v52, v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v58, "finalizeObject") & 1) == 0)
                CFArrayAppendValue(v50, v57);

            }
            v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v108, &v121, 16);
          }
          while (v54);
        }

        objc_autoreleasePoolPop(v51);
        objc_msgSend(v52, "removeObjectsForKeys:", v50);
        if (v50)
          CFRelease(v50);
      }
      v47 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v112, &v126, 16);
    }
    while (v47);
  }

  -[NSMutableDictionary removeAllObjects](v103->_pidToFootprint, "removeAllObjects");
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  sub_21346145C(v103);
  v96 = (id)objc_claimAutoreleasedReturnValue();
  objb = (id)objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v116, &v126, 16);
  if (objb)
  {
    v59 = *(_QWORD *)v117;
    v94 = *(_QWORD *)v117;
    do
    {
      for (m = 0; m != objb; m = (char *)m + 1)
      {
        if (*(_QWORD *)v117 != v59)
          objc_enumerationMutation(v96);
        v61 = (void *)MEMORY[0x24BDD16E0];
        v62 = *(id *)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)m);
        if (+[FPFootprint breakDownPhysFootprint](FPFootprint, "breakDownPhysFootprint"))
        {
          v123 = 0u;
          v124 = 0u;
          v121 = 0u;
          v122 = 0u;
          objc_msgSend(v62, "memoryRegions");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
          if (!v64)
          {
            v66 = 0;
            goto LABEL_101;
          }
          v65 = v64;
          v102 = v61;
          v66 = 0;
          v67 = *(_QWORD *)v122;
          do
          {
            for (n = 0; n != v65; ++n)
            {
              if (*(_QWORD *)v122 != v67)
                objc_enumerationMutation(v63);
              v69 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * n);
              v70 = objc_msgSend(v69, "dirtySize");
              v66 += v70 + objc_msgSend(v69, "swappedSize");
            }
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
          }
          while (v65);
        }
        else
        {
          v102 = v61;
          v71 = objc_alloc(MEMORY[0x24BDBCEF0]);
          objc_msgSend(v62, "memoryRegions");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (void *)objc_msgSend(v71, "initWithCapacity:", objc_msgSend(v72, "count"));

          v123 = 0u;
          v124 = 0u;
          v121 = 0u;
          v122 = 0u;
          objc_msgSend(v62, "memoryRegions");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
          if (v74)
          {
            v75 = v74;
            v66 = 0;
            v76 = *(_QWORD *)v122;
            do
            {
              for (ii = 0; ii != v75; ++ii)
              {
                if (*(_QWORD *)v122 != v76)
                  objc_enumerationMutation(v73);
                objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * ii), "memoryObject");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v63, "containsObject:", v78) & 1) == 0)
                {
                  v79 = objc_msgSend(v78, "dirtySize");
                  v66 += v79 + objc_msgSend(v78, "swappedSize");
                  objc_msgSend(v63, "addObject:", v78);
                }

              }
              v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
            }
            while (v75);
          }
          else
          {
            v66 = 0;
          }

          v59 = v94;
        }
        v61 = v102;
LABEL_101:

        objc_msgSend(v61, "numberWithUnsignedLongLong:", v66);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v103->_pidToFootprint;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v62, "pid"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v81, "setObject:forKeyedSubscript:", v80, v82);

      }
      objb = (id)objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v116, &v126, 16);
    }
    while (objb);
  }

  objc_autoreleasePoolPop(contexta);
}

- (void)addOutputFormatter:(id)a3
{
  -[NSMutableArray addObject:](self->_outputFormatters, "addObject:", a3);
}

- (void)printOutputVerbose:(BOOL)a3 summarize:(BOOL)a4 noCategories:(BOOL)a5
{
  _BOOL4 v5;
  FPFootprint *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t ii;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t jj;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t kk;
  void *v65;
  char v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t mm;
  uint64_t v78;
  void *v79;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t nn;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  char *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t i1;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  const void *v103;
  void *v104;
  const void *v105;
  const void *v106;
  NSMutableArray *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t i2;
  void *v112;
  void *v113;
  char *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  NSMutableDictionary *pidToFootprint;
  void *v123;
  uint64_t v124;
  NSMutableArray *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t i3;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  char *v134;
  _QWORD *v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  unint64_t v142;
  void *v143;
  id v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t i4;
  void *v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  NSMutableArray *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t i5;
  void *v159;
  NSMutableArray *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t i6;
  void *v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  void *v173;
  id v174;
  void *v175;
  void *v176;
  void *v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t i7;
  uint64_t v183;
  id v184;
  id v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t i8;
  void *v190;
  void *v191;
  NSMutableArray *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t i9;
  _BOOL8 v197;
  NSMutableArray *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  id v202;
  uint64_t i10;
  void *v204;
  void *v205;
  void *context;
  void *v207;
  id v208;
  id v209;
  void *v210;
  uint64_t v211;
  _BOOL4 v212;
  uint64_t v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  id v220;
  char *v221;
  _BOOL4 v222;
  id v223;
  id v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  id v228;
  id v229;
  uint64_t v230;
  id obj;
  char *obja;
  id objb;
  id objc;
  id v235;
  NSArray *v236;
  char *v237;
  char *v238;
  id v239;
  id v240;
  id v241;
  id v242;
  id v243;
  id v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  _QWORD v313[4];
  id v314;
  id v315;
  id v316;
  id v317;
  void *v318;
  char v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  _BYTE v328[128];
  _BYTE v329[128];
  _BYTE v330[128];
  _BYTE v331[128];
  _BYTE v332[128];
  _BYTE v333[128];
  _BYTE v334[128];
  _BYTE v335[128];
  _BYTE v336[128];
  _BYTE v337[128];
  _BYTE v338[128];
  _BYTE v339[128];
  _BYTE v340[128];
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  char v357[128];
  __int128 v358;
  __int128 v359;
  __int128 v360;
  uint64_t v361;

  v212 = a5;
  v222 = a4;
  v5 = a3;
  v6 = self;
  v361 = *MEMORY[0x24BDAC8D0];
  sub_21346145C(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    *(_QWORD *)&v358 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v358 + 1) = 3221225472;
    *(_QWORD *)&v359 = sub_213461B40;
    *((_QWORD *)&v359 + 1) = &unk_24CFC9350;
    *(_QWORD *)&v360 = v6;
    objc_msgSend(v7, "sortedArrayUsingComparator:", &v358);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  v295 = 0u;
  v296 = 0u;
  v293 = 0u;
  v294 = 0u;
  v10 = v6->_outputFormatters;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v293, v340, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v294;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v294 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v293 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "startAtTime:", v6->_gatherStartTime);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v293, v340, 16);
    }
    while (v12);
  }

  v227 = (uint64_t)v6;
  if (v5)
  {
    v16 = v9;
    if (v6)
    {
      v241 = (id)objc_opt_new();
      v349 = 0u;
      v350 = 0u;
      v351 = 0u;
      v352 = 0u;
      v17 = v6->_outputFormatters;
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v349, &v358, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v350;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v350 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v349 + 1) + 8 * j);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v241, "addObject:", v22);
          }
          v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v349, &v358, 16);
        }
        while (v19);
      }

      if (objc_msgSend(v241, "count"))
      {
        v217 = v9;
        v348 = 0u;
        v347 = 0u;
        v346 = 0u;
        v345 = 0u;
        v228 = v16;
        obj = v16;
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v345, v357, 16);
        if (v23)
        {
          v24 = v23;
          v235 = *(id *)v346;
          do
          {
            for (k = 0; k != v24; ++k)
            {
              if (*(id *)v346 != v235)
                objc_enumerationMutation(obj);
              v26 = *(void **)(*((_QWORD *)&v345 + 1) + 8 * k);
              v341 = 0u;
              v342 = 0u;
              v343 = 0u;
              v344 = 0u;
              v27 = v241;
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v341, &v353, 16);
              if (v28)
              {
                v29 = v28;
                v30 = *(_QWORD *)v342;
                do
                {
                  for (m = 0; m != v29; ++m)
                  {
                    if (*(_QWORD *)v342 != v30)
                      objc_enumerationMutation(v27);
                    v32 = *(void **)(*((_QWORD *)&v341 + 1) + 8 * m);
                    v33 = (void *)MEMORY[0x2199B3174]();
                    objc_msgSend(v26, "memoryRegions");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "printVmmapLikeOutputForProcess:regions:", v26, v34);

                    objc_autoreleasePoolPop(v33);
                  }
                  v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v341, &v353, 16);
                }
                while (v29);
              }

            }
            v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v345, v357, 16);
          }
          while (v24);
        }

        v6 = (FPFootprint *)v227;
        v16 = v228;
        v9 = v217;
      }

    }
  }
  v216 = (void *)objc_opt_new();
  v215 = (void *)objc_opt_new();
  v207 = 0;
  if ((unint64_t)objc_msgSend(v9, "count") >= 2 && !v212)
  {
    v35 = v9;
    if (v6)
    {
      v36 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v353 = 0u;
      v354 = 0u;
      v355 = 0u;
      v356 = 0u;
      v37 = v6->_processes;
      v38 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v353, &v358, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v354;
        do
        {
          for (n = 0; n != v39; ++n)
          {
            if (*(_QWORD *)v354 != v40)
              objc_enumerationMutation(v37);
            v42 = *(void **)(*((_QWORD *)&v353 + 1) + 8 * n);
            objc_msgSend(v42, "sharedCache");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43)
            {
              objc_msgSend(v36, "objectForKeyedSubscript:", v43);
              v44 = (id)objc_claimAutoreleasedReturnValue();
              if (!v44)
              {
                v44 = -[FPProcessGroupMinimal initUniqueProcessGroup]([FPProcessGroupMinimal alloc], "initUniqueProcessGroup");
                objc_msgSend(v36, "setObject:forKeyedSubscript:", v44, v43);
              }
              objc_msgSend(v44, "addProcess:", v42);

            }
          }
          v39 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v353, &v358, 16);
        }
        while (v39);
      }

      v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v36, "count"));
      v349 = 0u;
      v350 = 0u;
      v351 = 0u;
      v352 = 0u;
      v46 = v36;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v349, v357, 16);
      v9 = v35;
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v350;
        do
        {
          for (ii = 0; ii != v48; ++ii)
          {
            if (*(_QWORD *)v350 != v49)
              objc_enumerationMutation(v46);
            v51 = *(_QWORD *)(*((_QWORD *)&v349 + 1) + 8 * ii);
            objc_msgSend(v46, "objectForKeyedSubscript:", v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            sub_213462EC0((uint64_t)v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setObject:forKeyedSubscript:", v53, v51);

          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v349, v357, 16);
        }
        while (v48);
      }
      v207 = v45;

    }
    else
    {
      v207 = 0;
    }
    v6 = (FPFootprint *)v227;
  }
  if (v212)
  {
    v208 = 0;
  }
  else
  {
    v229 = v207;
    v218 = v9;
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      sub_21346145C(v6);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v242 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v55, "count"));
      v324 = 0u;
      v325 = 0u;
      v326 = 0u;
      v327 = 0u;
      v223 = v55;
      v56 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v324, &v358, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v325;
        do
        {
          for (jj = 0; jj != v57; ++jj)
          {
            if (*(_QWORD *)v325 != v58)
              objc_enumerationMutation(v223);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&v324 + 1) + 8 * jj), "pid"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v242, "addObject:", v60);

          }
          v57 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v324, &v358, 16);
        }
        while (v57);
      }

      v323 = 0u;
      v322 = 0u;
      v321 = 0u;
      v320 = 0u;
      v236 = v6->_processes;
      v61 = -[NSArray countByEnumeratingWithState:objects:count:](v236, "countByEnumeratingWithState:objects:count:", &v320, v357, 16);
      if (v61)
      {
        v62 = v61;
        v63 = *(_QWORD *)v321;
        do
        {
          for (kk = 0; kk != v62; ++kk)
          {
            if (*(_QWORD *)v321 != v63)
              objc_enumerationMutation(v236);
            v65 = *(void **)(*((_QWORD *)&v320 + 1) + 8 * kk);
            v66 = objc_msgSend(v65, "hiddenFromDisplay");
            objc_msgSend(v65, "sharedCache");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if (v67)
            {
              v68 = v229;
              objc_msgSend(v229, "objectForKeyedSubscript:", v67);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v69 = 0;
              v68 = v229;
            }
            objc_msgSend(v65, "memoryRegions");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v313[0] = MEMORY[0x24BDAC760];
            v313[1] = 3221225472;
            v313[2] = sub_21346197C;
            v313[3] = &unk_24CFC92E8;
            v319 = v66;
            v314 = v242;
            v315 = v68;
            v316 = v69;
            v317 = v54;
            v318 = v65;
            v71 = v69;
            objc_msgSend(v70, "fp_enumerateObjectsWithBatchSize:usingBlock:", 256, v313);

          }
          v62 = -[NSArray countByEnumeratingWithState:objects:count:](v236, "countByEnumeratingWithState:objects:count:", &v320, v357, 16);
        }
        while (v62);
      }

      v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 3 * objc_msgSend(v242, "count"));
      v309 = 0u;
      v310 = 0u;
      v311 = 0u;
      v312 = 0u;
      objc_msgSend(v54, "allKeys");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v309, &v353, 16);
      if (v74)
      {
        v75 = v74;
        v76 = *(_QWORD *)v310;
        do
        {
          for (mm = 0; mm != v75; ++mm)
          {
            if (*(_QWORD *)v310 != v76)
              objc_enumerationMutation(v73);
            v78 = *(_QWORD *)(*((_QWORD *)&v309 + 1) + 8 * mm);
            objc_msgSend(v54, "objectForKeyedSubscript:", v78);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "member:", v79);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v80)
            {
              sub_213462EC0((uint64_t)v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "addObject:", v80);
            }
            objc_msgSend(v54, "setObject:forKeyedSubscript:", v80, v78);

          }
          v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v309, &v353, 16);
        }
        while (v75);
      }

      v308 = 0u;
      v307 = 0u;
      v306 = 0u;
      v305 = 0u;
      v81 = v54;
      v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v305, &v349, 16);
      if (v82)
      {
        v83 = v82;
        v84 = *(_QWORD *)v306;
        do
        {
          for (nn = 0; nn != v83; ++nn)
          {
            if (*(_QWORD *)v306 != v84)
              objc_enumerationMutation(v81);
            v86 = *(void **)(*((_QWORD *)&v305 + 1) + 8 * nn);
            objc_msgSend(v81, "objectForKeyedSubscript:", v86);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "nonretainedObjectValue");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            sub_2134630BC((uint64_t)v87, v88);

          }
          v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v305, &v349, 16);
        }
        while (v83);
      }

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v301 = 0u;
      v302 = 0u;
      v303 = 0u;
      v304 = 0u;
      v220 = v72;
      obja = (char *)objc_msgSend(v220, "countByEnumeratingWithState:objects:count:", &v301, &v345, 16);
      if (obja)
      {
        v225 = *(_QWORD *)v302;
        do
        {
          v90 = 0;
          do
          {
            if (*(_QWORD *)v302 != v225)
              objc_enumerationMutation(v220);
            v237 = v90;
            v91 = *(void **)(*((_QWORD *)&v301 + 1) + 8 * (_QWORD)v90);
            objc_msgSend(v91, "processes");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = objc_msgSend(v92, "count");

            v300 = 0u;
            v299 = 0u;
            v297 = 0u;
            v298 = 0u;
            objc_msgSend(v91, "processes");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v297, &v341, 16);
            if (v95)
            {
              v96 = v95;
              v97 = *(_QWORD *)v298;
              do
              {
                for (i1 = 0; i1 != v96; ++i1)
                {
                  if (*(_QWORD *)v298 != v97)
                    objc_enumerationMutation(v94);
                  v99 = *(void **)(*((_QWORD *)&v297 + 1) + 8 * i1);
                  objc_msgSend(v99, "asNumber");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v89, "objectForKeyedSubscript:", v100);
                  v101 = (id)objc_claimAutoreleasedReturnValue();

                  if (!v101)
                  {
                    v101 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                    objc_msgSend(v99, "asNumber");
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v89, "setObject:forKeyedSubscript:", v101, v102);

                  }
                  if (v93 == 1)
                    objc_msgSend(v101, "insertObject:atIndex:", v91, 0);
                  else
                    objc_msgSend(v101, "addObject:", v91);

                }
                v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v297, &v341, 16);
              }
              while (v96);
            }

            v90 = v237 + 1;
          }
          while (v237 + 1 != obja);
          obja = (char *)objc_msgSend(v220, "countByEnumeratingWithState:objects:count:", &v301, &v345, 16);
        }
        while (obja);
      }

    }
    else
    {
      v89 = 0;
    }

    v208 = v89;
    v6 = (FPFootprint *)v227;
    v103 = *(const void **)(v227 + 56);
    v9 = v218;
    if (v103)
    {
      CFRelease(v103);
      *(_QWORD *)(v227 + 56) = 0;
    }
    v104 = *(void **)(v227 + 64);
    *(_QWORD *)(v227 + 64) = 0;

    v105 = *(const void **)(v227 + 72);
    if (v105)
    {
      CFRelease(v105);
      *(_QWORD *)(v227 + 72) = 0;
    }
    v106 = *(const void **)(v227 + 80);
    if (v106)
    {
      CFRelease(v106);
      *(_QWORD *)(v227 + 80) = 0;
    }
  }
  context = (void *)MEMORY[0x2199B3174]();
  v289 = 0u;
  v290 = 0u;
  v291 = 0u;
  v292 = 0u;
  v107 = v6->_outputFormatters;
  v108 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v107, "countByEnumeratingWithState:objects:count:", &v289, v339, 16);
  if (v108)
  {
    v109 = v108;
    v110 = *(_QWORD *)v290;
    do
    {
      for (i2 = 0; i2 != v109; ++i2)
      {
        if (*(_QWORD *)v290 != v110)
          objc_enumerationMutation(v107);
        v112 = *(void **)(*((_QWORD *)&v289 + 1) + 8 * i2);
        v113 = (void *)MEMORY[0x2199B3174]();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v112, "printHeader");
        objc_autoreleasePoolPop(v113);
      }
      v109 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v107, "countByEnumeratingWithState:objects:count:", &v289, v339, 16);
    }
    while (v109);
  }

  v287 = 0u;
  v288 = 0u;
  v285 = 0u;
  v286 = 0u;
  v209 = v9;
  v213 = objc_msgSend(v209, "countByEnumeratingWithState:objects:count:", &v285, v338, 16);
  if (v213)
  {
    v211 = *(_QWORD *)v286;
    v214 = (void *)MEMORY[0x24BDBD1B8];
    do
    {
      v114 = 0;
      do
      {
        if (*(_QWORD *)v286 != v211)
          objc_enumerationMutation(v209);
        v115 = *(void **)(*((_QWORD *)&v285 + 1) + 8 * (_QWORD)v114);
        objc_msgSend(v115, "errors");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v243 = (id)objc_msgSend(v116, "count");

        objc_msgSend(v115, "warnings");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = objc_msgSend(v117, "count");

        if (v118)
          objc_msgSend(v215, "addObject:", v115);
        v221 = v114;
        if (v243)
        {
          objc_msgSend(v216, "addObject:", v115);
        }
        else
        {
          objc_msgSend(v115, "auxData");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = v119;
          if (v119)
          {
            objc_msgSend(v119, "fp_mergeWithData:", v214);
            v121 = objc_claimAutoreleasedReturnValue();

            v214 = (void *)v121;
          }

        }
        pidToFootprint = v6->_pidToFootprint;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v115, "pid"));
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](pidToFootprint, "objectForKeyedSubscript:", v123);
        v124 = objc_claimAutoreleasedReturnValue();

        v283 = 0u;
        v284 = 0u;
        v281 = 0u;
        v282 = 0u;
        v125 = v6->_outputFormatters;
        v126 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v281, v337, 16);
        if (v126)
        {
          v127 = v126;
          v128 = *(_QWORD *)v282;
          do
          {
            for (i3 = 0; i3 != v127; ++i3)
            {
              if (*(_QWORD *)v282 != v128)
                objc_enumerationMutation(v125);
              v130 = *(void **)(*((_QWORD *)&v281 + 1) + 8 * i3);
              v131 = (void *)MEMORY[0x2199B3174]();
              objc_msgSend(v130, "printProcessHeader:", v115);
              if (!v243)
                objc_msgSend(v130, "printProcessTotal:forProcess:", v124, v115);
              objc_msgSend(v130, "endProcessHeader:", v115);
              objc_autoreleasePoolPop(v131);
            }
            v127 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v281, v337, 16);
          }
          while (v127);
        }
        v219 = (void *)v124;

        if (!v212)
        {
          objc_msgSend(v115, "asNumber");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v208, "objectForKeyedSubscript:", v132);
          v133 = (void *)objc_claimAutoreleasedReturnValue();

          if (v133)
          {
            v275 = 0uLL;
            v276 = 0uLL;
            v273 = 0uLL;
            v274 = 0uLL;
            v210 = v133;
            v224 = v133;
            v230 = objc_msgSend(v224, "countByEnumeratingWithState:objects:count:", &v273, v335, 16);
            if (v230)
            {
              v226 = *(_QWORD *)v274;
              do
              {
                v134 = 0;
                do
                {
                  if (*(_QWORD *)v274 != v226)
                    objc_enumerationMutation(v224);
                  v238 = v134;
                  v135 = *(_QWORD **)(*((_QWORD *)&v273 + 1) + 8 * (_QWORD)v134);
                  sub_2134631C4((uint64_t)v135);
                  v136 = (void *)objc_claimAutoreleasedReturnValue();
                  v359 = 0u;
                  v360 = 0u;
                  v358 = 0u;
                  v357[0] = 0;
                  if (!v136)
                  {
                    if (v135)
                      v137 = (void *)v135[4];
                    else
                      v137 = 0;
                    v138 = v137;
                    v139 = (void *)MEMORY[0x2199B3174]();
                    objc_msgSend(v138, "objectEnumerator");
                    v140 = (void *)objc_claimAutoreleasedReturnValue();
                    sub_2134614CC(v227, v140, v115, v357, v222);
                    v136 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_autoreleasePoolPop(v139);
                    if (!v357[0])
                    {
                      objc_msgSend(v135, "processes");
                      v141 = (void *)objc_claimAutoreleasedReturnValue();
                      v142 = objc_msgSend(v141, "count");

                      if (v142 >= 0x1A)
                      {
                        objc_msgSend(v135, "processes");
                        v143 = (void *)objc_claimAutoreleasedReturnValue();
                        sub_21346314C((uint64_t)v135, v136, objc_msgSend(v143, "count") - 1);

                      }
                    }

                  }
                  if (!v243)
                    sub_21345F974((uint64_t)FPFootprint, v136, (uint64_t)&v358);
                  objb = (id)MEMORY[0x2199B3174]();
                  v269 = 0u;
                  v270 = 0u;
                  v271 = 0u;
                  v272 = 0u;
                  v144 = *(id *)(v227 + 88);
                  v145 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v269, v334, 16);
                  if (v145)
                  {
                    v146 = v145;
                    v147 = *(_QWORD *)v270;
                    do
                    {
                      for (i4 = 0; i4 != v146; ++i4)
                      {
                        if (*(_QWORD *)v270 != v147)
                          objc_enumerationMutation(v144);
                        v149 = *(void **)(*((_QWORD *)&v269 + 1) + 8 * i4);
                        objc_msgSend(v135, "processes");
                        v150 = (void *)objc_claimAutoreleasedReturnValue();
                        v151 = objc_msgSend(v150, "count");

                        if (v151 == 1)
                          objc_msgSend(v149, "printProcessCategories:total:forProcess:", v136, &v358, v115);
                        else
                          objc_msgSend(v149, "printSharedCategories:sharedWith:forProcess:hasProcessView:total:", v136, v135, v115, v357[0] == 2, &v358);
                      }
                      v146 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v269, v334, 16);
                    }
                    while (v146);
                  }

                  objc_autoreleasePoolPop(objb);
                  v134 = v238 + 1;
                }
                while (v238 + 1 != (char *)v230);
                v152 = objc_msgSend(v224, "countByEnumeratingWithState:objects:count:", &v273, v335, 16);
                v230 = v152;
              }
              while (v152);
            }

            v6 = (FPFootprint *)v227;
            v133 = v210;
          }
          else
          {
            v359 = 0uLL;
            v360 = 0uLL;
            v358 = 0uLL;
            v277 = 0uLL;
            v278 = 0uLL;
            v279 = 0uLL;
            v280 = 0uLL;
            v153 = v6->_outputFormatters;
            v154 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v153, "countByEnumeratingWithState:objects:count:", &v277, v336, 16);
            v155 = MEMORY[0x24BDBD1B8];
            if (v154)
            {
              v156 = v154;
              v157 = *(_QWORD *)v278;
              do
              {
                for (i5 = 0; i5 != v156; ++i5)
                {
                  if (*(_QWORD *)v278 != v157)
                    objc_enumerationMutation(v153);
                  objc_msgSend(*(id *)(*((_QWORD *)&v277 + 1) + 8 * i5), "printProcessCategories:total:forProcess:", v155, &v358, v115);
                }
                v156 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v153, "countByEnumeratingWithState:objects:count:", &v277, v336, 16);
              }
              while (v156);
            }

          }
        }
        v159 = (void *)MEMORY[0x2199B3174]();
        v265 = 0u;
        v266 = 0u;
        v267 = 0u;
        v268 = 0u;
        v160 = v6->_outputFormatters;
        v161 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v160, "countByEnumeratingWithState:objects:count:", &v265, v333, 16);
        if (v161)
        {
          v162 = v161;
          v163 = *(_QWORD *)v266;
          do
          {
            for (i6 = 0; i6 != v162; ++i6)
            {
              if (*(_QWORD *)v266 != v163)
                objc_enumerationMutation(v160);
              v165 = *(void **)(*((_QWORD *)&v265 + 1) + 8 * i6);
              objc_msgSend(v115, "auxData");
              v166 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v165, "printProcessAuxData:forProcess:", v166, v115);

            }
            v162 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v160, "countByEnumeratingWithState:objects:count:", &v265, v333, 16);
          }
          while (v162);
        }

        objc_autoreleasePoolPop(v159);
        v114 = v221 + 1;
      }
      while (v221 + 1 != (char *)v213);
      v213 = objc_msgSend(v209, "countByEnumeratingWithState:objects:count:", &v285, v338, 16);
    }
    while (v213);
  }
  else
  {
    v214 = (void *)MEMORY[0x24BDBD1B8];
  }

  objc_autoreleasePoolPop(context);
  objc = (id)MEMORY[0x2199B3174]();
  v261 = 0u;
  v262 = 0u;
  v263 = 0u;
  v264 = 0u;
  v244 = v207;
  v167 = objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v261, v332, 16);
  if (v167)
  {
    v168 = v167;
    v239 = *(id *)v262;
    do
    {
      v169 = 0;
      do
      {
        if (*(id *)v262 != v239)
          objc_enumerationMutation(v244);
        v170 = *(_QWORD *)(*((_QWORD *)&v261 + 1) + 8 * v169);
        objc_msgSend(v244, "objectForKeyedSubscript:", v170);
        v171 = objc_claimAutoreleasedReturnValue();
        v172 = (void *)v171;
        if (v171)
          v173 = *(void **)(v171 + 32);
        else
          v173 = 0;
        v174 = v173;
        v175 = (void *)MEMORY[0x2199B3174]();
        objc_msgSend(v174, "objectEnumerator");
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        sub_2134614CC(v227, v176, 0, 0, v222);
        v177 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v175);
        v359 = 0u;
        v360 = 0u;
        v358 = 0u;
        sub_21345F974((uint64_t)FPFootprint, v177, (uint64_t)&v358);
        v259 = 0u;
        v260 = 0u;
        v257 = 0u;
        v258 = 0u;
        v178 = *(id *)(v227 + 88);
        v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v257, v331, 16);
        if (v179)
        {
          v180 = v179;
          v181 = *(_QWORD *)v258;
          do
          {
            for (i7 = 0; i7 != v180; ++i7)
            {
              if (*(_QWORD *)v258 != v181)
                objc_enumerationMutation(v178);
              objc_msgSend(*(id *)(*((_QWORD *)&v257 + 1) + 8 * i7), "printSharedCache:categories:sharedWith:total:", v170, v177, v172, &v358);
            }
            v180 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v257, v331, 16);
          }
          while (v180);
        }

        ++v169;
        v6 = (FPFootprint *)v227;
      }
      while (v169 != v168);
      v183 = objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v261, v332, 16);
      v168 = v183;
    }
    while (v183);
  }

  objc_autoreleasePoolPop(objc);
  v184 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v253 = 0u;
  v254 = 0u;
  v255 = 0u;
  v256 = 0u;
  v185 = v209;
  v186 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v253, v330, 16);
  if (v186)
  {
    v187 = v186;
    v188 = *(_QWORD *)v254;
    do
    {
      for (i8 = 0; i8 != v187; ++i8)
      {
        if (*(_QWORD *)v254 != v188)
          objc_enumerationMutation(v185);
        objc_msgSend(*(id *)(*((_QWORD *)&v253 + 1) + 8 * i8), "globalErrors");
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v184, "addObjectsFromArray:", v190);

      }
      v187 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v253, v330, 16);
    }
    while (v187);
  }

  v191 = (void *)MEMORY[0x2199B3174]();
  v249 = 0u;
  v250 = 0u;
  v251 = 0u;
  v252 = 0u;
  v192 = v6->_outputFormatters;
  v193 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v192, "countByEnumeratingWithState:objects:count:", &v249, v329, 16);
  if (v193)
  {
    v194 = v193;
    v195 = *(_QWORD *)v250;
    do
    {
      for (i9 = 0; i9 != v194; ++i9)
      {
        if (*(_QWORD *)v250 != v195)
          objc_enumerationMutation(v192);
        objc_msgSend(*(id *)(*((_QWORD *)&v249 + 1) + 8 * i9), "printProcessesWithWarnings:processesWithErrors:globalErrors:", v215, v216, v184);
      }
      v194 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v192, "countByEnumeratingWithState:objects:count:", &v249, v329, 16);
    }
    while (v194);
  }

  objc_autoreleasePoolPop(v191);
  v359 = 0u;
  v360 = 0u;
  v358 = 0u;
  sub_2134616F0(v6, v222);
  v240 = (id)objc_claimAutoreleasedReturnValue();
  sub_21345F974((uint64_t)FPFootprint, v240, (uint64_t)&v358);
  if (objc_msgSend(v184, "count"))
    v197 = 1;
  else
    v197 = objc_msgSend(v216, "count") != 0;
  v247 = 0u;
  v248 = 0u;
  v245 = 0u;
  v246 = 0u;
  v198 = v6->_outputFormatters;
  v199 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v198, "countByEnumeratingWithState:objects:count:", &v245, v328, 16);
  if (v199)
  {
    v200 = v199;
    v201 = *(_QWORD *)v246;
    if (v212)
      v202 = 0;
    else
      v202 = v240;
    do
    {
      for (i10 = 0; i10 != v200; ++i10)
      {
        if (*(_QWORD *)v246 != v201)
          objc_enumerationMutation(v198);
        v204 = *(void **)(*((_QWORD *)&v245 + 1) + 8 * i10);
        v205 = (void *)MEMORY[0x2199B3174]();
        objc_msgSend(v204, "printSummaryCategories:total:hadErrors:", v202, &v358, v197);
        objc_msgSend(v204, "printGlobalAuxData:", v214);
        objc_msgSend(v204, "endAtTime:", *(_QWORD *)(v227 + 112));
        objc_autoreleasePoolPop(v205);
      }
      v200 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v198, "countByEnumeratingWithState:objects:count:", &v245, v328, 16);
    }
    while (v200);
  }

}

- (id)ioSurfaceExtendedInfoDetailsAtAddress:(unint64_t)a3 for:(int)a4
{
  uint64_t v4;
  os_unfair_lock_s *p_allPIDsIOSurfaceDescriptionsLock;
  NSDictionary *allPIDsIOSurfaceDescriptions;
  NSDictionary *v9;
  NSDictionary *v10;
  void *v11;
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
  void *v23;
  _QWORD v25[5];
  _QWORD v26[4];
  _QWORD v27[5];

  v4 = *(_QWORD *)&a4;
  v27[4] = *MEMORY[0x24BDAC8D0];
  p_allPIDsIOSurfaceDescriptionsLock = &self->_allPIDsIOSurfaceDescriptionsLock;
  os_unfair_lock_lock(&self->_allPIDsIOSurfaceDescriptionsLock);
  allPIDsIOSurfaceDescriptions = self->_allPIDsIOSurfaceDescriptions;
  if (!allPIDsIOSurfaceDescriptions)
  {
    objc_msgSend(MEMORY[0x24BDD8DF0], "surfaceDescriptions");
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v10 = self->_allPIDsIOSurfaceDescriptions;
    self->_allPIDsIOSurfaceDescriptions = v9;

    allPIDsIOSurfaceDescriptions = self->_allPIDsIOSurfaceDescriptions;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](allPIDsIOSurfaceDescriptions, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_allPIDsIOSurfaceDescriptionsLock);
  if (v12)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_213461F00;
    v25[3] = &unk_24CFC9398;
    v25[4] = a3;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "filteredArrayUsingPredicate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v26[0] = CFSTR("surfaceID");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v15, "surfaceID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v16;
      v26[1] = CFSTR("PixelFormat");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v15, "pixelFormat"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v17;
      v26[2] = CFSTR("Width");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v15, "width"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v18;
      v26[3] = CFSTR("Height");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v15, "height"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[3] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "mutableCopy");

      objc_msgSend(v15, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v15, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v23, CFSTR("Name"));

      }
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)ioAccelMemoryInfoDetailsAtAddress:(unint64_t)a3 for:(int)a4 error:(id *)a5
{
  uint64_t v6;
  dispatch_semaphore_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  NSDictionary *allPIDsIOAccelMemoryInfos;
  NSDictionary *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  NSObject *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;
  _QWORD v69[3];

  v6 = *(_QWORD *)&a4;
  v69[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  if (!objc_opt_class())
    return 0;
  os_unfair_lock_lock(&self->_allPIDsIOAccelMemoryInfosLock);
  if (!self->_allPIDsIOAccelMemoryInfos)
  {
    v60 = 0;
    v61 = &v60;
    v62 = 0x3032000000;
    v63 = sub_213462590;
    v64 = sub_2134625A0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v65 = (id)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0;
    v9 = dispatch_semaphore_create(0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.footprint.ioaccelmemoryinfo", v10);

    v12 = (void *)MEMORY[0x24BE51398];
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = sub_2134625A8;
    v52[3] = &unk_24CFC93F8;
    v54 = &v56;
    v55 = &v60;
    v13 = v9;
    v53 = v13;
    objc_msgSend(v12, "collectDataWithCompletionQueue:completionBlock:", v11, v52);
    v14 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v13, v14);
    if (a5 && !*((_BYTE *)v57 + 24) && !*a5)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v68 = *MEMORY[0x24BDD0FC8];
      v69[0] = CFSTR("Timed out waiting to fetch IOAccelMemory region infos");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("FootprintErrorDomain"), 1, v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = (NSDictionary *)objc_msgSend((id)v61[5], "copy");
    allPIDsIOAccelMemoryInfos = self->_allPIDsIOAccelMemoryInfos;
    self->_allPIDsIOAccelMemoryInfos = v17;

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v60, 8);

  }
  os_unfair_lock_unlock(&self->_allPIDsIOAccelMemoryInfosLock);
  v19 = self->_allPIDsIOAccelMemoryInfos;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v67, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v49 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v26, "mappings");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v28 = v27;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v66, 16);
        if (v29)
        {
          v30 = *(_QWORD *)v45;
LABEL_15:
          v31 = 0;
          while (1)
          {
            if (*(_QWORD *)v45 != v30)
              objc_enumerationMutation(v28);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v31), "address") == a3)
              break;
            if (v29 == ++v31)
            {
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v66, 16);
              if (v29)
                goto LABEL_15;
              goto LABEL_21;
            }
          }
          v32 = v26;

          if (!v32)
            continue;

          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v32, "surfaceID"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("SurfaceID"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v32, "length"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v36, CFSTR("Size"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v32, "dirtyLength"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v37, CFSTR("DirtySize"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v32, "residentLength"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v38, CFSTR("ResidentSize"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v32, "wired"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v39, CFSTR("IsWired"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v32, "purgeable"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v40, CFSTR("IsPurgeable"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v32, "cachedCopy"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v41, CFSTR("CachedCopy"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v32, "memoryPool"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v42, CFSTR("MemoryPool"));

          objc_msgSend(v32, "formattedDescriptions");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v43, CFSTR("Descriptions"));

          goto LABEL_28;
        }
LABEL_21:

      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v67, 16);
      if (v23)
        continue;
      break;
    }
  }
  v33 = 0;
  v32 = v22;
LABEL_28:

  return v33;
}

- (NSArray)processes
{
  return self->_processes;
}

- (unsigned)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(unsigned int)a3
{
  self->_qualityOfService = a3;
}

- (FPTime)gatherStartTime
{
  return self->_gatherStartTime;
}

- (FPTime)gatherEndTime
{
  return self->_gatherEndTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatherEndTime, 0);
  objc_storeStrong((id *)&self->_gatherStartTime, 0);
  objc_storeStrong((id *)&self->_outputFormatters, 0);
  objc_storeStrong((id *)&self->_sharedCacheMemoryObjectsTable, 0);
  objc_storeStrong((id *)&self->_allPIDsIOAccelMemoryInfos, 0);
  objc_storeStrong((id *)&self->_allPIDsIOSurfaceDescriptions, 0);
  objc_storeStrong((id *)&self->_pidToFootprint, 0);
  objc_storeStrong((id *)&self->_processes, 0);
}

@end
