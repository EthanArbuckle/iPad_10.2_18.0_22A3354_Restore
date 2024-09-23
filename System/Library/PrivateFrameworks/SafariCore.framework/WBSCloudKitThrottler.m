@implementation WBSCloudKitThrottler

+ (BOOL)policyStringRepresentsValidPolicy:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_distributionBucketsFromConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (WBSCloudKitThrottler)init
{
  return -[WBSCloudKitThrottler initWithPolicyString:](self, "initWithPolicyString:", 0);
}

- (WBSCloudKitThrottler)initWithPolicyString:(id)a3
{
  id v4;
  WBSCloudKitThrottler *v5;
  NSMutableArray *v6;
  NSMutableArray *pastOperationsWithinMonitoredPeriod;
  WBSCloudKitThrottler *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSCloudKitThrottler;
  v5 = -[WBSCloudKitThrottler init](&v10, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pastOperationsWithinMonitoredPeriod = v5->_pastOperationsWithinMonitoredPeriod;
    v5->_pastOperationsWithinMonitoredPeriod = v6;

    -[WBSCloudKitThrottler setPolicyString:](v5, "setPolicyString:", v4);
    v8 = v5;
  }

  return v5;
}

- (void)setDataStore:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataStore);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataStore, obj);
    -[WBSCloudKitThrottler _loadRecordOfPastOperations](self, "_loadRecordOfPastOperations");
  }

}

- (BOOL)permitsOperationWithPriority:(int64_t)a3
{
  WBSCloudKitThrottler *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[WBSCloudKitThrottler _pruneExpiredOrInvalidOperations](self, "_pruneExpiredOrInvalidOperations");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCloudKitThrottler dateOfNextPermittedOperationWithPriority:](v4, "dateOfNextPermittedOperationWithPriority:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "compare:", v6) != -1;

  return (char)v4;
}

- (id)dateOfNextPermittedOperationWithPriority:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (!a3)
    {
      -[WBSCloudKitThrottler _dateOfNextPermittedOperationAttemptWithNormalPriority](self, "_dateOfNextPermittedOperationAttemptWithNormalPriority");
      self = (WBSCloudKitThrottler *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    self = (WBSCloudKitThrottler *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (void)operationWithPriority:(int64_t)a3 didCompleteWithResult:(int64_t)a4
{
  BOOL v5;
  void *v7;

  v5 = a4 != 2 && a4 != 4;
  if (a3 != 2 && !v5)
  {
    if (a3 == 1)
    {
      if (-[NSMutableArray count](self->_pastOperationsWithinMonitoredPeriod, "count"))
        -[NSMutableArray removeLastObject](self->_pastOperationsWithinMonitoredPeriod, "removeLastObject");
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSCloudKitThrottler _addOperationAtDate:](self, "_addOperationAtDate:", v7);

    -[WBSCloudKitThrottler _saveRecordOfPastOperations](self, "_saveRecordOfPastOperations");
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSArray *throttlingDistribution;
  double numberOfSecondsToMonitor;
  unint64_t maximumNumberOfOperationWithinMonitoredPeriod;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  throttlingDistribution = self->_throttlingDistribution;
  numberOfSecondsToMonitor = self->_numberOfSecondsToMonitor;
  maximumNumberOfOperationWithinMonitoredPeriod = self->_maximumNumberOfOperationWithinMonitoredPeriod;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCloudKitThrottler _currentMinimumTimeIntervalBetweenOperations](self, "_currentMinimumTimeIntervalBetweenOperations");
  v11 = v10;
  -[WBSCloudKitThrottler _dateOfNextPermittedOperationAttemptWithNormalPriority](self, "_dateOfNextPermittedOperationAttemptWithNormalPriority");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; throttlingDistribution = \"%@\"; numberOfSecondsToMonitor = %lf; maximumNumberOfOperationWithinMonitoredPeriod = %lu>; now = %@; currentMinimumTimeIntervalBetweenOperations = %f; dateOfNextPermittedOperationAttemptWithNormalPriority = %@; pastOperationsWithinMonitoredPeriod = %@"),
    v5,
    self,
    throttlingDistribution,
    *(_QWORD *)&numberOfSecondsToMonitor,
    maximumNumberOfOperationWithinMonitoredPeriod,
    v9,
    v11,
    v12,
    self->_pastOperationsWithinMonitoredPeriod);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_distributionBucketsFromConfiguration:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(" | "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v7), "componentsSeparatedByString:", CFSTR(":"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count") != 2)
          goto LABEL_18;
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "length"))
        {

LABEL_18:
          v20 = 0;
          goto LABEL_19;
        }
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length") == 0;

        if (v11)
          goto LABEL_18;
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "integerValue");

        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "integerValue");

        if (v13 < 1 || v15 < 1)
          goto LABEL_18;
        v27[0] = CFSTR("numberOfOperations");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27[1] = CFSTR("minimumTimeIntervalBetweenOperations");
        v28[0] = v16;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v15 * 60.0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v28[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v18);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v5)
        continue;
      break;
    }
  }

  if (objc_msgSend(v3, "count"))
    v19 = v3;
  else
    v19 = 0;
  v20 = v19;
LABEL_19:

  return v20;
}

- (BOOL)_throttlerIsActive
{
  return self->_pastOperationsWithinMonitoredPeriod != 0;
}

- (BOOL)_loadDistributionConfiguration:(id)a3
{
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;
  id obj;
  id v20;
  WBSCloudKitThrottler *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = self;
  objc_msgSend((id)objc_opt_class(), "_distributionBucketsFromConfiguration:", v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = v4;
    v5 = v4;
    v6 = 0;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v23;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("numberOfOperations"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "unsignedIntegerValue");

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("minimumTimeIntervalBetweenOperations"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v16 = v15;

          v6 += v13;
          v9 = v9 + v16 * (double)v13;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 0.0;
    }

    objc_storeStrong((id *)&v21->_throttlingDistribution, obj);
    v21->_numberOfSecondsToMonitor = v9;
    v21->_maximumNumberOfOperationWithinMonitoredPeriod = v6;
    v4 = obj;
  }
  v17 = v4 != 0;

  return v17;
}

- (id)_dateOfNextPermittedOperationAttemptWithNormalPriority
{
  void *v3;
  void *v4;

  -[NSMutableArray firstObject](self->_pastOperationsWithinMonitoredPeriod, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WBSCloudKitThrottler _timeIntervalUntilNextPermittedOperationAttemptWithNormalPriority](self, "_timeIntervalUntilNextPermittedOperationAttemptWithNormalPriority");
    objc_msgSend(v3, "dateByAddingTimeInterval:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_timeIntervalUntilNextPermittedOperationAttemptWithNormalPriority
{
  NSMutableArray *i;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;

  for (i = self->_pastOperationsWithinMonitoredPeriod;
        ;
        -[NSMutableArray removeLastObject](i, "removeLastObject"))
  {
    -[WBSCloudKitThrottler _minimumTimeBetweenOperationsForOperations:](self, "_minimumTimeBetweenOperationsForOperations:", i);
    v5 = v4;
    -[NSMutableArray lastObject](i, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSCloudKitThrottler _timeIntervalUntilOperationShouldBePruned:](self, "_timeIntervalUntilOperationShouldBePruned:", v6);
    v8 = v7;

    if (v5 <= v8)
      break;
    if (i == self->_pastOperationsWithinMonitoredPeriod)
    {
      v9 = -[NSMutableArray mutableCopy](i, "mutableCopy");

      i = (NSMutableArray *)v9;
    }
  }

  return v5;
}

- (double)_timeIntervalUntilOperationShouldBePruned:(id)a3
{
  id v4;
  double numberOfSecondsToMonitor;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  numberOfSecondsToMonitor = self->_numberOfSecondsToMonitor;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v6);
  v8 = numberOfSecondsToMonitor - v7;

  return v8;
}

- (double)_minimumTimeBetweenOperationsForOperations:(id)a3
{
  unint64_t v4;
  NSArray *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "count");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_throttlingDistribution;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("numberOfOperations"), (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedIntegerValue");

        v7 += v12;
        if (v4 < v7)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("minimumTimeIntervalBetweenOperations"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v13 = v15;

          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 1.79769313e308;
LABEL_11:

  return v13;
}

- (double)_currentMinimumTimeIntervalBetweenOperations
{
  double result;

  -[WBSCloudKitThrottler _minimumTimeBetweenOperationsForOperations:](self, "_minimumTimeBetweenOperationsForOperations:", self->_pastOperationsWithinMonitoredPeriod);
  return result;
}

- (void)_pruneExpiredOrInvalidOperations
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSMutableArray *pastOperationsWithinMonitoredPeriod;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = -[NSMutableArray count](self->_pastOperationsWithinMonitoredPeriod, "count");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -self->_numberOfSecondsToMonitor);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    pastOperationsWithinMonitoredPeriod = self->_pastOperationsWithinMonitoredPeriod;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__WBSCloudKitThrottler__pruneExpiredOrInvalidOperations__block_invoke;
    v11[3] = &unk_1E649BAD8;
    v10 = v5;
    v12 = v10;
    v8 = v6;
    v13 = v8;
    -[NSMutableArray indexesOfObjectsPassingTest:](pastOperationsWithinMonitoredPeriod, "indexesOfObjectsPassingTest:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectsAtIndexes:](self->_pastOperationsWithinMonitoredPeriod, "removeObjectsAtIndexes:", v9);
    if (-[NSMutableArray count](self->_pastOperationsWithinMonitoredPeriod, "count") != v4)
      -[WBSCloudKitThrottler _saveRecordOfPastOperations](self, "_saveRecordOfPastOperations");

  }
}

BOOL __56__WBSCloudKitThrottler__pruneExpiredOrInvalidOperations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v7;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "compare:", v3);
  v5 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 40));
  v7 = v4 != -1 || v5 == 1;

  return v7;
}

- (void)_addOperationAtDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  while (1)
  {
    -[NSMutableArray firstObject](self->_pastOperationsWithinMonitoredPeriod, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4 || objc_msgSend(v4, "compare:", v6) == -1)
      break;
    -[NSMutableArray removeObjectAtIndex:](self->_pastOperationsWithinMonitoredPeriod, "removeObjectAtIndex:", 0);

  }
  -[NSMutableArray insertObject:atIndex:](self->_pastOperationsWithinMonitoredPeriod, "insertObject:atIndex:", v6, 0);

}

- (void)_loadRecordOfPastOperations
{
  id WeakRetained;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *pastOperationsWithinMonitoredPeriod;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataStore);
  objc_msgSend(WeakRetained, "recordOfPastOperationsForThrottler:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 1, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      pastOperationsWithinMonitoredPeriod = self->_pastOperationsWithinMonitoredPeriod;
      self->_pastOperationsWithinMonitoredPeriod = v6;

      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      objc_msgSend(v5, "reverseObjectEnumerator", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v8);
            v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[WBSCloudKitThrottler _addOperationAtDate:](self, "_addOperationAtDate:", v12);
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }

    }
  }

}

- (void)_saveRecordOfPastOperations
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataStore);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_pastOperationsWithinMonitoredPeriod, 200, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRecordOfPastOperations:forThrottler:", v4, self);

    WeakRetained = v5;
  }

}

- (void)reloadRecordOfPastOperations
{
  NSMutableArray *v3;
  NSMutableArray *pastOperationsWithinMonitoredPeriod;

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  pastOperationsWithinMonitoredPeriod = self->_pastOperationsWithinMonitoredPeriod;
  self->_pastOperationsWithinMonitoredPeriod = v3;

  -[WBSCloudKitThrottler _loadRecordOfPastOperations](self, "_loadRecordOfPastOperations");
}

- (double)_test_numberOfSecondsToMonitor
{
  return self->_numberOfSecondsToMonitor;
}

- (unint64_t)_test_maximumNumberOfOperationWithinMonitoredPeriod
{
  return self->_maximumNumberOfOperationWithinMonitoredPeriod;
}

- (WBSCloudKitThrottlerDataStore)dataStore
{
  return (WBSCloudKitThrottlerDataStore *)objc_loadWeakRetained((id *)&self->_dataStore);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataStore);
  objc_storeStrong((id *)&self->_throttlingDistribution, 0);
  objc_storeStrong((id *)&self->_pastOperationsWithinMonitoredPeriod, 0);
}

@end
