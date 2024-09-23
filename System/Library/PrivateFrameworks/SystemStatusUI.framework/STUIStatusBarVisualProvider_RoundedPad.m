@implementation STUIStatusBarVisualProvider_RoundedPad

+ (double)height
{
  return 24.0;
}

+ (double)cornerRadius
{
  return 20.0;
}

+ (double)baselineOffset
{
  return 16.0;
}

- (CGSize)pillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 48.0;
  v3 = 18.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)smallPillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 18.0;
  v3 = 18.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)pillFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EDBEE070;
  if (unk_1EDBEE070)
    v4 = byte_1EDBEE035 == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EDBEE035 = IsBoldTextEnabled;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1448]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1EDBEE070;
    unk_1EDBEE070 = v5;

    v3 = (void *)unk_1EDBEE070;
  }
  return v3;
}

- (id)pillSmallFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EDBEE078;
  if (unk_1EDBEE078)
    v4 = byte_1EDBEE036 == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EDBEE036 = IsBoldTextEnabled;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC1420]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1EDBEE078;
    unk_1EDBEE078 = v5;

    v3 = (void *)unk_1EDBEE078;
  }
  return v3;
}

+ (NSDirectionalEdgeInsets)edgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 0.0;
  v3 = 16.0;
  v4 = 0.0;
  v5 = 15.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

+ (UIEdgeInsets)regionCursorInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -2.0;
  v3 = -8.0;
  v4 = -2.0;
  v5 = -8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (BOOL)regionCursorIsPill
{
  return 1;
}

@end
