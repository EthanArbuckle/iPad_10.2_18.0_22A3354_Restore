@implementation TRICKServerEnvironmentReader

+ (int64_t)validatedEnvironmentFromNumber:(id)a3
{
  int64_t result;

  LODWORD(result) = objc_msgSend(a3, "unsignedIntValue");
  if (result >= 6)
    return 0;
  else
    return result;
}

+ (int64_t)currentEnvironment
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("com.apple.triald.ck.serverEnvironment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = objc_msgSend(a1, "validatedEnvironmentFromNumber:", v4);
  else
    v5 = 0;

  return v5;
}

+ (int)validatedPopulationFromNumber:(int64_t)a3
{
  if (a3 >= 6)
    return 0;
  else
    return a3;
}

+ (int)currentPopulation
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  uint8_t v8[16];

  TRILogCategory_ClientFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19B89C000, v3, OS_LOG_TYPE_DEFAULT, "Reading currentPopulation from NSUserDefaults", v8, 2u);
  }

  if (+[TRIProcessInfo hostingProcessIsTriald](TRIProcessInfo, "hostingProcessIsTriald"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.triald"));
  }
  v5 = v4;
  v6 = objc_msgSend(a1, "validatedPopulationFromNumber:", objc_msgSend(v4, "integerForKey:", CFSTR("com.apple.triald.population.override")));

  return v6;
}

@end
