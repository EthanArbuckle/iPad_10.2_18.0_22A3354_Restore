@implementation TSSStyleMapper

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSSStyleMapper;
  -[TSSStyleMapper dealloc](&v3, sel_dealloc);
}

- (TSSStyleMapper)initWithTargetStylesheet:(id)a3 newStyleDOLCContext:(id)a4
{
  TSSStyleMapper *v6;

  v6 = -[TSSStyleMapper init](self, "init");
  if (v6)
  {
    v6->_targetStylesheet = (TSSStylesheet *)a3;
    v6->_targetThemeStylesheet = (TSSStylesheet *)(id)objc_msgSend(a3, "parent");
    v6->_dolcContext = (TSKAddedToDocumentContext *)a4;
    v6->_forceMatchStyle = 0;
  }
  return v6;
}

- (TSSStylesheet)targetStylesheet
{
  uint64_t v2;

  v2 = 16;
  if (!self->_varyInThemeStylesheet)
    v2 = 8;
  return *(TSSStylesheet **)((char *)&self->super.isa + v2);
}

- (void)pushMappingContext:(id)a3
{
  NSMutableArray *mappingContext;

  mappingContext = self->_mappingContext;
  if (!mappingContext)
  {
    mappingContext = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_mappingContext = mappingContext;
  }
  -[NSMutableArray addObject:](mappingContext, "addObject:", a3);
}

- (void)popMappingContext:(id)a3
{
  NSMutableArray *mappingContext;

  mappingContext = self->_mappingContext;
  if (mappingContext)
  {
    if (-[NSMutableArray count](mappingContext, "count", a3))
      -[NSMutableArray removeLastObject](self->_mappingContext, "removeLastObject");
  }
}

- (id)pCascadedFindExistingRootlessStyle:(id)a3 propertyMap:(id)a4
{
  id result;
  TSSStylesheet *targetThemeStylesheet;

  result = -[TSSStylesheet firstRootlessStyleOfClass:withOverridePropertyMap:](self->_targetStylesheet, "firstRootlessStyleOfClass:withOverridePropertyMap:", objc_opt_class(), a4);
  if (!result)
  {
    targetThemeStylesheet = self->_targetThemeStylesheet;
    if (targetThemeStylesheet)
      return -[TSSStylesheet firstRootlessStyleOfClass:withOverridePropertyMap:](targetThemeStylesheet, "firstRootlessStyleOfClass:withOverridePropertyMap:", objc_opt_class(), a4);
    else
      return 0;
  }
  return result;
}

- (id)createStyleForStyle:(id)a3 withPropertyMap:(id)a4
{
  void *v5;

  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:name:overridePropertyMap:isVariation:", -[TSPObject context](self->_targetStylesheet, "context"), 0, a4, 0);
  -[TSSStylesheet addStyle:](self->_targetStylesheet, "addStyle:", v5);

  return v5;
}

- (id)pTargetParentForStyle:(id)a3 withParentIdentifier:(id)a4
{
  id result;
  id v7;

  result = -[TSSStylesheet cascadedStyleWithIdentifier:](self->_targetStylesheet, "cascadedStyleWithIdentifier:", a4);
  if (!result)
  {
    if ((objc_msgSend((id)String(a4), "isEqualToString:", CFSTR("imported")) & 1) != 0)
    {
      return 0;
    }
    else
    {
      result = (id)String(a4);
      if (result)
      {
        v7 = result;
        result = (id)String(a4);
        if (result)
          return -[TSSStylesheet cascadedStyleWithIdentifier:componentMask:](self->_targetStylesheet, "cascadedStyleWithIdentifier:componentMask:", String((uint64_t)v7, 0, (uint64_t)result), 7);
      }
    }
  }
  return result;
}

- (id)_mappedStyleForStyle:(id)a3 depth:(unint64_t)a4
{
  TSURetainedPointerKeyDictionary *styleMap;
  TSSStylesheet *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[8];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  styleMap = self->_styleMap;
  if (!styleMap)
    styleMap = (TSURetainedPointerKeyDictionary *)objc_alloc_init(MEMORY[0x24BEB3D00]);
  self->_styleMap = styleMap;
  v8 = (TSSStylesheet *)objc_msgSend(a3, "stylesheet");
  if (v8 == self->_targetStylesheet && !self->_varyInThemeStylesheet || v8 == self->_targetThemeStylesheet)
    return a3;
  v9 = (id)-[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->_styleMap, "objectForKeyedSubscript:", a3);
  if (!v9)
  {
    v10 = +[TSSStylePromise promiseForStyle:](TSSStylePromise, "promiseForStyle:", a3);
    -[TSURetainedPointerKeyDictionary setObject:forKeyedSubscript:](self->_styleMap, "setObject:forKeyedSubscript:", v10, a3);
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_msgSend(a3, "propertyMap");
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __45__TSSStyleMapper__mappedStyleForStyle_depth___block_invoke;
    v27[3] = &unk_24D82B1E0;
    v27[4] = self;
    v27[5] = v11;
    v27[6] = v12;
    v27[7] = a4;
    objc_msgSend(v12, "enumeratePropertiesAndObjectsUsingBlock:", v27);
    v13 = objc_msgSend((id)objc_msgSend(a3, "rootIdentifiedAncestor"), "styleIdentifier");
    if (v13
      && (v14 = -[TSSStyleMapper pTargetParentForStyle:withParentIdentifier:](self, "pTargetParentForStyle:withParentIdentifier:", a3, v13)) != 0)
    {
      v9 = v14;
      if (self->_forceMatchStyle)
        goto LABEL_19;
      v15 = 16;
      if (!self->_varyInThemeStylesheet)
        v15 = 8;
      v16 = *(Class *)((char *)&self->super.isa + v15);
      objc_msgSend(v12, "filterWithProperties:", objc_msgSend((id)objc_opt_class(), "properties"));
      v17 = (id)objc_msgSend(v16, "variationOfStyle:propertyMap:", v9, v12);
    }
    else
    {
      v9 = -[TSSStyleMapper pCascadedFindExistingRootlessStyle:propertyMap:](self, "pCascadedFindExistingRootlessStyle:propertyMap:", a3, v12);
      if (v9)
        goto LABEL_19;
      v17 = -[TSSStyleMapper createStyleForStyle:withPropertyMap:](self, "createStyleForStyle:withPropertyMap:", a3, v12);
    }
    v9 = v17;
    if (!v17)
    {
LABEL_27:

      return v9;
    }
LABEL_19:
    -[TSURetainedPointerKeyDictionary setObject:forKeyedSubscript:](self->_styleMap, "setObject:forKeyedSubscript:", v9, a3);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "addPromisee:", v9);
        }
        v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v19);
    }
    objc_msgSend(v10, "fulfillWithStyle:", v9);
    goto LABEL_27;
  }
  return v9;
}

uint64_t __45__TSSStyleMapper__mappedStyleForStyle_depth___block_invoke(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;

  if (!a3)
  {
    v6 = result;
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      v7 = objc_msgSend(*(id *)(v6 + 32), "_mappedStyleForStyle:depth:", a4, *(_QWORD *)(v6 + 56) + 1);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(*(id *)(v6 + 40), "addObject:", v7);
      return objc_msgSend(*(id *)(v6 + 48), "setObject:forProperty:", v7, a2);
    }
  }
  return result;
}

- (id)mappedStyleForStyle:(id)a3
{
  return -[TSSStyleMapper _mappedStyleForStyle:depth:](self, "_mappedStyleForStyle:depth:", a3, 0);
}

- (id)mappedStyleForStyle:(id)a3 inThemeStylesheet:(BOOL)a4
{
  id v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  v12 = 0;
  if (a4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __56__TSSStyleMapper_mappedStyleForStyle_inThemeStylesheet___block_invoke;
    v6[3] = &unk_24D82B208;
    v6[5] = a3;
    v6[6] = &v7;
    v6[4] = self;
    -[TSSStyleMapper varyInThemeStylesheetForDurationOfBlock:](self, "varyInThemeStylesheetForDurationOfBlock:", v6);
    v4 = (id)v8[5];
  }
  else
  {
    v4 = -[TSSStyleMapper mappedStyleForStyle:](self, "mappedStyleForStyle:", a3);
    v8[5] = (uint64_t)v4;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __56__TSSStyleMapper_mappedStyleForStyle_inThemeStylesheet___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "mappedStyleForStyle:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (void)varyInThemeStylesheetForDurationOfBlock:(id)a3
{
  if (self->_varyInThemeStylesheet)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    self->_varyInThemeStylesheet = 1;
    -[TSSStylesheet setIsLocked:](self->_targetThemeStylesheet, "setIsLocked:", 0);
    (*((void (**)(id))a3 + 2))(a3);
    -[TSSStylesheet setIsLocked:](self->_targetThemeStylesheet, "setIsLocked:", 1);
    self->_varyInThemeStylesheet = 0;
  }
}

- (void)varyInThemeStylesheetIf:(BOOL)a3 forDurationOfBlock:(id)a4
{
  if (a3)
    -[TSSStyleMapper varyInThemeStylesheetForDurationOfBlock:](self, "varyInThemeStylesheetForDurationOfBlock:", a4);
  else
    (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)forceMatchStyle
{
  return self->_forceMatchStyle;
}

- (void)setForceMatchStyle:(BOOL)a3
{
  self->_forceMatchStyle = a3;
}

@end
