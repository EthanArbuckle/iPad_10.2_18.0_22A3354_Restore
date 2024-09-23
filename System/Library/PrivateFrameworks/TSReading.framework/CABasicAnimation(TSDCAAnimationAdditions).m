@implementation CABasicAnimation(TSDCAAnimationAdditions)

- (uint64_t)p_getValue:()TSDCAAnimationAdditions animationPercent:atTime:initialValue:
{
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t result;
  double v14;
  void *v15;
  void *v16;

  objc_msgSend(a1, "TSD_animationPercentFromAnimationTime:");
  v10 = v9;
  if (v9 < 0.0)
  {
    v11 = (void *)objc_msgSend(a1, "fillMode");
    if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDE5968]) & 1) == 0)
    {
      v12 = (void *)objc_msgSend(a1, "fillMode");
      result = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5970]);
      if (!(_DWORD)result)
        goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v9 == 0.0)
  {
LABEL_6:
    result = objc_msgSend(a1, "fromValue");
LABEL_7:
    a5 = result;
    goto LABEL_8;
  }
  if (v9 == 1.0 && (objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", CFSTR("hidden")) & 1) == 0)
  {
LABEL_22:
    result = objc_msgSend(a1, "toValue");
    goto LABEL_7;
  }
  if (v10 >= 1.0)
  {
    v15 = (void *)objc_msgSend(a1, "fillMode");
    if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDE5978]) & 1) == 0)
    {
      v16 = (void *)objc_msgSend(a1, "fillMode");
      result = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDE5970]);
      if (!(_DWORD)result)
      {
LABEL_8:
        if (!a3)
          goto LABEL_10;
        goto LABEL_9;
      }
    }
    goto LABEL_22;
  }
  result = objc_msgSend(a1, "timingFunction");
  if (result)
  {
    result = objc_msgSend((id)objc_msgSend(a1, "timingFunction"), "TSD_valueAtPercent:", v10);
    v10 = v14;
  }
  if (a3)
  {
    a5 = objc_msgSend(a1, "p_interpolatedValueFrom:to:percent:", objc_msgSend(a1, "fromValue"), objc_msgSend(a1, "toValue"), v10);
LABEL_9:
    result = objc_msgSend(a1, "p_adjustedResultWithValue:", a5);
    *a3 = result;
  }
LABEL_10:
  if (a4)
    *a4 = v10;
  return result;
}

- (uint64_t)TSD_valueAtTime:()TSDCAAnimationAdditions initialValue:
{
  uint64_t v4;

  v4 = 0;
  objc_msgSend(a1, "p_getValue:animationPercent:atTime:initialValue:", &v4, 0, a3);
  return v4;
}

- (double)TSD_animationPercentByApplyingTimingFunctionForKeyPath:()TSDCAAnimationAdditions atTime:
{
  void *v7;
  uint64_t v8;
  double v10;

  if ((objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", a4) & 1) == 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CABasicAnimation(TSDCAAnimationAdditions) TSD_animationPercentByApplyingTimingFunctionForKeyPath:atTime:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 360, CFSTR("Wrong keyPath! (Expected %@, was asked for %@)"), objc_msgSend(a1, "keyPath"), a4);
  }
  v10 = 0.0;
  objc_msgSend(a1, "p_getValue:animationPercent:atTime:initialValue:", 0, &v10, 0, a2);
  return v10;
}

@end
