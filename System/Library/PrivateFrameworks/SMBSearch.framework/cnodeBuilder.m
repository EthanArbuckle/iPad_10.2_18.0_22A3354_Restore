@implementation cnodeBuilder

- (cnodeBuilder)initWithType:(unsigned int)a3 Weight:(unsigned int)a4
{
  cnodeBuilder *v6;
  cnodeBuilder *v7;
  cNodeRestriction *rootNode;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)cnodeBuilder;
  v6 = -[cnodeBuilder init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_ulType = a3;
    v6->_weight = a4;
    rootNode = v6->_rootNode;
    v6->_rootNode = 0;

  }
  return v7;
}

- (int)appendRestriction:(id)a3
{
  id v4;
  cNodeRestriction *rootNode;
  cNodeRestriction *v6;
  cNodeRestriction *v7;
  cNodeRestriction *v8;
  cNodeRestriction *v9;
  cNodeRestriction *v10;
  cNodeRestriction *v11;
  cNodeRestriction *v12;
  int v13;

  v4 = a3;
  rootNode = self->_rootNode;
  if (!rootNode)
  {
    v7 = -[cNodeRestriction initWithType:Weight:]([cNodeRestriction alloc], "initWithType:Weight:", self->_ulType, self->_weight);
    v8 = self->_rootNode;
    self->_rootNode = v7;

    v6 = self->_rootNode;
    if (v6)
      goto LABEL_5;
LABEL_9:
    v13 = 12;
    goto LABEL_10;
  }
  if (-[cNodeRestriction nodeCount](rootNode, "nodeCount") > 1)
  {
    v9 = -[cNodeRestriction initWithType:Weight:]([cNodeRestriction alloc], "initWithType:Weight:", self->_ulType, self->_weight);
    if (v9)
    {
      v10 = v9;
      -[cNodeRestriction appendRestriction:](v9, "appendRestriction:", self->_rootNode);
      -[cNodeRestriction appendRestriction:](v10, "appendRestriction:", v4);
      v11 = self->_rootNode;
      self->_rootNode = v10;
      v12 = v10;

      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v6 = self->_rootNode;
LABEL_5:
  -[cNodeRestriction appendRestriction:](v6, "appendRestriction:", v4);
LABEL_8:
  v13 = 0;
LABEL_10:

  return v13;
}

- (unsigned)ulType
{
  return self->_ulType;
}

- (void)setUlType:(unsigned int)a3
{
  self->_ulType = a3;
}

- (unsigned)weight
{
  return self->_weight;
}

- (void)setWeight:(unsigned int)a3
{
  self->_weight = a3;
}

- (cNodeRestriction)rootNode
{
  return (cNodeRestriction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRootNode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNode, 0);
}

@end
