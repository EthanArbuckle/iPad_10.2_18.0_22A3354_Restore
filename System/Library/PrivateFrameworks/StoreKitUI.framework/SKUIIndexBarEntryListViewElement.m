@implementation SKUIIndexBarEntryListViewElement

- (SKUIIndexBarEntryListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIIndexBarEntryListViewElement *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIndexBarEntryListViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIIndexBarEntryListViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v19, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("targetIndexBarEntryID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      objc_storeStrong((id *)&v11->_targetIndexBarEntryID, v12);
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("dynamicElement")) & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      v15 = objc_msgSend(v13, "isEqualToString:", CFSTR("localeStandard"));
      v14 = 2;
      if (!v15)
        v14 = 0;
    }
    v11->_entryListElementType = v14;

    objc_msgSend(v8, "getAttribute:", CFSTR("indexBarHiddenWhenEmpty"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_indexBarHiddenWhenEmpty = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v8, "getAttribute:", CFSTR("minimumEntityCount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_minimumEntityCount = objc_msgSend(v17, "integerValue");

  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIIndexBarEntryListViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *targetIndexBarEntryID;
  objc_super v10;

  v4 = (SKUIIndexBarEntryListViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIIndexBarEntryListViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_entryListElementType = -[SKUIIndexBarEntryListViewElement entryListElementType](v4, "entryListElementType");
    self->_indexBarHiddenWhenEmpty = -[SKUIIndexBarEntryListViewElement isIndexBarHiddenWhenEmpty](v4, "isIndexBarHiddenWhenEmpty");
    self->_minimumEntityCount = -[SKUIIndexBarEntryListViewElement minimumEntityCount](v4, "minimumEntityCount");
    -[SKUIIndexBarEntryListViewElement targetIndexBarEntryID](v4, "targetIndexBarEntryID");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    targetIndexBarEntryID = self->_targetIndexBarEntryID;
    self->_targetIndexBarEntryID = v7;

  }
  return v6;
}

- (NSArray)childIndexBarEntryElements
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__22;
  v9 = __Block_byref_object_dispose__22;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__SKUIIndexBarEntryListViewElement_childIndexBarEntryElements__block_invoke;
  v4[3] = &unk_1E73A01D0;
  v4[4] = &v5;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __62__SKUIIndexBarEntryListViewElement_childIndexBarEntryElements__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "elementType") == 54)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v3)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v3, "addObject:", v7);
  }

}

- (int64_t)entryListElementType
{
  return self->_entryListElementType;
}

- (BOOL)isIndexBarHiddenWhenEmpty
{
  return self->_indexBarHiddenWhenEmpty;
}

- (int64_t)minimumEntityCount
{
  return self->_minimumEntityCount;
}

- (NSString)targetIndexBarEntryID
{
  return self->_targetIndexBarEntryID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetIndexBarEntryID, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIIndexBarEntryListViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
