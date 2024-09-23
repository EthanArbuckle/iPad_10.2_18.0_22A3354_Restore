@implementation ACMBaseLocale

+ (void)initialize
{
  objc_class *v2;
  NSString *v3;
  NSString *v4;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___ACMBaseLocale;
  objc_msgSendSuper2(&v10, sel_initialize);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  if (-[NSString hasPrefix:](v3, "hasPrefix:", CFSTR("ACMLocale_")))
  {
    v4 = -[NSString stringByReplacingOccurrencesOfString:withString:](v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ACMLocale_"), &stru_24FCE58F0);
    v5 = -[NSString componentsSeparatedByString:](v4, "componentsSeparatedByString:", CFSTR("_"));
    if (-[NSArray count](v5, "count") >= 3)
      v4 = -[NSString stringByAppendingString:](-[NSArray componentsJoinedByString:](-[NSArray subarrayWithRange:](v5, "subarrayWithRange:", 0, -[NSArray count](v5, "count") - 1), "componentsJoinedByString:", CFSTR("-")), "stringByAppendingString:", -[NSArray lastObject](v5, "lastObject"));
    if (!s_Locales)
      s_Locales = objc_opt_new();
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v4);
    v7 = *MEMORY[0x24BDBCB18];
    v8 = (void *)objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCB18]);
    if (objc_msgSend((id)s_Locales, "objectForKeyedSubscript:", v8))
    {
      if (ACFLog)
      {
        if ((ACFLogSettingsGetLevelMask() & 8) != 0)
          ACFLog(3, (uint64_t)"+[ACMBaseLocale initialize]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMBaseLocale.m", 49, 0, "Duplicate: %@ : %@", v4, objc_msgSend(v6, "objectForKey:", v7));
      }
    }
    else
    {
      v9 = objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
      objc_msgSend((id)s_Locales, "setObject:forKeyedSubscript:", objc_opt_class(), v9);
    }
  }
}

+ (id)createLocaleForIdentifier:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  return (id)objc_msgSend((id)objc_msgSend((id)s_Locales, "objectForKeyedSubscript:", v3), "new");
}

+ (void)setupRecoveringPreferredLanguages
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  id v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString **v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  char v23;
  char v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  const __CFString *v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "preferredLocalizations");
  v31 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v2;
  v30 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v30)
  {
    v3 = 0;
    v27 = *MEMORY[0x24BDBCB40];
    v28 = *(_QWORD *)v33;
    v4 = *MEMORY[0x24BDBCB20];
    v5 = *MEMORY[0x24BDBCAE8];
    v6 = 0x24BDBC000uLL;
    v26 = *MEMORY[0x24BDBCAE8];
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v33 != v28)
          objc_enumerationMutation(obj);
        v8 = (id)objc_msgSend(objc_alloc(*(Class *)(v6 + 3744)), "initWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
        v9 = objc_msgSend(v8, "objectForKey:", v27);
        v10 = (__CFString *)objc_msgSend(v8, "objectForKey:", v4);
        if (v9)
          v10 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v10, v9, 0);
        if (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("zh")))
          v11 = CFSTR("zh-Hant");
        else
          v11 = v10;
        v12 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v6 + 3744), "currentLocale"), "objectForKey:", v5);
        if (objc_msgSend(v12, "length"))
        {
          v38[0] = v5;
          v38[1] = v4;
          v39[0] = v12;
          v39[1] = v11;
          v13 = (void *)MEMORY[0x24BDBCE70];
          v14 = (const __CFString **)v39;
          v15 = v38;
          v16 = 2;
        }
        else
        {
          v36 = v4;
          v37 = v11;
          v13 = (void *)MEMORY[0x24BDBCE70];
          v14 = &v37;
          v15 = &v36;
          v16 = 1;
        }
        v17 = v6;
        v18 = objc_msgSend(*(id *)(v6 + 3744), "localeIdentifierFromComponents:", objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, v16));
        v19 = (void *)objc_msgSend(a1, "createLocaleForIdentifier:", v18);
        v20 = objc_msgSend(a1, "createLocaleForIdentifier:", v11);
        v21 = (void *)v20;
        if (!v19)
        {
          if (!v20)
          {
            v6 = v17;
            continue;
          }
          v24 = objc_msgSend(v31, "containsObject:", v11);
LABEL_22:
          v6 = v17;
          if ((v24 & 1) != 0)
            goto LABEL_23;
          goto LABEL_25;
        }
        v22 = objc_msgSend(v31, "containsObject:", v18);
        v23 = v22;
        if (!v21)
        {
          v11 = (const __CFString *)v18;
          v21 = v19;
          v6 = v17;
          if ((v22 & 1) != 0)
          {
LABEL_23:
            v5 = v26;
            continue;
          }
          goto LABEL_25;
        }
        v24 = objc_msgSend(v31, "containsObject:", v11);
        if ((v23 & 1) != 0)
          goto LABEL_22;
        if ((v24 & 1) == 0)
        {
          objc_msgSend(v19, "setNextLocale:", v21);
          objc_msgSend(v31, "addObject:", v11);
        }
        v11 = (const __CFString *)v18;
        v21 = v19;
        v6 = v17;
LABEL_25:
        objc_msgSend(v31, "addObject:", v11);
        if (v3)
          objc_msgSend(v3, "setNextLocale:", v21);
        v3 = v21;
        if (objc_msgSend(v21, "nextLocale"))
        {
          v3 = v21;
          do
            v3 = (void *)objc_msgSend(v3, "nextLocale");
          while (objc_msgSend(v3, "nextLocale"));
        }
        v5 = v26;
        if (!s_sharedInstance)
          s_sharedInstance = v21;
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v30);
  }
}

+ (void)setupUsingPreferredLanguages
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "preferredLocalizations");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(__CFString **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("zh")))
          v10 = CFSTR("zh-Hant");
        else
          v10 = v9;
        v11 = objc_msgSend(a1, "createLocaleForIdentifier:", v10);
        if (v11)
        {
          v12 = (void *)v11;
          if (v6)
            objc_msgSend(v6, "setNextLocale:", v11);
          if (!s_sharedInstance)
            s_sharedInstance = v12;
          v6 = v12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
}

+ (id)sharedInstance
{
  objc_sync_enter(a1);
  if (!s_sharedInstance)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "systemVersion"), "componentsSeparatedByString:", CFSTR(".")), "objectEnumerator"), "nextObject"), "integerValue") < 8)objc_msgSend(a1, "setupRecoveringPreferredLanguages");
    else
      objc_msgSend(a1, "setupUsingPreferredLanguages");
    if (!s_sharedInstance)
      s_sharedInstance = objc_opt_new();
  }
  objc_sync_exit(a1);
  return (id)s_sharedInstance;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setNextLocale:](self, "setNextLocale:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMBaseLocale;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

- (id)objectForKey:(id)a3
{
  id result;

  result = -[NSDictionary objectForKey:](-[ACMBaseLocale localeStrings](self, "localeStrings"), "objectForKey:", a3);
  if (!result)
  {
    if (-[ACMBaseLocale nextLocale](self, "nextLocale"))
      return -[ACMBaseLocale objectForKey:](-[ACMBaseLocale nextLocale](self, "nextLocale"), "objectForKey:", a3);
    else
      return a3;
  }
  return result;
}

+ (id)localizedString:(id)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(a1, "sharedInstance"), "objectForKey:", a3);
  if (!result)
    return a3;
  return result;
}

- (ACMBaseLocale)nextLocale
{
  return self->_nextLocale;
}

- (void)setNextLocale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSDictionary)localeStrings
{
  return self->_localeStrings;
}

- (void)setLocaleStrings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
