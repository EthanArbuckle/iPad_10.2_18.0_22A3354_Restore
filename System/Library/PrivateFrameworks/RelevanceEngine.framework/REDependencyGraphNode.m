@implementation REDependencyGraphNode

- (unint64_t)hash
{
  return objc_msgSend(self->_item, "hash");
}

- (REDependencyGraphNode)initWithItem:(id)a3
{
  id v5;
  REDependencyGraphNode *v6;
  REDependencyGraphNode *v7;
  uint64_t v8;
  NSHashTable *connections;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REDependencyGraphNode;
  v6 = -[REDependencyGraphNode init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_item, a3);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    connections = v7->_connections;
    v7->_connections = (NSHashTable *)v8;

  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  REDependencyGraphNode *v4;
  id item;
  id v6;
  id v7;
  void *v8;
  char v9;

  v4 = (REDependencyGraphNode *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      item = self->_item;
      v6 = v4->_item;
      v7 = item;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = objc_msgSend(v7, "isEqual:", v6);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (NSHashTable)connections
{
  return self->_connections;
}

- (id)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong(&self->_item, 0);
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

@end
