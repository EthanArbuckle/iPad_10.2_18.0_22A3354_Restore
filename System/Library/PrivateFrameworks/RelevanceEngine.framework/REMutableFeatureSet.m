@implementation REMutableFeatureSet

- (REMutableFeatureSet)init
{
  uint64_t v3;
  _REMutableFeatureSet *v4;
  REMutableFeatureSet *p_super;
  objc_super v7;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = objc_alloc_init(_REMutableFeatureSet);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REMutableFeatureSet;
    v4 = -[REFeatureSet init](&v7, sel_init);
    self = &v4->super;
  }
  p_super = &v4->super;

  return p_super;
}

- (void)unionFeatureSet:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[REMutableFeatureSet addFeature:](self, "addFeature:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)minusFeatureSet:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[REMutableFeatureSet removeFeature:](self, "removeFeature:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)intersetFeatureSet:(id)a3
{
  id v4;
  void *v5;
  REMutableFeatureSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[REFeatureSet count](self, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = self;
  v7 = -[REFeatureSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v8 = -[REFeatureSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j);
        if ((objc_msgSend(v4, "containsFeature:", v16, (_QWORD)v17) & 1) == 0)
          -[REMutableFeatureSet removeFeature:](v6, "removeFeature:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

}

- (REMutableFeatureSet)initWithFeatures:(id)a3
{
  id v4;
  _REMutableFeatureSet *v5;

  v4 = a3;
  v5 = -[_REMutableFeatureSet initWithFeatures:]([_REMutableFeatureSet alloc], "initWithFeatures:", v4);

  return &v5->super;
}

- (REMutableFeatureSet)initWithFeature:(id)a3
{
  id v4;
  _REMutableFeatureSet *v5;

  v4 = a3;
  v5 = -[_REMutableFeatureSet initWithFeature:]([_REMutableFeatureSet alloc], "initWithFeature:", v4);

  return &v5->super;
}

- (REMutableFeatureSet)initWithCapacity:(unint64_t)a3
{
  _REMutableFeatureSet *v4;

  v4 = -[_REMutableFeatureSet initWithCapacity:]([_REMutableFeatureSet alloc], "initWithCapacity:", a3);

  return &v4->super;
}

- (void)removeAllFeatures
{
  void *v3;
  REMutableFeatureSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[REFeatureSet count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self;
  v5 = -[REFeatureSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[REFeatureSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[REMutableFeatureSet removeFeature:](v4, "removeFeature:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

- (void)addFeature:(id)a3
{
  OUTLINED_FUNCTION_2_4();
  objc_opt_class();
  OUTLINED_FUNCTION_1_3();
}

- (void)removeFeature:(id)a3
{
  OUTLINED_FUNCTION_2_4();
  objc_opt_class();
  OUTLINED_FUNCTION_1_3();
}

@end
