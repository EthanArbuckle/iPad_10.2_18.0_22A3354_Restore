@implementation WBSLinkPresentationIconCache

- (void)setProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_providerDelegate, a3);
}

- (WBSLinkPresentationIconCache)initWithImageDirectoryURL:(id)a3
{
  id v4;
  WBSLinkPresentationIconCache *v5;
  WBSSiteMetadataImageCache *v6;
  WBSSiteMetadataImageCache *imageCache;
  void *v8;
  WBSLinkPresentationIconCache *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSLinkPresentationIconCache;
  v5 = -[WBSLinkPresentationIconCache init](&v11, sel_init);
  if (v5)
  {
    v6 = -[WBSSiteMetadataImageCache initWithImageDirectoryURL:imageType:]([WBSSiteMetadataImageCache alloc], "initWithImageDirectoryURL:imageType:", v4, 0);
    imageCache = v5->_imageCache;
    v5->_imageCache = v6;

    -[WBSSiteMetadataImageCache setUpImageCache](v5->_imageCache, "setUpImageCache");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__historyItemsWereRemoved_, *MEMORY[0x1E0D8A400], 0);

    v9 = v5;
  }

  return v5;
}

- (id)imageForHost:(id)a3
{
  id v4;
  NSObject *v5;
  WBSSiteMetadataImageCache *imageCache;
  NSObject *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__9;
  v18 = __Block_byref_object_dispose__9;
  v19 = 0;
  imageCache = self->_imageCache;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__WBSLinkPresentationIconCache_imageForHost___block_invoke;
  v11[3] = &unk_1E54446E0;
  v13 = &v14;
  v7 = v5;
  v12 = v7;
  -[WBSSiteMetadataImageCache getImageForKeyString:completionHandler:](imageCache, "getImageForKeyString:completionHandler:", v4, v11);
  v8 = dispatch_time(0, 100000000);
  dispatch_group_wait(v7, v8);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __45__WBSLinkPresentationIconCache_imageForHost___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)saveImage:(id)a3 forHost:(id)a4
{
  -[WBSSiteMetadataImageCache saveImageToDisk:forKeyString:completionHandler:](self->_imageCache, "saveImageToDisk:forKeyString:completionHandler:", a3, a4, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[WBSSiteMetadataImageCache savePendingChangesBeforeTermination](self->_imageCache, "savePendingChangesBeforeTermination");
  v3.receiver = self;
  v3.super_class = (Class)WBSLinkPresentationIconCache;
  -[WBSLinkPresentationIconCache dealloc](&v3, sel_dealloc);
}

- (void)_historyItemsWereRemoved:(id)a3
{
  void *v4;
  void *v5;
  WBSSiteMetadataImageCache *imageCache;
  void *v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D8A3E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_setByApplyingBlock:", &__block_literal_global_22);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    imageCache = self->_imageCache;
    objc_msgSend(v8, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSiteMetadataImageCache removeImagesFromCacheForKeyStrings:](imageCache, "removeImagesFromCacheForKeyStrings:", v7);

  }
}

id __57__WBSLinkPresentationIconCache__historyItemsWereRemoved___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canHandleRequest:(id)a3
{
  return 0;
}

- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4
{
  return 0;
}

- (void)emptyCaches
{
  -[WBSSiteMetadataImageCache emptyCache](self->_imageCache, "emptyCache");
}

- (void)savePendingChangesBeforeTermination
{
  -[WBSSiteMetadataImageCache savePendingChangesBeforeTermination](self->_imageCache, "savePendingChangesBeforeTermination");
}

- (void)purgeUnneededCacheEntries
{
  -[WBSSiteMetadataImageCache purgeUnneededImages](self->_imageCache, "purgeUnneededImages");
}

- (WBSSiteMetadataProviderDelegate)providerDelegate
{
  return (WBSSiteMetadataProviderDelegate *)objc_loadWeakRetained((id *)&self->_providerDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end
