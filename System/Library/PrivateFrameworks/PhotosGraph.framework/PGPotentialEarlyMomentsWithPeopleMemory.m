@implementation PGPotentialEarlyMomentsWithPeopleMemory

- (PGPotentialEarlyMomentsWithPeopleMemory)initWithMomentNodes:(id)a3 personNodes:(id)a4
{
  id v7;
  PGPotentialEarlyMomentsWithPeopleMemory *v8;
  PGPotentialEarlyMomentsWithPeopleMemory *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGPotentialEarlyMomentsWithPeopleMemory;
  v8 = -[PGPotentialMemory initWithCategory:subcategory:momentNodes:sourceType:](&v11, sel_initWithCategory_subcategory_momentNodes_sourceType_, 219, 0, a3, 2);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_personNodes, a4);

  return v9;
}

- (unint64_t)memoryCategory
{
  return 4;
}

- (unint64_t)memoryCategorySubcategory
{
  return 2004;
}

- (id)memoryFeatureNodesInGraph:(id)a3
{
  id v4;
  PGGraphPersonNodeCollection *v5;
  void *v6;

  v4 = a3;
  v5 = -[MAElementCollection initWithSet:graph:]([PGGraphPersonNodeCollection alloc], "initWithSet:graph:", self->_personNodes, v4);

  -[PGGraphPersonNodeCollection featureNodeCollection](v5, "featureNodeCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSSet)personNodes
{
  return self->_personNodes;
}

- (NSArray)facedAssetLocalIdentifiers
{
  return self->_facedAssetLocalIdentifiers;
}

- (void)setFacedAssetLocalIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_facedAssetLocalIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facedAssetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_personNodes, 0);
}

@end
