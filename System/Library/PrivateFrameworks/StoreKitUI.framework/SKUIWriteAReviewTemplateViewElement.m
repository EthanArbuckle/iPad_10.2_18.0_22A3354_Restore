@implementation SKUIWriteAReviewTemplateViewElement

- (SKUIWriteAReviewTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIWriteAReviewTemplateViewElement *v11;
  void *v12;
  uint64_t v13;
  NSString *reviewMetadataURLString;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIWriteAReviewTemplateViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIWriteAReviewTemplateViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_itemIdentifier = objc_msgSend(v12, "longLongValue");

    objc_msgSend(v8, "getAttribute:", CFSTR("src"));
    v13 = objc_claimAutoreleasedReturnValue();
    reviewMetadataURLString = v11->_reviewMetadataURLString;
    v11->_reviewMetadataURLString = (NSString *)v13;

  }
  return v11;
}

- (NSString)reviewMetadataURLString
{
  NSString *v3;
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = self->_reviewMetadataURLString;
  if (self->_itemIdentifier)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DAF640]);
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__18;
    v25 = __Block_byref_object_dispose__18;
    v26 = 0;
    v5 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_itemIdentifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __62__SKUIWriteAReviewTemplateViewElement_reviewMetadataURLString__block_invoke;
    v18[3] = &unk_1E73A3018;
    v20 = &v21;
    v8 = v5;
    v19 = v8;
    objc_msgSend(v4, "getLibraryItemsForITunesStoreItemIdentifiers:completionBlock:", v7, v18);

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    if (v22[5])
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", self->_reviewMetadataURLString);
      objc_msgSend(v9, "queryItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v10, "mutableCopy");

      if (!v11)
        v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = (void *)MEMORY[0x1E0CB39D8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend((id)v22[5], "longLongValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "queryItemWithName:value:", CFSTR("version-to-review"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v14);

      objc_msgSend(v9, "setQueryItems:", v11);
      objc_msgSend(v9, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "absoluteString");
      v16 = objc_claimAutoreleasedReturnValue();

      v3 = (NSString *)v16;
    }

    _Block_object_dispose(&v21, 8);
  }
  return v3;
}

void __62__SKUIWriteAReviewTemplateViewElement_reviewMetadataURLString__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0DAFD10]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIWriteAReviewTemplateViewElement *v4;
  SKUIWriteAReviewTemplateViewElement *v5;
  SKUIWriteAReviewTemplateViewElement *v6;
  NSString *v7;
  NSString *reviewMetadataURLString;
  objc_super v10;

  v4 = (SKUIWriteAReviewTemplateViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIWriteAReviewTemplateViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUIWriteAReviewTemplateViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_itemIdentifier = -[SKUIWriteAReviewTemplateViewElement itemIdentifier](v4, "itemIdentifier");
    -[SKUIWriteAReviewTemplateViewElement reviewMetadataURLString](v4, "reviewMetadataURLString");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    reviewMetadataURLString = self->_reviewMetadataURLString;
    self->_reviewMetadataURLString = v7;

  }
  return v6;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewMetadataURLString, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIWriteAReviewTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
