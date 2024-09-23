@implementation UITraitCollection(TelephonyUI)

- (uint64_t)isPreferredContentSizeCategoryAccessible
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "preferredContentSizeCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DC48D8]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DC48D0]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DC48C8]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DC48C0]) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DC48B8]);
  }

  return v2;
}

- (uint64_t)preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "preferredContentSizeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "isPreferredContentSizeCategoryAccessible") & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0DC4900]) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0DC48F8]) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0DC48F0]);
  }

  return v3;
}

@end
