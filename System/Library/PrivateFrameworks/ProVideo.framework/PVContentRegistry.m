@implementation PVContentRegistry

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PVContentRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[PVContentRegistry sharedInstance]::onceToken != -1)
    dispatch_once(&+[PVContentRegistry sharedInstance]::onceToken, block);
  return (id)_sContentRegistry;
}

void __35__PVContentRegistry_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_sContentRegistry;
  _sContentRegistry = (uint64_t)v1;

}

+ (void)initSharedContentRegistry
{
  +[PVContentRegistry initSharedContentRegistryWithHostDelegate:](PVContentRegistry, "initSharedContentRegistryWithHostDelegate:", 0);
}

+ (void)initSharedContentRegistryWithHostDelegate:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  +[PVContentRegistry sharedInstance](PVContentRegistry, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "initContentRegistryWithHostDelegate:", v5);

}

+ (void)willTerminate:(id)a3
{
  +[PVEffect handleApplicationWillTerminate](PVEffect, "handleApplicationWillTerminate", a3);
  +[PVMotionEffect handleApplicationWillTerminate](PVMotionEffect, "handleApplicationWillTerminate");
}

- (PVContentRegistry)init
{
  PVContentRegistry *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *contentDictionary;
  NSLock *v5;
  NSLock *dictionaryLock;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PVContentRegistry;
  v2 = -[PVContentRegistry init](&v8, sel_init);
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  contentDictionary = v2->_contentDictionary;
  v2->_contentDictionary = v3;

  v5 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
  dictionaryLock = v2->_dictionaryLock;
  v2->_dictionaryLock = v5;

  return v2;
}

- (void)dealloc
{
  NSMutableDictionary *contentDictionary;
  objc_super v4;

  contentDictionary = self->_contentDictionary;
  self->_contentDictionary = 0;

  v4.receiver = self;
  v4.super_class = (Class)PVContentRegistry;
  -[PVContentRegistry dealloc](&v4, sel_dealloc);
}

- (void)initContentRegistry
{
  -[PVContentRegistry initContentRegistryWithHostDelegate:](self, "initContentRegistryWithHostDelegate:", 0);
}

- (void)initContentRegistryWithHostDelegate:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  PVContentRegistry *v12;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__PVContentRegistry_initContentRegistryWithHostDelegate___block_invoke;
  v10[3] = &unk_1E64D47E8;
  v11 = v4;
  v12 = self;
  v5 = v4;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1B5E29E00](v10);
  v6[2](v6, v7, v8, v9);

}

void __57__PVContentRegistry_initContentRegistryWithHostDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[PVHostApplicationDelegateHandler sharedInstance](PVHostApplicationDelegateHandler, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHostApplicationDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "registerBuiltIns");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", v3, sel_willTerminate_, *MEMORY[0x1E0CEB360], 0);

}

- (void)registerBuiltIns
{
  +[PVMotionEffect initializeMotion](PVMotionEffect, "initializeMotion");
  +[PVHeliumEffect registerEffects](PVHeliumEffect, "registerEffects");
  +[PVCompositeDelegateEffect registerEffects](PVCompositeDelegateEffect, "registerEffects");
}

- (BOOL)registerContentBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "infoDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v5, "bundlePath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Failed to load bundle : '%@'.  Could not find info dictionary"), v7);

    }
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v5, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("_contentBundleID"));

    objc_msgSend(v5, "resourcePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PVContentRegistry registerContentDictionary:withBaseDir:](self, "registerContentDictionary:withBaseDir:", v8, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)registerContentDictionary:(id)a3 withBaseDir:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v22;
  void *v23;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = a4;
  v23 = v5;
  if (v5)
  {
    objc_msgSend(v5, "valueForKey:", CFSTR("ProVideoContent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("_contentBundleID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
    {
      v22 = v6;
      v9 = 1;
      v10 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v12, "valueForKey:", CFSTR("contentID"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "valueForKey:", CFSTR("contentURL"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "hasPrefix:", CFSTR("...")))
          {
            if (!v26)
            {
              NSLog(CFSTR("FAILED to register content, it contains relatively pathed content but got a NULL baseDir"));

              v9 = 0;
              goto LABEL_25;
            }
            objc_msgSend(v14, "substringFromIndex:", 3);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "stringByAppendingString:", v15);
            v16 = objc_claimAutoreleasedReturnValue();

            v14 = (void *)v16;
          }
          objc_msgSend(v12, "valueForKey:", CFSTR("contentProperties"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v7)
          {
            v19 = (void *)objc_msgSend(v17, "mutableCopy");
            objc_msgSend(v19, "setObject:forKey:", v7, CFSTR("_contentBundleID"));

          }
          else
          {
            v19 = v17;
          }
          if (v13)
            v20 = v14 == 0;
          else
            v20 = 1;
          if (v20)
            NSLog(CFSTR("FAILED to register content for id (%@), it contains malformed entries"), v13, v22, v23);
          else
            v9 = -[PVContentRegistry registerContentFile:forID:properties:](self, "registerContentFile:forID:properties:", v14, v13, v19);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v9 = 1;
    }
LABEL_25:

  }
  else
  {
    NSLog(CFSTR("FAILED to register content, invalid effect dictionary"));
    v9 = 0;
  }

  return v9;
}

- (BOOL)registerContentFile:(id)a3 forID:(id)a4 properties:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  __CFString **v13;
  __CFString *v14;
  id v15;
  const char *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v11) >= 1)
    kdebug_trace();
  -[NSLock lock](self->_dictionaryLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_contentDictionary, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    NSLog(CFSTR("Attempted to registerContentFile for contentID (%@) which is already regsitered"), v9);
    goto LABEL_15;
  }
  if ((objc_msgSend(v8, "hasSuffix:", CFSTR(".moef")) & 1) != 0)
  {
    v13 = kFFEffectType_VideoFilter;
  }
  else if ((objc_msgSend(v8, "hasSuffix:", CFSTR(".motr")) & 1) != 0)
  {
    v13 = kFFEffectType_VideoTransition;
  }
  else
  {
    if (!objc_msgSend(v8, "hasSuffix:", CFSTR(".moti")))
    {
      v14 = 0;
      goto LABEL_12;
    }
    v13 = kFFEffectType_VideoTitle;
  }
  v14 = *v13;
LABEL_12:
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, CFSTR("contentPath"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("contentClass"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("contentType"));
  if (v10)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("contentProperties"));
  -[NSMutableDictionary setObject:forKey:](self->_contentDictionary, "setObject:forKey:", v15, v9);

LABEL_15:
  -[NSLock unlock](self->_dictionaryLock, "unlock");
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v16) >= 1)
    kdebug_trace();

  return v12 == 0;
}

- (BOOL)registerContentClass:(Class)a3 forID:(id)a4 type:(id)a5 withProperties:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v13) >= 1)
    kdebug_trace();
  -[NSLock lock](self->_dictionaryLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_contentDictionary, "objectForKey:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    NSLog(CFSTR("Attempted to registerContentClass for contentID (%@) which is already regsitered"), v10);
  }
  else
  {
    v18[0] = CFSTR("contentPath");
    v18[1] = CFSTR("contentClass");
    v19[0] = &stru_1E65EDDA0;
    v19[1] = a3;
    v18[2] = CFSTR("contentProperties");
    v18[3] = CFSTR("contentType");
    v19[2] = v12;
    v19[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_contentDictionary, "setObject:forKey:", v15, v10);

  }
  -[NSLock unlock](self->_dictionaryLock, "unlock");
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v16) >= 1)
    kdebug_trace();

  return v14 == 0;
}

- (BOOL)unregisterContentID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSLock lock](self->_dictionaryLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_contentDictionary, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[NSMutableDictionary removeObjectForKey:](self->_contentDictionary, "removeObjectForKey:", v4);
  else
    NSLog(CFSTR("Attempted to unregisterContentID for contentID (%@) which is not registered"), v4);
  -[NSLock unlock](self->_dictionaryLock, "unlock");

  return v5 != 0;
}

- (id)listAllContentGroups
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSLock lock](self->_dictionaryLock, "lock");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_contentDictionary;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_contentDictionary, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (!v7)
        {
          v10 = 0;
LABEL_12:
          v11 = 0;
          goto LABEL_13;
        }
        objc_msgSend(v7, "valueForKey:", CFSTR("contentProperties"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (!v9)
          goto LABEL_12;
        objc_msgSend(v9, "objectForKey:", CFSTR("contentGroup"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 && (objc_msgSend(v13, "containsObject:", v11) & 1) == 0)
          objc_msgSend(v13, "addObject:", v11);
LABEL_13:

      }
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  -[NSLock unlock](self->_dictionaryLock, "unlock");
  return v13;
}

- (id)listAllContentIDs
{
  id v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSLock lock](self->_dictionaryLock, "lock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_contentDictionary;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSLock unlock](self->_dictionaryLock, "unlock");
  return v3;
}

- (id)listIDsForContentGroup:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  id v15;
  NSMutableDictionary *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSLock lock](self->_dictionaryLock, "lock");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_contentDictionary;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_contentDictionary, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "valueForKey:", CFSTR("contentProperties"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            objc_msgSend(v10, "objectForKey:", CFSTR("contentGroup"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12 && objc_msgSend(v15, "isEqualToString:", v12))
              objc_msgSend(v14, "addObject:", v7);
          }
          else
          {
            v12 = 0;
          }
        }
        else
        {
          v12 = 0;
          v11 = 0;
        }

      }
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  -[NSLock unlock](self->_dictionaryLock, "unlock");
  return v14;
}

- (BOOL)isContentIDRegistered:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSLock lock](self->_dictionaryLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_contentDictionary, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_dictionaryLock, "unlock");
  return v5 != 0;
}

- (id)listIDsForContentGroups:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSLock lock](self->_dictionaryLock, "lock");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_contentDictionary;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[PVContentRegistry lookupPropertyForID:property:](self, "lookupPropertyForID:property:", v10, CFSTR("contentGroup"), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "containsObject:", v11))
          objc_msgSend(v5, "addObject:", v10);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[NSLock unlock](self->_dictionaryLock, "unlock");
  return v5;
}

- (id)listIDsForContentType:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  id v13;
  NSMutableDictionary *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSLock lock](self->_dictionaryLock, "lock");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = self->_contentDictionary;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_contentDictionary, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "valueForKey:", CFSTR("contentType"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqualToString:", v10);

        if (v11)
          objc_msgSend(v13, "addObject:", v8);

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  -[NSLock unlock](self->_dictionaryLock, "unlock");
  return v13;
}

- (id)listIDsForContentTypes:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSLock lock](self->_dictionaryLock, "lock");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_contentDictionary;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_contentDictionary, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "valueForKey:", CFSTR("contentType"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v4, "containsObject:", v12))
            objc_msgSend(v14, "addObject:", v9);

        }
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  -[NSLock unlock](self->_dictionaryLock, "unlock");
  return v14;
}

- (id)contentGroupForID:(id)a3
{
  -[PVContentRegistry lookupPropertyForID:property:](self, "lookupPropertyForID:property:", a3, CFSTR("contentGroup"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)contentPathForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NSLock lock](self->_dictionaryLock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_contentDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "valueForKey:", CFSTR("contentPath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[NSLock unlock](self->_dictionaryLock, "unlock");

  return v7;
}

- (id)contentPropertiesForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NSLock lock](self->_dictionaryLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_contentDictionary, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "valueForKey:", CFSTR("contentProperties"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[NSLock unlock](self->_dictionaryLock, "unlock");

  return v7;
}

- (id)lookupPropertyForID:(id)a3 property:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[PVContentRegistry contentPropertiesForID:](self, "contentPropertiesForID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)bundleForID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PVContentRegistry contentPropertiesForID:](self, "contentPropertiesForID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("_contentBundleID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)createContentInstance:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v4 = a3;
  -[NSLock lock](self->_dictionaryLock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_contentDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_dictionaryLock, "unlock");
  if (v5
    && (v6 = (objc_class *)(id)objc_msgSend(v5, "valueForKey:", CFSTR("contentClass"))) != 0)
  {
    v7 = (void *)objc_msgSend([v6 alloc], "initWithContentID:andDictionary:", v4, v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isTranscription:(id)a3
{
  void *v3;
  char v4;

  -[PVContentRegistry lookupPropertyForID:property:](self, "lookupPropertyForID:property:", a3, CFSTR("PV_CONTENT_IS_TRANSCRIPTION"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isSingleWordTranscription:(id)a3
{
  void *v3;
  char v4;

  -[PVContentRegistry lookupPropertyForID:property:](self, "lookupPropertyForID:property:", a3, CFSTR("PV_CONTENT_IS_SINGLE_WORD_TRANSCRIPTION"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isSketch:(id)a3
{
  void *v3;
  char v4;

  -[PVContentRegistry lookupPropertyForID:property:](self, "lookupPropertyForID:property:", a3, CFSTR("PV_CONTENT_IS_SKETCH"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isSelfie:(id)a3
{
  void *v3;
  char v4;

  -[PVContentRegistry lookupPropertyForID:property:](self, "lookupPropertyForID:property:", a3, CFSTR("PV_CONTENT_IS_SELFIE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)hasStyleTransfer:(id)a3
{
  void *v3;
  char v4;

  -[PVContentRegistry lookupPropertyForID:property:](self, "lookupPropertyForID:property:", a3, CFSTR("PV_CONTENT_HAS_STYLE_TRANSFER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryLock, 0);
  objc_storeStrong((id *)&self->_contentDictionary, 0);
}

@end
