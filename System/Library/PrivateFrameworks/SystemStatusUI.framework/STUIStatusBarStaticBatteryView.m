@implementation STUIStatusBarStaticBatteryView

+ (double)_lineWidthAndInterspaceForIconSize:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10)
    return dbl_1CFEBFEE0[a3 - 1];
  return result;
}

- (BOOL)hasValidIconSize
{
  return -[_UIBatteryView iconSize](self, "iconSize") != 0;
}

- (double)_batteryBoltScaleFactorMultiplier
{
  double result;
  int64_t v4;
  double *v5;
  objc_super v6;

  if (-[_UIBatteryView internalSizeCategory](self, "internalSizeCategory")
    || !-[_UIBatteryView iconSize](self, "iconSize"))
  {
    v6.receiver = self;
    v6.super_class = (Class)STUIStatusBarStaticBatteryView;
    -[_UIBatteryView _batteryBoltScaleFactorMultiplier](&v6, sel__batteryBoltScaleFactorMultiplier);
  }
  else
  {
    v4 = -[_UIBatteryView iconSize](self, "iconSize");
    if ((unint64_t)(v4 - 1) >= 0x11)
      v5 = (double *)(MEMORY[0x1E0C9D820] + 8);
    else
      v5 = (double *)((char *)&unk_1CFEC0100 + 8 * v4 - 8);
    return *v5 / 11.5;
  }
  return result;
}

+ (CGSize)_batterySizeForIconSize:(int64_t)a3
{
  double *v3;
  double *v4;
  double v5;
  double v6;
  CGSize result;

  v3 = (double *)((char *)&unk_1CFEBFD48 + 8 * a3 - 8);
  if ((unint64_t)(a3 - 1) >= 0x11)
    v4 = (double *)(MEMORY[0x1E0C9D820] + 8);
  else
    v4 = (double *)((char *)&unk_1CFEC0100 + 8 * a3 - 8);
  if ((unint64_t)(a3 - 1) >= 0x11)
    v3 = (double *)MEMORY[0x1E0C9D820];
  v5 = *v3;
  v6 = *v4;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (double)_insideCornerRadiusForIconSize:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10)
    return dbl_1CFEBFFF0[a3 - 1];
  return result;
}

+ (CGSize)_pinSizeForIconSize:(int64_t)a3
{
  double *v3;
  double *v4;
  double v5;
  double v6;
  CGSize result;

  v3 = (double *)((char *)&unk_1CFEBFDD0 + 8 * a3 - 8);
  if ((unint64_t)(a3 - 1) >= 0x11)
    v4 = (double *)(MEMORY[0x1E0C9D820] + 8);
  else
    v4 = (double *)((char *)&unk_1CFEBFE58 + 8 * a3 - 8);
  if ((unint64_t)(a3 - 1) >= 0x11)
    v3 = (double *)MEMORY[0x1E0C9D820];
  v5 = *v3;
  v6 = *v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "isRounded");
  v6 = objc_msgSend(v4, "iconSize");

  -[_UIBatteryView setRounded:iconSize:](self, "setRounded:iconSize:", v5, v6);
}

+ (double)_outsideCornerRadiusForIconSize:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10)
    return dbl_1CFEBFF68[a3 - 1];
  return result;
}

- (double)_percentageFontSizeForIconSize:(int64_t)a3
{
  _BOOL4 v4;
  double result;

  v4 = -[_UIBatteryView rounded](self, "rounded");
  result = 9.0;
  switch(a3)
  {
    case 1:
    case 14:
    case 16:
    case 17:
      return result;
    case 2:
    case 4:
      result = 11.3333333;
      break;
    case 3:
      result = 10.3333333;
      break;
    case 5:
    case 6:
    case 9:
      result = 12.0;
      break;
    case 7:
      result = 12.6666667;
      if (v4)
        result = 11.6666667;
      break;
    case 8:
      result = 13.6666667;
      break;
    case 10:
    case 11:
    case 12:
    case 13:
      result = 13.0;
      break;
    case 15:
      result = 10.0;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (double)_percentageFontCondensedWhenChargingForIconSize:(int64_t)a3
{
  _BOOL4 v4;
  double result;

  v4 = -[_UIBatteryView rounded](self, "rounded");
  if (a3 == 8)
    return 0.0;
  result = 1.0;
  if (a3 == 7)
    return (double)!v4;
  return result;
}

- (double)_percentTextVerticalAdjustmentForIconSize:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10)
    return dbl_1CFEC0078[a3 - 1];
  return result;
}

- (double)_percentTextXAdjustmentWhenFullForIconSize:(int64_t)a3
{
  double v4;
  double v5;
  double result;

  -[STUIStatusBarStaticBatteryView _currentScreenScale](self, "_currentScreenScale");
  v5 = v4;
  result = 0.0;
  if (a3 != 3)
    return -1.0 / v5 + 0.0;
  return result;
}

- (CGSize)_pinSizeForIconSize:(int64_t)a3
{
  _BOOL4 v4;
  double v5;
  double v6;
  CGSize result;

  v4 = -[_UIBatteryView rounded](self, "rounded");
  v5 = 4.5;
  v6 = 1.25;
  switch(a3)
  {
    case 1:
    case 16:
      break;
    case 2:
    case 17:
      v5 = 4.66666667;
      goto LABEL_7;
    case 3:
    case 4:
      v5 = 4.0;
      goto LABEL_7;
    case 5:
      goto LABEL_17;
    case 6:
      v5 = 5.0;
      goto LABEL_7;
    case 7:
LABEL_7:
      v6 = 1.33333333;
      break;
    case 8:
      v5 = 5.0;
      v6 = 1.66666667;
      break;
    case 9:
    case 15:
      v5 = 5.5;
      goto LABEL_11;
    case 10:
      v5 = 5.0;
      goto LABEL_17;
    case 11:
      v5 = 6.0;
LABEL_11:
      v6 = 1.75;
      break;
    case 12:
      v5 = 5.66666667;
      goto LABEL_14;
    case 13:
      v5 = 6.0;
LABEL_14:
      v6 = 1.83333333;
      break;
    case 14:
      v5 = 4.0;
      if (!v4)
        v5 = 4.5;
LABEL_17:
      v6 = 1.5;
      break;
    default:
      v6 = *MEMORY[0x1E0C9D820];
      v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      break;
  }
  result.height = v5;
  result.width = v6;
  return result;
}

- (double)_percentageBatteryBoltScaleFactorMultiplier
{
  double result;
  int64_t v4;
  _BOOL4 v5;
  double v6;
  objc_super v7;

  if (-[_UIBatteryView internalSizeCategory](self, "internalSizeCategory")
    || !-[_UIBatteryView iconSize](self, "iconSize"))
  {
    v7.receiver = self;
    v7.super_class = (Class)STUIStatusBarStaticBatteryView;
    -[_UIBatteryView _percentageBatteryBoltScaleFactorMultiplier](&v7, sel__percentageBatteryBoltScaleFactorMultiplier);
  }
  else
  {
    v4 = -[_UIBatteryView iconSize](self, "iconSize");
    v5 = -[_UIBatteryView rounded](self, "rounded");
    v6 = 9.0;
    switch(v4)
    {
      case 1:
      case 14:
      case 16:
      case 17:
        return v6 / 11.5 * 0.7;
      case 2:
      case 4:
        v6 = 11.3333333;
        break;
      case 3:
        v6 = 10.3333333;
        break;
      case 5:
      case 6:
      case 9:
        v6 = 12.0;
        break;
      case 7:
        v6 = 12.6666667;
        if (v5)
          v6 = 11.6666667;
        break;
      case 8:
        v6 = 13.6666667;
        break;
      case 10:
      case 11:
      case 12:
      case 13:
        v6 = 13.0;
        break;
      case 15:
        v6 = 10.0;
        break;
      default:
        v6 = 0.0;
        break;
    }
    return v6 / 11.5 * 0.7;
  }
  return result;
}

@end
