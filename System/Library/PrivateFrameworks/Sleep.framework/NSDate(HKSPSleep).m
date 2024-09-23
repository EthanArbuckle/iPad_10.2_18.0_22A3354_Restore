@implementation NSDate(HKSPSleep)

- (id)hkspDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "descriptionWithLocale:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)hksp_isBeforeDate:()HKSPSleep
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDate+HKSPSleep.m"), 22, CFSTR("date can't be nil"));

  }
  objc_msgSend(a1, "earlierDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == a1)
    v7 = objc_msgSend(a1, "isEqualToDate:", v5) ^ 1;
  else
    v7 = 0;

  return v7;
}

- (BOOL)hksp_isBeforeOrSameAsDate:()HKSPSleep
{
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDate+HKSPSleep.m"), 27, CFSTR("date can't be nil"));

  }
  objc_msgSend(a1, "earlierDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == a1;

  return v7;
}

- (uint64_t)hksp_isAfterDate:()HKSPSleep
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDate+HKSPSleep.m"), 32, CFSTR("date can't be nil"));

  }
  objc_msgSend(a1, "laterDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == a1)
    v7 = objc_msgSend(a1, "isEqualToDate:", v5) ^ 1;
  else
    v7 = 0;

  return v7;
}

- (BOOL)hksp_isAfterOrSameAsDate:()HKSPSleep
{
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDate+HKSPSleep.m"), 37, CFSTR("date can't be nil"));

  }
  objc_msgSend(a1, "laterDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == a1;

  return v7;
}

- (id)hksp_dateNearestMatchingComponents:()HKSPSleep
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecond:", 0);
  objc_msgSend(v5, "components:fromDate:", 224, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    v8 = a1;
  }
  else
  {
    objc_msgSend(v5, "hksp_previousDateBeforeDate:matchingComponents:", a1, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hksp_nextDateAfterDate:matchingComponents:", a1, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "timeIntervalSinceDate:", v9);
    v12 = v11;
    objc_msgSend(v10, "timeIntervalSinceDate:", a1);
    if (v13 >= v12)
      v14 = v9;
    else
      v14 = v10;
    v8 = v14;

  }
  return v8;
}

+ (id)hksp_latestFromDates:()HKSPSleep
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__0;
    v11 = __Block_byref_object_dispose__0;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__NSDate_HKSPSleep__hksp_latestFromDates___block_invoke;
    v6[3] = &unk_1E4E3B270;
    v6[4] = &v7;
    objc_msgSend(v3, "na_each:", v6);
    v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)hksp_earliestFromDates:()HKSPSleep
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__0;
    v11 = __Block_byref_object_dispose__0;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__NSDate_HKSPSleep__hksp_earliestFromDates___block_invoke;
    v6[3] = &unk_1E4E3B270;
    v6[4] = &v7;
    objc_msgSend(v3, "na_each:", v6);
    v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)hksp_closestFromDates:()HKSPSleep toDate:
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  uint64_t *v12;
  _QWORD v13[4];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__0;
    v18 = __Block_byref_object_dispose__0;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0x41DFFFFFFFC00000;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__NSDate_HKSPSleep__hksp_closestFromDates_toDate___block_invoke;
    v9[3] = &unk_1E4E3B298;
    v10 = v6;
    v11 = v13;
    v12 = &v14;
    objc_msgSend(v5, "na_each:", v9);
    v7 = (id)v15[5];

    _Block_object_dispose(v13, 8);
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)hksp_isWithinInterval:()HKSPSleep ofDate:
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v6 = (objc_class *)MEMORY[0x1E0CB3588];
  v7 = a4;
  v8 = [v6 alloc];
  objc_msgSend(a1, "dateByAddingTimeInterval:", -a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateByAddingTimeInterval:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithStartDate:endDate:", v9, v10);

  v12 = objc_msgSend(v11, "hksp_containsDate:", v7);
  return v12;
}

@end
