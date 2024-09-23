@implementation WFWhitelistUserPreferences

+ (id)preferencesPathForUsername:(id)a3
{
  if (a3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/Library/Managed Preferences/%@/com.apple.familycontrols.contentfilter.plist"), a3);
  else
    return 0;
}

+ (id)metasitesPath
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", CFSTR("metasites"), CFSTR("txt"));
}

+ (id)metasitesExceptionPath
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", CFSTR("metasites_exceptions"), CFSTR("txt"));
}

+ (id)_arrayByConvertingLinesInStringsAtPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", a3, 4, 0);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\n"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v11, "length"))
          {
            if ((objc_msgSend(v11, "hasPrefix:", CFSTR("#")) & 1) == 0)
              objc_msgSend(v4, "addObject:", v11);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }
    return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
  }
  else
  {
    v13 = __WFDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[WFWhitelistUserPreferences _arrayByConvertingLinesInStringsAtPath:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    return 0;
  }
}

+ (id)_metasiteDomainNamesArray
{
  void *v2;
  NSObject *v3;

  v2 = (void *)objc_msgSend(a1, "_arrayByConvertingLinesInStringsAtPath:", objc_msgSend((id)objc_opt_class(), "metasitesPath"));
  if (!v2)
  {
    v3 = __WFDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[WFWhitelistUserPreferences _metasiteDomainNamesArray].cold.1();
  }
  return v2;
}

+ (id)_sharedMetasiteExceptionsDomainNamesArray
{
  id v2;
  NSObject *v3;

  if (!_sharedMetasiteExceptionsDomainNamesArray_result)
  {
    _sharedMetasiteExceptionsDomainNamesArray_result = objc_msgSend(a1, "_arrayByConvertingLinesInStringsAtPath:", objc_msgSend((id)objc_opt_class(), "metasitesExceptionPath"));
    v2 = (id)_sharedMetasiteExceptionsDomainNamesArray_result;
    if (!_sharedMetasiteExceptionsDomainNamesArray_result)
    {
      v3 = __WFDefaultLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        +[WFWhitelistUserPreferences _metasiteDomainNamesArray].cold.1();
    }
  }
  return (id)_sharedMetasiteExceptionsDomainNamesArray_result;
}

+ (id)_sharedMetasiteDomainNamesDictionary
{
  id result;
  uint64_t v4;
  id v5;

  result = (id)_sharedMetasiteDomainNamesDictionary_result;
  if (!_sharedMetasiteDomainNamesDictionary_result)
  {
    v4 = objc_msgSend(a1, "_metasiteDomainNamesArray");
    _sharedMetasiteDomainNamesDictionary_result = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v4);
    v5 = (id)_sharedMetasiteDomainNamesDictionary_result;
    return (id)_sharedMetasiteDomainNamesDictionary_result;
  }
  return result;
}

+ (BOOL)_isURLMetasite:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "_sharedMetasiteDomainNamesDictionary");
  v6 = objc_msgSend(a3, "host");
  if (v6)
  {
    v6 = objc_msgSend(v5, "objectForKey:", v6);
    if (v6)
    {
      v7 = (void *)objc_msgSend(a1, "_sharedMetasiteExceptionsDomainNamesArray");
      v8 = (void *)objc_msgSend(a3, "host");
      v9 = objc_msgSend(v8, "length");
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v18 != v12)
              objc_enumerationMutation(v7);
            v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            v15 = objc_msgSend(v14, "length");
            if (v15 - 1 < v9
              && (objc_msgSend((id)objc_msgSend(v8, "substringFromIndex:", v9 - v15), "isEqualToString:", v14) & 1) != 0)
            {
              LOBYTE(v6) = 0;
              return v6;
            }
          }
          v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          LOBYTE(v6) = 1;
          if (v11)
            continue;
          break;
        }
      }
      else
      {
        LOBYTE(v6) = 1;
      }
    }
  }
  return v6;
}

+ (id)whitelistWithPreferences:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPreferences:", a3);
}

+ (id)whitelistForUser:(id)a3
{
  NSObject *v4;

  if (a3)
    return (id)objc_msgSend(a1, "whitelistWithPreferences:", objc_msgSend(a1, "preferencesPathForUsername:"));
  v4 = __WFDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[WFWhitelistUserPreferences whitelistForUser:].cold.1();
  return 0;
}

+ (id)_modificationDateForFileAtPath:(id)a3
{
  void *v3;
  NSObject *v4;

  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "attributesOfItemAtPath:error:", a3, 0);
  if (!v3)
  {
    v4 = __WFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[WFWhitelistUserPreferences _modificationDateForFileAtPath:].cold.1();
  }
  return (id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDD0C98]);
}

+ (id)_cachedWhitelistForPath:(id)a3 username:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = objc_msgSend(a1, "_modificationDateForFileAtPath:");
  if (_cachedWhitelistForPath_username__static_sharedCache)
    v8 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:");
  else
    v8 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = v8;
  v10 = (void *)objc_msgSend(v8, "objectForKey:", a4);
  if (!v10
    || (v11 = v10,
        !objc_msgSend((id)objc_msgSend(v10, "objectForKey:", CFSTR("date")), "isEqualToDate:", v7))
    || (v12 = (void *)objc_msgSend(v11, "objectForKey:", CFSTR("whitelist"))) == 0)
  {
    v12 = (void *)objc_msgSend(a1, "whitelistWithPreferences:", a3);
    objc_msgSend(v12, "setUsername:", a4);
    objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v7, CFSTR("date"), v12, CFSTR("whitelist"), 0), a4);
    v13 = (id)_cachedWhitelistForPath_username__static_sharedCache;
    _cachedWhitelistForPath_username__static_sharedCache = (uint64_t)(id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v9);
  }
  return v12;
}

+ (id)defaultWhitelistForUser:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  if (!a3)
  {
    v9 = __WFDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[WFWhitelistUserPreferences whitelistForUser:].cold.1();
    return 0;
  }
  v5 = objc_msgSend((id)objc_opt_class(), "preferencesPathForUsername:", a3);
  if (!v5)
  {
    v10 = __WFDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[WFWhitelistUserPreferences defaultWhitelistForUser:].cold.2((uint64_t)a3, v10, v11, v12, v13, v14, v15, v16);
    return 0;
  }
  v6 = v5;
  v18 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:isDirectory:", v5, &v18) & 1) != 0
    || v18)
  {
    return (id)objc_msgSend(a1, "_cachedWhitelistForPath:username:", v6, a3);
  }
  v7 = __WFDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    +[WFWhitelistUserPreferences defaultWhitelistForUser:].cold.3();
  objc_opt_class();
  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setUsername:", a3);
  return v8;
}

- (WFWhitelistUserPreferences)init
{
  WFWhitelistUserPreferences *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFWhitelistUserPreferences;
  v2 = -[WFWhitelistUserPreferences init](&v4, sel_init);
  if (v2)
  {
    v2->filterWhitelist = objc_alloc_init(WFWhitelistSiteBuffer);
    v2->filterBlacklist = objc_alloc_init(WFWhitelistSiteBuffer);
    v2->webWhitelist = objc_alloc_init(WFWhitelistSiteBuffer);
    -[WFWhitelistSiteBuffer addURLString:](v2->filterWhitelist, "addURLString:", CFSTR("https://setup.icloud.com"));
    -[WFWhitelistSiteBuffer addURLString:](v2->webWhitelist, "addURLString:", CFSTR("https://setup.icloud.com"));
  }
  return v2;
}

- (WFWhitelistUserPreferences)initWithPreferences:(id)a3
{
  WFWhitelistUserPreferences *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = -[WFWhitelistUserPreferences init](self, "init");
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", a3);
    if (v4)
    {
      v5 = v4;
      v3->filterEnabled = objc_msgSend((id)objc_msgSend(v4, "valueForKey:", CFSTR("useContentFilter")), "BOOLValue");
      v3->whitelistEnabled = objc_msgSend((id)objc_msgSend(v5, "valueForKey:", CFSTR("whitelistEnabled")), "BOOLValue");
      v3->alwaysAllowHTTPS = objc_msgSend((id)objc_msgSend(v5, "valueForKey:", CFSTR("alwaysAllowHTTPS")), "BOOLValue");
      v6 = (void *)objc_msgSend(v5, "valueForKey:", CFSTR("filterWhitelist"));
      if (v6)
      {
        v7 = v6;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v44 != v10)
                objc_enumerationMutation(v7);
              -[WFWhitelistSiteBuffer addURLString:](v3->filterWhitelist, "addURLString:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          }
          while (v9);
        }
      }
      v12 = (void *)objc_msgSend(v5, "valueForKey:", CFSTR("filterBlacklist"));
      if (v12)
      {
        v13 = v12;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v40;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v40 != v16)
                objc_enumerationMutation(v13);
              -[WFWhitelistSiteBuffer addURLString:](v3->filterBlacklist, "addURLString:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
          }
          while (v15);
        }
      }
      v18 = (void *)objc_msgSend(v5, "valueForKey:", CFSTR("siteWhitelist"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v36;
          do
          {
            for (k = 0; k != v20; ++k)
            {
              if (*(_QWORD *)v36 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v24 = objc_msgSend(v23, "objectForKey:", CFSTR("address"));
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && v24)
                  -[WFWhitelistSiteBuffer addURLString:](v3->webWhitelist, "addURLString:", v24);
              }
              else
              {
                v25 = __WFDefaultLog();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v48 = a3;
                  _os_log_error_impl(&dword_20CD6C000, v25, OS_LOG_TYPE_ERROR, "**** ERROR: siteWhitelist is malformed in %@", buf, 0xCu);
                }
              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
          }
          while (v20);
        }
      }
      else
      {
        v26 = __WFDefaultLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[WFWhitelistUserPreferences initWithPreferences:].cold.1((uint64_t)a3, v26, v27, v28, v29, v30, v31, v32);
      }
    }
    else
    {
      NSLog(CFSTR("didn't find prefs!!!"));
    }
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFWhitelistUserPreferences;
  -[WFWhitelistUserPreferences dealloc](&v3, sel_dealloc);
}

- (BOOL)isURLAllowed:(id)a3
{
  return -[WFWhitelistUserPreferences isURLAllowed:reason:shouldFilter:foundOnList:](self, "isURLAllowed:reason:shouldFilter:foundOnList:", a3, 0, 0, 0);
}

- (BOOL)isURLAllowed:(id)a3 reason:(id *)a4 shouldFilter:(BOOL *)a5 foundOnList:(BOOL *)a6
{
  NSString *v11;
  const __CFString *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  __CFString *v18;
  NSObject *v19;
  char v20;
  NSObject *v21;
  BOOL v22;
  BOOL v23;
  uint8_t v25[16];
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t v28[16];
  uint8_t buf[16];

  v11 = -[WFWhitelistUserPreferences username](self, "username");
  if (a4)
  {
    v12 = CFSTR("User (null)");
    if (v11)
      v12 = (const __CFString *)v11;
    *a4 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ has no web restrictions"), v12);
  }
  if (self->whitelistEnabled)
  {
    v13 = __WFDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CD6C000, v13, OS_LOG_TYPE_INFO, "Checking whitelist", buf, 2u);
    }
    v14 = -[WFWhitelistUserPreferences isURL:onList:](self, "isURL:onList:", a3, self->webWhitelist);
    v15 = __WFDefaultLog();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (!v14)
    {
      if (v16)
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_20CD6C000, v15, OS_LOG_TYPE_INFO, "URL is not on whitelist", v27, 2u);
      }
      LOBYTE(v17) = 0;
      if (!a4)
      {
        v20 = 0;
        if (a5)
          goto LABEL_34;
        goto LABEL_42;
      }
      v18 = CFSTR("URL is not on global white list");
      v20 = 0;
      goto LABEL_32;
    }
    if (v16)
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_20CD6C000, v15, OS_LOG_TYPE_INFO, "URL is on whitelist", v28, 2u);
    }
    LOBYTE(v17) = 1;
    if (a4)
    {
      v18 = CFSTR("URL is on global white list");
LABEL_19:
      v20 = 1;
      goto LABEL_32;
    }
  }
  else if (self->filterEnabled)
  {
    v19 = __WFDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_20CD6C000, v19, OS_LOG_TYPE_INFO, "Checking always allow list", v26, 2u);
    }
    if (!-[WFWhitelistUserPreferences isURL:onList:](self, "isURL:onList:", a3, self->filterWhitelist))
    {
      v21 = __WFDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_20CD6C000, v21, OS_LOG_TYPE_INFO, "Checking never allow list", v25, 2u);
      }
      v17 = -[WFWhitelistUserPreferences isURL:onList:](self, "isURL:onList:", a3, self->filterBlacklist);
      v20 = !v17;
      if (!a4 || !v17)
      {
LABEL_33:
        if (a5)
          goto LABEL_34;
        goto LABEL_42;
      }
      v20 = 0;
      LOBYTE(v17) = 1;
      v18 = CFSTR("URL is on filter black list");
LABEL_32:
      *a4 = v18;
      goto LABEL_33;
    }
    LOBYTE(v17) = 1;
    if (a4)
    {
      v18 = CFSTR("URL is on filter white list");
      goto LABEL_19;
    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }
  v20 = 1;
  if (a5)
  {
LABEL_34:
    v22 = self->filterEnabled && v17;
    v23 = !v22 && self->filterEnabled && !self->whitelistEnabled;
    *a5 = v23;
  }
LABEL_42:
  if (a6)
    *a6 = v17;
  return v20;
}

- (id)pronounceOnPageURLString:(id)a3 shouldFilter:(BOOL *)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  char v13;
  uint64_t v14;

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setURL:", a3);
  v8 = objc_msgSend(a3, "WF_stringByProperlyFixingPercentEscapesUsingEncoding:", 4);
  if (!v8 || (v9 = objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8)) == 0)
  {
    v10 = __WFDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WFWhitelistUserPreferences pronounceOnPageURLString:shouldFilter:].cold.1(v8, v10);
    v9 = 0;
  }
  v14 = 0;
  v13 = 0;
  objc_msgSend(v7, "setRestricted:", -[WFWhitelistUserPreferences isURLAllowed:reason:shouldFilter:foundOnList:](self, "isURLAllowed:reason:shouldFilter:foundOnList:", v9, &v14, a4, &v13) ^ 1);
  if (v13)
    v11 = 8;
  else
    v11 = 9;
  objc_msgSend(v7, "setEvidence:", v11);
  objc_msgSend(v7, "setMessage:", v14);
  return v7;
}

- (BOOL)isURL:(id)a3 onList:(id)a4
{
  NSObject *v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = __WFDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = objc_msgSend(a3, "absoluteString");
    _os_log_impl(&dword_20CD6C000, v6, OS_LOG_TYPE_INFO, "url: %@", (uint8_t *)&v11, 0xCu);
  }
  if (a3)
    v7 = objc_msgSend(a4, "containsURLString:", objc_msgSend((id)objc_msgSend(a3, "absoluteString"), "WF_stringByProperlyFixingPercentEscapesUsingEncoding:", 4));
  else
    v7 = 0;
  v8 = __WFDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = CFSTR("NO");
    if (v7)
      v9 = CFSTR("YES");
    v11 = 138412290;
    v12 = (uint64_t)v9;
    _os_log_impl(&dword_20CD6C000, v8, OS_LOG_TYPE_INFO, "result = %@", (uint8_t *)&v11, 0xCu);
  }
  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p username:%@ filterEnabled:%d whitelistEnabled:%d filterWhitelist:%@ filterBlacklist:%@ webWhitelist:%@>"), objc_msgSend((id)objc_opt_class(), "description"), self, self->username, self->filterEnabled, self->whitelistEnabled, self->filterWhitelist, self->filterBlacklist, self->webWhitelist);
}

- (BOOL)filterEnabled
{
  return self->filterEnabled;
}

- (void)setFilterEnabled:(BOOL)a3
{
  self->filterEnabled = a3;
}

- (BOOL)whitelistEnabled
{
  return self->whitelistEnabled;
}

- (void)setWhitelistEnabled:(BOOL)a3
{
  self->whitelistEnabled = a3;
}

- (BOOL)alwaysAllowHTTPS
{
  return self->alwaysAllowHTTPS;
}

- (void)setAlwaysAllowHTTPS:(BOOL)a3
{
  self->alwaysAllowHTTPS = a3;
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUsername:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (WFWhitelistSiteBuffer)filterWhitelist
{
  return self->filterWhitelist;
}

- (WFWhitelistSiteBuffer)filterBlacklist
{
  return self->filterBlacklist;
}

- (WFWhitelistSiteBuffer)webWhitelist
{
  return self->webWhitelist;
}

+ (void)_arrayByConvertingLinesInStringsAtPath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_20CD6C000, a1, a3, "%{public}s file content is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)_metasiteDomainNamesArray
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CD6C000, v0, v1, "metasite.txt failed to load", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)whitelistForUser:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CD6C000, v0, v1, "WFWhitelist: Whitelist passed nil username.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_modificationDateForFileAtPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CD6C000, v0, v1, "Error whitelist file attributes dictionary is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)defaultWhitelistForUser:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_20CD6C000, a2, a3, "**** WFWhitelist -defaultWhitelist: path was nil for username %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)defaultWhitelistForUser:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CD6C000, v0, v1, "No website restrictions user preferecences file found: setting unrestricted settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithPreferences:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_20CD6C000, a2, a3, "**** ERROR: siteWhitelist is expected to be an array class in %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)pronounceOnPageURLString:(uint64_t)a1 shouldFilter:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2082;
  v5 = "-[WFWhitelistUserPreferences pronounceOnPageURLString:shouldFilter:]";
  _os_log_error_impl(&dword_20CD6C000, a2, OS_LOG_TYPE_ERROR, "**** ERROR: URL (rawdata:%@) is nil, in %{public}s", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_4_0();
}

@end
