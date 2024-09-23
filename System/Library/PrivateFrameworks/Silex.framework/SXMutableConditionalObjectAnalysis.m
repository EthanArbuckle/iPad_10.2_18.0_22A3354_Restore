@implementation SXMutableConditionalObjectAnalysis

- (void)addComponentIdentifier:(id)a3 conditionTypes:(id)a4
{
  NSMutableDictionary *conditionsToComponentsMap;
  id v7;
  id v8;

  conditionsToComponentsMap = self->super._conditionsToComponentsMap;
  v7 = a4;
  v8 = a3;
  -[SXMutableConditionalObjectAnalysis addObject:keys:map:](self, "addObject:keys:map:", v8, v7, conditionsToComponentsMap);
  -[SXMutableConditionalObjectAnalysis addObjects:key:map:](self, "addObjects:key:map:", v7, v8, self->super._componentsToConditionsMap);

}

- (void)removeComponentIdentifier:(id)a3 conditionTypes:(id)a4
{
  NSMutableDictionary *conditionsToComponentsMap;
  id v7;
  id v8;

  conditionsToComponentsMap = self->super._conditionsToComponentsMap;
  v7 = a4;
  v8 = a3;
  -[SXMutableConditionalObjectAnalysis removeObject:keys:map:](self, "removeObject:keys:map:", v8, v7, conditionsToComponentsMap);
  -[SXMutableConditionalObjectAnalysis removeObjects:key:map:](self, "removeObjects:key:map:", v7, v8, self->super._componentsToConditionsMap);

}

- (void)addComponentStyleIdentifier:(id)a3 conditionTypes:(id)a4
{
  NSMutableDictionary *conditionsToComponentStylesMap;
  id v7;
  id v8;

  conditionsToComponentStylesMap = self->super._conditionsToComponentStylesMap;
  v7 = a4;
  v8 = a3;
  -[SXMutableConditionalObjectAnalysis addObject:keys:map:](self, "addObject:keys:map:", v8, v7, conditionsToComponentStylesMap);
  -[SXMutableConditionalObjectAnalysis addObjects:key:map:](self, "addObjects:key:map:", v7, v8, self->super._componentStylesToConditionsMap);

}

- (void)removeComponentStyleIdentifier:(id)a3 conditionTypes:(id)a4
{
  NSMutableDictionary *conditionsToComponentStylesMap;
  id v7;
  id v8;

  conditionsToComponentStylesMap = self->super._conditionsToComponentStylesMap;
  v7 = a4;
  v8 = a3;
  -[SXMutableConditionalObjectAnalysis removeObject:keys:map:](self, "removeObject:keys:map:", v8, v7, conditionsToComponentStylesMap);
  -[SXMutableConditionalObjectAnalysis removeObjects:key:map:](self, "removeObjects:key:map:", v7, v8, self->super._componentStylesToConditionsMap);

}

- (void)addComponentTextStyleIdentifier:(id)a3 conditionTypes:(id)a4
{
  NSMutableDictionary *conditionsToComponentTextStylesMap;
  id v7;
  id v8;

  conditionsToComponentTextStylesMap = self->super._conditionsToComponentTextStylesMap;
  v7 = a4;
  v8 = a3;
  -[SXMutableConditionalObjectAnalysis addObject:keys:map:](self, "addObject:keys:map:", v8, v7, conditionsToComponentTextStylesMap);
  -[SXMutableConditionalObjectAnalysis addObjects:key:map:](self, "addObjects:key:map:", v7, v8, self->super._componentTextStylesToConditionsMap);

}

- (void)removeComponentTextStyleIdentifier:(id)a3 conditionTypes:(id)a4
{
  NSMutableDictionary *conditionsToComponentTextStylesMap;
  id v7;
  id v8;

  conditionsToComponentTextStylesMap = self->super._conditionsToComponentTextStylesMap;
  v7 = a4;
  v8 = a3;
  -[SXMutableConditionalObjectAnalysis removeObject:keys:map:](self, "removeObject:keys:map:", v8, v7, conditionsToComponentTextStylesMap);
  -[SXMutableConditionalObjectAnalysis removeObjects:key:map:](self, "removeObjects:key:map:", v7, v8, self->super._componentTextStylesToConditionsMap);

}

- (void)addTextStyleIdentifier:(id)a3 conditionTypes:(id)a4
{
  NSMutableDictionary *conditionsToTextStylesMap;
  id v7;
  id v8;

  conditionsToTextStylesMap = self->super._conditionsToTextStylesMap;
  v7 = a4;
  v8 = a3;
  -[SXMutableConditionalObjectAnalysis addObject:keys:map:](self, "addObject:keys:map:", v8, v7, conditionsToTextStylesMap);
  -[SXMutableConditionalObjectAnalysis addObjects:key:map:](self, "addObjects:key:map:", v7, v8, self->super._textStylesToConditionsMap);

}

- (void)removeTextStyleIdentifier:(id)a3 conditionTypes:(id)a4
{
  NSMutableDictionary *conditionsToTextStylesMap;
  id v7;
  id v8;

  conditionsToTextStylesMap = self->super._conditionsToTextStylesMap;
  v7 = a4;
  v8 = a3;
  -[SXMutableConditionalObjectAnalysis removeObject:keys:map:](self, "removeObject:keys:map:", v8, v7, conditionsToTextStylesMap);
  -[SXMutableConditionalObjectAnalysis removeObjects:key:map:](self, "removeObjects:key:map:", v7, v8, self->super._textStylesToConditionsMap);

}

- (void)addComponentLayoutIdentifier:(id)a3 conditionTypes:(id)a4
{
  NSMutableDictionary *conditionsToComponentLayoutsMap;
  id v7;
  id v8;

  conditionsToComponentLayoutsMap = self->super._conditionsToComponentLayoutsMap;
  v7 = a4;
  v8 = a3;
  -[SXMutableConditionalObjectAnalysis addObject:keys:map:](self, "addObject:keys:map:", v8, v7, conditionsToComponentLayoutsMap);
  -[SXMutableConditionalObjectAnalysis addObjects:key:map:](self, "addObjects:key:map:", v7, v8, self->super._componentLayoutsToConditionsMap);

}

- (void)removeComponentLayoutIdentifier:(id)a3 conditionTypes:(id)a4
{
  NSMutableDictionary *conditionsToComponentLayoutsMap;
  id v7;
  id v8;

  conditionsToComponentLayoutsMap = self->super._conditionsToComponentLayoutsMap;
  v7 = a4;
  v8 = a3;
  -[SXMutableConditionalObjectAnalysis removeObject:keys:map:](self, "removeObject:keys:map:", v8, v7, conditionsToComponentLayoutsMap);
  -[SXMutableConditionalObjectAnalysis removeObjects:key:map:](self, "removeObjects:key:map:", v7, v8, self->super._componentLayoutsToConditionsMap);

}

- (void)setDocumentStyleConditionTypes:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *documentStyleConditionTypes;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  documentStyleConditionTypes = self->super._documentStyleConditionTypes;
  self->super._documentStyleConditionTypes = v4;

}

- (void)addObject:(id)a3 keys:(id)a4 map:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v9);
        -[SXConditionalObjectAnalysis objectsForKey:map:](self, "objectsForKey:map:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14), v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v8);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)addObjects:(id)a3 key:(id)a4 map:(id)a5
{
  id v8;
  id v9;

  v8 = a3;
  -[SXConditionalObjectAnalysis objectsForKey:map:](self, "objectsForKey:map:", a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v8);

}

- (void)removeObject:(id)a3 keys:(id)a4 map:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v9);
        -[SXConditionalObjectAnalysis objectsForKey:map:](self, "objectsForKey:map:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14), v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeObject:", v8);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)removeObjects:(id)a3 key:(id)a4 map:(id)a5
{
  id v8;
  id v9;

  v8 = a3;
  -[SXConditionalObjectAnalysis objectsForKey:map:](self, "objectsForKey:map:", a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v8);

}

@end
