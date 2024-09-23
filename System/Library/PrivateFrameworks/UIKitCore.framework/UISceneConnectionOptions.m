@implementation UISceneConnectionOptions

- (void)performPostConnectionCleanup
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *cleanupBlocks;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_cleanupBlocks;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  cleanupBlocks = self->_cleanupBlocks;
  self->_cleanupBlocks = 0;

}

- (NSSet)URLContexts
{
  return (NSSet *)-[NSDictionary objectForKeyedSubscript:](self->_launchOptionsDictionary, "objectForKeyedSubscript:", CFSTR("_UISceneConnectionOptionsURLContextKey"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitionPayloadStorage, 0);
  objc_storeStrong((id *)&self->_cleanupBlocks, 0);
  objc_destroyWeak((id *)&self->_specification);
  objc_destroyWeak((id *)&self->_fbsScene);
  objc_storeStrong((id *)&self->_launchOptionsDictionary, 0);
}

- (FBSScene)_fbsScene
{
  return (FBSScene *)objc_loadWeakRetained((id *)&self->_fbsScene);
}

- (id)_initWithConnectionOptionsContext:(id)a3 fbsScene:(id)a4 specification:(id)a5
{
  id *v8;
  id v9;
  id v10;
  UISceneConnectionOptions *v11;
  uint64_t v12;
  NSDictionary *launchOptionsDictionary;
  id v14;
  objc_super v16;

  v8 = (id *)a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)UISceneConnectionOptions;
  v11 = -[UISceneConnectionOptions init](&v16, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "launchOptionsDictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    launchOptionsDictionary = v11->_launchOptionsDictionary;
    v11->_launchOptionsDictionary = (NSDictionary *)v12;

    if (v8)
    {
      objc_storeStrong((id *)&v11->_cleanupBlocks, v8[3]);
      objc_storeWeak((id *)&v11->_fbsScene, v9);
      objc_storeWeak((id *)&v11->_specification, v10);
      v14 = v8[4];
    }
    else
    {
      objc_storeStrong((id *)&v11->_cleanupBlocks, 0);
      objc_storeWeak((id *)&v11->_fbsScene, v9);
      objc_storeWeak((id *)&v11->_specification, v10);
      v14 = 0;
    }
    objc_storeStrong((id *)&v11->_definitionPayloadStorage, v14);
  }

  return v11;
}

- (FBSSceneSpecification)_specification
{
  return (FBSSceneSpecification *)objc_loadWeakRetained((id *)&self->_specification);
}

- (UIApplicationShortcutItem)shortcutItem
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_launchOptionsDictionary, "objectForKeyedSubscript:", CFSTR("_UISceneConnectionOptionsShortcutItemKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIApplicationShortcutItem *)v3;
}

- (UNNotificationResponse)notificationResponse
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_launchOptionsDictionary, "objectForKeyedSubscript:", CFSTR("_UISceneConnectionOptionsNotificationResponsesKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UNNotificationResponse *)v3;
}

- (NSSet)userActivities
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_launchOptionsDictionary, "objectForKey:", CFSTR("_UISceneConnectionOptionsUserActivityDictionariesKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "objectForKey:", CFSTR("_UISceneConnectionOptionsUserActivityKey"), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v10;
}

- (id)description
{
  return -[NSDictionary description](self->_launchOptionsDictionary, "description");
}

- (NSSet)_itemProviderCollections
{
  return (NSSet *)-[NSDictionary objectForKeyedSubscript:](self->_launchOptionsDictionary, "objectForKeyedSubscript:", CFSTR("_UISceneConnectionOptionsItemProvidersKey"));
}

- (NSString)sourceApplication
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_launchOptionsDictionary, "objectForKeyedSubscript:", CFSTR("_UISceneConnectionOptionsSourceApplicationKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CKShareMetadata)cloudKitShareMetadata
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_launchOptionsDictionary, "objectForKeyedSubscript:", CFSTR("_UISceneConnectionOptionsCloudKitShareMetadataKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKShareMetadata *)v3;
}

- (NSString)handoffUserActivityType
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_launchOptionsDictionary, "objectForKey:", CFSTR("_UISceneConnectionOptionsUserActivityDictionariesKey"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", CFSTR("_UISceneConnectionOptionsUserActivityKey"), (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(v7, "objectForKey:", CFSTR("_UISceneConnectionOptionsUserActivityTypeKey"));
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = (void *)v9;
            goto LABEL_12;
          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return (NSString *)v10;
}

- (NSSet)_bluetoothCentralRestorationIdentifiers
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_launchOptionsDictionary, "objectForKeyedSubscript:", CFSTR("_UISceneConnectionOptionsBluetoothCentralsKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  return (NSSet *)v5;
}

- (NSSet)_bluetoothPeripheralRestorationIdentifiers
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_launchOptionsDictionary, "objectForKeyedSubscript:", CFSTR("_UISceneConnectionOptionsBluetoothPeripheralsKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  return (NSSet *)v5;
}

- (NSDictionary)_launchOptionsDictionary
{
  return self->_launchOptionsDictionary;
}

- (uint64_t)_definitionPayloadStorage
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

@end
