@implementation PGGraphSceneEdge

- (id)initFromMomentNode:(id)a3 toSceneNode:(id)a4 confidence:(double)a5 isReliable:(BOOL)a6 numberOfAssets:(unint64_t)a7 numberOfHighConfidenceAssets:(unint64_t)a8 numberOfSearchConfidenceAssets:(unint64_t)a9 numberOfDominantSceneAssets:(unint64_t)a10
{
  int v10;
  int v11;
  int v12;
  id result;
  objc_super v16;

  v10 = a9;
  v11 = a8;
  v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)PGGraphSceneEdge;
  result = -[PGGraphEdge initWithSourceNode:targetNode:](&v16, sel_initWithSourceNode_targetNode_, a3, a4);
  if (result)
  {
    *((double *)result + 8) = a5;
    *((_BYTE *)result + 56) = *((_BYTE *)result + 56) & 0xFE | a6;
    *((_DWORD *)result + 10) = v12;
    *((_DWORD *)result + 11) = v11;
    *((_DWORD *)result + 12) = v10;
    *((_DWORD *)result + 13) = a10;
  }
  return result;
}

- (PGGraphSceneEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  PGGraphSceneEdge *v26;

  v10 = a7;
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("confidence"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isReliable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("numberOfAssets"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("numberOfHighConfidenceAssets"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntegerValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("numberOfSearchConfidenceAssets"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unsignedIntegerValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("numberOfDominantSceneAssets"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "unsignedIntegerValue");
  v26 = -[PGGraphSceneEdge initFromMomentNode:toSceneNode:confidence:isReliable:numberOfAssets:numberOfHighConfidenceAssets:numberOfSearchConfidenceAssets:numberOfDominantSceneAssets:](self, "initFromMomentNode:toSceneNode:confidence:isReliable:numberOfAssets:numberOfHighConfidenceAssets:numberOfSearchConfidenceAssets:numberOfDominantSceneAssets:", v12, v11, v17, v19, v21, v23, v15, v25);

  return v26;
}

- (PGGraphSceneEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PGGraphSceneEdge *v32;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("confidence"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = v17;
  }
  else
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v17);
    *(float *)&v20 = a7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("confidence"));

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("hconfc"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("hconfc"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("numberOfHighConfidenceAssets"));

      objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, CFSTR("hconfc"));
    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rlbl"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rlbl"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, CFSTR("isReliable"));

      objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, CFSTR("rlbl"));
    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("sconfc"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("sconfc"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, CFSTR("numberOfSearchConfidenceAssets"));

      objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, CFSTR("sconfc"));
    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("cnt"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("cnt"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v29, CFSTR("numberOfAssets"));

      objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, CFSTR("cnt"));
    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("domc"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("domc"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v31, CFSTR("numberOfDominantSceneAssets"));

      objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, CFSTR("domc"));
    }

  }
  v32 = -[PGGraphSceneEdge initWithLabel:sourceNode:targetNode:domain:properties:](self, "initWithLabel:sourceNode:targetNode:domain:properties:", v14, v15, v16, v10, v19);

  return v32;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("confidence"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      if (v8 != self->_confidence)
        goto LABEL_17;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isReliable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "BOOLValue") == ((*((_BYTE *)self + 56) & 1) == 0))
        goto LABEL_17;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberOfAssets"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v10)
    {
      if (objc_msgSend(v10, "unsignedIntegerValue") != *((_DWORD *)self + 10))
        goto LABEL_17;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberOfHighConfidenceAssets"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v11)
    {
      if (objc_msgSend(v11, "unsignedIntegerValue") != *((_DWORD *)self + 11))
        goto LABEL_17;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberOfSearchConfidenceAssets"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v12)
    {
      if (objc_msgSend(v12, "unsignedIntegerValue") != *((_DWORD *)self + 12))
        goto LABEL_17;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberOfDominantSceneAssets"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (v13 && objc_msgSend(v13, "unsignedIntegerValue") != *((_DWORD *)self + 13))
LABEL_17:
      v14 = 0;
    else
      v14 = 1;

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (id)propertyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("confidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("isReliable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((_BYTE *)self + 56) & 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = CFSTR("numberOfAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned int *)self + 10));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  v11[3] = CFSTR("numberOfHighConfidenceAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned int *)self + 11));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  v11[4] = CFSTR("numberOfSearchConfidenceAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned int *)self + 12));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  v11[5] = CFSTR("numberOfDominantSceneAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned int *)self + 13));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)edgeDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PGGraphSceneEdge;
  -[PGGraphOptimizedEdge edgeDescription](&v9, sel_edgeDescription);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if ((*((_BYTE *)self + 56) & 1) != 0)
    v6 = CFSTR("Reliable");
  else
    v6 = CFSTR("Unreliable");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (confidence = %f, %@)"), v4, *(_QWORD *)&self->_confidence, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isSearchableForEvent
{
  _BOOL4 v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[PGGraphSceneEdge isReliable](self, "isReliable");
  if (v3)
  {
    v4 = -[PGGraphSceneEdge numberOfSearchConfidenceAssets](self, "numberOfSearchConfidenceAssets");
    v5 = -[PGGraphSceneEdge numberOfAssets](self, "numberOfAssets");
    v6 = 2;
    if (v5 < 2)
      v6 = v5;
    LOBYTE(v3) = v4 >= v6;
  }
  return v3;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;

  -[MAEdge targetNode](self, "targetNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphSceneEdge confidence](self, "confidence");
  v9 = v8;
  if (-[PGGraphSceneEdge isReliable](self, "isReliable"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%p:%@> %@ %.2f isReliable: %@, numberOfAssets %lu, numberOfHighConfidenceAssets %lu, numberOfSearchConfidenceAssets %lu, numberOfDominantSceneAssets %lu"), self, v6, v7, v9, v10, -[PGGraphSceneEdge numberOfAssets](self, "numberOfAssets"), -[PGGraphSceneEdge numberOfHighConfidenceAssets](self, "numberOfHighConfidenceAssets"), -[PGGraphSceneEdge numberOfSearchConfidenceAssets](self, "numberOfSearchConfidenceAssets"), -[PGGraphSceneEdge numberOfDominantSceneAssets](self, "numberOfDominantSceneAssets"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("SCENE");
  return CFSTR("SCENE");
}

- (unsigned)domain
{
  return objc_msgSend((id)objc_opt_class(), "domain");
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)isReliable
{
  return *((_BYTE *)self + 56) & 1;
}

- (unint64_t)numberOfAssets
{
  return *((unsigned int *)self + 10);
}

- (unint64_t)numberOfHighConfidenceAssets
{
  return *((unsigned int *)self + 11);
}

- (unint64_t)numberOfSearchConfidenceAssets
{
  return *((unsigned int *)self + 12);
}

- (unint64_t)numberOfDominantSceneAssets
{
  return *((unsigned int *)self + 13);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("SCENE"), objc_msgSend(a1, "domain"));
}

+ (MAEdgeFilter)isReliableFilter
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("isReliable");
  v7[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MAEdgeFilter *)v4;
}

+ (MAEdgeFilter)highConfidenceAssetsFilter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("numberOfHighConfidenceAssets");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 5, &unk_1E84E2FF0);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MAEdgeFilter *)v5;
}

+ (MAEdgeFilter)searchConfidenceAssetsFilter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("numberOfSearchConfidenceAssets");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 5, &unk_1E84E2FF0);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MAEdgeFilter *)v5;
}

+ (MAEdgeFilter)dominantSceneAssetsFilter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("numberOfDominantSceneAssets");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 5, &unk_1E84E2FF0);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MAEdgeFilter *)v5;
}

+ (id)filterWithMinimumNumberOfHighConfidenceAssets:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("numberOfHighConfidenceAssets");
  v5 = objc_alloc(MEMORY[0x1E0D42978]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithComparator:value:", 6, v6);
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterBySettingProperties:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)filterWithMinimumConfidence:(double)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("confidence");
  v5 = objc_alloc(MEMORY[0x1E0D42978]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithComparator:value:", 6, v6);
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterBySettingProperties:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (unsigned)domain
{
  return 600;
}

+ (void)setConfidence:(double)a3 onEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  void *v7;
  id v8;
  id v9;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  objc_msgSend(v7, "numberWithDouble:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistModelProperty:forKey:forEdgeWithIdentifier:", v9, CFSTR("confidence"), a4);

}

@end
