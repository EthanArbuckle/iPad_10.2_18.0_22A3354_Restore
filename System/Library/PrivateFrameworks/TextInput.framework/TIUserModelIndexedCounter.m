@implementation TIUserModelIndexedCounter

- (TIUserModelIndexedCounter)initWithName:(id)a3
{
  id v5;
  TIUserModelIndexedCounter *v6;
  TIUserModelIndexedCounter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIUserModelIndexedCounter;
  v6 = -[TIUserModelIndexedCounter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v7->_dataType = 0;
  }

  return v7;
}

- (int)bucketCount
{
  return 11;
}

- (void)prepareBuckets
{
  NSMutableArray *v3;
  NSMutableArray *current;
  NSMutableArray *v5;
  NSMutableArray *persisted;
  NSMutableArray *v7;
  id v8;

  if (!self->_current)
  {
    -[TIUserModelIndexedCounter _createEmptyCountsArray](self, "_createEmptyCountsArray");
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    current = self->_current;
    self->_current = v3;

    v5 = (NSMutableArray *)objc_opt_new();
    persisted = self->_persisted;
    self->_persisted = v5;

    v7 = self->_persisted;
    -[TIUserModelIndexedCounter _createEmptyCountsArray](self, "_createEmptyCountsArray");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v7, "addObject:", v8);

  }
}

- (int)days
{
  -[TIUserModelIndexedCounter prepareBuckets](self, "prepareBuckets");
  return -[NSMutableArray count](self->_persisted, "count");
}

- (NSArray)currentCounts
{
  void *v3;
  uint64_t i;
  NSMutableArray *current;
  void *v6;
  void *v7;
  void *v8;
  uint64_t j;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dataType == 2)
  {
    for (i = 0; i != 11; ++i)
    {
      current = self->_current;
      v6 = (void *)MEMORY[0x1E0CB37E8];
      if (current)
      {
        -[NSMutableArray objectAtIndex:](current, "objectAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(v6, "numberWithDouble:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:atIndexedSubscript:", v8, i);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:atIndexedSubscript:", v7, i);
      }

    }
  }
  else
  {
    for (j = 0; j != 11; ++j)
    {
      v10 = self->_current;
      v11 = (void *)MEMORY[0x1E0CB37E8];
      if (v10)
      {
        -[NSMutableArray objectAtIndex:](v10, "objectAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "intValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:atIndexedSubscript:", v13, j);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:atIndexedSubscript:", v12, j);
      }

    }
  }
  return (NSArray *)v3;
}

- (NSArray)counts
{
  return (NSArray *)-[TIUserModelIndexedCounter countsForNumberOfDays:](self, "countsForNumberOfDays:", 1);
}

- (id)countsForNumberOfDays:(int)a3
{
  void *v5;
  uint64_t i;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  -[TIUserModelIndexedCounter prepareBuckets](self, "prepareBuckets");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dataType == 2)
  {
    for (i = 0; i != 11; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->_current, "objectAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      if (a3 >= 1)
      {
        v10 = 0;
        do
        {
          -[NSMutableArray objectAtIndex:](self->_persisted, "objectAtIndex:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndex:", i);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "doubleValue");
          v9 = v9 + v13;

          ++v10;
        }
        while (a3 != v10);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:atIndexedSubscript:", v14, i);

    }
  }
  else
  {
    for (j = 0; j != 11; ++j)
    {
      -[NSMutableArray objectAtIndex:](self->_current, "objectAtIndex:", j);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "intValue");

      if (a3 >= 1)
      {
        v18 = 0;
        do
        {
          -[NSMutableArray objectAtIndex:](self->_persisted, "objectAtIndex:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndex:", j);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v20, "intValue") + v17;

          ++v18;
        }
        while (a3 != v18);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:atIndexedSubscript:", v21, j);

    }
  }
  return v5;
}

- (NSNumber)aggregatedCount
{
  return (NSNumber *)-[TIUserModelIndexedCounter aggregatedCountForNumberOfDays:](self, "aggregatedCountForNumberOfDays:", 1);
}

- (id)aggregatedCountForNumberOfDays:(int)a3
{
  NSMutableArray *current;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  current = self->_current;
  if (self->_dataType == 2)
  {
    if (current)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      -[TIUserModelIndexedCounter countsForNumberOfDays:](self, "countsForNumberOfDays:", *(_QWORD *)&a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v24;
        v8 = 0.0;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v24 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "doubleValue");
            v8 = v8 + v10;
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v6);
      }
      else
      {
        v8 = 0.0;
      }

    }
    else
    {
      v8 = 0.0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(_QWORD *)&a3, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (current)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[TIUserModelIndexedCounter countsForNumberOfDays:](self, "countsForNumberOfDays:", *(_QWORD *)&a3, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v12)
      {
        v13 = v12;
        LODWORD(v14) = 0;
        v15 = *(_QWORD *)v20;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v11);
            v14 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "intValue") + v14;
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        }
        while (v13);
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v17;
}

- (void)extendToNumberOfDays:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  int v7;
  NSMutableArray *persisted;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[TIUserModelIndexedCounter prepareBuckets](self, "prepareBuckets");
  v5 = -[NSMutableArray count](self->_persisted, "count");
  v6 = v5;
  if ((int)v5 < (int)v3)
  {
    v7 = v5;
    do
    {
      persisted = self->_persisted;
      -[TIUserModelIndexedCounter _createEmptyCountsArray](self, "_createEmptyCountsArray");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](persisted, "addObject:", v9);

      ++v7;
    }
    while ((_DWORD)v3 != v7);
    IXADefaultLogFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      -[TIUserModelIndexedCounter name](self, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%s Extended indexed counter %@ from %d to %d days"), "-[TIUserModelIndexedCounter extendToNumberOfDays:]", v12, v6, v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v13;
      _os_log_debug_impl(&dword_18C56E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
}

- (void)updateWithInteger:(int)a3 forIndex:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  NSMutableArray *current;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[TIUserModelIndexedCounter prepareBuckets](self, "prepareBuckets");
  self->_dataType = 1;
  -[NSMutableArray objectAtIndex:](self->_current, "objectAtIndex:", (int)v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  current = self->_current;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)((int)v8 + (int)v5));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray setObject:atIndexedSubscript:](current, "setObject:atIndexedSubscript:", v10, (int)v4);

  IXADefaultLogFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[TIUserModelIndexedCounter name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%s Updated indexed counter %@: Added %d to %d at index %d. _current: %@"), "-[TIUserModelIndexedCounter updateWithInteger:forIndex:]", v13, v5, v8, v4, self->_current);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v14;
    _os_log_debug_impl(&dword_18C56E000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
}

- (void)updateWithDouble:(double)a3 forIndex:(int)a4
{
  uint64_t v4;
  void *v7;
  double v8;
  double v9;
  NSMutableArray *current;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v4 = *(_QWORD *)&a4;
  v18 = *MEMORY[0x1E0C80C00];
  -[TIUserModelIndexedCounter prepareBuckets](self, "prepareBuckets");
  self->_dataType = 2;
  -[NSMutableArray objectAtIndex:](self->_current, "objectAtIndex:", (int)v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  current = self->_current;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 + a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray setObject:atIndexedSubscript:](current, "setObject:atIndexedSubscript:", v11, (int)v4);

  IXADefaultLogFacility();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[TIUserModelIndexedCounter name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%s Updated indexed counter %@: Added %f to %f at index %d. _current: %@"), "-[TIUserModelIndexedCounter updateWithDouble:forIndex:]", v14, *(_QWORD *)&a3, *(_QWORD *)&v9, v4, self->_current);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v15;
    _os_log_debug_impl(&dword_18C56E000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
}

- (void)updateWithLoadedInteger:(int)a3 andDouble:(double)a4 forIndex:(int)a5 andDaysPrior:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v9 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  -[TIUserModelIndexedCounter prepareBuckets](self, "prepareBuckets");
  if ((_DWORD)v9 || a4 != 0.0)
  {
    if ((_DWORD)v9)
    {
      self->_dataType = 1;
      -[NSMutableArray objectAtIndex:](self->_persisted, "objectAtIndex:", (int)v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", (int)v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "intValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v13 + v9));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:atIndexedSubscript:", v14, (int)v7);

      IXADefaultLogFacility();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        -[TIUserModelIndexedCounter name](self, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%s Loaded indexed counter %@: Added %d to %d at index %d for %d days prior. _persisted: %@"), "-[TIUserModelIndexedCounter updateWithLoadedInteger:andDouble:forIndex:andDaysPrior:]", v17, v9, v13, v7, v6, self->_persisted);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        _os_log_debug_impl(&dword_18C56E000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

LABEL_10:
      }
    }
    else
    {
      self->_dataType = 2;
      -[NSMutableArray objectAtIndex:](self->_persisted, "objectAtIndex:", (int)v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", (int)v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21 + a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:atIndexedSubscript:", v22, (int)v7);

      IXADefaultLogFacility();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        -[TIUserModelIndexedCounter name](self, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%s Loaded indexed counter %@: Added %f to %f at index %d for %d days prior. _persisted: %@"), "-[TIUserModelIndexedCounter updateWithLoadedInteger:andDouble:forIndex:andDaysPrior:]", v24, *(_QWORD *)&a4, *(_QWORD *)&v21, v7, v6, self->_persisted);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        _os_log_debug_impl(&dword_18C56E000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        goto LABEL_10;
      }
    }

  }
}

- (id)_createEmptyCountsArray
{
  void *v2;
  uint64_t i;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 11; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:atIndexedSubscript:", v4, i);

  }
  return v2;
}

- (void)doPersist:(id)a3 forDate:(id)a4 forContext:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  TIUserModelIndexedCounter *v30;
  unint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  NSMutableArray *current;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;

  v44 = a3;
  v43 = a4;
  v8 = a5;
  if (self->_current && self->_dataType)
  {
    v45 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v45);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v45;
    objc_msgSend((id)kUserModelDatabasePrefix, "stringByAppendingString:", self->_name);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndex:](self->_persisted, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = 0x1E0CB3000uLL;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_current, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (self->_dataType == 2)
      {
        objc_msgSend(v12, "doubleValue");
        if (v14 != 0.0)
        {
          v15 = v14;
          objc_msgSend(*(id *)(v11 + 2024), "numberWithInt:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v11 + 2024), "numberWithInt:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v11 + 2024), "numberWithDouble:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "inputLanguageAndRegion");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addValue:andSecondaryValue:andRealValue:andProperties:forKey:forInputMode:forDate:", v16, v17, v18, v42, v41, v19, v43);

          objc_msgSend(v9, "objectAtIndex:", v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "doubleValue");
          v22 = v21;

          v23 = *(void **)(v11 + 2024);
          v24 = v15 + v22;
LABEL_9:
          objc_msgSend(v23, "numberWithDouble:", v24);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:atIndexedSubscript:", v36, v10);

          current = self->_current;
          objc_msgSend(*(id *)(v11 + 2024), "numberWithInt:", 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray setObject:atIndexedSubscript:](current, "setObject:atIndexedSubscript:", v38, v10);

        }
      }
      else
      {
        v25 = objc_msgSend(v12, "intValue");
        if ((_DWORD)v25)
        {
          v26 = v25;
          objc_msgSend(*(id *)(v11 + 2024), "numberWithInt:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v11 + 2024), "numberWithInt:", v10);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v11 + 2024), "numberWithDouble:", 0.0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "inputLanguageAndRegion");
          v40 = v13;
          v30 = self;
          v31 = v11;
          v32 = v9;
          v33 = v8;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addValue:andSecondaryValue:andRealValue:andProperties:forKey:forInputMode:forDate:", v27, v28, v29, v42, v41, v34, v43);

          v8 = v33;
          v9 = v32;
          v11 = v31;
          self = v30;
          v13 = v40;

          objc_msgSend(v9, "objectAtIndex:", v10);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v28) = objc_msgSend(v35, "intValue");

          v23 = *(void **)(v11 + 2024);
          v24 = (double)((int)v28 + v26);
          goto LABEL_9;
        }
      }

      if (++v10 == 11)
      {

        break;
      }
    }
  }

}

- (NSString)name
{
  return self->_name;
}

- (int)dataType
{
  return self->_dataType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_persisted, 0);
}

@end
