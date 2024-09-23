@implementation PGGraphMeaningEdge

- (id)initFromMomentNode:(id)a3 toMeaningNode:(id)a4 confidence:(double)a5 isHighPrecision:(BOOL)a6
{
  id result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PGGraphMeaningEdge;
  result = -[PGGraphEdge initWithSourceNode:targetNode:](&v9, sel_initWithSourceNode_targetNode_, a3, a4);
  if (result)
  {
    *((double *)result + 6) = a5;
    *((_BYTE *)result + 40) = *((_BYTE *)result + 40) & 0xFE | a6;
  }
  return result;
}

- (PGGraphMeaningEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  PGGraphMeaningEdge *v18;

  v10 = a7;
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("confidence"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isHighPrecision"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "BOOLValue");
  v18 = -[PGGraphMeaningEdge initFromMomentNode:toMeaningNode:confidence:isHighPrecision:](self, "initFromMomentNode:toMeaningNode:confidence:isHighPrecision:", v12, v11, v17, v15);

  return v18;
}

- (PGGraphMeaningEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
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
  PGGraphMeaningEdge *v22;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("confidence"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v17);
    *(float *)&v20 = a7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("confidence"));

    v17 = v19;
  }
  v22 = -[PGGraphMeaningEdge initWithLabel:sourceNode:targetNode:domain:properties:](self, "initWithLabel:sourceNode:targetNode:domain:properties:", v14, v15, v16, v10, v17);

  return v22;
}

- (id)edgeDescription
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)PGGraphMeaningEdge;
  -[PGGraphOptimizedEdge edgeDescription](&v11, sel_edgeDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphMeaningEdge meaningLabel](self, "meaningLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PGGraphMeaningEdge isReliable](self, "isReliable"))
    v6 = CFSTR("Reliable");
  else
    v6 = CFSTR("Unreliable");
  if (-[PGGraphMeaningEdge isHighPrecision](self, "isHighPrecision"))
    v7 = CFSTR("High Precision");
  else
    v7 = CFSTR("Not High Precision");
  -[PGGraphMeaningEdge confidence](self, "confidence");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@, %@, %@, %f)"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)label
{
  return (id)objc_msgSend((id)objc_opt_class(), "label");
}

- (unsigned)domain
{
  return objc_msgSend((id)objc_opt_class(), "domain");
}

- (BOOL)isReliable
{
  return *((_BYTE *)self + 40) & 1;
}

- (NSString)meaningLabel
{
  void *v2;
  void *v3;

  -[MAEdge targetNode](self, "targetNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
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
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("confidence"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v10 = 0;
    if (!v6 || (objc_msgSend(v6, "doubleValue"), v8 == self->_confidence))
    {

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isHighPrecision"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v9;
      if (!v9 || objc_msgSend(v9, "BOOLValue") != ((*((_BYTE *)self + 40) & 1) == 0))
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
  v7[0] = CFSTR("confidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("isHighPrecision");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((_BYTE *)self + 40) & 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)isHighPrecision
{
  return *((_BYTE *)self + 40) & 1;
}

+ (id)filter
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", v2, objc_msgSend((id)objc_opt_class(), "domain"));

  return v3;
}

+ (MAEdgeFilter)highPrecisionFilter
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("isHighPrecision");
  v7[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MAEdgeFilter *)v4;
}

+ (id)label
{
  __CFString *v2;

  v2 = CFSTR("MEANING");
  return CFSTR("MEANING");
}

+ (unsigned)domain
{
  return 700;
}

+ (id)propertyDictionaryWithConfidence:(double)a3 isHighPrecision:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v4 = a4;
  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("confidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("isHighPrecision");
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
