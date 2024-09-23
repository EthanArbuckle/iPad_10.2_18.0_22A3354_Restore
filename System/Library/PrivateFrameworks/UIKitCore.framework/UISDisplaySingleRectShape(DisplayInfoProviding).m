@implementation UISDisplaySingleRectShape(DisplayInfoProviding)

- (uint64_t)displayShapeName
{
  double v1;
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "rect");
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SingleRect-%ld,%ld-%ldx%ld"), (uint64_t)v3, (uint64_t)v4, (uint64_t)v1, (uint64_t)v2);
}

@end
