@implementation PXUpNextMemoriesGenerationResult

- (PXUpNextMemoriesGenerationResult)initWithMemories:(id)a3 debugInfo:(id)a4
{
  id v7;
  id v8;
  PXUpNextMemoriesGenerationResult *v9;
  PXUpNextMemoriesGenerationResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXUpNextMemoriesGenerationResult;
  v9 = -[PXUpNextMemoriesGenerationResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memories, a3);
    objc_storeStrong((id *)&v10->_debugInfo, a4);
  }

  return v10;
}

- (PHFetchResult)memories
{
  return self->_memories;
}

- (NSString)debugInfo
{
  return self->_debugInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_memories, 0);
}

@end
