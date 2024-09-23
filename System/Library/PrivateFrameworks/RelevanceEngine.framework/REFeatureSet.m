@implementation REFeatureSet

- (BOOL)isEqualToFeatureSet:(id)a3
{
  REFeatureSet *v4;
  REFeatureSet *v5;
  unint64_t v6;
  REFeatureSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (REFeatureSet *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = -[REFeatureSet count](self, "count"), v6 == -[REFeatureSet count](v5, "count")))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self;
    v8 = -[REFeatureSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          if (!-[REFeatureSet containsFeature:](v5, "containsFeature:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14))
          {
            v12 = 0;
            goto LABEL_16;
          }
        }
        v9 = -[REFeatureSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }
    v12 = 1;
LABEL_16:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  REFeatureSet *v4;
  BOOL v5;

  v4 = (REFeatureSet *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[REFeatureSet isEqualToFeatureSet:](self, "isEqualToFeatureSet:", v4);
  }

  return v5;
}

+ (id)featureSet
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (REFeatureSet)init
{
  uint64_t v3;
  _REFeatureSet *v4;
  REFeatureSet *p_super;
  objc_super v7;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = objc_alloc_init(_REFeatureSet);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REFeatureSet;
    v4 = -[REFeatureSet init](&v7, sel_init);
    self = &v4->super;
  }
  p_super = &v4->super;

  return p_super;
}

- (REFeatureSet)initWithFeatureSet:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  REFeatureSet *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), (_QWORD)v13);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v11 = -[REFeatureSet initWithFeatures:](self, "initWithFeatures:", v5);
  return v11;
}

- (REFeatureSet)initWithFeatures:(id)a3
{
  id v4;
  _REFeatureSet *v5;

  v4 = a3;
  v5 = -[_REFeatureSet initWithFeatures:]([_REFeatureSet alloc], "initWithFeatures:", v4);

  return &v5->super;
}

+ (REFeatureSet)featureSetWithFeature:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFeature:", v3);

  return (REFeatureSet *)v4;
}

- (REFeatureSet)initWithFeature:(id)a3
{
  id v4;
  _RESingleFeatureSet *v5;

  v4 = a3;
  v5 = -[_RESingleFeatureSet initWithFeature:]([_RESingleFeatureSet alloc], "initWithFeature:", v4);

  return &v5->super;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[REFeatureSet initWithFeatureSet:](+[REFeatureSet allocWithZone:](REFeatureSet, "allocWithZone:", a3), "initWithFeatureSet:", self);
}

- (NSArray)allFeatures
{
  void *v3;
  REFeatureSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[REFeatureSet count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self;
  v5 = -[REFeatureSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = -[REFeatureSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

+ (REFeatureSet)featureSetWithFeatures:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFeatures:", v3);

  return (REFeatureSet *)v4;
}

- (BOOL)intersectsFeatureSet:(id)a3
{
  REFeatureSet *v4;
  unint64_t v5;
  unint64_t v6;
  REFeatureSet *v7;
  REFeatureSet *v8;
  REFeatureSet *v9;
  REFeatureSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (REFeatureSet *)a3;
  v5 = -[REFeatureSet count](self, "count");
  v6 = -[REFeatureSet count](v4, "count");
  if (v5 >= v6)
    v7 = v4;
  else
    v7 = self;
  if (v5 < v6)
    self = v4;
  v8 = v7;
  v9 = self;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v8;
  v11 = -[REFeatureSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v10);
        if (-[REFeatureSet containsFeature:](v9, "containsFeature:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15))
        {
          LOBYTE(v11) = 1;
          goto LABEL_16;
        }
      }
      v11 = -[REFeatureSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_16:

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[REFeatureSet initWithFeatureSet:](+[REMutableFeatureSet allocWithZone:](REMutableFeatureSet, "allocWithZone:", a3), "initWithFeatureSet:", self);
}

void __34___REFeatureSet_initWithFeatures___block_invoke()
{
  _REEmptyFeatureSet *v0;
  void *v1;

  v0 = objc_alloc_init(_REEmptyFeatureSet);
  v1 = (void *)initWithFeatures__EmptyFeatureSet;
  initWithFeatures__EmptyFeatureSet = (uint64_t)v0;

}

- (BOOL)isSubsetOfFeatureSet:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  REFeatureSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 && (v5 = -[REFeatureSet count](self, "count"), v5 <= objc_msgSend(v4, "count")))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self;
    v8 = -[REFeatureSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          if (!objc_msgSend(v4, "containsFeature:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13))
          {
            v6 = 0;
            goto LABEL_14;
          }
        }
        v9 = -[REFeatureSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
          continue;
        break;
      }
    }
    v6 = 1;
LABEL_14:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)enumerateFeaturesUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  REFeatureSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self;
  v6 = -[REFeatureSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
      if (v14)
        break;
      if (v7 == ++v9)
      {
        v7 = -[REFeatureSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (unint64_t)count
{
  unint64_t result;

  OUTLINED_FUNCTION_2_4();
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2();
  return result;
}

- (id)featureWithName:(id)a3
{
  id result;

  OUTLINED_FUNCTION_2_4();
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2();
  return result;
}

- (BOOL)containsFeature:(id)a3
{
  OUTLINED_FUNCTION_2_4();
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  return 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t result;

  OUTLINED_FUNCTION_2_4();
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2();
  return result;
}

@end
