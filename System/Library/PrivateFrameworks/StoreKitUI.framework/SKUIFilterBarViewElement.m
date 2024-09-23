@implementation SKUIFilterBarViewElement

- (SKUIDividerViewElement)bottomDivider
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
  objc_super v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIFilterBarViewElement bottomDivider].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__38;
  v19 = __Block_byref_object_dispose__38;
  v20 = 0;
  v14[1] = 3221225472;
  v14[2] = __41__SKUIFilterBarViewElement_bottomDivider__block_invoke;
  v14[3] = &unk_1E73A01D0;
  v14[4] = &v15;
  v13.receiver = self;
  v13.super_class = (Class)SKUIFilterBarViewElement;
  v14[0] = MEMORY[0x1E0C809B0];
  -[SKUIViewElement enumerateChildrenUsingBlock:](&v13, sel_enumerateChildrenUsingBlock_, v14);
  v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return (SKUIDividerViewElement *)v11;
}

void __41__SKUIFilterBarViewElement_bottomDivider__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 32)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (id)childViewElementsForAlignment:(unint64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD v27[4];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIFilterBarViewElement childViewElementsForAlignment:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 - 1 <= 2)
  {
    -[SKUIViewElement flattenedChildren](self, "flattenedChildren");
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v29;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v18), "elementType") == 127)
            ++v15;
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v16);
    }

    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0;
    v19 = objc_msgSend(v14, "count");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __58__SKUIFilterBarViewElement_childViewElementsForAlignment___block_invoke;
    v21[3] = &unk_1E73A4C10;
    v23 = v27;
    v24 = v15;
    v25 = v19;
    v26 = a3;
    v22 = v13;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v21);

    _Block_object_dispose(v27, 8);
  }
  return v13;
}

void __58__SKUIFilterBarViewElement_childViewElementsForAlignment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "elementAlignment");

  if (v6)
    goto LABEL_2;
  if (*(uint64_t *)(a1 + 48) < 1)
  {
    if (*(_QWORD *)(a1 + 56) == 3)
    {
      v6 = qword_1BBED1B90[a3];
      goto LABEL_2;
    }
    v9 = objc_msgSend(v11, "elementType");
    if (v9 == 109)
    {
      v6 = 2;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 2;
      goto LABEL_2;
    }
    if (v9 == 69)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 2;
      v6 = 3;
      goto LABEL_2;
    }
LABEL_14:
    v6 = qword_1BBED1B90[*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)];
    goto LABEL_2;
  }
  if (objc_msgSend(v11, "elementType") != 127)
    goto LABEL_14;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(a1 + 48) == 1)
  {
    v6 = 0;
    v8 = 2;
  }
  else
  {
    v6 = 0;
    v10 = *(_QWORD *)(v7 + 24);
    if (v10 >= 1)
      v10 = 1;
    v8 = v10 + 1;
  }
  *(_QWORD *)(v7 + 24) = v8;
LABEL_2:
  if (v6 == *(_QWORD *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

}

- (void)enumerateChildrenUsingBlock:(id)a3
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
  id v13;
  objc_super v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIFilterBarViewElement enumerateChildrenUsingBlock:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v15[1] = 3221225472;
  v15[2] = __56__SKUIFilterBarViewElement_enumerateChildrenUsingBlock___block_invoke;
  v15[3] = &unk_1E73A1F80;
  v16 = v4;
  v14.receiver = self;
  v14.super_class = (Class)SKUIFilterBarViewElement;
  v15[0] = MEMORY[0x1E0C809B0];
  v13 = v4;
  -[SKUIViewElement enumerateChildrenUsingBlock:](&v14, sel_enumerateChildrenUsingBlock_, v15);

}

void __56__SKUIFilterBarViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "elementType");
  v4 = (unint64_t)(v3 - 8) > 0x3D || ((1 << (v3 - 8)) & 0x2000060000000031) == 0;
  if (!v4 || (unint64_t)(v3 - 106) <= 0x2E && ((1 << (v3 - 106)) & 0x400900200009) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)pageComponentType
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUIFilterBarViewElement pageComponentType].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 24;
}

- (void)bottomDivider
{
  OUTLINED_FUNCTION_1();
}

- (void)childViewElementsForAlignment:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)enumerateChildrenUsingBlock:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)pageComponentType
{
  OUTLINED_FUNCTION_1();
}

@end
