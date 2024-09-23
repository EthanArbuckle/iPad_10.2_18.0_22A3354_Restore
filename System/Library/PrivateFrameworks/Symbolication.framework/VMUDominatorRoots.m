@implementation VMUDominatorRoots

- (VMUDominatorRoots)initWithDominatorGraph:(id)a3
{
  self->_i = 0;
  objc_storeStrong((id *)&self->_dg, a3);
  return self;
}

- (id)nextObject
{
  unsigned int v3;
  unsigned int *v4;
  unsigned int *v5;
  uint64_t i;
  int v7;
  void *v8;

  v3 = -[VMUDominatorGraph nodeNamespaceSize](self->_dg, "nodeNamespaceSize");
  v4 = -[VMUDominatorGraph dominators](self->_dg, "dominators");
  v5 = -[VMUDominatorGraph firstDominates](self->_dg, "firstDominates");
  i = self->_i;
  if (v3 <= i)
  {
LABEL_6:
    v8 = 0;
    self->_i = v3;
  }
  else
  {
    v7 = v3 - i;
    while (v4[i] != -1 || v5[i] == -1)
    {
      ++i;
      if (!--v7)
        goto LABEL_6;
    }
    self->_i = i + 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dg, 0);
}

@end
