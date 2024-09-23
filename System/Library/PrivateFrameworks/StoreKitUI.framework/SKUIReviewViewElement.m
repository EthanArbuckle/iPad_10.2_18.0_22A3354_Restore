@implementation SKUIReviewViewElement

- (SKUIResponseViewElement)response
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
        -[SKUIReviewViewElement response].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__26;
  v18 = __Block_byref_object_dispose__26;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __33__SKUIReviewViewElement_response__block_invoke;
  v13[3] = &unk_1E73A01D0;
  v13[4] = &v14;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v13);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (SKUIResponseViewElement *)v11;
}

void __33__SKUIReviewViewElement_response__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 102)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (SKUIDialogTemplateViewElement)dialogTemplate
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
        -[SKUIReviewViewElement dialogTemplate].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__26;
  v18 = __Block_byref_object_dispose__26;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __39__SKUIReviewViewElement_dialogTemplate__block_invoke;
  v13[3] = &unk_1E73A01D0;
  v13[4] = &v14;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v13);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (SKUIDialogTemplateViewElement *)v11;
}

void __39__SKUIReviewViewElement_dialogTemplate__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 31)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)response
{
}

- (void)dialogTemplate
{
}

@end
