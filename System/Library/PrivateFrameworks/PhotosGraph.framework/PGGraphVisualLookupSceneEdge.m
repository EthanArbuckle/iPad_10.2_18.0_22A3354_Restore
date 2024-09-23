@implementation PGGraphVisualLookupSceneEdge

- (id)initFromMomentNode:(id)a3 toVisualLookupSceneNode:(id)a4 confidence:(double)a5 numberOfAssets:(unint64_t)a6
{
  id result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PGGraphVisualLookupSceneEdge;
  result = -[PGGraphEdge initWithSourceNode:targetNode:](&v9, sel_initWithSourceNode_targetNode_, a3, a4);
  if (result)
  {
    *((double *)result + 6) = a5;
    *((_QWORD *)result + 5) = a6;
  }
  return result;
}

- (PGGraphVisualLookupSceneEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  PGGraphVisualLookupSceneEdge *v18;

  v10 = a7;
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("confidence"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("numberOfAssets"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "unsignedIntegerValue");
  v18 = -[PGGraphVisualLookupSceneEdge initFromMomentNode:toVisualLookupSceneNode:confidence:numberOfAssets:](self, "initFromMomentNode:toVisualLookupSceneNode:confidence:numberOfAssets:", v12, v11, v17, v15);

  return v18;
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

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberOfAssets"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v9;
      if (!v9 || objc_msgSend(v9, "unsignedIntegerValue") == self->_numberOfAssets)
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
  v7[1] = CFSTR("numberOfAssets");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfAssets);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("VISUAL_LOOKUP_SCENE");
  return CFSTR("VISUAL_LOOKUP_SCENE");
}

- (unsigned)domain
{
  return 602;
}

- (double)confidence
{
  return self->_confidence;
}

- (unint64_t)numberOfAssets
{
  return self->_numberOfAssets;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("VISUAL_LOOKUP_SCENE"), 602);
}

@end
