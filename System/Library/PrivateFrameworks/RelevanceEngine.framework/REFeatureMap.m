@implementation REFeatureMap

- (REFeatureMap)initWithFeatureMap:(id)a3
{
  id v5;
  REFeatureMap *v6;
  REFeatureMap *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REFeatureMap;
  v6 = -[REFeatureMap init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_hash = 0;
    objc_storeStrong((id *)&v6->_indices, a3);
    v7->_values = (unint64_t *)malloc_type_calloc(-[REFeatureMap _count](v7, "_count"), 8uLL, 0x100004000313F17uLL);
  }

  return v7;
}

- (unint64_t)_count
{
  return -[NSDictionary count](self->_indices, "count");
}

- (void)dealloc
{
  unint64_t v3;
  const void *v4;
  objc_super v5;

  if (-[REFeatureMap _count](self, "_count"))
  {
    v3 = 0;
    do
    {
      v4 = (const void *)self->_values[v3];
      if (v4)
      {
        REReleaseFeatureValueTaggedPointer(v4);
        self->_values[v3] = 0;
      }
      ++v3;
    }
    while (-[REFeatureMap _count](self, "_count") > v3);
  }
  free(self->_values);
  self->_values = 0;
  v5.receiver = self;
  v5.super_class = (Class)REFeatureMap;
  -[REFeatureMap dealloc](&v5, sel_dealloc);
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  REFeatureMap *v4;
  REFeatureMap *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t i;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;

  v4 = (REFeatureMap *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[REFeatureMap _count](self, "_count");
      if (self->_indices == v5->_indices
        && (v7 = v6, v8 = -[REFeatureMap _count](self, "_count"), v8 == -[REFeatureMap _count](v5, "_count")))
      {
        if (v7)
        {
          v9 = 0;
          for (i = 0; i != v7; v9 = i >= v7)
          {
            v11 = (void *)self->_values[i];
            if (v11 != (void *)v5->_values[i])
            {
              REFeatureValueForTaggedPointer(v11);
              v12 = (id)objc_claimAutoreleasedReturnValue();
              REFeatureValueForTaggedPointer((void *)v5->_values[i]);
              v13 = (id)objc_claimAutoreleasedReturnValue();
              if (v12 == v13)
              {

              }
              else
              {
                v14 = v13;
                v15 = objc_msgSend(v12, "isEqual:", v13);

                if ((v15 & 1) == 0)
                  break;
              }
            }
            ++i;
          }
        }
        else
        {
          v9 = 1;
        }
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 8) = self->_hash;
  *(_QWORD *)(v4 + 16) = malloc_type_calloc(-[REFeatureMap _count](self, "_count"), 8uLL, 0x100004000313F17uLL);
  v5 = -[REFeatureMap _count](self, "_count");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      REFeatureValueForTaggedPointer((void *)self->_values[i]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(v4 + 16) + 8 * i) = RECreateFeatureValueTaggedPointer(v8);

    }
  }
  objc_storeStrong((id *)(v4 + 24), self->_indices);
  return (id)v4;
}

- (void)setValue:(unint64_t)a3 forFeature:(id)a4
{
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t *values;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  unint64_t v15;
  _QWORD block[4];
  id v17;

  v12 = a4;
  -[NSDictionary objectForKeyedSubscript:](self->_indices, "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__REFeatureMap_setValue_forFeature___block_invoke;
    block[3] = &unk_24CF8AAF0;
    v17 = v12;
    if (setValue_forFeature__onceToken != -1)
      dispatch_once(&setValue_forFeature__onceToken, block);
    v11 = v17;
    goto LABEL_11;
  }
  if (a3)
  {
    v7 = REFeatureValueTypeForTaggedPointer(a3);
    if ((REValidFeatureValueTypeForFeatureType(v7, objc_msgSend(v12, "featureType")) & 1) == 0)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __36__REFeatureMap_setValue_forFeature___block_invoke_2;
      v13[3] = &unk_24CF8AD38;
      v14 = v12;
      v15 = a3;
      if (setValue_forFeature__onceToken_18 != -1)
        dispatch_once(&setValue_forFeature__onceToken_18, v13);
      v11 = v14;
LABEL_11:

      goto LABEL_12;
    }
  }
  RERetainFeatureValueTaggedPointer((CFTypeRef)a3);
  v8 = objc_msgSend(v6, "unsignedIntegerValue");
  v9 = REFeatureValueHashForTaggedPointer((void *)self->_values[v8]);
  values = self->_values;
  self->_hash ^= v9;
  REReleaseFeatureValueTaggedPointer((CFTypeRef)values[v8]);
  self->_values[v8] = a3;
  self->_hash ^= REFeatureValueHashForTaggedPointer((void *)a3);
LABEL_12:

}

void __36__REFeatureMap_setValue_forFeature___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v1 = (void *)*MEMORY[0x24BDBCAB8];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  RERaiseInternalException(v1, CFSTR("Relevance Engine is not configured to support feature: %@"), v2, v3, v4, v5, v6, v7, (uint64_t)v8);

}

void __36__REFeatureMap_setValue_forFeature___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = (void *)*MEMORY[0x24BDBCAB8];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  REDescriptionForTaggedPointer(*(void **)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  RERaiseInternalException(v2, CFSTR("Feature %@ does not support value %@"), v3, v4, v5, v6, v7, v8, (uint64_t)v10);

}

- (void)setFeatureValue:(id)a3 forFeature:(id)a4
{
  id v6;
  const void *v7;

  v6 = a4;
  v7 = (const void *)RECreateFeatureValueTaggedPointer(a3);
  -[REFeatureMap setValue:forFeature:](self, "setValue:forFeature:", v7, v6);

  REReleaseFeatureValueTaggedPointer(v7);
}

- (void)removeValueForFeature:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *values;
  id v9;
  _QWORD block[4];
  id v11;

  v9 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_indices, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
    v7 = REFeatureValueHashForTaggedPointer((void *)self->_values[v6]);
    values = self->_values;
    self->_hash ^= v7;
    REReleaseFeatureValueTaggedPointer((CFTypeRef)values[v6]);
    self->_values[v6] = 0;
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__REFeatureMap_removeValueForFeature___block_invoke;
    block[3] = &unk_24CF8AAF0;
    v11 = v9;
    if (removeValueForFeature__onceToken != -1)
      dispatch_once(&removeValueForFeature__onceToken, block);

  }
}

void __38__REFeatureMap_removeValueForFeature___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v1 = (void *)*MEMORY[0x24BDBCAB8];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  RERaiseInternalException(v1, CFSTR("Relevance Engine is not configured to support feature: %@"), v2, v3, v4, v5, v6, v7, (uint64_t)v8);

}

- (void)removeAllValues
{
  unint64_t v3;

  self->_hash = 0;
  if (-[REFeatureMap _count](self, "_count"))
  {
    v3 = 0;
    do
    {
      REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_values[v3]);
      self->_values[v3++] = 0;
    }
    while (v3 < -[REFeatureMap _count](self, "_count"));
  }
}

- (id)featureValueForFeature:(id)a3
{
  return REFeatureValueForTaggedPointer((void *)-[REFeatureMap valueForFeature:](self, "valueForFeature:", a3));
}

- (unint64_t)valueForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t *values;
  unint64_t v8;
  _QWORD block[4];
  id v11;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_indices, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    values = self->_values;
    v8 = values[objc_msgSend(v5, "unsignedIntegerValue")];
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__REFeatureMap_valueForFeature___block_invoke;
    block[3] = &unk_24CF8AAF0;
    v11 = v4;
    if (valueForFeature__onceToken != -1)
      dispatch_once(&valueForFeature__onceToken, block);

    v8 = 0;
  }

  return v8;
}

void __32__REFeatureMap_valueForFeature___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v1 = (void *)*MEMORY[0x24BDBCAB8];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  RERaiseInternalException(v1, CFSTR("Relevance Engine is not configured to support feature: %@"), v2, v3, v4, v5, v6, v7, (uint64_t)v8);

}

- (BOOL)hasValueForFeature:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_indices, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = -[REFeatureMap valueForFeature:](self, "valueForFeature:", v4) != 0;
  else
    v6 = 0;

  return v6;
}

- (void)enumerateFeaturesUsingBlock:(id)a3
{
  id v4;
  NSDictionary *indices;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  indices = self->_indices;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__REFeatureMap_enumerateFeaturesUsingBlock___block_invoke;
  v7[3] = &unk_24CF8AD60;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](indices, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __44__REFeatureMap_enumerateFeaturesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  (*(void (**)(_QWORD, id, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 8 * objc_msgSend(a3, "unsignedIntegerValue")));

}

- (void)enumerateBoolFeaturesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__REFeatureMap_enumerateBoolFeaturesUsingBlock___block_invoke;
  v6[3] = &unk_24CF8AD88;
  v7 = v4;
  v5 = v4;
  -[REFeatureMap enumerateFeaturesUsingBlock:](self, "enumerateFeaturesUsingBlock:", v6);

}

void __48__REFeatureMap_enumerateBoolFeaturesUsingBlock___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = a2;
  if (a3)
  {
    v9 = v5;
    v6 = REFeatureValueTypeForTaggedPointer(a3);
    v5 = v9;
    if (!v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = REBooleanValueForTaggedPointer(a3);
      (*(void (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v9, v8);
      v5 = v9;
    }
  }

}

- (void)enumerateInt64FeaturesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__REFeatureMap_enumerateInt64FeaturesUsingBlock___block_invoke;
  v6[3] = &unk_24CF8AD88;
  v7 = v4;
  v5 = v4;
  -[REFeatureMap enumerateFeaturesUsingBlock:](self, "enumerateFeaturesUsingBlock:", v6);

}

void __49__REFeatureMap_enumerateInt64FeaturesUsingBlock___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = a2;
  if (a3)
  {
    v9 = v5;
    v6 = REFeatureValueTypeForTaggedPointer(a3) == 1;
    v5 = v9;
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = REIntegerValueForTaggedPointer(a3);
      (*(void (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v9, v8);
      v5 = v9;
    }
  }

}

- (void)enumerateDoubleFeaturesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__REFeatureMap_enumerateDoubleFeaturesUsingBlock___block_invoke;
  v6[3] = &unk_24CF8AD88;
  v7 = v4;
  v5 = v4;
  -[REFeatureMap enumerateFeaturesUsingBlock:](self, "enumerateFeaturesUsingBlock:", v6);

}

void __50__REFeatureMap_enumerateDoubleFeaturesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  BOOL v6;
  const char *v7;
  uint64_t v8;
  double v9;
  id v10;

  v5 = a2;
  if (a3)
  {
    v10 = v5;
    v6 = REFeatureValueTypeForTaggedPointer((unint64_t)a3) == 2;
    v5 = v10;
    if (v6)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = REDoubleValueForTaggedPointer(a3, v7);
      (*(void (**)(uint64_t, id, double))(v8 + 16))(v8, v10, v9);
      v5 = v10;
    }
  }

}

- (void)enumerateStringFeaturesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__REFeatureMap_enumerateStringFeaturesUsingBlock___block_invoke;
  v6[3] = &unk_24CF8AD88;
  v7 = v4;
  v5 = v4;
  -[REFeatureMap enumerateFeaturesUsingBlock:](self, "enumerateFeaturesUsingBlock:", v6);

}

void __50__REFeatureMap_enumerateStringFeaturesUsingBlock___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a2;
  if (a3)
  {
    v9 = v5;
    v6 = REFeatureValueTypeForTaggedPointer(a3) == 3;
    v5 = v9;
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      REStringValueForTaggedPointer(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v9, v8);

      v5 = v9;
    }
  }

}

- (void)enumerateEmptyFeaturesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__REFeatureMap_enumerateEmptyFeaturesUsingBlock___block_invoke;
  v6[3] = &unk_24CF8AD88;
  v7 = v4;
  v5 = v4;
  -[REFeatureMap enumerateFeaturesUsingBlock:](self, "enumerateFeaturesUsingBlock:", v6);

}

uint64_t __49__REFeatureMap_enumerateEmptyFeaturesUsingBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)enumerateFeatureValuesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__REFeatureMap_enumerateFeatureValuesUsingBlock___block_invoke;
  v6[3] = &unk_24CF8AD88;
  v7 = v4;
  v5 = v4;
  -[REFeatureMap enumerateFeaturesUsingBlock:](self, "enumerateFeaturesUsingBlock:", v6);

}

void __49__REFeatureMap_enumerateFeatureValuesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  REFeatureValueForTaggedPointer(a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NSSet)allFeatures
{
  return (NSSet *)-[_REFeatureMapFeatureSet initWithFeatureMap:]([_REFeatureMapFeatureSet alloc], "initWithFeatureMap:", self->_indices);
}

- (NSArray)loggingValues
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[REFeatureMap featureCount](self, "featureCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __29__REFeatureMap_loggingValues__block_invoke;
  v7[3] = &unk_24CF8ADB0;
  v8 = v3;
  v4 = v3;
  -[REFeatureMap enumerateFeatureValuesUsingBlock:](self, "enumerateFeatureValuesUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

void __29__REFeatureMap_loggingValues__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a2, "name");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("(null)");
  if (v10)
  {
    REValueDescriptionStringFromFeatureValue(v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ → %@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ → %@"), v7, CFSTR("(null)"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indices, 0);
}

+ (id)defaultFeatureName
{
  return CFSTR("RootFeature");
}

- (NSSet)featureNames
{
  if (featureNames_onceToken != -1)
    dispatch_once(&featureNames_onceToken, &__block_literal_global_3);
  return (NSSet *)(id)featureNames_DefaultFeatureNames;
}

void __47__REFeatureMap_REFeatureProvider__featureNames__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("RootFeature"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)featureNames_DefaultFeatureNames;
  featureNames_DefaultFeatureNames = v0;

}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("RootFeature")))
  {
    v4 = objc_alloc(MEMORY[0x24BDBFFF0]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[REFeatureMap featureCount](self, "featureCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v7 = (void *)objc_msgSend(v4, "initWithShape:dataType:error:", v6, 131104, &v18);
    v8 = v18;

    if (v7)
    {
      v9 = MEMORY[0x24BDAC760];
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __55__REFeatureMap_REFeatureProvider__featureValueForName___block_invoke;
      v16[3] = &unk_24CF8AE00;
      v17 = v7;
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __55__REFeatureMap_REFeatureProvider__featureValueForName___block_invoke_2;
      v14[3] = &unk_24CF8AE28;
      v10 = v17;
      v15 = v10;
      -[REFeatureMap enumerateInt64FeaturesUsingIndexedBlock:emptyFeatureBlock:](self, "enumerateInt64FeaturesUsingIndexedBlock:emptyFeatureBlock:", v16, v14);
      objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithMultiArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v17;
    }
    else
    {
      RELogForDomain(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[REFeatureMap(REFeatureProvider) featureValueForName:].cold.1((uint64_t)v8, v12);
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

void __55__REFeatureMap_REFeatureProvider__featureValueForName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v6, a3);

}

void __55__REFeatureMap_REFeatureProvider__featureValueForName___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD16E0];
  +[REFeatureValue nullValueForFeature:](REFeatureValue, "nullValueForFeature:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedLongLong:", objc_msgSend(v7, "int64Value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v6, a3);

}

- (void)enumerateInt64FeaturesUsingIndexedBlock:(id)a3 emptyFeatureBlock:(id)a4
{
  id v6;
  NSDictionary *indices;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    indices = self->_indices;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __93__REFeatureMap_REFeatureProvider__enumerateInt64FeaturesUsingIndexedBlock_emptyFeatureBlock___block_invoke;
    v9[3] = &unk_24CF8AE50;
    v9[4] = self;
    v10 = v8;
    v11 = v6;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](indices, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
}

void __93__REFeatureMap_REFeatureProvider__enumerateInt64FeaturesUsingIndexedBlock_emptyFeatureBlock___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = objc_msgSend(a3, "unsignedIntegerValue");
  v6 = v5;
  v7 = *(_QWORD *)(a1[4] + 16);
  v8 = *(_QWORD *)(v7 + 8 * v5);
  if (v8 && REFeatureValueTypeForTaggedPointer(*(_QWORD *)(v7 + 8 * v5)) == 1)
  {
    v9 = a1[5];
    v10 = REIntegerValueForTaggedPointer(v8);
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v9 + 16))(v9, v11, v6, v10);
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }

}

@end
