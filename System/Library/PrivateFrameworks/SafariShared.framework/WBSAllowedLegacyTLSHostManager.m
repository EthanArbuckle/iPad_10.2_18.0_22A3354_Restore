@implementation WBSAllowedLegacyTLSHostManager

- (WBSAllowedLegacyTLSHostManager)initWithBrowserDefaults:(id)a3
{
  id v5;
  WBSAllowedLegacyTLSHostManager *v6;
  WBSAllowedLegacyTLSHostManager *v7;
  WBSAllowedLegacyTLSHostManager *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSAllowedLegacyTLSHostManager;
  v6 = -[WBSAllowedLegacyTLSHostManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_browserDefaults, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isLegacyTLSAllowedForHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  v4 = a3;
  -[NSUserDefaults dictionaryForKey:](self->_browserDefaults, "dictionaryForKey:", CFSTR("allowedLegacyTLSHosts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "safari_dateForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "dateByAddingTimeInterval:", 604800.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "compare:", v10);

    if ((unint64_t)(v11 + 1) > 1)
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v4);
      -[NSUserDefaults setObject:forKey:](self->_browserDefaults, "setObject:forKey:", v6, CFSTR("allowedLegacyTLSHosts"));
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)allowLegacyTLSForHost:(id)a3
{
  NSUserDefaults *browserDefaults;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  browserDefaults = self->_browserDefaults;
  v5 = a3;
  -[NSUserDefaults dictionaryForKey:](browserDefaults, "dictionaryForKey:", CFSTR("allowedLegacyTLSHosts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v5);

  -[NSUserDefaults setObject:forKey:](self->_browserDefaults, "setObject:forKey:", v11, CFSTR("allowedLegacyTLSHosts"));
}

- (void)clearAllLegacyTLSHosts
{
  -[NSUserDefaults removeObjectForKey:](self->_browserDefaults, "removeObjectForKey:", CFSTR("allowedLegacyTLSHosts"));
}

- (void)clearLegacyTLSForHostIfPresent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NSUserDefaults dictionaryForKey:](self->_browserDefaults, "dictionaryForKey:", CFSTR("allowedLegacyTLSHosts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v7);
    -[NSUserDefaults setObject:forKey:](self->_browserDefaults, "setObject:forKey:", v5, CFSTR("allowedLegacyTLSHosts"));
  }

}

- (void)clearLegacyTLSForHosts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[NSUserDefaults dictionaryForKey:](self->_browserDefaults, "dictionaryForKey:", CFSTR("allowedLegacyTLSHosts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__WBSAllowedLegacyTLSHostManager_clearLegacyTLSForHosts___block_invoke;
  v8[3] = &unk_1E4B29A00;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSUserDefaults setObject:forKey:](self->_browserDefaults, "setObject:forKey:", v6, CFSTR("allowedLegacyTLSHosts"));
}

id __57__WBSAllowedLegacyTLSHostManager_clearLegacyTLSForHosts___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) & 1) != 0
    || (objc_msgSend(v5, "dateByAddingTimeInterval:", 604800.0),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(MEMORY[0x1E0C99D68], "date"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "compare:", v7),
        v7,
        v6,
        v8 != 1))
  {
    v9 = 0;
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserDefaults, 0);
}

@end
