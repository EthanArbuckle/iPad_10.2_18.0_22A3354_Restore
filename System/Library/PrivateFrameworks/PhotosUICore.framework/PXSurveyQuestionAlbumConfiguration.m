@implementation PXSurveyQuestionAlbumConfiguration

- (PXSurveyQuestionAlbumConfiguration)initWithTitle:(id)a3 album:(id)a4
{
  id v7;
  id v8;
  PXSurveyQuestionAlbumConfiguration *v9;
  PXSurveyQuestionAlbumConfiguration *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PHAsset *keyAsset;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PXSurveyQuestionAlbumConfiguration;
  v9 = -[PXSurveyQuestionAlbumConfiguration init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_album, a4);
    v11 = (void *)MEMORY[0x1E0CD1390];
    -[PHAssetCollection photoLibrary](v10->_album, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchKeyAssetsInAssetCollection:options:", v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = objc_claimAutoreleasedReturnValue();
    keyAsset = v10->_keyAsset;
    v10->_keyAsset = (PHAsset *)v15;

    v10->_isStale = 0;
  }

  return v10;
}

- (PXSurveyQuestionAlbumConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionAlbumConfiguration.m"), 43, CFSTR("%s is not available as initializer"), "-[PXSurveyQuestionAlbumConfiguration init]");

  abort();
}

- (void)dealloc
{
  PXDisplayAssetContentView *v3;
  objc_super v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  PXDisplayAssetContentView *v9;

  v3 = self->_contentView;
  -[PXTitleSubtitleUILabel removeFromSuperview](self->_label, "removeFromSuperview");
  if (v3)
  {
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __45__PXSurveyQuestionAlbumConfiguration_dealloc__block_invoke;
    v8 = &unk_1E5149198;
    v9 = v3;
    px_dispatch_on_main_queue();

  }
  v4.receiver = self;
  v4.super_class = (Class)PXSurveyQuestionAlbumConfiguration;
  -[PXSurveyQuestionAlbumConfiguration dealloc](&v4, sel_dealloc);
}

- (UIView)contentView
{
  PXDisplayAssetContentView *contentView;
  PXDisplayAssetContentView *v4;
  PXDisplayAssetContentView *v5;
  PXTitleSubtitleUILabel *v6;
  PXTitleSubtitleUILabel *v7;
  PXTitleSubtitleUILabel *label;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  contentView = self->_contentView;
  if (!contentView)
  {
    +[PXDisplayAssetContentView checkOutViewForAsset:withPlaybackStyle:](PXDisplayAssetContentView, "checkOutViewForAsset:withPlaybackStyle:", self->_keyAsset, 1);
    v4 = (PXDisplayAssetContentView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contentView;
    self->_contentView = v4;

    +[PXSurveyQuestionAssetConfiguration configureViewForAsset:](PXSurveyQuestionAssetConfiguration, "configureViewForAsset:", self->_contentView);
    v6 = [PXTitleSubtitleUILabel alloc];
    -[PXDisplayAssetContentView bounds](self->_contentView, "bounds");
    v7 = -[PXTitleSubtitleUILabel initWithFrame:](v6, "initWithFrame:");
    label = self->_label;
    self->_label = v7;

    -[PHAssetCollection title](self->_album, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTitleSubtitleUILabel setTitleText:](self->_label, "setTitleText:", v9);

    v10 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHAssetCollection approximateCount](self->_album, "approximateCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringFromNumber:numberStyle:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTitleSubtitleUILabel setSubtitleText:](self->_label, "setSubtitleText:", v13);

    -[PXSurveyQuestionAlbumConfiguration _getTitleSubtitleLabelSpec](self, "_getTitleSubtitleLabelSpec");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTitleSubtitleUILabel setSpec:](self->_label, "setSpec:", v14);

    -[PXDisplayAssetContentView addSubview:](self->_contentView, "addSubview:", self->_label);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleDidSelectAlbumView);
    -[PXDisplayAssetContentView addGestureRecognizer:](self->_contentView, "addGestureRecognizer:", v15);

    contentView = self->_contentView;
  }
  return (UIView *)contentView;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXDisplayAssetContentView setFrame:](self->_contentView, "setFrame:");
  -[PXTitleSubtitleUILabel setFrame:](self->_label, "setFrame:", x, y, width, height);
}

- (UIImage)contentImageForOneUp
{
  return 0;
}

- (CGRect)contentRectForOneUp
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)_getTitleSubtitleLabelSpec
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64x2_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  _BYTE v27[7];

  memset(v27, 0, sizeof(v27));
  -[PXDisplayAssetContentView bounds](self->_contentView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXDisplayAssetContentView layoutMargins](self->_contentView, "layoutMargins");
  v16 = vdupq_n_s64(1uLL);
  v17 = 0;
  v18 = v4;
  v19 = v6;
  v20 = v8;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = 1;
  objc_msgSend(off_1E50B5C68, "memoriesTitleSubtitleSpecForContext:", &v16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_handleDidSelectAlbumView
{
  void *v3;
  PHAssetCollection *album;
  void *v5;
  void *v6;
  void *v7;
  PXPhotosDetailsUIViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  id v13;

  v3 = (void *)MEMORY[0x1E0CD1390];
  album = self->_album;
  -[PHAssetCollection photoLibrary](album, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchAssetsInAssetCollection:options:", album, v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  +[PXPhotosDetailsContext photosDetailsContextForAssetCollection:assets:viewSourceOrigin:](PXPhotosDetailsContext, "photosDetailsContextForAssetCollection:assets:viewSourceOrigin:", self->_album, v13, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXPhotosDetailsUIViewController initWithContext:options:]([PXPhotosDetailsUIViewController alloc], "initWithContext:options:", v7, 0);
  -[PXSurveyQuestionAlbumConfiguration handlers](self, "handlers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewControllerHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PXSurveyQuestionAlbumConfiguration handlers](self, "handlers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pushViewControllerHandler");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, PXPhotosDetailsUIViewController *, PHAssetCollection *))v12)[2](v12, v8, self->_album);

  }
}

- (BOOL)needsQuestionInvalidationForChange:(id)a3
{
  PHAssetCollection *album;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  album = self->_album;
  if (!album)
    return 0;
  objc_msgSend(a3, "changeDetailsForObject:", album);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "objectWasDeleted") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[PHAssetCollection photoLibrary](self->_album, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFetchPropertySets:", v9);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", self->_album, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v10, "count") == 0;

  }
  return v6;
}

- (BOOL)needsDisplayRefreshForChange:(id)a3
{
  PHAssetCollection *album;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  album = self->_album;
  if (!album)
    return 0;
  -[PHAssetCollection title](album, "title", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCollection photoLibrary](self->_album, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CD13B8];
  -[PHAssetCollection localIdentifier](self->_album, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAssetCollectionsWithLocalIdentifiers:options:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && !objc_msgSend(v5, "isEqualToString:", v13))
  {
    v16 = 1;
  }
  else
  {
    -[PHAssetCollection photoLibrary](self->_album, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "librarySpecificFetchOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = *MEMORY[0x1E0CD19C0];
    v16 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFetchPropertySets:", v17);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", self->_album, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsObject:", self->_keyAsset);
    if (!self->_keyAsset || v19)
    {
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", self->_album, v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[PHAssetCollection approximateCount](self->_album, "approximateCount");
      v16 = v21 != objc_msgSend(v20, "count");

    }
  }

  return v16;
}

- (NSString)title
{
  return self->_title;
}

- (PXSurveyQuestionConfigurationHandlers)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (BOOL)isStale
{
  return self->_isStale;
}

- (void)setIsStale:(BOOL)a3
{
  self->_isStale = a3;
}

- (PHAssetCollection)album
{
  return self->_album;
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

uint64_t __45__PXSurveyQuestionAlbumConfiguration_dealloc__block_invoke(uint64_t a1)
{
  return +[PXDisplayAssetContentView checkInView:](PXDisplayAssetContentView, "checkInView:", *(_QWORD *)(a1 + 32));
}

@end
