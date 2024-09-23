@implementation PPAdaptiveCoalescerPendingKeyState

- (void)addDate:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v7;
  id v8;

  v8 = a3;
  v4 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_dates, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, -[NSMutableArray count](self->_dates, "count"), 1024, &__block_literal_global_1751);
  v5 = -[NSMutableArray count](self->_dates, "count");
  if (v5 < 0x31 || v4 != 0)
  {
    v7 = v5;
    -[NSMutableArray insertObject:atIndex:](self->_dates, "insertObject:atIndex:", v8, v4);
    if (v7 >= 0x31)
      -[NSMutableArray removeObjectAtIndex:](self->_dates, "removeObjectAtIndex:", 0);
  }

}

- (double)currentDelayForNowDate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double result;
  double v27;

  v4 = (objc_class *)MEMORY[0x1E0CB3588];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "dateByAddingTimeInterval:", -1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v5);

  -[PPAdaptiveCoalescerPendingKeyState currentQPSForDateInterval:](self, "currentQPSForDateInterval:", v8);
  if (v9 < 1.0)
    v10 = 0.0;
  else
    v10 = 1.0;

  v11 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v5, "dateByAddingTimeInterval:", -20.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v12, v5);

  -[PPAdaptiveCoalescerPendingKeyState currentQPSForDateInterval:](self, "currentQPSForDateInterval:", v13);
  v15 = v14;

  v16 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v5, "dateByAddingTimeInterval:", -300.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithStartDate:endDate:", v17, v5);

  -[PPAdaptiveCoalescerPendingKeyState currentQPSForDateInterval:](self, "currentQPSForDateInterval:", v18);
  if (v19 < 0.0333333333)
    v20 = 0.0;
  else
    v20 = 30.0;

  v21 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v5, "dateByAddingTimeInterval:", -21600.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithStartDate:endDate:", v22, v5);

  -[PPAdaptiveCoalescerPendingKeyState currentQPSForDateInterval:](self, "currentQPSForDateInterval:", v23);
  v25 = v24;

  result = 4.0;
  if (v15 < 0.25)
    result = v10;
  v27 = 300.0;
  if (v25 < 0.00222222222)
    v27 = v20;
  if (result < v27)
    return v27;
  return result;
}

- (double)currentQPSForDateInterval:(id)a3
{
  id v5;
  double v6;
  NSMutableArray *dates;
  void *v8;
  unint64_t v9;
  NSMutableArray *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v20;

  v5 = a3;
  v6 = 0.0;
  if (-[NSMutableArray count](self->_dates, "count"))
  {
    dates = self->_dates;
    objc_msgSend(v5, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](dates, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, -[NSMutableArray count](self->_dates, "count"), 1024, &__block_literal_global_1751);

    v10 = self->_dates;
    objc_msgSend(v5, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](v10, "indexOfObject:inSortedRange:options:usingComparator:", v11, 0, -[NSMutableArray count](self->_dates, "count"), 1024, &__block_literal_global_1751);

    if (v12 < v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPAdaptiveCoalescer.m"), 82, CFSTR("expected startIndex <= endIndex, got startIndex %tu endIndex %tu (dateInterval=%@, _dates=%@)"), v9, v12, v5, self->_dates);

    }
    v13 = v12 - v9;
    if (v13)
    {
      if (!v9 && -[NSMutableArray count](self->_dates, "count") == 48)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_dates, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "containsDate:", v14))
        {
          v15 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v5, "endDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "initWithStartDate:endDate:", v14, v16);

          v5 = (id)v17;
        }

      }
      objc_msgSend(v5, "duration");
      v6 = (double)v13 / v18;
    }
  }

  return v6;
}

- (PPAdaptiveCoalescerPendingKeyState)initWithKey:(id)a3
{
  id v5;
  PPAdaptiveCoalescerPendingKeyState *v6;
  PPAdaptiveCoalescerPendingKeyState *v7;
  uint64_t v8;
  NSMutableArray *handlers;
  uint64_t v10;
  NSMutableArray *dates;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPAdaptiveCoalescerPendingKeyState;
  v6 = -[PPAdaptiveCoalescerPendingKeyState init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_key, a3);
    v8 = objc_opt_new();
    handlers = v7->_handlers;
    v7->_handlers = (NSMutableArray *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 48);
    dates = v7->_dates;
    v7->_dates = (NSMutableArray *)v10;

  }
  return v7;
}

- (BOOL)shouldGarbageCollectForNowDate:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  double v7;

  v4 = a3;
  if (-[NSMutableArray count](self->_handlers, "count"))
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray lastObject](self->_dates, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v6);
    v5 = v7 > 600.0;

  }
  return v5;
}

- (double)currentQPSForNowDate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = (objc_class *)MEMORY[0x1E0CB3588];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v5);

  -[PPAdaptiveCoalescerPendingKeyState currentQPSForDateInterval:](self, "currentQPSForDateInterval:", v8);
  v10 = v9;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong(&self->_key, 0);
}

@end
