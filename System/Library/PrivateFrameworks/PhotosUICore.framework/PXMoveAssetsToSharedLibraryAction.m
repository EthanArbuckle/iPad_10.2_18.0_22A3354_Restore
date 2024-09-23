@implementation PXMoveAssetsToSharedLibraryAction

- (PXMoveAssetsToSharedLibraryAction)initWithAssets:(id)a3
{
  id v4;
  PXMoveAssetsToSharedLibraryAction *v5;
  uint64_t v6;
  NSArray *suggestedAssets;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMoveAssetsToSharedLibraryAction;
  v5 = -[PXAssetsAction initWithAssets:](&v9, sel_initWithAssets_, v4);
  if (v5)
  {
    PXFilter();
    v6 = objc_claimAutoreleasedReturnValue();
    suggestedAssets = v5->_suggestedAssets;
    v5->_suggestedAssets = (NSArray *)v6;

  }
  return v5;
}

- (id)actionIdentifier
{
  return CFSTR("MoveAssetsToSharedLibrary");
}

- (id)localizedActionName
{
  return PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_Action_MoveToSharedLibrary"));
}

- (void)performAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXAssetsAction assets](self, "assets");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  PXSharedLibraryMoveAssetsToSharedLibrary(v5, v4);

}

- (void)performUndo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PXAssetsAction assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PXMoveAssetsToSharedLibraryAction_performUndo___block_invoke;
  v7[3] = &unk_1E5148348;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  PXSharedLibraryMoveAssetsToPersonalLibrary(v5, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAssets, 0);
}

void __49__PXMoveAssetsToSharedLibraryAction_performUndo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  if ((_DWORD)a2 && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count"))
  {
    PXSharedLibraryAddSharingSuggestions(*(void **)(*(_QWORD *)(a1 + 32) + 88), *(void **)(a1 + 40));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }

}

uint64_t __52__PXMoveAssetsToSharedLibraryAction_initWithAssets___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "fetchPropertySetsIfNeeded");
  objc_msgSend(v2, "libraryScopeProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "assetIsInPhotosSuggestedPreviewState");
  return v4;
}

@end
