@implementation SKUIGiftConfiguration

- (SKUIGiftConfiguration)initWithOperationQueue:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  SKUIGiftConfiguration *v9;
  SKUIGiftConfiguration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIGiftConfiguration initWithOperationQueue:clientContext:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIGiftConfiguration;
  v9 = -[SKUIGiftConfiguration init](&v12, sel_init);
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

- (BOOL)loadCachedConfiguration
{
  return 0;
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
  v9[2] = __62__SKUIGiftConfiguration_loadConfigurationWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E73A8798;
  v7 = v4;
  v11 = v7;
  v9[4] = self;
  objc_copyWeak(&v12, &location);
  v8 = v5;
  v10 = v8;
  objc_msgSend(v6, "loadValueForKey:completionBlock:", CFSTR("giftPageData"), v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __62__SKUIGiftConfiguration_loadConfigurationWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v13 = __62__SKUIGiftConfiguration_loadConfigurationWithCompletionBlock___block_invoke_2;
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

void __62__SKUIGiftConfiguration_loadConfigurationWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  v9[2] = __62__SKUIGiftConfiguration_loadConfigurationWithCompletionBlock___block_invoke_3;
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

void __62__SKUIGiftConfiguration_loadConfigurationWithCompletionBlock___block_invoke_3(uint64_t a1)
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
      v12[2] = __44__SKUIGiftConfiguration_loadLogoForCharity___block_invoke;
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

void __44__SKUIGiftConfiguration_loadLogoForCharity___block_invoke(uint64_t a1, void *a2)
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
    block[2] = __44__SKUIGiftConfiguration_loadLogoForCharity___block_invoke_2;
    block[3] = &unk_1E73A1D50;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v5 = v3;
    v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v7);
  }

}

void __44__SKUIGiftConfiguration_loadLogoForCharity___block_invoke_2(uint64_t a1)
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
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIGiftCharity *v16;
  NSArray *v17;
  NSArray *charities;
  NSString *v19;
  NSString *currencySymbol;
  int64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  const __CFString *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSArray *v37;
  NSArray *fixedGiftAmountLabels;
  NSArray *v39;
  NSArray *fixedGiftAmountValues;
  void *v41;
  NSURL *v42;
  NSURL *giftPurchaseURL;
  NSURL *v44;
  NSURL *giftValidationURL;
  void *v46;
  void *v47;
  NSString *v48;
  NSString *storeFrontName;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  SKUIGiftTheme *v57;
  NSArray *v58;
  NSArray *themes;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void (**v70)(_QWORD, _QWORD, _QWORD);
  void *v71;
  void *v72;
  void *v73;
  id v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  _QWORD v80[4];
  void (**v81)(_QWORD, _QWORD, _QWORD);
  id v82;
  id location;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  v79 = v7;
  v72 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v70 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
    objc_msgSend(v7, "objectForKey:", CFSTR("charities"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v11 = v71;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v92, v98, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v93;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v93 != v13)
              objc_enumerationMutation(v11);
            v15 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[SKUIGiftCharity initWithCharityDictionary:]([SKUIGiftCharity alloc], "initWithCharityDictionary:", v15);
              objc_msgSend(v10, "addObject:", v16);

            }
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v92, v98, 16);
        }
        while (v12);
      }

      v17 = (NSArray *)objc_msgSend(v10, "copy");
      charities = self->_charities;
      self->_charities = v17;

    }
    objc_msgSend(v79, "objectForKey:", CFSTR("currency"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v73, "objectForKey:", CFSTR("symbol"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = (NSString *)objc_msgSend(v68, "copy");
        currencySymbol = self->_currencySymbol;
        self->_currencySymbol = v19;

      }
      objc_msgSend(v73, "objectForKey:", CFSTR("symbolPlacement"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = objc_msgSend(v67, "isEqualToString:", CFSTR("LEFT")) ^ 1;
      else
        v21 = 0;
      self->_currencySymbolPosition = v21;
      objc_msgSend(v73, "objectForKey:", CFSTR("range"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v69, "objectForKey:", CFSTR("min"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v22, "objectForKey:", CFSTR("value"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            self->_giftAmountRange.location = objc_msgSend(v23, "integerValue");

        }
        objc_msgSend(v69, "objectForKey:", CFSTR("max"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v24, "objectForKey:", CFSTR("value"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            self->_giftAmountRange.length = objc_msgSend(v25, "integerValue") - self->_giftAmountRange.location;

        }
      }
      objc_msgSend(v73, "objectForKey:", CFSTR("amounts"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "userInterfaceIdiom") == 1;

        if (v27)
          v28 = CFSTR("iPad");
        else
          v28 = CFSTR("iPhone");
        objc_msgSend(v66, "objectForKey:", v28);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v77 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v75 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v90 = 0u;
          v91 = 0u;
          v89 = 0u;
          v88 = 0u;
          v29 = v65;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
          if (v30)
          {
            v31 = *(_QWORD *)v89;
            do
            {
              v32 = 0;
              do
              {
                if (*(_QWORD *)v89 != v31)
                  objc_enumerationMutation(v29);
                v33 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v32);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v33, "objectForKey:", CFSTR("label"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "objectForKey:", CFSTR("value"));
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
                  {
                    objc_msgSend(v77, "addObject:", v34);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v35, "integerValue"));
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "addObject:", v36);

                  }
                }
                ++v32;
              }
              while (v30 != v32);
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
            }
            while (v30);
          }

          v37 = (NSArray *)objc_msgSend(v77, "copy");
          fixedGiftAmountLabels = self->_fixedGiftAmountLabels;
          self->_fixedGiftAmountLabels = v37;

          v39 = (NSArray *)objc_msgSend(v75, "copy");
          fixedGiftAmountValues = self->_fixedGiftAmountValues;
          self->_fixedGiftAmountValues = v39;

        }
      }

    }
    objc_msgSend(v79, "objectForKey:", CFSTR("giftBuyUrl"), v65);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v41);
      giftPurchaseURL = self->_giftPurchaseURL;
      self->_giftPurchaseURL = v42;

    }
    objc_msgSend(v79, "objectForKey:", CFSTR("giftValidateUrl"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v78);
      giftValidationURL = self->_giftValidationURL;
      self->_giftValidationURL = v44;

    }
    objc_msgSend(v79, "objectForKey:", CFSTR("messageMaxLength"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->_maximumMessageLength = objc_msgSend(v76, "integerValue");
    objc_msgSend(v79, "objectForKey:", CFSTR("storeFront"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v46, "objectForKey:", CFSTR("adjectiveCountryName"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = (NSString *)objc_msgSend(v47, "copy");
        storeFrontName = self->_storeFrontName;
        self->_storeFrontName = v48;

      }
    }
    objc_msgSend(v79, "objectForKey:", CFSTR("ubers"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v52 = v50;
      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
      if (v53)
      {
        v54 = *(_QWORD *)v85;
        do
        {
          v55 = 0;
          do
          {
            if (*(_QWORD *)v85 != v54)
              objc_enumerationMutation(v52);
            v56 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * v55);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v57 = -[SKUIGiftTheme initWithThemeDictionary:]([SKUIGiftTheme alloc], "initWithThemeDictionary:", v56);
              if (v57)
                objc_msgSend(v51, "addObject:", v57);

            }
            ++v55;
          }
          while (v53 != v55);
          v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
        }
        while (v53);
      }

      v58 = (NSArray *)objc_msgSend(v51, "copy");
      themes = self->_themes;
      self->_themes = v58;

      -[SKUIGiftConfiguration _loadThemeImages](self, "_loadThemeImages");
    }
    objc_msgSend(v79, "objectForKey:", CFSTR("giftAccountInfoUrl"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v60)) != 0)
    {
      objc_initWeak(&location, self);
      v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURL:", v61);
      +[SSVURLDataConsumer consumer](SKUIJSONDataConsumer, "consumer");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setDataConsumer:", v63);

      -[SKUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setStoreFrontSuffix:", v64);

      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __61__SKUIGiftConfiguration__finishLoadWithResponse_error_block___block_invoke;
      v80[3] = &unk_1E73A80F0;
      objc_copyWeak(&v82, &location);
      v81 = v70;
      objc_msgSend(v62, "setOutputBlock:", v80);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v62);

      objc_destroyWeak(&v82);
      objc_destroyWeak(&location);

    }
    else
    {
      v70[2](v70, 1, 0);
    }

    v9 = v70;
  }
  else
  {
    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v8);
  }

}

void __61__SKUIGiftConfiguration__finishLoadWithResponse_error_block___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v9[2] = __61__SKUIGiftConfiguration__finishLoadWithResponse_error_block___block_invoke_2;
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

void __61__SKUIGiftConfiguration__finishLoadWithResponse_error_block___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_finishLoadAccountInfoWithResponse:error:block:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_finishLoadAccountInfoWithResponse:(id)a3 error:(id)a4 block:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_opt_class();
  v10 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("status"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = v8;
      if (!objc_msgSend(v11, "integerValue"))
      {
        objc_msgSend(v14, "objectForKey:", CFSTR("senderEmail"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong((id *)&self->_senderEmailAddress, v12);
        objc_msgSend(v14, "objectForKey:", CFSTR("fromName"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong((id *)&self->_senderName, v13);

        v10 = 0;
      }
    }

  }
  ((void (**)(id, uint64_t, id))v9)[2](v9, 1, v10);

}

- (void)_loadThemeImages
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  int v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id location;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_themes;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "headerImageURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "headerImage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          v10 = 1;
        else
          v10 = v8 == 0;
        v11 = !v10;

        if (v11)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURL:", v8);
          +[SSVURLDataConsumer consumer](SKUIImageDataConsumer, "consumer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setDataConsumer:", v13);

          objc_msgSend(v12, "setITunesStoreRequest:", 0);
          objc_initWeak(&location, self);
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __41__SKUIGiftConfiguration__loadThemeImages__block_invoke;
          v14[3] = &unk_1E73A87C0;
          objc_copyWeak(&v15, &location);
          v14[4] = v7;
          objc_msgSend(v12, "setOutputBlock:", v14);
          -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v12);
          objc_destroyWeak(&v15);
          objc_destroyWeak(&location);

        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

}

void __41__SKUIGiftConfiguration__loadThemeImages__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__SKUIGiftConfiguration__loadThemeImages__block_invoke_2;
    block[3] = &unk_1E73A1D50;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 32);
    v7 = v4;
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v9);
  }

}

void __41__SKUIGiftConfiguration__loadThemeImages__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setHeaderImage:forTheme:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_setHeaderImage:(id)a3 forTheme:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[NSArray indexOfObjectIdenticalTo:](self->_themes, "indexOfObjectIdenticalTo:", v7) != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHeaderImage:", v6);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "giftConfigurationController:didLoadImageForTheme:", self, v7, (_QWORD)v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

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
            objc_msgSend(v17, "giftConfigurationController:didLoadLogoForCharity:", self, v7);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (NSString)currencySymbol
{
  return self->_currencySymbol;
}

- (int64_t)currencySymbolPosition
{
  return self->_currencySymbolPosition;
}

- (NSArray)fixedGiftAmountLabels
{
  return self->_fixedGiftAmountLabels;
}

- (NSArray)fixedGiftAmountValues
{
  return self->_fixedGiftAmountValues;
}

- (NSString)senderName
{
  return self->_senderName;
}

- (_NSRange)giftAmountRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_giftAmountRange.length;
  location = self->_giftAmountRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSURL)giftPurchaseURL
{
  return self->_giftPurchaseURL;
}

- (NSURL)giftValidationURL
{
  return self->_giftValidationURL;
}

- (int64_t)maximumMessageLength
{
  return self->_maximumMessageLength;
}

- (NSString)senderEmailAddress
{
  return self->_senderEmailAddress;
}

- (NSString)storeFrontName
{
  return self->_storeFrontName;
}

- (NSArray)themes
{
  return self->_themes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themes, 0);
  objc_storeStrong((id *)&self->_storeFrontName, 0);
  objc_storeStrong((id *)&self->_senderEmailAddress, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_giftValidationURL, 0);
  objc_storeStrong((id *)&self->_giftPurchaseURL, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_fixedGiftAmountValues, 0);
  objc_storeStrong((id *)&self->_fixedGiftAmountLabels, 0);
  objc_storeStrong((id *)&self->_currencySymbol, 0);
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
  v1 = "-[SKUIGiftConfiguration initWithOperationQueue:clientContext:]";
}

@end
