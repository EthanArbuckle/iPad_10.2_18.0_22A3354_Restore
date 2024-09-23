@implementation _PUWallpaperSmartAlbumPreviewReloadRequest

- (_PUWallpaperSmartAlbumPreviewReloadRequest)initWithPhotoLibrary:(id)a3 shuffleConfiguration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PUWallpaperSmartAlbumPreviewReloadRequest *v11;
  uint64_t v12;
  id completion;
  uint64_t v14;
  PXWallpaperSmartAlbumDataSource *smartAlbumDataSource;
  void *v16;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_PUWallpaperSmartAlbumPreviewReloadRequest;
  v11 = -[_PUWallpaperSmartAlbumPreviewReloadRequest init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    completion = v11->_completion;
    v11->_completion = (id)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7BC08]), "initWithPhotoLibrary:changeObserver:centerMedia:", v8, v11, 0);
    smartAlbumDataSource = v11->_smartAlbumDataSource;
    v11->_smartAlbumDataSource = (PXWallpaperSmartAlbumDataSource *)v14;

    objc_msgSend(v9, "personLocalIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXWallpaperSmartAlbumDataSource setPeopleLocalIdentifiers:](v11->_smartAlbumDataSource, "setPeopleLocalIdentifiers:", v17);

    -[PXWallpaperSmartAlbumDataSource setSelectedTypes:](v11->_smartAlbumDataSource, "setSelectedTypes:", objc_msgSend(v9, "shuffleSmartAlbums"));
  }

  return v11;
}

- (void)passiveContentDataSourcePreviewAssetsDidChange:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __93___PUWallpaperSmartAlbumPreviewReloadRequest_passiveContentDataSourcePreviewAssetsDidChange___block_invoke;
  v3[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (PXWallpaperSmartAlbumDataSource)smartAlbumDataSource
{
  return self->_smartAlbumDataSource;
}

- (void)setSmartAlbumDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_smartAlbumDataSource, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_smartAlbumDataSource, 0);
}

@end
