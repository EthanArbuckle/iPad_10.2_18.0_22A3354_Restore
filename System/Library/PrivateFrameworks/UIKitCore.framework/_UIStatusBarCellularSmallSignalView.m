@implementation _UIStatusBarCellularSmallSignalView

+ (double)_barWidthForIconSize:(int64_t)a3
{
  double result;
  objc_super v6;

  if (_UIGetSecondarySIMUnderBaseline())
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS____UIStatusBarCellularSmallSignalView;
    objc_msgSendSuper2(&v6, sel__barWidthForIconSize_, a3);
  }
  else
  {
    result = 0.0;
    if ((unint64_t)(a3 - 1) <= 0x10)
      return dbl_186683568[a3 - 1];
  }
  return result;
}

+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4
{
  double result;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (_UIGetSecondarySIMUnderBaseline())
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS____UIStatusBarCellularSmallSignalView;
    objc_msgSendSuper2(&v10, sel__heightForNormalBarAtIndex_iconSize_, a3, a4);
  }
  else
  {
    result = 0.0;
    switch(a4)
    {
      case 1:
        v11 = xmmword_186680D30;
        v12 = xmmword_186680C20;
        v9 = 0x4032000000000000;
        goto LABEL_11;
      case 2:
      case 3:
        v11 = xmmword_186680F00;
        v12 = xmmword_186683AE0;
        v8 = 0x4039000000000000;
        goto LABEL_13;
      case 4:
      case 6:
        v11 = xmmword_186680F40;
        v12 = xmmword_186683B30;
        v8 = 0x403B000000000000;
        goto LABEL_13;
      case 5:
        v11 = xmmword_186680D30;
        v12 = xmmword_186683B40;
        v9 = 0x4034000000000000;
        goto LABEL_11;
      case 7:
        v11 = xmmword_186680C20;
        v12 = xmmword_1866818C0;
        v8 = 0x403E000000000000;
        goto LABEL_13;
      case 8:
        v11 = xmmword_186683B20;
        v12 = xmmword_186683920;
        v8 = 0x4040000000000000;
        goto LABEL_13;
      case 16:
        v11 = xmmword_186683B10;
        v12 = xmmword_186683930;
        v9 = 0x402C000000000000;
LABEL_11:
        v13 = v9;
        result = *((double *)&v11 + a3) * 0.5;
        break;
      case 17:
        v11 = xmmword_186683AF0;
        v12 = xmmword_186683B00;
        v8 = 0x4035000000000000;
LABEL_13:
        v13 = v8;
        result = *((double *)&v11 + a3) / 3.0;
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (double)_barCornerRadiusForIconSize:(int64_t)a3
{
  double result;
  objc_super v6;

  if (_UIGetSecondarySIMUnderBaseline())
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS____UIStatusBarCellularSmallSignalView;
    objc_msgSendSuper2(&v6, sel__barCornerRadiusForIconSize_, a3);
  }
  else
  {
    result = 0.0;
    if ((unint64_t)(a3 - 1) <= 0x10)
      return dbl_1866835F0[a3 - 1];
  }
  return result;
}

+ (double)_interspaceForIconSize:(int64_t)a3
{
  double result;
  objc_super v6;

  if (_UIGetSecondarySIMUnderBaseline())
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS____UIStatusBarCellularSmallSignalView;
    objc_msgSendSuper2(&v6, sel__interspaceForIconSize_, a3);
  }
  else
  {
    result = 0.0;
    if ((unint64_t)(a3 - 1) <= 0x10)
      return dbl_186683678[a3 - 1];
  }
  return result;
}

@end
