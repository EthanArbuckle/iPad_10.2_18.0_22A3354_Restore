@implementation RMFeatureOverrides

+ (id)defaultOverrideForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a3;
  +[RMLocations defaultsOverrideFileURLCreateIfNeeded:](RMLocations, "defaultsOverrideFileURLCreateIfNeeded:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithContentsOfURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)dictionaryForDefaultsKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (+[RMFeatureFlags isAppleInternal](RMFeatureFlags, "isAppleInternal"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(a1, "defaultOverrideForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)arrayForDefaultsKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (+[RMFeatureFlags isAppleInternal](RMFeatureFlags, "isAppleInternal"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(a1, "defaultOverrideForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)stringForDefaultsKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (+[RMFeatureFlags isAppleInternal](RMFeatureFlags, "isAppleInternal"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(a1, "defaultOverrideForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)BOOLForDefaultsKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (+[RMFeatureFlags isAppleInternal](RMFeatureFlags, "isAppleInternal")
    && ((objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v5, "objectForKey:", v4),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v5,
         v6)
     || (objc_msgSend(a1, "defaultOverrideForKey:", v4), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)numberForDefaultsKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (+[RMFeatureFlags isAppleInternal](RMFeatureFlags, "isAppleInternal"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (int64_t)batteryHealthServiceStateWithDefaultValue:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "numberForDefaultsKey:", CFSTR("RMBatteryServiceState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    a3 = objc_msgSend(v4, "integerValue");

  return a3;
}

+ (NSURL)bootstrapURL
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("RMBootstrapURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

+ (NSArray)hiddenDeclarationTypes
{
  return (NSArray *)objc_msgSend(a1, "arrayForDefaultsKey:", CFSTR("RMHiddenDeclarationTypes"));
}

+ (id)internalStatusForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "dictionaryForDefaultsKey:", CFSTR("RMInternalStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = v6;
  v11 = v10;

  return v11;
}

+ (BOOL)internalStatusForKey:(id)a3 defaultBool:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a1, "dictionaryForDefaultsKey:", CFSTR("RMInternalStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = objc_msgSend(v9, "BOOLValue");

  }
  return a4;
}

+ (BOOL)permissiveURLSchemes
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("RMPermissiveURLSchemes"));
}

+ (BOOL)qaMode
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("RMQAMode"));
}

+ (BOOL)testBooleanValue
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("RMTestBooleanValue"));
}

+ (BOOL)useHTTPLogging
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("RMUseHTTPLogging"));
}

@end
