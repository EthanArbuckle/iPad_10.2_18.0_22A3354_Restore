@implementation WFSystemContentWhitelist

+ (id)newWhitelistItemFromPlistEntry:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WFSystemContentWhitelistDomainGlob"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[WFSystemContentWhitelistItem initWithDomainGlob:]([WFSystemContentWhitelistItem alloc], "initWithDomainGlob:", v3);
  else
    return 0;
}

+ (id)defaultSystemWhitelist
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__WFSystemContentWhitelist_defaultSystemWhitelist__block_invoke;
  block[3] = &unk_24C583C80;
  block[4] = a1;
  if (defaultSystemWhitelist_onceToken != -1)
    dispatch_once(&defaultSystemWhitelist_onceToken, block);
  return (id)defaultSystemWhitelist_defaultWhitelist;
}

WFSystemContentWhitelist *__50__WFSystemContentWhitelist_defaultSystemWhitelist__block_invoke(uint64_t a1)
{
  WFSystemContentWhitelist *result;

  result = -[WFSystemContentWhitelist initWithWhitelistURL:]([WFSystemContentWhitelist alloc], "initWithWhitelistURL:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", *(_QWORD *)(a1 + 32)), "URLForResource:withExtension:", CFSTR("SystemContentWhitelist"), CFSTR("plist")));
  defaultSystemWhitelist_defaultWhitelist = (uint64_t)result;
  return result;
}

- (WFSystemContentWhitelist)initWithWhitelistURL:(id)a3
{
  WFSystemContentWhitelist *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSArray *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)WFSystemContentWhitelist;
  v4 = -[WFSystemContentWhitelist init](&v24, sel_init);
  if (v4)
  {
    v23 = 0;
    v5 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", a3, 0, &v23);
    if (v5
      && (v6 = objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v5, 0, 0, &v23)) != 0)
    {
      v7 = (void *)v6;
      v8 = (NSArray *)objc_opt_new();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "valueForKey:", CFSTR("WFSystemContentWhitelistItems"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v9 = (void *)objc_msgSend(v7, "valueForKey:", CFSTR("WFSystemContentWhitelistItems"), 0);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v20;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v20 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v15 = +[WFSystemContentWhitelist newWhitelistItemFromPlistEntry:](WFSystemContentWhitelist, "newWhitelistItemFromPlistEntry:", v14);
                  if (v15)
                  {
                    v16 = v15;
                    -[NSArray addObject:](v8, "addObject:", v15);

                  }
                }
                ++v13;
              }
              while (v11 != v13);
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
            }
            while (v11);
          }
        }
      }
      v4->_whitelistItems = v8;
    }
    else
    {
      v17 = __WFDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[WFSystemContentWhitelist initWithWhitelistURL:].cold.1((uint64_t)a3, &v23, v17);

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFSystemContentWhitelist;
  -[WFSystemContentWhitelist dealloc](&v3, sel_dealloc);
}

- (BOOL)isURLWhitelisted:(id)a3
{
  NSArray *whitelistItems;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  whitelistItems = self->_whitelistItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](whitelistItems, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(whitelistItems);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "matchesURL:", a3) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](whitelistItems, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return v5;
}

- (void)initWithWhitelistURL:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_20CD6C000, log, OS_LOG_TYPE_ERROR, "Couldn't read plist from url %@: %@", (uint8_t *)&v4, 0x16u);
}

@end
