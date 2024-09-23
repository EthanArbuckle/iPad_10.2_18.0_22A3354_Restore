@implementation CALayer(PKCAUtilities)

- (double)pkui_animateToOpacity:()PKCAUtilities withCompletion:
{
  void (**v6)(id, uint64_t);
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = fmax(fmin(a2, 1.0), 0.0);
  objc_msgSend(a1, "opacity");
  v9 = *(float *)&v8;
  if (v7 == *(float *)&v8)
  {
    if (v6)
      v6[2](v6, 1);
  }
  else
  {
    *(float *)&v8 = v7;
    objc_msgSend(a1, "setOpacity:", v8);
    +[PKSpringAnimationFactory springAnimationWithKeyPath:](PKSpringAnimationFactory, "springAnimationWithKeyPath:", CFSTR("opacity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v9, v7);
    if (v6)
      objc_msgSend(v10, "pkui_setCompletionHandler:", v6);
    v11 = (id)objc_msgSend(a1, "pkui_addAdditiveAnimation:", v10);

  }
  return v9;
}

- (id)pkui_addAdditiveAnimation:()PKCAUtilities withKeyPath:
{
  id v6;
  void *v7;

  if (a3)
  {
    v6 = a3;
    v7 = (void *)objc_msgSend(a1, "_pkui_createNextAdditiveAnimationKeyWithKeyPath:", a4);
    objc_msgSend(a1, "addAnimation:forKey:", v6, v7);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (uint64_t)_pkui_createNextAdditiveAnimationKeyWithKeyPath:()PKCAUtilities
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_getAssociatedObject(a1, &AdditiveAnimationKeyPrefix);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "animationKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v7);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "hasPrefix:", CFSTR("com.apple.Passbook.additive")) & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v6 = 0;
  }

  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(a1, "pkui_additiveAnimationKeyPrefixForKeyPath:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "initWithFormat:", CFSTR("%@.%lu"), v13, v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6 + 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &AdditiveAnimationKeyPrefix, v15, (void *)0x303);

  return v14;
}

- (__CFString)pkui_additiveAnimationKeyPrefixForKeyPath:()PKCAUtilities
{
  id v3;
  __CFString *v4;

  v3 = a3;
  v4 = CFSTR("com.apple.Passbook.additive");
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Passbook.additive"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (uint64_t)pkui_addAdditiveAnimation:()PKCAUtilities
{
  return objc_msgSend(a1, "pkui_addAdditiveAnimation:withKeyPath:", a3, 0);
}

- (double)pkui_elapsedDurationForAnimationWithKey:()PKCAUtilities
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "animationForKey:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pkui_elapsedDurationForAnimation:", v2);
  v4 = v3;

  return v4;
}

- (double)pkui_elapsedDurationForAnimation:()PKCAUtilities
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (!a3)
    return 0.0;
  v4 = a3;
  objc_msgSend(a1, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v6 = v5;
  objc_msgSend(v4, "beginTime");
  v8 = v7;

  return v6 - v8;
}

- (double)pkui_remainingDurationForAnimationWithKey:()PKCAUtilities
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "animationForKey:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pkui_remainingDurationForAnimation:", v2);
  v4 = v3;

  return v4;
}

- (double)pkui_remainingDurationForAnimation:()PKCAUtilities
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (!a3)
    return 0.0;
  v4 = a3;
  objc_msgSend(v4, "duration");
  v6 = v5;
  objc_msgSend(a1, "pkui_elapsedDurationForAnimation:", v4);
  v8 = v7;

  return v6 - v8;
}

- (uint64_t)pkui_hasAdditiveAnimationForKeyPath:()PKCAUtilities
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "pkui_additiveAnimationKeyPrefixForKeyPath:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(a1, "animationKeys", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "hasPrefix:", v2) & 1) != 0)
          {
            v4 = 1;
            goto LABEL_12;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
