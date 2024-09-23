@implementation SearchUIAppIconUtilities

+ (double)preferredHorizontalPlatterInsetForAppIcons
{
  double result;

  +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
  return result;
}

+ (double)distanceToTopOfAppIconsForMultiResultCell
{
  double result;

  objc_msgSend((id)objc_opt_class(), "preferredHorizontalPlatterInsetForAppIcons");
  return result;
}

+ (int64_t)numberOfAppIconsPerRow
{
  if (+[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad"))
    return 6;
  else
    return 4;
}

+ (CGSize)appIconItemSize
{
  double v2;
  double v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  CGSize result;

  v2 = *(double *)&searchUI_appIconItemSize_0;
  v3 = *(double *)&searchUI_appIconItemSize_1;
  if (*(double *)&searchUI_appIconItemSize_0 == *MEMORY[0x1E0C9D820]
    && *(double *)&searchUI_appIconItemSize_1 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "iconViewSize");
    searchUI_appIconItemSize_0 = v6;
    searchUI_appIconItemSize_1 = v7;

    v2 = *(double *)&searchUI_appIconItemSize_0;
    v3 = *(double *)&searchUI_appIconItemSize_1;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)idealHorizontalSpacingBetweenAppIcons
{
  double result;
  BOOL v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  result = *(double *)&idealHorizontalSpacingBetweenAppIcons_spacing;
  if (*(double *)&idealHorizontalSpacingBetweenAppIcons_spacing == 0.0)
  {
    v4 = +[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad", *(double *)&idealHorizontalSpacingBetweenAppIcons_spacing);
    result = 22.0;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", 22.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_referenceBounds");
      v7 = v6;

      objc_msgSend(a1, "preferredHorizontalPlatterInsetForAppIcons");
      v9 = v8;
      +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
      objc_msgSend(a1, "idealHorizontalSpacingBetweenAppIconsForContainerWidth:insets:", v7, 0.0, v9 + v10, 0.0, v9 + v10);
      idealHorizontalSpacingBetweenAppIcons_spacing = *(_QWORD *)&result;
    }
  }
  return result;
}

+ (double)idealHorizontalSpacingBetweenAppIconsForContainerWidth:(double)a3 insets:(UIEdgeInsets)a4
{
  double v5;
  double v6;
  double v7;
  double result;

  v5 = a3 - a4.left - a4.right;
  objc_msgSend(a1, "appIconItemSize");
  v7 = v5 - v6 * (double)objc_msgSend(a1, "numberOfAppIconsPerRow");
  objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedValue:forView:", 0, v7 / (double)(objc_msgSend(a1, "numberOfAppIconsPerRow") - 1));
  return result;
}

@end
