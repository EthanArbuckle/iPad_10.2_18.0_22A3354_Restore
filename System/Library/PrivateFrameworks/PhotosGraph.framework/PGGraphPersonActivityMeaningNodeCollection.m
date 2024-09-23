@implementation PGGraphPersonActivityMeaningNodeCollection

- (id)subsetWithActivityLabels:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[PGGraphPersonActivityMeaningNode filterWithActivityLabels:](PGGraphPersonActivityMeaningNode, "filterWithActivityLabels:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonActivityMeaningNodeCollection, "nodesRelatedToNodes:withRelation:", self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)personLocalIdentifiers
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12447;
  v10 = __Block_byref_object_dispose__12448;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PGGraphPersonActivityMeaningNodeCollection_personLocalIdentifiers__block_invoke;
  v5[3] = &unk_1E84292F8;
  v5[4] = &v6;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("identifier"), v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonActivityMeaningNode momentOfPersonActivity](PGGraphPersonActivityMeaningNode, "momentOfPersonActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)personNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonActivityMeaningNode personOfPersonActivity](PGGraphPersonActivityMeaningNode, "personOfPersonActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

uint64_t __68__PGGraphPersonActivityMeaningNodeCollection_personLocalIdentifiers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:");
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)personActivityMeaningNodesForActivityLabel:(id)a3 personLocalIdentifiers:(id)a4 inGraph:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a5;
  +[PGGraphPersonActivityMeaningNode filterWithPersonLocalIdentifiers:label:](PGGraphPersonActivityMeaningNode, "filterWithPersonLocalIdentifiers:label:", a4, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphPersonActivityMeaningNodeCollection, "nodesMatchingFilter:inGraph:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)personActivityMeaningNodesForActivityLabel:(id)a3 inGraph:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x1E0D42A50];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithLabel:domain:properties:", v7, 701, MEMORY[0x1E0C9AA70]);

  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphPersonActivityMeaningNodeCollection, "nodesMatchingFilter:inGraph:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)personActivityMeaningNodesForActivityLabels:(id)a3 inGraph:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x1E0D42A50];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithLabels:domain:properties:", v7, 701, MEMORY[0x1E0C9AA70]);

  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphPersonActivityMeaningNodeCollection, "nodesMatchingFilter:inGraph:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
