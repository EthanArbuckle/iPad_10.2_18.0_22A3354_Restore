@implementation VMUDirectDominees

- (VMUDirectDominees)initWithDominatorGraph:(id)a3 rootNode:(unsigned int)a4
{
  VMUDominatorGraph *v6;
  VMUDominatorGraph *dg;

  v6 = (VMUDominatorGraph *)a3;
  self->_node = -[VMUDominatorGraph firstDominates](v6, "firstDominates")[4 * a4];
  dg = self->_dg;
  self->_dg = v6;

  return self;
}

- (id)nextObject
{
  void *v3;

  if (self->_node == -1)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_node = -[VMUDominatorGraph nextDominates](self->_dg, "nextDominates")[4 * self->_node];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dg, 0);
}

@end
