@implementation PGGraphMemoryNodeCollection

- (PGGraphFeatureNodeCollection)featureNodes
{
  void *v3;
  void *v4;

  +[PGGraphMemoryNode featureOfMemory](PGGraphMemoryNode, "featureOfMemory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphFeatureNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphFeatureNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphMemoryNode momentOfMemory](PGGraphMemoryNode, "momentOfMemory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (NSSet)uniqueMemoryIdentifiers
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PGGraphMemoryNodeCollection_uniqueMemoryIdentifiers__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("memid"), v6);

  return (NSSet *)v4;
}

- (NSArray)memoryCategorySubcategories
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PGGraphMemoryNodeCollection_memoryCategorySubcategories__block_invoke;
  v6[3] = &unk_1E842E828;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateUnsignedIntegerPropertyValuesForKey:withBlock:](self, "enumerateUnsignedIntegerPropertyValuesForKey:withBlock:", CFSTR("subcategory"), v6);

  return (NSArray *)v4;
}

- (id)subsetWithMemoryCategory:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[PGGraphMemoryNode filterWithMemoryCategory:](PGGraphMemoryNode, "filterWithMemoryCategory:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodesRelatedToNodes:withRelation:", self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)subsetWithMemoryCategories:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[PGGraphMemoryNode filterWithMemoryCategories:](PGGraphMemoryNode, "filterWithMemoryCategories:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMemoryNodeCollection, "nodesRelatedToNodes:withRelation:", self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enumerateMemoryCategorySubcategoriesUsingBlock:(id)a3
{
  -[MANodeCollection enumerateUnsignedIntegerPropertyValuesForKey:withBlock:](self, "enumerateUnsignedIntegerPropertyValuesForKey:withBlock:", CFSTR("subcategory"), a3);
}

- (void)enumerateMemoryUniqueIdentifierUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__PGGraphMemoryNodeCollection_enumerateMemoryUniqueIdentifierUsingBlock___block_invoke;
  v6[3] = &unk_1E8432440;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("memid"), v6);

}

uint64_t __73__PGGraphMemoryNodeCollection_enumerateMemoryUniqueIdentifierUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__PGGraphMemoryNodeCollection_memoryCategorySubcategories__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

uint64_t __54__PGGraphMemoryNodeCollection_uniqueMemoryIdentifiers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)memoryNodesOfCategory:(unint64_t)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PGGraphMemoryNode filterWithMemoryCategory:](PGGraphMemoryNode, "filterWithMemoryCategory:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphMemoryNodeCollection, "nodesMatchingFilter:inGraph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)memoryNodesOfCategories:(id)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PGGraphMemoryNode filterWithMemoryCategories:](PGGraphMemoryNode, "filterWithMemoryCategories:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphMemoryNodeCollection, "nodesMatchingFilter:inGraph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)memoryNodeAsCollectionWithUniqueIdentifier:(id)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PGGraphMemoryNode filterWithUniqueMemoryIdentifier:](PGGraphMemoryNode, "filterWithUniqueMemoryIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphMemoryNodeCollection, "nodesMatchingFilter:inGraph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)memoryNodesWithUniqueIdentifiers:(id)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PGGraphMemoryNode filterWithUniqueMemoryIdentifiers:](PGGraphMemoryNode, "filterWithUniqueMemoryIdentifiers:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphMemoryNodeCollection, "nodesMatchingFilter:inGraph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)memoryNodesWithUniqueIdentifierArray:(id)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PGGraphMemoryNode filterWithUniqueMemoryIdentifierArray:](PGGraphMemoryNode, "filterWithUniqueMemoryIdentifierArray:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphMemoryNodeCollection, "nodesMatchingFilter:inGraph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
