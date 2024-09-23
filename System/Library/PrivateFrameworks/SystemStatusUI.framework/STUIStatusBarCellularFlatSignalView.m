@implementation STUIStatusBarCellularFlatSignalView

+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  double result;

  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "secondarySIMUnderBaseline");

  if (v8)
  {
    objc_msgSend(a1, "_barWidthForIconSize:", a4);
  }
  else
  {
    result = 0.0;
    if ((unint64_t)(a4 - 1) <= 0x10)
      return dbl_1CFEBF628[a4 - 1];
  }
  return result;
}

@end
