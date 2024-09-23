@implementation PKPaymentHeroImageController

+ (id)defaultImages
{
  id v2;
  id v3;
  void (**v4)(void *, void *, uint64_t);
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD aBlock[4];
  id v11;
  _OWORD v12[2];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12[0] = xmmword_190436510;
  v12[1] = xmmword_190455330;
  v13 = 11;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PKPaymentHeroImageController_defaultImages__block_invoke;
  aBlock[3] = &unk_1E2ACFF48;
  v3 = v2;
  v11 = v3;
  v4 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
  for (i = 0; i != 40; i += 8)
  {
    v6 = *(_QWORD *)((char *)v12 + i);
    PKPaymentNetworkNameForPaymentCredentialType(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7, v6);

  }
  v4[2](v4, CFSTR("AppleCard"), 0);
  v4[2](v4, CFSTR("AppleCash"), 0);
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

void __45__PKPaymentHeroImageController_defaultImages__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  PKPaymentHeroImage *v12;
  void *v13;
  void *v14;
  void *v15;
  PKPaymentHeroImage *v16;
  id v17;

  v17 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HeroCard_%@"), v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKPassKitCoreBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKImage URLForImageNamed:inBundle:scale:](PKImage, "URLForImageNamed:inBundle:scale:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

    if (v10)
    {
      v11 = *(void **)(a1 + 32);
      v12 = [PKPaymentHeroImage alloc];
      v13 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v7, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dataWithContentsOfFile:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PKPaymentHeroImage initWithIdentifier:imageData:credentialType:](v12, "initWithIdentifier:imageData:credentialType:", v17, v15, a3);
      objc_msgSend(v11, "addObject:", v16);

    }
  }

}

- (PKPaymentHeroImageController)initWithManifest:(id)a3 webService:(id)a4
{
  id v7;
  id v8;
  PKPaymentHeroImageController *v9;
  PKPaymentHeroImageController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentHeroImageController;
  v9 = -[PKPaymentHeroImageController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_manifest, a3);
    objc_storeStrong((id *)&v10->_webService, a4);
  }

  return v10;
}

- (NSArray)featuredImages
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PKPaymentHeroImageController featuredImageIdentifiers](self, "featuredImageIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentHeroImageManifest images](self->_manifest, "images");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    v12 = (void *)objc_msgSend(v5, "copy");
  else
    v12 = 0;

  return (NSArray *)v12;
}

- (NSString)primaryImageIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebService context](self->_webService, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryFeaturedNetworkForRegion:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)featuredImageIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebService context](self->_webService, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paymentSetupFeaturedNetworksForRegion:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)filterImages:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "isSupportedByDevice:", v6, (_QWORD)v15))
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (id)featuredDefaultImages
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "defaultImages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentHeroImageController featuredImageIdentifiers](self, "featuredImageIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "identifier", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "containsObject:", v12);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    v14 = (void *)objc_msgSend(v5, "copy");
  else
    v14 = 0;

  return v14;
}

- (void)downloadImages:(id)a3
{
  id v4;
  double v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _QWORD v12[5];
  id v13;
  id location;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = PKScreenScale();
  +[PKObjectDownloader sharedImageAssetDownloader](PKObjectDownloader, "sharedImageAssetDownloader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v11, "hasCachedImageWithScale:", v5) & 1) == 0)
        {
          objc_initWeak(&location, self);
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __47__PKPaymentHeroImageController_downloadImages___block_invoke;
          v12[3] = &unk_1E2ACFF70;
          objc_copyWeak(&v13, &location);
          v12[4] = v11;
          objc_msgSend(v11, "downloadImageWithScale:fileDownloader:completion:", v6, v12, v5);
          objc_destroyWeak(&v13);
          objc_destroyWeak(&location);
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

void __47__PKPaymentHeroImageController_downloadImages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained(WeakRetained + 5);
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "heroImageController:didFinishDownloadingImageData:forImage:error:", v7, v5, *(_QWORD *)(a1 + 32), v9);

  }
}

- (CGSize)cardArtSizeForSize:(CGSize)a3
{
  double v3;
  double v4;
  int IsAvailable;
  CGSize result;

  if (self->_watchSize)
  {
    objc_msgSend((id)objc_opt_class(), "cardArtSizeForWatchViewSize:", a3.width, a3.height);
  }
  else if (a3.width <= 320.0)
  {
    v4 = 113.0;
    v3 = 180.0;
  }
  else
  {
    IsAvailable = PKPearlIsAvailable();
    v4 = 61.0;
    if (!IsAvailable)
      v4 = 53.0;
    v3 = 85.0;
    if (IsAvailable)
      v3 = 96.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)cardArtSizeForWatchViewSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = a3.width * 0.555;
  v4 = a3.height * 0.206;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (double)cardAspectRatio
{
  return 1.59;
}

- (void)setPrimaryImageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setFeaturedImages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PKPaymentHeroImageManifest)manifest
{
  return self->_manifest;
}

- (PKPaymentHeroImageControllerDelegate)delegate
{
  return (PKPaymentHeroImageControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)watchSize
{
  return self->_watchSize;
}

- (void)setWatchSize:(int64_t)a3
{
  self->_watchSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_featuredImages, 0);
  objc_storeStrong((id *)&self->_primaryImageIdentifier, 0);
  objc_storeStrong((id *)&self->_webService, 0);
}

@end
