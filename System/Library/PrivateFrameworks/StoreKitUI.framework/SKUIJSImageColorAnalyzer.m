@implementation SKUIJSImageColorAnalyzer

- (SKUIJSImageColorAnalyzer)initWithAppContext:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  SKUIJSImageColorAnalyzer *v8;
  SKUIJSImageColorAnalyzer *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *artworkRequestIDsToManagedCallbacks;
  NSOperationQueue *v12;
  NSOperationQueue *operationQueue;
  SKUIResourceLoader *v14;
  SKUIResourceLoader *resourceLoader;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIJSImageColorAnalyzer initWithAppContext:clientContext:].cold.1();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIJSImageColorAnalyzer;
  v8 = -[IKJSObject initWithAppContext:](&v17, sel_initWithAppContext_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clientContext, a4);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    artworkRequestIDsToManagedCallbacks = v9->_artworkRequestIDsToManagedCallbacks;
    v9->_artworkRequestIDsToManagedCallbacks = v10;

    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v9->_operationQueue;
    v9->_operationQueue = v12;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v9->_operationQueue, "setMaxConcurrentOperationCount:", 2);
    v14 = -[SKUIResourceLoader initWithOperationQueue:clientContext:]([SKUIResourceLoader alloc], "initWithOperationQueue:clientContext:", v9->_operationQueue, v9->_clientContext);
    resourceLoader = v9->_resourceLoader;
    v9->_resourceLoader = v14;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  v3.receiver = self;
  v3.super_class = (Class)SKUIJSImageColorAnalyzer;
  -[SKUIJSImageColorAnalyzer dealloc](&v3, sel_dealloc);
}

- (void)analyzeImageAtUrl:(id)a3 :(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  SKUIArtworkRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99E98];
  v7 = a4;
  objc_msgSend(v6, "URLWithString:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSVURLDataConsumer consumer](SKUIImageDataConsumer, "consumer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(SKUIArtworkRequest);
  -[SKUIResourceRequest setCacheKey:](v10, "setCacheKey:", v8);
  -[SKUIArtworkRequest setDataConsumer:](v10, "setDataConsumer:", v9);
  -[SKUIArtworkRequest setURL:](v10, "setURL:", v8);
  -[SKUIArtworkRequest setDelegate:](v10, "setDelegate:", self);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[SKUIResourceRequest requestIdentifier](v10, "requestIdentifier"));
  -[SKUIResourceLoader loadResourceWithRequest:reason:](self->_resourceLoader, "loadResourceWithRequest:reason:", v10, 1);
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "virtualMachine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addManagedReference:withOwner:", v12, self);
  -[NSMutableDictionary objectForKey:](self->_artworkRequestIDsToManagedCallbacks, "objectForKey:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = v15;
    objc_msgSend(v15, "arrayByAddingObject:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableDictionary setObject:forKey:](self->_artworkRequestIDsToManagedCallbacks, "setObject:forKey:", v17, v11);

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  SKUIJSAnalyzedImageColors *v14;
  void *v15;
  SKUIJSAnalyzedImageColors *v16;
  SKUIJSAnalyzedImageColors *v17;
  _QWORD v18[4];
  id v19;
  SKUIJSAnalyzedImageColors *v20;
  SKUIJSImageColorAnalyzer *v21;

  v6 = a4;
  v7 = a3;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB37E8]);
  v10 = objc_msgSend(v7, "requestIdentifier");

  v11 = (void *)objc_msgSend(v9, "initWithUnsignedInteger:", v10);
  -[NSMutableDictionary objectForKey:](self->_artworkRequestIDsToManagedCallbacks, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_artworkRequestIDsToManagedCallbacks, "removeObjectForKey:", v11);
  -[SKUIResourceLoader removeAllCachedResources](self->_resourceLoader, "removeAllCachedResources");
  if (v12)
  {
    if (v6)
    {
      +[SKUIImageColorAnalyzer analyzeImage:](SKUIImageColorAnalyzer, "analyzeImage:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = [SKUIJSAnalyzedImageColors alloc];
      -[IKJSObject appContext](self, "appContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[SKUIJSAnalyzedImageColors initWithAppContext:analyzedImageColors:](v14, "initWithAppContext:analyzedImageColors:", v15, v13);

    }
    else
    {
      v16 = 0;
    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __56__SKUIJSImageColorAnalyzer_artworkRequest_didLoadImage___block_invoke;
    v18[3] = &unk_1E73A1B00;
    v19 = v12;
    v20 = v16;
    v21 = self;
    v17 = v16;
    objc_msgSend(v8, "evaluate:completionBlock:", v18, 0);

  }
}

void __56__SKUIJSImageColorAnalyzer_artworkRequest_didLoadImage___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "value", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(v8, "callWithArguments:", v9);

        objc_msgSend(v8, "context");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "virtualMachine");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "removeManagedReference:withOwner:", v7, *(_QWORD *)(a1 + 48));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_artworkRequestIDsToManagedCallbacks, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithAppContext:clientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIJSImageColorAnalyzer initWithAppContext:clientContext:]";
}

@end
