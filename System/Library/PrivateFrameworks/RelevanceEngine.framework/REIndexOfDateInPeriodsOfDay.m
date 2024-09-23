@implementation REIndexOfDateInPeriodsOfDay

uint64_t __REIndexOfDateInPeriodsOfDay_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "interval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "intersectsDateInterval:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "interval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interval");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "compare:", v11);

  }
  return v9;
}

@end
