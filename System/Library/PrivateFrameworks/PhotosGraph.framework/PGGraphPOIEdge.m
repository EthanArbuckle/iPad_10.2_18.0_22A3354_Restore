@implementation PGGraphPOIEdge

- (id)initFromMomentNode:(id)a3 toPOINode:(id)a4 confidence:(double)a5 poiIsImproved:(BOOL)a6 poiIsSpecial:(BOOL)a7
{
  _BOOL4 v7;
  id result;
  char v11;
  objc_super v12;

  v7 = a7;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphPOIEdge;
  result = -[PGGraphEdge initWithSourceNode:targetNode:](&v12, sel_initWithSourceNode_targetNode_, a3, a4);
  if (result)
  {
    *((double *)result + 6) = a5;
    *((_BYTE *)result + 40) = *((_BYTE *)result + 40) & 0xFE | a6;
    if (v7)
      v11 = 2;
    else
      v11 = 0;
    *((_BYTE *)result + 40) = *((_BYTE *)result + 40) & 0xFD | v11;
  }
  return result;
}

- (PGGraphPOIEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
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
  PGGraphPOIEdge *v20;

  v10 = a7;
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("confidence"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isImproved"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isSpecial"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "BOOLValue");
  v20 = -[PGGraphPOIEdge initFromMomentNode:toPOINode:confidence:poiIsImproved:poiIsSpecial:](self, "initFromMomentNode:toPOINode:confidence:poiIsImproved:poiIsSpecial:", v12, v11, v17, v19, v15);

  return v20;
}

- (PGGraphPOIEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
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
  PGGraphPOIEdge *v26;

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

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("impr"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("impr"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("isImproved"));

      objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, CFSTR("impr"));
    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("spcl"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("spcl"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, CFSTR("isSpecial"));

      objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, CFSTR("spcl"));
    }

  }
  v26 = -[PGGraphPOIEdge initWithLabel:sourceNode:targetNode:domain:properties:](self, "initWithLabel:sourceNode:targetNode:domain:properties:", v14, v15, v16, v10, v19);

  return v26;
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
  BOOL v11;

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
        goto LABEL_11;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isImproved"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "BOOLValue") == ((*((_BYTE *)self + 40) & 1) == 0))
        goto LABEL_11;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isSpecial"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v10 && objc_msgSend(v10, "BOOLValue") == ((*((_BYTE *)self + 40) & 2) == 0))
LABEL_11:
      v11 = 0;
    else
      v11 = 1;

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)propertyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("confidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("isImproved");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((_BYTE *)self + 40) & 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("isSpecial");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((unsigned __int8 *)self + 40) >> 1) & 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)edgeDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  BOOL v8;
  const __CFString *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)PGGraphPOIEdge;
  -[PGGraphOptimizedEdge edgeDescription](&v12, sel_edgeDescription);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("Improved");
  if ((*((_BYTE *)self + 40) & 1) == 0)
    v6 = &stru_1E8436F28;
  v7 = CFSTR("Special");
  if ((*((_BYTE *)self + 40) & 2) != 0)
  {
    v8 = (*((_BYTE *)self + 40) & 1) == 0;
  }
  else
  {
    v7 = &stru_1E8436F28;
    v8 = 1;
  }
  v9 = CFSTR(", ");
  if (v8)
    v9 = &stru_1E8436F28;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%.2f, %@%@%@)"), v4, *(_QWORD *)&self->_confidence, v6, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("POI");
  return CFSTR("POI");
}

- (unsigned)domain
{
  return 501;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)poiIsImproved
{
  return *((_BYTE *)self + 40) & 1;
}

- (BOOL)poiIsSpecial
{
  return (*((unsigned __int8 *)self + 40) >> 1) & 1;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("POI"), 501);
}

+ (MAEdgeFilter)filterImproved
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("isImproved");
  v7[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MAEdgeFilter *)v4;
}

+ (MAEdgeFilter)filterSpecial
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("isSpecial");
  v7[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MAEdgeFilter *)v4;
}

+ (id)filterAboveConfidence:(double)a3
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
  v7 = (void *)objc_msgSend(v5, "initWithComparator:value:", 5, v6);
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterBySettingProperties:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)filterAboveConfidence:(double)a3 hasLegacyWeights:(BOOL)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    objc_msgSend(a1, "filter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("__weight");
    v6 = objc_alloc(MEMORY[0x1E0D42978]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithComparator:value:", 5, v7);
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filterBySettingProperties:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "filterAboveConfidence:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
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

+ (void)setPOIIsImproved:(BOOL)a3 onEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  _BOOL8 v6;
  void *v7;
  id v8;
  id v9;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  objc_msgSend(v7, "numberWithBool:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistModelProperty:forKey:forEdgeWithIdentifier:", v9, CFSTR("isImproved"), a4);

}

@end
