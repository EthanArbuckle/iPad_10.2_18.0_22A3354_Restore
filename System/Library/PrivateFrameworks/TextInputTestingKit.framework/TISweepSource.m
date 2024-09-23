@implementation TISweepSource

- (void)addValue:(id)a3 withMin:(float)a4 withMax:(float)a5
{
  TIDebugValue *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSMutableDictionary *debugValues;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  id v17;

  v17 = a3;
  v8 = objc_alloc_init(TIDebugValue);
  *(float *)&v9 = (float)(a4 + a5) * 0.5;
  -[TIDebugValue setDefaultValue:](v8, "setDefaultValue:", v9);
  *(float *)&v10 = a4;
  -[TIDebugValue setSweepValue:](v8, "setSweepValue:", v10);
  *(float *)&v11 = a4;
  -[TIDebugValue setSweepMin:](v8, "setSweepMin:", v11);
  *(float *)&v12 = a5;
  -[TIDebugValue setSweepMax:](v8, "setSweepMax:", v12);
  *(float *)&v13 = (float)(a5 - a4) / (float)self->stepCount;
  -[TIDebugValue setStepSize:](v8, "setStepSize:", v13);
  debugValues = self->debugValues;
  if (!debugValues)
  {
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v16 = self->debugValues;
    self->debugValues = v15;

    debugValues = self->debugValues;
  }
  -[NSMutableDictionary setObject:forKey:](debugValues, "setObject:forKey:", v8, v17);

}

- (void)addValue:(id)a3 withValue:(float)a4
{
  TIDebugValue *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSMutableDictionary *debugValues;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;

  v15 = a3;
  v6 = objc_alloc_init(TIDebugValue);
  *(float *)&v7 = a4;
  -[TIDebugValue setDefaultValue:](v6, "setDefaultValue:", v7);
  *(float *)&v8 = a4;
  -[TIDebugValue setSweepValue:](v6, "setSweepValue:", v8);
  *(float *)&v9 = a4;
  -[TIDebugValue setSweepMin:](v6, "setSweepMin:", v9);
  *(float *)&v10 = a4;
  -[TIDebugValue setSweepMax:](v6, "setSweepMax:", v10);
  LODWORD(v11) = 0;
  -[TIDebugValue setStepSize:](v6, "setStepSize:", v11);
  debugValues = self->debugValues;
  if (!debugValues)
  {
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v14 = self->debugValues;
    self->debugValues = v13;

    debugValues = self->debugValues;
  }
  -[NSMutableDictionary setObject:forKey:](debugValues, "setObject:forKey:", v6, v15);

}

- (id)sweepStateHeader
{
  void *v3;
  NSMutableDictionary *v4;
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
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->debugValues;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(v3, "appendFormat:", CFSTR("%@,"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)sweepStateValues
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  float v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->debugValues;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKey:](self->debugValues, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sweepValue");
        objc_msgSend(v3, "appendFormat:", CFSTR("%f,"), v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)advanceSweep
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = self->debugValues;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->debugValues, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sweepMax");
        v10 = v9;
        objc_msgSend(v8, "sweepValue");
        if ((float)(v10 - v11) > 0.00000011921)
        {
          objc_msgSend(v8, "stepSize");
          v13 = v12;
          objc_msgSend(v8, "sweepValue");
          *(float *)&v15 = v13 + v14;
          objc_msgSend(v8, "setSweepValue:", v15);

          goto LABEL_11;
        }
        objc_msgSend(v8, "sweepMin");
        objc_msgSend(v8, "setSweepValue:");

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (BOOL)finished
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->debugValues;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->debugValues, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sweepMax");
        v10 = v9;
        objc_msgSend(v8, "sweepValue");
        v12 = v10 - v11;

        if (v12 > 0.00000011921)
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (int)stepCount
{
  return self->stepCount;
}

- (void)setStepCount:(int)a3
{
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  self->stepCount = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->debugValues;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = (float)a3;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableDictionary objectForKey:](self->debugValues, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10), (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sweepMax");
        v13 = v12;
        objc_msgSend(v11, "sweepMin");
        *(float *)&v15 = (float)(v13 - v14) / v9;
        objc_msgSend(v11, "setStepSize:", v15);

        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (NSMutableDictionary)debugValues
{
  return self->debugValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->debugValues, 0);
}

+ (id)sharedInstance
{
  void *v2;
  TISweepSource *v3;
  void *v4;

  v2 = (void *)sharedInstance_shared;
  if (!sharedInstance_shared)
  {
    v3 = objc_alloc_init(TISweepSource);
    v4 = (void *)sharedInstance_shared;
    sharedInstance_shared = (uint64_t)v3;

    v2 = (void *)sharedInstance_shared;
  }
  return v2;
}

@end
