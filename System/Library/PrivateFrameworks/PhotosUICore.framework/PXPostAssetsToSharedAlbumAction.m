@implementation PXPostAssetsToSharedAlbumAction

- (id)presentationEnvironment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_firstKeyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXPresentationEnvironmentForSender(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PXPostAssetsToSharedAlbumAction)initWithSharedAlbum:(id)a3 assets:(id)a4 comment:(id)a5
{
  id v10;
  id v11;
  id v12;
  PXPostAssetsToSharedAlbumAction *v13;
  PXPostAssetsToSharedAlbumAction *v14;
  uint64_t v15;
  NSString *comment;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPostAssetsToSharedAlbumAction.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedAlbum"));

  }
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPostAssetsToSharedAlbumAction.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assets.count"));

  }
  v20.receiver = self;
  v20.super_class = (Class)PXPostAssetsToSharedAlbumAction;
  v13 = -[PXAssetsAction initWithAssets:](&v20, sel_initWithAssets_, v11);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sharedAlbum, a3);
    v15 = objc_msgSend(v12, "copy");
    comment = v14->_comment;
    v14->_comment = (NSString *)v15;

  }
  return v14;
}

- (id)actionIdentifier
{
  return CFSTR("PostAssetsToSharedAlbum");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXPostToSharedAlbumActionName");
}

- (void)performAction:(id)a3
{
  id v4;
  PHCloudSharedAlbum *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  PHCloudSharedAlbum *v12;
  _QWORD v13[4];
  PHCloudSharedAlbum *v14;
  PXPostAssetsToSharedAlbumAction *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_sharedAlbum;
  PLSharedAlbumsGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[PHCloudSharedAlbum uuid](v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "IPXSharedAlbumPostToAction: Posting assets to shared album with UUID=%{public}@", buf, 0xCu);

  }
  -[PXPostAssetsToSharedAlbumAction presentationEnvironment](self, "presentationEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetsAction assets](self, "assets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__PXPostAssetsToSharedAlbumAction_performAction___block_invoke;
  v13[3] = &unk_1E5125740;
  v14 = v5;
  v15 = self;
  v16 = v8;
  v17 = v4;
  v10 = v4;
  v11 = v8;
  v12 = v5;
  PXSharedAlbumsValidateSharedAlbumAddAssets(v12, v9, v11, v13);

}

- (void)performUndo:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  objc_msgSend(v4, "px_genericErrorWithDebugDescription:", CFSTR("No undo support for post actions"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_sharedAlbum, 0);
}

void __49__PXPostAssetsToSharedAlbumAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v7 = v3;
    PXSharedAlbumsDefaultAssetCreationOptionsForAssets(v3, 0, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PXSharedAlbumsPublishAssetsToSharedAlbum(*(void **)(a1 + 32), v7, *(void **)(*(_QWORD *)(a1 + 40) + 96), v5, *(void **)(a1 + 48), *(void **)(a1 + 56));

LABEL_5:
    v4 = v7;
    goto LABEL_6;
  }
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
  {
    v7 = 0;
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, 0, 0);
    goto LABEL_5;
  }
LABEL_6:

}

@end
