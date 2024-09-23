@implementation FPMemoryObject

- (FPMemoryObject)init
{
  FPMemoryObject *v2;
  NSMutableArray *v3;
  NSMutableArray *memoryRegions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FPMemoryObject;
  v2 = -[FPMemoryObject init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    memoryRegions = v2->_memoryRegions;
    v2->_memoryRegions = v3;

    v2->_ownerPid = -1;
  }
  return v2;
}

- (BOOL)finalizeObject
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  FPRangeList *rangeList;
  NSMutableDictionary *processMemoryRegions;
  NSMutableArray *memoryRegions;

  v3 = -[NSMutableArray count](self->_memoryRegions, "count");
  if (v3 == (id)1)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_memoryRegions, "firstObject"));
    v7 = (void *)v6;
    if (v6)
      *(_QWORD *)(v6 + 64) = v6;
    rangeList = self->_rangeList;
    self->_rangeList = 0;

    processMemoryRegions = self->_processMemoryRegions;
    self->_processMemoryRegions = 0;

    memoryRegions = self->_memoryRegions;
    self->_memoryRegions = 0;

  }
  else
  {
    objc_opt_self(FPFootprint);
    if (byte_100038A08)
      v5 = sub_100011E4C();
    else
      v5 = 0;
    sub_100006BF8((uint64_t)self, v5, v4);
  }
  return v3 != (id)1;
}

- (unsigned)totalRegions
{
  id v3;
  void *v4;

  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    LODWORD(v3) = 1;
  }
  else
  {
    v3 = -[NSMutableArray count](self->_memoryRegions, "count");
    if (v3 == (id)1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_memoryRegions, "firstObject"));
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
  uint64_t v8;

  if ((*((_BYTE *)self + 8) & 1) == 0 || self->_rangeList)
  {
    v8 = _os_assert_log(0, a2, a3);
    result = (id)_os_crash(v8);
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
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  FPMemoryObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  v5 = self;
  if (-[NSMutableDictionary count](v5->_processMemoryRegions, "count"))
  {
    processMemoryRegions = v5->_processMemoryRegions;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "pid")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](processMemoryRegions, "objectForKeyedSubscript:", v7));

    if (!v8)
      goto LABEL_19;
    v9 = objc_alloc_init(FPMemoryObject);

    v9->_ownerPid = v5->_ownerPid;
    v10 = objc_msgSend(v4, "pageSize");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          sub_100006970((uint64_t)v9, *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15), (uint64_t)v10, 0);
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    v16 = objc_msgSend(v4, "breakDownPhysFootprint", (_QWORD)v20);
    sub_100006BF8((uint64_t)v9, (uint64_t)v16, v17);

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
  v18 = v5;

  return v18;
}

- (BOOL)containsFakeRegion
{
  NSMutableArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_memoryRegions;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (v6 && *(_DWORD *)(v6 + 12) == -1)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (NSString)name
{
  id v2;
  void *v3;
  void *v4;

  v2 = sub_100007158((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  return (NSString *)v4;
}

- (NSString)detailedName
{
  id v2;
  void *v3;
  void *v4;

  v2 = sub_100007158((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "detailedName"));

  return (NSString *)v4;
}

- (NSString)fullName
{
  id v2;
  void *v3;
  void *v4;

  v2 = sub_100007158((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fullName"));

  return (NSString *)v4;
}

- (BOOL)verbose
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_memoryRegions, "firstObject"));
  v3 = objc_msgSend(v2, "verbose");

  return v3;
}

- (NSDictionary)auxData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_memoryRegions, "firstObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "auxData"));

  return (NSDictionary *)v3;
}

- (NSDictionary)detailedAuxData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_memoryRegions, "firstObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "detailedAuxData"));

  return (NSDictionary *)v3;
}

- (NSString)auxDataName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_memoryRegions, "firstObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "auxDataName"));

  return (NSString *)v3;
}

- (NSString)detailedAuxDataName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_memoryRegions, "firstObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "detailedAuxDataName"));

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
