@implementation SearchUIDefaultPunchoutAppIconImage

- (SearchUIDefaultPunchoutAppIconImage)initWithSFImage:(id)a3 variant:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SearchUIDefaultPunchoutAppIconImage *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v6 = a3;
  objc_msgSend(v6, "punchout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "urls");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v6, "fileProviderIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(v6, "coreSpotlightIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (v13)
      {
        objc_msgSend(v6, "fileProviderIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "coreSpotlightIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[SearchUIDefaultPunchoutAppIconImage initWithFileProviderId:coreSpotlightId:variant:](self, "initWithFileProviderId:coreSpotlightId:variant:", v14, v15, a4);

        v10 = self;
        goto LABEL_8;
      }
    }
    else
    {

    }
    v10 = 0;
    goto LABEL_8;
  }
  self = -[SearchUIDefaultPunchoutAppIconImage initWithURL:variant:](self, "initWithURL:variant:", v9, a4);
  v10 = self;
LABEL_8:

  return v10;
}

- (SearchUIDefaultPunchoutAppIconImage)initWithURL:(id)a3 variant:(unint64_t)a4
{
  id v6;
  SearchUIDefaultPunchoutAppIconImage *v7;
  SearchUIDefaultPunchoutAppIconImage *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchUIDefaultPunchoutAppIconImage;
  v7 = -[SearchUIAppIconImage initWithBundleIdentifier:variant:contentType:](&v10, sel_initWithBundleIdentifier_variant_contentType_, 0, a4, 0);
  v8 = v7;
  if (v7)
    -[SearchUIDefaultPunchoutAppIconImage setUrl:](v7, "setUrl:", v6);

  return v8;
}

- (SearchUIDefaultPunchoutAppIconImage)initWithFileProviderId:(id)a3 coreSpotlightId:(id)a4 variant:(unint64_t)a5
{
  id v8;
  id v9;
  SearchUIDefaultPunchoutAppIconImage *v10;
  void *v11;
  SearchUIDefaultPunchoutAppIconImage *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SearchUIDefaultPunchoutAppIconImage;
  v10 = -[SearchUIAppIconImage initWithBundleIdentifier:variant:contentType:](&v14, sel_initWithBundleIdentifier_variant_contentType_, 0, a5, 0);
  if (!v10
    || (+[SearchUIUtilities fileProviderItemIDForCoreSpotlightIdentifier:fileProviderIdentifier:](SearchUIUtilities, "fileProviderItemIDForCoreSpotlightIdentifier:fileProviderIdentifier:", v9, v8), v11 = (void *)objc_claimAutoreleasedReturnValue(), -[SearchUIDefaultPunchoutAppIconImage setFpItemID:](v10, "setFpItemID:", v11), v11, -[SearchUIDefaultPunchoutAppIconImage fpItemID](v10, "fpItemID"), v12 = (SearchUIDefaultPunchoutAppIconImage *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    v12 = v10;
  }

  return v12;
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16[2];
  BOOL v17;
  id location;

  v5 = a4;
  v8 = a5;
  -[SearchUIDefaultPunchoutAppIconImage url](self, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SearchUIDefaultPunchoutAppIconImage url](self, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDefaultPunchoutAppIconImage loadRelatedAppIconImageForFileURL:scale:isDarkStyle:completionHandler:](self, "loadRelatedAppIconImageForFileURL:scale:isDarkStyle:completionHandler:", v10, v5, v8, a3);

  }
  else
  {
    -[SearchUIDefaultPunchoutAppIconImage fpItemID](self, "fpItemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIDefaultPunchoutAppIconImage fpItemID](self, "fpItemID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __88__SearchUIDefaultPunchoutAppIconImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke;
      v14[3] = &unk_1EA1F7808;
      objc_copyWeak(v16, &location);
      v16[1] = *(id *)&a3;
      v17 = v5;
      v15 = v8;
      objc_msgSend(v12, "fetchURLForItemID:completionHandler:", v13, v14);

      objc_destroyWeak(v16);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, _QWORD, uint64_t))v8 + 2))(v8, 0, 1);
    }
  }

}

void __88__SearchUIDefaultPunchoutAppIconImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "loadRelatedAppIconImageForFileURL:scale:isDarkStyle:completionHandler:", v4, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)loadRelatedAppIconImageForFileURL:(id)a3 scale:(double)a4 isDarkStyle:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  SearchUIDefaultPunchoutAppIconImage *v16;
  id v17;
  double v18;
  BOOL v19;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  -[SearchUIDefaultPunchoutAppIconImage wrappedImage](self, "wrappedImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SearchUIDefaultPunchoutAppIconImage wrappedImage](self, "wrappedImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loadImageWithScale:isDarkStyle:completionHandler:", v7, v11, a4);

  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __109__SearchUIDefaultPunchoutAppIconImage_loadRelatedAppIconImageForFileURL_scale_isDarkStyle_completionHandler___block_invoke;
    v14[3] = &unk_1EA1F77A0;
    v15 = v10;
    v16 = self;
    v18 = a4;
    v19 = v7;
    v17 = v11;
    +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v14);

  }
}

void __109__SearchUIDefaultPunchoutAppIconImage_loadRelatedAppIconImageForFileURL_scale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (IDSBAASignerErrorDomain_block_invoke_onceToken_0 != -1)
    dispatch_once(&IDSBAASignerErrorDomain_block_invoke_onceToken_0, &__block_literal_global_91);
  objc_msgSend(MEMORY[0x1E0D96D38], "interactionControllerWithURL:", *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_defaultApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "supportsOpenInPlace"))
  {
    v3 = 0;
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_10;
  }
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_9;
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_9;
  v4 = IDSBAASignerErrorDomain_block_invoke_disabledBundleIDs;
  objc_msgSend(v2, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend((id)v4, "containsObject:", v5);

  if ((v4 & 1) != 0)
    goto LABEL_9;
  v6 = objc_msgSend(*(id *)(a1 + 40), "variant");
  objc_msgSend(*(id *)(a1 + 40), "contentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIAppIconImage appIconForBundleIdentifier:variant:contentType:](SearchUIAppIconImage, "appIconForBundleIdentifier:variant:contentType:", v3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setWrappedImage:", v8);
  objc_msgSend(v8, "loadImageWithScale:isDarkStyle:completionHandler:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));

LABEL_10:
}

void __109__SearchUIDefaultPunchoutAppIconImage_loadRelatedAppIconImageForFileURL_scale_isDarkStyle_completionHandler___block_invoke_2()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)objc_opt_new();
  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 6);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v0, "addObject:", v2);
  v1 = (void *)IDSBAASignerErrorDomain_block_invoke_disabledBundleIDs;
  IDSBAASignerErrorDomain_block_invoke_disabledBundleIDs = (uint64_t)v0;

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  id v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SearchUIDefaultPunchoutAppIconImage;
  if (!-[SearchUIAppIconImage isEqual:](&v19, sel_isEqual_, v8)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v12 = 0;
    goto LABEL_26;
  }
  v9 = v8;
  -[SearchUIDefaultPunchoutAppIconImage url](self, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    && (-[SearchUIDefaultPunchoutAppIconImage url](self, "url"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "url"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v3, "isEqual:", v4) & 1) != 0))
  {
    v11 = 0;
  }
  else
  {
    -[SearchUIDefaultPunchoutAppIconImage url](self, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v12 = 0;
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v9, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {

      v12 = 0;
      goto LABEL_23;
    }
    v11 = 1;
  }
  -[SearchUIDefaultPunchoutAppIconImage fpItemID](self, "fpItemID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[SearchUIDefaultPunchoutAppIconImage fpItemID](self, "fpItemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fpItemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
    {
      v12 = 1;
      goto LABEL_17;
    }
  }
  -[SearchUIDefaultPunchoutAppIconImage fpItemID](self, "fpItemID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

    v12 = 0;
    if (v15)
      goto LABEL_17;
  }
  else
  {
    objc_msgSend(v9, "fpItemID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v17 == 0;

    if (v15)
    {
LABEL_17:

      if ((v11 & 1) == 0)
        goto LABEL_23;
      goto LABEL_21;
    }
  }
  if (v11)
  {
LABEL_21:
    v13 = 0;
    goto LABEL_22;
  }
LABEL_23:
  if (v10)
  {

  }
LABEL_26:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  objc_super v9;

  -[SearchUIDefaultPunchoutAppIconImage url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SearchUIDefaultPunchoutAppIconImage fpItemID](self, "fpItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIDefaultPunchoutAppIconImage;
  v7 = v6 ^ -[SearchUIAppIconImage hash](&v9, sel_hash);

  return v7;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (FPItemID)fpItemID
{
  return self->_fpItemID;
}

- (void)setFpItemID:(id)a3
{
  objc_storeStrong((id *)&self->_fpItemID, a3);
}

- (SearchUIImage)wrappedImage
{
  return self->_wrappedImage;
}

- (void)setWrappedImage:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedImage, 0);
  objc_storeStrong((id *)&self->_fpItemID, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
