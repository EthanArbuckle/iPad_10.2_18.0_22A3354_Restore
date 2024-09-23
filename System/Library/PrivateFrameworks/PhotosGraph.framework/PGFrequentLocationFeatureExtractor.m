@implementation PGFrequentLocationFeatureExtractor

- (PGFrequentLocationFeatureExtractor)initWithGraph:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  PGFrequentLocationFeatureExtractor *v9;
  id v10;
  void *v11;
  PGFrequentLocationFeatureExtractor *v12;
  objc_super v14;
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD v18[4];
  PGFrequentLocationFeatureExtractor *v19;
  id v20;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __58__PGFrequentLocationFeatureExtractor_initWithGraph_error___block_invoke;
  v18[3] = &unk_1E842EB70;
  v9 = self;
  v19 = v9;
  v10 = v6;
  v20 = v10;
  objc_msgSend(v7, "enumerateNodesUsingBlock:", v18);
  objc_initWeak(&location, v9);
  +[PGGraphMomentNode frequentLocationOfMoment](PGGraphMomentNode, "frequentLocationOfMoment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __58__PGFrequentLocationFeatureExtractor_initWithGraph_error___block_invoke_2;
  v15[3] = &unk_1E842EB98;
  objc_copyWeak(&v16, &location);
  v14.receiver = v9;
  v14.super_class = (Class)PGFrequentLocationFeatureExtractor;
  v12 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v14, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("Frequent Location"), v10, v11, v15);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
  return v12;
}

- (id)_labelFromFrequentLocationNode:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FrequentLocation-%u"), objc_msgSend(a3, "identifier"));
}

void __58__PGFrequentLocationFeatureExtractor_initWithGraph_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_labelFromFrequentLocationNode:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

id __58__PGFrequentLocationFeatureExtractor_initWithGraph_error___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_labelFromFrequentLocationNode:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
