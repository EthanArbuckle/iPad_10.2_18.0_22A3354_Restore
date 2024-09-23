@implementation NSDictionary(VUIStoreAcquisition)

- (uint64_t)vui_appleTimingAppHeaderValue
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "objectForKey:", CFSTR("apple-timing-app"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "componentsSeparatedByString:", CFSTR(" "));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
