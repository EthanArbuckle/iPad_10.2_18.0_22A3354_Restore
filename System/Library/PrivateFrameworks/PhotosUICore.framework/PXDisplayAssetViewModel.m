@implementation PXDisplayAssetViewModel

- (PXDisplayAssetViewModel)init
{
  PXDisplayAssetViewModel *v2;
  uint64_t v3;
  PXUpdater *updater;
  NSArray *timeRangesToHighlight;
  PXDisplayAssetViewModelHighlightTimeRangeController *v6;
  PXDisplayAssetViewModelHighlightTimeRangeController *timeRangeController;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXDisplayAssetViewModel;
  v2 = -[PXDisplayAssetViewModel init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v2, sel__setNeedsUpdate);
    updater = v2->_updater;
    v2->_updater = (PXUpdater *)v3;

    -[PXUpdater addUpdateSelector:](v2->_updater, "addUpdateSelector:", sel__updateAssetAspectRatio);
    timeRangesToHighlight = v2->_timeRangesToHighlight;
    v2->_timeRangesToHighlight = (NSArray *)MEMORY[0x1E0C9AA60];

    v6 = -[PXDisplayAssetViewModelHighlightTimeRangeController initWithViewModel:]([PXDisplayAssetViewModelHighlightTimeRangeController alloc], "initWithViewModel:", v2);
    timeRangeController = v2->_timeRangeController;
    v2->_timeRangeController = v6;

  }
  return v2;
}

- (void)setAsset:(id)a3
{
  PXDisplayAsset *v5;
  double v6;
  PXDisplayAsset *v7;

  v5 = (PXDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 1);
    -[PXDisplayAssetViewModel setPlaybackStyle:](self, "setPlaybackStyle:", -[PXDisplayAsset playbackStyle](self->_asset, "playbackStyle"));
    -[PXDisplayAssetViewModel _invalidateAssetAspectRatio](self, "_invalidateAssetAspectRatio");
    -[PXDisplayAssetViewModel setCurrentImage:](self, "setCurrentImage:", 0);
    -[PXDisplayAssetViewModel setContentSafeAreaInsets:](self, "setContentSafeAreaInsets:", *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
    -[PXDisplayAssetViewModel setIsDisplayingFullQualityContent:](self, "setIsDisplayingFullQualityContent:", 0);
    LODWORD(v6) = 0;
    -[PXDisplayAssetViewModel setLoadingProgress:](self, "setLoadingProgress:", v6);
    -[PXDisplayAssetViewModel setLoadingError:](self, "setLoadingError:", 0);
    v5 = v7;
  }

}

- (void)setSceneIdentifiersToHighlight:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *sceneIdentifiersToHighlight;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_sceneIdentifiersToHighlight;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      sceneIdentifiersToHighlight = self->_sceneIdentifiersToHighlight;
      self->_sceneIdentifiersToHighlight = v6;

      -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 4096);
    }
  }

}

- (void)setAudioIdentifiersToHighlight:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *audioIdentifiersToHighlight;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_audioIdentifiersToHighlight;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      audioIdentifiersToHighlight = self->_audioIdentifiersToHighlight;
      self->_audioIdentifiersToHighlight = v6;

      -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 0x2000);
    }
  }

}

- (void)setHumanActionIdentifiersToHighlight:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *humanActionIdentifiersToHighlight;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_humanActionIdentifiersToHighlight;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      humanActionIdentifiersToHighlight = self->_humanActionIdentifiersToHighlight;
      self->_humanActionIdentifiersToHighlight = v6;

      -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 0x4000);
    }
  }

}

- (void)setPersonLocalIdentifiersToHighlight:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *personLocalIdentifiersToHighlight;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_personLocalIdentifiersToHighlight;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      personLocalIdentifiersToHighlight = self->_personLocalIdentifiersToHighlight;
      self->_personLocalIdentifiersToHighlight = v6;

      -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 0x8000);
    }
  }

}

- (void)setPlaybackStyle:(int64_t)a3
{
  if (self->_playbackStyle != a3)
  {
    self->_playbackStyle = a3;
    -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 2);
  }
}

- (void)setAssetAspectRatio:(double)a3
{
  if (self->_assetAspectRatio != a3)
  {
    self->_assetAspectRatio = a3;
    -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 4);
  }
}

- (void)setContentMode:(int64_t)a3
{
  if (self->_contentMode != a3)
  {
    self->_contentMode = a3;
    -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 8);
  }
}

- (void)setWantsLivePhotoPlayback:(BOOL)a3
{
  self->_wantsLivePhotoPlayback = a3;
  -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 16);
}

- (void)setCurrentImage:(id)a3
{
  UIImage *v5;
  char v6;
  UIImage *v7;

  v7 = (UIImage *)a3;
  v5 = self->_currentImage;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[UIImage isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentImage, a3);
      -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 32);
    }
  }

}

- (void)setContentSafeAreaInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_contentSafeAreaInsets;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_contentSafeAreaInsets = &self->_contentSafeAreaInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_contentSafeAreaInsets->top = top;
    p_contentSafeAreaInsets->left = left;
    p_contentSafeAreaInsets->bottom = bottom;
    p_contentSafeAreaInsets->right = right;
    -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 2048);
  }
}

- (void)setIsDisplayingFullQualityContent:(BOOL)a3
{
  if (self->_isDisplayingFullQualityContent != a3)
  {
    self->_isDisplayingFullQualityContent = a3;
    -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 64);
  }
}

- (void)setAllowsTextSelection:(BOOL)a3
{
  if (self->_allowsTextSelection != a3)
  {
    self->_allowsTextSelection = a3;
    -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 128);
  }
}

- (void)setStringsToHighlight:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *stringsToHighlight;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_stringsToHighlight;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      stringsToHighlight = self->_stringsToHighlight;
      self->_stringsToHighlight = v6;

      -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 256);
    }
  }

}

- (void)setLoadingProgress:(float)a3
{
  if (self->_loadingProgress != a3)
  {
    self->_loadingProgress = a3;
    -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 512);
  }
}

- (void)setTimeRangesToHighlight:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *timeRangesToHighlight;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_timeRangesToHighlight;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      timeRangesToHighlight = self->_timeRangesToHighlight;
      self->_timeRangesToHighlight = v6;

      -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 0x10000);
    }
  }

}

- (void)setLoadingError:(id)a3
{
  NSError *v4;
  char v5;
  NSError *v6;
  NSError *loadingError;
  NSError *v8;

  v8 = (NSError *)a3;
  v4 = self->_loadingError;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSError isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSError *)-[NSError copy](v8, "copy");
      loadingError = self->_loadingError;
      self->_loadingError = v6;

      -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 1024);
    }
  }

}

- (void)performChanges:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetViewModel.m"), 181, CFSTR("%s must be called on the main thread"), "-[PXDisplayAssetViewModel performChanges:]");

  }
  v7.receiver = self;
  v7.super_class = (Class)PXDisplayAssetViewModel;
  -[PXDisplayAssetViewModel performChanges:](&v7, sel_performChanges_, v5);

}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXDisplayAssetViewModel;
  -[PXDisplayAssetViewModel didPerformChanges](&v4, sel_didPerformChanges);
  -[PXDisplayAssetViewModel updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)_setNeedsUpdate
{
  -[PXDisplayAssetViewModel signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateAssetAspectRatio
{
  id v2;

  -[PXDisplayAssetViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAssetAspectRatio);

}

- (void)_updateAssetAspectRatio
{
  id v3;

  -[PXDisplayAssetViewModel asset](self, "asset");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pixelWidth");
  objc_msgSend(v3, "pixelHeight");
  PXSizeGetAspectRatioWithDefault();
  -[PXDisplayAssetViewModel setAssetAspectRatio:](self, "setAssetAspectRatio:");

}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (double)assetAspectRatio
{
  return self->_assetAspectRatio;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (BOOL)wantsLivePhotoPlayback
{
  return self->_wantsLivePhotoPlayback;
}

- (UIImage)currentImage
{
  return self->_currentImage;
}

- (UIEdgeInsets)contentSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentSafeAreaInsets.top;
  left = self->_contentSafeAreaInsets.left;
  bottom = self->_contentSafeAreaInsets.bottom;
  right = self->_contentSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isDisplayingFullQualityContent
{
  return self->_isDisplayingFullQualityContent;
}

- (BOOL)allowsTextSelection
{
  return self->_allowsTextSelection;
}

- (NSArray)stringsToHighlight
{
  return self->_stringsToHighlight;
}

- (NSArray)sceneIdentifiersToHighlight
{
  return self->_sceneIdentifiersToHighlight;
}

- (NSArray)audioIdentifiersToHighlight
{
  return self->_audioIdentifiersToHighlight;
}

- (NSArray)humanActionIdentifiersToHighlight
{
  return self->_humanActionIdentifiersToHighlight;
}

- (NSArray)personLocalIdentifiersToHighlight
{
  return self->_personLocalIdentifiersToHighlight;
}

- (NSArray)timeRangesToHighlight
{
  return self->_timeRangesToHighlight;
}

- (float)loadingProgress
{
  return self->_loadingProgress;
}

- (NSError)loadingError
{
  return self->_loadingError;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXDisplayAssetViewModelHighlightTimeRangeController)timeRangeController
{
  return self->_timeRangeController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRangeController, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_loadingError, 0);
  objc_storeStrong((id *)&self->_timeRangesToHighlight, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiersToHighlight, 0);
  objc_storeStrong((id *)&self->_humanActionIdentifiersToHighlight, 0);
  objc_storeStrong((id *)&self->_audioIdentifiersToHighlight, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiersToHighlight, 0);
  objc_storeStrong((id *)&self->_stringsToHighlight, 0);
  objc_storeStrong((id *)&self->_currentImage, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
