@implementation SKUIRedeemConfiguration

- (SKUIRedeemConfiguration)initWithOperationQueue:(id)a3 category:(int64_t)a4 clientContext:(id)a5
{
  id v9;
  id v10;
  SKUIRedeemConfiguration *v11;
  SKUIRedeemConfiguration *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemConfiguration initWithOperationQueue:category:clientContext:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIRedeemConfiguration;
  v11 = -[SKUIRedeemConfiguration init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_category = a4;
    objc_storeStrong((id *)&v11->_clientContext, a5);
    objc_storeStrong((id *)&v12->_operationQueue, a3);
  }

  return v12;
}

- (void)loadConfigurationWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SKUIClientContext URLBag](self->_clientContext, "URLBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__SKUIRedeemConfiguration_loadConfigurationWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E73A88E8;
  v6 = v4;
  v8 = v6;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "loadWithCompletionBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __64__SKUIRedeemConfiguration_loadConfigurationWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
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
    block[2] = __64__SKUIRedeemConfiguration_loadConfigurationWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E73A1478;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v5 = v3;
    v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v7);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __64__SKUIRedeemConfiguration_loadConfigurationWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_loadConfigurationWithURLBagDictionary:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_didLoadWithResponseDictionary:(id)a3
{
  id v4;
  int64_t category;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  __CFString *v9;
  double v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SKUIITunesPassConfiguration *v31;
  SKUIITunesPassConfiguration *itunesPassConfiguration;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id location;

  v4 = a3;
  category = self->_category;
  v6 = CFSTR("inputAppStore;");
  if (category == 2)
    v6 = CFSTR("inputIBooks");
  if (category == 1)
    v7 = CFSTR("inputITunes");
  else
    v7 = v6;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v9 = CFSTR("RetinaImageUrl");
  if (v10 == 1.0)
    v9 = CFSTR("ImageUrl");
  v11 = v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("landing"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("success"), v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_alloc(MEMORY[0x1E0DAF698]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithURL:", v17);

    +[SSVURLDataConsumer consumer](SKUIImageDataConsumer, "consumer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDataConsumer:", v19);

    objc_msgSend(v18, "setITunesStoreRequest:", 0);
    objc_initWeak(&location, self);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __58__SKUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke;
    v37[3] = &unk_1E73A1EE0;
    objc_copyWeak(&v38, &location);
    objc_msgSend(v18, "setOutputBlock:", v37);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v18);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

  }
  objc_msgSend(v4, "objectForKey:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = objc_alloc(MEMORY[0x1E0DAF698]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithURL:", v22);

    +[SSVURLDataConsumer consumer](SKUIImageDataConsumer, "consumer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDataConsumer:", v24);

    objc_msgSend(v23, "setITunesStoreRequest:", 0);
    objc_initWeak(&location, self);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __58__SKUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_3;
    v35[3] = &unk_1E73A1EE0;
    objc_copyWeak(&v36, &location);
    objc_msgSend(v23, "setOutputBlock:", v35);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v23);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

  }
  objc_msgSend(v4, "objectForKey:", v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = objc_alloc(MEMORY[0x1E0DAF698]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithURL:", v27);

    +[SSVURLDataConsumer consumer](SKUIImageDataConsumer, "consumer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDataConsumer:", v29);

    objc_msgSend(v28, "setITunesStoreRequest:", 0);
    objc_initWeak(&location, self);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __58__SKUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_5;
    v33[3] = &unk_1E73A1EE0;
    objc_copyWeak(&v34, &location);
    objc_msgSend(v28, "setOutputBlock:", v33);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v28);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("itunesPass"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_itunesPassConfiguration)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[SKUIITunesPassConfiguration initWithITunesPassDictionary:clientContext:]([SKUIITunesPassConfiguration alloc], "initWithITunesPassDictionary:clientContext:", v30, self->_clientContext);
      itunesPassConfiguration = self->_itunesPassConfiguration;
      self->_itunesPassConfiguration = v31;

    }
  }

}

void __58__SKUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SKUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_2;
  v5[3] = &unk_1E73A3138;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __58__SKUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setLandingImage:", *(_QWORD *)(a1 + 32));

}

void __58__SKUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SKUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_4;
  v5[3] = &unk_1E73A3138;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __58__SKUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setSuccessImage:", *(_QWORD *)(a1 + 32));

}

void __58__SKUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SKUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_6;
  v5[3] = &unk_1E73A3138;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __58__SKUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setInputImage:", *(_QWORD *)(a1 + 32));

}

- (void)_loadConfigurationWithURLBagDictionary:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SKUIITunesPassConfiguration *v9;
  SKUIITunesPassConfiguration *itunesPassConfiguration;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("getAddCreditPassUrl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = -[SKUIITunesPassConfiguration initWithITunesPassDictionary:clientContext:]([SKUIITunesPassConfiguration alloc], "initWithITunesPassDictionary:clientContext:", 0, self->_clientContext);
    itunesPassConfiguration = self->_itunesPassConfiguration;
    self->_itunesPassConfiguration = v9;

  }
  -[SKUIRedeemConfiguration _loadDefaultImages](self, "_loadDefaultImages");
  objc_msgSend(v6, "objectForKey:", CFSTR("redeemPreflightIosSrv"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0C92C28]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithURL:", v13);

    -[SKUIRedeemConfiguration _redeemPreflightRequestBodyData](self, "_redeemPreflightRequestBodyData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHTTPBody:", v15);

    objc_msgSend(v14, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v14, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURLRequest:", v14);
    +[SSVURLDataConsumer consumer](SKUIJSONDataConsumer, "consumer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDataConsumer:", v17);

    objc_msgSend(v16, "setITunesStoreRequest:", 1);
    -[SKUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setStoreFrontSuffix:", v18);

    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __82__SKUIRedeemConfiguration__loadConfigurationWithURLBagDictionary_completionBlock___block_invoke;
    v19[3] = &unk_1E73A80F0;
    objc_copyWeak(&v21, &location);
    v20 = v7;
    objc_msgSend(v16, "setOutputBlock:", v19);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v16);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
  }

}

void __82__SKUIRedeemConfiguration__loadConfigurationWithURLBagDictionary_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__SKUIRedeemConfiguration__loadConfigurationWithURLBagDictionary_completionBlock___block_invoke_2;
  block[3] = &unk_1E73A1478;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

uint64_t __82__SKUIRedeemConfiguration__loadConfigurationWithURLBagDictionary_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_didLoadWithResponseDictionary:", *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_loadDefaultImages
{
  UIImage *v3;
  UIImage *inputImage;
  UIImage *v5;
  UIImage *landingImage;
  UIImage *v7;
  UIImage *successImage;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("RedemptionCardArtwork"), v9);
  v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  inputImage = self->_inputImage;
  self->_inputImage = v3;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("RedemptionCardArtworkCobra"), v9);
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  landingImage = self->_landingImage;
  self->_landingImage = v5;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("RedemptionCardStack"), v9);
  v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
  successImage = self->_successImage;
  self->_successImage = v7;

}

- (id)_redeemPreflightRequestBodyData
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKey:", CFSTR("iosRedeemPreflightInfo"), CFSTR("preflightKey"));
  objc_msgSend(v2, "setObject:forKey:", CFSTR("application/json"), CFSTR("response-content-type"));
  objc_msgSend(MEMORY[0x1E0DDC158], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("guid"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("{"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SKUIRedeemConfiguration__redeemPreflightRequestBodyData__block_invoke;
  v9[3] = &unk_1E73A8910;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v9);
  objc_msgSend(v6, "replaceCharactersInRange:withString:", objc_msgSend(v6, "length") - 1, 1, CFSTR("}"));
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __58__SKUIRedeemConfiguration__redeemPreflightRequestBodyData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\"%@\":\"%@\","), a2, a3);
}

- (void)_setInputImage:(id)a3
{
  UIImage *v5;
  void *v6;
  UIImage *v7;

  v5 = (UIImage *)a3;
  if (self->_inputImage != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_inputImage, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("SKUIRedeemConfigurationImagesDidLoadNotification"), self);

    v5 = v7;
  }

}

- (void)_setLandingImage:(id)a3
{
  UIImage *v5;
  void *v6;
  UIImage *v7;

  v5 = (UIImage *)a3;
  if (self->_landingImage != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_landingImage, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("SKUIRedeemConfigurationImagesDidLoadNotification"), self);

    v5 = v7;
  }

}

- (void)_setSuccessImage:(id)a3
{
  UIImage *v5;
  void *v6;
  UIImage *v7;

  v5 = (UIImage *)a3;
  if (self->_successImage != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_successImage, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("SKUIRedeemConfigurationImagesDidLoadNotification"), self);

    v5 = v7;
  }

}

- (int64_t)category
{
  return self->_category;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (UIImage)inputImage
{
  return self->_inputImage;
}

- (SKUIITunesPassConfiguration)ITunesPassConfiguration
{
  return self->_itunesPassConfiguration;
}

- (UIImage)landingImage
{
  return self->_landingImage;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (UIImage)successImage
{
  return self->_successImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successImage, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_landingImage, 0);
  objc_storeStrong((id *)&self->_itunesPassConfiguration, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithOperationQueue:category:clientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRedeemConfiguration initWithOperationQueue:category:clientContext:]";
}

@end
