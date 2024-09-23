@implementation TrimmedMean

- (TrimmedMean)initWithSize:(unint64_t)a3 withTrimAt:(float)a4
{
  TrimmedMean *v6;
  TrimmedMean *v7;
  NSMutableArray *v8;
  NSMutableArray *values;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TrimmedMean;
  v6 = -[TrimmedMean init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_arraySize = a3;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    values = v7->_values;
    v7->_values = v8;

    v7->_currentAverage = 0.0;
    v7->_trimAt = a4;
  }
  return v7;
}

- (void)add:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableArray count](self->_values, "count") == self->_arraySize)
    -[NSMutableArray removeLastObject](self->_values, "removeLastObject");
  -[NSMutableArray insertObject:atIndex:](self->_values, "insertObject:atIndex:", v4, 0);

}

- (float)getTrimmedMean
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t j;
  double v18;
  float v19;
  float v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = self->_values;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortUsingDescriptors:", v10);

  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", (int)(float)(self->_trimAt * (float)(unint64_t)objc_msgSend(v3, "count")), objc_msgSend(v3, "count") - (int)(float)(self->_trimAt * (float)(unint64_t)objc_msgSend(v3, "count")));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsAtIndexes:", v11);

  if (objc_msgSend(v3, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v3;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      v16 = 0.0;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "doubleValue", (_QWORD)v22);
          v16 = v16 + v18;
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v14);
      v19 = v16;
    }
    else
    {
      v19 = 0.0;
    }

    v20 = v19 / (float)(unint64_t)objc_msgSend(v12, "count");
  }
  else
  {
    v20 = 0.0;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
