@implementation PROConcretePlugInManager

- (PROConcretePlugInManager)init
{
  PROConcretePlugInManager *v2;
  PROConcretePlugInManager *v3;
  uint64_t v4;
  NSEnumerator *v5;
  id i;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PROConcretePlugInManager;
  v2 = -[PROConcretePlugInManager init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = -[PROConcretePlugInManager zone](v2, "zone");
    v3->protocols = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", v4), "init");
    v3->groupsDictionary = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", v4), "init");
    v3->bundlesDictionary = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", v4), "init");
    v3->uuids = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", v4), "init");
    v3->classesDictionary = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", v4), "init");
    v3->plugIns = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", v4), "init");
    v3->api = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", v4), "init");
    v3->apiLock = -[PROReadWriteLock init](+[PROReadWriteLock allocWithZone:](PROReadWriteLock, "allocWithZone:", v4), "init");
    v3->plugInSearchDirectories = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", v4), "init");
    v3->deferredPluginBundles = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", v4), "init");
    v3->blockedLibraryPlugins = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->blockedDocumentPlugins = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->mutex = (NSRecursiveLock *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38E0], "allocWithZone:", v4), "init");
    v5 = -[NSArray objectEnumerator](NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 0xFFFFuLL, 1), "objectEnumerator");
    for (i = -[NSEnumerator nextObject](v5, "nextObject"); i; i = -[NSEnumerator nextObject](v5, "nextObject"))
      -[PROConcretePlugInManager addPlugInSearchDirectory:](v3, "addPlugInSearchDirectory:", objc_msgSend(i, "stringByAppendingPathComponent:", CFSTR("Application Support/Plug-ins/ProPlug")));
    -[PROConcretePlugInManager addPlugInSearchDirectory:](v3, "addPlugInSearchDirectory:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "builtInPlugInsPath"), "stringByAppendingPathComponent:", CFSTR("ProPlug")));
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NSRecursiveLock lock](self->mutex, "lock");

  -[PROReadWriteLock lock](self->apiLock, "lock");
  v3.receiver = self;
  v3.super_class = (Class)PROConcretePlugInManager;
  -[PROConcretePlugInManager dealloc](&v3, sel_dealloc);
}

- (BOOL)requiresProtocolsToBePresentWhenLoading
{
  return (*(_BYTE *)&self->managerFlags >> 5) & 1;
}

- (void)setRequiresProtocolsToBePresentWhenLoading:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->managerFlags = *(_BYTE *)&self->managerFlags & 0xDF | v3;
}

- (id)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  char v4;
  char v5;
  char v6;
  char v7;

  self->delegate = a3;
  *(_BYTE *)&self->managerFlags = *(_BYTE *)&self->managerFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = 2;
  else
    v4 = 0;
  *(_BYTE *)&self->managerFlags = *(_BYTE *)&self->managerFlags & 0xFD | v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 4;
  else
    v5 = 0;
  *(_BYTE *)&self->managerFlags = *(_BYTE *)&self->managerFlags & 0xFB | v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 8;
  else
    v6 = 0;
  *(_BYTE *)&self->managerFlags = *(_BYTE *)&self->managerFlags & 0xF7 | v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 16;
  else
    v7 = 0;
  *(_BYTE *)&self->managerFlags = *(_BYTE *)&self->managerFlags & 0xEF | v7;
}

- (void)reportError:(id)a3
{
  if ((*(_BYTE *)&self->managerFlags & 1) != 0)
    objc_msgSend(self->delegate, "plugInManager:didError:", self, a3);
}

- (BOOL)shouldLoadBundle:(id)a3
{
  if (-[NSMutableDictionary objectForKey:](self->bundlesDictionary, "objectForKey:", objc_msgSend(a3, "bundleIdentifier")))
  {
    return 0;
  }
  if ((*(_BYTE *)&self->managerFlags & 4) != 0)
    return objc_msgSend(self->delegate, "plugInManager:shouldLoadBundle:", self, a3);
  return 1;
}

- (BOOL)shouldLoadPlugIn:(id)a3
{
  if (-[NSMutableDictionary objectForKey:](self->uuids, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", objc_msgSend(a3, "uuid"))))
  {
    return 0;
  }
  if ((*(_BYTE *)&self->managerFlags & 8) != 0)
    return objc_msgSend(self->delegate, "plugInManager:shouldLoadPlugIn:", self, a3);
  return 1;
}

- (void)addPlugInSearchDirectory:(id)a3
{
  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil argument '%s' to method '%@'"), "plugInSearchDirectory", NSStringFromSelector(a2));
  -[NSRecursiveLock lock](self->mutex, "lock");
  if ((-[NSMutableArray containsObject:](self->plugInSearchDirectories, "containsObject:", a3) & 1) == 0)
    objc_msgSend((id)-[PROConcretePlugInManager mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("plugInSearchDirectories")), "addObject:", a3);
  -[NSRecursiveLock unlock](self->mutex, "unlock");
}

- (void)setPlugInSearchDirectories:(id)a3
{
  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil argument '%s' to method '%@'"), "searchDirectories", NSStringFromSelector(a2));
  -[NSRecursiveLock lock](self->mutex, "lock");
  -[PROConcretePlugInManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("plugInSearchDirectories"));
  -[NSMutableArray setArray:](self->plugInSearchDirectories, "setArray:", a3);
  -[PROConcretePlugInManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("plugInSearchDirectories"));
  -[NSRecursiveLock unlock](self->mutex, "unlock");
}

- (void)insertObject:(id)a3 inPlugInSearchDirectoriesAtIndex:(unsigned int)a4
{
  -[NSRecursiveLock lock](self->mutex, "lock");
  -[NSMutableArray insertObject:atIndex:](self->plugInSearchDirectories, "insertObject:atIndex:", a3, a4);
  -[NSRecursiveLock unlock](self->mutex, "unlock");
}

- (void)removeObjectFromPlugInSearchDirectoriesAtIndex:(unsigned int)a3
{
  -[NSRecursiveLock lock](self->mutex, "lock");
  -[NSMutableArray removeObjectAtIndex:](self->plugInSearchDirectories, "removeObjectAtIndex:", a3);
  -[NSRecursiveLock unlock](self->mutex, "unlock");
}

- (id)plugInSearchDirectories
{
  void *v3;

  -[NSRecursiveLock lock](self->mutex, "lock");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->plugInSearchDirectories);
  -[NSRecursiveLock unlock](self->mutex, "unlock");
  return v3;
}

- (void)removeAllPlugIns
{
  -[NSRecursiveLock lock](self->mutex, "lock");
  -[NSMutableDictionary removeAllObjects](self->protocols, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->groupsDictionary, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->uuids, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->classesDictionary, "removeAllObjects");
  -[PROConcretePlugInManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bundles"));
  -[NSMutableDictionary removeAllObjects](self->bundlesDictionary, "removeAllObjects");
  -[PROConcretePlugInManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bundles"));
  objc_msgSend((id)-[PROConcretePlugInManager mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("plugIns")), "removeAllObjects");
  -[NSRecursiveLock unlock](self->mutex, "unlock");
}

- (void)addPlugIn:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  -[NSMutableDictionary setObject:forKey:](self->uuids, "setObject:forKey:", a3, objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", objc_msgSend(a3, "uuid")));
  -[NSMutableDictionary setObject:forKey:](self->classesDictionary, "setObject:forKey:", a3, objc_msgSend(a3, "className"));
  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "implementedProtocols"), "objectEnumerator");
  v6 = objc_msgSend(v5, "nextObject");
  if (v6)
  {
    v7 = v6;
    do
    {
      -[NSMutableDictionary addObject:toSetForKey:](self->protocols, "addObject:toSetForKey:", a3, v7);
      v7 = objc_msgSend(v5, "nextObject");
    }
    while (v7);
  }
  objc_msgSend((id)-[PROConcretePlugInManager mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("plugIns"), v7), "addObject:", a3);
  if ((*(_BYTE *)&self->managerFlags & 0x10) != 0)
    objc_msgSend(self->delegate, "plugInManager:didLoadPlugIn:", self, a3);
}

- (void)addDeferredPluginBundle:(id)a3
{
  -[NSRecursiveLock lock](self->mutex, "lock");
  -[NSMutableArray addObject:](self->deferredPluginBundles, "addObject:", a3);
  -[NSRecursiveLock unlock](self->mutex, "unlock");
}

- (id)deferredPluginKitPlugs
{
  return 0;
}

- (void)loadDeferredPlugins
{
  NSMutableArray *deferredPluginBundles;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->mutex, "lock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  deferredPluginBundles = self->deferredPluginBundles;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deferredPluginBundles, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(deferredPluginBundles);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "loadDeferredPlugins");
        -[PROConcretePlugInManager finishPluginSetupForBundle:handler:](self, "finishPluginSetupForBundle:handler:", objc_msgSend(v8, "getBundle"), v8);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deferredPluginBundles, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  self->deferredPluginBundles = 0;
  -[NSRecursiveLock unlock](self->mutex, "unlock");
}

- (BOOL)bundleIsDeferred:(id)a3
{
  unint64_t v5;
  id v6;
  BOOL v7;

  -[NSRecursiveLock lock](self->mutex, "lock");
  if (-[NSMutableArray count](self->deferredPluginBundles, "count"))
  {
    v5 = 1;
    do
    {
      v6 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->deferredPluginBundles, "objectAtIndexedSubscript:", v5 - 1), "getBundle");
      v7 = v6 == a3;
    }
    while (v5++ < -[NSMutableArray count](self->deferredPluginBundles, "count") && v6 != a3);
  }
  else
  {
    v7 = 0;
  }
  -[NSRecursiveLock unlock](self->mutex, "unlock");
  return v7;
}

- (void)removeDeferredPluginBundle:(id)a3
{
  NSMutableArray *deferredPluginBundles;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->mutex, "lock");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  deferredPluginBundles = self->deferredPluginBundles;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deferredPluginBundles, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(deferredPluginBundles);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((id)objc_msgSend(v11, "getBundle") == a3)
          v8 = v11;
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deferredPluginBundles, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
    if (v8)
      -[NSMutableArray removeObject:](self->deferredPluginBundles, "removeObject:", v8);
  }
  -[NSRecursiveLock unlock](self->mutex, "unlock");
}

- (void)removePlugin:(id)a3
{
  -[NSRecursiveLock lock](self->mutex, "lock");
  objc_msgSend((id)-[PROConcretePlugInManager mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("plugIns")), "removeObject:", a3);
  -[NSRecursiveLock unlock](self->mutex, "unlock");
}

- (void)addLibraryBlockedPlugin:(id)a3 bundleName:(id)a4 pluginName:(id)a5 version:(id)a6
{
  id v8;

  v8 = -[BlockedPlugin init:plugName:plugVersion:]([BlockedPlugin alloc], "init:plugName:plugVersion:", a4, a5, a6);
  -[NSMutableDictionary setObject:forKey:](self->blockedLibraryPlugins, "setObject:forKey:", v8, objc_msgSend(a3, "blockedLookupKey"));

}

- (void)addDocumentBlockedPlugin:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "bundle"), "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName"));
  if (!v5 || (v6 = (uint64_t)v5, objc_msgSend(v5, "isEqualToString:", &stru_1E65EDDA0)))
    v6 = objc_msgSend((id)objc_msgSend(a3, "bundle"), "objectForInfoDictionaryKey:", CFSTR("CFBundleName"));
  v7 = objc_msgSend((id)objc_msgSend(a3, "bundle"), "localizedStringForKey:value:table:", v6, v6, 0);
  v8 = objc_msgSend((id)objc_msgSend(a3, "infoDictionary"), "valueForKey:", CFSTR("displayName"));
  v9 = objc_msgSend((id)objc_msgSend(a3, "bundle"), "localizedStringForKey:value:table:", v8, v8, 0);
  v10 = objc_msgSend((id)objc_msgSend(a3, "bundle"), "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "bundle"), "bundleIdentifier"), "isEqualToString:", CFSTR("com.absoft.NeatVideo FC")))v10 = objc_msgSend((id)objc_msgSend(a3, "bundle"), "objectForInfoDictionaryKey:", CFSTR("CFBundleVersion"));
  v11 = -[BlockedPlugin init:plugName:plugVersion:]([BlockedPlugin alloc], "init:plugName:plugVersion:", v7, v9, v10);
  -[NSMutableDictionary setObject:forKey:](self->blockedDocumentPlugins, "setObject:forKey:", v11, objc_msgSend(a3, "blockedLookupKey"));

}

- (id)newBlockPluginList:(__CFString *)a3
{
  return 0;
}

- (id)sanitizePluginVersionString:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" ")), "objectAtIndexedSubscript:", 0);
}

- (BOOL)checkPluginVersionAgainstBlockList:(id)a3 blockDict:(id)a4
{
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL result;

  v6 = -[PROConcretePlugInManager sanitizePluginVersionString:](self, "sanitizePluginVersionString:", objc_msgSend((id)objc_msgSend(a3, "bundle"), "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString")));
  v7 = objc_msgSend((id)objc_msgSend(a4, "valueForKey:", CFSTR("Range Block")), "BOOLValue");
  v8 = objc_msgSend(a4, "valueForKey:", CFSTR("Version Upper Limit"));
  if (!v7)
    return (unint64_t)(objc_msgSend(v6, "compare:options:", v8, 64) - 1) > 0xFFFFFFFFFFFFFFFDLL;
  v9 = objc_msgSend(a4, "valueForKey:", CFSTR("Version Lower Limit"));
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "bundle"), "bundleIdentifier"), "isEqualToString:", CFSTR("com.absoft.NeatVideo FC")))v6 = (id)objc_msgSend((id)objc_msgSend(a3, "bundle"), "objectForInfoDictionaryKey:", CFSTR("CFBundleVersion"));
  v10 = objc_msgSend(v6, "compare:options:", v8, 64);
  v11 = objc_msgSend(v6, "compare:options:", v9, 64);
  v12 = v11;
  if (v10 == -1 && v11 == 1)
    return 1;
  result = 1;
  if (v10 && v12)
    return 0;
  return result;
}

- (BOOL)checkIfShouldBlockPlugin:(id)a3 returnPluginDictionary:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  char v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id *v28;
  const __CFAllocator *alloc;
  id obj;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
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
  _QWORD block[5];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PROConcretePlugInManager_checkIfShouldBlockPlugin_returnPluginDictionary___block_invoke;
  block[3] = &unk_1E64DFA00;
  block[4] = self;
  if (checkIfShouldBlockPlugin_returnPluginDictionary__loadBlockList != -1)
    dispatch_once(&checkIfShouldBlockPlugin_returnPluginDictionary__loadBlockList, block);
  if (checkIfShouldBlockPlugin_returnPluginDictionary__pluginList)
  {
    v7 = (void *)objc_msgSend(a3, "infoDictionary");
    v8 = (void *)objc_msgSend((id)objc_msgSend(a3, "bundle"), "bundleIdentifier");
    v9 = (void *)objc_msgSend(v7, "valueForKey:", CFSTR("displayName"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = (id)checkIfShouldBlockPlugin_returnPluginDictionary__pluginList;
    v10 = objc_msgSend((id)checkIfShouldBlockPlugin_returnPluginDictionary__pluginList, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    v31 = v10;
    if (v10)
    {
      v28 = a4;
      v32 = *(_QWORD *)v42;
      alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v42 != v32)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
          if (objc_msgSend((id)objc_msgSend(v12, "valueForKey:", CFSTR("Block Type")), "isEqualToString:", CFSTR("UUID")))
          {
            v13 = (__CFString *)CFUUIDCreateString(alloc, (CFUUIDRef)objc_msgSend(a3, "uuid"));
            v14 = objc_msgSend((id)objc_msgSend(v12, "valueForKey:", CFSTR("UUID")), "isEqualToString:", v13);

            if ((v14 & 1) != 0)
              goto LABEL_36;
          }
          else
          {
            v15 = objc_msgSend((id)objc_msgSend(v12, "valueForKey:", CFSTR("Bundle Block")), "BOOLValue");
            v16 = (void *)objc_msgSend(v12, "valueForKey:", CFSTR("Name"));
            v17 = v16;
            if (v15)
            {
              v39 = 0uLL;
              v40 = 0uLL;
              v37 = 0uLL;
              v38 = 0uLL;
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
              if (v18)
              {
                v19 = v18;
                v20 = *(_QWORD *)v38;
LABEL_16:
                v21 = 0;
                while (1)
                {
                  if (*(_QWORD *)v38 != v20)
                    objc_enumerationMutation(v17);
                  if (objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v21))
                    && -[PROConcretePlugInManager checkPluginVersionAgainstBlockList:blockDict:](self, "checkPluginVersionAgainstBlockList:blockDict:", a3, v12))
                  {
                    break;
                  }
                  if (v19 == ++v21)
                  {
                    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
                    if (v19)
                      goto LABEL_16;
                    goto LABEL_11;
                  }
                }
LABEL_36:
                *v28 = v12;
                LOBYTE(v10) = 1;
                return v10;
              }
            }
            else
            {
              v35 = 0uLL;
              v36 = 0uLL;
              v33 = 0uLL;
              v34 = 0uLL;
              v22 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v34;
LABEL_26:
                v25 = 0;
                while (1)
                {
                  if (*(_QWORD *)v34 != v24)
                    objc_enumerationMutation(v17);
                  if (objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v25))
                    && -[PROConcretePlugInManager checkPluginVersionAgainstBlockList:blockDict:](self, "checkPluginVersionAgainstBlockList:blockDict:", a3, v12))
                  {
                    goto LABEL_36;
                  }
                  if (v23 == ++v25)
                  {
                    v23 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
                    if (v23)
                      goto LABEL_26;
                    break;
                  }
                }
              }
            }
          }
LABEL_11:
          ++v11;
        }
        while (v11 != v31);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
        LOBYTE(v10) = 0;
        v31 = v26;
        if (v26)
          continue;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

uint64_t __76__PROConcretePlugInManager_checkIfShouldBlockPlugin_returnPluginDictionary___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "newBlockPluginList:", CFSTR("6B9D8D3C-D3BF-4276-828F-2212D24B11CE"));
  checkIfShouldBlockPlugin_returnPluginDictionary__pluginList = result;
  return result;
}

- (void)getNameOverrides:(id)a3 pluginName:(id *)a4 bundleName:(id *)a5
{
  void *v8;
  void *v9;

  v8 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("Name Override"));
  v9 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("Bundle Name Override"));
  if (v8 && (objc_msgSend(v8, "isEqualToString:", &stru_1E65EDDA0) & 1) == 0)
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v8);
  if (v9)
  {
    if ((objc_msgSend(v9, "isEqualToString:", &stru_1E65EDDA0) & 1) == 0)
      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v9);
  }
}

- (void)removeAllBlockedDocumentPlugins
{
  -[NSMutableDictionary removeAllObjects](self->blockedDocumentPlugins, "removeAllObjects");
}

- (void)mergeGroupsDictionaryWith:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = (id)objc_msgSend(a3, "mutableCopy");
  v5 = (void *)objc_msgSend(a3, "keyEnumerator");
  v6 = objc_msgSend(v5, "nextObject");
  if (v6)
  {
    v7 = v6;
    do
    {
      v8 = -[NSMutableDictionary objectForKey:](self->groupsDictionary, "objectForKey:", v7);
      if (v8)
      {
        v9 = (void *)v8;
        v10 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", v7), "plugIns"), "objectEnumerator");
        v11 = objc_msgSend(v10, "nextObject");
        if (v11)
        {
          v12 = v11;
          do
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v9, "addPlugIn:", v12);
            v12 = objc_msgSend(v10, "nextObject");
          }
          while (v12);
        }
        objc_msgSend(v13, "removeObjectForKey:", v7);
      }
      v7 = objc_msgSend(v5, "nextObject");
    }
    while (v7);
  }
  -[NSMutableDictionary addEntriesFromDictionary:](self->groupsDictionary, "addEntriesFromDictionary:", v13);

}

- (void)finishPluginSetupForBundle:(id)a3 handler:(id)a4
{
  -[NSRecursiveLock lock](self->mutex, "lock");
  if (objc_msgSend((id)objc_msgSend(a4, "plugIns"), "count"))
    -[PROConcretePlugInManager mergeGroupsDictionaryWith:](self, "mergeGroupsDictionaryWith:", objc_msgSend(a4, "groupsDictionary"));
  if (a4)
  {
    -[PROConcretePlugInManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bundles"));
    -[NSMutableDictionary setObject:forKey:](self->bundlesDictionary, "setObject:forKey:", a4, objc_msgSend(a3, "bundleIdentifier"));
    -[PROConcretePlugInManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bundles"));
  }
  -[NSRecursiveLock unlock](self->mutex, "unlock");
}

- (void)scanForPlugInsInBundleHelper:(id)a3 zone:(_NSZone *)a4 withPluginKitPlugIn:(id)a5 deferralNotification:(id)a6
{
  -[PROConcretePlugInManager scanForPlugInsInBundleHelper:zone:withPluginKitPlugIn:actuallyLoad:deferralNotification:](self, "scanForPlugInsInBundleHelper:zone:withPluginKitPlugIn:actuallyLoad:deferralNotification:", a3, a4, a5, 1, a6);
}

- (void)scanForPlugInsInBundleHelper:(id)a3 zone:(_NSZone *)a4 withPluginKitPlugIn:(id)a5 actuallyLoad:(BOOL)a6 deferralNotification:(id)a7
{
  _BOOL8 v8;
  PROBundleHandler *v11;

  v8 = a6;
  v11 = -[PROBundleHandler initWithBundle:actuallyLoad:](+[PROBundleHandler allocWithZone:](PROBundleHandler, "allocWithZone:", a4), "initWithBundle:actuallyLoad:", a3, a6);
  -[PROBundleHandler setDelegate:](v11, "setDelegate:", self);
  -[PROBundleHandler setAPIManager:](v11, "setAPIManager:", self);
  -[PROBundleHandler registerAndLoadPlugIns:](v11, "registerAndLoadPlugIns:", v8);
  -[PROBundleHandler setRegistrationCallbackObject:](v11, "setRegistrationCallbackObject:", self);
  -[PROBundleHandler setDeferralNotification:](v11, "setDeferralNotification:", a7);
  -[PROConcretePlugInManager finishPluginSetupForBundle:handler:](self, "finishPluginSetupForBundle:handler:", a3, v11);

}

- (void)scanForPlugInsInDirectory:(id)a3 deferralNotification:(id)a4
{
  -[PROConcretePlugInManager scanForPlugInsInDirectory:actuallyLoad:deferralNotification:](self, "scanForPlugInsInDirectory:actuallyLoad:deferralNotification:", a3, 1, a4);
}

- (void)scanForPlugInsInDirectory:(id)a3 actuallyLoad:(BOOL)a4 deferralNotification:(id)a5
{
  _BOOL8 v5;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil argument '%s' to method '%@'"), "directoryPath", NSStringFromSelector(a2));
  v13 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "enumeratorAtPath:", a3);
  v9 = -[PROConcretePlugInManager zone](self, "zone");
  -[NSRecursiveLock lock](self->mutex, "lock");
  v10 = objc_msgSend(v8, "nextObject");
  if (v10)
  {
    v11 = (void *)v10;
    do
    {
      if ((objc_msgSend(v11, "hasPrefix:", CFSTR(".")) & 1) == 0)
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", objc_msgSend((id)objc_msgSend(a3, "stringByAppendingPathComponent:", v11), "stringByResolvingSymlinksInPath"));
        if (objc_msgSend(v12, "bundleIdentifier")
          && -[PROConcretePlugInManager shouldLoadBundle:](self, "shouldLoadBundle:", v12))
        {
          -[PROConcretePlugInManager scanForPlugInsInBundleHelper:zone:withPluginKitPlugIn:actuallyLoad:deferralNotification:](self, "scanForPlugInsInBundleHelper:zone:withPluginKitPlugIn:actuallyLoad:deferralNotification:", v12, v9, 0, v5, a5);
          objc_msgSend(v8, "skipDescendents");
        }

      }
      v11 = (void *)objc_msgSend(v8, "nextObject");
    }
    while (v11);
  }
  -[NSRecursiveLock unlock](self->mutex, "unlock");

}

- (void)scanForPlugInsInBundle:(id)a3 withPluginKitPlugIn:(id)a4 deferralNotification:(id)a5
{
  id v9;

  -[NSRecursiveLock lock](self->mutex, "lock");
  if (objc_msgSend(a3, "bundleIdentifier")
    && -[PROConcretePlugInManager shouldLoadBundle:](self, "shouldLoadBundle:", a3))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    -[PROConcretePlugInManager scanForPlugInsInBundleHelper:zone:withPluginKitPlugIn:deferralNotification:](self, "scanForPlugInsInBundleHelper:zone:withPluginKitPlugIn:deferralNotification:", a3, -[PROConcretePlugInManager zone](self, "zone"), a4, a5);
    objc_msgSend(v9, "drain");
  }
  -[NSRecursiveLock unlock](self->mutex, "unlock");
}

- (void)scanForPlugInsInBundle:(id)a3 deferralNotification:(id)a4
{
  id v7;

  -[NSRecursiveLock lock](self->mutex, "lock");
  if (objc_msgSend(a3, "bundleIdentifier")
    && -[PROConcretePlugInManager shouldLoadBundle:](self, "shouldLoadBundle:", a3))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    -[PROConcretePlugInManager scanForPlugInsInBundleHelper:zone:withPluginKitPlugIn:deferralNotification:](self, "scanForPlugInsInBundleHelper:zone:withPluginKitPlugIn:deferralNotification:", a3, -[PROConcretePlugInManager zone](self, "zone"), 0, a4);
    objc_msgSend(v7, "drain");
  }
  -[NSRecursiveLock unlock](self->mutex, "unlock");
}

- (BOOL)bundleHandler:(id)a3 shouldAddPlugIn:(id)a4
{
  -[NSRecursiveLock lock](self->mutex, "lock", a3);
  LOBYTE(a4) = -[PROConcretePlugInManager shouldLoadPlugIn:](self, "shouldLoadPlugIn:", a4);
  -[NSRecursiveLock unlock](self->mutex, "unlock");
  return (char)a4;
}

- (void)bundleHandler:(id)a3 didAddPlugIn:(id)a4
{
  -[NSRecursiveLock lock](self->mutex, "lock", a3);
  -[PROConcretePlugInManager addPlugIn:](self, "addPlugIn:", a4);
  -[NSRecursiveLock unlock](self->mutex, "unlock");
}

- (void)bundleHandler:(id)a3 didError:(id)a4
{
  -[PROConcretePlugInManager reportError:](self, "reportError:", a4);
}

- (id)plugIns
{
  void *v3;

  -[NSRecursiveLock lock](self->mutex, "lock");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->plugIns);
  -[NSRecursiveLock unlock](self->mutex, "unlock");
  return v3;
}

- (id)plugInGroups
{
  void *v3;

  -[NSRecursiveLock lock](self->mutex, "lock");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", -[NSMutableDictionary allValues](self->groupsDictionary, "allValues"));
  -[NSRecursiveLock unlock](self->mutex, "unlock");
  return v3;
}

- (id)plugInGroupsMutable
{
  return self->groupsDictionary;
}

- (id)plugInWithUUID:(__CFUUID *)a3
{
  void *v5;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil argument '%s' to method '%@'"), "uuid", NSStringFromSelector(a2));
  -[NSRecursiveLock lock](self->mutex, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->uuids, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3));
  -[NSRecursiveLock unlock](self->mutex, "unlock");
  return v5;
}

- (id)plugInWithClassName:(id)a3
{
  void *v5;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil argument '%s' to method '%@'"), "className", NSStringFromSelector(a2));
  -[NSRecursiveLock lock](self->mutex, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->classesDictionary, "objectForKey:", a3);
  -[NSRecursiveLock unlock](self->mutex, "unlock");
  return v5;
}

- (id)plugInGroupWithUUID:(__CFUUID *)a3
{
  void *v5;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil argument '%s' to method '%@'"), "uuid", NSStringFromSelector(a2));
  -[NSRecursiveLock lock](self->mutex, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->groupsDictionary, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3));
  -[NSRecursiveLock unlock](self->mutex, "unlock");
  return v5;
}

- (id)blockedLibraryPlugins
{
  void *v3;

  -[NSRecursiveLock lock](self->mutex, "lock");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->blockedLibraryPlugins);
  -[NSRecursiveLock unlock](self->mutex, "unlock");
  return v3;
}

- (id)blockedDocumentPlugins
{
  void *v3;

  -[NSRecursiveLock lock](self->mutex, "lock");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->blockedDocumentPlugins);
  -[NSRecursiveLock unlock](self->mutex, "unlock");
  return v3;
}

- (unsigned)countOfBundles
{
  unsigned int v3;

  -[NSRecursiveLock lock](self->mutex, "lock");
  v3 = -[NSMutableDictionary count](self->bundlesDictionary, "count");
  -[NSRecursiveLock unlock](self->mutex, "unlock");
  return v3;
}

- (id)objectInBundlesAtIndex:(unsigned int)a3
{
  void *v5;

  -[NSRecursiveLock lock](self->mutex, "lock");
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary allValues](self->bundlesDictionary, "allValues"), "objectAtIndex:", a3), "valueForKey:", CFSTR("bundle"));
  -[NSRecursiveLock unlock](self->mutex, "unlock");
  return v5;
}

- (id)plugInsForProtocol:(id)a3
{
  void *v5;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil argument '%s' to method '%@'"), "protocol", NSStringFromSelector(a2));
  -[NSRecursiveLock lock](self->mutex, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->protocols, "objectForKey:", NSStringFromProtocol((Protocol *)a3));
  -[NSRecursiveLock unlock](self->mutex, "unlock");
  if (v5)
    return (id)objc_msgSend(v5, "allObjects");
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (id)plugInsForProtocols:(id)a3
{
  void *v5;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil argument '%s' to method '%@'"), "matchingProtocols", NSStringFromSelector(a2));
  -[NSRecursiveLock lock](self->mutex, "lock");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", -[NSMutableDictionary objectsInAllSetsForKeys:](self->protocols, "objectsInAllSetsForKeys:", a3));
  -[NSRecursiveLock unlock](self->mutex, "unlock");
  return v5;
}

- (id)apiForProtocol:(id *)a3 versions:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil argument '%s' to method '%@'"), "apiProtocol", NSStringFromSelector(a2));
  -[PROReadWriteLock lockForReading](self->apiLock, "lockForReading");
  v7 = (void *)-[NSMutableDictionary objectForKey:](self->api, "objectForKey:", NSStringFromProtocol((Protocol *)*a3));
  if (!v7)
  {
LABEL_9:
    v12 = 0;
    goto LABEL_12;
  }
  v8 = v7;
  if (a4)
  {
    v9 = (void *)objc_msgSend(a4, "objectEnumerator");
    while (1)
    {
      v10 = objc_msgSend(v9, "nextObject");
      if (!v10)
        goto LABEL_9;
      v11 = objc_msgSend(v8, "objectForKey:", v10);
      if (v11)
      {
        v12 = (void *)v11;
        goto LABEL_11;
      }
    }
  }
  v12 = (void *)objc_msgSend((id)objc_msgSend(v7, "allValues"), "objectAtIndex:", 0);
  if (v12)
  {
LABEL_11:
    *a3 = (id)objc_msgSend((id)objc_msgSend(v8, "objectForKey:", CFSTR("OriginalProtocolPointer")), "pointerValue");
    v13 = v12;
  }
LABEL_12:
  -[PROReadWriteLock unlock](self->apiLock, "unlock");
  return v12;
}

- (void)registerAPIObject:(id)a3 forProtocol:(id)a4 version:(unsigned int)a5
{
  uint64_t v5;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = *(_QWORD *)&a5;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil argument '%s' to method '%@'"), "apiObject", NSStringFromSelector(a2));
    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil argument '%s' to method '%@'"), "apiProtocol", NSStringFromSelector(a2));
LABEL_3:
  v10 = NSStringFromProtocol((Protocol *)a4);
  v14 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "allocWithZone:", -[PROConcretePlugInManager zone](self, "zone")), "initWithUnsignedInt:", v5);
  -[PROReadWriteLock lockForWriting](self->apiLock, "lockForWriting");
  v11 = (void *)-[NSMutableDictionary objectForKey:](self->api, "objectForKey:", v10);
  if (v11)
  {
    objc_msgSend(v11, "setObject:forKey:", a3, v14);
  }
  else
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", -[PROConcretePlugInManager zone](self, "zone"));
    v13 = (void *)objc_msgSend(v12, "initWithObjectsAndKeys:", a3, v14, objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a4), CFSTR("OriginalProtocolPointer"), 0);
    -[NSMutableDictionary setObject:forKey:](self->api, "setObject:forKey:", v13, v10);

  }
  -[PROReadWriteLock unlock](self->apiLock, "unlock");

}

- (void)unregisterAPIForProtocol:(id)a3 version:(unsigned int)a4
{
  uint64_t v4;
  NSString *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil argument '%s' to method '%@'"), "apiProtocol", NSStringFromSelector(a2));
  v7 = NSStringFromProtocol((Protocol *)a3);
  -[PROReadWriteLock lockForWriting](self->apiLock, "lockForWriting");
  v8 = (void *)-[NSMutableDictionary objectForKey:](self->api, "objectForKey:", v7);
  objc_msgSend(v8, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
  if (!objc_msgSend(v8, "count"))
    -[NSMutableDictionary removeObjectForKey:](self->api, "removeObjectForKey:", v7);
  -[PROReadWriteLock unlock](self->apiLock, "unlock");
}

- (void)unregisterAPIForProtocol:(id)a3
{
  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil argument '%s' to method '%@'"), "apiProtocol", NSStringFromSelector(a2));
  -[PROReadWriteLock lockForWriting](self->apiLock, "lockForWriting");
  -[NSMutableDictionary removeObjectForKey:](self->api, "removeObjectForKey:", NSStringFromProtocol((Protocol *)a3));
  -[PROReadWriteLock unlock](self->apiLock, "unlock");
}

- (BOOL)validateProtocols:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;

  if (!-[PROConcretePlugInManager requiresProtocolsToBePresentWhenLoading](self, "requiresProtocolsToBePresentWhenLoading"))return 1;
  -[PROReadWriteLock lockForReading](self->apiLock, "lockForReading");
  v5 = (void *)objc_msgSend(a3, "objectEnumerator");
  v6 = objc_msgSend(v5, "nextObject");
  if (v6)
  {
    v7 = (void *)v6;
    while (2)
    {
      v8 = objc_msgSend(v7, "objectForKey:", CFSTR("protocolName"));
      v9 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("versions"));
      v10 = -[NSMutableDictionary objectForKey:](self->api, "objectForKey:", v8);
      v11 = v10 != 0;
      if (v10)
      {
        v12 = (void *)v10;
        v13 = (void *)objc_msgSend(v9, "objectEnumerator");
        do
        {
          v14 = objc_msgSend(v13, "nextObject");
          if (!v14)
          {
            v11 = 0;
            goto LABEL_13;
          }
        }
        while (!objc_msgSend(v12, "objectForKey:", v14));
        v7 = (void *)objc_msgSend(v5, "nextObject");
        if (v7)
          continue;
      }
      break;
    }
  }
  else
  {
    v11 = 1;
  }
LABEL_13:
  -[PROReadWriteLock unlock](self->apiLock, "unlock");
  return v11;
}

@end
