@implementation UIKeyboardEnabledInputModesAllowChineseTransliterationForText

uint64_t __UIKeyboardEnabledInputModesAllowChineseTransliterationForText_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  uint64_t v6;

  TIInputModeGetLanguage();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("zh")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("yue")))
  {
    v6 = 1;
    *a4 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
