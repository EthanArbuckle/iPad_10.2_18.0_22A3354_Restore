@implementation SKUIPredicateListViewElement

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIPredicateListViewElement *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIPredicateListViewElement *v13;
  objc_super v17;

  v4 = (SKUIPredicateListViewElement *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIPredicateListViewElement applyUpdatesWithElement:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIPredicateListViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v17, sel_applyUpdatesWithElement_, v4);
  v13 = (SKUIPredicateListViewElement *)objc_claimAutoreleasedReturnValue();
  if (v13 == self && v4 != self && v4 != 0)
    objc_storeStrong((id *)&self->_compoundEntityValuePredicate, v4->_compoundEntityValuePredicate);

  return v13;
}

- (NSArray)predicateViewElements
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIPredicateListViewElement predicateViewElements].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__15;
  v18 = __Block_byref_object_dispose__15;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__SKUIPredicateListViewElement_predicateViewElements__block_invoke;
  v13[3] = &unk_1E73A01D0;
  v13[4] = &v14;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v13);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (NSArray *)v11;
}

void __53__SKUIPredicateListViewElement_predicateViewElements__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "elementType") == 88)
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

- (NSPredicate)compoundEntityValuePredicate
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSPredicate *compoundEntityValuePredicate;
  void *v12;
  id v13;
  NSPredicate *v14;
  NSPredicate *v15;
  _QWORD v17[4];
  id v18;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIPredicateListViewElement compoundEntityValuePredicate].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  compoundEntityValuePredicate = self->_compoundEntityValuePredicate;
  if (!compoundEntityValuePredicate)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__SKUIPredicateListViewElement_compoundEntityValuePredicate__block_invoke;
    v17[3] = &unk_1E73A2C50;
    v18 = v12;
    v13 = v12;
    -[SKUIPredicateListViewElement _enumeratePredicateViewElementsUsingBlock:](self, "_enumeratePredicateViewElementsUsingBlock:", v17);
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v13);
    v14 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
    v15 = self->_compoundEntityValuePredicate;
    self->_compoundEntityValuePredicate = v14;

    compoundEntityValuePredicate = self->_compoundEntityValuePredicate;
  }
  return compoundEntityValuePredicate;
}

void __60__SKUIPredicateListViewElement_compoundEntityValuePredicate__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "entityValuePredicate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_enumeratePredicateViewElementsUsingBlock:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
      {
        -[SKUIPredicateListViewElement _enumeratePredicateViewElementsUsingBlock:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
        if (!v4)
          goto LABEL_6;
        goto LABEL_5;
      }
    }
  }
  if (v4)
  {
LABEL_5:
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__SKUIPredicateListViewElement__enumeratePredicateViewElementsUsingBlock___block_invoke;
    v13[3] = &unk_1E73A1F80;
    v14 = v4;
    -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v13);

  }
LABEL_6:

}

void __74__SKUIPredicateListViewElement__enumeratePredicateViewElementsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 88)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compoundEntityValuePredicate, 0);
}

- (void)applyUpdatesWithElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)predicateViewElements
{
  OUTLINED_FUNCTION_1();
}

- (void)compoundEntityValuePredicate
{
  OUTLINED_FUNCTION_1();
}

- (void)_enumeratePredicateViewElementsUsingBlock:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
