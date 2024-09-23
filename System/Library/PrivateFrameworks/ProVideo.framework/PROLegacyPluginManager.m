@implementation PROLegacyPluginManager

+ (id)pluginManager
{
  id result;

  result = (id)sharedPluginManager;
  if (!sharedPluginManager)
  {
    result = objc_alloc_init((Class)a1);
    sharedPluginManager = (uint64_t)result;
  }
  return result;
}

- (PROLegacyPluginManager)init
{
  PROLegacyPluginManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PROLegacyPluginManager;
  v2 = -[PROLegacyPluginManager init](&v4, sel_init);
  if (v2)
  {
    v2->_pluginRegistry = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_apiRegistry = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
    v2->_pluginProtocols = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_pluginSearchDirectories = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v2;
}

- (void)dealloc
{
  __CFDictionary *apiRegistry;
  objc_super v4;

  apiRegistry = self->_apiRegistry;
  if (apiRegistry)
  {
    CFRelease(apiRegistry);
    self->_apiRegistry = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)PROLegacyPluginManager;
  -[PROLegacyPluginManager dealloc](&v4, sel_dealloc);
}

- (int)addPluginProtocol:(id)a3
{
  char *Name;

  if (!a3)
    return 7;
  Name = (char *)protocol_getName((Protocol *)a3);
  if ((-[NSMutableArray containsObject:](self->_pluginProtocols, "containsObject:", Name) & 1) == 0)
    -[NSMutableArray addObject:](self->_pluginProtocols, "addObject:", Name);

  return 0;
}

- (int)addPluginSearchDirectory:(id)a3
{
  if (!a3)
    return 7;
  -[NSMutableArray addObject:](self->_pluginSearchDirectories, "addObject:");
  return 0;
}

- (int)setPluginSearchDirectories:(id)a3
{
  if (!a3)
    return 7;
  if (!objc_msgSend(a3, "count"))
    return 8;
  -[NSMutableArray removeAllObjects](self->_pluginSearchDirectories, "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](self->_pluginSearchDirectories, "addObjectsFromArray:", a3);
  return 0;
}

- (int)setApiObject:(id)a3 forProtocol:(id)a4
{
  int result;
  const char *Name;

  result = 7;
  if (a3)
  {
    if (a4)
    {
      Name = protocol_getName((Protocol *)a4);
      CFDictionarySetValue(self->_apiRegistry, Name, a3);
      return 0;
    }
  }
  return result;
}

- (int)setApiObjects:(id)a3 forProtocols:(id)a4
{
  PROLegacyPluginManager *v4;
  uint64_t v7;
  unsigned int v8;
  const char *Name;

  v4 = self;
  LODWORD(self) = 7;
  if (a3)
  {
    if (a4)
    {
      self = (PROLegacyPluginManager *)objc_msgSend(a3, "count");
      if (self)
      {
        v7 = 0;
        v8 = 1;
        do
        {
          Name = protocol_getName((Protocol *)objc_msgSend(a4, "objectAtIndex:", v7));
          CFDictionarySetValue(v4->_apiRegistry, Name, (const void *)objc_msgSend(a3, "objectAtIndex:", v7));
          v7 = v8;
        }
        while (objc_msgSend(a3, "count") > (unint64_t)v8++);
        LODWORD(self) = 0;
      }
    }
  }
  return (int)self;
}

- (id)apiForProtocol:(id)a3
{
  const char *Name;

  Name = protocol_getName((Protocol *)a3);
  return (id)CFDictionaryGetValue(self->_apiRegistry, Name);
}

- (int)removeApiForProtocol:(id)a3
{
  const char *Name;

  Name = protocol_getName((Protocol *)a3);
  if (!CFDictionaryGetValue(self->_apiRegistry, Name))
    return 15;
  CFDictionaryRemoveValue(self->_apiRegistry, Name);
  return 0;
}

- (void)localizeKey:(id)a3 withDefault:(id)a4 forPlugin:(id)a5 fromBundle:(id)a6
{
  void *v10;
  void *v11;
  int v12;
  id v13;
  char v14;
  uint64_t v15;

  v10 = (void *)objc_msgSend(a5, "objectForKey:");
  v11 = v10;
  if (v10 && (v12 = objc_msgSend(v10, "isEqual:", &stru_1E65EDDA0), v13 = v11, !v12)
    || a4 && (v14 = objc_msgSend(a4, "isEqual:", &stru_1E65EDDA0), v13 = a4, (v14 & 1) == 0))
  {
    v15 = objc_msgSend(a6, "localizedStringForKey:value:table:", v13, v13, 0);
    if ((void *)v15 != v11)
      objc_msgSend(a5, "setObject:forKey:", v15, a3);
  }
}

- (int)registerPluginWithDictionary:(id)a3 withClassName:(id)a4 withBundle:(id)a5 withProtocolName:(id)a6
{
  void *v11;
  void *v12;
  void *v14;

  v11 = (void *)-[NSMutableDictionary objectForKey:](self->_pluginRegistry, "objectForKey:", a6);
  if (v11)
  {
    v12 = v11;
    if (objc_msgSend(v11, "objectForKey:", a4))
    {
      printf("PROPluginManager: WARNING: Class name [%s] already registered. Processing bundle [%s]\n", (const char *)objc_msgSend(a4, "UTF8String"), (const char *)objc_msgSend((id)objc_msgSend(a5, "bundlePath"), "UTF8String"));
      return 3;
    }
  }
  else
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    -[NSMutableDictionary setObject:forKey:](self->_pluginRegistry, "setObject:forKey:", v12, a6);
  }
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
  -[PROLegacyPluginManager localizeKey:withDefault:forPlugin:fromBundle:](self, "localizeKey:withDefault:forPlugin:fromBundle:", CFSTR("groupName"), 0, v14, a5);
  -[PROLegacyPluginManager localizeKey:withDefault:forPlugin:fromBundle:](self, "localizeKey:withDefault:forPlugin:fromBundle:", CFSTR("displayName"), a4, v14, a5);
  -[PROLegacyPluginManager localizeKey:withDefault:forPlugin:fromBundle:](self, "localizeKey:withDefault:forPlugin:fromBundle:", CFSTR("infoString"), 0, v14, a5);
  -[PROLegacyPluginManager localizeKey:withDefault:forPlugin:fromBundle:](self, "localizeKey:withDefault:forPlugin:fromBundle:", CFSTR("helpURL"), 0, v14, a5);
  -[PROLegacyPluginManager localizeKey:withDefault:forPlugin:fromBundle:](self, "localizeKey:withDefault:forPlugin:fromBundle:", CFSTR("vendorName"), 0, v14, a5);
  objc_msgSend(v14, "setObject:forKey:", objc_msgSend(a5, "bundlePath"), CFSTR("bundlePath"));
  objc_msgSend(v12, "setObject:forKey:", v14, a4);
  return 0;
}

- (int)registerBundle:(id)a3 withPluginDictionaryList:(id)a4
{
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = objc_msgSend(a4, "count");
  if (v7)
  {
    v8 = 0;
    while (1)
    {
      v9 = (void *)objc_msgSend(a4, "objectAtIndex:", v8);
      if (v9)
      {
        v10 = v9;
        v11 = objc_msgSend(v9, "objectForKey:", CFSTR("className"));
        if (v11)
        {
          v12 = v11;
          v13 = objc_msgSend(v10, "objectForKey:", CFSTR("protocolName"));
          if (v13)
          {
            v14 = v13;
            LODWORD(v9) = -[NSMutableArray containsObject:](self->_pluginProtocols, "containsObject:", v13);
            if ((_DWORD)v9)
              LODWORD(v9) = -[PROLegacyPluginManager registerPluginWithDictionary:withClassName:withBundle:withProtocolName:](self, "registerPluginWithDictionary:withClassName:withBundle:withProtocolName:", v10, v12, a3, v14);
            goto LABEL_11;
          }
          objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "UTF8String");
          printf("PROPluginManager: ERROR: Missing [protocolName] entry for item [%d] in bundle [%s]\n");
        }
        else
        {
          objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "UTF8String");
          printf("PROPluginManager:  ERROR: Missing [className] entry for item [%d] in bundle [%s]\n");
        }
        LODWORD(v9) = 0;
      }
LABEL_11:
      if (++v8 >= v7 || (_DWORD)v9)
        return (int)v9;
    }
  }
  LODWORD(v9) = 0;
  return (int)v9;
}

- (int)registerBundleDynamic:(id)a3
{
  return 21;
}

- (int)loadPluginClass:(Class *)a3 withName:(id)a4 fromBundlePath:(id)a5
{
  void *v8;
  objc_class *v9;

  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", a5);
  if (v8)
  {
    objc_msgSend(v8, "load");
    v9 = NSClassFromString((NSString *)a4);
    *a3 = v9;
    if (v9)
      return 0;
    objc_msgSend(a4, "UTF8String");
    objc_msgSend(a5, "UTF8String");
    printf("PROPluginManager: ERROR: Class [%s]  not found in bundle [%s]\n");
  }
  else
  {
    objc_msgSend(a5, "UTF8String");
    printf("PROPluginManager: ERROR: Unable to open bundle [%s]\n");
  }
  return 5;
}

- (int)scanForPluginsInDirectory:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3)
  {
    v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "enumeratorAtPath:", a3);
    v6 = objc_msgSend(v5, "nextObject");
    if (v6)
    {
      v7 = (void *)v6;
      while (!objc_msgSend((id)objc_msgSend(v7, "pathExtension"), "isEqualToString:", CFSTR("bundle")))
      {
LABEL_15:
        v6 = objc_msgSend(v5, "nextObject");
        v7 = (void *)v6;
        if (!v6)
          return v6;
      }
      v8 = objc_msgSend(a3, "stringByAppendingPathComponent:", v7);
      v9 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v8);
      v10 = (void *)objc_msgSend(v9, "infoDictionary");
      v11 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("ProPlugPluginList"));
      v12 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("ProPlugDynamicRegistration"));
      if (v12)
      {
        if ((objc_msgSend(v12, "BOOLValue") & 1) == 0 && v11)
        {
          if (!objc_msgSend(v11, "count"))
            goto LABEL_14;
          goto LABEL_12;
        }
      }
      else if (v11 && objc_msgSend(v11, "count"))
      {
LABEL_12:
        -[PROLegacyPluginManager registerBundle:withPluginDictionaryList:](self, "registerBundle:withPluginDictionaryList:", v9, v11);
LABEL_14:
        objc_msgSend(v5, "skipDescendents");
        goto LABEL_15;
      }
      -[PROLegacyPluginManager registerBundleDynamic:](self, "registerBundleDynamic:", v9);
      goto LABEL_14;
    }
  }
  else
  {
    LODWORD(v6) = 7;
  }
  return v6;
}

- (int)getNumPluginsForProtocol:(id)a3
{
  void *v3;

  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_pluginRegistry, "objectForKey:", protocol_getName((Protocol *)a3));
  if (v3)
    LODWORD(v3) = objc_msgSend(v3, "count");
  return (int)v3;
}

- (int)getPluginDisplayNames:(id)a3 forProtocol:(id)a4
{
  PROLegacyPluginManager *v4;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = self;
  LODWORD(self) = 7;
  if (a3 && a4)
  {
    v6 = (void *)-[NSMutableDictionary objectForKey:](v4->_pluginRegistry, "objectForKey:", protocol_getName((Protocol *)a4));
    if (v6)
    {
      v7 = (void *)objc_msgSend(v6, "objectEnumerator");
      for (self = (PROLegacyPluginManager *)objc_msgSend(v7, "nextObject");
            self;
            self = (PROLegacyPluginManager *)objc_msgSend(v7, "nextObject"))
      {
        v8 = -[PROLegacyPluginManager objectForKey:](self, "objectForKey:", CFSTR("displayName"));
        if (v8)
          objc_msgSend(a3, "addObject:", v8);
      }
    }
    else
    {
      LODWORD(self) = 17;
    }
  }
  return (int)self;
}

- (int)getPluginClassNames:(id)a3 forProtocol:(id)a4
{
  PROLegacyPluginManager *v4;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = self;
  LODWORD(self) = 7;
  if (a3 && a4)
  {
    v6 = (void *)-[NSMutableDictionary objectForKey:](v4->_pluginRegistry, "objectForKey:", protocol_getName((Protocol *)a4));
    if (v6)
    {
      v7 = (void *)objc_msgSend(v6, "objectEnumerator");
      for (self = (PROLegacyPluginManager *)objc_msgSend(v7, "nextObject");
            self;
            self = (PROLegacyPluginManager *)objc_msgSend(v7, "nextObject"))
      {
        v8 = -[PROLegacyPluginManager objectForKey:](self, "objectForKey:", CFSTR("className"));
        if (v8)
          objc_msgSend(a3, "addObject:", v8);
      }
    }
    else
    {
      LODWORD(self) = 17;
    }
  }
  return (int)self;
}

- (int)getPluginGroupNames:(id)a3
{
  return -[PROLegacyPluginManager getPluginGroupNames:forProtocol:](self, "getPluginGroupNames:forProtocol:", a3, 0);
}

- (int)getPluginGroupNames:(id)a3 forProtocol:(id)a4
{
  void *i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *j;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  if (a3)
  {
    if (a4)
    {
      i = (void *)-[NSMutableDictionary objectForKey:](self->_pluginRegistry, "objectForKey:", protocol_getName((Protocol *)a4));
      if (i)
      {
        v6 = (void *)objc_msgSend(i, "objectEnumerator");
        for (i = (void *)objc_msgSend(v6, "nextObject"); i; i = (void *)objc_msgSend(v6, "nextObject"))
        {
          v7 = objc_msgSend(i, "objectForKey:", CFSTR("groupName"));
          if (v7)
          {
            v8 = v7;
            if ((objc_msgSend(a3, "containsObject:", v7) & 1) == 0)
              objc_msgSend(a3, "addObject:", v8);
          }
        }
      }
    }
    else
    {
      v9 = (void *)-[NSMutableDictionary objectEnumerator](self->_pluginRegistry, "objectEnumerator");
      for (i = (void *)objc_msgSend(v9, "nextObject"); i; i = (void *)objc_msgSend(v9, "nextObject"))
      {
        v10 = (void *)objc_msgSend(i, "objectEnumerator");
        for (j = v10; ; v10 = j)
        {
          v12 = (void *)objc_msgSend(v10, "nextObject");
          if (!v12)
            break;
          v13 = objc_msgSend(v12, "objectForKey:", CFSTR("groupName"));
          if (v13)
          {
            v14 = v13;
            if ((objc_msgSend(a3, "containsObject:", v13) & 1) == 0)
              objc_msgSend(a3, "addObject:", v14);
          }
        }
      }
    }
  }
  else
  {
    LODWORD(i) = 7;
  }
  return (int)i;
}

- (int)getPluginClassNames:(id)a3 forGroupName:(id)a4
{
  return -[PROLegacyPluginManager getPluginClassNames:forGroupName:](self, "getPluginClassNames:forGroupName:", a3, 0);
}

- (int)getPluginClassNames:(id)a3 forGroupName:(id)a4 forProtocol:(id)a5
{
  void *i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  if (!a3)
  {
    LODWORD(i) = 7;
    return (int)i;
  }
  if (a5)
  {
    i = (void *)-[NSMutableDictionary objectForKey:](self->_pluginRegistry, "objectForKey:", protocol_getName((Protocol *)a5));
    if (!i)
      return (int)i;
    v8 = (void *)objc_msgSend(i, "objectEnumerator");
    v9 = objc_msgSend(v8, "nextObject");
    v10 = (void *)v9;
    if (a4)
    {
      if (v9)
      {
        do
        {
          v11 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("groupName"));
          if (v11 && objc_msgSend(v11, "isEqualToString:", a4))
            objc_msgSend(a3, "addObject:", objc_msgSend(v10, "objectForKey:", CFSTR("className")));
          i = (void *)objc_msgSend(v8, "nextObject");
          v10 = i;
        }
        while (i);
        return (int)i;
      }
LABEL_31:
      LODWORD(i) = 0;
      return (int)i;
    }
    if (!v9)
      goto LABEL_31;
    do
    {
      if (!objc_msgSend(v10, "objectForKey:", CFSTR("groupName")))
        objc_msgSend(a3, "addObject:", objc_msgSend(v10, "objectForKey:", CFSTR("className")));
      i = (void *)objc_msgSend(v8, "nextObject");
      v10 = i;
    }
    while (i);
  }
  else
  {
    v12 = (void *)-[NSMutableDictionary objectEnumerator](self->_pluginRegistry, "objectEnumerator");
    for (i = (void *)objc_msgSend(v12, "nextObject"); i; i = (void *)objc_msgSend(v12, "nextObject"))
    {
      v13 = (void *)objc_msgSend(i, "objectEnumerator");
      v14 = objc_msgSend(v13, "nextObject");
      v15 = (void *)v14;
      if (a4)
      {
        if (v14)
        {
          do
          {
            v16 = (void *)objc_msgSend(v15, "objectForKey:", CFSTR("groupName"));
            if (v16 && objc_msgSend(v16, "isEqualToString:", a4))
              objc_msgSend(a3, "addObject:", objc_msgSend(v15, "objectForKey:", CFSTR("className")));
            v15 = (void *)objc_msgSend(v13, "nextObject");
          }
          while (v15);
        }
      }
      else if (v14)
      {
        do
        {
          if (!objc_msgSend(v15, "objectForKey:", CFSTR("groupName")))
            objc_msgSend(a3, "addObject:", objc_msgSend(v15, "objectForKey:", CFSTR("className")));
          v15 = (void *)objc_msgSend(v13, "nextObject");
        }
        while (v15);
      }
    }
  }
  return (int)i;
}

- (int)getPluginDisplayNames:(id)a3 forGroupName:(id)a4
{
  return -[PROLegacyPluginManager getPluginDisplayNames:forGroupName:forProtocol:](self, "getPluginDisplayNames:forGroupName:forProtocol:", a3, a4, 0);
}

- (int)getPluginDisplayNames:(id)a3 forGroupName:(id)a4 forProtocol:(id)a5
{
  PROLegacyPluginManager *v5;
  void *v8;
  PROLegacyPluginManager *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = self;
  LODWORD(self) = 7;
  if (a3 && a4)
  {
    if (a5)
    {
      self = (PROLegacyPluginManager *)-[NSMutableDictionary objectForKey:](v5->_pluginRegistry, "objectForKey:", protocol_getName((Protocol *)a5));
      if (self)
      {
        v8 = (void *)-[PROLegacyPluginManager objectEnumerator](self, "objectEnumerator");
        self = (PROLegacyPluginManager *)objc_msgSend(v8, "nextObject");
        if (self)
        {
          v9 = self;
          do
          {
            v10 = (void *)-[PROLegacyPluginManager objectForKey:](v9, "objectForKey:", CFSTR("groupName"));
            if (v10 && objc_msgSend(v10, "isEqualToString:", a4))
              objc_msgSend(a3, "addObject:", -[PROLegacyPluginManager objectForKey:](v9, "objectForKey:", CFSTR("displayName")));
            self = (PROLegacyPluginManager *)objc_msgSend(v8, "nextObject");
            v9 = self;
          }
          while (self);
        }
      }
    }
    else
    {
      v11 = (void *)-[NSMutableDictionary objectEnumerator](v5->_pluginRegistry, "objectEnumerator");
      for (self = (PROLegacyPluginManager *)objc_msgSend(v11, "nextObject");
            self;
            self = (PROLegacyPluginManager *)objc_msgSend(v11, "nextObject"))
      {
        v12 = (void *)-[PROLegacyPluginManager objectEnumerator](self, "objectEnumerator");
        v13 = objc_msgSend(v12, "nextObject");
        if (v13)
        {
          v14 = (void *)v13;
          do
          {
            v15 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("groupName"));
            if (v15 && objc_msgSend(v15, "isEqualToString:", a4))
              objc_msgSend(a3, "addObject:", objc_msgSend(v14, "objectForKey:", CFSTR("displayName")));
            v14 = (void *)objc_msgSend(v12, "nextObject");
          }
          while (v14);
        }
      }
    }
  }
  return (int)self;
}

- (int)getPluginInfoDictionaries:(id)a3 forProtocol:(id)a4
{
  PROLegacyPluginManager *v4;
  void *v6;
  void *v7;
  PROLegacyPluginManager *v8;

  v4 = self;
  LODWORD(self) = 7;
  if (a3 && a4)
  {
    v6 = (void *)-[NSMutableDictionary objectForKey:](v4->_pluginRegistry, "objectForKey:", protocol_getName((Protocol *)a4));
    if (v6)
    {
      v7 = (void *)objc_msgSend(v6, "objectEnumerator");
      self = (PROLegacyPluginManager *)objc_msgSend(v7, "nextObject");
      if (self)
      {
        v8 = self;
        do
        {
          objc_msgSend(a3, "addObject:", v8);
          self = (PROLegacyPluginManager *)objc_msgSend(v7, "nextObject");
          v8 = self;
        }
        while (self);
      }
    }
    else
    {
      LODWORD(self) = 17;
    }
  }
  return (int)self;
}

- (int)getBundlePath:(id *)a3 forPluginClassName:(id)a4
{
  int result;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  result = 7;
  if (a3 && a4)
  {
    v8 = (void *)-[NSMutableDictionary objectEnumerator](self->_pluginRegistry, "objectEnumerator");
    v9 = objc_msgSend(v8, "nextObject");
    if (v9)
    {
      v10 = (void *)v9;
      do
      {
        v11 = (void *)objc_msgSend(v10, "objectEnumerator");
        while (1)
        {
          v12 = (void *)objc_msgSend(v11, "nextObject");
          if (!v12)
            break;
          v13 = v12;
          if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("className")), "isEqualToString:", a4))
          {
            v14 = (void *)objc_msgSend(v13, "objectForKey:", CFSTR("bundlePath"));
            result = 0;
            *a3 = v14;
            return result;
          }
        }
        v10 = (void *)objc_msgSend(v8, "nextObject");
        result = 16;
      }
      while (v10);
    }
    else
    {
      return 16;
    }
  }
  return result;
}

- (int)getPluginClass:(Class *)a3 forPluginClassName:(id)a4
{
  int result;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  result = 7;
  if (a3 && a4)
  {
    v8 = NSClassFromString((NSString *)a4);
    *a3 = v8;
    if (v8)
    {
      return 0;
    }
    else
    {
      v9 = (void *)-[NSMutableDictionary objectEnumerator](self->_pluginRegistry, "objectEnumerator");
      v10 = objc_msgSend(v9, "nextObject");
      if (v10)
      {
        v11 = (void *)v10;
        do
        {
          v12 = (void *)objc_msgSend(v11, "objectEnumerator");
          while (1)
          {
            v13 = (void *)objc_msgSend(v12, "nextObject");
            if (!v13)
              break;
            v14 = v13;
            if (objc_msgSend((id)objc_msgSend(v13, "objectForKey:", CFSTR("className")), "isEqualToString:", a4))return -[PROLegacyPluginManager loadPluginClass:withName:fromBundlePath:](self, "loadPluginClass:withName:fromBundlePath:", a3, a4, objc_msgSend(v14, "objectForKey:", CFSTR("bundlePath")));
          }
          v11 = (void *)objc_msgSend(v9, "nextObject");
          result = 16;
        }
        while (v11);
      }
      else
      {
        return 16;
      }
    }
  }
  return result;
}

- (int)getPluginClass:(Class *)a3 forPluginDisplayName:(id)a4
{
  int result;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  objc_class *v15;

  result = 7;
  if (a3 && a4)
  {
    v8 = (void *)-[NSMutableDictionary objectEnumerator](self->_pluginRegistry, "objectEnumerator");
    v9 = objc_msgSend(v8, "nextObject");
    if (v9)
    {
      v10 = (void *)v9;
      while (2)
      {
        v11 = (void *)objc_msgSend(v10, "objectEnumerator");
        while (1)
        {
          v12 = (void *)objc_msgSend(v11, "nextObject");
          if (!v12)
            break;
          v13 = v12;
          if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("displayName")), "isEqualToString:", a4))
          {
            v14 = (NSString *)objc_msgSend(v13, "objectForKey:", CFSTR("className"));
            v15 = NSClassFromString(v14);
            *a3 = v15;
            if (v15)
              return 0;
            else
              return -[PROLegacyPluginManager loadPluginClass:withName:fromBundlePath:](self, "loadPluginClass:withName:fromBundlePath:", a3, v14, objc_msgSend(v13, "objectForKey:", CFSTR("bundlePath")));
          }
        }
        v10 = (void *)objc_msgSend(v8, "nextObject");
        result = 16;
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      return 16;
    }
  }
  return result;
}

- (int)getPluginClass:(Class *)a3 forPluginDisplayName:(id)a4 forProtocol:(id)a5
{
  int result;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  objc_class *v14;

  result = 7;
  if (a3 && a4 && a5)
  {
    v9 = (void *)-[NSMutableDictionary objectForKey:](self->_pluginRegistry, "objectForKey:", protocol_getName((Protocol *)a5));
    if (v9)
    {
      v10 = (void *)objc_msgSend(v9, "objectEnumerator");
      v11 = objc_msgSend(v10, "nextObject");
      if (v11)
      {
        v12 = (void *)v11;
        while (1)
        {
          if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("displayName")), "isEqualToString:", a4))
          {
            v13 = (NSString *)objc_msgSend(v12, "objectForKey:", CFSTR("className"));
            v14 = NSClassFromString(v13);
            *a3 = v14;
            if (v14)
              break;
          }
          v12 = (void *)objc_msgSend(v10, "nextObject");
          if (!v12)
            return 16;
        }
        return -[PROLegacyPluginManager loadPluginClass:withName:fromBundlePath:](self, "loadPluginClass:withName:fromBundlePath:", a3, v13, objc_msgSend(v12, "objectForKey:", CFSTR("bundlePath")));
      }
      else
      {
        return 16;
      }
    }
    else
    {
      return 17;
    }
  }
  return result;
}

@end
