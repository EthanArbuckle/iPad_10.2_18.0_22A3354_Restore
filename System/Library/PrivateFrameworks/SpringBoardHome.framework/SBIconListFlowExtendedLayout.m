@implementation SBIconListFlowExtendedLayout

- (CGSize)iconSpacingForOrientation:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[SBIconListGridLayout layoutConfiguration](self, "layoutConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "listSizeForIconSpacingCalculation");
  if ((unint64_t)(a3 - 3) >= 2)
    v8 = v6;
  else
    v8 = v7;
  if ((unint64_t)(a3 - 3) < 2)
    v7 = v6;
  v9 = SBHIconListLayoutListIconSpacingForListSize(self, a3, v8, v7);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

@end
