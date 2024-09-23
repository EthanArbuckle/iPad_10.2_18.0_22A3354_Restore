@implementation UISheetDetentBlockMedium

double _UISheetDetentBlockMedium_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  CGRect v9;

  v2 = a2;
  objc_msgSend(v2, "containerTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verticalSizeClass");

  if (v4 == 1)
  {
    v5 = 1.79769313e308;
  }
  else
  {
    objc_msgSend(v2, "maximumDetentValue");
    v7 = v6;
    objc_msgSend(v2, "_containerBounds");
    v5 = v7 * dbl_186684610[CGRectGetHeight(v9) > 568.0];
  }

  return v5;
}

@end
