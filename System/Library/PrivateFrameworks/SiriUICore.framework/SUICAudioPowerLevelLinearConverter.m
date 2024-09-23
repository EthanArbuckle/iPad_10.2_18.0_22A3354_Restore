@implementation SUICAudioPowerLevelLinearConverter

+ (float)_linearValueForPowerLevel:(float)a3 shouldAdjustForDeviceType:(BOOL)a4 isInput:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  double v8;

  v5 = a5;
  v6 = a4;
  *(float *)&v8 = __exp10f(a3 / 20.0);
  if (v6)
    objc_msgSend(a1, "_adjustedLinearPowerLevel:isInput:", v5, v8);
  if (*(float *)&v8 > 1.0)
    *(float *)&v8 = 1.0;
  return fmaxf(*(float *)&v8, 0.0);
}

+ (float)linearValueForInputPowerLevel:(float)a3
{
  float result;

  objc_msgSend(a1, "_linearValueForPowerLevel:shouldAdjustForDeviceType:isInput:", 1, 1);
  return result;
}

+ (float)linearValueForOutputPowerLevel:(float)a3
{
  float result;

  objc_msgSend(a1, "_linearValueForPowerLevel:shouldAdjustForDeviceType:isInput:", 1, 0);
  return result;
}

+ (float)_adjustedLinearPowerLevel:(float)a3 isInput:(BOOL)a4
{
  float v5;

  if (a4)
    objc_msgSend(a1, "_expectedLinearInputPowerLevelMaximum");
  else
    v5 = 0.0316;
  return a3 / v5;
}

+ (float)_expectedLinearInputPowerLevelMaximum
{
  void *v2;
  _BOOL4 v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return flt_1A377E228[v3];
}

@end
