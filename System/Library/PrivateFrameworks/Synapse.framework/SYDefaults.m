@implementation SYDefaults

+ (BOOL)shouldDisableQuickNoteTemporarily
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Synapse"));
  objc_msgSend(v2, "objectForKey:", CFSTR("shouldDisableTemporarily"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    LOBYTE(v3) = objc_msgSend(v2, "BOOLForKey:", CFSTR("shouldDisableTemporarily"));

  return (char)v3;
}

+ (int64_t)indicatorCoverage
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Synapse"));
  objc_msgSend(v2, "objectForKey:", CFSTR("indicatorCoverage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v2, "integerForKey:", CFSTR("indicatorCoverage"));
  else
    v4 = 1;

  return v4;
}

+ (void)setIndicatorCoverage:(int64_t)a3
{
  id v4;

  if ((unint64_t)a3 <= 2)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Synapse"));
    objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("indicatorCoverage"));

  }
}

@end
