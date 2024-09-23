@implementation SXNamespacedObjectFactory

- (void)createNamespacedComponentStylesReferencesForComponent:(id)a3 DOM:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v7, "analysis", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentStylesForComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = -[SXNamespacedObjectFactory createNamespacedReferenceForComponentStyle:component:DOM:](self, "createNamespacedReferenceForComponentStyle:component:DOM:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), v6, v7);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (id)createNamespacedReferenceForComponentStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SXComponentStyle *v17;
  void *v18;
  SXComponentStyle *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7
    && (objc_msgSend(v9, "componentStyles"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "objectForKey:", v7),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v12))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "JSONRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("identifier"));
    v17 = [SXComponentStyle alloc];
    objc_msgSend(v12, "specificationVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SXJSONObject initWithJSONObject:andVersion:](v17, "initWithJSONObject:andVersion:", v16, v18);

    objc_msgSend(v10, "componentStyles");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v19, v14);

    objc_msgSend(v10, "analysis");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeComponentStyle:component:", v7, v8);
    objc_msgSend(v21, "addComponentStyle:component:", v14, v8);
    objc_msgSend(v21, "namespacedObjectReferences");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNamespacedComponentStyleIdentifier:forIdentifier:component:", v14, v7, v8);

    objc_msgSend(v21, "conditionalObjectAnalysis");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "conditionTypesUsedByComponentStyle:", v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addComponentStyleIdentifier:conditionTypes:", v14, v24);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)createNamespacedComponentTextStylesReferencesForComponent:(id)a3 DOM:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v7, "analysis", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentTextStylesForComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = -[SXNamespacedObjectFactory createNamespacedReferenceForComponentTextStyle:component:DOM:](self, "createNamespacedReferenceForComponentTextStyle:component:DOM:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), v6, v7);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (id)createNamespacedReferenceForComponentTextStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SXComponentTextStyle *v17;
  void *v18;
  SXComponentTextStyle *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7
    && (objc_msgSend(v9, "componentTextStyles"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "objectForKey:", v7),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v12))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "JSONRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("identifier"));
    v17 = [SXComponentTextStyle alloc];
    objc_msgSend(v12, "specificationVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SXJSONObject initWithJSONObject:andVersion:](v17, "initWithJSONObject:andVersion:", v16, v18);

    objc_msgSend(v10, "componentTextStyles");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v19, v14);

    objc_msgSend(v10, "analysis");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeComponentTextStyle:component:", v7, v8);
    objc_msgSend(v21, "addComponentTextStyle:component:", v14, v8);
    objc_msgSend(v21, "namespacedObjectReferences");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNamespacedComponentTextStyleIdentifier:forIdentifier:component:", v14, v7, v8);

    objc_msgSend(v21, "conditionalObjectAnalysis");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "conditionTypesUsedByComponentTextStyle:", v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addComponentTextStyleIdentifier:conditionTypes:", v14, v24);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)createNamespacedTextStylesReferencesForComponent:(id)a3 DOM:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v7, "analysis", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textStylesForComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = -[SXNamespacedObjectFactory createNamespacedReferenceForTextStyle:component:DOM:](self, "createNamespacedReferenceForTextStyle:component:DOM:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), v6, v7);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (id)createNamespacedReferenceForTextStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SXTextStyle *v17;
  void *v18;
  SXTextStyle *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7
    && (objc_msgSend(v9, "textStyles"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "objectForKey:", v7),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v12))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "JSONRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("identifier"));
    v17 = [SXTextStyle alloc];
    objc_msgSend(v12, "specificationVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SXJSONObject initWithJSONObject:andVersion:](v17, "initWithJSONObject:andVersion:", v16, v18);

    objc_msgSend(v10, "textStyles");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v19, v14);

    objc_msgSend(v10, "analysis");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeTextStyle:component:", v7, v8);
    objc_msgSend(v21, "addTextStyle:component:", v14, v8);
    objc_msgSend(v21, "namespacedObjectReferences");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNamespacedTextStyleIdentifier:forIdentifier:component:", v14, v7, v8);

    objc_msgSend(v21, "conditionalObjectAnalysis");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "conditionTypesUsedByTextStyle:", v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addTextStyleIdentifier:conditionTypes:", v14, v24);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
