@implementation SXNamespacedObjectReferences

- (SXNamespacedObjectReferences)init
{
  SXNamespacedObjectReferences *v2;
  uint64_t v3;
  NSMutableDictionary *componentStyleReferences;
  uint64_t v5;
  NSMutableDictionary *componentTextStyleReferences;
  uint64_t v7;
  NSMutableDictionary *textStyleReferences;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SXNamespacedObjectReferences;
  v2 = -[SXNamespacedObjectReferences init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    componentStyleReferences = v2->_componentStyleReferences;
    v2->_componentStyleReferences = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    componentTextStyleReferences = v2->_componentTextStyleReferences;
    v2->_componentTextStyleReferences = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    textStyleReferences = v2->_textStyleReferences;
    v2->_textStyleReferences = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (id)namespacedComponentStyleIdentifierForIdentifier:(id)a3 component:(id)a4
{
  NSMutableDictionary *componentStyleReferences;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  componentStyleReferences = self->_componentStyleReferences;
  v7 = a3;
  -[SXNamespacedObjectReferences referencesForComponent:map:](self, "referencesForComponent:map:", a4, componentStyleReferences);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = v7;
  v11 = v9;

  return v11;
}

- (id)namespacedComponentStyleIdentifiersForIdentifiers:(id)a3 component:(id)a4
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
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[SXNamespacedObjectReferences namespacedComponentStyleIdentifierForIdentifier:component:](self, "namespacedComponentStyleIdentifierForIdentifier:component:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)componentStyleIdentifierForNamespacedComponentStyleIdentifier:(id)a3 component:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v8 = v6;
  v21 = v8;
  -[SXNamespacedObjectReferences referencesForComponent:map:](self, "referencesForComponent:map:", v7, self->_componentStyleReferences);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __104__SXNamespacedObjectReferences_componentStyleIdentifierForNamespacedComponentStyleIdentifier_component___block_invoke;
  v13[3] = &unk_24D687510;
  v10 = v8;
  v14 = v10;
  v15 = &v16;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __104__SXNamespacedObjectReferences_componentStyleIdentifierForNamespacedComponentStyleIdentifier_component___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)namespacedComponentTextStyleIdentifierForIdentifier:(id)a3 component:(id)a4
{
  NSMutableDictionary *componentTextStyleReferences;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  componentTextStyleReferences = self->_componentTextStyleReferences;
  v7 = a3;
  -[SXNamespacedObjectReferences referencesForComponent:map:](self, "referencesForComponent:map:", a4, componentTextStyleReferences);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = v7;
  v11 = v9;

  return v11;
}

- (id)namespacedComponentTextStyleIdentifiersForIdentifiers:(id)a3 component:(id)a4
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
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[SXNamespacedObjectReferences namespacedComponentTextStyleIdentifierForIdentifier:component:](self, "namespacedComponentTextStyleIdentifierForIdentifier:component:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)componentTextStyleIdentifierForNamespacedComponentTextStyleIdentifier:(id)a3 component:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v8 = v6;
  v21 = v8;
  -[SXNamespacedObjectReferences referencesForComponent:map:](self, "referencesForComponent:map:", v7, self->_componentTextStyleReferences);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __112__SXNamespacedObjectReferences_componentTextStyleIdentifierForNamespacedComponentTextStyleIdentifier_component___block_invoke;
  v13[3] = &unk_24D687510;
  v10 = v8;
  v14 = v10;
  v15 = &v16;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __112__SXNamespacedObjectReferences_componentTextStyleIdentifierForNamespacedComponentTextStyleIdentifier_component___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)namespacedTextStyleIdentifierForIdentifier:(id)a3 component:(id)a4
{
  NSMutableDictionary *textStyleReferences;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  textStyleReferences = self->_textStyleReferences;
  v7 = a3;
  -[SXNamespacedObjectReferences referencesForComponent:map:](self, "referencesForComponent:map:", a4, textStyleReferences);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = v7;
  v11 = v9;

  return v11;
}

- (id)namespacedTextStyleIdentifiersForIdentifiers:(id)a3 component:(id)a4
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
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[SXNamespacedObjectReferences namespacedTextStyleIdentifierForIdentifier:component:](self, "namespacedTextStyleIdentifierForIdentifier:component:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)textStyleIdentifierForNamespacedTextStyleIdentifier:(id)a3 component:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v8 = v6;
  v21 = v8;
  -[SXNamespacedObjectReferences referencesForComponent:map:](self, "referencesForComponent:map:", v7, self->_textStyleReferences);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __94__SXNamespacedObjectReferences_textStyleIdentifierForNamespacedTextStyleIdentifier_component___block_invoke;
  v13[3] = &unk_24D687510;
  v10 = v8;
  v14 = v10;
  v15 = &v16;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __94__SXNamespacedObjectReferences_textStyleIdentifierForNamespacedTextStyleIdentifier_component___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  SXNamespacedObjectReferences *v4;

  v4 = objc_alloc_init(SXNamespacedObjectReferences);
  -[SXNamespacedObjectReferences populateWithSource:](v4, "populateWithSource:", self);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SXMutableNamespacedObjectReferences *v4;

  v4 = objc_alloc_init(SXMutableNamespacedObjectReferences);
  -[SXNamespacedObjectReferences populateWithSource:](v4, "populateWithSource:", self);
  return v4;
}

- (void)populateWithSource:(id)a3
{
  void *v4;
  NSMutableDictionary *componentStyleReferences;
  void **v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v4 = (void *)*((_QWORD *)a3 + 1);
  componentStyleReferences = self->_componentStyleReferences;
  v6 = (void **)a3;
  __51__SXNamespacedObjectReferences_populateWithSource___block_invoke((uint64_t)v6, v4, componentStyleReferences);
  __51__SXNamespacedObjectReferences_populateWithSource___block_invoke(v7, v6[2], self->_componentTextStyleReferences);
  v8 = v6[3];

  __51__SXNamespacedObjectReferences_populateWithSource___block_invoke(v9, v8, self->_textStyleReferences);
}

void __51__SXNamespacedObjectReferences_populateWithSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__SXNamespacedObjectReferences_populateWithSource___block_invoke_2;
  v6[3] = &unk_24D687538;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __51__SXNamespacedObjectReferences_populateWithSource___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

- (id)referencesForComponent:(id)a3 map:(id)a4
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
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, v5);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStyleReferences, 0);
  objc_storeStrong((id *)&self->_componentTextStyleReferences, 0);
  objc_storeStrong((id *)&self->_componentStyleReferences, 0);
}

@end
