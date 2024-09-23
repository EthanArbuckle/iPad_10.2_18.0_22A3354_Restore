@implementation PUMoveAssetsToSharedLibraryActivity

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  objc_super v12;

  v6 = a4;
  objc_storeStrong((id *)&self->_presenterViewController, a3);
  v9 = a3;
  v10 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PUMoveAssetsToSharedLibraryActivity;
  LOBYTE(v6) = -[PXActivity _presentActivityOnViewController:animated:completion:](&v12, sel__presentActivityOnViewController_animated_completion_, v9, v6, v10);

  return v6;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BDA8];
}

- (id)activityTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PXActivity itemSourceController](self, "itemSourceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D7B970];
  objc_msgSend(v4, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedLibraryStatusProviderWithPhotoLibrary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hasPreview");
  PXLocalizedSharedLibraryString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_systemImageName
{
  return CFSTR("person.2");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;

  -[PXActivity itemSourceController](self, "itemSourceController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPreparingIndividualItems");

  if (!v5)
    return 0;
  -[PXActivity itemSourceController](self, "itemSourceController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = PXSharedLibraryCanMoveAssetsToSharedLibrary();
  return (char)v6;
}

- (void)performActivity
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  void (**v25)(_QWORD);
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  id v29;
  SEL v30;
  _QWORD aBlock[6];

  -[PXActivity itemSourceController](self, "itemSourceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || !objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUMoveAssetsToSharedLibraryActivity.m"), 71, CFSTR("Expecting non-empty, non-zero assets in %@"), v20);

  }
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke;
  aBlock[3] = &unk_1E58AB060;
  aBlock[4] = self;
  v7 = _Block_copy(aBlock);
  v27[0] = v6;
  v27[1] = 3221225472;
  v27[2] = __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke_3;
  v27[3] = &unk_1E58A7F38;
  v27[4] = self;
  v8 = v5;
  v28 = v8;
  v30 = a2;
  v9 = v7;
  v29 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(v27);
  if (PXSharedLibraryShouldDisplayMoveToSharedLibraryConfirmation())
  {
    objc_msgSend(v8, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    PXSharedLibraryGetMoveToSharedLibraryConfirmationTitleAndMessage();
    v21 = 0;

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v21, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0DC3448];
    -[PUMoveAssetsToSharedLibraryActivity activityTitle](self, "activityTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke_149;
    v24[3] = &unk_1E58AB6C0;
    v25 = v10;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v15);

    v16 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke_2_152;
    v22[3] = &unk_1E58AB6C0;
    v23 = v9;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v18);

    -[UIViewController px_presentOverTopmostPresentedViewController:animated:completion:](self->_presenterViewController, "px_presentOverTopmostPresentedViewController:animated:completion:", v12, 1, 0);
  }
  else
  {
    v10[2](v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenterViewController, 0);
}

void __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", 1);
  }
  else
  {
    PXLocalizedSharedLibraryString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedSharedLibraryString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke_2;
    v9[3] = &unk_1E58A8DE8;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v8);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "px_presentOverTopmostPresentedViewController:animated:completion:", v5, 1, 0);
  }
}

uint64_t __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "itemSourceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = objc_msgSend(*(id *)(a1 + 40), "count");

  if (v4 != v5)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_error_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Number of original assets changed in %@!", (uint8_t *)&v10, 0xCu);

    }
  }
  PLSharedLibraryGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to move assets to shared library. Calling PXSharedLibraryMoveAssetsToSharedLibrary()", (uint8_t *)&v10, 2u);
  }

  return PXSharedLibraryMoveAssetsToSharedLibrary();
}

uint64_t __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke_149(uint64_t a1)
{
  PXSharedLibrarySetDidConfirmMoveToSharedLibrary();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke_2_152(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", 0);
}

@end
