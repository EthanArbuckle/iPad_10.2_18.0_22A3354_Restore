@implementation PUPixelWidth

double __PUPixelWidth_block_invoke()
{
  double v0;
  double result;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  *(double *)&PUPixelWidth_pixelWidth = 1.0 / v0;

  return result;
}

@end
