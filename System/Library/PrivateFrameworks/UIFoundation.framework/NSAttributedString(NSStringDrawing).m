@implementation NSAttributedString(NSStringDrawing)

- (void)drawAtPoint:()NSStringDrawing
{
  uint64_t v6;
  uint64_t v7;

  v6 = CTFontSwapDefaultLineHeightAdjustment();
  MEMORY[0x18D790ECC](v6, 0.0);
  _NSStringDrawingCore(a1, 0, 1, 0, a2, a3, 0.0, 0.0, 0.0, v7, 0);
  CTFontSwapDefaultLineHeightAdjustment();
  JUMPOUT(0x18D790ECCLL);
}

- (__CFString)drawInRect:()NSStringDrawing
{
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;

  if (a4 > 0.0 && a5 > 0.0)
  {
    v9 = result;
    v10 = CTFontSwapDefaultLineHeightAdjustment();
    MEMORY[0x18D790ECC](v10, 0.0);
    _NSStringDrawingCore(v9, 0, 1, 0, a2, a3, a4, a5, 0.0, v11, 0);
    CTFontSwapDefaultLineHeightAdjustment();
    JUMPOUT(0x18D790ECCLL);
  }
  return result;
}

- (double)size
{
  double v1;

  objc_msgSend(a1, "boundingRectWithSize:options:context:", 1, 0, *MEMORY[0x1E0CB3440], *(double *)(MEMORY[0x1E0CB3440] + 8));
  return v1;
}

@end
