@implementation SXDOMAnalysis

- (SXDOMAnalysis)init
{
  SXDOMAnalysis *v2;
  uint64_t v3;
  NSMutableDictionary *roleToComponentsMap;
  uint64_t v5;
  NSMutableDictionary *componentToRoleMap;
  uint64_t v7;
  NSMutableDictionary *typeToComponentsMap;
  uint64_t v9;
  NSMutableDictionary *componentToTypeMap;
  uint64_t v11;
  NSMutableDictionary *componentStyleToComponentsMap;
  uint64_t v13;
  NSMutableDictionary *componentToComponentStylesMap;
  uint64_t v15;
  NSMutableDictionary *componentTextStyleToComponentsMap;
  uint64_t v17;
  NSMutableDictionary *componentToComponentTextStylesMap;
  uint64_t v19;
  NSMutableDictionary *textStyleToComponentsMap;
  uint64_t v21;
  NSMutableDictionary *componentToTextStylesMap;
  uint64_t v23;
  NSMutableDictionary *componentToChildComponentsMap;
  uint64_t v25;
  NSMutableDictionary *componentToParentComponentMap;
  SXMutableConditionalObjectAnalysis *v27;
  SXMutableConditionalObjectAnalysis *conditionalObjectAnalysis;
  SXMutableNamespacedObjectReferences *v29;
  SXMutableNamespacedObjectReferences *namespacedObjectReferences;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)SXDOMAnalysis;
  v2 = -[SXDOMAnalysis init](&v32, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    roleToComponentsMap = v2->_roleToComponentsMap;
    v2->_roleToComponentsMap = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    componentToRoleMap = v2->_componentToRoleMap;
    v2->_componentToRoleMap = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    typeToComponentsMap = v2->_typeToComponentsMap;
    v2->_typeToComponentsMap = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    componentToTypeMap = v2->_componentToTypeMap;
    v2->_componentToTypeMap = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    componentStyleToComponentsMap = v2->_componentStyleToComponentsMap;
    v2->_componentStyleToComponentsMap = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    componentToComponentStylesMap = v2->_componentToComponentStylesMap;
    v2->_componentToComponentStylesMap = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    componentTextStyleToComponentsMap = v2->_componentTextStyleToComponentsMap;
    v2->_componentTextStyleToComponentsMap = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    componentToComponentTextStylesMap = v2->_componentToComponentTextStylesMap;
    v2->_componentToComponentTextStylesMap = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    textStyleToComponentsMap = v2->_textStyleToComponentsMap;
    v2->_textStyleToComponentsMap = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    componentToTextStylesMap = v2->_componentToTextStylesMap;
    v2->_componentToTextStylesMap = (NSMutableDictionary *)v21;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    componentToChildComponentsMap = v2->_componentToChildComponentsMap;
    v2->_componentToChildComponentsMap = (NSMutableDictionary *)v23;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v25 = objc_claimAutoreleasedReturnValue();
    componentToParentComponentMap = v2->_componentToParentComponentMap;
    v2->_componentToParentComponentMap = (NSMutableDictionary *)v25;

    v27 = objc_alloc_init(SXMutableConditionalObjectAnalysis);
    conditionalObjectAnalysis = v2->_conditionalObjectAnalysis;
    v2->_conditionalObjectAnalysis = v27;

    v29 = objc_alloc_init(SXMutableNamespacedObjectReferences);
    namespacedObjectReferences = v2->_namespacedObjectReferences;
    v2->_namespacedObjectReferences = v29;

  }
  return v2;
}

- (id)componentsWithRole:(int)a3
{
  NSMutableDictionary *roleToComponentsMap;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  roleToComponentsMap = self->_roleToComponentsMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](roleToComponentsMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (int)roleForComponent:(id)a3
{
  void *v3;
  int v4;

  -[NSMutableDictionary objectForKey:](self->_componentToRoleMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (id)componentsWithType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[NSMutableDictionary objectForKey:](self->_typeToComponentsMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)typeForComponent:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_componentToTypeMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)componentStylesForComponent:(id)a3
{
  void *v3;
  void *v4;

  -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", a3, self->_componentToComponentStylesMap);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)componentStylesForComponents:(id)a3
{
  void *v3;
  void *v4;

  -[SXDOMAnalysis identifiersForKeys:map:](self, "identifiersForKeys:map:", a3, self->_componentToComponentStylesMap);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)componentsForComponentStyle:(id)a3
{
  void *v3;
  void *v4;

  -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", a3, self->_componentStyleToComponentsMap);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)componentsForComponentStyles:(id)a3
{
  void *v3;
  void *v4;

  -[SXDOMAnalysis identifiersForKeys:map:](self, "identifiersForKeys:map:", a3, self->_componentStyleToComponentsMap);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)componentTextStylesForComponent:(id)a3
{
  void *v3;
  void *v4;

  -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", a3, self->_componentToComponentTextStylesMap);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)componentTextStylesForComponents:(id)a3
{
  void *v3;
  void *v4;

  -[SXDOMAnalysis identifiersForKeys:map:](self, "identifiersForKeys:map:", a3, self->_componentToComponentTextStylesMap);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)componentsForComponentTextStyle:(id)a3
{
  void *v3;
  void *v4;

  -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", a3, self->_componentTextStyleToComponentsMap);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)componentsForComponentTextStyles:(id)a3
{
  void *v3;
  void *v4;

  -[SXDOMAnalysis identifiersForKeys:map:](self, "identifiersForKeys:map:", a3, self->_componentTextStyleToComponentsMap);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)textStylesForComponent:(id)a3
{
  void *v3;
  void *v4;

  -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", a3, self->_componentToTextStylesMap);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)textStylesForComponents:(id)a3
{
  void *v3;
  void *v4;

  -[SXDOMAnalysis identifiersForKeys:map:](self, "identifiersForKeys:map:", a3, self->_componentToTextStylesMap);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)componentsForTextStyle:(id)a3
{
  void *v3;
  void *v4;

  -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", a3, self->_textStyleToComponentsMap);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)componentsForTextStyles:(id)a3
{
  void *v3;
  void *v4;

  -[SXDOMAnalysis identifiersForKeys:map:](self, "identifiersForKeys:map:", a3, self->_textStyleToComponentsMap);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)childComponentsOfComponent:(id)a3 includeDescendants:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary objectForKey:](self->_componentToChildComponentsMap, "objectForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if (v4)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = (void *)objc_msgSend(v9, "copy", 0);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          -[SXDOMAnalysis childComponentsOfComponent:includeDescendants:](self, "childComponentsOfComponent:includeDescendants:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v9, "unionSet:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
  v16 = (void *)objc_msgSend(v9, "copy");

  return v16;
}

- (id)parentComponentOfComponent:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_componentToParentComponentMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)containerPathForComponentWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDOMAnalysis parentComponentOfComponent:](self, "parentComponentOfComponent:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      objc_msgSend(v5, "insertObject:atIndex:", v7, 0);
      -[SXDOMAnalysis parentComponentOfComponent:](self, "parentComponentOfComponent:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    while (v8);
  }
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SXDOMAnalysis *v4;

  v4 = objc_alloc_init(SXDOMAnalysis);
  -[SXDOMAnalysis populateWithSource:](v4, "populateWithSource:", self);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SXMutableDOMAnalysis *v4;

  v4 = objc_alloc_init(SXMutableDOMAnalysis);
  -[SXDOMAnalysis populateWithSource:](v4, "populateWithSource:", self);
  return v4;
}

- (void)populateWithSource:(id)a3
{
  void *v4;
  NSMutableDictionary *roleToComponentsMap;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *componentToParentComponentMap;
  SXMutableConditionalObjectAnalysis *v17;
  SXMutableConditionalObjectAnalysis *conditionalObjectAnalysis;
  void *v19;
  SXMutableNamespacedObjectReferences *v20;
  SXMutableNamespacedObjectReferences *namespacedObjectReferences;

  v4 = (void *)*((_QWORD *)a3 + 1);
  roleToComponentsMap = self->_roleToComponentsMap;
  v6 = (void **)a3;
  __36__SXDOMAnalysis_populateWithSource___block_invoke((uint64_t)v6, v4, roleToComponentsMap);
  __36__SXDOMAnalysis_populateWithSource___block_invoke(v7, v6[3], self->_typeToComponentsMap);
  __36__SXDOMAnalysis_populateWithSource___block_invoke(v8, v6[5], self->_componentStyleToComponentsMap);
  __36__SXDOMAnalysis_populateWithSource___block_invoke(v9, v6[6], self->_componentToComponentStylesMap);
  __36__SXDOMAnalysis_populateWithSource___block_invoke(v10, v6[7], self->_componentTextStyleToComponentsMap);
  __36__SXDOMAnalysis_populateWithSource___block_invoke(v11, v6[8], self->_componentToComponentTextStylesMap);
  __36__SXDOMAnalysis_populateWithSource___block_invoke(v12, v6[9], self->_textStyleToComponentsMap);
  __36__SXDOMAnalysis_populateWithSource___block_invoke(v13, v6[10], self->_componentToTextStylesMap);
  __36__SXDOMAnalysis_populateWithSource___block_invoke(v14, v6[11], self->_componentToChildComponentsMap);
  v15 = (NSMutableDictionary *)objc_msgSend(v6[12], "mutableCopy");
  componentToParentComponentMap = self->_componentToParentComponentMap;
  self->_componentToParentComponentMap = v15;

  v17 = (SXMutableConditionalObjectAnalysis *)objc_msgSend(v6[13], "mutableCopy");
  conditionalObjectAnalysis = self->_conditionalObjectAnalysis;
  self->_conditionalObjectAnalysis = v17;

  v19 = v6[14];
  v20 = (SXMutableNamespacedObjectReferences *)objc_msgSend(v19, "mutableCopy");
  namespacedObjectReferences = self->_namespacedObjectReferences;
  self->_namespacedObjectReferences = v20;

}

void __36__SXDOMAnalysis_populateWithSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__SXDOMAnalysis_populateWithSource___block_invoke_2;
  v6[3] = &unk_24D68D7E0;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __36__SXDOMAnalysis_populateWithSource___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

- (id)identifiersForKeys:(id)a3 map:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), v7, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "unionSet:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(v8, "copy");
  return v15;
}

- (id)identifiersForKey:(id)a3 map:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, v5);
  }

  return v7;
}

- (SXConditionalObjectAnalysis)conditionalObjectAnalysis
{
  return &self->_conditionalObjectAnalysis->super;
}

- (SXNamespacedObjectReferences)namespacedObjectReferences
{
  return &self->_namespacedObjectReferences->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespacedObjectReferences, 0);
  objc_storeStrong((id *)&self->_conditionalObjectAnalysis, 0);
  objc_storeStrong((id *)&self->_componentToParentComponentMap, 0);
  objc_storeStrong((id *)&self->_componentToChildComponentsMap, 0);
  objc_storeStrong((id *)&self->_componentToTextStylesMap, 0);
  objc_storeStrong((id *)&self->_textStyleToComponentsMap, 0);
  objc_storeStrong((id *)&self->_componentToComponentTextStylesMap, 0);
  objc_storeStrong((id *)&self->_componentTextStyleToComponentsMap, 0);
  objc_storeStrong((id *)&self->_componentToComponentStylesMap, 0);
  objc_storeStrong((id *)&self->_componentStyleToComponentsMap, 0);
  objc_storeStrong((id *)&self->_componentToTypeMap, 0);
  objc_storeStrong((id *)&self->_typeToComponentsMap, 0);
  objc_storeStrong((id *)&self->_componentToRoleMap, 0);
  objc_storeStrong((id *)&self->_roleToComponentsMap, 0);
}

@end
