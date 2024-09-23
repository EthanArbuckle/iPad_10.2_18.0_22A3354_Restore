@implementation NSTextAttachment(UIAccessibilityContentSizeCategoryImageAdjusting)

- (uint64_t)adjustsImageSizeForAccessibilityContentSizeCategory
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, &adjustsImageSizeForAccessibilityContentSizeCategoryKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setAdjustsImageSizeForAccessibilityContentSizeCategory:()UIAccessibilityContentSizeCategoryImageAdjusting
{
  id v5;

  if (objc_msgSend(a1, "adjustsImageSizeForAccessibilityContentSizeCategory") != (_DWORD)a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, &adjustsImageSizeForAccessibilityContentSizeCategoryKey, v5, (void *)1);

  }
}

@end
