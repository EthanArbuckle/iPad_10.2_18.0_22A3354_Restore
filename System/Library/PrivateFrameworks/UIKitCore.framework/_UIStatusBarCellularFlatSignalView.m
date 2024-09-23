@implementation _UIStatusBarCellularFlatSignalView

+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4
{
  double result;

  if (_UIGetSecondarySIMUnderBaseline())
  {
    objc_msgSend(a1, "_barWidthForIconSize:", a4);
  }
  else
  {
    result = 0.0;
    if ((unint64_t)(a4 - 1) <= 0x10)
      return dbl_186683700[a4 - 1];
  }
  return result;
}

@end
