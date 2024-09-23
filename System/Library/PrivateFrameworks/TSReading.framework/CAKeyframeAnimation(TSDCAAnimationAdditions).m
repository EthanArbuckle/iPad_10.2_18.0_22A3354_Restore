@implementation CAKeyframeAnimation(TSDCAAnimationAdditions)

- (void)p_getValue:()TSDCAAnimationAdditions animationPercent:atTime:initialValue:
{
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *result;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "TSD_animationPercentFromAnimationTime:");
  v10 = v9;
  if (v9 < 0.0)
  {
    v11 = (void *)objc_msgSend(a1, "fillMode");
    if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDE5968]) & 1) == 0)
    {
      v12 = (void *)objc_msgSend(a1, "fillMode");
      result = (void *)objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5970]);
      if (!(_DWORD)result)
        goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (v9 == 0.0
    || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "keyTimes"), "objectAtIndex:", 0), "doubleValue"), v10 < v14))
  {
LABEL_7:
    result = (void *)objc_msgSend((id)objc_msgSend(a1, "values"), "objectAtIndex:", 0);
LABEL_8:
    a5 = result;
    goto LABEL_9;
  }
  if (v10 == 1.0)
  {
LABEL_15:
    result = (void *)objc_msgSend((id)objc_msgSend(a1, "values"), "lastObject");
    goto LABEL_8;
  }
  if (v10 > 1.0
    || v10 < 1.0
    && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "keyTimes"), "lastObject"), "doubleValue"), v10 > v15))
  {
    v16 = (void *)objc_msgSend(a1, "fillMode");
    if ((objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDE5978]) & 1) == 0)
    {
      v17 = (void *)objc_msgSend(a1, "fillMode");
      result = (void *)objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDE5970]);
      if (!(_DWORD)result)
      {
LABEL_9:
        if (!a3)
          goto LABEL_11;
        goto LABEL_10;
      }
    }
    goto LABEL_15;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = (void *)objc_msgSend(a1, "keyTimes", 0);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v23, "doubleValue");
        if (v10 < v24)
        {
          v25 = objc_msgSend((id)objc_msgSend(a1, "keyTimes"), "indexOfObject:", v23) - 1;
          goto LABEL_32;
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v20)
        continue;
      break;
    }
  }
  v25 = 0;
LABEL_32:
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "keyTimes"), "objectAtIndex:", v25), "doubleValue");
  v27 = v26;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "keyTimes"), "objectAtIndex:", v25 + 1), "doubleValue");
  v29 = v28;
  v30 = objc_msgSend((id)objc_msgSend(a1, "values"), "objectAtIndex:", v25);
  v31 = objc_msgSend((id)objc_msgSend(a1, "values"), "objectAtIndex:", v25 + 1);
  result = (void *)objc_msgSend((id)objc_msgSend(a1, "timingFunctions"), "objectAtIndex:", v25);
  v10 = (v10 - v27) / (v29 - v27);
  if (result)
  {
    result = (void *)objc_msgSend(result, "TSD_valueAtPercent:", v10);
    v10 = v32;
  }
  if (a3)
  {
    v33 = objc_msgSend(a1, "p_interpolatedValueFrom:to:percent:", v30, v31, v10);
    if (v33)
    {
      a5 = (void *)v33;
    }
    else
    {
      v34 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v35 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CAKeyframeAnimation(TSDCAAnimationAdditions) p_getValue:animationPercent:atTime:initialValue:]");
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 444, CFSTR("result is nil!"));
      a5 = 0;
    }
LABEL_10:
    result = (void *)objc_msgSend(a1, "p_adjustedResultWithValue:", a5);
    *a3 = result;
  }
LABEL_11:
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
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "p_getValue:animationPercent:atTime:initialValue:", 0, &v2, 0);
  return v2;
}

@end
