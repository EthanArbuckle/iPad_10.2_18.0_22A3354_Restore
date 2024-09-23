@implementation WFParameter(CHSWidgetFamily)

- (uint64_t)arraySizeRangeForCHSWidgetFamily:()CHSWidgetFamily
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  LNActionConfigurationContextWidgetFamilyFromCHSWidgetFamily(a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)*MEMORY[0x24BE5F8F8];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  v9 = objc_msgSend(a1, "arraySizeRangeForWidgetFamily:", v8);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    INCodableAttributeArraySizeClassFromCHSWidgetFamily(a3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = (void *)*MEMORY[0x24BDD98A0];
    if (v10)
      v12 = (void *)v10;
    v13 = v12;

    v9 = objc_msgSend(a1, "arraySizeForWidgetSizeClass:", v13);
  }
  return v9;
}

- (uint64_t)arrayMaxCountForWidgetFamily:()CHSWidgetFamily
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, "arraySizeRangeForCHSWidgetFamily:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v3 = v2 + v1 - 1;
  if (v2)
    return v3;
  else
    return 0;
}

@end
