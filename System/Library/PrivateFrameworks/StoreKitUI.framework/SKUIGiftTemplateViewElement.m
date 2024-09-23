@implementation SKUIGiftTemplateViewElement

- (SKUIGiftTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIGiftTemplateViewElement *v11;
  void *v12;
  uint64_t v13;
  NSString *productBuyParams;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftTemplateViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIGiftTemplateViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v17, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_giftType = objc_msgSend(v12, "isEqualToString:", CFSTR("product"));
    objc_msgSend(v8, "getAttribute:", CFSTR("buyParams"));
    v13 = objc_claimAutoreleasedReturnValue();
    productBuyParams = v11->_productBuyParams;
    v11->_productBuyParams = (NSString *)v13;

    objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_productItemIdentifier = objc_msgSend(v15, "longLongValue");

  }
  return v11;
}

- (SKUIItem)productItem
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  SKUIItem *v16;
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_productItemIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x1E0DAFB30]);

  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__55;
  v41 = __Block_byref_object_dispose__55;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__55;
  v35 = __Block_byref_object_dispose__55;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__55;
  v29 = __Block_byref_object_dispose__55;
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__55;
  v23 = __Block_byref_object_dispose__55;
  v24 = 0;
  -[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 66);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __42__SKUIGiftTemplateViewElement_productItem__block_invoke;
  v18[3] = &unk_1E73A61F8;
  v18[4] = &v31;
  v18[5] = &v37;
  v18[6] = &v19;
  v18[7] = &v25;
  objc_msgSend(v5, "enumerateChildrenUsingBlock:", v18);
  v6 = v20[5];
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, *MEMORY[0x1E0DAFB08]);
  if (objc_msgSend((id)v26[5], "count"))
  {
    objc_msgSend((id)v26[5], "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x1E0DAFAC0]);

  }
  if ((unint64_t)objc_msgSend((id)v26[5], "count") >= 2)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend((id)v26[5], "objectAtIndex:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithObjects:", v9, 0);

    objc_msgSend(v3, "setObject:forKey:", v10, *MEMORY[0x1E0DAFB10]);
  }
  if (v38[5])
  {
    v43[0] = v38[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, *MEMORY[0x1E0DAFAD0]);

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", self->_productBuyParams, CFSTR("buyParams"), 0);
  v13 = v12;
  v14 = v32[5];
  if (v14)
    objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("priceFormatted"));
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v13, 0);
  objc_msgSend(v3, "setObject:forKey:", v15, *MEMORY[0x1E0DAFB50]);
  v16 = -[SKUIItem initWithLookupDictionary:]([SKUIItem alloc], "initWithLookupDictionary:", v3);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v16;
}

void __42__SKUIGiftTemplateViewElement_productItem__block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[5];

  v28 = a2;
  v3 = objc_msgSend(v28, "elementType");
  if (v3 > 76)
  {
    if (v3 == 77)
    {
      if (!*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
      {
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __42__SKUIGiftTemplateViewElement_productItem__block_invoke_2;
        v29[3] = &unk_1E73A01D0;
        v29[4] = a1[4];
        objc_msgSend(v28, "enumerateChildrenUsingBlock:", v29);
      }
    }
    else if (v3 == 138)
    {
      v20 = v28;
      v9 = v20;
      if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) || objc_msgSend(v20, "labelViewStyle") != 5)
      {
        objc_msgSend(v9, "text");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "string");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", v19);
      }
      else
      {
        objc_msgSend(v9, "text");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "string");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1[6] + 8);
        v23 = *(void **)(v22 + 40);
        *(_QWORD *)(v22 + 40) = v21;

      }
      goto LABEL_19;
    }
  }
  else if (v3 == 13)
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
    {
      objc_msgSend(v28, "buttonText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "string");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(a1[4] + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;

LABEL_20:
    }
  }
  else if (v3 == 49 && !*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = *(_QWORD *)(a1[5] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = v28;
    objc_msgSend(v7, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
      objc_msgSend(v8, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("url"));

    }
    objc_msgSend(v7, "size");
    v13 = (uint64_t)v12;
    objc_msgSend(v7, "size");
    v15 = v14;

    v16 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("height"));

    v18 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("width"));
LABEL_19:

    goto LABEL_20;
  }

}

void __42__SKUIGiftTemplateViewElement_productItem__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "elementType") | 0x80;
  v4 = v10;
  if (v3 == 141)
  {
    v5 = v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "buttonText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "string");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
    v4 = v10;
  }

}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIGiftTemplateViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *productBuyParams;
  objc_super v10;

  v4 = (SKUIGiftTemplateViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIGiftTemplateViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_giftType = -[SKUIGiftTemplateViewElement giftType](v4, "giftType");
    v7 = (NSString *)-[NSString copy](v4->_productBuyParams, "copy");
    productBuyParams = self->_productBuyParams;
    self->_productBuyParams = v7;

    self->_productItemIdentifier = v4->_productItemIdentifier;
  }

  return v6;
}

- (int64_t)giftType
{
  return self->_giftType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productBuyParams, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
