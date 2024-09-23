@implementation NSCalendar(PLExtensions)

- (BOOL)pl_isDateValid:()PLExtensions
{
  id v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCalendar+PLExtensions.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "compare:", v6) == -1)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "compare:", v5) != -1;

LABEL_6:
  return v8;
}

- (id)pl_validDateForDate:()PLExtensions
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "compare:", v4);

    if (v5 == -1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_9:
        v10 = 138412546;
        v11 = v3;
        v12 = 2112;
        v13 = v8;
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid date found: %@, using %@ instead.", (uint8_t *)&v10, 0x16u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "compare:", v3);

      v8 = v3;
      if (v7 == -1)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_9;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)pl_startOfNextDayForDate:()PLExtensions
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(a1, "pl_isDateValid:", v4) & 1) != 0)
  {
    objc_msgSend(a1, "startOfDayForDate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "pl_dateByAddingDays:toDate:", 1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)v5;
  }
  else
  {
    objc_msgSend(a1, "pl_validDateForDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)pl_endOfPreviousDayForDate:()PLExtensions
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(a1, "pl_isDateValid:", v4) & 1) != 0)
  {
    objc_msgSend(a1, "startOfDayForDate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v6, "setNanosecond:", -1000000);
    objc_msgSend(a1, "dateByAddingComponents:toDate:options:", v6, v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  else
  {
    objc_msgSend(a1, "pl_validDateForDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)pl_endOfDayForDate:()PLExtensions
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(a1, "pl_isDateValid:", v4) & 1) != 0)
  {
    objc_msgSend(a1, "startOfDayForDate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v6, "setDay:", 1);
    objc_msgSend(v6, "setNanosecond:", -1000000);
    objc_msgSend(a1, "dateByAddingComponents:toDate:options:", v6, v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  else
  {
    objc_msgSend(a1, "pl_validDateForDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)pl_dateByAddingDays:()PLExtensions toDate:
{
  id v6;
  void *v7;

  v6 = a4;
  if ((objc_msgSend(a1, "pl_isDateValid:", v6) & 1) != 0)
    objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", 16, a3, v6, 0);
  else
    objc_msgSend(a1, "pl_validDateForDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pl_endOfWeekForDate:()PLExtensions
{
  id v4;
  uint64_t v5;
  void *v6;
  id v8;
  double v9;

  v4 = a3;
  if ((objc_msgSend(a1, "pl_isDateValid:", v4) & 1) != 0)
  {
    v8 = 0;
    v9 = 0.0;
    objc_msgSend(a1, "rangeOfUnit:startDate:interval:forDate:", 0x2000, &v8, &v9, v4);

    v4 = v8;
    objc_msgSend(v4, "dateByAddingTimeInterval:", v9 + -0.001);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "pl_validDateForDate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)pl_startOfDayForDate:()PLExtensions
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_msgSend(a1, "pl_isDateValid:", v4) & 1) != 0)
    objc_msgSend(a1, "startOfDayForDate:", v4);
  else
    objc_msgSend(a1, "pl_validDateForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pl_startOfWeekForDate:()PLExtensions
{
  id v4;
  void *v6;
  id v7;

  v4 = a3;
  if ((objc_msgSend(a1, "pl_isDateValid:", v4) & 1) != 0)
  {
    v7 = 0;
    objc_msgSend(a1, "rangeOfUnit:startDate:interval:forDate:", 0x2000, &v7, 0, v4);

    return v7;
  }
  else
  {
    objc_msgSend(a1, "pl_validDateForDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (id)pl_startOfMonthForDate:()PLExtensions
{
  id v4;
  void *v6;
  id v7;

  v4 = a3;
  if ((objc_msgSend(a1, "pl_isDateValid:", v4) & 1) != 0)
  {
    v7 = 0;
    objc_msgSend(a1, "rangeOfUnit:startDate:interval:forDate:", 8, &v7, 0, v4);

    return v7;
  }
  else
  {
    objc_msgSend(a1, "pl_validDateForDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

@end
