@implementation CAAnimationGroup(TSDCAAnimationAdditions)

- (uint64_t)TSD_containsAnimationForKeyPath:()TSDCAAnimationAdditions
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_msgSend(a1, "animations", 0);
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v10;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "TSD_containsAnimationForKeyPath:", a3) & 1) != 0)
          return 1;
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (uint64_t)p_getValue:()TSDCAAnimationAdditions animation:animationPercent:forKeyPath:atTime:animationCache:
{
  double v15;
  uint64_t v16;
  void *v17;
  uint64_t result;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v29;
  uint64_t v30;
  uint64_t *v31;
  _QWORD *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "timingFunction"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    if (v15 > *(double *)&p_getValue_animation_animationPercent_forKeyPath_atTime_animationCache__s_lastTimingFunctionAssertTimeInterval
             + 1.0)
      p_getValue_animation_animationPercent_forKeyPath_atTime_animationCache__s_lastTimingFunctionAssertTimeInterval = *(_QWORD *)&v15;
  }
  v32 = a6;
  v16 = objc_msgSend((id)objc_msgSend(a8, "initialValues", a4), "objectForKey:", a7);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = (void *)objc_msgSend(a1, "animations");
  result = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (result)
  {
    v19 = result;
    v20 = 0;
    v21 = *(_QWORD *)v34;
    v22 = 1.79769313e308;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v17);
        v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v23);
        if (objc_msgSend((id)objc_msgSend(v24, "keyPath"), "isEqualToString:", a7))
        {
          objc_msgSend(v24, "TSD_animationPercentFromAnimationTime:", a2);
          v26 = v25;
          v27 = 0.0;
          if (v26 < 0.0 || v26 > 1.0)
          {
            objc_msgSend(a1, "duration", 0.0);
            if (v26 >= 0.0)
              v27 = (v26 + -1.0) * v29;
            else
              v27 = -(v26 * v29);
          }
          if (v27 < v22)
          {
            v22 = v27;
            v20 = v24;
          }
        }
        ++v23;
      }
      while (v19 != v23);
      result = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v19 = result;
    }
    while (result);
  }
  else
  {
    v20 = 0;
  }
  if (a5)
    *a5 = v20;
  if (v31)
  {
    if (v20)
    {
      result = objc_msgSend(v20, "TSD_valueAtTime:initialValue:", v16, a2);
      v16 = result;
    }
    *v31 = v16;
  }
  if (v32)
  {
    result = objc_msgSend(v20, "TSD_animationPercentByApplyingTimingFunctionForKeyPath:atTime:", a7, a2);
    *v32 = v30;
  }
  return result;
}

- (uint64_t)TSD_valueForKeyPath:()TSDCAAnimationAdditions atTime:animationCache:
{
  uint64_t v5;

  v5 = 0;
  objc_msgSend(a1, "p_getValue:animation:animationPercent:forKeyPath:atTime:animationCache:", &v5, 0, 0, a3, a4);
  return v5;
}

- (uint64_t)TSD_animationForKeyPath:()TSDCAAnimationAdditions atTime:
{
  uint64_t v4;

  v4 = 0;
  objc_msgSend(a1, "p_getValue:animation:animationPercent:forKeyPath:atTime:animationCache:", 0, &v4, 0, a3, 0);
  return v4;
}

- (double)TSD_animationPercentByApplyingTimingFunctionForKeyPath:()TSDCAAnimationAdditions atTime:
{
  double v4;

  v4 = 0.0;
  objc_msgSend(a1, "p_getValue:animation:animationPercent:forKeyPath:atTime:animationCache:", 0, 0, &v4, a3, 0);
  return v4;
}

@end
