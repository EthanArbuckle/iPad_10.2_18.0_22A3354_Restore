@implementation SXDOMObjectProvider

- (SXDOMObjectProvider)initWithDocumentControllerProvider:(id)a3 componentStyleMerger:(id)a4 componentTextStyleMerger:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXDOMObjectProvider *v12;
  SXDOMObjectProvider *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXDOMObjectProvider;
  v12 = -[SXDOMObjectProvider init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_documentControllerProvider, a3);
    objc_storeStrong((id *)&v13->_componentStyleMerger, a4);
    objc_storeStrong((id *)&v13->_componentTextStyleMerger, a5);
  }

  return v13;
}

- (SXDocumentStyle)documentStyle
{
  return -[SXDOM documentStyle](self->_DOM, "documentStyle");
}

- (SXComponents)components
{
  return -[SXDOM components](self->_DOM, "components");
}

- (SXAutoPlacement)autoPlacement
{
  return -[SXDOM autoPlacement](self->_DOM, "autoPlacement");
}

- (id)componentLayoutForIdentifier:(id)a3
{
  SXDOM *DOM;
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    DOM = self->_DOM;
    v4 = a3;
    -[SXDOM componentLayouts](DOM, "componentLayouts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)componentStyleForComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v4, "classification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultComponentStyleIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

  }
  -[SXDOM analysis](self->_DOM, "analysis");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "namespacedObjectReferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "namespacedComponentStyleIdentifiersForIdentifiers:component:", v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXDOMObjectProvider componentStyleForIdentifiers:](self, "componentStyleForIdentifiers:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)componentStyleForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDOM componentStyles](self->_DOM, "componentStyles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[SXJSONObjectMerger mergeObjects:](self->_componentStyleMerger, "mergeObjects:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)textStyleForIdentifier:(id)a3 component:(id)a4
{
  SXDOM *DOM;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3)
  {
    DOM = self->_DOM;
    v7 = a4;
    v8 = a3;
    -[SXDOM analysis](DOM, "analysis");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "namespacedObjectReferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "namespacedTextStyleIdentifierForIdentifier:component:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXDOM textStyles](self->_DOM, "textStyles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)componentTextStyleForIdentifier:(id)a3 component:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v12 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXDOMObjectProvider componentTextStyleForIdentifiers:component:](self, "componentTextStyleForIdentifiers:component:", v9, v7, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)componentTextStyleForIdentifiers:(id)a3 component:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDOM componentTextStyles](self->_DOM, "componentTextStyles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[SXDOM analysis](self->_DOM, "analysis");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "namespacedObjectReferences");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "namespacedComponentTextStyleIdentifierForIdentifier:component:", v13, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v22, "addObject:", v18);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v22, "count"))
  {
    -[SXJSONObjectMerger mergeObjects:](self->_componentTextStyleMerger, "mergeObjects:", v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)componentTextStyleForIdentifier:(id)a3 classification:(id)a4 component:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(a4, "defaultTextStyleIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v12, "addObject:", v8);
  -[SXDOMObjectProvider componentTextStyleForIdentifiers:component:](self, "componentTextStyleForIdentifiers:component:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)componentTextStyleForIdentifier:(id)a3 inheritingFromComponentTextStyle:(id)a4 component:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SXDOMObjectProvider componentTextStyleForIdentifier:component:](self, "componentTextStyleForIdentifier:component:", v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_4;
    goto LABEL_3;
  }
  v12 = 0;
  if (v9)
LABEL_3:
    objc_msgSend(v11, "addObject:", v9);
LABEL_4:
  if (v12)
    objc_msgSend(v11, "addObject:", v12);
  if (objc_msgSend(v11, "count"))
  {
    -[SXJSONObjectMerger mergeObjects:](self->_componentTextStyleMerger, "mergeObjects:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)resourceForIdentifier:(id)a3
{
  SXDOM *DOM;
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    DOM = self->_DOM;
    v4 = a3;
    -[SXDOM resources](DOM, "resources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)imageResourceForIdentifier:(id)a3
{
  SXDocumentControllerProvider *documentControllerProvider;
  id v4;
  void *v5;
  void *v6;

  documentControllerProvider = self->_documentControllerProvider;
  v4 = a3;
  -[SXDocumentControllerProvider documentController](documentControllerProvider, "documentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageResourceForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SXDOM)DOM
{
  return self->_DOM;
}

- (void)setDOM:(id)a3
{
  objc_storeStrong((id *)&self->_DOM, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentTextStyleMerger, 0);
  objc_storeStrong((id *)&self->_componentStyleMerger, 0);
  objc_storeStrong((id *)&self->_documentControllerProvider, 0);
  objc_storeStrong((id *)&self->_DOM, 0);
}

@end
