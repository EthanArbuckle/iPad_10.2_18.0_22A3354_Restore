@implementation REMCRUndo

- (REMCRUndo)init
{
  return -[REMCRUndo initWithUndoBlocks:](self, "initWithUndoBlocks:", MEMORY[0x1E0C9AA60]);
}

- (REMCRUndo)initWithUndoBlocks:(id)a3
{
  id v4;
  REMCRUndo *v5;
  uint64_t v6;
  NSArray *undoBlocks;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMCRUndo;
  v5 = -[REMCRUndo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    undoBlocks = v5->_undoBlocks;
    v5->_undoBlocks = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)undoBlocks
{
  return self->_undoBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoBlocks, 0);
}

@end
