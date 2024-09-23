@implementation NSCalendar(WorkflowKit)

- (id)wf_weekendDays
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "weekdaySymbols");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      if (objc_msgSend(a1, "isDateInWeekend:", v3))
      {
        objc_msgSend(a1, "components:fromDate:", 512, v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "weekday");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v9);

      }
      objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", 16, 1, v3, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      ++v6;
      objc_msgSend(a1, "weekdaySymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      v3 = v10;
    }
    while (v6 < v12);
  }
  else
  {
    v10 = v3;
  }
  v13 = (void *)objc_msgSend(v2, "copy");

  return v13;
}

- (id)wf_workweekDays
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "weekdaySymbols");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      if ((objc_msgSend(a1, "isDateInWeekend:", v3) & 1) == 0)
      {
        objc_msgSend(a1, "components:fromDate:", 512, v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "weekday");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v9);

      }
      objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", 16, 1, v3, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      ++v6;
      objc_msgSend(a1, "weekdaySymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      v3 = v10;
    }
    while (v6 < v12);
  }
  else
  {
    v10 = v3;
  }
  v13 = (void *)objc_msgSend(v2, "copy");

  return v13;
}

- (id)wf_weekdays
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;

  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "weekdaySymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "weekdaySymbols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

      ++v7;
      objc_msgSend(a1, "weekdaySymbols");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

    }
    while (v7 <= v10);
  }
  v11 = (void *)objc_msgSend(v4, "copy");

  return v11;
}

@end
