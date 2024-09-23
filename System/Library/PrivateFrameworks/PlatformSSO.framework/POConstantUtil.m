@implementation POConstantUtil

+ (id)stringForDeviceAction:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((unint64_t)a3 > 2)
    v3 = 0;
  else
    v3 = off_24EC02478[a3];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)stringForUserAction:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((unint64_t)a3 > 3)
    v3 = 0;
  else
    v3 = off_24EC02490[a3];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)stringForRegistrationStatus:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((unint64_t)a3 > 3)
    v3 = 0;
  else
    v3 = off_24EC024B0[a3];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)stringForTokenStatus:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((unint64_t)a3 > 2)
    v3 = 0;
  else
    v3 = off_24EC024D0[a3];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
