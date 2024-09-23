@implementation PXPhotosAction

- (PXPhotosAction)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXPhotosAction *v6;
  PXPhotosAction *v7;
  uint64_t v8;
  PHFetchOptions *standardFetchOptions;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosAction;
  v6 = -[PXPhotosAction init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v8 = objc_claimAutoreleasedReturnValue();
    standardFetchOptions = v7->_standardFetchOptions;
    v7->_standardFetchOptions = (PHFetchOptions *)v8;

  }
  return v7;
}

- (PXPhotosAction)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosAction.m"), 28, CFSTR("%s is not available as initializer"), "-[PXPhotosAction init]");

  abort();
}

- (PXFastEnumeration)assets
{
  return (PXFastEnumeration *)MEMORY[0x1E0C9AA60];
}

- (int64_t)assetCount
{
  void *v2;
  int64_t v3;

  -[PXPhotosAction assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (PXFastEnumeration)collections
{
  return (PXFastEnumeration *)MEMORY[0x1E0C9AA60];
}

- (void)performChanges:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  os_signpost_id_t v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  PLUIActionsGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    -[PXAction actionIdentifier](self, "actionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v12;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PhotosAction", "Identifier=%{public}@", buf, 0xCu);

  }
  -[PXPhotosAction photoLibrary](self, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__PXPhotosAction_performChanges_completionHandler___block_invoke;
  v16[3] = &unk_1E5126120;
  v18 = v6;
  v19 = v9;
  v17 = v11;
  v14 = v6;
  v15 = v11;
  objc_msgSend(v13, "performChanges:completionHandler:", v7, v16);

}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PHFetchOptions)standardFetchOptions
{
  return self->_standardFetchOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardFetchOptions, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __51__PXPhotosAction_performChanges_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = *(id *)(a1 + 32);
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PhotosAction", ", v8, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
