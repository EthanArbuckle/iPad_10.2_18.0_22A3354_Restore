@implementation NSDictionary(StatusKitAgent)

- (id)ska_dictionaryForKey:()StatusKitAgent
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)ska_dataFrombase64EncodedStringForKey:()StatusKitAgent
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ska_stringForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v1, 0);
  else
    v2 = 0;

  return v2;
}

- (id)ska_dateFromUnixTimestampForKey:()StatusKitAgent
{
  void *v1;
  void *v2;
  double v3;
  void *v4;

  objc_msgSend(a1, "ska_numberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || (objc_msgSend(v1, "doubleValue"), v3 == 0.0))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)ska_stringForKey:()StatusKitAgent
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)ska_numberForKey:()StatusKitAgent
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

@end
