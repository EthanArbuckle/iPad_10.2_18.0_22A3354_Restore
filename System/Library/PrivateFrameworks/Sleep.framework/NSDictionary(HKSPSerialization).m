@implementation NSDictionary(HKSPSerialization)

- (uint64_t)hksp_isSerialized
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (objc_msgSend(a1, "count") != 1)
    return 0;
  objc_msgSend(a1, "hksp_serializedKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "hksp_serializedKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("$"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)hksp_serializedKey
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "allKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hksp_serializedClassName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hksp_serializedKey");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "substringFromIndex:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hksp_serializedProperties
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "hksp_isSerialized"))
  {
    objc_msgSend(a1, "hksp_serializedKey");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectForKeyedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
