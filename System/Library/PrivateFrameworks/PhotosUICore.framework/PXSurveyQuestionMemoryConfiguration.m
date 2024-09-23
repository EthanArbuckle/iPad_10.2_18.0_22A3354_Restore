@implementation PXSurveyQuestionMemoryConfiguration

- (PXSurveyQuestionMemoryConfiguration)initWithTitle:(id)a3 memory:(id)a4 songAdamId:(id)a5 customKeyAssetIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PXSurveyQuestionMemoryConfiguration *v14;
  uint64_t v15;
  NSString *title;
  uint64_t v17;
  PHPhotoLibrary *photoLibrary;
  PXSurveyQuestionMemoryConfiguration *v19;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PXSurveyQuestionMemoryConfiguration;
  v14 = -[PXSurveyQuestionMemoryConfiguration init](&v21, sel_init);
  if (!v14)
    goto LABEL_4;
  v15 = objc_msgSend(v10, "copy");
  title = v14->_title;
  v14->_title = (NSString *)v15;

  objc_storeStrong((id *)&v14->_memory, a4);
  objc_storeStrong((id *)&v14->_songAdamId, a5);
  v14->_isStale = 0;
  objc_storeStrong((id *)&v14->_customKeyAssetIdentifier, a6);
  if (!v14->_customKeyAssetIdentifier)
    goto LABEL_4;
  -[PHMemory photoLibrary](v14->_memory, "photoLibrary");
  v17 = objc_claimAutoreleasedReturnValue();
  photoLibrary = v14->_photoLibrary;
  v14->_photoLibrary = (PHPhotoLibrary *)v17;

  if (!v14->_photoLibrary)
    v19 = 0;
  else
LABEL_4:
    v19 = v14;

  return v19;
}

- (PXSurveyQuestionMemoryConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionMemoryConfiguration.m"), 52, CFSTR("%s is not available as initializer"), "-[PXSurveyQuestionMemoryConfiguration init]");

  abort();
}

- (UIView)contentView
{
  PXMemoryView *memoryView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PXMemoryViewModel *v10;
  id v11;
  PXMemoryView *v12;
  PXMemoryView *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  memoryView = self->_memoryView;
  if (!memoryView)
  {
    +[PXMemoryInfo memoryInfoWithMemory:](PXMemoryInfo, "memoryInfoWithMemory:", self->_memory);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_customKeyAssetIdentifier)
    {
      -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0CD1390];
      v17[0] = self->_customKeyAssetIdentifier;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fetchAssetsWithUUIDs:options:", v7, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "memoryInfoWithUpdatedKeyAssetFetchResult:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v9;
    }
    v10 = objc_alloc_init(PXMemoryViewModel);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__PXSurveyQuestionMemoryConfiguration_contentView__block_invoke;
    v15[3] = &unk_1E5142090;
    v16 = v4;
    v11 = v4;
    -[PXMemoryViewModel performChanges:](v10, "performChanges:", v15);
    v12 = objc_alloc_init(PXMemoryView);
    v13 = self->_memoryView;
    self->_memoryView = v12;

    -[PXMemoryView setViewModel:](self->_memoryView, "setViewModel:", v10);
    -[PXMemoryView setPresentationDelegate:](self->_memoryView, "setPresentationDelegate:", self);

    memoryView = self->_memoryView;
  }
  return (UIView *)memoryView;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
  if (a3.size.height >= a3.size.width)
  {
    if (a3.size.height > a3.size.width)
    {
      a3.origin.y = a3.origin.y + (a3.size.height - a3.size.width) * 0.5 + 8.0;
      a3.size.height = a3.size.width;
    }
  }
  else
  {
    a3.origin.x = a3.origin.x + (a3.size.width - a3.size.height) * 0.5;
    a3.origin.y = a3.origin.y + 8.0;
    a3.size.width = a3.size.height;
  }
  -[PXMemoryView setFrame:](self->_memoryView, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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

- (BOOL)needsQuestionInvalidationForChange:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "changeDetailsForObject:", self->_memory);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "objectWasDeleted");

  return v4;
}

- (void)presentDetailsForMemoryView:(id)a3
{
  PXPhotosDetailsUIViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  +[PXPhotosDetailsContext photosDetailsContextForMemory:](PXPhotosDetailsContext, "photosDetailsContextForMemory:", self->_memory);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[PXPhotosDetailsUIViewController initWithContext:options:]([PXPhotosDetailsUIViewController alloc], "initWithContext:options:", v9, 0);
  -[PXSurveyQuestionMemoryConfiguration handlers](self, "handlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewControllerHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXSurveyQuestionMemoryConfiguration handlers](self, "handlers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewControllerHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, PXPhotosDetailsUIViewController *, PHMemory *))v8)[2](v8, v4, self->_memory);

  }
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

- (PHMemory)memory
{
  return self->_memory;
}

- (NSString)songAdamId
{
  return self->_songAdamId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songAdamId, 0);
  objc_storeStrong((id *)&self->_memory, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_customKeyAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_memoryView, 0);
}

void __50__PXSurveyQuestionMemoryConfiguration_contentView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v3, "localizedDateText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocalizedDateText:", v4);

  objc_msgSend(*(id *)(a1 + 32), "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocalizedTitle:", v5);

  objc_msgSend(*(id *)(a1 + 32), "keyAssetFetchResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setKeyAsset:", v7);

  objc_msgSend(v8, "setSpecSet:", 1);
}

@end
