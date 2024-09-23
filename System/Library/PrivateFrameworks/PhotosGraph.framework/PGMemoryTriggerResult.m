@implementation PGMemoryTriggerResult

- (PGMemoryTriggerResult)initWithMemoryNode:(id)a3 validityInterval:(id)a4
{
  id v7;
  id v8;
  PGMemoryTriggerResult *v9;
  PGMemoryTriggerResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGMemoryTriggerResult;
  v9 = -[PGMemoryTriggerResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memoryNode, a3);
    objc_storeStrong((id *)&v10->_validityInterval, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGMemoryTriggerResult;
  -[PGMemoryTriggerResult description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ - Validity: %@"), v4, self->_memoryNode, self->_validityInterval);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PGMemoryNodeProtocol)memoryNode
{
  return self->_memoryNode;
}

- (NSDateInterval)validityInterval
{
  return self->_validityInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validityInterval, 0);
  objc_storeStrong((id *)&self->_memoryNode, 0);
}

@end
