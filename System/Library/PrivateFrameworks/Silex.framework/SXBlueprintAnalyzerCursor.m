@implementation SXBlueprintAnalyzerCursor

- (SXBlueprintAnalyzerCursor)init
{
  SXBlueprintAnalyzerCursor *v2;
  uint64_t v3;
  NSMutableArray *mutablePath;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXBlueprintAnalyzerCursor;
  v2 = -[SXBlueprintAnalyzerCursor init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    mutablePath = v2->_mutablePath;
    v2->_mutablePath = (NSMutableArray *)v3;

  }
  return v2;
}

- (uint64_t)addPathComponent:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 24), "addObject:", a2);
  return result;
}

- (uint64_t)removePathComponent:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 24), "removeObject:", a2);
  return result;
}

- (id)path
{
  if (a1)
    a1 = (id *)objc_msgSend(a1[3], "copy");
  return a1;
}

- (double)highestMaxY
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (uint64_t)setHighestMaxY:(uint64_t)result
{
  if (result)
    *(double *)(result + 8) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePath, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
