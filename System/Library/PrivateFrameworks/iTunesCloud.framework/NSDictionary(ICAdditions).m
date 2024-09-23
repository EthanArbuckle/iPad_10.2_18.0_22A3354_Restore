@implementation NSDictionary(ICAdditions)

- (uint64_t)ic_BOOLValueForKey:()ICAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (id)ic_stringValueForKey:()ICAdditions
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)ic_numberValueForKey:()ICAdditions
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)ic_dictionaryValueForKey:()ICAdditions
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)ic_dataValueForKey:()ICAdditions
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSData())
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (uint64_t)ic_integerValueForKey:()ICAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "integerValue");
  else
    v2 = 0;

  return v2;
}

- (id)ic_arrayValueForKey:()ICAdditions
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (uint64_t)ic_intValueForKey:()ICAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "intValue");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)ic_uintValueForKey:()ICAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "unsignedIntValue");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)ic_int64ValueForKey:()ICAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "longLongValue");
  else
    v2 = 0;

  return v2;
}

- (double)ic_doubleValueForKey:()ICAdditions
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "doubleValue");
    v2 = v3;
  }

  return v2;
}

@end
