@implementation FPMemoryMultiRegion

- (id)auxData
{
  FPAuxData *v2;
  void *v3;
  const __CFString *v5;
  FPAuxData *v6;

  v5 = CFSTR("element_size");
  v2 = -[FPAuxData initWithValue:shouldAggregate:]([FPAuxData alloc], "initWithValue:shouldAggregate:", self->_regionSize, 0);
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return v3;
}

- (NSString)auxDataName
{
  NSString *auxDataName;
  NSString *v4;
  objc_super v5;

  auxDataName = self->_auxDataName;
  if (auxDataName)
    return auxDataName;
  v5.receiver = self;
  v5.super_class = (Class)FPMemoryMultiRegion;
  v4 = -[FPMemoryRegion auxDataName](&v5, "auxDataName");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (void)setAuxDataName:(id)a3
{
  objc_storeStrong((id *)&self->_auxDataName, a3);
}

- (unsigned)totalRegions
{
  return self->_totalRegions;
}

- (void)setTotalRegions:(unsigned int)a3
{
  self->_totalRegions = a3;
}

- (unint64_t)regionSize
{
  return self->_regionSize;
}

- (void)setRegionSize:(unint64_t)a3
{
  self->_regionSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxDataName, 0);
}

@end
