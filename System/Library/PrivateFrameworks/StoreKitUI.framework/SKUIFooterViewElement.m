@implementation SKUIFooterViewElement

- (SKUIButtonViewElement)button
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
        -[SKUIFooterViewElement button].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__95;
  v18 = __Block_byref_object_dispose__95;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __31__SKUIFooterViewElement_button__block_invoke;
  v13[3] = &unk_1E73A01D0;
  v13[4] = &v14;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v13);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (SKUIButtonViewElement *)v11;
}

void __31__SKUIFooterViewElement_button__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (SKUIIKViewElementTypeIsButton(objc_msgSend(v6, "elementType")))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (NSArray)titleLabels
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIFooterViewElement titleLabels].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __36__SKUIFooterViewElement_titleLabels__block_invoke;
  v14[3] = &unk_1E73A12A8;
  v12 = v11;
  v15 = v12;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v14);

  return (NSArray *)v12;
}

void __36__SKUIFooterViewElement_titleLabels__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 138)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void)button
{
}

- (void)titleLabels
{
}

@end
