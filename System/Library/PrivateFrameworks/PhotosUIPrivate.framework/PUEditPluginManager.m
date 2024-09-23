@implementation PUEditPluginManager

- (id)_initWithMediaType:(unint64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUEditPluginManager;
  result = -[PUEditPluginManager init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (BOOL)hasPlugins
{
  void *v2;
  BOOL v3;

  -[PUEditPluginManager plugins](self, "plugins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)hasNonMarkupPlugins
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PUEditPluginManager plugins](self, "plugins");
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "pu_isMarkupExtension", (_QWORD)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasMarkupPlugin
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PUEditPluginManager plugins](self, "plugins");
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "pu_isMarkupExtension", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_allowedPluginTypes
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUEditPluginManager mediaType](self, "mediaType");
  v5 = v4;
  if (v4 - 2 < 2 || v4 == 0)
    goto LABEL_7;
  if (v4 == 1)
  {
    objc_msgSend(v3, "addIndex:", 0);
LABEL_7:
    objc_msgSend(v3, "addIndex:", v5);
  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (void)rediscoverAvailablePlugins
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[PUEditPluginManager _allowedPluginTypes](self, "_allowedPluginTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PUEditPluginManager_rediscoverAvailablePlugins__block_invoke;
  v6[3] = &unk_1E58ABCA8;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

- (void)_discoveredAvailableExtensions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  uint64_t v30;
  PUEditPlugin *v31;
  id v32;
  id obj;
  _QWORD block[5];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v9, "_plugIn");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "containingUrl");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = (void *)MEMORY[0x1E0C99E98];
          v13 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "UUIDString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("appLessExtension://%@"), v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "URLWithString:", v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v4, "objectForKey:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17
          || (objc_msgSend(v9, "identifier"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v17, "identifier"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              v20 = objc_msgSend(v18, "compare:", v19),
              v19,
              v18,
              v20 == -1))
        {
          objc_msgSend(v4, "setObject:forKey:", v9, v11);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "allValues");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v23 = v21;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        objc_msgSend(v28, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = +[PUEditPlugin pu_isMarkupExtensionIdentifier:](PUEditPlugin, "pu_isMarkupExtensionIdentifier:", v29) ^ 1;

        v31 = -[PUEditPlugin initWithExtension:pluginCategoryType:]([PUEditPlugin alloc], "initWithExtension:pluginCategoryType:", v28, v30);
        objc_msgSend(v22, "addObject:", v31);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v25);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PUEditPluginManager__discoveredAvailableExtensions___block_invoke;
  block[3] = &unk_1E58ABCA8;
  block[4] = self;
  v36 = v22;
  v32 = v22;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (id)pluginActivities
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  PUEditPluginActionActivity *v10;
  PUEditPluginActionActivity *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PUEditPluginManager plugins](self, "plugins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "pu_isMarkupExtension", (_QWORD)v13))
          v10 = -[PUEditPluginActionActivity initWithPlugin:systemImageName:]([PUEditPluginActionActivity alloc], "initWithPlugin:systemImageName:", v9, CFSTR("pencil.tip.crop.circle"));
        else
          v10 = -[PUEditPluginActivity initWithPlugin:]([PUEditPluginActivity alloc], "initWithPlugin:", v9);
        v11 = v10;
        objc_msgSend(v3, "addObject:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)pluginActivitiesExceptMarkup
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  PUEditPluginActivity *v10;
  PUEditPluginActivity *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PUEditPluginManager plugins](self, "plugins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v9, "pu_isMarkupExtension", (_QWORD)v13) & 1) == 0)
        {
          v10 = -[PUEditPluginActivity initWithPlugin:]([PUEditPluginActivity alloc], "initWithPlugin:", v9);
          if (v10)
          {
            v11 = v10;
            objc_msgSend(v3, "addObject:", v10);

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)setPlugins:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  BOOL v6;
  NSArray *v7;
  NSArray *plugins;
  void *v9;
  NSArray *v10;

  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->_plugins != v4)
  {
    v10 = v4;
    v6 = -[NSArray isEqualToArray:](v4, "isEqualToArray:");
    v5 = v10;
    if (!v6)
    {
      v7 = (NSArray *)-[NSArray copy](v10, "copy");
      plugins = self->_plugins;
      self->_plugins = v7;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("PUEditPluginManagerPluginsDidChangeNotification"), self, 0);

      v5 = v10;
    }
  }

}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (NSArray)plugins
{
  return self->_plugins;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugins, 0);
}

uint64_t __54__PUEditPluginManager__discoveredAvailableExtensions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlugins:", *(_QWORD *)(a1 + 40));
}

void __49__PUEditPluginManager_rediscoverAvailablePlugins__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  _QWORD v16[2];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowAnyPlugin");

  v5 = (void *)MEMORY[0x1E0CB35D8];
  if (v4)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __49__PUEditPluginManager_rediscoverAvailablePlugins__block_invoke_2;
    v15[3] = &unk_1E589E460;
    v6 = (id *)v16;
    v7 = *(_QWORD *)(a1 + 32);
    v16[0] = v2;
    v16[1] = v7;
    v8 = v2;
    objc_msgSend(v5, "extensionsWithMatchingAttributes:completion:", 0, v15);
  }
  else
  {
    v17 = *MEMORY[0x1E0CB2A28];
    v18[0] = CFSTR("com.apple.photo-editing");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__PUEditPluginManager_rediscoverAvailablePlugins__block_invoke_3;
    v11[3] = &unk_1E589E488;
    v6 = &v12;
    v12 = *(id *)(a1 + 40);
    v13 = v2;
    v14 = *(_QWORD *)(a1 + 32);
    v10 = v2;
    objc_msgSend(v5, "extensionsWithMatchingAttributes:completion:", v9, v11);

  }
}

uint64_t __49__PUEditPluginManager_rediscoverAvailablePlugins__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setArray:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "_discoveredAvailableExtensions:", *(_QWORD *)(a1 + 32));
}

void __49__PUEditPluginManager_rediscoverAvailablePlugins__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v11[0] = v7;
        v11[1] = 3221225472;
        v11[2] = __49__PUEditPluginManager_rediscoverAvailablePlugins__block_invoke_4;
        v11[3] = &unk_1E58A7D80;
        v11[4] = v9;
        v10 = *(void **)(a1 + 32);
        v12 = *(id *)(a1 + 40);
        objc_msgSend(v10, "enumerateIndexesUsingBlock:", v11);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 48), "_discoveredAvailableExtensions:", *(_QWORD *)(a1 + 40));

}

uint64_t __49__PUEditPluginManager_rediscoverAvailablePlugins__block_invoke_4(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "pu_supportsMediaType:", a2);
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32));
    *a3 = 1;
  }
  return result;
}

+ (id)sharedManagerForMediaType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD block[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t v13;

  v12 = v3;
  v13 = v4;
  switch(a3)
  {
    case 0uLL:
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __49__PUEditPluginManager_sharedManagerForMediaType___block_invoke;
      v11[3] = &__block_descriptor_48_e5_v8__0l;
      v11[4] = a1;
      v11[5] = 0;
      if (sharedManagerForMediaType__onceToken != -1)
        dispatch_once(&sharedManagerForMediaType__onceToken, v11);
      v5 = &sharedManagerForMediaType__sharedManager;
      goto LABEL_16;
    case 1uLL:
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__PUEditPluginManager_sharedManagerForMediaType___block_invoke_2;
      block[3] = &__block_descriptor_48_e5_v8__0l;
      block[4] = a1;
      block[5] = 1;
      if (sharedManagerForMediaType__onceToken_131 != -1)
        dispatch_once(&sharedManagerForMediaType__onceToken_131, block);
      v5 = &sharedManagerForMediaType__sharedManager_130;
      goto LABEL_16;
    case 2uLL:
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __49__PUEditPluginManager_sharedManagerForMediaType___block_invoke_3;
      v9[3] = &__block_descriptor_48_e5_v8__0l;
      v9[4] = a1;
      v9[5] = 2;
      if (sharedManagerForMediaType__onceToken_133 != -1)
        dispatch_once(&sharedManagerForMediaType__onceToken_133, v9);
      v5 = &sharedManagerForMediaType__sharedManager_132;
      goto LABEL_16;
    case 3uLL:
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __49__PUEditPluginManager_sharedManagerForMediaType___block_invoke_4;
      v8[3] = &__block_descriptor_48_e5_v8__0l;
      v8[4] = a1;
      v8[5] = 3;
      if (sharedManagerForMediaType__onceToken_135 != -1)
        dispatch_once(&sharedManagerForMediaType__onceToken_135, v8);
      v5 = &sharedManagerForMediaType__sharedManager_134;
LABEL_16:
      v6 = (id)*v5;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

void __49__PUEditPluginManager_sharedManagerForMediaType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithMediaType:", *(_QWORD *)(a1 + 40));
  v2 = (void *)sharedManagerForMediaType__sharedManager;
  sharedManagerForMediaType__sharedManager = v1;

}

void __49__PUEditPluginManager_sharedManagerForMediaType___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithMediaType:", *(_QWORD *)(a1 + 40));
  v2 = (void *)sharedManagerForMediaType__sharedManager_130;
  sharedManagerForMediaType__sharedManager_130 = v1;

}

void __49__PUEditPluginManager_sharedManagerForMediaType___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithMediaType:", *(_QWORD *)(a1 + 40));
  v2 = (void *)sharedManagerForMediaType__sharedManager_132;
  sharedManagerForMediaType__sharedManager_132 = v1;

}

void __49__PUEditPluginManager_sharedManagerForMediaType___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithMediaType:", *(_QWORD *)(a1 + 40));
  v2 = (void *)sharedManagerForMediaType__sharedManager_134;
  sharedManagerForMediaType__sharedManager_134 = v1;

}

@end
