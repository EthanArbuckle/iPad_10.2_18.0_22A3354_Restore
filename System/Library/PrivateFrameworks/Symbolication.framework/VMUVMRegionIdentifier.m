@implementation VMUVMRegionIdentifier

- (int)_recordRegionsAroundAddress:(unint64_t)a3 regionDescriptionOptions:(unint64_t)a4
{
  const char *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (_recordRegionsAroundAddress_regionDescriptionOptions__onceToken != -1)
    dispatch_once(&_recordRegionsAroundAddress_regionDescriptionOptions__onceToken, &__block_literal_global_13);
  v7 = getprogname();
  v8 = strcmp(v7, "ReportCrash");
  v9 = a4 | 0x500;
  if (v8)
    v9 = a4;
  v10 = v9 & 0x30000;
  v11 = v9 & 0xFFFFFFFFFFFDFFFFLL;
  if ((v9 & 0x30000) == 0)
    v9 |= 0x10000uLL;
  if (v10 == 196608)
    v12 = v11;
  else
    v12 = v9;
  self->_recordedPhysFootprint = BYTE2(v12) & 1;
  if ((v12 & 0x10000) != 0)
    self->_didPhysFootprintDirtyAccounting = 1;
  objc_msgSend((id)_recordRegionsAroundAddress_regionDescriptionOptions__recordRegionsLock, "lock");
  v13 = recordRegions(self->_task, a3, self->_regions, self->_threadStates, self->_mallocZoneStatisticsMap, self->_ledger, v12);
  objc_msgSend((id)_recordRegionsAroundAddress_regionDescriptionOptions__recordRegionsLock, "unlock");
  if (!v13)
  {
    if (*MEMORY[0x1E0C85AA0] >= *MEMORY[0x1E0C85AC0])
      v14 = *MEMORY[0x1E0C85AC0];
    else
      v14 = *MEMORY[0x1E0C85AA0];
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = self->_regions;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
LABEL_18:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        if (!self->_hasFractionalPageSizes)
        {
          v20 = (*(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19) + 160) | *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19)
                                                                                               + 16) | *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19) + 184)) & v14;
          self->_hasFractionalPageSizes = v20 != 0;
          if (v20)
            break;
        }
        if (v17 == ++v19)
        {
          v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v17)
            goto LABEL_18;
          break;
        }
      }
    }

    return 0;
  }
  return v13;
}

void __78__VMUVMRegionIdentifier__recordRegionsAroundAddress_regionDescriptionOptions___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)_recordRegionsAroundAddress_regionDescriptionOptions__recordRegionsLock;
  _recordRegionsAroundAddress_regionDescriptionOptions__recordRegionsLock = (uint64_t)v0;

}

- (VMUVMRegionIdentifier)init
{
  VMUVMRegionIdentifier *v2;
  uint64_t v3;
  NSMutableArray *regions;
  uint64_t v5;
  NSMapTable *mallocZoneStatisticsMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VMUVMRegionIdentifier;
  v2 = -[VMUVMRegionIdentifier init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    regions = v2->_regions;
    v2->_regions = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 259);
    v5 = objc_claimAutoreleasedReturnValue();
    mallocZoneStatisticsMap = v2->_mallocZoneStatisticsMap;
    v2->_mallocZoneStatisticsMap = (NSMapTable *)v5;

  }
  return v2;
}

- (VMUVMRegionIdentifier)initWithVMUTask:(id)a3 options:(unint64_t)a4
{
  id v7;
  VMUVMRegionIdentifier *v8;
  VMUVMRegionIdentifier *v9;
  VMUTaskThreadStates *v10;
  VMUTaskThreadStates *threadStates;
  uint64_t v12;
  NSDictionary *ledger;
  unsigned int v14;

  v7 = a3;
  v8 = -[VMUVMRegionIdentifier init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_task, a3);
    v10 = -[VMUTaskThreadStates initWithVMUTask:]([VMUTaskThreadStates alloc], "initWithVMUTask:", v7);
    threadStates = v9->_threadStates;
    v9->_threadStates = v10;

    +[VMUProcessLedger ledgerForVMUTask:](VMUProcessLedger, "ledgerForVMUTask:", v9->_task);
    v12 = objc_claimAutoreleasedReturnValue();
    ledger = v9->_ledger;
    v9->_ledger = (NSDictionary *)v12;

    if (-[VMUTask isCore](v9->_task, "isCore")
      || (v14 = -[VMUTask taskPort](v9->_task, "taskPort"), (a4 & 0x1000) == 0) && v14)
    {
      if (-[VMUVMRegionIdentifier _recordRegionsAroundAddress:regionDescriptionOptions:](v9, "_recordRegionsAroundAddress:regionDescriptionOptions:", 0, a4))
      {

        v9 = 0;
      }
    }
  }

  return v9;
}

- (VMUVMRegionIdentifier)initWithTask:(unsigned int)a3 pid:(int)a4 options:(unint64_t)a5
{
  VMUTask *v7;
  VMUVMRegionIdentifier *v8;

  v7 = -[VMUTask initWithTask:]([VMUTask alloc], "initWithTask:", *(_QWORD *)&a3);
  v8 = -[VMUVMRegionIdentifier initWithVMUTask:options:](self, "initWithVMUTask:options:", v7, a5);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mallocZoneStatisticsMap, 0);
  objc_storeStrong((id *)&self->_ledger, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_threadStates, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

- (VMUVMRegionIdentifier)initWithTask:(unsigned int)a3 options:(unint64_t)a4
{
  VMUTask *v6;
  VMUVMRegionIdentifier *v7;

  v6 = -[VMUTask initWithTask:]([VMUTask alloc], "initWithTask:", *(_QWORD *)&a3);
  v7 = -[VMUVMRegionIdentifier initWithVMUTask:options:](self, "initWithVMUTask:options:", v6, a4);

  return v7;
}

- (VMUVMRegionIdentifier)initWithTask:(unsigned int)a3
{
  return -[VMUVMRegionIdentifier initWithTask:options:](self, "initWithTask:options:", *(_QWORD *)&a3, 0);
}

- (VMUVMRegionIdentifier)initWithGraph:(id)a3 options:(unint64_t)a4
{
  id v6;
  VMUVMRegionIdentifier *v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  VMUVMRegionIdentifier *v13;
  _QWORD v15[4];
  VMUVMRegionIdentifier *v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;

  v6 = a3;
  v7 = -[VMUVMRegionIdentifier init](self, "init");
  if (v7)
  {
    v8 = objc_msgSend(v6, "zoneCount");
    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      v10 = malloc_type_malloc(8 * objc_msgSend(v6, "zoneCount"), 0x2004093837F09uLL);
      if (objc_msgSend(v6, "zoneCount"))
      {
        v11 = 0;
        do
        {
          v10[v11] = malloc_type_calloc(1uLL, 0x50uLL, 0x10000404247E4FDuLL);
          NSMapInsertKnownAbsent(v7->_mallocZoneStatisticsMap, (const void *)objc_msgSend(v6, "zoneNameForIndex:", v11), (const void *)v10[v11]);
          ++v11;
        }
        while (v11 < objc_msgSend(v6, "zoneCount"));
      }
      v24[0] = v9;
      v24[1] = 3221225472;
      v24[2] = __47__VMUVMRegionIdentifier_initWithGraph_options___block_invoke;
      v24[3] = &unk_1E4E02500;
      v25 = v6;
      v26 = v10;
      VMUEnumerateVMAnnotatedMallocObjectsWithBlock(v25, v24);

    }
    else
    {
      v10 = 0;
    }
    v12 = objc_msgSend(v6, "vmPageSize") - 1;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__7;
    v22[4] = __Block_byref_object_dispose__7;
    v23 = 0;
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __47__VMUVMRegionIdentifier_initWithGraph_options___block_invoke_98;
    v15[3] = &unk_1E4E02528;
    v13 = v7;
    v16 = v13;
    v17 = v6;
    v18 = v22;
    v19 = v10;
    v20 = a4;
    v21 = v12;
    objc_msgSend(v17, "enumerateRegionsWithBlock:", v15);
    coalesceIdenticalRegions(v13->_regions, a4);
    free(v10);
    v13->_recordedPhysFootprint = BYTE2(a4) & 1;
    if ((a4 & 0x10000) != 0)
      v13->_didPhysFootprintDirtyAccounting = 1;

    _Block_object_dispose(v22, 8);
  }

  return v7;
}

int64x2_t __47__VMUVMRegionIdentifier_initWithGraph_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int64x2_t result;
  int64x2_t *v11;
  int64x2_t v12;

  if (*(_QWORD *)(a3 + 8) >> 60 == 1)
  {
    v7 = a4[37];
    if ((_DWORD)v7 != -1 && v7 >= objc_msgSend(*(id *)(a1 + 32), "zoneCount"))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "zoneCount");
      objc_msgSend(a4, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Malloc zone count is %u but zoneIndex is %u for %@\n"), v8, v7, v9);

    }
    if (v7 < objc_msgSend(*(id *)(a1 + 32), "zoneCount"))
    {
      v11 = *(int64x2_t **)(*(_QWORD *)(a1 + 40) + 8 * v7);
      v12 = vdupq_n_s64(1uLL);
      v12.i64[0] = *(_QWORD *)(a3 + 8) & 0xFFFFFFFFFFFFFFFLL;
      result = vaddq_s64(*v11, v12);
      *v11 = result;
    }
  }
  return result;
}

void __47__VMUVMRegionIdentifier_initWithGraph_options___block_invoke_98(uint64_t a1, void *a2)
{
  void *v4;
  int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int *v16;

  v16 = a2;
  v4 = (void *)MEMORY[0x1A85A9758]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", v16);
  v5 = objc_msgSend(*(id *)(a1 + 40), "zoneCount");
  v6 = v16;
  if (!v5)
    goto LABEL_13;
  v7 = v16[37];
  v8 = objc_msgSend(*(id *)(a1 + 40), "zoneCount");
  v6 = v16;
  if (v7 >= v8 || v16[37] == -1 || !*((_QWORD *)v16 + 17) && !v16[36])
    goto LABEL_13;
  objc_msgSend(*(id *)(a1 + 40), "zoneNameForIndex:");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)*((_QWORD *)v16 + 5);
  *((_QWORD *)v16 + 5) = v9;

  addMallocRegionPageStatistics(v16, *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v16[37]));
  v6 = v16;
  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v11)
    goto LABEL_13;
  if ((*(_BYTE *)(a1 + 64) & 0x80) == 0)
  {
    v12 = v11;
    v13 = v16;
    if (shouldProbablyCoalesceRegions(v12, v13) && objc_msgSend(v12, "hasSameInfoAsRegion:", v13))
    {

      v6 = v16;
      goto LABEL_13;
    }

    v6 = v16;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v6[37]);
  ++*(_QWORD *)(v14 + 56);
LABEL_13:
  setTypeIfMallocRegion(v6);
  v15 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v15 + 48))
    *(_BYTE *)(v15 + 48) = ((*((_QWORD *)v16 + 20) | *((_QWORD *)v16 + 2) | *((_QWORD *)v16 + 23)) & *(_QWORD *)(a1 + 72)) != 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  objc_autoreleasePoolPop(v4);

}

- (id)regions
{
  return self->_regions;
}

- (id)taskThreadStates
{
  return self->_threadStates;
}

- (id)nonSubmapRegionContainingAddress:(unint64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _QWORD *v9;
  _QWORD *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_regions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isSubmap", (_QWORD)v12) & 1) == 0 && a3 - v9[1] < v9[2])
        {
          v10 = v9;
          goto LABEL_12;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)hasFractionalPageSizes
{
  return self->_hasFractionalPageSizes;
}

- (NSArray)zoneNames
{
  NSMapTable *mallocZoneStatisticsMap;
  void *v3;
  void *v4;

  mallocZoneStatisticsMap = self->_mallocZoneStatisticsMap;
  if (mallocZoneStatisticsMap)
  {
    NSAllMapTableKeys(mallocZoneStatisticsMap);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v4;
}

- ($B3784314699B2BBEAD7DAC31D728563A)computedStatisticsForZoneWithName:(SEL)a3
{
  _OWORD *v6;
  $B3784314699B2BBEAD7DAC31D728563A *result;
  id v8;

  v8 = a4;
  v6 = NSMapGet(self->_mallocZoneStatisticsMap, v8);
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  if (v6)
  {
    *(_OWORD *)&retstr->var0 = *v6;
    *(_OWORD *)&retstr->var2 = v6[1];
    *(_OWORD *)&retstr->var4 = v6[2];
    *(_OWORD *)&retstr->var6 = v6[3];
  }
  else
  {
    NSLog(CFSTR("No malloc zone statistics available for malloc zone %@\n"), v8);
  }
  -[VMUVMRegionIdentifier _computeStatistics:](self, "_computeStatistics:", retstr);

  return result;
}

- ($B3784314699B2BBEAD7DAC31D728563A)summaryStatisticsOfAllZones
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  $B3784314699B2BBEAD7DAC31D728563A *result;
  int64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  -[VMUVMRegionIdentifier zoneNames](self, "zoneNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    v13 = 0u;
    v14 = 0u;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = (char *)NSMapGet(self->_mallocZoneStatisticsMap, *(const void **)(*((_QWORD *)&v16 + 1) + 8 * v10));
        if (v11)
        {
          v14 = vaddq_s64(v14, *((int64x2_t *)v11 + 1));
          *(int64x2_t *)&retstr->var2 = v14;
          v13 = vaddq_s64(v13, *(int64x2_t *)(v11 + 40));
          *(int64x2_t *)&retstr->var5 = v13;
          v15 = vaddq_s64(v15, *(int64x2_t *)v11);
          *(int64x2_t *)&retstr->var0 = v15;
          v8 += *((_QWORD *)v11 + 7);
          retstr->var7 = v8;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  -[VMUVMRegionIdentifier _computeStatistics:](self, "_computeStatistics:", retstr, *(_OWORD *)&v13, *(_OWORD *)&v14);

  return result;
}

- (void)_computeStatistics:(id *)a3
{
  unint64_t var0;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  unint64_t v7;

  if (a3)
  {
    var0 = a3->var0;
    v4 = a3->var5 + a3->var6;
    if (v4)
      v5 = v4 > var0;
    else
      v5 = 0;
    if (v5)
    {
      v6 = 100 - 100 * var0 / v4;
      v7 = v4 - var0;
    }
    else
    {
      v6 = 0;
      v7 = 0;
    }
    a3->var8 = v6;
    a3->var9 = v7;
  }
}

+ (id)descriptionForRange:(_VMURange)a3 inSortedRegions:(id)a4 options:(unint64_t)a5
{
  unint64_t length;
  unint64_t location;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  unint64_t v23;
  unint64_t v24;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v24 = location + length;
    v23 = length;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v13 = objc_claimAutoreleasedReturnValue();
      if (VMURangeIntersectsRange(location, length, *(_QWORD *)(v13 + 8), *(_QWORD *)(v13 + 16)))
      {
        if (objc_msgSend((id)v13, "isSubmap"))
        {
          v11 = (v12 + 1);
          if (v10 > v11)
          {
            v21 = objc_msgSend((id)v13, "address");
            objc_msgSend(v7, "objectAtIndexedSubscript:", (v12 + 1));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "address");

            v16 = v21 == v15;
            length = v23;
            if (v16)
              goto LABEL_12;
          }
        }
        v17 = objc_msgSend(v8, "length");
        if (v17)
          v17 = objc_msgSend(v8, "appendString:", CFSTR("\n"));
        v18 = (void *)MEMORY[0x1A85A9758](v17);
        objc_msgSend((id)v13, "descriptionWithOptions:maximumLength:", a5, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendString:", v19);

        objc_autoreleasePoolPop(v18);
        length = v23;
      }
      if (*(_QWORD *)(v13 + 8) >= v24)
      {

        break;
      }
      v11 = (v12 + 1);
LABEL_12:

      v12 = v11;
    }
    while (v10 > v11);
  }

  return v8;
}

- (id)descriptionForRange:(_VMURange)a3
{
  return +[VMUVMRegionIdentifier descriptionForRange:inSortedRegions:options:](VMUVMRegionIdentifier, "descriptionForRange:inSortedRegions:options:", a3.location, a3.length, self->_regions, 1);
}

- (id)descriptionForRange:(_VMURange)a3 options:(unint64_t)a4
{
  return +[VMUVMRegionIdentifier descriptionForRange:inSortedRegions:options:](VMUVMRegionIdentifier, "descriptionForRange:inSortedRegions:options:", a3.location, a3.length, self->_regions, a4);
}

- (id)descriptionOfRegionsAroundAddress:(unint64_t)a3 options:(unint64_t)a4
{
  return -[VMUVMRegionIdentifier descriptionOfRegionsAroundAddress:options:maximumLength:memorySizeDivisor:](self, "descriptionOfRegionsAroundAddress:options:maximumLength:memorySizeDivisor:", a3, a4, 0, 1);
}

- (id)descriptionOfRegionsAroundAddress:(unint64_t)a3 options:(unint64_t)a4 maximumLength:(unint64_t)a5 memorySizeDivisor:(unsigned int)a6
{
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t i;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  _QWORD *v21;
  _QWORD *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  id v28;
  void (**v29)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v30;
  id v31;
  unint64_t v33;
  VMUVMRegionIdentifier *v34;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  VMUVMRegionIdentifier *v40;
  unint64_t v41;
  unint64_t v42;
  unsigned int v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_regions, "count"))
  {
    a4 |= 0x80uLL;
    -[VMUVMRegionIdentifier _recordRegionsAroundAddress:regionDescriptionOptions:](self, "_recordRegionsAroundAddress:regionDescriptionOptions:", a3, a4);
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v34 = self;
  v10 = self->_regions;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  v33 = a4;
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v10);
        v17 = *(_QWORD **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v18 = v17[1];
        v19 = v17[2];
        if (v18 + v19 - 1 >= a3)
        {
          if (a3 - v18 >= v19)
          {
            v22 = v17;
            goto LABEL_16;
          }
          v20 = v13;
          v13 = *(_QWORD **)(*((_QWORD *)&v44 + 1) + 8 * i);
        }
        else
        {
          v20 = v14;
          v14 = *(_QWORD **)(*((_QWORD *)&v44 + 1) + 8 * i);
        }
        v21 = v17;

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v12)
        continue;
      break;
    }
    v22 = 0;
LABEL_16:
    a4 = v33;
  }
  else
  {
    v22 = 0;
    v13 = 0;
    v14 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 <= 0x50)
    v24 = a5;
  else
    v24 = a5 - 6;
  v25 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __99__VMUVMRegionIdentifier_descriptionOfRegionsAroundAddress_options_maximumLength_memorySizeDivisor___block_invoke;
  v38[3] = &unk_1E4E02550;
  v26 = v23;
  v41 = a4;
  v42 = v24;
  v43 = a6;
  v39 = v26;
  v40 = v34;
  v27 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85A995C](v38);
  v36[0] = v25;
  v36[1] = 3221225472;
  v36[2] = __99__VMUVMRegionIdentifier_descriptionOfRegionsAroundAddress_options_maximumLength_memorySizeDivisor___block_invoke_2;
  v36[3] = &unk_1E4E02578;
  v28 = v26;
  v37 = v28;
  v29 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A85A995C](v36);
  if (v13)
  {
    objc_msgSend(v28, "appendFormat:", CFSTR("%#llx is in %#llx-%#llx;  bytes after start: %llu  bytes before end: %llu\n"),
      a3,
      v13[1],
      v13[2] + v13[1],
      a3 - v13[1],
      v13[2] + v13[1] + ~a3);
  }
  else
  {
    objc_msgSend(v28, "appendFormat:", CFSTR("%#llx is not in any region.  "), a3);
    if (v14)
      objc_msgSend(v28, "appendFormat:", CFSTR("Bytes after previous region: %llu  "), a3 - (v14[1] + v14[2]) + 1);
    if (v22)
      objc_msgSend(v28, "appendFormat:", CFSTR("Bytes before following region: %llu"), v22[1] - a3);
    objc_msgSend(v28, "appendString:", CFSTR("\n"));
  }
  objc_msgSend(v28, "appendString:", CFSTR("\n"));
  +[VMUVMRegion columnHeadersWithOptions:maximumLength:memorySizeDivisor:hasFractionalPageSizes:](VMUVMRegion, "columnHeadersWithOptions:maximumLength:memorySizeDivisor:hasFractionalPageSizes:", v33, v24, a6, v34->_hasFractionalPageSizes);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "appendFormat:", CFSTR("%s%@\n"), "      ", v30);

  if (v14)
    ((void (**)(_QWORD, const char *, _QWORD *))v27)[2](v27, "      ", v14);
  else
    objc_msgSend(v28, "appendFormat:", CFSTR("%sUNUSED SPACE AT START\n"), "      ");
  ((void (**)(_QWORD, const char *, _QWORD *, _QWORD *))v29)[2](v29, "      ", v14, v13);
  if (v13)
  {
    ((void (**)(_QWORD, const char *, _QWORD *))v27)[2](v27, "--->  ", v13);
  }
  else
  {
    if (v22 && v14)
    {
      ((void (**)(_QWORD, const char *, _QWORD *, _QWORD *))v29)[2](v29, "--->  ", v14, v22);
      ((void (**)(_QWORD, const char *, _QWORD, _QWORD *))v29)[2](v29, "      ", 0, v22);
      goto LABEL_38;
    }
    objc_msgSend(v28, "appendFormat:", CFSTR("%s\n"), "--->  ");
  }
  ((void (**)(_QWORD, const char *, _QWORD *, _QWORD *))v29)[2](v29, "      ", v13, v22);
  if (!v22)
  {
    objc_msgSend(v28, "appendFormat:", CFSTR("%sUNUSED SPACE AT END\n"), "      ");
    goto LABEL_40;
  }
LABEL_38:
  ((void (**)(_QWORD, const char *, _QWORD *))v27)[2](v27, "      ", v22);
LABEL_40:
  v31 = v28;

  return v31;
}

void __99__VMUVMRegionIdentifier_descriptionOfRegionsAroundAddress_options_maximumLength_memorySizeDivisor___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(a3, "descriptionWithOptions:maximumLength:memorySizeDivisor:hasFractionalPageSizes:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64), *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 48));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("%s%@\n"), a2, v5);

  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("%s%@\n"), a2, &stru_1E4E04720);
  }
}

void __99__VMUVMRegionIdentifier_descriptionOfRegionsAroundAddress_options_maximumLength_memorySizeDivisor___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;
  _QWORD *v12;

  v12 = a3;
  v7 = a4;
  if (v12)
  {
    if (v7)
    {
      v8 = v12[2] + v12[1];
      v9 = v7[1];
      v10 = v9 > v8;
      v11 = v9 - v8;
      if (v10)
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%sGAP OF %#llx BYTES\n"), a2, v11);
    }
  }

}

- (id)descriptionForMallocZoneTotals:(unint64_t)a3
{
  return -[VMUVMRegionIdentifier descriptionForMallocZoneTotals:memorySizeDivisor:](self, "descriptionForMallocZoneTotals:memorySizeDivisor:", a3, 1);
}

- (id)descriptionForMallocZoneTotals:(unint64_t)a3 memorySizeDivisor:(unsigned int)a4
{
  int v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  char hasFractionalPageSizes;
  uint64_t v28;
  char v29;
  void *v31;
  id v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[4];
  BOOL v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v4 = a3;
  v58 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_new();
  -[VMUVMRegionIdentifier zoneNames](self, "zoneNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __74__VMUVMRegionIdentifier_descriptionForMallocZoneTotals_memorySizeDivisor___block_invoke;
  v54[3] = &__block_descriptor_33_e22_Q16__0____QQQQQQQQQQ_8l;
  v55 = (v4 & 0x100000) != 0;
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __74__VMUVMRegionIdentifier_descriptionForMallocZoneTotals_memorySizeDivisor___block_invoke_2;
  v52[3] = &unk_1E4E025C0;
  v52[4] = self;
  v32 = (id)MEMORY[0x1A85A995C](v54);
  v53 = v32;
  objc_msgSend(v7, "sortedArrayUsingComparator:", v52);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  v11 = v6;
  if (v10)
  {
    v12 = v10;
    v13 = 0;
    v14 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v49 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (objc_msgSend(v16, "length") > (unint64_t)v13)
          v13 = objc_msgSend(v16, "length");
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v12);

    if (v13 <= 0xB)
      v17 = 11;
    else
      v17 = v13;
    if (v17 >= 0x3C)
      v18 = 60;
    else
      v18 = v17;
    v6 = v11;
  }
  else
  {

    v18 = 11;
  }
  appendMallocZoneTextLine(v6, v4, v18, (uint64_t)", (uint64_t)"VIRTUAL", (uint64_t)"RESIDENT", (uint64_t)"DIRTY", (uint64_t)"SWAPPED", (uint64_t)"DIRTY+SWAP", (uint64_t)"ALLOCATION", (uint64_t)"BYTES", (uint64_t)"DIRTY+SWAP", (uint64_t)", (uint64_t)"REGION");
  if (a4 <= 1)
    v19 = "SIZE";
  else
    v19 = "PAGES";
  appendMallocZoneTextLine(v6, v4, v18, (uint64_t)"MALLOC ZONE", (uint64_t)v19, (uint64_t)v19, (uint64_t)v19, (uint64_t)v19, (uint64_t)v19, (uint64_t)"COUNT", (uint64_t)"ALLOCATED", (uint64_t)"FRAG SIZE", (uint64_t)"% FRAG", (uint64_t)"COUNT");
  v20 = (void *)objc_opt_new();
  appendMallocZoneTextLine(v20, v4, v18, (uint64_t)"===========", (uint64_t)"=======", (uint64_t)"=========", (uint64_t)"=========", (uint64_t)"=========", (uint64_t)"=========", (uint64_t)"=========", (uint64_t)"=========", (uint64_t)"=========", (uint64_t)"======", (uint64_t)"======");
  v31 = v20;
  objc_msgSend(v6, "appendString:", v20);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v21 = v9;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v45 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v39 = 0u;
        -[VMUVMRegionIdentifier computedStatisticsForZoneWithName:](self, "computedStatisticsForZoneWithName:", v26);
        hasFractionalPageSizes = self->_hasFractionalPageSizes;
        v28 = objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
        v36 = v41;
        v37 = v42;
        v38 = v43;
        v34 = v39;
        v35 = v40;
        v6 = v11;
        appendMallocZoneStatsLine(v11, v4, a4, hasFractionalPageSizes, v18, v28, (unint64_t *)&v34);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v23);
  }

  if (!objc_msgSend(v21, "count"))
  {
    objc_msgSend(v6, "appendString:", CFSTR("No malloc zones in target process\n"));
    *(_QWORD *)&v39 = 0;
    -[VMUTask hasStartedWithErrorString:](self->_task, "hasStartedWithErrorString:", &v39);
    if ((_QWORD)v39)
      objc_msgSend(v6, "appendFormat:", CFSTR("%s\n"), (_QWORD)v39);
  }
  if (-[NSMapTable count](self->_mallocZoneStatisticsMap, "count") >= 2)
  {
    objc_msgSend(v6, "appendString:", v31);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v39 = 0u;
    -[VMUVMRegionIdentifier summaryStatisticsOfAllZones](self, "summaryStatisticsOfAllZones");
    v29 = self->_hasFractionalPageSizes;
    v36 = v41;
    v37 = v42;
    v38 = v43;
    v34 = v39;
    v35 = v40;
    appendMallocZoneStatsLine(v6, v4, a4, v29, v18, (uint64_t)"TOTAL", (unint64_t *)&v34);
  }

  return v6;
}

uint64_t __74__VMUVMRegionIdentifier_descriptionForMallocZoneTotals_memorySizeDivisor___block_invoke(uint64_t a1, _QWORD *a2)
{
  if (!a2)
    return 0;
  if (*(_BYTE *)(a1 + 32))
    return a2[5] + a2[6];
  return a2[2];
}

uint64_t __74__VMUVMRegionIdentifier_descriptionForMallocZoneTotals_memorySizeDivisor___block_invoke_2(uint64_t a1, const void *a2, void *a3)
{
  NSMapTable *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v5 = *(NSMapTable **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = a3;
  NSMapGet(v5, a2);
  NSMapGet(*(NSMapTable **)(*(_QWORD *)(a1 + 32) + 40), v6);

  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v7 <= (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    v8 = 0;
  else
    v8 = -1;
  v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v9 < (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    return 1;
  else
    return v8;
}

- (id)descriptionForRegionTotals:(unint64_t)a3
{
  return -[VMUVMRegionIdentifier descriptionForRegionTotals:memorySizeDivisor:](self, "descriptionForRegionTotals:memorySizeDivisor:", a3, 1);
}

- (id)descriptionForRegionTotals:(unint64_t)a3 memorySizeDivisor:(unsigned int)a4
{
  uint64_t v4;
  VMUVMRegionIdentifier *v6;
  const char *v7;
  unint64_t v8;
  __CFString *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  __CFString *v35;
  NSMutableArray *v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t j;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  __CFString *v49;
  __CFString *v50;
  char v51;
  VMUVMRegion *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t k;
  void *v61;
  unsigned int v62;
  unsigned int v63;
  uint64_t v64;
  const char *v65;
  void *v66;
  uint64_t m;
  uint64_t v68;
  uint64_t v69;
  __CFString *v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unsigned int v76;
  __CFString *v77;
  void *v78;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unsigned int v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  void *v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unsigned int v92;
  uint64_t v93;
  id obj;
  uint64_t v95;
  unsigned int v96;
  unsigned int v97;
  __CFString *v98;
  char *v99;
  uint64_t v100;
  unint64_t v101;
  void *v102;
  unint64_t v103;
  uint64_t v104;
  NSMutableArray *v105;
  char v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  unint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  _BYTE v121[128];
  unint64_t v122[18];

  v4 = *(_QWORD *)&a4;
  v6 = self;
  v122[16] = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_regions, "count"))
  {
    v35 = &stru_1E4E04720;
    return v35;
  }
  v7 = getprogname();
  if (!strcmp(v7, "ReportCrash"))
    v8 = a3 | 0x100;
  else
    v8 = a3;
  v9 = (__CFString *)objc_opt_new();
  v122[0] = 0;
  v115 = 0;
  *(_QWORD *)&v116 = 0;
  cumulateLibraries(v6->_regions, CFSTR("__TEXT"), v122, &v116, &v115);
  cumulateLibraries(v6->_regions, CFSTR("__LINKEDIT"), v122, &v116, &v115);
  v10 = v122[0];
  if (v122[0])
  {
    v11 = memorySizeString(v122[0]);
    v12 = v116;
    v13 = memorySizeString(v116);
    -[__CFString appendFormat:](v9, "appendFormat:", CFSTR("ReadOnly portion of Libraries: Total=%s resident=%s(%.0f%%) swapped_out_or_unallocated=%s(%.0f%%)\n"), v11, v13, (float)((float)((float)v12 * 100.0) / (float)v10), memorySizeString(v115), (float)((float)((float)v115 * 100.0) / (float)v10));
  }
  v101 = v8;
  v98 = v9;
  v14 = v6->_regions;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v116, v122, 16);
  v97 = v4;
  v99 = (char *)v6;
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = *(_QWORD *)v117;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v117 != v22)
          objc_enumerationMutation(v14);
        v24 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * i);
        if (!*(_BYTE *)(v24 + 48) && (*(_BYTE *)(v24 + 24) & 2) != 0 && !*(_BYTE *)(v24 + 49))
        {
          if (*(_BYTE *)(v24 + 50) == 2)
          {
            v25 = *(_QWORD *)(v24 + 160);
            v26 = *(_QWORD *)(v24 + 176);
            v27 = v26 + v25;
            v28 = v20;
            v20 = v26 + v25;
          }
          else
          {
            v28 = *(_QWORD *)(v24 + 168);
            v25 = *(_QWORD *)(v24 + 160);
            v26 = *(_QWORD *)(v24 + 176);
            v27 = v25 + v26;
          }
          v29 = *(_QWORD *)(v24 + 16);
          v21 += v29;
          v20 += v28;
          v19 += v25;
          v17 += v26;
          v18 = v29 + v18 - v27;
          *(_BYTE *)(v24 + 48) = 1;
        }
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v116, v122, 16);
    }
    while (v16);

    v4 = v97;
    v6 = (VMUVMRegionIdentifier *)v99;
    if (v21)
    {
      v30 = memorySizeString(v21);
      v31 = memorySizeString(v20);
      v32 = memorySizeString(v19);
      v33 = (float)((float)((float)v19 * 100.0) / (float)v21);
      v34 = memorySizeString(v17);
      -[__CFString appendFormat:](v98, "appendFormat:", CFSTR("Writable regions: Total=%s written=%s(%.0f%%) resident=%s(%.0f%%) swapped_out=%s(%.0f%%) unallocated=%s(%.0f%%)\n"), v30, v31, (float)((float)((float)v20 * 100.0) / (float)v21), v32, *(_QWORD *)&v33, v34, (float)((float)((float)v17 * 100.0) / (float)v21), memorySizeString(v18), (float)((float)((float)v18 * 100.0) / (float)v21));
    }
  }
  else
  {

  }
  v36 = v6->_regions;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v37 = v36;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v116, v122, 16);
  if (!v38)
  {
    v92 = 0;
    v90 = 0;
    v91 = 0;
    v40 = 0;
    v88 = 0;
    v89 = 0;
    v41 = 0;
    v42 = 0;
    v44 = v101;
    goto LABEL_56;
  }
  v39 = v38;
  v92 = 0;
  v90 = 0;
  v91 = 0;
  v40 = 0;
  v88 = 0;
  v89 = 0;
  v41 = 0;
  v42 = 0;
  v43 = *(_QWORD *)v117;
  v44 = v101;
  v105 = v37;
  do
  {
    for (j = 0; j != v39; ++j)
    {
      if (*(_QWORD *)v117 != v43)
        objc_enumerationMutation(v37);
      v46 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * j);
      if ((*(_BYTE *)(v46 + 132) & 1) == 0
        && (objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * j), "isNullRegion") & 1) == 0
        && ((v44 & 0x40) != 0
         || (*(_BYTE *)(v46 + 132) & 8) != 0
         || (objc_msgSend(*(id *)(v46 + 32), "hasPrefix:", VMUunusedSharedLibLabelPrefix) & 1) == 0))
      {
        v47 = v40;
        v48 = v41;
        v49 = *(__CFString **)(v46 + 32);
        if (!v49)
          v49 = CFSTR("unknown type");
        v50 = v49;
        if ((-[__CFString hasPrefix:](v50, "hasPrefix:", CFSTR("MALLOC")) & 1) != 0)
        {
          if ((v44 & 0x100) == 0)
          {
LABEL_45:
            if ((*(_BYTE *)(v46 + 132) & 8) != 0)
            {

              v50 = CFSTR("unused but dirty shlib __DATA");
            }
            objc_msgSend(v102, "objectForKey:", v50);
            v52 = (VMUVMRegion *)objc_claimAutoreleasedReturnValue();
            if (!v52)
            {
              v52 = objc_alloc_init(VMUVMRegion);
              objc_storeStrong((id *)&v52->type, v50);
              objc_msgSend(v102, "setObject:forKey:", v52, v50);
            }
            -[VMUVMRegion addInfoFromRegion:](v52, "addInfoFromRegion:", v46);
            if ((objc_msgSend((id)v46, "isAnalysisToolRegion") & 1) == 0)
            {
              v47 += *(_QWORD *)(v46 + 16);
              v91 += *(_QWORD *)(v46 + 160);
              v90 += *(_QWORD *)(v46 + 184);
              v89 += *(_QWORD *)(v46 + 176);
              v48 += *(_QWORD *)(v46 + 192);
              ++v92;
              v88 += *(_QWORD *)(v46 + 200);
              v42 += *(_QWORD *)(v46 + 208);
            }

            v44 = v101;
            v41 = v48;
            v40 = v47;
            v37 = v105;
            continue;
          }
        }
        else
        {
          v51 = -[__CFString hasPrefix:](v50, "hasPrefix:", CFSTR("TC malloc"));
          if ((v44 & 0x100) == 0 || (v51 & 1) == 0)
            goto LABEL_45;
        }
        if (*(_DWORD *)(v46 + 24) && *(_BYTE *)(v46 + 50) != 3)
        {

          v50 = CFSTR("MALLOC");
        }
        goto LABEL_45;
      }
    }
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v116, v122, 16);
  }
  while (v39);
LABEL_56:
  v84 = v42;

  v35 = v98;
  -[__CFString appendString:](v98, "appendString:", CFSTR("\n"));
  v86 = v41;
  if ((v44 & 0x100000) != 0)
  {
    objc_msgSend(v102, "keysSortedByValueUsingComparator:", &__block_literal_global_167);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v102, "allKeys");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "sortedArrayUsingSelector:", sel_compare_);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v85 = v40;
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v55 = v54;
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v111, v121, 16);
  if (v56)
  {
    v57 = v56;
    v58 = 0;
    v59 = *(_QWORD *)v112;
    do
    {
      for (k = 0; k != v57; ++k)
      {
        if (*(_QWORD *)v112 != v59)
          objc_enumerationMutation(v55);
        v61 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * k);
        if (objc_msgSend(v61, "length") > (unint64_t)v58)
          v58 = objc_msgSend(v61, "length");
      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v111, v121, 16);
    }
    while (v57);
  }
  else
  {
    v58 = 0;
  }

  if (v58 >= 0x3C)
    v62 = 60;
  else
    v62 = v58;
  v63 = objc_msgSend(CFSTR("TOTAL, minus reserved VM space"), "length");
  if (v62 <= v63)
    v64 = v63;
  else
    v64 = v62;
  if (v4 <= 1)
    v65 = "SIZE";
  else
    v65 = "PAGES";
  appendTextLine(v98, v44, v4 > 1, v64, (uint64_t)", (uint64_t)"VIRTUAL", (uint64_t)"RESIDENT", (uint64_t)"DIRTY", (uint64_t)"SWAPPED", (uint64_t)"VOLATILE", (uint64_t)"NONVOL", (uint64_t)"EMPTY", (uint64_t)" REGION", (uint64_t)");
  appendTextLine(v98, v44, v4 > 1, v64, (uint64_t)"REGION TYPE", (uint64_t)v65, (uint64_t)v65, (uint64_t)v65, (uint64_t)v65, (uint64_t)v65, (uint64_t)v65, (uint64_t)v65, (uint64_t)"   COUNT (non-coalesced)", (uint64_t)");
  v66 = (void *)objc_opt_new();
  appendTextLine(v66, v44, v4 > 1, v64, (uint64_t)"===========", (uint64_t)"=======", (uint64_t)"========", (uint64_t)"=====", (uint64_t)"=======", (uint64_t)"========", (uint64_t)"======", (uint64_t)"=====", (uint64_t)"=======", (uint64_t)");
  v87 = v66;
  -[__CFString appendString:](v98, "appendString:", v66);
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  obj = v55;
  v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v120, 16);
  v96 = v64;
  if (v100)
  {
    v93 = 0;
    v95 = *(_QWORD *)v108;
    do
    {
      for (m = 0; m != v100; ++m)
      {
        if (*(_QWORD *)v108 != v95)
          objc_enumerationMutation(obj);
        objc_msgSend(v102, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * m));
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = v68;
        if ((v44 & 0x100) != 0 || (objc_msgSend(*(id *)(v68 + 32), "hasPrefix:", CFSTR("MALLOC_")) & 1) == 0)
        {
          if ((objc_msgSend(*(id *)(v69 + 32), "hasPrefix:", off_1EE78AA60[0]) & 1) != 0)
          {
            v70 = CFSTR("        not counted in TOTAL below");
          }
          else if (objc_msgSend(*(id *)(v69 + 32), "hasSuffix:", VMUreservedLabelSuffix))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("        %@"), VMUreservedVMaddressSpaceString);
            v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v93 += *(_QWORD *)(v69 + 16);
          }
          else
          {
            v70 = &stru_1E4E04720;
          }
        }
        else
        {
          v70 = CFSTR("        see MALLOC ZONE table below");
        }
        v106 = v99[48];
        v104 = objc_msgSend(*(id *)(v69 + 32), "UTF8String");
        v103 = *(_QWORD *)(v69 + 16);
        v71 = *(_QWORD *)(v69 + 160);
        v72 = *(_QWORD *)(v69 + 184);
        v73 = *(_QWORD *)(v69 + 176);
        v74 = *(_QWORD *)(v69 + 192);
        v64 = *(_QWORD *)(v69 + 200);
        v75 = *(_QWORD *)(v69 + 208);
        v76 = *(_DWORD *)(v69 + 152);
        v77 = objc_retainAutorelease(v70);
        v83 = v76;
        v82 = v64;
        v81 = v73;
        v80 = v72;
        v35 = v98;
        v44 = v101;
        LODWORD(v64) = v96;
        v4 = v97;
        appendStatsLine(v98, v101, v97, v106, v96, v104, v103, v71, v80, v81, v74, v82, v75, v83, -[__CFString UTF8String](v77, "UTF8String"));

      }
      v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v120, 16);
    }
    while (v100);
  }
  else
  {
    v93 = 0;
  }

  -[__CFString appendString:](v35, "appendString:", v87);
  appendStatsLine(v35, v44, v4, v99[48], v64, (uint64_t)"TOTAL", v85, v91, v90, v89, v86, v88, v84, v92, (uint64_t)");
  if (v93)
    appendStatsLine(v35, v44, v4, v99[48], v96, objc_msgSend(CFSTR("TOTAL, minus reserved VM space"), "UTF8String"), v85 - v93, v91, v90, v89, v86, v88, v84, v92, (uint64_t)");

  if ((v44 & 0x100) == 0)
  {
    -[__CFString appendString:](v35, "appendString:", CFSTR("\n"));
    objc_msgSend(v99, "descriptionForMallocZoneTotals:memorySizeDivisor:", v44, v4);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendString:](v35, "appendString:", v78);

  }
  return v35;
}

BOOL __70__VMUVMRegionIdentifier_descriptionForRegionTotals_memorySizeDivisor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(_QWORD *)(a3 + 176) + *(_QWORD *)(a3 + 184) > *(_QWORD *)(a2 + 176) + *(_QWORD *)(a2 + 184);
}

- (BOOL)recordedPhysFootprint
{
  return self->_recordedPhysFootprint;
}

- (BOOL)didPhysFootprintDirtyAccounting
{
  return self->_didPhysFootprintDirtyAccounting;
}

- (NSDictionary)ledger
{
  return self->_ledger;
}

@end
