@implementation PUEditableMediaProviderVideoAssetNode

- (PUEditableMediaProviderVideoAssetNode)initWithAsset:(id)a3 mediaProvider:(id)a4 version:(int64_t)a5
{
  id v9;
  id v10;
  PUEditableMediaProviderVideoAssetNode *v11;
  PUEditableMediaProviderVideoAssetNode *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUEditableMediaProviderVideoAssetNode;
  v11 = -[PXRunNode initWithDependencies:](&v14, sel_initWithDependencies_, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_asset, a3);
    objc_storeStrong((id *)&v12->_mediaProvider, a4);
    v12->_version = a5;
  }

  return v12;
}

- (void)run
{
  AVAsset *videoAsset;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  videoAsset = self->_videoAsset;
  self->_videoAsset = 0;

  v4 = objc_alloc_init(MEMORY[0x1E0CD1808]);
  objc_msgSend(v4, "setDeliveryMode:", 1);
  objc_msgSend(v4, "setVideoComplementAllowed:", 1);
  objc_msgSend(v4, "setVersion:", -[PUEditableMediaProviderVideoAssetNode version](self, "version"));
  -[PUEditableMediaProviderVideoAssetNode asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUEditableMediaProviderVideoAssetNode mediaProvider](self, "mediaProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PUEditableMediaProviderVideoAssetNode_run__block_invoke;
  v7[3] = &unk_1E589E6E8;
  objc_copyWeak(&v8, &location);
  self->_requestID = objc_msgSend(v6, "requestAVAssetForVideo:options:resultHandler:", v5, v4, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_handleDidLoadVideo:(id)a3 info:(id)a4
{
  AVAsset *v6;
  void *v7;
  NSObject *v8;
  AVAsset *videoAsset;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = (AVAsset *)a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    PLPhotoEditGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Error fetching video: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  videoAsset = self->_videoAsset;
  self->_videoAsset = v6;

  -[PXRunNode completeWithError:](self, "completeWithError:", v7);
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- (int64_t)version
{
  return self->_version;
}

- (PUEditableAsset)asset
{
  return self->_asset;
}

- (PUEditableMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_videoAsset, 0);
}

void __44__PUEditableMediaProviderVideoAssetNode_run__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleDidLoadVideo:info:", v7, v6);

}

@end
