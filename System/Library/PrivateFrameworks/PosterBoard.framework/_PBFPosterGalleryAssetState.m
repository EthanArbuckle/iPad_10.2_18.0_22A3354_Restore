@implementation _PBFPosterGalleryAssetState

+ (id)liveAlwaysPostersPredicate
{
  if (liveAlwaysPostersPredicate_onceToken != -1)
    dispatch_once(&liveAlwaysPostersPredicate_onceToken, &__block_literal_global_6);
  return (id)liveAlwaysPostersPredicate_liveAlwaysPostersPredicate;
}

- (_PBFPosterGalleryAssetState)initWithPreview:(id)a3
{
  id v5;
  _PBFPosterGalleryAssetState *v6;
  _PBFPosterGalleryAssetState *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  PBFPosterGalleryAsset *asset;
  PBFPosterSnapshotCollection *v20;
  PBFPosterSnapshotCollection *snapshotCollection;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_PBFPosterGalleryAssetState;
  v6 = -[_PBFPosterGalleryAssetState init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_preview, a3);
    objc_msgSend(v5, "posterDescriptorLookupInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "posterDescriptorExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "posterExtensionBundleIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "posterDescriptorPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "descriptorIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@:%@"), v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend(v15, "isEqual:", PBFPreviewTypeHero);

    if ((v11 & 1) == 0)
    {
      if (PRIsLowQualityDevice())
      {
        v7->_willUseLivePreview = 0;
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "liveAlwaysPostersPredicate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "galleryDisplayStyle") == 1 || (objc_msgSend(v16, "evaluateWithObject:", v14) & 1) != 0)
        {
          v7->_willUseLivePreview = 1;
          objc_msgSend(v14, "stringByAppendingString:", CFSTR(".live"));
          v17 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v17;
        }
        else
        {
          v7->_willUseLivePreview = 0;
        }

      }
    }
    v7->_livePreviewState = -1;
    v18 = objc_opt_new();
    asset = v7->_asset;
    v7->_asset = (PBFPosterGalleryAsset *)v18;

    v20 = -[PBFPosterSnapshotCollection initWithUniqueIdentifier:]([PBFPosterSnapshotCollection alloc], "initWithUniqueIdentifier:", v14);
    snapshotCollection = v7->_snapshotCollection;
    v7->_snapshotCollection = v20;

  }
  return v7;
}

- (PRPosterDescriptorGalleryOptions)galleryOptions
{
  PRPosterDescriptorGalleryOptions *galleryOptions;
  PRPosterDescriptorGalleryOptions **p_galleryOptions;
  PRPosterDescriptorGalleryOptions *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  PRPosterDescriptorGalleryOptions *v18;

  p_galleryOptions = &self->_galleryOptions;
  galleryOptions = self->_galleryOptions;
  if (!galleryOptions && !self->_galleryOptionsDidFail)
  {
    -[PBFPosterPreview posterDescriptorLookupInfo](self->_preview, "posterDescriptorLookupInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "posterDescriptorExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "posterDescriptorPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "descriptorIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "type");

    if (v12 == 2)
    {
      objc_msgSend(v8, "posterExtensionInfoPlist");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pbf_posterBoardPosterDescriptorHeroGalleryOptionsForStaticDescriptorIdentifier:", v10);
      v5 = (PRPosterDescriptorGalleryOptions *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "identity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "type");

      if (v15 != 1)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0D7FB48], "modelObjectCacheForPath:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "galleryOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D7FB50], "loadPosterDescriptorGalleryOptionsForPath:error:", v9, 0);
        v18 = (PRPosterDescriptorGalleryOptions *)objc_claimAutoreleasedReturnValue();
      }
      v5 = v18;

    }
    if (v5)
    {
      objc_storeStrong((id *)p_galleryOptions, v5);
LABEL_15:

      return v5;
    }
LABEL_14:
    v5 = 0;
    self->_galleryOptionsDidFail = 1;
    goto LABEL_15;
  }
  v5 = galleryOptions;
  return v5;
}

- (unint64_t)hash
{
  return -[PBFPosterPreview hash](self->_preview, "hash");
}

- (BOOL)willUseLivePreview
{
  return self->_livePreviewState != 2 && self->_willUseLivePreview;
}

- (PBFPosterPreview)preview
{
  return self->_preview;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)setVisible:(BOOL)a3
{
  self->_isVisible = a3;
}

- (BOOL)shouldPrefetch
{
  return self->_shouldPrefetch;
}

- (void)setShouldPrefetch:(BOOL)a3
{
  self->_shouldPrefetch = a3;
}

- (BOOL)isLiveAlwaysPoster
{
  return self->_isLiveAlwaysPoster;
}

- (int64_t)livePreviewState
{
  return self->_livePreviewState;
}

- (void)setLivePreviewState:(int64_t)a3
{
  self->_livePreviewState = a3;
}

- (PBFGalleryPosterViewController)livePreviewViewController
{
  return self->_livePreviewViewController;
}

- (void)setLivePreviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_livePreviewViewController, a3);
}

- (_PBFImageView)previewImageView
{
  return self->_previewImageView;
}

- (void)setPreviewImageView:(id)a3
{
  objc_storeStrong((id *)&self->_previewImageView, a3);
}

- (PBFPosterGalleryAsset)asset
{
  return self->_asset;
}

- (PBFPosterSnapshotCollection)snapshotCollection
{
  return self->_snapshotCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotCollection, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_previewImageView, 0);
  objc_storeStrong((id *)&self->_livePreviewViewController, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_galleryOptions, 0);
}

@end
