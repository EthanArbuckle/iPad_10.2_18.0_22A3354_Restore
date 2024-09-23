@implementation _SBDisplayItemDownscalingGrid

- (CGSize)nearestGridSizeForSize:(CGSize)a3 countOnStage:(unint64_t)a4
{
  double height;
  double width;
  double v6;
  double v7;
  double v9;
  objc_super v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)_SBDisplayItemDownscalingGrid;
  -[_SBDisplayItemSingleSizeGrid nearestGridSizeForSize:countOnStage:](&v10, sel_nearestGridSizeForSize_countOnStage_, a4);
  if (v7 > height || v6 > width)
  {
    v9 = height / v7;
    if (height / v7 > width / v6)
      v9 = width / v6;
    if (v9 < 0.7)
      v9 = 0.7;
    v6 = v6 * v9;
    v7 = v7 * v9;
  }
  result.height = v7;
  result.width = v6;
  return result;
}

@end
