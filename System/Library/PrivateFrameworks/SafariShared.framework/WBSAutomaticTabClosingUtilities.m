@implementation WBSAutomaticTabClosingUtilities

+ (BOOL)shouldCloseTabsAutomaticallyWhenEnteringForeground
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v2 = objc_msgSend(a1, "automaticTabClosingInterval");
  v3 = v2;
  if (v2 < 5 && ((0x1Du >> v2) & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleForKey:", CFSTR("mostDistantLastViewedTime"));
  v6 = v5;

  if (v6 <= 0.0)
    return 0;
  WBSAutomaticTabClosingIntervalTimeInterval(v3);
  v8 = v6 + v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return v9 >= v8;
}

+ (unint64_t)automaticTabClosingInterval
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("CloseTabsAutomatically"));

  return v3;
}

+ (BOOL)userHasPreferenceForAutomaticTabClosingInterval
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CloseTabsAutomatically"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (void)setAutomaticTabClosingInterval:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("CloseTabsAutomatically"));

}

+ (void)resetAutomaticTabClosingIntervalPreference
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("CloseTabsAutomatically"));

}

+ (void)setMostDistantLastViewedTime:(double)a3
{
  double v4;
  double v5;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatForKey:", CFSTR("mostDistantLastViewedTime"));
  v5 = *(float *)&v4;
  if (*(float *)&v4 <= 0.0 || v5 > a3)
  {
    *(float *)&v4 = a3;
    objc_msgSend(v7, "setFloat:forKey:", CFSTR("mostDistantLastViewedTime"), v4, v5);
  }

}

+ (void)clearMostDistantLastViewedTime
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("mostDistantLastViewedTime"));

}

@end
