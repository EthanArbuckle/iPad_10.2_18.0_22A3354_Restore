@implementation WebPluginDatabase

+ (id)sharedDatabase
{
  id result;
  WebPluginDatabase *v4;
  const void *v5;

  if ((byte_1ECEC9795 & 1) != 0)
  {
    result = (id)qword_1ECEC97B0;
    if (qword_1ECEC97B0)
      return result;
  }
  else
  {
    qword_1ECEC97B0 = 0;
    byte_1ECEC9795 = 1;
  }
  v4 = objc_alloc_init(WebPluginDatabase);
  v5 = (const void *)qword_1ECEC97B0;
  qword_1ECEC97B0 = (uint64_t)v4;
  if (v5)
  {
    CFRelease(v5);
    v4 = (WebPluginDatabase *)qword_1ECEC97B0;
  }
  -[WebPluginDatabase setPlugInPaths:](v4, "setPlugInPaths:", objc_msgSend(a1, "_defaultPlugInPaths"));
  objc_msgSend((id)qword_1ECEC97B0, "refresh");
  return (id)qword_1ECEC97B0;
}

+ (id)sharedDatabaseIfExists
{
  id result;

  if (byte_1ECEC9795 == 1)
    return (id)qword_1ECEC97B0;
  result = 0;
  qword_1ECEC97B0 = 0;
  byte_1ECEC9795 = 1;
  return result;
}

+ (void)closeSharedDatabase
{
  void *v2;

  if (byte_1ECEC9795 == 1)
  {
    v2 = (void *)qword_1ECEC97B0;
  }
  else
  {
    v2 = 0;
    qword_1ECEC97B0 = 0;
    byte_1ECEC9795 = 1;
  }
  objc_msgSend(v2, "close");
}

- (id)pluginForMIMEType:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  WebBasePluginPackage *v7;
  StringImpl *v8;
  _BOOL4 v9;
  WTF::StringImpl *v10;
  id v11;
  id v12;
  WTF::StringImpl *v14;
  id v15;
  id v16;

  v15 = 0;
  v16 = 0;
  v4 = objc_msgSend(a3, "lowercaseString");
  v5 = (void *)-[NSMutableDictionary objectEnumerator](self->plugins, "objectEnumerator");
  v6 = objc_msgSend(v5, "nextObject");
  if (!v6)
  {
    v11 = 0;
    goto LABEL_18;
  }
  v7 = (WebBasePluginPackage *)v6;
  do
  {
    MEMORY[0x1D82A3998](&v14, v4);
    v9 = -[WebBasePluginPackage supportsMIMEType:](v7, "supportsMIMEType:", &v14);
    v10 = v14;
    v14 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
      {
        WTF::StringImpl::destroy(v10, v8);
        if (!v9)
          goto LABEL_3;
        goto LABEL_10;
      }
      *(_DWORD *)v10 -= 2;
    }
    if (!v9)
      goto LABEL_3;
LABEL_10:
    PluginPackageCandidates::update(&v15, v7);
LABEL_3:
    v7 = (WebBasePluginPackage *)objc_msgSend(v5, "nextObject");
  }
  while (v7);
  v11 = v15;
  if (v15)
  {
    v12 = v15;
    if (!objc_msgSend(v15, "isQuickTimePlugIn"))
      return v12;
  }
  v12 = v16;
  if (!v16)
  {
LABEL_18:
    if (v11)
      return v11;
    return 0;
  }
  if (objc_msgSend(v16, "isQuickTimePlugIn") && v11)
    return v11;
  return v12;
}

- (id)pluginForExtension:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  WebBasePluginPackage *v7;
  StringImpl *v8;
  _BOOL4 v9;
  WTF::StringImpl *v10;
  id v11;
  id v12;
  void *v13;
  WTF::StringImpl *v15;
  id v16;
  id v17;

  v16 = 0;
  v17 = 0;
  v4 = objc_msgSend(a3, "lowercaseString");
  v5 = (void *)-[NSMutableDictionary objectEnumerator](self->plugins, "objectEnumerator");
  v6 = objc_msgSend(v5, "nextObject");
  if (!v6)
  {
    v11 = 0;
    goto LABEL_18;
  }
  v7 = (WebBasePluginPackage *)v6;
  do
  {
    MEMORY[0x1D82A3998](&v15, v4);
    v9 = -[WebBasePluginPackage supportsExtension:](v7, "supportsExtension:", &v15);
    v10 = v15;
    v15 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
      {
        WTF::StringImpl::destroy(v10, v8);
        if (!v9)
          goto LABEL_3;
        goto LABEL_10;
      }
      *(_DWORD *)v10 -= 2;
    }
    if (!v9)
      goto LABEL_3;
LABEL_10:
    PluginPackageCandidates::update(&v16, v7);
LABEL_3:
    v7 = (WebBasePluginPackage *)objc_msgSend(v5, "nextObject");
  }
  while (v7);
  v11 = v16;
  if (v16 && !objc_msgSend(v16, "isQuickTimePlugIn"))
    return v11;
  v12 = v17;
  if (v17)
  {
    if ((objc_msgSend(v17, "isQuickTimePlugIn") & (v11 != 0)) == 0)
      return v12;
    return v11;
  }
LABEL_18:
  if (!v11)
  {
    v13 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB39C0], "sharedMappings"), "MIMETypeForExtension:", v4);
    if (objc_msgSend(v13, "length"))
      return -[WebPluginDatabase pluginForMIMEType:](self, "pluginForMIMEType:", v13);
    else
      return 0;
  }
  return v11;
}

- (id)plugins
{
  return (id)-[NSMutableDictionary allValues](self->plugins, "allValues");
}

+ (void)setAdditionalWebPlugInPaths:(id)a3
{
  uint64_t v3;
  const void *v4;

  if (byte_1ECEC9796 == 1)
  {
    if ((id)qword_1ECEC97B8 == a3)
      return;
  }
  else
  {
    qword_1ECEC97B8 = 0;
    byte_1ECEC9796 = 1;
    if (!a3)
      return;
  }
  v3 = objc_msgSend(a3, "copy");
  if ((byte_1ECEC9796 & 1) != 0)
  {
    v4 = (const void *)qword_1ECEC97B8;
    qword_1ECEC97B8 = v3;
    if (v4)
      CFRelease(v4);
  }
  else
  {
    byte_1ECEC9796 = 1;
    qword_1ECEC97B8 = v3;
  }
}

- (void)setPlugInPaths:(id)a3
{
  NSArray *plugInPaths;

  plugInPaths = self->plugInPaths;
  if (plugInPaths != a3)
  {

    self->plugInPaths = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (void)close
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(-[WebPluginDatabase plugins](self, "plugins"), "objectEnumerator");
  v4 = objc_msgSend(v3, "nextObject");
  if (v4)
  {
    v5 = v4;
    do
    {
      -[WebPluginDatabase _removePlugin:](self, "_removePlugin:", v5);
      v5 = objc_msgSend(v3, "nextObject");
    }
    while (v5);
  }

  self->plugins = 0;
}

- (WebPluginDatabase)init
{
  WebPluginDatabase *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WebPluginDatabase;
  v2 = -[WebPluginDatabase init](&v4, sel_init);
  if (v2)
  {
    v2->registeredMIMETypes = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->pluginInstanceViews = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebPluginDatabase;
  -[WebPluginDatabase dealloc](&v3, sel_dealloc);
}

- (void)refresh
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  id v24;

  v3 = (void *)MEMORY[0x1D82A8E64](self, a2);
  if (!self->plugins)
    self->plugins = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 12);
  v4 = -[WebPluginDatabase _scanForNewPlugins](self, "_scanForNewPlugins");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)-[NSMutableDictionary objectEnumerator](self->plugins, "objectEnumerator");
  v7 = objc_msgSend(v6, "nextObject");
  if (v7)
  {
    v8 = v7;
    do
    {
      if ((objc_msgSend(v4, "containsObject:", v8) & 1) == 0)
        objc_msgSend(v5, "addObject:", v8);
      objc_msgSend(v4, "removeObject:", v8);
      v8 = objc_msgSend(v6, "nextObject");
    }
    while (v8);
  }
  v9 = (void *)objc_msgSend(v5, "objectEnumerator");
  v10 = objc_msgSend(v9, "nextObject");
  if (v10)
  {
    v11 = v10;
    do
    {
      -[WebPluginDatabase _removePlugin:](self, "_removePlugin:", v11);
      v11 = objc_msgSend(v9, "nextObject");
    }
    while (v11);
  }
  v12 = (void *)objc_msgSend(v4, "objectEnumerator", v11);
  v13 = objc_msgSend(v12, "nextObject");
  if (v13)
  {
    v14 = v13;
    do
    {
      -[WebPluginDatabase _addPlugin:](self, "_addPlugin:", v14);
      v14 = objc_msgSend(v12, "nextObject");
    }
    while (v14);
  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = (void *)-[NSMutableDictionary objectEnumerator](self->plugins, "objectEnumerator");
  while (1)
  {
    v17 = (void *)objc_msgSend(v16, "nextObject");
    if (!v17)
      break;
    v18 = objc_msgSend(v17, "pluginInfo");
    if (*(_DWORD *)(v18 + 36))
    {
      v19 = 0;
      v20 = 0;
      do
      {
        if (*(_QWORD *)(*(_QWORD *)(v18 + 24) + v19))
          v21 = (const __CFString *)WTF::StringImpl::operator NSString *();
        else
          v21 = &stru_1E9D6EC48;
        objc_msgSend(v15, "addObject:", v21);
        ++v20;
        v19 += 32;
      }
      while (v20 < *(unsigned int *)(v18 + 36));
    }
  }
  v22 = (void *)objc_msgSend(v15, "objectEnumerator");
  while (1)
  {
    v23 = objc_msgSend(v22, "nextObject");
    if (!v23)
      break;
    -[NSMutableSet addObject:](self->registeredMIMETypes, "addObject:", v23);
    if (!+[WebView canShowMIMETypeAsHTML:](WebView, "canShowMIMETypeAsHTML:", v23))
    {
      v24 = -[WebPluginDatabase pluginForMIMEType:](self, "pluginForMIMEType:", v23);
      if ((objc_msgSend(v24, "isJavaPlugIn") & 1) == 0
        && (!objc_msgSend(v24, "isQuickTimePlugIn")
         || !objc_msgSend(+[WebFrameView _viewTypesAllowImageTypeOmission:](WebFrameView, "_viewTypesAllowImageTypeOmission:", 0), "objectForKey:", v23)))
      {
        if (byte_1ECEC9795 == 1)
        {
          if ((WebPluginDatabase *)qword_1ECEC97B0 == self)
            goto LABEL_31;
        }
        else
        {
          qword_1ECEC97B0 = 0;
          byte_1ECEC9795 = 1;
          if (!self)
LABEL_31:
            +[WebView _registerPluginMIMEType:](WebView, "_registerPluginMIMEType:", v23);
        }
      }
    }
  }
  if (v15)
    CFRelease(v15);
  objc_autoreleasePoolPop(v3);
}

- (BOOL)isMIMETypeRegistered:(id)a3
{
  return -[NSMutableSet containsObject:](self->registeredMIMETypes, "containsObject:", a3);
}

- (void)addPluginInstanceView:(id)a3
{
  -[NSMutableSet addObject:](self->pluginInstanceViews, "addObject:", a3);
}

- (void)removePluginInstanceView:(id)a3
{
  -[NSMutableSet removeObject:](self->pluginInstanceViews, "removeObject:", a3);
}

- (void)removePluginInstanceViewsFor:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->pluginInstanceViews, "count"))
  {
    v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "frameView"), "documentView");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v6 = (void *)objc_msgSend(v5, "subviews", 0);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v13 == v9)
            {
              v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
              if (!+[WebPluginController isPlugInView:](WebPluginController, "isPlugInView:", v11))
                continue;
            }
            else
            {
              objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
              if (!+[WebPluginController isPlugInView:](WebPluginController, "isPlugInView:", v11))
                continue;
            }
            -[NSMutableSet removeObject:](self->pluginInstanceViews, "removeObject:", v11);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }
    }
  }
}

- (void)destroyAllPluginInstanceViews
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_msgSend((id)-[NSMutableSet allObjects](self->pluginInstanceViews, "allObjects"), "objectEnumerator");
  v3 = objc_msgSend(v2, "nextObject");
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      if (+[WebPluginController isPlugInView:](WebPluginController, "isPlugInView:", v4))
        objc_msgSend((id)objc_msgSend(v4, "superview"), "performSelector:", sel__destroyAllWebPlugins);
      v4 = (void *)objc_msgSend(v2, "nextObject");
    }
    while (v4);
  }
}

+ (id)_defaultPlugInPaths
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_plugInPaths
{
  void *v3;
  const void *v4;
  uint64_t v5;

  if (byte_1ECEC9795 == 1)
  {
    if ((WebPluginDatabase *)qword_1ECEC97B0 != self)
      return self->plugInPaths;
  }
  else
  {
    qword_1ECEC97B0 = 0;
    byte_1ECEC9795 = 1;
    if (self)
      return self->plugInPaths;
  }
  if ((byte_1ECEC9796 & 1) != 0)
  {
    if (!qword_1ECEC97B8)
      return self->plugInPaths;
    v3 = (void *)-[NSArray mutableCopy](self->plugInPaths, "mutableCopy");
    v4 = v3;
    if (byte_1ECEC9796 == 1)
    {
      v5 = qword_1ECEC97B8;
    }
    else
    {
      v5 = 0;
      qword_1ECEC97B8 = 0;
      byte_1ECEC9796 = 1;
    }
    objc_msgSend(v3, "addObjectsFromArray:", v5);
    return (id)(id)CFMakeCollectable(v4);
  }
  else
  {
    qword_1ECEC97B8 = 0;
    byte_1ECEC9796 = 1;
    return self->plugInPaths;
  }
}

- (void)_addPlugin:(id)a3
{
  const __CFString *v5;

  if (*(_QWORD *)objc_msgSend(a3, "path"))
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v5 = &stru_1E9D6EC48;
  -[NSMutableDictionary setObject:forKey:](self->plugins, "setObject:forKey:", a3, v5);
  objc_msgSend(a3, "wasAddedToPluginDatabase:", self);
}

- (void)_removePlugin:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  const __CFString *v9;
  const __CFString *v10;

  v5 = objc_msgSend(a3, "pluginInfo");
  if (*(_DWORD *)(v5 + 36))
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)(*(_QWORD *)(v6 + 24) + v7))
      {
        v9 = (const __CFString *)WTF::StringImpl::operator NSString *();
        if (!-[NSMutableSet containsObject:](self->registeredMIMETypes, "containsObject:", v9))
          goto LABEL_4;
      }
      else
      {
        v9 = &stru_1E9D6EC48;
        if (!-[NSMutableSet containsObject:](self->registeredMIMETypes, "containsObject:", &stru_1E9D6EC48))goto LABEL_4;
      }
      if (byte_1ECEC9795 != 1)
        break;
      if ((WebPluginDatabase *)qword_1ECEC97B0 == self)
        goto LABEL_11;
LABEL_3:
      -[NSMutableSet removeObject:](self->registeredMIMETypes, "removeObject:", v9);
LABEL_4:
      ++v8;
      v7 += 32;
      if (v8 >= *(unsigned int *)(v6 + 36))
        goto LABEL_14;
    }
    qword_1ECEC97B0 = 0;
    byte_1ECEC9795 = 1;
    if (self)
      goto LABEL_3;
LABEL_11:
    +[WebView _unregisterPluginMIMEType:](WebView, "_unregisterPluginMIMEType:", v9);
    goto LABEL_3;
  }
LABEL_14:
  if (*(_QWORD *)objc_msgSend(a3, "path"))
  {
    v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (!a3)
      goto LABEL_17;
    goto LABEL_16;
  }
  v10 = &stru_1E9D6EC48;
  if (a3)
LABEL_16:
    CFRetain(a3);
LABEL_17:
  -[NSMutableDictionary removeObjectForKey:](self->plugins, "removeObjectForKey:", v10);
  objc_msgSend(a3, "wasRemovedFromPluginDatabase:", self);
  if (a3)
    CFRelease(a3);
}

- (id)_scanForNewPlugins
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_msgSend(-[WebPluginDatabase _plugInPaths](self, "_plugInPaths"), "objectEnumerator");
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  while (1)
  {
    v7 = (void *)objc_msgSend(v4, "nextObject");
    if (!v7)
      break;
    v8 = (void *)objc_msgSend((id)objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v7, 0), "objectEnumerator");
    while (1)
    {
      v9 = objc_msgSend(v8, "nextObject");
      if (!v9)
        break;
      if ((objc_msgSend(v5, "containsObject:", v9) & 1) == 0)
      {
        objc_msgSend(v5, "addObject:", v9);
        v10 = objc_msgSend(v7, "stringByAppendingPathComponent:", v9);
        if (-[NSMutableDictionary objectForKey:](self->plugins, "objectForKey:", v10)
          || +[WebBasePluginPackage pluginWithPath:](WebBasePluginPackage, "pluginWithPath:", v10))
        {
          objc_msgSend(v3, "addObject:");
        }
      }
    }
  }
  if (v5)
    CFRelease(v5);
  return v3;
}

@end
