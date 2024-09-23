@implementation SKUIDynamicGridViewElement

- (SKUIDynamicGridViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIDynamicGridViewElement *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDynamicGridViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIDynamicGridViewElement;
  v11 = -[SKUIGridViewElement initWithDOMElement:parent:elementFactory:](&v15, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("minimumEntityCountForSections"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      v11->_minimumEntityCountForSections = objc_msgSend(v12, "integerValue");

  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIDynamicGridViewElement *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *templateDefinitionTypeToModeValueMap;
  objc_super v9;

  v4 = (SKUIDynamicGridViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIDynamicGridViewElement;
  -[SKUIGridViewElement applyUpdatesWithElement:](&v9, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_hasValidTemplateDefinitionMap = 0;
    templateDefinitionTypeToModeValueMap = self->_templateDefinitionTypeToModeValueMap;
    self->_templateDefinitionTypeToModeValueMap = 0;

    self->_minimumEntityCountForSections = -[SKUIDynamicGridViewElement minimumEntityCountForSections](v4, "minimumEntityCountForSections");
  }

  return v6;
}

- (BOOL)isDynamicContainer
{
  return 1;
}

- (int64_t)pageComponentType
{
  return 8;
}

- (BOOL)allowsMultipleSelectionDuringEditing
{
  void *v3;
  BOOL v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SKUIDynamicGridViewElement templateDefinitionViewElementsForType:mode:](self, "templateDefinitionViewElementsForType:mode:", 0x1E73ACC70, 0x1E73ACC50);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "count") != 0;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "contentViewElement", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[SKUIGridViewElement _countOfInputCheckboxesWithBaseElement:limit:](self, "_countOfInputCheckboxesWithBaseElement:limit:", v10, 1);

        if (!v11)
        {
          v4 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)hasSectionHeaders
{
  void *v2;
  BOOL v3;

  -[SKUIDynamicGridViewElement templateDefinitionViewElementsForType:mode:](self, "templateDefinitionViewElementsForType:mode:", 0x1E73ACC90, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isMalformed
{
  void *v2;
  BOOL v3;

  -[SKUIDynamicGridViewElement templateDefinitionViewElementsForType:mode:](self, "templateDefinitionViewElementsForType:mode:", 0x1E73ACC70, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)bestTemplateDefinitionViewElementFromTemplateDefinitionViewElements:(id)a3 entityValueProvider:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "predicateListViewElement", (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "compoundEntityValuePredicate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v13)
          v16 = v14 == 0;
        else
          v16 = 1;
        if (v16 || objc_msgSend(v14, "evaluateWithObject:", v6))
        {
          v17 = v12;

          goto LABEL_16;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v17 = 0;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
  }
LABEL_16:

  return v17;
}

- (id)templateDefinitionViewElementsForType:(id)a3 mode:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = -[SKUIDynamicGridViewElement _templateDefinitionTypeToModeValueMap](self, "_templateDefinitionTypeToModeValueMap");
  if (objc_msgSend(a3, "length"))
  {
    objc_msgSend(v6, "objectForKey:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (!objc_msgSend(a3, "length") && !v7)
  {
    objc_msgSend(v6, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v8, "firstObject");

  }
  return (id)objc_msgSend(v7, "templateDefinitionViewElementsForMode:", a4);
}

- (id)_templateDefinitionTypeToModeValueMap
{
  _QWORD v4[5];

  if (!self->_hasValidTemplateDefinitionMap)
  {
    self->_hasValidTemplateDefinitionMap = 1;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __67__SKUIDynamicGridViewElement__templateDefinitionTypeToModeValueMap__block_invoke;
    v4[3] = &unk_1E73A12A8;
    v4[4] = self;
    -[SKUIDynamicGridViewElement _unfilteredEnumerateChildrenUsingBlock:](self, "_unfilteredEnumerateChildrenUsingBlock:", v4);
  }
  return self->_templateDefinitionTypeToModeValueMap;
}

void __67__SKUIDynamicGridViewElement__templateDefinitionTypeToModeValueMap__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _SKUIDynamicGridTemplateDefinitionModeValueMap *v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = objc_msgSend(v13, "elementType") == 136;
  v4 = v13;
  if (v3)
  {
    v5 = v13;
    objc_msgSend(v5, "definitionType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 304);
      if (!v7)
      {
        v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(void **)(v9 + 304);
        *(_QWORD *)(v9 + 304) = v8;

        v7 = *(void **)(*(_QWORD *)(a1 + 32) + 304);
      }
      objc_msgSend(v7, "objectForKey:", v6);
      v11 = (_SKUIDynamicGridTemplateDefinitionModeValueMap *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v11 = objc_alloc_init(_SKUIDynamicGridTemplateDefinitionModeValueMap);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "setObject:forKey:", v11, v6);
      }
      objc_msgSend(v5, "definitionMode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SKUIDynamicGridTemplateDefinitionModeValueMap addTemplateDefinitionViewElement:forMode:](v11, "addTemplateDefinitionViewElement:forMode:", v5, v12);

    }
    v4 = v13;
  }

}

- (void)_unfilteredEnumerateChildrenUsingBlock:(id)a3
{
  objc_class *v4;
  objc_method *InstanceMethod;
  IMP Implementation;
  id v7;

  v7 = a3;
  v4 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v4, sel_enumerateChildrenUsingBlock_);
  Implementation = method_getImplementation(InstanceMethod);
  if (Implementation)
    ((void (*)(SKUIDynamicGridViewElement *, char *, id))Implementation)(self, sel_enumerateChildrenUsingBlock_, v7);

}

- (int64_t)minimumEntityCountForSections
{
  return self->_minimumEntityCountForSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateDefinitionTypeToModeValueMap, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIDynamicGridViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
