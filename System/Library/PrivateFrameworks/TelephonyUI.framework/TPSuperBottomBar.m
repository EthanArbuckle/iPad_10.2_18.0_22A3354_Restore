@implementation TPSuperBottomBar

+ (double)defaultSideMarginForSingleButton
{
  return 16.0;
}

+ (double)defaultSideMarginForDoubleButton
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  if (v4 >= v7)
    v8 = v4;
  else
    v8 = v7;
  v9 = v8 <= 1024.0;
  result = 31.0;
  if (!v9)
    return 25.0;
  return result;
}

+ (double)defaultInterButtonSpacing
{
  return 8.0;
}

+ (double)defaultWidth
{
  return 320.0;
}

+ (double)defaultBottomMargin
{
  return 61.0;
}

@end
