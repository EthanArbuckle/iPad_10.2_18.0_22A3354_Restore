@implementation NSAttributedString(REMCRMergeableStringDocument_Styling)

- (double)rem_fontHintAtIndex:()REMCRMergeableStringDocument_Styling effectiveRange:
{
  void *v7;
  unint64_t v8;
  double result;
  void *v10;

  if ((a3 & 0x8000000000000000) != 0
    || (objc_msgSend(a1, "string"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v8 <= a3))
  {
    if (a4)
    {
      result = NAN;
      *a4 = xmmword_1B4B743E0;
    }
  }
  else
  {
    objc_msgSend(a1, "attribute:atIndex:effectiveRange:", TTAttributeNameFontHints, a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "intValue");

  }
  return result;
}

- (uint64_t)rem_isUnderlinedAtIndex:()REMCRMergeableStringDocument_Styling effectiveRange:
{
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;

  if ((a3 & 0x8000000000000000) != 0
    || (objc_msgSend(a1, "string"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v8 <= a3))
  {
    if (a4)
      *a4 = xmmword_1B4B743E0;
    return 0;
  }
  else
  {
    objc_msgSend(a1, "attribute:atIndex:effectiveRange:", TTAttributeNameUnderline, a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    return v10;
  }
}

@end
