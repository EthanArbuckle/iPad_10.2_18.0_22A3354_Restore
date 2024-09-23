@implementation PGTimeUtility

+ (id)dateIntervalWithStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "compare:", v6);
  if (v7 == 1)
    v8 = v5;
  else
    v8 = v6;
  if (v7 != 1)
    v6 = v5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v6, v8);

  return v9;
}

@end
