@implementation SKUIDonationConfiguration

- (SKUIDonationConfiguration)initWithOperationQueue:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  SKUIDonationConfiguration *v9;
  SKUIDonationConfiguration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDonationConfiguration initWithOperationQueue:clientContext:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIDonationConfiguration;
  v9 = -[SKUIDonationConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_operationQueue, a3);
  }

  return v10;
}

- (void)addObserver:(id)a3
{
  NSHashTable *observers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;
  id location;

  objc_initWeak(&location, a3);
  observers = self->_observers;
  if (!observers)
  {
    v5 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  v7 = objc_loadWeakRetained(&location);
  -[NSHashTable addObject:](observers, "addObject:", v7);

  objc_destroyWeak(&location);
}

- (id)charityForIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_charities;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)loadConfigurationWithCompletionBlock:(id)a3
{
  id v4;
  NSOperationQueue *v5;
  void *v6;
  id v7;
  NSOperationQueue *v8;
  _QWORD v9[5];
  NSOperationQueue *v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = self->_operationQueue;
  objc_initWeak(&location, self);
  -[SKUIClientContext URLBag](self->_clientContext, "URLBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__SKUIDonationConfiguration_loadConfigurationWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E73A8798;
  v7 = v4;
  v11 = v7;
  v9[4] = self;
  objc_copyWeak(&v12, &location);
  v8 = v5;
  v10 = v8;
  objc_msgSend(v6, "loadValueForKey:completionBlock:", CFSTR("charityGiftPageData"), v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __66__SKUIDonationConfiguration_loadConfigurationWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v5);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURL:", v7);
    +[SSVURLDataConsumer consumer](SKUIJSONDataConsumer, "consumer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDataConsumer:", v9);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "valueForConfigurationKey:", CFSTR("sfsuffix"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStoreFrontSuffix:", v10);

    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __66__SKUIDonationConfiguration_loadConfigurationWithCompletionBlock___block_invoke_2;
    v14 = &unk_1E73A80F0;
    objc_copyWeak(&v16, (id *)(a1 + 56));
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v8, "setOutputBlock:", &v11);
    objc_msgSend(*(id *)(a1 + 40), "addOperation:", v8, v11, v12, v13, v14);

    objc_destroyWeak(&v16);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __66__SKUIDonationConfiguration_loadConfigurationWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__SKUIDonationConfiguration_loadConfigurationWithCompletionBlock___block_invoke_3;
  v9[3] = &unk_1E73A3200;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __66__SKUIDonationConfiguration_loadConfigurationWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_finishLoadWithResponse:error:block:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)loadLogoForCharity:(id)a3
{
  id v4;
  NSMutableDictionary *charityImages;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  charityImages = self->_charityImages;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](charityImages, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v4, "logoArtwork");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURL:", v9);
      +[SSVURLDataConsumer consumer](SKUIImageDataConsumer, "consumer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDataConsumer:", v11);

      objc_msgSend(v10, "setITunesStoreRequest:", 0);
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __48__SKUIDonationConfiguration_loadLogoForCharity___block_invoke;
      v12[3] = &unk_1E73A87C0;
      objc_copyWeak(&v14, &location);
      v13 = v4;
      objc_msgSend(v10, "setOutputBlock:", v12);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v10);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);

    }
  }

}

void __48__SKUIDonationConfiguration_loadLogoForCharity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__SKUIDonationConfiguration_loadLogoForCharity___block_invoke_2;
    block[3] = &unk_1E73A1D50;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v5 = v3;
    v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v7);
  }

}

void __48__SKUIDonationConfiguration_loadLogoForCharity___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setLogoImage:forCharity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)logoImageForCharity:(id)a3
{
  NSMutableDictionary *charityImages;
  void *v4;
  void *v5;

  charityImages = self->_charityImages;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](charityImages, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)removeObserver:(id)a3
{
  NSHashTable *observers;
  id v4;

  observers = self->_observers;
  v4 = a3;
  -[NSHashTable removeObject:](observers, "removeObject:", v4);

}

- (void)_finishLoadWithResponse:(id)a3 error:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SKUIGiftCharity *v19;
  uint64_t v20;
  NSArray *charities;
  void *v22;
  NSURL *v23;
  NSURL *donationPurchaseURL;
  void *v25;
  NSURL *v26;
  NSURL *donationValidationURL;
  void *v28;
  SKUIDonationConfiguration *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("charities"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = self;
      v30 = v9;
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v28 = v11;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v32;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v32 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v17);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = -[SKUIGiftCharity initWithCharityDictionary:]([SKUIGiftCharity alloc], "initWithCharityDictionary:", v18);
              objc_msgSend(v12, "addObject:", v19);

            }
            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v15);
      }

      v20 = objc_msgSend(v12, "copy");
      self = v29;
      charities = v29->_charities;
      v29->_charities = (NSArray *)v20;

      v9 = v30;
      v11 = v28;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("donationBuyUrl"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v22);
      donationPurchaseURL = self->_donationPurchaseURL;
      self->_donationPurchaseURL = v23;

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("donationValidateUrl"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v25);
      donationValidationURL = self->_donationValidationURL;
      self->_donationValidationURL = v26;

    }
    v10[2](v10, 1, 0);

  }
  else
  {
    ((void (**)(id, uint64_t, id))v10)[2](v10, 0, v9);
  }

}

- (void)_setLogoImage:(id)a3 forCharity:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *charityImages;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[NSArray indexOfObjectIdenticalTo:](self->_charities, "indexOfObjectIdenticalTo:", v7) != 0x7FFFFFFFFFFFFFFFLL)
  {
    charityImages = self->_charityImages;
    if (!charityImages)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = self->_charityImages;
      self->_charityImages = v9;

      charityImages = self->_charityImages;
    }
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](charityImages, "setObject:forKey:", v6, v11);

    -[NSHashTable allObjects](self->_observers, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v17, "donationConfigurationController:didLoadLogoForCharity:", self, v7);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
}

- (NSArray)allCharities
{
  return self->_charities;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (NSURL)donationPurchaseURL
{
  return self->_donationPurchaseURL;
}

- (NSURL)donationValidationURL
{
  return self->_donationValidationURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_donationValidationURL, 0);
  objc_storeStrong((id *)&self->_donationPurchaseURL, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_charityImages, 0);
  objc_storeStrong((id *)&self->_charities, 0);
}

- (void)initWithOperationQueue:clientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIDonationConfiguration initWithOperationQueue:clientContext:]";
}

@end
