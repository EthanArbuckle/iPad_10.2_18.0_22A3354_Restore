@implementation PGUpNextMemoriesGenerationResult

- (PGUpNextMemoriesGenerationResult)initWithMemoryLocalIdentifiers:(id)a3 debugInfo:(id)a4
{
  id v7;
  id v8;
  PGUpNextMemoriesGenerationResult *v9;
  PGUpNextMemoriesGenerationResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGUpNextMemoriesGenerationResult;
  v9 = -[PGUpNextMemoriesGenerationResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memoryLocalIdentifiers, a3);
    objc_storeStrong((id *)&v10->_debugInfo, a4);
  }

  return v10;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v2;
  NSString *debugInfo;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D72368];
  v5[0] = *MEMORY[0x1E0D72370];
  v5[1] = v2;
  debugInfo = self->_debugInfo;
  v6[0] = self->_memoryLocalIdentifiers;
  v6[1] = debugInfo;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)memoryLocalIdentifiers
{
  return self->_memoryLocalIdentifiers;
}

- (NSString)debugInfo
{
  return self->_debugInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_memoryLocalIdentifiers, 0);
}

@end
