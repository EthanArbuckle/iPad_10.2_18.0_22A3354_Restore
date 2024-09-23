@implementation PGPeopleFeatureExtractor

- (PGPeopleFeatureExtractor)initWithGraph:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  PGPeopleFeatureExtractor *v9;
  id v10;
  void *v11;
  PGPeopleFeatureExtractor *v12;
  objc_super v14;
  _QWORD v15[4];
  PGPeopleFeatureExtractor *v16;
  id v17;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:](PGGraphPersonNodeCollection, "personNodesExcludingMeInGraph:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__PGPeopleFeatureExtractor_initWithGraph_error___block_invoke;
  v15[3] = &unk_1E8435398;
  v9 = self;
  v16 = v9;
  v17 = v7;
  v10 = v7;
  objc_msgSend(v8, "enumerateNodesUsingBlock:", v15);
  +[PGGraphMomentNode personInMoment](PGGraphMomentNode, "personInMoment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = v9;
  v14.super_class = (Class)PGPeopleFeatureExtractor;
  v12 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v14, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("People"), v10, v11, &__block_literal_global_52745);

  return v12;
}

- (PGPeopleFeatureExtractor)initWithTopNumberOfPeople:(unint64_t)a3 graph:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PGPeopleFeatureExtractor *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  PGPeopleFeatureExtractor *v18;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  PGPeopleFeatureExtractor *v23;
  id v24;

  v7 = a4;
  +[PGGraphMomentNode consolidatedPersonInMoment](PGGraphMomentNode, "consolidatedPersonInMoment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:](PGGraphPersonNodeCollection, "personNodesExcludingMeInGraph:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inverse");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v9, v11, objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __66__PGPeopleFeatureExtractor_initWithTopNumberOfPeople_graph_error___block_invoke;
  v21[3] = &unk_1E8433768;
  v22 = v12;
  v13 = self;
  v23 = v13;
  v24 = v10;
  v14 = v10;
  v15 = v12;
  objc_msgSend(v9, "enumerateNodesUsingBlock:", v21);
  objc_msgSend(v14, "keysSortedByValueUsingComparator:", &__block_literal_global_11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_fixLabels:toLength:", v16, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = v13;
  v20.super_class = (Class)PGPeopleFeatureExtractor;
  v18 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v20, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("People"), v17, v8, &__block_literal_global_12);

  return v18;
}

void __66__PGPeopleFeatureExtractor_initWithTopNumberOfPeople_graph_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "targetsForSourceIdentifier:", objc_msgSend(v4, "identifier"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_labelFromPersonNode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v6, v5);

}

id __66__PGPeopleFeatureExtractor_initWithTopNumberOfPeople_graph_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[PGPeopleFeatureExtractor _labelFromPersonNode:](PGPeopleFeatureExtractor, "_labelFromPersonNode:", a2);
}

uint64_t __66__PGPeopleFeatureExtractor_initWithTopNumberOfPeople_graph_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void __48__PGPeopleFeatureExtractor_initWithGraph_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_labelFromPersonNode:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
}

id __48__PGPeopleFeatureExtractor_initWithGraph_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[PGPeopleFeatureExtractor _labelFromPersonNode:](PGPeopleFeatureExtractor, "_labelFromPersonNode:", a2);
}

+ (id)_labelFromPersonNode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v3 = a3;
  objc_msgSend(v3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v5, v4);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Person-%@"), v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_fixLabels:(id)a3 toLength:(unint64_t)a4
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v5, "count");
  v8 = v7;
  if (v6 <= a4)
  {
    if (v7 < a4)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%lu"), CFSTR("Padding"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v9);

        ++v8;
      }
      while (a4 != v8);
    }
  }
  else
  {
    objc_msgSend(v5, "removeObjectsInRange:", a4, v7 - a4);
  }
  return v5;
}

@end
