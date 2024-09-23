@implementation PUAddToLastUsedAlbumActivity

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  objc_super v12;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "undoManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_undoManager, v10);

  v12.receiver = self;
  v12.super_class = (Class)PUAddToLastUsedAlbumActivity;
  LOBYTE(v5) = -[PXActivity _presentActivityOnViewController:animated:completion:](&v12, sel__presentActivityOnViewController_animated_completion_, v9, v5, v8);

  return v5;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BC78];
}

- (id)activityTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXActivity itemSourceController](self, "itemSourceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7B178], "commandTitleWithPhotoLibrary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_systemImageName
{
  return CFSTR("rectangle.badge.plus");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXActivity itemSourceController](self, "itemSourceController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7B178];
  objc_msgSend(v3, "appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetAssetCollectionInPhotoLibrary:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    LOBYTE(v6) = +[PUAddToAlbumActivity canPerformWithItemSourceController:](PUAddToAlbumActivity, "canPerformWithItemSourceController:", v3);

  return (char)v6;
}

- (void)performActivity
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  -[PXActivity itemSourceController](self, "itemSourceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_undoManager);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B178]), "initWithAssets:", v5);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "underlyingAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShouldSortAssetsByCreationDate:", 1);

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__PUAddToLastUsedAlbumActivity_performActivity__block_invoke;
    v10[3] = &unk_1E58AB060;
    v10[4] = self;
    objc_msgSend(v8, "executeWithUndoManager:completionHandler:", WeakRetained, v10);
  }
  else
  {
    -[UIActivity activityDidFinish:](self, "activityDidFinish:", 0);
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_undoManager);
}

uint64_t __47__PUAddToLastUsedAlbumActivity_performActivity__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", a2);
}

@end
