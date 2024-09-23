@implementation SKUIPersonalizeOfferOperation

- (SKUIPersonalizeOfferOperation)initWithItemIdentifier:(int64_t)a3 clientContext:(id)a4
{
  id v7;
  SKUIPersonalizeOfferOperation *v8;
  SKUIPersonalizeOfferOperation *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v12;
  NSObject *v13;
  objc_super v15;

  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPersonalizeOfferOperation initWithItemIdentifier:clientContext:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIPersonalizeOfferOperation;
  v8 = -[SKUIPersonalizeOfferOperation init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clientContext, a4);
    v9->_itemID = a3;
    v10 = dispatch_queue_create("com.apple.StoreKitUI.SKUIPersonalizeOfferOperation", 0);
    dispatchQueue = v9->_dispatchQueue;
    v9->_dispatchQueue = (OS_dispatch_queue *)v10;

    v12 = v9->_dispatchQueue;
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v12, v13);

  }
  return v9;
}

- (id)outputBlock
{
  NSObject *dispatchQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *(*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__67;
  v10 = __Block_byref_object_dispose__67;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SKUIPersonalizeOfferOperation_outputBlock__block_invoke;
  v5[3] = &unk_1E73A0270;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__SKUIPersonalizeOfferOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setOutputBlock:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SKUIPersonalizeOfferOperation_setOutputBlock___block_invoke;
  v7[3] = &unk_1E73A1578;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __48__SKUIPersonalizeOfferOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 272);
  *(_QWORD *)(v3 + 272) = v2;

}

- (void)main
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5_0;
  v26 = __Block_byref_object_dispose__6_0;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5_0;
  v20 = __Block_byref_object_dispose__6_0;
  v21 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), self->_itemID);
  v4 = objc_alloc(MEMORY[0x1E0DAF6B0]);
  -[SKUIClientContext platformContext](self->_clientContext, "platformContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithPlatformContext:", v5);

  v28[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItemIdentifiers:", v7);

  objc_msgSend(v6, "setKeyProfile:", CFSTR("offer"));
  objc_msgSend(v6, "setPersonalizationStyle:", 0);
  -[SKUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStoreFrontSuffix:", v8);

  objc_msgSend(v6, "setTimeoutInterval:", &unk_1E749BBC0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__SKUIPersonalizeOfferOperation_main__block_invoke;
  v12[3] = &unk_1E73A6CC0;
  v9 = v3;
  v13 = v9;
  v14 = &v22;
  v15 = &v16;
  objc_msgSend(v6, "setResponseBlock:", v12);
  objc_msgSend(v6, "main");
  -[SKUIPersonalizeOfferOperation outputBlock](self, "outputBlock");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v17[5], v23[5]);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

}

void __37__SKUIPersonalizeOfferOperation_main__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  SKUIItemOffer *v15;
  void *v16;
  SKUIItemOffer *v17;
  uint64_t v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a2, "itemForKey:", a1[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v20 = v6;
    objc_msgSend(v7, "offers");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v15 = [SKUIItemOffer alloc];
          objc_msgSend(v14, "lookupDictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[SKUIItemOffer initWithLookupDictionary:](v15, "initWithLookupDictionary:", v16);

          if (-[SKUIItemOffer offerType](v17, "offerType") == 1)
          {
            v18 = *(_QWORD *)(a1[6] + 8);
            v19 = *(void **)(v18 + 40);
            *(_QWORD *)(v18 + 40) = v17;

            goto LABEL_12;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_12:

    v6 = v20;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithItemIdentifier:clientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPersonalizeOfferOperation initWithItemIdentifier:clientContext:]";
}

@end
