@implementation FPMemoryObject

- (FPMemoryObject)init
{
  FPMemoryObject *v2;
  NSMutableArray *v3;
  NSMutableArray *memoryRegions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FPMemoryObject;
  v2 = -[FPMemoryObject init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    memoryRegions = v2->_memoryRegions;
    v2->_memoryRegions = v3;

    v2->_ownerPid = -1;
  }
  return v2;
}

- (BOOL)finalizeObject
{
  uint64_t v3;
  int v4;
  void *v5;
  FPRangeList *rangeList;
  NSMutableDictionary *processMemoryRegions;
  NSMutableArray *memoryRegions;

  v3 = -[NSMutableArray count](self->_memoryRegions, "count");
  if (v3 == 1)
  {
    -[NSMutableArray firstObject](self->_memoryRegions, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMemoryObject:", v5);
    rangeList = self->_rangeList;
    self->_rangeList = 0;

    processMemoryRegions = self->_processMemoryRegions;
    self->_processMemoryRegions = 0;

    memoryRegions = self->_memoryRegions;
    self->_memoryRegions = 0;

  }
  else
  {
    if (+[FPFootprint isSharingAnalysisDisabled](FPFootprint, "isSharingAnalysisDisabled"))
      v4 = +[FPFootprint breakDownPhysFootprint](FPFootprint, "breakDownPhysFootprint");
    else
      v4 = 0;
    sub_21345BA20((uint64_t)self, v4);
  }
  return v3 != 1;
}

- (unsigned)totalRegions
{
  uint64_t v3;
  void *v4;

  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    LODWORD(v3) = 1;
  }
  else
  {
    v3 = -[NSMutableArray count](self->_memoryRegions, "count");
    if (v3 == 1)
    {
      -[NSMutableArray firstObject](self->_memoryRegions, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v3) = objc_msgSend(v4, "totalRegions");

    }
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FPMemoryObject *v4;
  char v5;
  NSMutableDictionary *processMemoryRegions;
  id result;

  if ((*((_BYTE *)self + 8) & 1) == 0 || self->_rangeList)
  {
    _os_assert_log();
    result = (id)_os_crash();
    __break(1u);
  }
  else
  {
    v4 = objc_alloc_init(FPMemoryObject);
    v4->_dirtySize = self->_dirtySize;
    v4->_swappedSize = self->_swappedSize;
    v4->_cleanSize = self->_cleanSize;
    v4->_wiredSize = self->_wiredSize;
    v4->_reclaimableSize = self->_reclaimableSize;
    objc_storeStrong((id *)&v4->_memoryRegions, self->_memoryRegions);
    v5 = *((_BYTE *)v4 + 8) & 0xFE | *((_BYTE *)self + 8) & 1;
    *((_BYTE *)v4 + 8) = v5;
    *((_BYTE *)v4 + 8) = v5 & 0xFD | *((_BYTE *)self + 8) & 2;
    v4->_ownerPid = self->_ownerPid;
    processMemoryRegions = v4->_processMemoryRegions;
    v4->_processMemoryRegions = 0;

    return v4;
  }
  return result;
}

- (BOOL)couldHaveProcessView
{
  return -[NSMutableDictionary count](self->_processMemoryRegions, "count") || self->_ownerPid != -1;
}

- (id)viewForProcess:(id)a3
{
  id v4;
  FPMemoryObject *v5;
  NSMutableDictionary *processMemoryRegions;
  void *v7;
  void *v8;
  FPMemoryObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  FPMemoryObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  if (-[NSMutableDictionary count](v5->_processMemoryRegions, "count"))
  {
    processMemoryRegions = v5->_processMemoryRegions;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "pid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](processMemoryRegions, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_19;
    v9 = objc_alloc_init(FPMemoryObject);

    v9->_ownerPid = v5->_ownerPid;
    v10 = objc_msgSend(v4, "pageSize");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          sub_21345B7F4((uint64_t)v9, *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15++), v10, 0);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    sub_21345BA20((uint64_t)v9, objc_msgSend(v4, "breakDownPhysFootprint", (_QWORD)v18));
  }
  else
  {
    v9 = v5;
    if ((*((_BYTE *)v5 + 8) & 2) != 0)
    {
      v9 = (FPMemoryObject *)-[FPMemoryObject copy](v5, "copy");

      *((_BYTE *)v9 + 8) |= 4u;
    }
  }
  if (v5->_ownerPid != -1 && objc_msgSend(v4, "pid") != v5->_ownerPid)
  {
    if (v9 == v5)
    {
      v9 = (FPMemoryObject *)-[FPMemoryObject copy](v5, "copy");

    }
    v9->_dirtySize = 0;
    v9->_swappedSize = 0;
    v9->_cleanSize += v5->_swappedSize + v5->_dirtySize;
  }
  v5 = v9;
LABEL_19:
  v16 = v5;

  return v16;
}

- (BOOL)containsFakeRegion
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_memoryRegions;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isFake", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  sub_21345BF74((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)detailedName
{
  void *v2;
  void *v3;

  sub_21345BF74((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)fullName
{
  void *v2;
  void *v3;

  sub_21345BF74((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)verbose
{
  void *v2;
  char v3;

  -[NSMutableArray firstObject](self->_memoryRegions, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verbose");

  return v3;
}

- (NSDictionary)auxData
{
  void *v2;
  void *v3;

  -[NSMutableArray firstObject](self->_memoryRegions, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auxData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)detailedAuxData
{
  void *v2;
  void *v3;

  -[NSMutableArray firstObject](self->_memoryRegions, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailedAuxData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSString)auxDataName
{
  void *v2;
  void *v3;

  -[NSMutableArray firstObject](self->_memoryRegions, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auxDataName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)detailedAuxDataName
{
  void *v2;
  void *v3;

  -[NSMutableArray firstObject](self->_memoryRegions, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailedAuxDataName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)dirtySize
{
  return self->_dirtySize;
}

- (unint64_t)swappedSize
{
  return self->_swappedSize;
}

- (unint64_t)cleanSize
{
  return self->_cleanSize;
}

- (unint64_t)reclaimableSize
{
  return self->_reclaimableSize;
}

- (unint64_t)wiredSize
{
  return self->_wiredSize;
}

- (NSArray)memoryRegions
{
  return &self->_memoryRegions->super;
}

- (int)ownerPid
{
  return self->_ownerPid;
}

- (void)setOwnerPid:(int)a3
{
  self->_ownerPid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeList, 0);
  objc_storeStrong((id *)&self->_processMemoryRegions, 0);
  objc_storeStrong((id *)&self->_memoryRegions, 0);
}

@end
