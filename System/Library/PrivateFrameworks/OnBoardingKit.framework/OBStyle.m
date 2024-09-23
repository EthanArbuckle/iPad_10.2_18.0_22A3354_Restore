@implementation OBStyle

+ (CGSize)sheetSizeForParentWindowSize:(CGSize)a3
{
  BOOL v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v3 = a3.height == *(double *)(MEMORY[0x1E0C9D820] + 8) && a3.width == *MEMORY[0x1E0C9D820];
  v4 = fmax(a3.height * 0.88, 546.0);
  if (v3)
    v4 = 546.0;
  v5 = fmin(v4, 600.0);
  v6 = 482.0;
  result.height = v5;
  result.width = v6;
  return result;
}

@end
