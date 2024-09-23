@implementation FPMemoryRegion

- (BOOL)wired
{
  return *((_BYTE *)self + 8) & 1;
}

- (void)setWired:(BOOL)a3
{
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFE | a3;
}

- (BOOL)inSharedCache
{
  return (*((unsigned __int8 *)self + 8) >> 1) & 1;
}

- (void)setInSharedCache:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFD | v3;
}

- (BOOL)unusedSharedCacheRegion
{
  return (*((unsigned __int8 *)self + 8) >> 2) & 1;
}

- (void)setUnusedSharedCacheRegion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFB | v3;
}

- (BOOL)ownedExclusivelyByParentProcess
{
  return (*((unsigned __int8 *)self + 8) >> 3) & 1;
}

- (void)setOwnedExclusivelyByParentProcess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xF7 | v3;
}

- (BOOL)verbose
{
  return (*((unsigned __int8 *)self + 8) >> 4) & 1;
}

- (void)setVerbose:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xEF | v3;
}

- (unint64_t)end
{
  unint64_t result;
  unint64_t v4;

  result = -[FPMemoryRegion start](self, "start");
  if (result != -1)
  {
    v4 = -[FPMemoryRegion start](self, "start");
    return -[FPMemoryRegion size](self, "size") + v4;
  }
  return result;
}

- (void)setEnd:(unint64_t)a3
{
  if (-[FPMemoryRegion start](self, "start") > a3)
    __assert_rtn("-[FPMemoryRegion setEnd:]", "FPMemoryRegion.m", 185, "end >= self.start");
  -[FPMemoryRegion setSize:](self, "setSize:", a3 - -[FPMemoryRegion start](self, "start"));
}

- (unint64_t)wiredSize
{
  if (-[FPMemoryRegion wired](self, "wired"))
    return self->_size;
  else
    return 0;
}

- (unsigned)totalRegions
{
  return 1;
}

- (NSDictionary)auxData
{
  return 0;
}

- (NSDictionary)detailedAuxData
{
  return 0;
}

- (NSString)auxDataName
{
  return self->_name;
}

- (NSString)detailedAuxDataName
{
  return self->_detailedName;
}

- (void)addSubrange:(_NSRange)a3 memoryTotal:(id *)a4 pageSize:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  FPRangeList *subrangeList;
  FPRangeList *v11;
  FPRangeList *v12;

  length = a3.length;
  location = a3.location;
  subrangeList = self->_subrangeList;
  if (!subrangeList)
  {
    v11 = objc_alloc_init(FPRangeList);
    v12 = self->_subrangeList;
    self->_subrangeList = v11;

    subrangeList = self->_subrangeList;
  }
  sub_21344E3A4((int64x2_t *)subrangeList, location, length, a5, (uint64_t *)a4);
}

- (void)freeSubrangeList
{
  FPRangeList *subrangeList;

  subrangeList = self->_subrangeList;
  self->_subrangeList = 0;

}

+ (id)categoryNameForTag:(unsigned int)a3
{
  uint64_t v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;

  v3 = *(_QWORD *)&a3;
  if ((a3 & 0xFFFFFFF0) == 0xF0)
  {
    if (qword_253D9AA28 != -1)
      dispatch_once(&qword_253D9AA28, &unk_24CFC91A8);
    v4 = (__CFString *)*((id *)&unk_253D9AA20 + (v3 - 240) + 4);
    goto LABEL_5;
  }
  if (a3 > 0xFF)
  {
    if (a3 == -1)
    {
      v4 = CFSTR("Owned physical footprint (unmapped)");
      return v4;
    }
  }
  else
  {
    v5 = off_24CFC8978[a3];
    if (v5)
    {
      v4 = v5;
      return v4;
    }
    VMURegionTypeDescriptionForTagShareProtAndPager();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!-[__CFString hasPrefix:](v4, "hasPrefix:", CFSTR("Memory Tag")))
    {
LABEL_5:
      if (v4)
        return v4;
      goto LABEL_14;
    }

  }
LABEL_14:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("tag %d"), v3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("unknown");
  if (v6)
    v8 = (__CFString *)v6;
  v4 = v8;

  return v4;
}

+ (id)vmLedgerNameForTag:(unint64_t)a3
{
  id v3;

  if (a3 > 5)
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("VM ledger tag %llu"), a3);
  else
    v3 = qword_24CFC9178[a3];
  return v3;
}

- (NSString)fullName
{
  NSString *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;

  v3 = self->_detailedName;
  v4 = v3;
  if (v3 && -[NSString length](v3, "length"))
    v5 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@ %@"), self->_name, v4);
  else
    v5 = self->_name;
  v6 = v5;

  return v6;
}

- (BOOL)eligibleForProcessView
{
  unsigned int share_mode;
  BOOL v4;
  int v5;
  BOOL v6;
  BOOL result;

  result = !-[FPMemoryRegion inSharedCache](self, "inSharedCache")
        && ((share_mode = self->_share_mode, v4 = share_mode > 6, v5 = (1 << share_mode) & 0x4C, !v4)
          ? (v6 = v5 == 0)
          : (v6 = 1),
            v6)
        && self->_segment - 5 < 0xFFFFFFFD;
  return result;
}

- (BOOL)eligibleForSubrangesUsingPageSize:(unint64_t)a3
{
  _BOOL4 v5;
  unint64_t dirtySize;
  unint64_t size;
  unint64_t swappedSize;
  unint64_t cleanSize;
  unint64_t reclaimableSize;

  if (-[FPMemoryRegion isFake](self, "isFake"))
    goto LABEL_9;
  v5 = -[FPMemoryRegion eligibleForProcessView](self, "eligibleForProcessView");
  if (v5)
  {
    if (self->_size <= a3
      || -[FPMemoryRegion ownedExclusivelyByParentProcess](self, "ownedExclusivelyByParentProcess")
      || (dirtySize = self->_dirtySize, size = self->_size, dirtySize == size)
      || (swappedSize = self->_swappedSize, swappedSize == size)
      || (cleanSize = self->_cleanSize, cleanSize == size)
      || (reclaimableSize = self->_reclaimableSize, reclaimableSize == size))
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (swappedSize | dirtySize | cleanSize | reclaimableSize) != 0;
  }
  return v5;
}

- (BOOL)isFake
{
  return self->_user_tag == -1;
}

- (BOOL)privateSharedCacheRegion
{
  int segment;

  if ((*((_BYTE *)self + 8) & 2) == 0)
    return 0;
  segment = self->_segment;
  if (segment == 2 || segment == 4)
    return 0;
  if (self->_dirtySize)
    return 1;
  return self->_swappedSize != 0;
}

- (NSString)description
{
  unint64_t offset;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t start;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v14;

  offset = self->_offset;
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[FPMemoryRegion fullName](self, "fullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (offset)
  {
    v6 = self->_offset;
    start = self->_start;
    v8 = -[FPMemoryRegion end](self, "end");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_size);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ Offset %#llx [%#llx - %#llx](%@)"), v5, v6, start, v8, v9);
  }
  else
  {
    v10 = self->_start;
    v11 = -[FPMemoryRegion end](self, "end");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_size);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ [%#llx - %#llx](%@)"), v5, v10, v11, v9, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSArray)memoryRegions
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = self;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (int)ownerPid
{
  return -1;
}

- (BOOL)finalizeObject
{
  return 1;
}

- (BOOL)couldHaveProcessView
{
  return 0;
}

- (id)ensureMemoryObject
{
  FPMemoryObject *v3;
  FPMemoryObject *v4;

  v3 = objc_alloc_init(FPMemoryObject);
  v4 = v3;
  self->_memoryObject = v3;
  if (v3)
    sub_21345B7F4((uint64_t)v3, self, *MEMORY[0x24BDB03A8], 0);
  return v4;
}

- (NSString)extendedInfo
{
  void *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_253D9AA20);
  if (qword_253D9AA38[0] != -1)
    dispatch_once(qword_253D9AA38, &unk_24CFC91C8);
  objc_msgSend((id)qword_253D9AA30, "objectForKey:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_253D9AA20);
  return (NSString *)v3;
}

- (void)setExtendedInfo:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_253D9AA20);
  if (qword_253D9AA38[0] != -1)
    dispatch_once(qword_253D9AA38, &unk_24CFC91C8);
  objc_msgSend((id)qword_253D9AA30, "setObject:forKey:", v4, self);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_253D9AA20);
}

- (unint64_t)dirtySize
{
  return self->_dirtySize;
}

- (void)setDirtySize:(unint64_t)a3
{
  self->_dirtySize = a3;
}

- (unint64_t)swappedSize
{
  return self->_swappedSize;
}

- (void)setSwappedSize:(unint64_t)a3
{
  self->_swappedSize = a3;
}

- (unint64_t)cleanSize
{
  return self->_cleanSize;
}

- (void)setCleanSize:(unint64_t)a3
{
  self->_cleanSize = a3;
}

- (unint64_t)reclaimableSize
{
  return self->_reclaimableSize;
}

- (void)setReclaimableSize:(unint64_t)a3
{
  self->_reclaimableSize = a3;
}

- (NSString)detailedName
{
  return self->_detailedName;
}

- (void)setDetailedName:(id)a3
{
  objc_storeStrong((id *)&self->_detailedName, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (FPMemoryObject)memoryObject
{
  return self->_memoryObject;
}

- (void)setMemoryObject:(id)a3
{
  self->_memoryObject = (FPMemoryObject *)a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unint64_t)start
{
  return self->_start;
}

- (void)setStart:(unint64_t)a3
{
  self->_start = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unsigned)segment
{
  return self->_segment;
}

- (void)setSegment:(unsigned __int8)a3
{
  self->_segment = a3;
}

- (unsigned)user_tag
{
  return self->_user_tag;
}

- (void)setUser_tag:(unsigned int)a3
{
  self->_user_tag = a3;
}

- (unint64_t)object_id
{
  return self->_object_id;
}

- (void)setObject_id:(unint64_t)a3
{
  self->_object_id = a3;
}

- (unsigned)share_mode
{
  return self->_share_mode;
}

- (void)setShare_mode:(unsigned __int8)a3
{
  self->_share_mode = a3;
}

- (FPRangeList)subrangeList
{
  return self->_subrangeList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subrangeList, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_detailedName, 0);
}

@end
