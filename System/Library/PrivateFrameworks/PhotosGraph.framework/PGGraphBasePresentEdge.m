@implementation PGGraphBasePresentEdge

- (id)initFromPersonNode:(id)a3 toMomentNode:(id)a4 importance:(double)a5 numberOfAssets:(unint64_t)a6
{
  int v6;
  id result;
  objc_super v9;

  v6 = a6;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphBasePresentEdge;
  result = -[PGGraphEdge initWithSourceNode:targetNode:](&v9, sel_initWithSourceNode_targetNode_, a3, a4);
  if (result)
  {
    *((double *)result + 6) = a5;
    *((_DWORD *)result + 10) = v6;
  }
  return result;
}

- (PGGraphBasePresentEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  PGAbstractMethodException(self, a2);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v16);
}

- (PGGraphBasePresentEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
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
  PGGraphBasePresentEdge *v24;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("importance"));
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
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("importance"));

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("cnt"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("cnt"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("numberOfAssets"));

      objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, CFSTR("cnt"));
    }

  }
  v24 = -[PGGraphBasePresentEdge initWithLabel:sourceNode:targetNode:domain:properties:](self, "initWithLabel:sourceNode:targetNode:domain:properties:", v14, v15, v16, v10, v19);

  return v24;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("importance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v10 = 0;
    if (!v6 || (objc_msgSend(v6, "doubleValue"), v8 == self->_importance))
    {

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberOfAssets"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v9;
      if (!v9 || objc_msgSend(v9, "unsignedIntegerValue") == *((_DWORD *)self + 10))
        v10 = 1;
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)propertyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("importance");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_importance);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("numberOfAssets");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned int *)self + 10));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)edgeDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGGraphBasePresentEdge;
  -[PGGraphOptimizedEdge edgeDescription](&v7, sel_edgeDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (importance = %f, %u assets)"), v4, *(_QWORD *)&self->_importance, *((unsigned int *)self + 10));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)label
{
  id v2;

  PGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unsigned)domain
{
  return 300;
}

- (double)importance
{
  return self->_importance;
}

- (unint64_t)numberOfAssets
{
  return *((unsigned int *)self + 10);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", 0, 300);
}

+ (MAEdgeFilter)consolidatedFilter
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0D42A00]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("PRESENT"), CFSTR("CPRESENT"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLabels:domain:properties:", v3, 300, MEMORY[0x1E0C9AA70]);

  return (MAEdgeFilter *)v4;
}

+ (MAEdgeFilter)consolidatedPresentInAssetsFilter
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D42A00]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("PRESENT"), CFSTR("CPRESENT"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("numberOfAssets");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 5, &unk_1E84E4C58);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithLabels:domain:properties:", v3, 300, v5);

  return (MAEdgeFilter *)v6;
}

+ (void)setImportance:(double)a3 onPresentEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  void *v7;
  id v8;
  id v9;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  objc_msgSend(v7, "numberWithDouble:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistModelProperty:forKey:forEdgeWithIdentifier:", v9, CFSTR("importance"), a4);

}

+ (void)setNumberOfAssets:(unint64_t)a3 onPresentEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  void *v7;
  id v8;
  id v9;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  objc_msgSend(v7, "numberWithUnsignedInteger:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistModelProperty:forKey:forEdgeWithIdentifier:", v9, CFSTR("numberOfAssets"), a4);

}

@end
