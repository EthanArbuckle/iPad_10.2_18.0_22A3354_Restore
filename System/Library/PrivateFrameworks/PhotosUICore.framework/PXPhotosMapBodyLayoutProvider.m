@implementation PXPhotosMapBodyLayoutProvider

- (PXPhotosMapBodyLayoutProvider)initWithViewModel:(id)a3 traitCollection:(id)a4 presentingViewController:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXPhotosMapBodyLayoutProvider *v12;
  PXPhotosMapBodyLayoutProvider *v13;
  PXPhotosMapSelectionHandler *v14;
  PXPhotosMapSelectionHandler *selectionHandler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXPhotosMapBodyLayoutProvider;
  v12 = -[PXPhotosMapBodyLayoutProvider init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_viewModel, a3);
    objc_storeWeak((id *)&v13->_presentingViewController, v11);
    v14 = -[PXPhotosMapSelectionHandler initWithViewModel:presentingViewController:]([PXPhotosMapSelectionHandler alloc], "initWithViewModel:presentingViewController:", v9, v11);
    selectionHandler = v13->_selectionHandler;
    v13->_selectionHandler = v14;

    objc_storeStrong((id *)&v13->_traitCollection, a4);
  }

  return v13;
}

- (PXPhotosMapBodyLayoutProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosMapBodyLayoutProvider.m"), 64, CFSTR("%s is not available as initializer"), "-[PXPhotosMapBodyLayoutProvider init]");

  abort();
}

- (id)createSectionBodyLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outWantsDecoration:(BOOL *)a7
{
  void *v9;
  PXPhotosMapLayout *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  PXPhotosMapLayout *v15;
  void *v16;
  _OWORD v18[2];

  -[PXPhotosMapBodyLayoutProvider _locationFromVisibleAnchorsInSectionedLayout:](self, "_locationFromVisibleAnchorsInSectionedLayout:", a3, a4, a5, a6, a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [PXPhotosMapLayout alloc];
  -[PXPhotosMapBodyLayoutProvider viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosMapBodyLayoutProvider traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosMapBodyLayoutProvider presentingViewController](self, "presentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_OWORD *)&a5->item;
  v18[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v18[1] = v14;
  v15 = -[PXPhotosMapLayout initWithViewModel:sectionIndexPath:traitCollection:presentingViewController:initialLocation:](v10, "initWithViewModel:sectionIndexPath:traitCollection:presentingViewController:initialLocation:", v11, v18, v12, v13, v9);

  -[PXPhotosMapBodyLayoutProvider selectionHandler](self, "selectionHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosMapLayout setSelectionDelegate:](v15, "setSelectionDelegate:", v16);

  return v15;
}

- (BOOL)shouldPreventFaultOutOfBodyLayout:(id)a3 inAssetSectionLayout:(id)a4
{
  return 0;
}

- (id)_locationFromVisibleAnchorsInSectionedLayout:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint8_t *v11;
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  if (!v3)
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Unexpected nil sectionedLayout", buf, 2u);
    }

  }
  +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableFocusMapLensOnAnchors");

  if (v6)
  {
    *(_QWORD *)buf = 0;
    v13 = buf;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__11544;
    v16 = __Block_byref_object_dispose__11545;
    v17 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78__PXPhotosMapBodyLayoutProvider__locationFromVisibleAnchorsInSectionedLayout___block_invoke;
    v9[3] = &unk_1E51291B0;
    v10 = v3;
    v11 = buf;
    objc_msgSend(v10, "enumerateVisibleAnchoringSpriteIndexesUsingBlock:", v9);
    v7 = *((id *)v13 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PXPhotosSectionBodyLayoutProviderInvalidationDelegate)invalidationDelegate
{
  return (PXPhotosSectionBodyLayoutProviderInvalidationDelegate *)objc_loadWeakRetained((id *)&self->invalidationDelegate);
}

- (void)setInvalidationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->invalidationDelegate, a3);
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (PXPhotosMapSelectionHandler)selectionHandler
{
  return self->_selectionHandler;
}

- (PXExtendedTraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_selectionHandler, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->invalidationDelegate);
}

void __78__PXPhotosMapBodyLayoutProvider__locationFromVisibleAnchorsInSectionedLayout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  objc_msgSend(*(id *)(a1 + 32), "objectReferenceForSpriteIndex:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v14;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v14;
    objc_msgSend(v8, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v8, "asset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "performSelector:", sel_location);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
    v7 = v14;
  }

}

@end
