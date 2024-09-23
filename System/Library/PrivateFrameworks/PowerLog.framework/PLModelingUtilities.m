@implementation PLModelingUtilities

+ (double)duetDiscretionaryBudget
{
  double v2;
  uint64_t v3;
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;
  uint64_t v9;

  if (+[PLModelingUtilities isiPhone](PLModelingUtilities, "isiPhone"))
    return 280.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
  {
    v3 = 0x4064000000000000;
    return *(double *)&v3;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0)
    goto LABEL_6;
  if ((MGIsDeviceOneOfType() & 1) != 0
    || (MGIsDeviceOneOfType() & 1) != 0
    || (MGIsDeviceOneOfType() & 1) != 0
    || (MGIsDeviceOneOfType() & 1) != 0)
  {
    v3 = 0x4054000000000000;
    return *(double *)&v3;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0)
  {
LABEL_6:
    v3 = 0x404E000000000000;
    return *(double *)&v3;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 110.0;
  v2 = 135.0;
  if ((MGIsDeviceOneOfType() & 1) == 0
    && (MGIsDeviceOneOfType() & 1) == 0
    && (MGIsDeviceOneOfType() & 1) == 0
    && (MGIsDeviceOneOfType() & 1) == 0
    && (MGIsDeviceOneOfType() & 1) == 0)
  {
    LODWORD(v9) = -1509831889;
    if ((MGIsDeviceOneOfType() & 1) == 0)
    {
      v2 = 210.0;
      if ((MGIsDeviceOneOfType() & 1) == 0 && (MGIsDeviceOneOfType() & 1) == 0)
      {
        v5 = 0.05;
        if (+[PLModelingUtilities isiPad](PLModelingUtilities, "isiPad", 0, 0, 0, 0, 0x55A822A174B2879DLL, 0x83A041CA364BB786, v9))
        {
          v6 = 0.01;
        }
        else
        {
          v6 = 0.05;
        }
        v7 = +[PLModelingUtilities isWatch](PLModelingUtilities, "isWatch");
        if (!+[PLModelingUtilities isMac](PLModelingUtilities, "isMac") && !v7)
          v5 = v6;
        +[PLModelingUtilities defaultBatteryEnergyCapacity](PLModelingUtilities, "defaultBatteryEnergyCapacity");
        return v5 * v8;
      }
    }
  }
  return v2;
}

+ (id)valueForMobileGestaltCapability:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PLModelingUtilities_valueForMobileGestaltCapability___block_invoke;
  block[3] = &unk_1E4165E90;
  v9 = v3;
  v4 = valueForMobileGestaltCapability__once;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&valueForMobileGestaltCapability__once, block);
  v6 = (id)valueForMobileGestaltCapability__gestaltValue;

  return v6;
}

void __55__PLModelingUtilities_valueForMobileGestaltCapability___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswerWithError();
  v1 = (void *)valueForMobileGestaltCapability__gestaltValue;
  valueForMobileGestaltCapability__gestaltValue = v0;

}

+ (BOOL)isiPad
{
  if (isiPad_once != -1)
    dispatch_once(&isiPad_once, &__block_literal_global_2);
  return isiPad_isiPad;
}

void __29__PLModelingUtilities_isiPad__block_invoke()
{
  id v0;

  +[PLModelingUtilities valueForMobileGestaltCapability:](PLModelingUtilities, "valueForMobileGestaltCapability:", CFSTR("DeviceClass"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isiPad_isiPad = objc_msgSend(v0, "isEqualToString:", CFSTR("iPad"));

}

+ (BOOL)isiPhone
{
  if (isiPhone_once != -1)
    dispatch_once(&isiPhone_once, &__block_literal_global_23);
  return isiPhone_isiPhone;
}

void __31__PLModelingUtilities_isiPhone__block_invoke()
{
  id v0;

  +[PLModelingUtilities valueForMobileGestaltCapability:](PLModelingUtilities, "valueForMobileGestaltCapability:", CFSTR("DeviceClass"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isiPhone_isiPhone = objc_msgSend(v0, "isEqualToString:", CFSTR("iPhone"));

}

+ (BOOL)isiPod
{
  if (isiPod_once != -1)
    dispatch_once(&isiPod_once, &__block_literal_global_26_0);
  return isiPod_isiPod;
}

void __29__PLModelingUtilities_isiPod__block_invoke()
{
  id v0;

  +[PLModelingUtilities valueForMobileGestaltCapability:](PLModelingUtilities, "valueForMobileGestaltCapability:", CFSTR("DeviceClass"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isiPod_isiPod = objc_msgSend(v0, "isEqualToString:", CFSTR("iPod"));

}

+ (BOOL)isWatch
{
  if (isWatch_once != -1)
    dispatch_once(&isWatch_once, &__block_literal_global_29);
  return isWatch_isWatch;
}

void __30__PLModelingUtilities_isWatch__block_invoke()
{
  id v0;

  +[PLModelingUtilities valueForMobileGestaltCapability:](PLModelingUtilities, "valueForMobileGestaltCapability:", CFSTR("DeviceClass"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isWatch_isWatch = objc_msgSend(v0, "isEqualToString:", CFSTR("Watch"));

}

+ (BOOL)isMac
{
  return 0;
}

+ (BOOL)isARMMac
{
  return 0;
}

+ (BOOL)isTVOS
{
  return 0;
}

+ (BOOL)isHomePod
{
  return 0;
}

+ (BOOL)isAppleTV
{
  if (isAppleTV_once != -1)
    dispatch_once(&isAppleTV_once, &__block_literal_global_32);
  return isAppleTV_isAppleTV;
}

void __32__PLModelingUtilities_isAppleTV__block_invoke()
{
  id v0;

  +[PLModelingUtilities valueForMobileGestaltCapability:](PLModelingUtilities, "valueForMobileGestaltCapability:", CFSTR("DeviceClass"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isAppleTV_isAppleTV = objc_msgSend(v0, "isEqualToString:", CFSTR("AppleTV"));

}

+ (BOOL)isAppleVision
{
  return 0;
}

+ (BOOL)shouldShowBatteryGraphs
{
  return MGIsDeviceOneOfType() ^ 1;
}

+ (double)defaultBatteryEnergyCapacity
{
  double result;
  double v3;
  double v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  _BOOL4 v10;

  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 7449.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 11080.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 6176.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 10480.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 6484.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 11100.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 6870.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 5608.6;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 5427.2;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 5173.9;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 26700.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 38500.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 19120.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 23120.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 27900.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 31590.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 42500.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 31590.0;
  v3 = 28570.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return v3;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 36210.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 28370.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 36636.0;
  v4 = 19020.0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return v4;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 29620.0;
  v5 = MGIsDeviceOneOfType();
  result = 31590.0;
  if ((v5 & 1) == 0)
  {
    v6 = MGIsDeviceOneOfType();
    result = 28570.0;
    if ((v6 & 1) == 0)
    {
      v3 = 28650.0;
      if ((MGIsDeviceOneOfType() & 1) != 0)
        return v3;
      if ((MGIsDeviceOneOfType() & 1) != 0)
      {
        return 28760.0;
      }
      else if ((MGIsDeviceOneOfType() & 1) != 0)
      {
        return 41160.0;
      }
      else
      {
        v7 = MGIsDeviceOneOfType();
        result = 28650.0;
        if ((v7 & 1) == 0)
        {
          v8 = MGIsDeviceOneOfType();
          result = 19020.0;
          if ((v8 & 1) == 0)
          {
            if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 28990.0;
            }
            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 36730.0;
            }
            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 3975.0;
            }
            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 10030.0;
            }
            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 12060.0;
            }
            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 11160.0;
            }
            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 11920.0;
            }
            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 11750.0;
            }
            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 15100.0;
            }
            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 6960.0;
            }
            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 8670.0;
            }
            else
            {
              v4 = 10960.0;
              if ((MGIsDeviceOneOfType() & 1) != 0)
                return v4;
              v9 = MGIsDeviceOneOfType();
              result = 10960.0;
              if ((v9 & 1) == 0)
              {
                if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 14620.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 12129.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 17024.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 9467.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 12563.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 7909.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 12823.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 16872.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 12449.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 17070.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 12872.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 17305.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 13162.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 17181.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 14052.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 18260.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 14006.0;
                }
                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 18089.0;
                }
                else
                {
                  v10 = +[PLModelingUtilities isiPad](PLModelingUtilities, "isiPad", 0, 0, 0, 0, 0, 0, 0);
                  result = 7000.0;
                  if (v10)
                    return 19120.0;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

+ (BOOL)internalBuild
{
  if (internalBuild_onceToken != -1)
    dispatch_once(&internalBuild_onceToken, &__block_literal_global_146);
  return internalBuild_result;
}

uint64_t __36__PLModelingUtilities_internalBuild__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  internalBuild_result = result;
  return result;
}

+ (BOOL)carrierBuild
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PLModelingUtilities_carrierBuild__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (carrierBuild_onceToken != -1)
    dispatch_once(&carrierBuild_onceToken, block);
  return carrierBuild_carrierBuild;
}

void __35__PLModelingUtilities_carrierBuild__block_invoke(uint64_t a1)
{
  const __CFBoolean *v1;

  if (objc_msgSend(*(id *)(a1 + 32), "internalBuild"))
  {
    carrierBuild_carrierBuild = 0;
  }
  else
  {
    v1 = (const __CFBoolean *)MGCopyAnswer();
    carrierBuild_carrierBuild = CFBooleanGetValue(v1) != 0;
    CFRelease(v1);
  }
}

+ (double)getDefaultL0bThresholdForDeviceType
{
  double result;
  int v3;

  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 110.4;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 132.25;
  v3 = MGIsDeviceOneOfType();
  result = 115.0;
  if (v3)
    return 155.25;
  return result;
}

+ (BOOL)alsCurveHigherThanDefault
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  BOOL v9;

  +[PLModelingUtilities getDefaultL0bThresholdForDeviceType](PLModelingUtilities, "getDefaultL0bThresholdForDeviceType");
  v3 = v2;
  v4 = (void *)CFPreferencesCopyValue(CFSTR("BKALSUserPreferences"), CFSTR("com.apple.backboardd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("L0b"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      v9 = v8 > v3;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (double)networkingEnergyWithBytes:(int)a3 withDuration:(double)a4
{
  return 0.0;
}

+ (BOOL)isPercentageSupported
{
  return 1;
}

+ (BOOL)isLowPowerModeSupported
{
  if (isLowPowerModeSupported_onceToken != -1)
    dispatch_once(&isLowPowerModeSupported_onceToken, &__block_literal_global_180);
  return isLowPowerModeSupported__retValue;
}

void __46__PLModelingUtilities_isLowPowerModeSupported__block_invoke()
{
  const __CFString *v0;
  const __CFString *v1;
  BOOL v2;

  v0 = (const __CFString *)MGCopyAnswer();
  v1 = v0;
  if (!v0)
    isLowPowerModeSupported__retValue = 0;
  isLowPowerModeSupported__retValue = CFStringCompare(v0, CFSTR("iPhone"), 0) == kCFCompareEqualTo;
  if (_os_feature_enabled_impl())
  {
    v2 = +[PLModelingUtilities isiPad](PLModelingUtilities, "isiPad")
      || +[PLModelingUtilities isiPod](PLModelingUtilities, "isiPod");
    isLowPowerModeSupported__retValue |= v2;
  }
  CFRelease(v1);
}

+ (BOOL)isNarrowScreen
{
  if (isNarrowScreen_onceToken != -1)
    dispatch_once(&isNarrowScreen_onceToken, &__block_literal_global_185);
  return isNarrowScreen__retValue;
}

uint64_t __37__PLModelingUtilities_isNarrowScreen__block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  if ((_DWORD)result)
    isNarrowScreen__retValue = 1;
  return result;
}

+ (BOOL)isHeySiriAlwaysOn
{
  if (isHeySiriAlwaysOn_onceToken != -1)
    dispatch_once(&isHeySiriAlwaysOn_onceToken, &__block_literal_global_194);
  return isHeySiriAlwaysOn__retValue;
}

uint64_t __40__PLModelingUtilities_isHeySiriAlwaysOn__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isHeySiriAlwaysOn__retValue = result;
  return result;
}

+ (BOOL)hasAOD
{
  if (hasAOD_onceToken != -1)
    dispatch_once(&hasAOD_onceToken, &__block_literal_global_197);
  return hasAOD_result;
}

uint64_t __29__PLModelingUtilities_hasAOD__block_invoke()
{
  uint64_t result;

  result = +[PLModelingUtilities isiPhone](PLModelingUtilities, "isiPhone");
  if ((_DWORD)result)
    result = MGGetBoolAnswer();
  hasAOD_result = result;
  return result;
}

+ (BOOL)supportsSlowCharging
{
  char v2;

  v2 = _os_feature_enabled_impl();
  return v2 & +[PLModelingUtilities isiPhone](PLModelingUtilities, "isiPhone");
}

@end
