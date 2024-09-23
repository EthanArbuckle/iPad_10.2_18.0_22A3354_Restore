@implementation FPMemoryRegion

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

- (unint64_t)wiredSize
{
  if (self)
  {
    if ((*(_BYTE *)(self + 8) & 1) != 0)
      return *(_QWORD *)(self + 88);
    else
      return 0;
  }
  return self;
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

- (NSString)fullName
{
  NSString *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;

  v3 = self->_detailedName;
  v4 = v3;
  if (v3 && -[NSString length](v3, "length"))
    v5 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@ %@"), self->_name, v4);
  else
    v5 = self->_name;
  v6 = v5;

  return v6;
}

- (NSString)description
{
  unint64_t offset;
  void *v4;
  unint64_t v5;
  unint64_t start;
  uint64_t v7;
  void *v8;
  NSString *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  offset = self->_offset;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FPMemoryRegion fullName](self, "fullName"));
  if (offset)
  {
    v5 = self->_offset;
    start = self->_start;
    if (start == -1)
      v7 = -1;
    else
      v7 = self->_size + start;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Offset %#llx [%#llx - %#llx](%@)"), v4, v5, start, v7, v8);
  }
  else
  {
    v10 = self->_start;
    if (v10 == -1)
      v11 = -1;
    else
      v11 = self->_size + v10;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ [%#llx - %#llx](%@)"), v4, v10, v11, v8, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return (NSString *)v12;
}

- (NSArray)memoryRegions
{
  FPMemoryRegion *v3;

  v3 = self;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (BOOL)containsFakeRegion
{
  if (self)
    LOBYTE(self) = self->_user_tag == -1;
  return (char)self;
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
    sub_100006970((uint64_t)v3, self, vm_kernel_page_size, 0);
  return v4;
}

- (NSString)extendedInfo
{
  void *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000348C8);
  if (qword_1000348E0[0] != -1)
    dispatch_once(qword_1000348E0, &stru_1000290B8);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000348D8, "objectForKey:", self));
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000348C8);
  return (NSString *)v3;
}

- (void)setExtendedInfo:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000348C8);
  if (qword_1000348E0[0] != -1)
    dispatch_once(qword_1000348E0, &stru_1000290B8);
  objc_msgSend((id)qword_1000348D8, "setObject:forKey:", v4, self);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000348C8);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subrangeList, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_detailedName, 0);
}

@end
