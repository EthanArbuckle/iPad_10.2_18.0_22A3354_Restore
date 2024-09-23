@implementation AEPluginRegistry

+ (id)sharedInstance
{
  if (qword_3113E0 != -1)
    dispatch_once(&qword_3113E0, &stru_292068);
  return (id)qword_3113D8;
}

- (AEPluginRegistry)init
{
  AEPluginRegistry *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *extensionPlugins;
  NSMutableDictionary *v5;
  NSMutableDictionary *schemePlugins;
  NSMutableDictionary *v7;
  NSMutableDictionary *assetTypePlugins;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AEPluginRegistry;
  v2 = -[AEPluginRegistry init](&v10, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    extensionPlugins = v2->_extensionPlugins;
    v2->_extensionPlugins = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    schemePlugins = v2->_schemePlugins;
    v2->_schemePlugins = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    assetTypePlugins = v2->_assetTypePlugins;
    v2->_assetTypePlugins = v7;

  }
  return v2;
}

- (void)registerAssetEnginePlugin:(id)a3 forExtension:(id)a4
{
  NSMutableDictionary *assetTypePlugins;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  AEAggregationPlugin *v13;
  id v14;

  v14 = a3;
  assetTypePlugins = self->_assetTypePlugins;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "associatedAssetType"));
  -[NSMutableDictionary setObject:forKey:](assetTypePlugins, "setObject:forKey:", v14, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lowercaseString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_extensionPlugins, "objectForKey:", v9));
  if (v10)
  {
    v11 = objc_opt_class(AEAggregationPlugin);
    v12 = BUDynamicCast(v11, v10);
    v13 = (AEAggregationPlugin *)objc_claimAutoreleasedReturnValue(v12);
    if (!v13)
    {
      v13 = -[AEAggregationPlugin initWithFileExtension:]([AEAggregationPlugin alloc], "initWithFileExtension:", v9);
      -[AEAggregationPlugin addPlugin:](v13, "addPlugin:", v10);
      -[NSMutableDictionary setValue:forKey:](self->_extensionPlugins, "setValue:forKey:", v13, v9);
    }
    -[AEAggregationPlugin addPlugin:](v13, "addPlugin:", v14);

  }
  else
  {
    -[NSMutableDictionary setValue:forKey:](self->_extensionPlugins, "setValue:forKey:", v14, v9);
  }

}

- (void)registerAssetEnginePlugin:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  AEAggregationPlugin *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "supportedFileExtensions"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        -[AEPluginRegistry registerAssetEnginePlugin:forExtension:](self, "registerAssetEnginePlugin:forExtension:", v4, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }
  v19 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "supportedUrlSchemes"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_schemePlugins, "objectForKey:", v15));
        if (v16)
        {
          v17 = objc_opt_class(AEAggregationPlugin);
          if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
          {
            v18 = v16;
          }
          else
          {
            v18 = -[AEAggregationPlugin initWithUrlScheme:]([AEAggregationPlugin alloc], "initWithUrlScheme:", v15);
            -[AEAggregationPlugin addPlugin:](v18, "addPlugin:", v16);
            -[NSMutableDictionary setValue:forKey:](self->_schemePlugins, "setValue:forKey:", v18, v15);
          }
          -[AEAggregationPlugin addPlugin:](v18, "addPlugin:", v4);

        }
        else
        {
          -[NSMutableDictionary setValue:forKey:](self->_schemePlugins, "setValue:forKey:", v4, v15);
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v12);
  }

}

- (void)prewarmSharedResourcesWithCompletion:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  _QWORD v17[5];
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];

  v14 = a3;
  v4 = dispatch_group_create();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_assetTypePlugins, "allValues"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
          *(_DWORD *)buf = 138412290;
          v24 = v11;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Begin AEBookPlugin prewarm for %@", buf, 0xCu);

        }
        if ((objc_opt_respondsToSelector(v10, "prewarmSharedResourcesWithCompletion:") & 1) != 0)
        {
          dispatch_group_enter(v4);
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_139414;
          v17[3] = &unk_28B808;
          v17[4] = v10;
          v18 = v4;
          objc_msgSend(v10, "prewarmSharedResourcesWithCompletion:", v17);

        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
          *(_DWORD *)buf = 138543362;
          v24 = v12;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Skipped AEBookPlugin prewarm for %{public}@", buf, 0xCu);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v7);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1394CC;
  block[3] = &unk_28BF90;
  v16 = v14;
  v13 = v14;
  dispatch_group_notify(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (id)pluginForExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[NSMutableDictionary count](self->_extensionPlugins, "count") && objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_extensionPlugins, "objectForKey:", v5));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pluginForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathExtension"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEPluginRegistry pluginForExtension:](self, "pluginForExtension:", v5));

  if (!v6)
  {
    if (-[NSMutableDictionary count](self->_schemePlugins, "count"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));
      if (objc_msgSend(v7, "length"))
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_schemePlugins, "objectForKey:", v7));
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)pluginForAssetType:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_assetTypePlugins, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTypePlugins, 0);
  objc_storeStrong((id *)&self->_schemePlugins, 0);
  objc_storeStrong((id *)&self->_extensionPlugins, 0);
}

@end
