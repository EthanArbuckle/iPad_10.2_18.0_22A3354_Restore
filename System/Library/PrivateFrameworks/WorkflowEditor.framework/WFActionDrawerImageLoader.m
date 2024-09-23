@implementation WFActionDrawerImageLoader

- (WFActionDrawerImageLoader)init
{
  WFActionDrawerImageLoader *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *imageLoadingQueue;
  NSCache *v6;
  NSCache *imageCache;
  void *v8;
  id v9;
  id v10;
  WFActionDrawerImageLoader *v11;
  objc_super v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v13.receiver = self;
  v13.super_class = (Class)WFActionDrawerImageLoader;
  v2 = -[WFActionDrawerImageLoader init](&v13, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("WFActionDrawerImageLoader", v3);
    imageLoadingQueue = v2->_imageLoadingQueue;
    v2->_imageLoadingQueue = (OS_dispatch_queue *)v4;

    v6 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v6;

    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v8 = (void *)getINUIImageLoaderClass_softClass;
    v18 = getINUIImageLoaderClass_softClass;
    if (!getINUIImageLoaderClass_softClass)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __getINUIImageLoaderClass_block_invoke;
      v14[3] = &unk_24EE24CD8;
      v14[4] = &v15;
      __getINUIImageLoaderClass_block_invoke((uint64_t)v14);
      v8 = (void *)v16[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v15, 8);
    v10 = (id)objc_msgSend(v9, "registeredImageLoaderWithScreenDelegate");
    v11 = v2;
  }

  return v2;
}

- (id)loadImagesForInteractionDonation:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  WFActionDrawerImageLoadTask *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  WFActionDrawerImageLoadTask *v15;
  void *v16;
  WFActionDrawerImageLoadTask *v17;
  void *v19;
  void *v20;
  _QWORD block[4];
  WFActionDrawerImageLoadTask *v22;
  id v23;
  WFActionDrawerImageLoader *v24;
  id v25;
  void (**v26)(_QWORD, _QWORD, _QWORD, _QWORD);

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionDrawerImageLoader.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactionDonation"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionDrawerImageLoader.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  v10 = objc_alloc_init(WFActionDrawerImageLoadTask);
  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFActionDrawerImageLoader imageCache](self, "imageCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    ((void (**)(_QWORD, void *, uint64_t, _QWORD))v9)[2](v9, v13, 1, 0);
  }
  else
  {
    -[WFActionDrawerImageLoader imageLoadingQueue](self, "imageLoadingQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__WFActionDrawerImageLoader_loadImagesForInteractionDonation_completionHandler___block_invoke;
    block[3] = &unk_24EE24CB0;
    v15 = v10;
    v22 = v15;
    v23 = v7;
    v26 = v9;
    v24 = self;
    v25 = v11;
    dispatch_async(v14, block);

    v16 = v25;
    v17 = v15;

  }
  return v10;
}

- (OS_dispatch_queue)imageLoadingQueue
{
  return self->_imageLoadingQueue;
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_imageLoadingQueue, 0);
}

void __80__WFActionDrawerImageLoader_loadImagesForInteractionDonation_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  WFActionDrawerImage *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "interaction");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "intent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_keyParameter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 || (objc_msgSend(v3, "vcui_displayImage"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __80__WFActionDrawerImageLoader_loadImagesForInteractionDonation_completionHandler___block_invoke_2;
      v13[3] = &unk_24EE24C88;
      v14 = *(id *)(a1 + 32);
      v6 = *(id *)(a1 + 64);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(void **)(a1 + 56);
      v17 = v6;
      v15 = v7;
      v16 = v8;
      objc_msgSend(v5, "_retrieveImageDataWithReply:", v13);

    }
    else
    {
      v9 = (void *)MEMORY[0x24BEC14E0];
      objc_msgSend(*(id *)(a1 + 40), "sourceAppIdentifierForDisplay");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "applicationIconImageForBundleIdentifier:format:", v10, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v11 = -[WFActionDrawerImage initWithImage:shouldAspectFill:]([WFActionDrawerImage alloc], "initWithImage:shouldAspectFill:", v5, 0);
        objc_msgSend(*(id *)(a1 + 48), "imageCache");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v11, *(_QWORD *)(a1 + 56));

        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      }
    }

  }
}

void __80__WFActionDrawerImageLoader_loadImagesForInteractionDonation_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  WFActionDrawerImage *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    if (v11
      && (v6 = (void *)MEMORY[0x24BEC14E0],
          objc_msgSend(v11, "_imageData"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "imageWithData:", v7),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v8))
    {
      v9 = -[WFActionDrawerImage initWithImage:shouldAspectFill:]([WFActionDrawerImage alloc], "initWithImage:shouldAspectFill:", v8, 1);
      objc_msgSend(*(id *)(a1 + 40), "imageCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v9, *(_QWORD *)(a1 + 48));

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_880);
  return (id)sharedInstance_sharedInstance;
}

void __43__WFActionDrawerImageLoader_sharedInstance__block_invoke()
{
  WFActionDrawerImageLoader *v0;
  void *v1;

  v0 = objc_alloc_init(WFActionDrawerImageLoader);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

@end
