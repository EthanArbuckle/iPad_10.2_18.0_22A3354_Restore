@implementation PUPlacesAlbumGadget

- (PUPlacesAlbumGadget)initWithCollection:(id)a3 albumGadgetDelegate:(id)a4
{
  id v7;
  PUPlacesAlbumGadget *v8;
  id v9;
  uint64_t v10;
  PXPlacesAlbumCoverProvider *placesAlbumCoverProvider;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *title;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_super v23;

  v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PUPlacesAlbumGadget;
  v8 = -[PUAlbumGadget initWithCollection:albumGadgetDelegate:](&v23, sel_initWithCollection_albumGadgetDelegate_, v7, a4);
  if (v8)
  {
    v9 = v7;
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:

        v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7B840]), "initWithDelegate:andPlacesCollection:", v8, v9);
        placesAlbumCoverProvider = v8->_placesAlbumCoverProvider;
        v8->_placesAlbumCoverProvider = (PXPlacesAlbumCoverProvider *)v10;

        -[PUAlbumGadget albumGadgetDelegate](v8, "albumGadgetDelegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "albumListCellContentViewHelperForAlbum:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "traitCollection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPlacesAlbumCoverProvider preloadCachedSnapshotForUserInterfaceStyle:](v8->_placesAlbumCoverProvider, "preloadCachedSnapshotForUserInterfaceStyle:", objc_msgSend(v14, "userInterfaceStyle"));
        -[PXPlacesAlbumCoverProvider preloadPlaceholderForTraitCollection:](v8->_placesAlbumCoverProvider, "preloadPlaceholderForTraitCollection:", v14);
        objc_msgSend(v14, "registerChangeObserver:context:", v8, PXExtendedTraitCollectionObservationContext);
        PULocalizedString(CFSTR("PLACES_ALBUM_TITLE"));
        v15 = objc_claimAutoreleasedReturnValue();
        title = v8->_title;
        v8->_title = (NSString *)v15;

        goto LABEL_5;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "px_descriptionForAssertionMessage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("PUPlacesAlbumGadget.m"), 36, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collection"), v20, v22);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("PUPlacesAlbumGadget.m"), 36, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collection"), v20);
    }

    goto LABEL_4;
  }
LABEL_5:

  return v8;
}

- (id)albumListCellContentView
{
  PUAlbumListCellContentView *albumListCellContentView;
  PUAlbumListCellContentView *v4;
  PUAlbumListCellContentView *v5;
  objc_super v7;

  albumListCellContentView = self->_albumListCellContentView;
  if (!albumListCellContentView)
  {
    v7.receiver = self;
    v7.super_class = (Class)PUPlacesAlbumGadget;
    -[PUAlbumGadget albumListCellContentView](&v7, sel_albumListCellContentView);
    v4 = (PUAlbumListCellContentView *)objc_claimAutoreleasedReturnValue();
    -[PUPlacesAlbumGadget _updateImageInContentView:animated:](self, "_updateImageInContentView:animated:", v4, 0);
    -[PUPlacesAlbumGadget _updateSubtitleInContentView:animated:](self, "_updateSubtitleInContentView:animated:", v4, 0);
    v5 = self->_albumListCellContentView;
    self->_albumListCellContentView = v4;

    albumListCellContentView = self->_albumListCellContentView;
  }
  return albumListCellContentView;
}

- (id)actionManager
{
  return 0;
}

- (void)placesSnapshotDidChange
{
  id v3;

  -[PUPlacesAlbumGadget albumListCellContentView](self, "albumListCellContentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPlacesAlbumGadget _updateImageInContentView:animated:](self, "_updateImageInContentView:animated:", v3, 1);

}

- (void)placesSnapshotCountDidChange
{
  id v3;

  -[PUPlacesAlbumGadget albumListCellContentView](self, "albumListCellContentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPlacesAlbumGadget _updateSubtitleInContentView:animated:](self, "_updateSubtitleInContentView:animated:", v3, 1);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PXExtendedTraitCollectionObservationContext == a5)
    -[PUPlacesAlbumGadget _extendedTraitCollectionDidChange:](self, "_extendedTraitCollectionDidChange:", a4);
}

- (void)_extendedTraitCollectionDidChange:(unint64_t)a3
{
  id v4;

  -[PUPlacesAlbumGadget albumListCellContentView](self, "albumListCellContentView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPlacesAlbumGadget _updateImageInContentView:animated:](self, "_updateImageInContentView:animated:", v4, 1);

}

- (void)_updateImageInContentView:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  -[PUAlbumGadget albumGadgetDelegate](self, "albumGadgetDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "albumListCellContentViewHelperForAlbum:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPlacesAlbumGadget placesAlbumCoverProvider](self, "placesAlbumCoverProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__PUPlacesAlbumGadget__updateImageInContentView_animated___block_invoke;
  v13[3] = &unk_1E58A6C70;
  v14 = v7;
  v15 = v5;
  v11 = v5;
  v12 = v7;
  objc_msgSend(v8, "requestPlacesAlbumCover:snapshotTraitCollection:completion:", v9, v10, v13);

}

- (void)_updateSubtitleInContentView:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v6 = a3;
  -[PUPlacesAlbumGadget placesAlbumCoverProvider](self, "placesAlbumCoverProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__PUPlacesAlbumGadget__updateSubtitleInContentView_animated___block_invoke;
  v9[3] = &unk_1E58A6CA0;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  objc_msgSend(v7, "requestAssetCountWithForcedRefresh:completion:", 1, v9);

}

- (id)title
{
  return self->_title;
}

- (PXPlacesAlbumCoverProvider)placesAlbumCoverProvider
{
  return self->_placesAlbumCoverProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placesAlbumCoverProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_albumListCellContentView, 0);
}

void __61__PUPlacesAlbumGadget__updateSubtitleInContentView_animated___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  px_dispatch_on_main_queue();

}

void __61__PUPlacesAlbumGadget__updateSubtitleInContentView_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;

  if (*(uint64_t *)(a1 + 40) <= 0)
  {
    v5 = CFSTR(" ");
    v4 = CFSTR(" ");
  }
  else
  {
    PLSharedCountFormatter();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringFromNumber:", v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "setSubtitle:animated:", v5, *(unsigned __int8 *)(a1 + 48));

}

void __58__PUPlacesAlbumGadget__updateImageInContentView_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v4 = v3;
  px_dispatch_on_main_queue();

}

uint64_t __58__PUPlacesAlbumGadget__updateImageInContentView_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reconfigureImageInAlbumListCellContentView:withImage:isPlaceholder:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

@end
