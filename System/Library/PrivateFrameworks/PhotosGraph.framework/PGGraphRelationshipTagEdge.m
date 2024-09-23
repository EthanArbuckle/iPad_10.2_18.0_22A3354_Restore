@implementation PGGraphRelationshipTagEdge

- (id)initFromPersonNode:(id)a3 toRelationshipTagNode:(id)a4 withConfidence:(double)a5
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGGraphRelationshipTagEdge;
  result = -[PGGraphEdge initWithSourceNode:targetNode:](&v7, sel_initWithSourceNode_targetNode_, a3, a4);
  if (result)
    *((double *)result + 5) = a5;
  return result;
}

- (PGGraphRelationshipTagEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  PGGraphRelationshipTagEdge *v15;

  v10 = a4;
  v11 = a5;
  objc_msgSend(a7, "objectForKeyedSubscript:", CFSTR("confidence"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "doubleValue");
  else
    v14 = 0.1;
  v15 = -[PGGraphRelationshipTagEdge initFromPersonNode:toRelationshipTagNode:withConfidence:](self, "initFromPersonNode:toRelationshipTagNode:withConfidence:", v10, v11, v14);

  return v15;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("RELATIONSHIP_TAG");
  return CFSTR("RELATIONSHIP_TAG");
}

- (unsigned)domain
{
  return 305;
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
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("confidence"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v9 = 1;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      if (v8 != self->_confidence)
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
  v5 = CFSTR("confidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
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
  v7.super_class = (Class)PGGraphRelationshipTagEdge;
  -[PGGraphOptimizedEdge edgeDescription](&v7, sel_edgeDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%.2f)"), v4, *(_QWORD *)&self->_confidence);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)confidence
{
  return self->_confidence;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("RELATIONSHIP_TAG"), 305);
}

+ (id)filterWithConfidence:(double)a3
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

@end
