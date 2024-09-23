@implementation PGGraphBelongsToEdge

- (id)initFromMemberNode:(id)a3 toSocialGroupNode:(id)a4 importance:(double)a5
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGGraphBelongsToEdge;
  result = -[PGGraphEdge initWithSourceNode:targetNode:](&v7, sel_initWithSourceNode_targetNode_, a3, a4);
  if (result)
    *((double *)result + 5) = a5;
  return result;
}

- (PGGraphBelongsToEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  PGGraphBelongsToEdge *v15;

  v10 = a5;
  v11 = a4;
  objc_msgSend(a7, "objectForKeyedSubscript:", CFSTR("importance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  v15 = -[PGGraphBelongsToEdge initFromMemberNode:toSocialGroupNode:importance:](self, "initFromMemberNode:toSocialGroupNode:importance:", v11, v10, v14);
  return v15;
}

- (PGGraphBelongsToEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
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
  PGGraphBelongsToEdge *v22;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("importance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v17);
    *(float *)&v20 = a7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("importance"));

    v17 = v19;
  }
  v22 = -[PGGraphBelongsToEdge initWithLabel:sourceNode:targetNode:domain:properties:](self, "initWithLabel:sourceNode:targetNode:domain:properties:", v14, v15, v16, v10, v17);

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
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("importance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v9 = 1;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      if (v8 != self->_importance)
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
  v5 = CFSTR("importance");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_importance);
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
  v7.super_class = (Class)PGGraphBelongsToEdge;
  -[PGGraphOptimizedEdge edgeDescription](&v7, sel_edgeDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%.2f)"), v4, *(_QWORD *)&self->_importance);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("BELONGSTO");
  return CFSTR("BELONGSTO");
}

- (unsigned)domain
{
  return 302;
}

- (double)importance
{
  return self->_importance;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("BELONGSTO"), 302);
}

+ (void)setImportance:(double)a3 onBelongsToEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
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

@end
