@implementation FPMemoryCategory

- (FPMemoryCategory)init
{
  return (FPMemoryCategory *)-[FPMemoryCategory initSummary:](self, "initSummary:", 0);
}

- (id)initSummary:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FPMemoryCategory;
  result = -[FPMemoryCategory init](&v5, sel_init);
  if (result)
  {
    *((_BYTE *)result + 8) = a3;
    *((_OWORD *)result + 2) = 0u;
    *((_OWORD *)result + 3) = 0u;
    *((_QWORD *)result + 8) = 0;
  }
  return result;
}

- (NSString)name
{
  NSString *name;
  NSString *v4;
  NSString *v5;

  name = self->_name;
  if (!name)
  {
    -[FPMemoryObject name](self->_firstMemoryObject, "name");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_name;
    self->_name = v4;

    name = self->_name;
  }
  return name;
}

- (NSString)detailedName
{
  if (self->_isSummary)
    return (NSString *)0;
  -[FPMemoryObject detailedName](self->_firstMemoryObject, "detailedName");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)fullName
{
  if (self->_isSummary)
    -[FPMemoryCategory name](self, "name");
  else
    -[FPMemoryObject fullName](self->_firstMemoryObject, "fullName");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)verbose
{
  return -[FPMemoryObject verbose](self->_firstMemoryObject, "verbose");
}

- (NSDictionary)auxData
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  -[FPMemoryObject auxData](self->_firstMemoryObject, "auxData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_isSummary)
  {
    v5 = v3;
  }
  else
  {
    -[FPMemoryObject detailedAuxData](self->_firstMemoryObject, "detailedAuxData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v4, "fp_mergeWithData:forceAggregate:", v5, 1);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v6;
    }
  }

  return (NSDictionary *)v5;
}

- (NSString)auxDataFullName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  -[FPMemoryObject auxDataName](self->_firstMemoryObject, "auxDataName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_isSummary)
  {
    v5 = v3;
  }
  else
  {
    -[FPMemoryObject detailedAuxDataName](self->_firstMemoryObject, "detailedAuxDataName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@ %@"), v4, v6);
    else
      v7 = v4;
    v5 = v7;

  }
  return (NSString *)v5;
}

- (void)addMemoryObject:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (!self->_firstMemoryObject)
  {
    objc_storeStrong((id *)&self->_firstMemoryObject, a3);
    v5 = v6;
  }
  self->_totalDirtySize += objc_msgSend(v5, "dirtySize");
  self->_totalSwappedSize += objc_msgSend(v6, "swappedSize");
  self->_totalCleanSize += objc_msgSend(v6, "cleanSize");
  self->_totalReclaimableSize += objc_msgSend(v6, "reclaimableSize");
  self->_totalWiredSize += objc_msgSend(v6, "wiredSize");
  self->_totalRegions += objc_msgSend(v6, "totalRegions");

}

- (unint64_t)totalDirtySize
{
  return self->_totalDirtySize;
}

- (void)setTotalDirtySize:(unint64_t)a3
{
  self->_totalDirtySize = a3;
}

- (unint64_t)totalSwappedSize
{
  return self->_totalSwappedSize;
}

- (void)setTotalSwappedSize:(unint64_t)a3
{
  self->_totalSwappedSize = a3;
}

- (unint64_t)totalCleanSize
{
  return self->_totalCleanSize;
}

- (void)setTotalCleanSize:(unint64_t)a3
{
  self->_totalCleanSize = a3;
}

- (unint64_t)totalReclaimableSize
{
  return self->_totalReclaimableSize;
}

- (void)setTotalReclaimableSize:(unint64_t)a3
{
  self->_totalReclaimableSize = a3;
}

- (unint64_t)totalWiredSize
{
  return self->_totalWiredSize;
}

- (void)setTotalWiredSize:(unint64_t)a3
{
  self->_totalWiredSize = a3;
}

- (unsigned)totalRegions
{
  return self->_totalRegions;
}

- (void)setTotalRegions:(unsigned int)a3
{
  self->_totalRegions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstMemoryObject, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
