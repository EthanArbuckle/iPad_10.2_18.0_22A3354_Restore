@implementation NSDateInterval(RTExtensions)

+ (id)mergeDateIntervals:()RTExtensions
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;

  v3 = a3;
  if (objc_msgSend(v3, "count") && objc_msgSend(v3, "count") != 1)
  {
    objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_43);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v7;
    objc_msgSend(v7, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      v17 = v9;
    }
    else
    {
      v10 = 1;
      do
      {
        objc_msgSend(v5, "objectAtIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "earlierDate:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 == v14)
        {
          objc_msgSend(v11, "endDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "laterDate:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v9);
          if (v15)
            objc_msgSend(v6, "addObject:", v15);
          objc_msgSend(v11, "startDate");
          v16 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "endDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)v16;
        }

        ++v10;
        v9 = v17;
      }
      while (objc_msgSend(v5, "count") > v10);
    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v17);
    if (v18)
      objc_msgSend(v6, "addObject:", v18);
    v4 = v6;

  }
  else
  {
    v4 = v3;
  }

  return v4;
}

+ (id)invertDateIntervals:()RTExtensions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v24 = v4;
    objc_msgSend(a1, "mergeDateIntervals:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        v12 = 0;
        v13 = v7;
        do
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
          v15 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v14, "startDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v15, "initWithStartDate:endDate:", v13, v16);

          objc_msgSend(v17, "duration");
          if (v18 > 0.0)
            objc_msgSend(v6, "addObject:", v17);
          objc_msgSend(v14, "endDate");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          ++v12;
          v13 = v7;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    v19 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithStartDate:endDate:", v7, v20);

    objc_msgSend(v21, "duration");
    if (v22 > 0.0)
      objc_msgSend(v6, "addObject:", v21);

    v4 = v24;
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

+ (id)dateIntervals:()RTExtensions intersectingDateInterval:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6 && objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "intersectionWithDateInterval:", v6, (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("start date, %@, end date, %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
