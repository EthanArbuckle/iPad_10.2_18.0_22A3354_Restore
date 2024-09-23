@implementation IPABestFitEvenWidthTotalPixelCountImageSizePolicy

- (CGSize)transformSize:(CGSize)a3
{
  double totalPixelCount;
  double v4;
  double v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double height;
  double width;
  double v14;
  double v15;
  CGSize result;

  if (a3.width == 0.0 || a3.height == 0.0)
  {
    height = a3.height;
    width = a3.width;
  }
  else
  {
    totalPixelCount = (double)self->super._totalPixelCount;
    v4 = sqrt(totalPixelCount / (a3.width / a3.height));
    v5 = (double)(uint64_t)floor(v4);
    v6 = vcvtpd_s64_f64(a3.width / a3.height * v5);
    v7 = v6 - ((v6 & 0x8000000000000001) == 1);
    v8 = vcvtmd_s64_f64(sqrt(a3.width / a3.height * totalPixelCount));
    v9 = v8 - ((v8 & 0x8000000000000001) == 1);
    v10 = vcvtpd_s64_f64((double)v9 / (a3.width / a3.height));
    if ((uint64_t)(v7 * vcvtmd_s64_f64(v4)) >= v9 * v10)
    {
      width = (double)v7;
      height = v5;
      if (v5 * (double)v7 > totalPixelCount)
      {
        height = (double)v10;
        width = (double)v9;
      }
    }
    else
    {
      height = (double)v10;
      width = (double)v9;
      if ((double)v9 * (double)v10 > totalPixelCount)
      {
        width = (double)v7;
        height = v5;
      }
    }
    if (width > a3.width || height > a3.height)
    {
      if (((int)a3.width & 0x80000001) == 1)
        width = a3.width + -1.0;
      else
        width = a3.width;
      height = a3.height;
    }
  }
  v14 = width;
  v15 = height;
  result.height = v15;
  result.width = v14;
  return result;
}

@end
