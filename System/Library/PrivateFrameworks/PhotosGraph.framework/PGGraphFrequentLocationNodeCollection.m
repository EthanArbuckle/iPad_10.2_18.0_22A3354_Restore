@implementation PGGraphFrequentLocationNodeCollection

- (void)enumerateUniversalEndDatesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__PGGraphFrequentLocationNodeCollection_enumerateUniversalEndDatesUsingBlock___block_invoke;
  v6[3] = &unk_1E84338D8;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("universalEndDate"), v6);

}

- (void)enumerateNodesAsCollectionsSortedByUniversalEndDateWithOrderAscending:(BOOL)a3 usingBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __122__PGGraphFrequentLocationNodeCollection_enumerateNodesAsCollectionsSortedByUniversalEndDateWithOrderAscending_usingBlock___block_invoke;
  v8[3] = &unk_1E842BAB0;
  v9 = v6;
  v7 = v6;
  -[MANodeCollection enumerateNodesAsCollectionsSortedByDoublePropertyForName:ascending:usingBlock:](self, "enumerateNodesAsCollectionsSortedByDoublePropertyForName:ascending:usingBlock:", CFSTR("universalEndDate"), v4, v8);

}

- (PGGraphAddressNodeCollection)addressNodes
{
  void *v3;
  void *v4;

  +[PGGraphFrequentLocationNode addressOfFrequentLocation](PGGraphFrequentLocationNode, "addressOfFrequentLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphAddressNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphAddressNodeCollection *)v4;
}

- (PGGraphAddressNodeCollection)preciseAddressNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphFrequentLocationNode addressOfFrequentLocation](PGGraphFrequentLocationNode, "addressOfFrequentLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  +[PGGraphAddressNode preciseFilter](PGGraphAddressNode, "preciseFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphAddressNodeCollection, "nodesRelatedToNodes:withRelation:", self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphAddressNodeCollection *)v9;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphFrequentLocationNode momentOfFrequentLocation](PGGraphFrequentLocationNode, "momentOfFrequentLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

uint64_t __122__PGGraphFrequentLocationNodeCollection_enumerateNodesAsCollectionsSortedByUniversalEndDateWithOrderAscending_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__PGGraphFrequentLocationNodeCollection_enumerateUniversalEndDatesUsingBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end
