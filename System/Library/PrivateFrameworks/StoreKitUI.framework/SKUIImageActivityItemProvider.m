@implementation SKUIImageActivityItemProvider

+ (id)placeholderItem
{
  return objc_alloc_init(MEMORY[0x1E0DC3870]);
}

- (id)item
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIImageActivityItemProvider item].cold.1();
  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__13;
  v17 = __Block_byref_object_dispose__13;
  v18 = 0;
  -[UIActivityItemProvider activityType](self, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CEA2D0], "activityTypeShouldProvideImage:", v3))
  {
    -[SKUIDeferredActivityItemProvider productPageItem](self, "productPageItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "artworksProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bestArtworkForScaledSize:", 100.0, 100.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURL:", v7);
      +[SKUIStyledImageDataConsumer shareSheetIconConsumer](SKUIStyledImageDataConsumer, "shareSheetIconConsumer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDataConsumer:", v9);

      objc_msgSend(v8, "setITunesStoreRequest:", 0);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __37__SKUIImageActivityItemProvider_item__block_invoke;
      v12[3] = &unk_1E73A27E8;
      v12[4] = &v13;
      objc_msgSend(v8, "setOutputBlock:", v12);
      objc_msgSend(v8, "main");

    }
  }
  v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v10;
}

void __37__SKUIImageActivityItemProvider_item__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)item
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIImageActivityItemProvider item]";
}

@end
