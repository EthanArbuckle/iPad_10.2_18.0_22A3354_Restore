@implementation WFUserSettings

- (void)dealloc
{
  objc_super v3;

  -[WFUserSettings setUserName:](self, "setUserName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WFUserSettings;
  -[WFUserSettings dealloc](&v3, sel_dealloc);
}

- (WFUserSettings)initWithUserName:(id)a3
{
  WFUserSettings *v4;
  WFUserSettings *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFUserSettings;
  v4 = -[WFUserSettings init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[WFUserSettings setUserName:](v4, "setUserName:", a3);
  return v5;
}

- (void)setUserName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)restrictionType
{
  int64_t result;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  result = -[WFUserSettings _userSettingsForUser:](self, "_userSettingsForUser:", -[WFUserSettings userName](self, "userName"));
  if (result)
  {
    v3 = (void *)result;
    result = objc_msgSend((id)result, "objectForKey:", CFSTR("restrictWeb"));
    if (result)
    {
      if (!objc_msgSend((id)result, "BOOLValue"))
        return 0;
      v4 = (void *)objc_msgSend(v3, "objectForKey:", CFSTR("useContentFilter"));
      v5 = (void *)objc_msgSend(v3, "objectForKey:", CFSTR("useContentFilterOverrides"));
      v6 = (void *)objc_msgSend(v3, "objectForKey:", CFSTR("whitelistEnabled"));
      if (v6 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
        return 2;
      if (v4)
      {
        if (objc_msgSend(v4, "BOOLValue") && v5 && (objc_msgSend(v5, "BOOLValue") & 1) != 0)
          return 1;
        if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
          return 3;
      }
      if (v5 && (objc_msgSend(v5, "BOOLValue") & 1) != 0)
        return 4;
      else
        return 0;
    }
  }
  return result;
}

- (NSString)userName
{
  return self->_userName;
}

- (id)_userSettingsForUser:(id)a3
{
  uint64_t *p_userSettings;
  id v5;
  NSObject *v6;

  p_userSettings = (uint64_t *)&self->_userSettings;
  if (!self->_userSettings)
  {
    v5 = -[WFUserSettings _managedDefaultsPath](self, "_managedDefaultsPath");
    if (v5)
    {
      *p_userSettings = (uint64_t)(id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v5);
      v6 = __WFDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[WFUserSettings _userSettingsForUser:].cold.1((uint64_t)a3, p_userSettings, v6);
    }
  }
  return (id)*p_userSettings;
}

- (id)_managedDefaultsPath
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/Library/Managed Preferences/%@/com.apple.webcontentfilter.plist"), CFSTR("mobile"));
}

- (void)_userSettingsForUser:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
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
  _os_log_debug_impl(&dword_20CD6C000, log, OS_LOG_TYPE_DEBUG, "_userSettingsForUser %@: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_4_0();
}

- (BOOL)_setManagedDefaults:(id)a3
{
  return objc_msgSend(a3, "writeToFile:atomically:", -[WFUserSettings _managedDefaultsPath](self, "_managedDefaultsPath"), 1);
}

- (BOOL)_addManagedDefaults:(id)a3
{
  void *v5;
  void *v6;
  BOOL v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", -[WFUserSettings _managedDefaultsPath](self, "_managedDefaultsPath")), "mutableCopy");
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "addEntriesFromDictionary:", a3);
    a3 = v6;
  }
  v7 = -[WFUserSettings _setManagedDefaults:](self, "_setManagedDefaults:", a3);

  return v7;
}

- (void)setRestrictionType:(int64_t)a3
{
  void *v4;

  switch(a3)
  {
    case 2:
      -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", &unk_24C589AE8);
      -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", &unk_24C589B10);
      -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", &unk_24C589B38);
      v4 = &unk_24C589B60;
      goto LABEL_7;
    case 1:
      -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", &unk_24C589A48);
      -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", &unk_24C589A70);
      -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", &unk_24C589A98);
      v4 = &unk_24C589AC0;
      goto LABEL_7;
    case 0:
      -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", &unk_24C5899A8);
      -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", &unk_24C5899D0);
      -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", &unk_24C5899F8);
      v4 = &unk_24C589A20;
LABEL_7:
      -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", v4);
      return;
  }
  -[WFUserSettings setRestrictionType:](self, "setRestrictionType:", 0);
}

- (BOOL)canEditRestrictionType
{
  return 1;
}

- (NSArray)contentFilterOverriddenWhiteListedSites
{
  return (NSArray *)objc_msgSend(-[WFUserSettings _userSettingsForUser:](self, "_userSettingsForUser:", -[WFUserSettings userName](self, "userName")), "objectForKey:", CFSTR("filterWhitelist"));
}

- (void)setContentFilterOverriddenWhiteListedSites:(id)a3
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = CFSTR("filterWhitelist");
    v4[0] = a3;
    -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  }
}

- (BOOL)canEditContentFilterOverriddenWhiteListedSites
{
  return 1;
}

- (NSArray)contentFilterOverriddenBlackListedSites
{
  return (NSArray *)objc_msgSend(-[WFUserSettings _userSettingsForUser:](self, "_userSettingsForUser:", -[WFUserSettings userName](self, "userName")), "objectForKey:", CFSTR("filterBlacklist"));
}

- (void)setContentFilterOverriddenBlackListedSites:(id)a3
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = CFSTR("filterBlacklist");
    v4[0] = a3;
    -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  }
}

- (BOOL)canEditContentFilterOverriddenBlackListedSites
{
  return 1;
}

- (NSArray)whiteListAllowedSites
{
  return (NSArray *)objc_msgSend(-[WFUserSettings _userSettingsForUser:](self, "_userSettingsForUser:", -[WFUserSettings userName](self, "userName")), "objectForKey:", CFSTR("siteWhitelist"));
}

- (void)setWhiteListAllowedSites:(id)a3
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = CFSTR("siteWhitelist");
    v4[0] = a3;
    -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  }
}

- (BOOL)canEditWhiteListAllowedSites
{
  return 1;
}

- (BOOL)overridesAllowed
{
  id v2;
  void *v3;

  v2 = -[WFUserSettings _userSettingsForUser:](self, "_userSettingsForUser:", -[WFUserSettings userName](self, "userName"));
  if (v2 && (v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("noOverridingAllowed"))) != 0)
    return objc_msgSend(v3, "BOOLValue") ^ 1;
  else
    return 1;
}

- (void)setOverridesAllowed:(BOOL)a3
{
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("noOverridingAllowed");
  v5[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", !a3);
  -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1));
}

- (BOOL)canEditOverridesAllowed
{
  return 1;
}

- (BOOL)alwaysAllowHTTPS
{
  id v2;
  void *v3;

  v2 = -[WFUserSettings _userSettingsForUser:](self, "_userSettingsForUser:", -[WFUserSettings userName](self, "userName"));
  if (v2 && (v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("alwaysAllowHTTPS"))) != 0)
    return objc_msgSend(v3, "BOOLValue");
  else
    return 0;
}

- (void)setAlwaysAllowHTTPS:(BOOL)a3
{
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("alwaysAllowHTTPS");
  v5[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1));
}

- (BOOL)canEditAlwaysAllowHTTPS
{
  return 1;
}

- (BOOL)contentFilterListsAllowURL:(id)a3
{
  void *v5;
  uint64_t v6;

  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "scheme"), "lowercaseString");
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("https")) & 1) == 0
    && !objc_msgSend(v5, "isEqualToString:", CFSTR("http")))
  {
    return 1;
  }
  v6 = objc_msgSend(a3, "absoluteString");
  if (-[WFUserSettings contentFilterOverridesEnabled](self, "contentFilterOverridesEnabled"))
  {
    if (-[WFUserSettings contentFilterOverriddenBlackListContainsURL:](self, "contentFilterOverriddenBlackListContainsURL:", v6))
    {
      return 0;
    }
    if (-[WFUserSettings contentFilterOverriddenWhiteListContainsURL:](self, "contentFilterOverriddenWhiteListContainsURL:", v6)|| -[WFUserSettings autoWhitelistContainsURL:](self, "autoWhitelistContainsURL:", a3))
    {
      return 1;
    }
  }
  return !-[WFUserSettings whiteListEnabled](self, "whiteListEnabled")
      || -[WFUserSettings whiteListContainsURL:](self, "whiteListContainsURL:", v6)
      || -[WFUserSettings autoWhitelistContainsURL:](self, "autoWhitelistContainsURL:", a3);
}

- (BOOL)restrictWebEnabled
{
  id v2;
  void *v3;

  v2 = -[WFUserSettings _userSettingsForUser:](self, "_userSettingsForUser:", -[WFUserSettings userName](self, "userName"));
  if (v2 && (v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("restrictWeb"))) != 0)
    return objc_msgSend(v3, "BOOLValue");
  else
    return 0;
}

- (void)setRestrictWebEnabled:(BOOL)a3
{
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("restrictWeb");
  v5[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1));
}

- (BOOL)contentFilterEnabled
{
  id v2;
  void *v3;

  v2 = -[WFUserSettings _userSettingsForUser:](self, "_userSettingsForUser:", -[WFUserSettings userName](self, "userName"));
  if (v2 && (v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("useContentFilter"))) != 0)
    return objc_msgSend(v3, "BOOLValue");
  else
    return 0;
}

- (void)setContentFilterEnabled:(BOOL)a3
{
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("useContentFilter");
  v5[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1));
}

- (BOOL)contentFilterOverridesEnabled
{
  id v2;
  void *v3;

  v2 = -[WFUserSettings _userSettingsForUser:](self, "_userSettingsForUser:", -[WFUserSettings userName](self, "userName"));
  if (v2 && (v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("useContentFilterOverrides"))) != 0)
    return objc_msgSend(v3, "BOOLValue");
  else
    return 0;
}

- (void)setContentFilterOverridesEnabled:(BOOL)a3
{
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("useContentFilterOverrides");
  v5[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1));
}

- (BOOL)whiteListEnabled
{
  id v2;
  void *v3;

  v2 = -[WFUserSettings _userSettingsForUser:](self, "_userSettingsForUser:", -[WFUserSettings userName](self, "userName"));
  if (v2 && (v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("whitelistEnabled"))) != 0)
    return objc_msgSend(v3, "BOOLValue");
  else
    return 0;
}

- (void)setWhiteListEnabled:(BOOL)a3
{
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("whitelistEnabled");
  v5[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1));
}

- (id)contentFilterOverriddenWhiteListedSitesBuffer
{
  return -[WFUserSettings contentFilterOverriddenWhiteListedSitesBufferWithAdditionalURLStrings:](self, "contentFilterOverriddenWhiteListedSitesBufferWithAdditionalURLStrings:", 0);
}

- (id)contentFilterOverriddenWhiteListedSitesBufferWithAdditionalURLStrings:(id)a3
{
  WFWhitelistSiteBuffer *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSArray *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!self->_contentFilterOverriddenWhiteListedSitesBuffer)
  {
    v6 = objc_alloc_init(WFWhitelistSiteBuffer);
    self->_contentFilterOverriddenWhiteListedSitesBuffer = v6;
    -[WFWhitelistSiteBuffer addURLString:](v6, "addURLString:", CFSTR("https://setup.icloud.com"));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(a3);
          -[WFWhitelistSiteBuffer addURLString:](self->_contentFilterOverriddenWhiteListedSitesBuffer, "addURLString:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        }
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }
    v11 = -[WFUserSettings contentFilterOverriddenWhiteListedSites](self, "contentFilterOverriddenWhiteListedSites");
    if (v11)
    {
      v12 = v11;
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v18;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v18 != v15)
              objc_enumerationMutation(v12);
            -[WFWhitelistSiteBuffer addURLString:](self->_contentFilterOverriddenWhiteListedSitesBuffer, "addURLString:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j));
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        }
        while (v14);
      }
    }
  }
  return self->_contentFilterOverriddenWhiteListedSitesBuffer;
}

- (id)contentFilterOverriddenBlackListedSitesBuffer
{
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!self->_contentFilterOverriddenBlackListedSitesBuffer)
  {
    self->_contentFilterOverriddenBlackListedSitesBuffer = objc_alloc_init(WFWhitelistSiteBuffer);
    v4 = -[WFUserSettings contentFilterOverriddenBlackListedSites](self, "contentFilterOverriddenBlackListedSites");
    if (v4)
    {
      v5 = v4;
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            -[WFWhitelistSiteBuffer addURLString:](self->_contentFilterOverriddenBlackListedSitesBuffer, "addURLString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
          }
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }
    }
  }
  return self->_contentFilterOverriddenBlackListedSitesBuffer;
}

- (id)whiteListedSitesBuffer
{
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13;
  _BYTE v14[15];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!self->_whiteListedSitesBuffer)
  {
    self->_whiteListedSitesBuffer = objc_alloc_init(WFWhitelistSiteBuffer);
    -[WFWhitelistSiteBuffer addURLString:](self->_contentFilterOverriddenWhiteListedSitesBuffer, "addURLString:", CFSTR("https://setup.icloud.com"));
    v4 = -[WFUserSettings whiteListAllowedSites](self, "whiteListAllowedSites");
    if (v4)
    {
      v5 = v4;
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v16 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v11 = objc_msgSend(v10, "objectForKey:", CFSTR("address"));
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && v11)
                -[WFWhitelistSiteBuffer addURLString:](self->_whiteListedSitesBuffer, "addURLString:", v11);
            }
            else
            {
              v12 = __WFDefaultLog();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
                -[WFUserSettings whiteListedSitesBuffer].cold.1(&v13, v14, v12);
            }
          }
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v7);
      }
    }
  }
  return self->_whiteListedSitesBuffer;
}

- (BOOL)contentFilterOverriddenList:(id)a3 containsURL:(id)a4
{
  uint64_t v5;
  void *v6;
  NSObject *v8;

  v5 = objc_msgSend(a4, "WF_stringByProperlyFixingPercentEscapesUsingEncoding:", 4);
  if (v5)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    if (v6)
      return objc_msgSend(a3, "containsURLString:", objc_msgSend((id)objc_msgSend(v6, "absoluteString"), "WF_stringByProperlyFixingPercentEscapesUsingEncoding:", 4));
  }
  v8 = __WFDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[WFUserSettings contentFilterOverriddenList:containsURL:].cold.1(v5, v8);
  return 0;
}

- (BOOL)contentFilterOverriddenWhiteListContainsURL:(id)a3 withAppleAllowList:(id)a4
{
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v7 = __WFDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = a3;
    _os_log_impl(&dword_20CD6C000, v7, OS_LOG_TYPE_INFO, "Checking if %@ is in contentFilterOverriddenWhiteList:withAppleAllowList", (uint8_t *)&v9, 0xCu);
  }
  return -[WFUserSettings contentFilterOverriddenList:containsURL:](self, "contentFilterOverriddenList:containsURL:", -[WFUserSettings contentFilterOverriddenWhiteListedSitesBufferWithAdditionalURLStrings:](self, "contentFilterOverriddenWhiteListedSitesBufferWithAdditionalURLStrings:", objc_msgSend(a4, "allowList")), a3);
}

- (BOOL)contentFilterOverriddenWhiteListContainsURL:(id)a3
{
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = __WFDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = a3;
    _os_log_impl(&dword_20CD6C000, v5, OS_LOG_TYPE_INFO, "Checking if %@ is in contentFilterOverriddenWhiteList", (uint8_t *)&v7, 0xCu);
  }
  return -[WFUserSettings contentFilterOverriddenList:containsURL:](self, "contentFilterOverriddenList:containsURL:", -[WFUserSettings contentFilterOverriddenWhiteListedSitesBuffer](self, "contentFilterOverriddenWhiteListedSitesBuffer"), a3);
}

- (BOOL)contentFilterOverriddenBlackListContainsURL:(id)a3
{
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = __WFDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = a3;
    _os_log_impl(&dword_20CD6C000, v5, OS_LOG_TYPE_INFO, "Checking if %@ is in contentFilterOverriddenBlackList", (uint8_t *)&v7, 0xCu);
  }
  return -[WFUserSettings contentFilterOverriddenList:containsURL:](self, "contentFilterOverriddenList:containsURL:", -[WFUserSettings contentFilterOverriddenBlackListedSitesBuffer](self, "contentFilterOverriddenBlackListedSitesBuffer"), a3);
}

- (BOOL)whiteListContainsURL:(id)a3
{
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = __WFDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = a3;
    _os_log_impl(&dword_20CD6C000, v5, OS_LOG_TYPE_INFO, "Checking if %@ is in whiteList", (uint8_t *)&v7, 0xCu);
  }
  return -[WFUserSettings contentFilterOverriddenList:containsURL:](self, "contentFilterOverriddenList:containsURL:", -[WFUserSettings whiteListedSitesBuffer](self, "whiteListedSitesBuffer"), a3);
}

- (BOOL)autoWhitelistContainsURL:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend(a3, "host"), "lowercaseString");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("apple.com")) & 1) != 0
    || (objc_msgSend(v3, "hasSuffix:", CFSTR(".apple.com")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("icloud.com")) & 1) != 0
    || (objc_msgSend(v3, "hasSuffix:", CFSTR(".icloud.com")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("me.com")) & 1) != 0
    || (objc_msgSend(v3, "hasSuffix:", CFSTR(".me.com")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("mac.com")) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(v3, "hasSuffix:", CFSTR(".mac.com"));
  }
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", a3, 4, 0);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\n"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v11, "length"))
          {
            if ((objc_msgSend(v11, "hasPrefix:", CFSTR("#")) & 1) == 0)
              objc_msgSend(v4, "addObject:", v11);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
    return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
  }
  else
  {
    v13 = __WFDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[WFUserSettings _arrayByConvertingLinesInStringsAtPath:].cold.1(v13);
    return 0;
  }
}

+ (id)_metasiteDomainNamesArray
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)objc_msgSend(a1, "_arrayByConvertingLinesInStringsAtPath:", objc_msgSend((id)objc_opt_class(), "metasitesPath"));
  if (!v2)
  {
    v3 = __WFDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[WFUserSettings _metasiteDomainNamesArray].cold.1(v3, v4, v5);
  }
  return v2;
}

+ (id)_sharedMetasiteExceptionsDomainNamesArray
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;

  if (!_sharedMetasiteExceptionsDomainNamesArray_result_0)
  {
    _sharedMetasiteExceptionsDomainNamesArray_result_0 = objc_msgSend(a1, "_arrayByConvertingLinesInStringsAtPath:", objc_msgSend((id)objc_opt_class(), "metasitesExceptionPath"));
    v2 = (id)_sharedMetasiteExceptionsDomainNamesArray_result_0;
    if (!_sharedMetasiteExceptionsDomainNamesArray_result_0)
    {
      v3 = __WFDefaultLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        +[WFUserSettings _metasiteDomainNamesArray].cold.1(v3, v4, v5);
    }
  }
  return (id)_sharedMetasiteExceptionsDomainNamesArray_result_0;
}

+ (id)_sharedMetasiteDomainNamesDictionary
{
  id result;
  uint64_t v4;
  id v5;

  result = (id)_sharedMetasiteDomainNamesDictionary_result_0;
  if (!_sharedMetasiteDomainNamesDictionary_result_0)
  {
    v4 = objc_msgSend(a1, "_metasiteDomainNamesArray");
    _sharedMetasiteDomainNamesDictionary_result_0 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v4);
    v5 = (id)_sharedMetasiteDomainNamesDictionary_result_0;
    return (id)_sharedMetasiteDomainNamesDictionary_result_0;
  }
  return result;
}

- (void)whiteListedSitesBuffer
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_1(&dword_20CD6C000, a3, (uint64_t)a3, "**** ERROR: siteWhitelist is malformed", a1);
}

- (void)contentFilterOverriddenList:(uint64_t)a1 containsURL:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
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
  v5 = "-[WFUserSettings contentFilterOverriddenList:containsURL:]";
  _os_log_error_impl(&dword_20CD6C000, a2, OS_LOG_TYPE_ERROR, "**** URL (rawdata:%@) is nil, in %{public}s", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)_arrayByConvertingLinesInStringsAtPath:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136446210;
  v2 = "+[WFUserSettings _arrayByConvertingLinesInStringsAtPath:]";
  _os_log_error_impl(&dword_20CD6C000, log, OS_LOG_TYPE_ERROR, "%{public}s file content is nil", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_4_0();
}

+ (void)_metasiteDomainNamesArray
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_20CD6C000, a1, a3, "metasite.txt failed to load", v3);
}

@end
