@implementation PGGraphMemoriesEnrichmentProcessorMemoryNodesToSort

- (PGGraphMemoriesEnrichmentProcessorMemoryNodesToSort)init
{
  PGGraphMemoriesEnrichmentProcessorMemoryNodesToSort *v2;
  PGGraphMemoriesEnrichmentProcessorMemoryNodesToSort *v3;
  NSArray *memoryNodesWithoutLocalMemory;
  NSArray *v5;
  NSArray *memoryNodesWithoutLocalMemoryLastEnrichmentDate;
  NSArray *memoryNodesWithLocalMemoryLastEnrichmentDate;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PGGraphMemoriesEnrichmentProcessorMemoryNodesToSort;
  v2 = -[PGGraphMemoriesEnrichmentProcessorMemoryNodesToSort init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    memoryNodesWithoutLocalMemory = v2->_memoryNodesWithoutLocalMemory;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_memoryNodesWithoutLocalMemory = (NSArray *)MEMORY[0x1E0C9AA60];

    memoryNodesWithoutLocalMemoryLastEnrichmentDate = v3->_memoryNodesWithoutLocalMemoryLastEnrichmentDate;
    v3->_memoryNodesWithoutLocalMemoryLastEnrichmentDate = v5;

    memoryNodesWithLocalMemoryLastEnrichmentDate = v3->_memoryNodesWithLocalMemoryLastEnrichmentDate;
    v3->_memoryNodesWithLocalMemoryLastEnrichmentDate = v5;

  }
  return v3;
}

- (NSArray)memoryNodesWithoutLocalMemory
{
  return self->_memoryNodesWithoutLocalMemory;
}

- (void)setMemoryNodesWithoutLocalMemory:(id)a3
{
  objc_storeStrong((id *)&self->_memoryNodesWithoutLocalMemory, a3);
}

- (NSArray)memoryNodesWithoutLocalMemoryLastEnrichmentDate
{
  return self->_memoryNodesWithoutLocalMemoryLastEnrichmentDate;
}

- (void)setMemoryNodesWithoutLocalMemoryLastEnrichmentDate:(id)a3
{
  objc_storeStrong((id *)&self->_memoryNodesWithoutLocalMemoryLastEnrichmentDate, a3);
}

- (NSArray)memoryNodesWithLocalMemoryLastEnrichmentDate
{
  return self->_memoryNodesWithLocalMemoryLastEnrichmentDate;
}

- (void)setMemoryNodesWithLocalMemoryLastEnrichmentDate:(id)a3
{
  objc_storeStrong((id *)&self->_memoryNodesWithLocalMemoryLastEnrichmentDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryNodesWithLocalMemoryLastEnrichmentDate, 0);
  objc_storeStrong((id *)&self->_memoryNodesWithoutLocalMemoryLastEnrichmentDate, 0);
  objc_storeStrong((id *)&self->_memoryNodesWithoutLocalMemory, 0);
}

@end
