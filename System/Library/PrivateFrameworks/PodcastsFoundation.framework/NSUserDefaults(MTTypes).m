@implementation NSUserDefaults(MTTypes)

- (uint64_t)episodeLimitForKey:()MTTypes
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "longLongValue");
  else
    v2 = 0;

  return v2;
}

@end
