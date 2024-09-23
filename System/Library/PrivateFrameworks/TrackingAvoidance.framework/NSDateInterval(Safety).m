@implementation NSDateInterval(Safety)

+ (id)createIntervalSafelyWithStartDate:()Safety endDate:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = objc_msgSend(v5, "compare:", v6);
    v10 = objc_alloc(MEMORY[0x24BDD1508]);
    if (v9 == 1)
      v11 = objc_msgSend(v10, "initWithStartDate:duration:", v5, 0.0);
    else
      v11 = objc_msgSend(v10, "initWithStartDate:endDate:", v5, v7);
    v8 = (void *)v11;
  }

  return v8;
}

@end
