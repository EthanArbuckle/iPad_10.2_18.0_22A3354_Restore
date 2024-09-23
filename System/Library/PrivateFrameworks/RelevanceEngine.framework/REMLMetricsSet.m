@implementation REMLMetricsSet

- (REMLMetricsSet)init
{
  REMLMetricsSet *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *metricsIndex;
  NSMutableSet *v5;
  NSMutableSet *metricsSet;
  REMLMetricsSet *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)REMLMetricsSet;
  v2 = -[REMLMetricsSet init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    metricsIndex = v2->metricsIndex;
    v2->metricsIndex = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    metricsSet = v2->metricsSet;
    v2->metricsSet = v5;

    v7 = v2;
  }

  return v2;
}

- (BOOL)addMetrics:(id)a3
{
  id v4;
  NSMutableDictionary *metricsIndex;
  void *v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  char v10;

  v4 = a3;
  metricsIndex = self->metricsIndex;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](metricsIndex, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v8 = self->metricsIndex;
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](v8, "setValue:forKey:", v7, v9);

  }
  v10 = objc_msgSend(v7, "containsObject:", v4);
  if ((v10 & 1) == 0)
  {
    objc_msgSend(v7, "addObject:", v4);
    -[NSMutableSet addObject:](self->metricsSet, "addObject:", v4);
  }

  return v10 ^ 1;
}

- (id)getMetricsByName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKey:](self->metricsIndex, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)name
{
  return CFSTR("MLMetricsSet");
}

- (void)updateMetricsFromFeatures:(id)a3 prediction:(id)a4 truth:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->metricsSet;
  v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "updateMetricsFromFeatures:prediction:truth:", v8, v9, v10, (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)reset
{
  NSMutableSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->metricsSet;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "reset", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->metricsSet, 0);
  objc_storeStrong((id *)&self->metricsIndex, 0);
}

@end
