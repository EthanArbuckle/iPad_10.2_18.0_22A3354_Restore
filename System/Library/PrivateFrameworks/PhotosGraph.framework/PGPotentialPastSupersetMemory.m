@implementation PGPotentialPastSupersetMemory

- (PGPotentialPastSupersetMemory)initWithSupersetLocationNode:(id)a3 supersetDateInterval:(id)a4 interestingMomentNodes:(id)a5 momentNodes:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  PGPotentialPastSupersetMemory *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(a6, "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)PGPotentialPastSupersetMemory;
  v15 = -[PGPotentialMemory initWithCategory:subcategory:momentNodes:sourceType:](&v17, sel_initWithCategory_subcategory_momentNodes_sourceType_, 301, 211, v14, 3);

  if (v15)
  {
    objc_storeStrong((id *)&v15->_supersetLocationNode, a3);
    objc_storeStrong((id *)&v15->_supersetDateInterval, a4);
    objc_storeStrong((id *)&v15->_interestingMomentNodes, a5);
  }

  return v15;
}

- (unint64_t)memoryCategory
{
  return 20;
}

- (unint64_t)memoryCategorySubcategory
{
  return 13001;
}

- (id)memoryFeatureNodesInGraph:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PGGraphFeatureNodeCollection *v10;

  v4 = (objc_class *)MEMORY[0x1E0D429B0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[PGGraphLocationNode label](self->_supersetLocationNode, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("City")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("State")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("Country")))
  {
    objc_msgSend(v6, "addIdentifier:", -[MANode identifier](self->_supersetLocationNode, "identifier"));
  }
  -[PGGraphMomentNodeCollection frequentLocationNodes](self->_interestingMomentNodes, "frequentLocationNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "elementIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionWithIdentifierSet:", v9);

  v10 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphFeatureNodeCollection alloc], "initWithGraph:elementIdentifiers:", v5, v6);
  return v10;
}

- (PGGraphLocationNode)supersetLocationNode
{
  return (PGGraphLocationNode *)objc_getProperty(self, a2, 176, 1);
}

- (NSDateInterval)supersetDateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 184, 1);
}

- (PGGraphMomentNodeCollection)interestingMomentNodes
{
  return (PGGraphMomentNodeCollection *)objc_getProperty(self, a2, 192, 1);
}

- (PGGraphLocationNodeCollection)supersetLocationNodes
{
  return (PGGraphLocationNodeCollection *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSupersetLocationNodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supersetLocationNodes, 0);
  objc_storeStrong((id *)&self->_interestingMomentNodes, 0);
  objc_storeStrong((id *)&self->_supersetDateInterval, 0);
  objc_storeStrong((id *)&self->_supersetLocationNode, 0);
}

@end
