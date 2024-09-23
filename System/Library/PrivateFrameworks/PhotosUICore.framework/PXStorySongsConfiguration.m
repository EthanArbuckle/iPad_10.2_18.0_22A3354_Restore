@implementation PXStorySongsConfiguration

- (PXStorySongsConfiguration)init
{
  return -[PXStorySongsConfiguration initWithCuratedAudioAssets:](self, "initWithCuratedAudioAssets:", 0);
}

- (PXStorySongsConfiguration)initWithCuratedAudioAssets:(id)a3
{
  return -[PXStorySongsConfiguration initWithCuratedAudioAssets:currentAsset:](self, "initWithCuratedAudioAssets:currentAsset:", a3, 0);
}

- (PXStorySongsConfiguration)initWithCuratedAudioAssets:(id)a3 currentAsset:(id)a4
{
  return -[PXStorySongsConfiguration initWithCuratedAudioAssets:fallbackCuratedAssets:currentAsset:](self, "initWithCuratedAudioAssets:fallbackCuratedAssets:currentAsset:", a3, 0, a4);
}

- (PXStorySongsConfiguration)initWithCuratedAudioAssets:(id)a3 fallbackCuratedAssets:(id)a4 currentAsset:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXStorySongsConfiguration *v12;
  PXStorySongsConfiguration *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXStorySongsConfiguration;
  v12 = -[PXStorySongsConfiguration init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_curatedAudioAssets, a3);
    objc_storeStrong((id *)&v13->_fallbackCuratedAssets, a4);
    objc_storeStrong((id *)&v13->_currentAsset, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  PXStorySongsConfiguration *v4;
  PXStorySongsConfiguration *v5;
  id v6;
  id v7;
  int v8;
  char v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;

  v4 = (PXStorySongsConfiguration *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXStorySongsConfiguration curatedAudioAssets](self, "curatedAudioAssets");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStorySongsConfiguration curatedAudioAssets](v5, "curatedAudioAssets");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", v7);

        if (!v8)
        {
          v9 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      -[PXStorySongsConfiguration fallbackCuratedAssets](self, "fallbackCuratedAssets");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStorySongsConfiguration fallbackCuratedAssets](v5, "fallbackCuratedAssets");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
      {

      }
      else
      {
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
        {
          v9 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      -[PXStorySongsConfiguration currentAsset](self, "currentAsset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStorySongsConfiguration currentAsset](v5, "currentAsset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == v14)
        v9 = 1;
      else
        v9 = objc_msgSend(v13, "isEqual:", v14);

      goto LABEL_17;
    }
    v9 = 0;
  }
LABEL_19:

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXStorySongsConfiguration curatedAudioAssets](self, "curatedAudioAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[PXStorySongsConfiguration curatedAudioAssets](self, "curatedAudioAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[PXStorySongsConfiguration fallbackCuratedAssets](self, "fallbackCuratedAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[PXStorySongsConfiguration currentAsset](self, "currentAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXAudioAssetDescription(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; curated: %li; fallbackCurated: %li, current: %@>"),
                  v4,
                  self,
                  v6,
                  v8,
                  v10);

  return v11;
}

- (id)previewConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PXStorySongsConfiguration *v7;

  -[PXStorySongsConfiguration curatedAudioAssets](self, "curatedAudioAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXAudioAssetFetchResultMappingFetchResult(v3, &__block_literal_global_137947);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStorySongsConfiguration currentAsset](self, "currentAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewAudioAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXStorySongsConfiguration initWithCuratedAudioAssets:currentAsset:]([PXStorySongsConfiguration alloc], "initWithCuratedAudioAssets:currentAsset:", v4, v6);
  return v7;
}

- (PXAudioAssetFetchResult)curatedAudioAssets
{
  return self->_curatedAudioAssets;
}

- (PXAudioAssetFetchResult)fallbackCuratedAssets
{
  return self->_fallbackCuratedAssets;
}

- (PXAudioAsset)currentAsset
{
  return self->_currentAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_fallbackCuratedAssets, 0);
  objc_storeStrong((id *)&self->_curatedAudioAssets, 0);
}

uint64_t __49__PXStorySongsConfiguration_previewConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "previewAudioAsset");
}

@end
