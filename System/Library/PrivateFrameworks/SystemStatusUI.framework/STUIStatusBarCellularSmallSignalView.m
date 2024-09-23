@implementation STUIStatusBarCellularSmallSignalView

+ (double)_barCornerRadiusForIconSize:(int64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  double result;
  objc_super v9;

  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "secondarySIMUnderBaseline");

  if (v7)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___STUIStatusBarCellularSmallSignalView;
    objc_msgSendSuper2(&v9, sel__barCornerRadiusForIconSize_, a3);
  }
  else
  {
    result = 0.0;
    if ((unint64_t)(a3 - 1) <= 0x10)
      return dbl_1CFEBF518[a3 - 1];
  }
  return result;
}

+ (double)_barWidthForIconSize:(int64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  double result;
  objc_super v9;

  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "secondarySIMUnderBaseline");

  if (v7)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___STUIStatusBarCellularSmallSignalView;
    objc_msgSendSuper2(&v9, sel__barWidthForIconSize_, a3);
  }
  else
  {
    result = 0.0;
    if ((unint64_t)(a3 - 1) <= 0x10)
      return dbl_1CFEBF490[a3 - 1];
  }
  return result;
}

+ (double)_interspaceForIconSize:(int64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  double result;
  objc_super v9;

  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "secondarySIMUnderBaseline");

  if (v7)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___STUIStatusBarCellularSmallSignalView;
    objc_msgSendSuper2(&v9, sel__interspaceForIconSize_, a3);
  }
  else
  {
    result = 0.0;
    if ((unint64_t)(a3 - 1) <= 0x10)
      return dbl_1CFEBF5A0[a3 - 1];
  }
  return result;
}

+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4
{
  void *v7;
  void *v8;
  int v9;
  double result;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "secondarySIMUnderBaseline");

  if (v9)
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___STUIStatusBarCellularSmallSignalView;
    objc_msgSendSuper2(&v13, sel__heightForNormalBarAtIndex_iconSize_, a3, a4);
  }
  else
  {
    result = 0.0;
    switch(a4)
    {
      case 1:
        v14 = xmmword_1CFEBF2B0;
        v15 = xmmword_1CFEBF260;
        v12 = 0x4032000000000000;
        goto LABEL_11;
      case 2:
      case 3:
        v14 = xmmword_1CFEBF2A0;
        v15 = xmmword_1CFEBF210;
        v11 = 0x4039000000000000;
        goto LABEL_13;
      case 4:
      case 6:
        v14 = xmmword_1CFEBF280;
        v15 = xmmword_1CFEBF290;
        v11 = 0x403B000000000000;
        goto LABEL_13;
      case 5:
        v14 = xmmword_1CFEBF2B0;
        v15 = xmmword_1CFEBF2C0;
        v12 = 0x4034000000000000;
        goto LABEL_11;
      case 7:
        v14 = xmmword_1CFEBF260;
        v15 = xmmword_1CFEBF270;
        v11 = 0x403E000000000000;
        goto LABEL_13;
      case 8:
        v14 = xmmword_1CFEBF250;
        v15 = xmmword_1CFEBF050;
        v11 = 0x4040000000000000;
        goto LABEL_13;
      case 16:
        v14 = xmmword_1CFEBF240;
        v15 = xmmword_1CFEBF060;
        v12 = 0x402C000000000000;
LABEL_11:
        v16 = v12;
        result = *((double *)&v14 + a3) * 0.5;
        break;
      case 17:
        v14 = xmmword_1CFEBF220;
        v15 = xmmword_1CFEBF230;
        v11 = 0x4035000000000000;
LABEL_13:
        v16 = v11;
        result = *((double *)&v14 + a3) / 3.0;
        break;
      default:
        return result;
    }
  }
  return result;
}

@end
