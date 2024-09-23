@implementation SXMutableDOMAnalysis

- (void)addComponent:(id)a3 type:(id)a4 role:(int)a5
{
  uint64_t v5;
  NSMutableDictionary *typeToComponentsMap;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSMutableDictionary *roleToComponentsMap;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  NSMutableDictionary *componentToRoleMap;
  void *v23;
  id v24;

  v5 = *(_QWORD *)&a5;
  typeToComponentsMap = self->super._typeToComponentsMap;
  v9 = a4;
  v10 = a3;
  -[NSMutableDictionary objectForKey:](typeToComponentsMap, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v13;

  roleToComponentsMap = self->super._roleToComponentsMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](roleToComponentsMap, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  objc_msgSend(v19, "addObject:", v10);
  objc_msgSend(v24, "addObject:", v10);
  -[NSMutableDictionary setObject:forKey:](self->super._typeToComponentsMap, "setObject:forKey:", v24, v9);
  -[NSMutableDictionary setObject:forKey:](self->super._componentToTypeMap, "setObject:forKey:", v9, v10);

  v20 = self->super._roleToComponentsMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v19, v21);

  componentToRoleMap = self->super._componentToRoleMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](componentToRoleMap, "setObject:forKey:", v23, v10);

}

- (void)addComponentStyle:(id)a3 component:(id)a4
{
  NSMutableDictionary *componentToComponentStylesMap;
  id v7;
  id v8;
  void *v9;
  id v10;

  if (a3)
  {
    componentToComponentStylesMap = self->super._componentToComponentStylesMap;
    v7 = a4;
    v8 = a3;
    -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", v7, componentToComponentStylesMap);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v8);
    -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", v8, self->super._componentStyleToComponentsMap);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v7);
  }
}

- (void)addComponentTextStyle:(id)a3 component:(id)a4
{
  NSMutableDictionary *componentToComponentTextStylesMap;
  id v7;
  id v8;
  void *v9;
  id v10;

  if (a3)
  {
    componentToComponentTextStylesMap = self->super._componentToComponentTextStylesMap;
    v7 = a4;
    v8 = a3;
    -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", v7, componentToComponentTextStylesMap);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v8);
    -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", v8, self->super._componentTextStyleToComponentsMap);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v7);
  }
}

- (void)addTextStyle:(id)a3 component:(id)a4
{
  NSMutableDictionary *componentToTextStylesMap;
  id v7;
  id v8;
  void *v9;
  id v10;

  if (a3)
  {
    componentToTextStylesMap = self->super._componentToTextStylesMap;
    v7 = a4;
    v8 = a3;
    -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", v7, componentToTextStylesMap);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v8);
    -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", v8, self->super._textStyleToComponentsMap);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v7);
  }
}

- (void)addComponent:(id)a3 parent:(id)a4
{
  NSMutableDictionary *componentToChildComponentsMap;
  id v7;
  id v8;
  id v9;

  if (a3)
  {
    if (a4)
    {
      componentToChildComponentsMap = self->super._componentToChildComponentsMap;
      v7 = a4;
      v8 = a3;
      -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", v7, componentToChildComponentsMap);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v8);
      -[NSMutableDictionary setObject:forKey:](self->super._componentToParentComponentMap, "setObject:forKey:", v7, v8);

    }
  }
}

- (void)removeComponent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[SXDOMAnalysis componentStylesForComponent:](self, "componentStylesForComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        -[SXMutableDOMAnalysis removeComponentStyle:component:](self, "removeComponentStyle:component:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v9++), v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v7);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[SXDOMAnalysis componentTextStylesForComponent:](self, "componentTextStylesForComponent:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        -[SXMutableDOMAnalysis removeComponentTextStyle:component:](self, "removeComponentTextStyle:component:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v14++), v4);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v12);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SXDOMAnalysis textStylesForComponent:](self, "textStylesForComponent:", v4, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        -[SXMutableDOMAnalysis removeTextStyle:component:](self, "removeTextStyle:component:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v19++), v4);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v17);
  }

  -[SXDOMAnalysis typeForComponent:](self, "typeForComponent:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", v20, self->super._typeToComponentsMap);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeObject:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->super._componentToTypeMap, "removeObjectForKey:", v4);
  v22 = -[SXDOMAnalysis roleForComponent:](self, "roleForComponent:", v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", v23, self->super._roleToComponentsMap);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "removeObject:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->super._componentToRoleMap, "removeObjectForKey:", v4);

}

- (void)removeComponentStyle:(id)a3 component:(id)a4
{
  NSMutableDictionary *componentToComponentStylesMap;
  id v7;
  id v8;
  void *v9;
  id v10;

  componentToComponentStylesMap = self->super._componentToComponentStylesMap;
  v7 = a4;
  v8 = a3;
  -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", v7, componentToComponentStylesMap);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v8);
  -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", v8, self->super._componentStyleToComponentsMap);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObject:", v7);
}

- (void)removeComponentTextStyle:(id)a3 component:(id)a4
{
  NSMutableDictionary *componentToComponentTextStylesMap;
  id v7;
  id v8;
  void *v9;
  id v10;

  componentToComponentTextStylesMap = self->super._componentToComponentTextStylesMap;
  v7 = a4;
  v8 = a3;
  -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", v7, componentToComponentTextStylesMap);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v8);
  -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", v8, self->super._componentTextStyleToComponentsMap);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObject:", v7);
}

- (void)removeTextStyle:(id)a3 component:(id)a4
{
  NSMutableDictionary *componentToTextStylesMap;
  id v7;
  id v8;
  void *v9;
  id v10;

  componentToTextStylesMap = self->super._componentToTextStylesMap;
  v7 = a4;
  v8 = a3;
  -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", v7, componentToTextStylesMap);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v8);
  -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", v8, self->super._textStyleToComponentsMap);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObject:", v7);
}

@end
