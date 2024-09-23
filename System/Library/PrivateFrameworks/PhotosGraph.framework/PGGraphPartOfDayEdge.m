@implementation PGGraphPartOfDayEdge

- (id)initFromMomentNode:(id)a3 toPartOfDayNode:(id)a4 ratio:(double)a5
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGGraphPartOfDayEdge;
  result = -[PGGraphEdge initWithSourceNode:targetNode:](&v7, sel_initWithSourceNode_targetNode_, a3, a4);
  if (result)
    *((double *)result + 5) = a5;
  return result;
}

- (PGGraphPartOfDayEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  PGGraphPartOfDayEdge *v15;

  v10 = a5;
  v11 = a4;
  objc_msgSend(a7, "objectForKeyedSubscript:", CFSTR("ratio"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  v15 = -[PGGraphPartOfDayEdge initFromMomentNode:toPartOfDayNode:ratio:](self, "initFromMomentNode:toPartOfDayNode:ratio:", v11, v10, v14);
  return v15;
}

- (PGGraphPartOfDayEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
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
  PGGraphPartOfDayEdge *v22;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ratio"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v17);
    *(float *)&v20 = a7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("ratio"));

    v17 = v19;
  }
  v22 = -[PGGraphPartOfDayEdge initWithLabel:sourceNode:targetNode:domain:properties:](self, "initWithLabel:sourceNode:targetNode:domain:properties:", v14, v15, v16, v10, v17);

  return v22;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  BOOL v9;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ratio"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v9 = 1;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      if (v8 != self->_ratio)
        v9 = 0;
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
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("ratio");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ratio);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)edgeDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGGraphPartOfDayEdge;
  -[PGGraphOptimizedEdge edgeDescription](&v7, sel_edgeDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%.2f)"), v4, *(_QWORD *)&self->_ratio);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("PARTOFDAY");
  return CFSTR("PARTOFDAY");
}

- (unsigned)domain
{
  return 400;
}

- (double)ratio
{
  return self->_ratio;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("PARTOFDAY"), 400);
}

+ (MAEdgeFilter)significantFilter
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D42A00]);
  v7 = CFSTR("ratio");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 6, &unk_1E84EB1E8);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithLabel:domain:properties:", CFSTR("PARTOFDAY"), 400, v4);

  return (MAEdgeFilter *)v5;
}

+ (id)significantFilterWithLegacyWeights:(BOOL)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = objc_alloc(MEMORY[0x1E0D42A00]);
    v8 = CFSTR("__weight");
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 6, &unk_1E84EB1E8);
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithLabel:domain:properties:", CFSTR("PARTOFDAY"), 400, v5);

    return v6;
  }
  else
  {
    objc_msgSend(a1, "significantFilter");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
