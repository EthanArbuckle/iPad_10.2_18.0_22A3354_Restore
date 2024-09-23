@implementation SIUserDefaults

+ (id)defaultValues
{
  if (defaultValues_onceToken != -1)
    dispatch_once(&defaultValues_onceToken, &__block_literal_global_12);
  return (id)defaultValues_defaultValues;
}

void __31__SIUserDefaults_defaultValues__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("com.apple.sceneintelligence.useCacheForUserDefaults");
  v2[1] = CFSTR("com.apple.sceneintelligence.test.default");
  v3[0] = MEMORY[0x24BDBD1C8];
  v3[1] = CFSTR("test");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultValues_defaultValues;
  defaultValues_defaultValues = v0;

}

+ (id)userDefaultsCache
{
  if (userDefaultsCache_onceToken != -1)
    dispatch_once(&userDefaultsCache_onceToken, &__block_literal_global_16);
  return (id)userDefaultsCache_defaultsCache;
}

void __35__SIUserDefaults_userDefaultsCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)userDefaultsCache_defaultsCache;
  userDefaultsCache_defaultsCache = v0;

}

+ (BOOL)shouldUseCache
{
  if (shouldUseCache_onceToken != -1)
    dispatch_once(&shouldUseCache_onceToken, &__block_literal_global_17);
  return objc_msgSend((id)shouldUseCache_shouldUseCache, "BOOLValue");
}

void __32__SIUserDefaults_shouldUseCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SIUserDefaults objectForKeySlow:](SIUserDefaults, "objectForKeySlow:", CFSTR("com.apple.sceneintelligence.useCacheForUserDefaults"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shouldUseCache_shouldUseCache;
  shouldUseCache_shouldUseCache = v0;

}

+ (id)cachedObjectForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[SIUserDefaults userDefaultsCache](SIUserDefaults, "userDefaultsCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&gDefaultsCacheLock);
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&gDefaultsCacheLock);
  return v5;
}

+ (void)removeCachedObjectForKey:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SIUserDefaults userDefaultsCache](SIUserDefaults, "userDefaultsCache");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&gDefaultsCacheLock);
  objc_msgSend(v4, "removeObjectForKey:", v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&gDefaultsCacheLock);
}

+ (void)cacheObject:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  +[SIUserDefaults userDefaultsCache](SIUserDefaults, "userDefaultsCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&gDefaultsCacheLock);
  if (v8)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v5);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&gDefaultsCacheLock);

}

+ (void)clearUserDefaultsCache
{
  id v2;

  +[SIUserDefaults userDefaultsCache](SIUserDefaults, "userDefaultsCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&gDefaultsCacheLock);
  objc_msgSend(v2, "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)&gDefaultsCacheLock);

}

+ (void)removeAllKeys
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  objc_msgSend(MEMORY[0x24BDBCF50], "appleGlobalDomainSIKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x24BDBCF50], "appleGlobalDomain");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectForKey:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

+ (void)removeObjectForKey:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SIUserDefaults removeCachedObjectForKey:](SIUserDefaults, "removeCachedObjectForKey:", v3);
  objc_msgSend(MEMORY[0x24BDBCF50], "appleGlobalDomain");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v3);

}

+ (id)objectForKeySlow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "appleGlobalDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(a1, "defaultValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)objectForKey:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "shouldUseCache")
    && (+[SIUserDefaults cachedObjectForKey:](SIUserDefaults, "cachedObjectForKey:", v3),
        (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (id)v4;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      v7 = 0;
    }
    else
    {
      v5 = v5;
      v7 = v5;
    }
  }
  else
  {
    +[SIUserDefaults objectForKeySlow:](SIUserDefaults, "objectForKeySlow:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SIUserDefaults cacheObject:forKey:](SIUserDefaults, "cacheObject:forKey:", v7, v3);
    v5 = 0;
  }

  return v7;
}

+ (id)objectForKey:(id)a3 useCache:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_opt_class();
  if (v4)
    objc_msgSend(v6, "objectForKey:", v5);
  else
    objc_msgSend(v6, "objectForKeySlow:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)valueForKey:(id)a3
{
  return +[SIUserDefaults objectForKey:](SIUserDefaults, "objectForKey:", a3);
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[SIUserDefaults removeCachedObjectForKey:](SIUserDefaults, "removeCachedObjectForKey:", v5);
  objc_msgSend(MEMORY[0x24BDBCF50], "appleGlobalDomain");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v5);

}

+ (void)setValue:(id)a3 forKey:(id)a4
{
  +[SIUserDefaults setObject:forKey:](SIUserDefaults, "setObject:forKey:", a3, a4);
}

+ (BOOL)BOOLForKey:(id)a3
{
  void *v3;
  char v4;

  +[SIUserDefaults objectForKey:](SIUserDefaults, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)BOOLForKey:(id)a3 useCache:(BOOL)a4
{
  void *v4;
  char v5;

  +[SIUserDefaults objectForKey:useCache:](SIUserDefaults, "objectForKey:useCache:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a4;
  objc_msgSend(v5, "numberWithBool:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[SIUserDefaults setObject:forKey:](SIUserDefaults, "setObject:forKey:", v7, v6);

}

+ (id)stringForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  +[SIUserDefaults objectForKey:](SIUserDefaults, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "stringValue");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
LABEL_7:

  return v5;
}

+ (id)numberForKey:(id)a3
{
  void *v3;
  void *v4;

  +[SIUserDefaults objectForKey:](SIUserDefaults, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIUserDefaults _numberForObject:](SIUserDefaults, "_numberForObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)numberForKey:(id)a3 useCache:(BOOL)a4
{
  void *v4;
  void *v5;

  +[SIUserDefaults objectForKey:useCache:](SIUserDefaults, "objectForKey:useCache:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIUserDefaults _numberForObject:](SIUserDefaults, "_numberForObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_numberForObject:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)MEMORY[0x24BDD1690];
      v6 = v3;
      objc_msgSend(v5, "decimalDigitCharacterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addCharactersInString:", CFSTR("-."));
      objc_msgSend(v7, "invertedSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_alloc_init(MEMORY[0x24BDD16F0]);
      objc_msgSend(v11, "setDecimalSeparator:", CFSTR("."));
      objc_msgSend(v11, "setNumberStyle:", 1);
      objc_msgSend(v11, "numberFromString:", v10);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

+ (int64_t)integerForKey:(id)a3
{
  void *v3;
  int64_t v4;

  +[SIUserDefaults numberForKey:](SIUserDefaults, "numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

+ (int64_t)integerForKey:(id)a3 useCache:(BOOL)a4
{
  void *v4;
  int64_t v5;

  +[SIUserDefaults numberForKey:useCache:](SIUserDefaults, "numberForKey:useCache:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

+ (float)floatForKey:(id)a3
{
  void *v3;
  float v4;
  float v5;

  +[SIUserDefaults numberForKey:](SIUserDefaults, "numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

+ (float)floatForKey:(id)a3 useCache:(BOOL)a4
{
  void *v4;
  float v5;
  float v6;

  +[SIUserDefaults numberForKey:useCache:](SIUserDefaults, "numberForKey:useCache:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

+ (double)doubleForKey:(id)a3
{
  void *v3;
  double v4;
  double v5;

  +[SIUserDefaults numberForKey:](SIUserDefaults, "numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

+ (double)doubleForKey:(id)a3 useCache:(BOOL)a4
{
  void *v4;
  double v5;
  double v6;

  +[SIUserDefaults numberForKey:useCache:](SIUserDefaults, "numberForKey:useCache:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

+ (id)listForKey:(id)a3
{
  void *v3;
  void *v4;

  +[SIUserDefaults objectForKey:](SIUserDefaults, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v4;
}

+ (id)resolutionDictionaryForKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  +[SIUserDefaults objectForKey:](SIUserDefaults, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("x"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") != 2)
    {
      v11 = 0;
      goto LABEL_8;
    }
    v18[0] = CFSTR("width");
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    objc_msgSend(v5, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = CFSTR("height");
    v19[0] = v7;
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    objc_msgSend(v8, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0;
      goto LABEL_10;
    }
    v16[0] = CFSTR("width");
    v12 = (void *)MEMORY[0x24BDD16E0];
    v13 = v3;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("width"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    objc_msgSend(v12, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = CFSTR("height");
    v17[0] = v6;
    v14 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v13, "objectForKeyedSubscript:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "floatValue");
    objc_msgSend(v14, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
LABEL_10:

  return v11;
}

+ (void)synchronize
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "appleGlobalDomain");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronize");

}

@end
