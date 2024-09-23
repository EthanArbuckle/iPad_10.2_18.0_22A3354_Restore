@implementation PHAssetView

- (PHAssetView)initWithFrame:(CGRect)a3
{
  PHAssetView *v3;
  PHAssetView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHAssetView;
  v3 = -[PHAssetView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PHAssetView _commonPHAssetViewInit](v3, "_commonPHAssetViewInit");
  return v4;
}

- (PHAssetView)initWithCoder:(id)a3
{
  PHAssetView *v3;
  PHAssetView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHAssetView;
  v3 = -[PHAssetView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PHAssetView _commonPHAssetViewInit](v3, "_commonPHAssetViewInit");
  return v4;
}

- (void)_commonPHAssetViewInit
{
  PXPhotoKitAssetView *v3;
  PXPhotoKitAssetView *impl;

  v3 = (PXPhotoKitAssetView *)objc_alloc_init(MEMORY[0x1E0D7B6E8]);
  impl = self->_impl;
  self->_impl = v3;

  -[PHAssetView addSubview:](self, "addSubview:", self->_impl);
  -[PHAssetView setContentMode:](self, "setContentMode:", -[PXPhotoKitAssetView contentMode](self->_impl, "contentMode"));
}

- (void)setAsset:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_asset, a3);
  v5 = a3;
  -[PHAssetView impl](self, "impl");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAsset:", v5);

}

- (void)setContentMode:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHAssetView;
  -[PHAssetView setContentMode:](&v6, sel_setContentMode_);
  -[PHAssetView impl](self, "impl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", a3);

}

- (BOOL)allowsTextSelection
{
  void *v2;
  char v3;

  -[PHAssetView impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsTextSelection");

  return v3;
}

- (void)setAllowsTextSelection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PHAssetView impl](self, "impl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsTextSelection:", v3);

}

- (NSArray)stringsToHighlight
{
  void *v2;
  void *v3;

  -[PHAssetView impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringsToHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setStringsToHighlight:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "PHAssetView: Set strings to highlight: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHAssetView impl](self, "impl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStringsToHighlight:", v4);

}

- (NSArray)sceneIdentifiersToHighlight
{
  void *v2;
  void *v3;

  -[PHAssetView impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneIdentifiersToHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setSceneIdentifiersToHighlight:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "PHAssetView: Set scene identifiers to highlight: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHAssetView impl](self, "impl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSceneIdentifiersToHighlight:", v4);

}

- (NSArray)audioIdentifiersToHighlight
{
  void *v2;
  void *v3;

  -[PHAssetView impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioIdentifiersToHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setAudioIdentifiersToHighlight:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "PHAssetView: Set audio identifiers to highlight: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHAssetView impl](self, "impl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAudioIdentifiersToHighlight:", v4);

}

- (NSArray)humanActionIdentifiersToHighlight
{
  void *v2;
  void *v3;

  -[PHAssetView impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "humanActionIdentifiersToHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setHumanActionIdentifiersToHighlight:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "PHAssetView: Set human action identifiers to highlight: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHAssetView impl](self, "impl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHumanActionIdentifiersToHighlight:", v4);

}

- (NSArray)personLocalIdentifiersToHighlight
{
  void *v2;
  void *v3;

  -[PHAssetView impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personLocalIdentifiersToHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setPersonLocalIdentifiersToHighlight:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "PHAssetView: Set person identifiers to highlight: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHAssetView impl](self, "impl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPersonLocalIdentifiersToHighlight:", v4);

}

- (int64_t)preferredImageDynamicRange
{
  void *v2;
  int64_t v3;

  -[PHAssetView impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredImageDynamicRange");

  return v3;
}

- (void)setPreferredImageDynamicRange:(int64_t)a3
{
  id v4;

  -[PHAssetView impl](self, "impl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredImageDynamicRange:", a3);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[PHAssetView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PHAssetView impl](self, "impl");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (PHAsset)asset
{
  return self->_asset;
}

- (BOOL)allowsDragging
{
  return self->_allowsDragging;
}

- (void)setAllowsDragging:(BOOL)a3
{
  self->_allowsDragging = a3;
}

- (PXPhotoKitAssetView)impl
{
  return self->_impl;
}

- (void)setImpl:(id)a3
{
  objc_storeStrong((id *)&self->_impl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

+ (id)localizedTitleForAsset:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D7B6E8], "localizedTitleForAsset:", a3);
}

+ (CGRect)preferredContentsRectForAsset:(id)a3 targetSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0D7B308], "preferredContentsRectForAsset:targetSize:", a3, a4.width, a4.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

@end
