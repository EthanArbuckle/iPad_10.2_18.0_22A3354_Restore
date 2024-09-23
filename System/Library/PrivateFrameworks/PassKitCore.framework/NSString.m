@implementation NSString

id __59__NSString_PKEnhancedMerchantAdditions__jsonStringSetValue__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v2, "stringValue");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return v4;
}

@end
