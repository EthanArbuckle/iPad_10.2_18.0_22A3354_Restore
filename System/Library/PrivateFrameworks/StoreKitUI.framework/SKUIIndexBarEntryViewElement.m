@implementation SKUIIndexBarEntryViewElement

- (SKUIIndexBarEntryViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SKUIIndexBarEntryViewElement *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  objc_super v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v11)
        -[SKUIIndexBarEntryViewElement initWithDOMElement:parent:elementFactory:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)SKUIIndexBarEntryViewElement;
  v19 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v33, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v19)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("targetIndexBarEntryID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "length"))
      objc_storeStrong((id *)&v19->_targetIndexBarEntryID, v20);
    objc_msgSend(v8, "getAttribute:", CFSTR("visibility"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_variant_has_internal_content())
    {
      if (_os_feature_enabled_impl())
      {
        v22 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
        if (v22)
          -[SKUIIndexBarEntryViewElement initWithDOMElement:parent:elementFactory:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
    v30 = objc_msgSend(v21, "isEqualToString:", CFSTR("required"));
    v31 = 1000;
    if (!v30)
      v31 = 0;
    v19->_visibilityPriority = v31;

  }
  return v19;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIIndexBarEntryViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *targetIndexBarEntryID;
  objc_super v10;

  v4 = (SKUIIndexBarEntryViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIIndexBarEntryViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SKUIIndexBarEntryViewElement targetIndexBarEntryID](v4, "targetIndexBarEntryID");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    targetIndexBarEntryID = self->_targetIndexBarEntryID;
    self->_targetIndexBarEntryID = v7;

    self->_visibilityPriority = -[SKUIIndexBarEntryViewElement visibilityPriority](v4, "visibilityPriority");
  }

  return v6;
}

- (SKUIViewElement)childElement
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
  v8 = __Block_byref_object_copy__52;
  v9 = __Block_byref_object_dispose__52;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__SKUIIndexBarEntryViewElement_childElement__block_invoke;
  v4[3] = &unk_1E73A01D0;
  v4[4] = &v5;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUIViewElement *)v2;
}

void __44__SKUIIndexBarEntryViewElement_childElement__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (NSString)targetIndexBarEntryID
{
  return self->_targetIndexBarEntryID;
}

- (int64_t)visibilityPriority
{
  return self->_visibilityPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetIndexBarEntryID, 0);
}

- (void)initWithDOMElement:(uint64_t)a3 parent:(uint64_t)a4 elementFactory:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDOMElement:(uint64_t)a3 parent:(uint64_t)a4 elementFactory:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
