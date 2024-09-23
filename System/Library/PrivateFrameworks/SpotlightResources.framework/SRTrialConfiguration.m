@implementation SRTrialConfiguration

- (void)setParameterName:(id)a3 namespaceId:(id)a4
{
  NSMutableDictionary *parameterMap;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  parameterMap = self->_parameterMap;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](parameterMap, "objectForKeyedSubscript:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parameterMap, "setObject:forKeyedSubscript:", v9, v11);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_parameterMap, "objectForKeyedSubscript:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v7);

}

- (id)namespaceTypesForClient:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  int v15;
  SRNamespaceType *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v22 = v4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_namespaceMap, "objectForKeyedSubscript:", v4);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v32;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v26 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v6);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v8 = self->_parameterMap;
        v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v28 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_parameterMap, "objectForKeyedSubscript:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "containsObject:", v7);

              if (v15)
              {
                objc_msgSend(v5, "objectForKeyedSubscript:", v7);
                v16 = (SRNamespaceType *)objc_claimAutoreleasedReturnValue();
                if (!v16)
                {
                  v16 = objc_alloc_init(SRNamespaceType);
                  -[NSMutableDictionary objectForKeyedSubscript:](self->_namespaceDescription, "objectForKeyedSubscript:", v7);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SRNamespaceType setNamespaceName:](v16, "setNamespaceName:", v17);

                  -[SRNamespaceType setNamespaceId:](v16, "setNamespaceId:", v7);
                  objc_msgSend(v5, "setObject:forKey:", v16, v7);
                }
                -[SRNamespaceType addParameterName:](v16, "addParameterName:", v13);

              }
            }
            v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v10);
        }

        v6 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v25);
  }
  v18 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v5, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)namespaceTypes
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  SRNamespaceType *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->_parameterMap;
  v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(obj);
        v21 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v4);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_parameterMap, "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v23 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
              objc_msgSend(v3, "objectForKeyedSubscript:", v11);
              v12 = (SRNamespaceType *)objc_claimAutoreleasedReturnValue();
              if (!v12)
              {
                v12 = objc_alloc_init(SRNamespaceType);
                -[NSMutableDictionary objectForKeyedSubscript:](self->_namespaceDescription, "objectForKeyedSubscript:", v11);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                -[SRNamespaceType setNamespaceName:](v12, "setNamespaceName:", v13);

                -[SRNamespaceType setNamespaceId:](v12, "setNamespaceId:", v11);
                objc_msgSend(v3, "setObject:forKey:", v12, v11);
              }
              -[SRNamespaceType addParameterName:](v12, "addParameterName:", v5);

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v8);
        }

        v4 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v20);
  }

  v14 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v3, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSDictionary)namespaceDescription
{
  return (NSDictionary *)self->_namespaceDescription;
}

- (id)clientsForNamespace:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_namespaceMap;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_namespaceMap, "objectForKeyedSubscript:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          -[NSMutableDictionary objectForKeyedSubscript:](self->_namespaceMap, "objectForKeyedSubscript:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObject:", v4);

          if (v14)
            objc_msgSend(v17, "addObject:", v10);
        }
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setProperties:(id)a3 client:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("namespaceId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("namespaceName"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 && v8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_namespaceMap, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_namespaceMap, "setObject:forKeyedSubscript:", v11, v6);

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_namespaceMap, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v7);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v13, v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_namespaceDescription, "setObject:forKeyedSubscript:", v9, v7);
  }

}

+ (id)configuration
{
  return objc_alloc_init(SRTrialConfiguration);
}

- (SRTrialConfiguration)init
{
  SRTrialConfiguration *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *properties;
  NSMutableDictionary *v5;
  NSMutableDictionary *namespaceDescription;
  NSMutableDictionary *v7;
  NSMutableDictionary *namespaceMap;
  NSMutableDictionary *v9;
  NSMutableDictionary *parameterMap;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SRTrialConfiguration;
  v2 = -[SRTrialConfiguration init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    properties = v2->_properties;
    v2->_properties = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    namespaceDescription = v2->_namespaceDescription;
    v2->_namespaceDescription = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    namespaceMap = v2->_namespaceMap;
    v2->_namespaceMap = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    parameterMap = v2->_parameterMap;
    v2->_parameterMap = v9;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceMap, 0);
  objc_storeStrong((id *)&self->_parameterMap, 0);
  objc_storeStrong((id *)&self->_namespaceDescription, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

- (id)namespacesForClient:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_namespaceMap, "objectForKeyedSubscript:", a3);
}

- (id)debugDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(&stru_251909998, "mutableCopy");
  v4 = v3;
  if (self->_properties)
    objc_msgSend(v3, "appendFormat:", CFSTR("properties: %@\n"), self->_properties);
  if (self->_namespaceDescription)
    objc_msgSend(v4, "appendFormat:", CFSTR("namespaceDescription: %@\n"), self->_namespaceDescription);
  if (self->_properties)
    objc_msgSend(v4, "appendFormat:", CFSTR("namespaceMap: %@\n"), self->_namespaceMap);
  if (self->_parameterMap)
    objc_msgSend(v4, "appendFormat:", CFSTR("parameterMap: %@\n"), self->_parameterMap);
  return v4;
}

- (void)clear
{
  -[NSMutableDictionary removeAllObjects](self->_properties, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_namespaceDescription, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_parameterMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_namespaceMap, "removeAllObjects");
}

@end
