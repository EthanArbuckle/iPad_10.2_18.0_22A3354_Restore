@implementation PGGraphMomentFeaturesEdge

- (id)initFromMomentNode:(id)a3 toFeatureNode:(id)a4 numberOfRelevantAssets:(unint64_t)a5 allAssetUUIDs:(id)a6
{
  int v7;
  id v11;
  PGGraphMomentFeaturesEdge *v12;
  PGGraphMomentFeaturesEdge *v13;
  objc_super v15;

  v7 = a5;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PGGraphMomentFeaturesEdge;
  v12 = -[PGGraphEdge initWithSourceNode:targetNode:](&v15, sel_initWithSourceNode_targetNode_, a3, a4);
  v13 = v12;
  if (v12)
  {
    *((_DWORD *)v12 + 12) = v7;
    objc_storeStrong((id *)&v12->_allAssetUUIDs, a6);
  }

  return v13;
}

- (id)initFromMomentNode:(id)a3 toFeatureNode:(id)a4 numberOfRelevantAssets:(unint64_t)a5 relevantAssetUUIDs:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v10 = a4;
  v11 = a3;
  objc_msgSend(a6, "componentsJoinedByString:", CFSTR(","));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PGGraphMomentFeaturesEdge initFromMomentNode:toFeatureNode:numberOfRelevantAssets:allAssetUUIDs:](self, "initFromMomentNode:toFeatureNode:numberOfRelevantAssets:allAssetUUIDs:", v11, v10, a5, v12);

  return v13;
}

- (PGGraphMomentFeaturesEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  PGGraphMomentFeaturesEdge *v16;

  v10 = a7;
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rlvacnt"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rlvaids"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[PGGraphMomentFeaturesEdge initFromMomentNode:toFeatureNode:numberOfRelevantAssets:allAssetUUIDs:](self, "initFromMomentNode:toFeatureNode:numberOfRelevantAssets:allAssetUUIDs:", v12, v11, v14, v15);
  return v16;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rlvacnt"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v9 = 0;
    if (!v6 || objc_msgSend(v6, "unsignedIntegerValue") == *((_DWORD *)self + 12))
    {

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rlvaids"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8;
      if (!v8 || objc_msgSend(v8, "isEqual:", self->_allAssetUUIDs))
        v9 = 1;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)propertyDictionary
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("rlvacnt");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned int *)self + 12));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("rlvaids");
  v7[0] = v3;
  v7[1] = self->_allAssetUUIDs;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("MOMENT_FEATURES");
  return CFSTR("MOMENT_FEATURES");
}

- (unsigned)domain
{
  return 1200;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAssetUUIDs, 0);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("MOMENT_FEATURES"), 1200);
}

+ (id)relevantAssetUUIDsFromAllAssetUUIDs:(id)a3
{
  return (id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(","));
}

@end
