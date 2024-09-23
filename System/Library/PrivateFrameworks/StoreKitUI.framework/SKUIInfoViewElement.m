@implementation SKUIInfoViewElement

- (SKUILabelViewElement)titleElement
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
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        -[SKUIInfoViewElement titleElement].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __35__SKUIInfoViewElement_titleElement__block_invoke;
  v13[3] = &unk_1E73A01D0;
  v13[4] = &v14;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v13);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (SKUILabelViewElement *)v11;
}

void __35__SKUIInfoViewElement_titleElement__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 138 && objc_msgSend(v6, "labelViewStyle") == 5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (NSArray)valueElements
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
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        -[SKUIInfoViewElement valueElements].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __36__SKUIInfoViewElement_valueElements__block_invoke;
  v14[3] = &unk_1E73A12A8;
  v12 = v11;
  v15 = v12;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v14);

  return (NSArray *)v12;
}

void __36__SKUIInfoViewElement_valueElements__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "elementType");
  if (v3 > 0x3E || ((1 << v3) & 0x4006004100001100) == 0)
  {
    switch(v3)
    {
      case 0x87uLL:
      case 0x8DuLL:
      case 0x90uLL:
        goto LABEL_7;
      case 0x88uLL:
      case 0x89uLL:
      case 0x8BuLL:
      case 0x8CuLL:
      case 0x8EuLL:
      case 0x8FuLL:
        break;
      case 0x8AuLL:
        if (objc_msgSend(v5, "labelViewStyle") != 5)
          goto LABEL_7;
        break;
      default:
        if (v3 == 152)
          goto LABEL_7;
        break;
    }
  }
  else
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

- (void)titleElement
{
}

- (void)valueElements
{
}

@end
