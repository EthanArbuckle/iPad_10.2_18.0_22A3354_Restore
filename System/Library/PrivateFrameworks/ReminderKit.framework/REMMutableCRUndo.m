@implementation REMMutableCRUndo

- (REMMutableCRUndo)init
{
  REMMutableCRUndo *v2;
  uint64_t v3;
  NSMutableArray *undoBlocks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REMMutableCRUndo;
  v2 = -[REMMutableCRUndo init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    undoBlocks = v2->_undoBlocks;
    v2->_undoBlocks = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addUndoBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMMutableCRUndo undoBlocks](self, "undoBlocks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1B5E3E098](v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (id)immutableCopy
{
  REMCRUndo *v3;
  void *v4;
  void *v5;
  REMCRUndo *v6;

  v3 = [REMCRUndo alloc];
  -[REMMutableCRUndo undoBlocks](self, "undoBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = -[REMCRUndo initWithUndoBlocks:](v3, "initWithUndoBlocks:", v5);

  return v6;
}

- (NSMutableArray)undoBlocks
{
  return self->_undoBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoBlocks, 0);
}

@end
