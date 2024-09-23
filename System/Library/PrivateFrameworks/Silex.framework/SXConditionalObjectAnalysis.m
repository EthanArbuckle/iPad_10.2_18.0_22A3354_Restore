@implementation SXConditionalObjectAnalysis

- (SXConditionalObjectAnalysis)init
{
  SXConditionalObjectAnalysis *v2;
  uint64_t v3;
  NSMutableDictionary *conditionsToComponentsMap;
  uint64_t v5;
  NSMutableDictionary *componentsToConditionsMap;
  uint64_t v7;
  NSMutableDictionary *conditionsToComponentStylesMap;
  uint64_t v9;
  NSMutableDictionary *componentStylesToConditionsMap;
  uint64_t v11;
  NSMutableDictionary *conditionsToComponentLayoutsMap;
  uint64_t v13;
  NSMutableDictionary *componentLayoutsToConditionsMap;
  uint64_t v15;
  NSMutableDictionary *conditionsToComponentTextStylesMap;
  uint64_t v17;
  NSMutableDictionary *componentTextStylesToConditionsMap;
  uint64_t v19;
  NSMutableDictionary *conditionsToTextStylesMap;
  uint64_t v21;
  NSMutableDictionary *textStylesToConditionsMap;
  uint64_t v23;
  NSMutableSet *documentStyleConditionTypes;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SXConditionalObjectAnalysis;
  v2 = -[SXConditionalObjectAnalysis init](&v26, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    conditionsToComponentsMap = v2->_conditionsToComponentsMap;
    v2->_conditionsToComponentsMap = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    componentsToConditionsMap = v2->_componentsToConditionsMap;
    v2->_componentsToConditionsMap = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    conditionsToComponentStylesMap = v2->_conditionsToComponentStylesMap;
    v2->_conditionsToComponentStylesMap = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    componentStylesToConditionsMap = v2->_componentStylesToConditionsMap;
    v2->_componentStylesToConditionsMap = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    conditionsToComponentLayoutsMap = v2->_conditionsToComponentLayoutsMap;
    v2->_conditionsToComponentLayoutsMap = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    componentLayoutsToConditionsMap = v2->_componentLayoutsToConditionsMap;
    v2->_componentLayoutsToConditionsMap = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    conditionsToComponentTextStylesMap = v2->_conditionsToComponentTextStylesMap;
    v2->_conditionsToComponentTextStylesMap = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    componentTextStylesToConditionsMap = v2->_componentTextStylesToConditionsMap;
    v2->_componentTextStylesToConditionsMap = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    conditionsToTextStylesMap = v2->_conditionsToTextStylesMap;
    v2->_conditionsToTextStylesMap = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    textStylesToConditionsMap = v2->_textStylesToConditionsMap;
    v2->_textStylesToConditionsMap = (NSMutableDictionary *)v21;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    documentStyleConditionTypes = v2->_documentStyleConditionTypes;
    v2->_documentStyleConditionTypes = (NSMutableSet *)v23;

  }
  return v2;
}

- (id)componentsUsingConditionType:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXConditionalObjectAnalysis componentsUsingConditionTypes:](self, "componentsUsingConditionTypes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)componentsUsingConditionTypes:(id)a3
{
  return -[SXConditionalObjectAnalysis objectsForKeys:map:](self, "objectsForKeys:map:", a3, self->_conditionsToComponentsMap);
}

- (id)conditionTypesUsedByComponent:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXConditionalObjectAnalysis conditionTypesUsedByComponents:](self, "conditionTypesUsedByComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)conditionTypesUsedByComponents:(id)a3
{
  return -[SXConditionalObjectAnalysis objectsForKeys:map:](self, "objectsForKeys:map:", a3, self->_componentsToConditionsMap);
}

- (id)componentStylesUsingConditionType:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXConditionalObjectAnalysis componentStylesUsingConditionTypes:](self, "componentStylesUsingConditionTypes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)componentStylesUsingConditionTypes:(id)a3
{
  return -[SXConditionalObjectAnalysis objectsForKeys:map:](self, "objectsForKeys:map:", a3, self->_conditionsToComponentStylesMap);
}

- (id)conditionTypesUsedByComponentStyle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXConditionalObjectAnalysis conditionTypesUsedByComponentStyles:](self, "conditionTypesUsedByComponentStyles:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)conditionTypesUsedByComponentStyles:(id)a3
{
  return -[SXConditionalObjectAnalysis objectsForKeys:map:](self, "objectsForKeys:map:", a3, self->_componentStylesToConditionsMap);
}

- (id)componentTextStylesUsingConditionType:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXConditionalObjectAnalysis componentTextStylesUsingConditionTypes:](self, "componentTextStylesUsingConditionTypes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)componentTextStylesUsingConditionTypes:(id)a3
{
  return -[SXConditionalObjectAnalysis objectsForKeys:map:](self, "objectsForKeys:map:", a3, self->_conditionsToComponentTextStylesMap);
}

- (id)conditionTypesUsedByComponentTextStyle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXConditionalObjectAnalysis conditionTypesUsedByComponentTextStyles:](self, "conditionTypesUsedByComponentTextStyles:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)conditionTypesUsedByComponentTextStyles:(id)a3
{
  return -[SXConditionalObjectAnalysis objectsForKeys:map:](self, "objectsForKeys:map:", a3, self->_componentTextStylesToConditionsMap);
}

- (id)textStylesUsingConditionType:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXConditionalObjectAnalysis textStylesUsingConditionTypes:](self, "textStylesUsingConditionTypes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)textStylesUsingConditionTypes:(id)a3
{
  return -[SXConditionalObjectAnalysis objectsForKeys:map:](self, "objectsForKeys:map:", a3, self->_conditionsToTextStylesMap);
}

- (id)conditionTypesUsedByTextStyle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXConditionalObjectAnalysis conditionTypesUsedByTextStyles:](self, "conditionTypesUsedByTextStyles:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)conditionTypesUsedByTextStyles:(id)a3
{
  return -[SXConditionalObjectAnalysis objectsForKeys:map:](self, "objectsForKeys:map:", a3, self->_textStylesToConditionsMap);
}

- (id)componentLayoutsUsingConditionType:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXConditionalObjectAnalysis componentLayoutsUsingConditionTypes:](self, "componentLayoutsUsingConditionTypes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)componentLayoutsUsingConditionTypes:(id)a3
{
  return -[SXConditionalObjectAnalysis objectsForKeys:map:](self, "objectsForKeys:map:", a3, self->_conditionsToComponentLayoutsMap);
}

- (id)conditionTypesUsedByComponentLayout:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXConditionalObjectAnalysis conditionTypesUsedByComponentLayouts:](self, "conditionTypesUsedByComponentLayouts:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)conditionTypesUsedByComponentLayouts:(id)a3
{
  return -[SXConditionalObjectAnalysis objectsForKeys:map:](self, "objectsForKeys:map:", a3, self->_componentLayoutsToConditionsMap);
}

- (id)copyWithZone:(_NSZone *)a3
{
  SXConditionalObjectAnalysis *v4;

  v4 = objc_alloc_init(SXConditionalObjectAnalysis);
  -[SXConditionalObjectAnalysis populateWithSource:](v4, "populateWithSource:", self);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SXMutableConditionalObjectAnalysis *v4;

  v4 = objc_alloc_init(SXMutableConditionalObjectAnalysis);
  -[SXConditionalObjectAnalysis populateWithSource:](v4, "populateWithSource:", self);
  return v4;
}

- (void)populateWithSource:(id)a3
{
  void *v4;
  NSMutableDictionary *conditionsToComponentsMap;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSMutableSet *v17;
  NSMutableSet *documentStyleConditionTypes;

  v4 = (void *)*((_QWORD *)a3 + 1);
  conditionsToComponentsMap = self->_conditionsToComponentsMap;
  v6 = (void **)a3;
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke((uint64_t)v6, v4, conditionsToComponentsMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v7, v6[2], self->_componentsToConditionsMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v8, v6[3], self->_conditionsToComponentStylesMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v9, v6[4], self->_componentStylesToConditionsMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v10, v6[5], self->_conditionsToComponentLayoutsMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v11, v6[6], self->_componentLayoutsToConditionsMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v12, v6[7], self->_conditionsToComponentTextStylesMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v13, v6[8], self->_componentTextStylesToConditionsMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v14, v6[9], self->_conditionsToTextStylesMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v15, v6[10], self->_textStylesToConditionsMap);
  v16 = v6[11];

  v17 = (NSMutableSet *)objc_msgSend(v16, "mutableCopy");
  documentStyleConditionTypes = self->_documentStyleConditionTypes;
  self->_documentStyleConditionTypes = v17;

}

void __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke_2;
  v6[3] = &unk_24D68B4B0;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

- (id)objectsForKeys:(id)a3 map:(id)a4
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
        -[SXConditionalObjectAnalysis objectsForKey:map:](self, "objectsForKey:map:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), v7, (_QWORD)v17);
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

- (id)objectsForKey:(id)a3 map:(id)a4
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

- (NSSet)documentStyleConditionTypes
{
  return &self->_documentStyleConditionTypes->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentStyleConditionTypes, 0);
  objc_storeStrong((id *)&self->_textStylesToConditionsMap, 0);
  objc_storeStrong((id *)&self->_conditionsToTextStylesMap, 0);
  objc_storeStrong((id *)&self->_componentTextStylesToConditionsMap, 0);
  objc_storeStrong((id *)&self->_conditionsToComponentTextStylesMap, 0);
  objc_storeStrong((id *)&self->_componentLayoutsToConditionsMap, 0);
  objc_storeStrong((id *)&self->_conditionsToComponentLayoutsMap, 0);
  objc_storeStrong((id *)&self->_componentStylesToConditionsMap, 0);
  objc_storeStrong((id *)&self->_conditionsToComponentStylesMap, 0);
  objc_storeStrong((id *)&self->_componentsToConditionsMap, 0);
  objc_storeStrong((id *)&self->_conditionsToComponentsMap, 0);
}

@end
