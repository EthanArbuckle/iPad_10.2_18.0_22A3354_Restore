@implementation PGGraphMemory

- (PGGraphMemory)initWithMemoryCategory:(unint64_t)a3 memoryCategorySubcategory:(unint64_t)a4 momentNodes:(id)a5 featureNodes:(id)a6 generatedWithFallbackRequirements:(BOOL)a7
{
  id v13;
  id v14;
  PGGraphMemory *v15;
  PGGraphMemory *v16;
  objc_super v18;

  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGGraphMemory;
  v15 = -[PGGraphMemory init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_memoryCategory = a3;
    v15->_memoryCategorySubcategory = a4;
    objc_storeStrong((id *)&v15->_memoryMomentNodes, a5);
    objc_storeStrong((id *)&v16->_memoryFeatureNodes, a6);
    v16->_generatedWithFallbackRequirements = a7;
  }

  return v16;
}

- (PGGraphMemory)initWithMemoryCategory:(unint64_t)a3 memoryCategorySubcategory:(unint64_t)a4 momentNodes:(id)a5 featureNodes:(id)a6
{
  return -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:generatedWithFallbackRequirements:](self, "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:generatedWithFallbackRequirements:", a3, a4, a5, a6, 0);
}

- (id)memoryFeatureNodesInGraph:(id)a3
{
  return self->_memoryFeatureNodes;
}

- (NSString)uniqueMemoryIdentifier
{
  void *v3;
  void *v4;

  +[PGGraphBuilder memoryLabelForCategory:](PGGraphBuilder, "memoryLabelForCategory:", self->_memoryCategory);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMemoryNode uniqueMemoryIdentifierWithMemoryLabel:featureNodes:](PGGraphMemoryNode, "uniqueMemoryIdentifierWithMemoryLabel:featureNodes:", v3, self->_memoryFeatureNodes);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PGGraphMemory;
  -[PGGraphMemory description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphBuilder memoryLabelForCategory:](PGGraphBuilder, "memoryLabelForCategory:", self->_memoryCategory);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@, momentNodes: %@, featureNodes: %@"), v4, v5, self->_memoryMomentNodes, self->_memoryFeatureNodes);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)memoryCategory
{
  return self->_memoryCategory;
}

- (unint64_t)memoryCategorySubcategory
{
  return self->_memoryCategorySubcategory;
}

- (PGGraphMomentNodeCollection)memoryMomentNodes
{
  return self->_memoryMomentNodes;
}

- (PGGraphFeatureNodeCollection)memoryFeatureNodes
{
  return self->_memoryFeatureNodes;
}

- (BOOL)generatedWithFallbackRequirements
{
  return self->_generatedWithFallbackRequirements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryFeatureNodes, 0);
  objc_storeStrong((id *)&self->_memoryMomentNodes, 0);
}

@end
