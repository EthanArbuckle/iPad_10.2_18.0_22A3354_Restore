@implementation SXTangierTextRenderCollector

- (SXTangierTextRenderCollector)init
{
  SXTangierTextRenderCollector *v2;
  uint64_t v3;
  NSMutableDictionary *flows;
  uint64_t v5;
  NSMutableDictionary *layoutsByComponentIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SXTangierTextRenderCollector;
  v2 = -[SXTangierTextRenderCollector init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    flows = v2->_flows;
    v2->_flows = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    layoutsByComponentIdentifier = v2->_layoutsByComponentIdentifier;
    v2->_layoutsByComponentIdentifier = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)addTextStorage:(id)a3 withLayout:(id)a4 forNamedFlow:(id)a5 directLayerHostView:(id)a6 selectable:(BOOL)a7 componentIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  -[SXTangierTextRenderCollector previousFlows](self, "previousFlows");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTangierTextRenderCollector itemWithIdentifier:storage:directLayerHost:inItems:](self, "itemWithIdentifier:storage:directLayerHost:inItems:", v17, v21, v16, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    -[SXTangierTextRenderCollectorItem updateWithLayout:]((uint64_t)v20, v14);
  else
    v20 = -[SXTangierTextRenderCollectorItem initWithStorage:layout:directLayerHost:selectable:componentIdentifier:]((id *)[SXTangierTextRenderCollectorItem alloc], v21, v14, v16, a7, v17);
  -[SXTangierTextRenderCollector storeItem:forFlowName:](self, "storeItem:forFlowName:", v20, v15);

}

- (id)itemWithIdentifier:(id)a3 storage:(id)a4 directLayerHost:(id)a5 inItems:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v31 = v10;
  v13 = objc_msgSend(v10, "length");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v15)
    goto LABEL_16;
  v16 = v15;
  v17 = *(_QWORD *)v34;
  v29 = v14;
  v30 = v9;
  v28 = v13;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v34 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      -[SXTangierTextRenderCollectorItem directLayerHost]((uint64_t)v19);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (v20 != v11)
        goto LABEL_13;
      -[SXTangierTextRenderCollectorItem storage]((uint64_t)v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "length") != v13)
        goto LABEL_12;
      -[SXTangierTextRenderCollectorItem componentIdentifier]((uint64_t)v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isEqualToString:", v9) & 1) == 0)
      {

LABEL_12:
        v20 = v11;
LABEL_13:

        continue;
      }
      -[SXTangierTextRenderCollectorItem storage]((uint64_t)v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "string");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "string");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v24, "isEqualToString:", v25);

      v9 = v30;
      v14 = v29;

      v13 = v28;
      if (v32)
      {
        v26 = v19;
        goto LABEL_17;
      }
    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  }
  while (v16);
LABEL_16:
  v26 = 0;
LABEL_17:

  return v26;
}

- (void)buildFlowsAndUpdateInfosWithICC:(id)a3 updateBlock:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[SXTangierTextRenderCollector flows](self, "flows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[SXTangierTextRenderCollector setPreviousFlows:](self, "setPreviousFlows:", v8);

  -[SXTangierTextRenderCollector flows](self, "flows");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  -[SXTangierTextRenderCollector layoutsByComponentIdentifier](self, "layoutsByComponentIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  if (v6)
    v6[2](v6);
  -[SXTangierTextRenderCollector buildFlowsAndUpdateInfosWithICC:](self, "buildFlowsAndUpdateInfosWithICC:", v11);
  -[SXTangierTextRenderCollector setPreviousFlows:](self, "setPreviousFlows:", 0);

}

- (void)buildFlowsAndUpdateInfosWithICC:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  SXTangierTextRenderCollector *v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[SXTangierTextRenderCollector flows](self, "flows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__SXTangierTextRenderCollector_buildFlowsAndUpdateInfosWithICC___block_invoke;
  v9[3] = &unk_24D68CBC8;
  v10 = v5;
  v11 = v4;
  v12 = self;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  objc_msgSend(v7, "setInfosToDisplay:", v8);
  objc_msgSend(v7, "invalidateReps");

}

void __64__SXTangierTextRenderCollector_buildFlowsAndUpdateInfosWithICC___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  SXTextTangierFlowStorage *v9;
  SXTextTangierFlowStorage *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();
  -[SXAnimatedImageFrame index](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SXAnimatedImageFrame index](v7);
    v9 = (SXTextTangierFlowStorage *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = [SXTextTangierFlowStorage alloc];
    -[SXTangierTextRenderCollectorItem storage](v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTangierTextRenderCollectorItem storage](v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stylesheet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTangierTextRenderCollectorItem storage](v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SXTextTangierFlowStorage initWithContext:string:stylesheet:kind:flowName:](v10, "initWithContext:string:stylesheet:kind:flowName:", v12, &stru_24D68E0F8, v14, objc_msgSend(v15, "wpKind"), v5);

  }
  v34 = (void *)v7;
  v35 = v5;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v16);
        v22 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (-[SXTangierTextRenderCollectorItem flowRange](v22) == 0x7FFFFFFFFFFFFFFFLL)
        {
          if ((v19 & 1) != 0)
            -[TSWPStorage insertString:atCharIndex:undoTransaction:](v9, "insertString:atCharIndex:undoTransaction:", CFSTR("\n"), -[TSWPStorage length](v9, "length", v34, v35), 0);
          -[SXTangierTextRenderCollectorItem appendToFlowStorage:](v22, v9);
        }
        v19 = 1;
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v18);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v23 = v16;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD **)(*((_QWORD *)&v36 + 1) + 8 * j);
        -[SXTangierTextRenderCollectorItem flowInfo](v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "addObject:", v29);
        -[SXTangierTextRenderCollectorItem flowLayoutWithICC:](v28, a1[5]);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "layoutController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "preregisterLayout:", v30);

        objc_msgSend(a1[6], "layoutsByComponentIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXTangierTextRenderCollectorItem componentIdentifier]((uint64_t)v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKey:", v30, v33);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v25);
  }

}

- (id)infoForStorage:(id)a3 selection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  TSUDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTangierTextRenderCollector flows](self, "flows");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flowName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v7, "range");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v19 = -[SXTangierTextRenderCollectorItem flowRange]((uint64_t)v18);
        if (v12 >= v19 && v12 - v19 < v20)
        {
          -[SXTangierTextRenderCollectorItem flowInfo](v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }
  v22 = 0;
LABEL_14:

  return v22;
}

- (id)flowLayoutForComponentIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[SXTangierTextRenderCollector layoutsByComponentIdentifier](self, "layoutsByComponentIdentifier");
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

- (id)componentIdentifierForFlowLayout:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[SXTangierTextRenderCollector layoutsByComponentIdentifier](self, "layoutsByComponentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__SXTangierTextRenderCollector_componentIdentifierForFlowLayout___block_invoke;
  v10[3] = &unk_24D68CBF0;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "keysOfEntriesPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __65__SXTangierTextRenderCollector_componentIdentifierForFlowLayout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(_QWORD *)(a1 + 32) == a3;
}

- (BOOL)tangierTextRepAllowsSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _QWORD *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXTangierTextRenderCollector flows](self, "flows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flowName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[SXTangierTextRenderCollectorItem flowInfo](v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "info", (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 == v15)
        {
          LOBYTE(v10) = -[SXTangierTextRenderCollectorItem selectable]((_BOOL8)v13);
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (void)storeItem:(id)a3 forFlowName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SXTangierTextRenderCollector flows](self, "flows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTangierTextRenderCollector flows](self, "flows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v6);

  }
  objc_msgSend(v8, "addObject:", v10);

}

- (NSMutableDictionary)flows
{
  return self->_flows;
}

- (void)setFlows:(id)a3
{
  objc_storeStrong((id *)&self->_flows, a3);
}

- (NSDictionary)previousFlows
{
  return self->_previousFlows;
}

- (void)setPreviousFlows:(id)a3
{
  objc_storeStrong((id *)&self->_previousFlows, a3);
}

- (NSMutableDictionary)layoutsByComponentIdentifier
{
  return self->_layoutsByComponentIdentifier;
}

- (void)setLayoutsByComponentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_layoutsByComponentIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutsByComponentIdentifier, 0);
  objc_storeStrong((id *)&self->_previousFlows, 0);
  objc_storeStrong((id *)&self->_flows, 0);
}

@end
