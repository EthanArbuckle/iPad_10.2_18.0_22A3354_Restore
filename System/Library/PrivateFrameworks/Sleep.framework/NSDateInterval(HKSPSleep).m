@implementation NSDateInterval(HKSPSleep)

- (uint64_t)hksp_containsDate:()HKSPSleep
{
  return objc_msgSend(a1, "hksp_containsDate:searchOptions:", a3, 3);
}

- (uint64_t)hksp_containsDate:()HKSPSleep searchOptions:
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;

  v6 = a3;
  objc_msgSend(a1, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToDate:", v6);

  if (v8)
  {
    v9 = a4 & 1;
  }
  else
  {
    objc_msgSend(a1, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToDate:", v6);

    if (v11)
      v9 = (a4 >> 1) & 1;
    else
      v9 = objc_msgSend(a1, "containsDate:", v6);
  }

  return v9;
}

- (uint64_t)hksp_overlapsInterval:()HKSPSleep
{
  return objc_msgSend(a1, "hksp_overlapsInterval:searchOptions:", a3, 3);
}

- (uint64_t)hksp_overlapsInterval:()HKSPSleep searchOptions:
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;

  v6 = a3;
  objc_msgSend(a1, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToDate:", v8);

  if (v9)
  {
    v10 = (a4 >> 1) & 1;
  }
  else
  {
    objc_msgSend(a1, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToDate:", v12);

    if (v13)
      v10 = a4 & 1;
    else
      v10 = objc_msgSend(a1, "intersectsDateInterval:", v6);
  }

  return v10;
}

- (id)hkspDescription
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  objc_msgSend(a1, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hkspDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hkspDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@:%p [%@ - %@] >"), v3, a1, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
