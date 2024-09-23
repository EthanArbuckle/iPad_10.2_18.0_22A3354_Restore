@implementation PUHorizontalAlbumListGadget

- (PUHorizontalAlbumListGadget)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUHorizontalAlbumListGadget.m"), 84, CFSTR("%s is not available as initializer"), "-[PUHorizontalAlbumListGadget init]");

  abort();
}

- (PUHorizontalAlbumListGadget)initWithAlbumsGadgetProvider:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  PUSingleHeightHorizontalAlbumListGadgetLayout *v9;
  PUHorizontalAlbumListGadget *v10;
  PUHorizontalAlbumListGadget *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0D7B230]);
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithProviders:", v7);

  v9 = -[PUHorizontalAlbumListGadgetLayout initWithHorizontalLayoutDelegate:showsHorizontalScrollIndicator:]([PUSingleHeightHorizontalAlbumListGadgetLayout alloc], "initWithHorizontalLayoutDelegate:showsHorizontalScrollIndicator:", v5, +[PUHorizontalAlbumListGadget _showsHorizontalScrollIndicator](PUHorizontalAlbumListGadget, "_showsHorizontalScrollIndicator"));
  -[PXGadgetCollectionViewLayout setScrollDirection:](v9, "setScrollDirection:", 1);
  v13.receiver = self;
  v13.super_class = (Class)PUHorizontalAlbumListGadget;
  v10 = -[PXHorizontalCollectionGadget initWithLayout:dataSourceManager:](&v13, sel_initWithLayout_dataSourceManager_, v9, v8);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_provider, a3);

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  PUPhotoPinchGestureRecognizer *v8;
  PUPhotoPinchGestureRecognizer *pinchGestureRecognizer;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUHorizontalAlbumListGadget;
  -[PXHorizontalCollectionGadget viewDidLoad](&v13, sel_viewDidLoad);
  -[PUHorizontalAlbumListGadget px_enableExtendedTraitCollection](self, "px_enableExtendedTraitCollection");
  -[PUHorizontalAlbumListGadget collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 0);

  -[PUHorizontalAlbumListGadget collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpringLoaded:", 1);

  v5 = +[PUHorizontalAlbumListGadget _showsHorizontalScrollIndicator](PUHorizontalAlbumListGadget, "_showsHorizontalScrollIndicator");
  -[PUHorizontalAlbumListGadget collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowsHorizontalScrollIndicator:", v5);

  -[PUHorizontalAlbumListGadget albumListViewControllerSpec](self, "albumListViewControllerSpec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v7, "usesStackTransitionToGrid");

  if ((_DWORD)v6)
  {
    v8 = -[PUPhotoPinchGestureRecognizer initWithTarget:action:]([PUPhotoPinchGestureRecognizer alloc], "initWithTarget:action:", self, sel__handlePinch_);
    pinchGestureRecognizer = self->_pinchGestureRecognizer;
    self->_pinchGestureRecognizer = v8;

    -[PUHorizontalAlbumListGadget view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGestureRecognizer:", self->_pinchGestureRecognizer);

  }
  -[PUHorizontalAlbumListGadget _updateCollectionViewLayout](self, "_updateCollectionViewLayout");
  -[PUHorizontalAlbumListGadget sessionInfo](self, "sessionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "hasClearBackgroundColor") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUHorizontalAlbumListGadget setBackgroundColor:](self, "setBackgroundColor:", v12);

}

- (PUAlbumListViewControllerSpec)albumListViewControllerSpec
{
  void *v2;
  void *v3;

  -[PUHorizontalAlbumListGadget px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PULegacyViewControllerSpec specForIdiom:](PUAlbumListViewControllerSpec, "specForIdiom:", objc_msgSend(v2, "userInterfaceIdiom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PUAlbumListViewControllerSpec *)v3;
}

- (BOOL)canNavigateToCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;

  v4 = a3;
  -[PUHorizontalAlbumListGadget provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "collectionsFetchResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_rootCollectionList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_msgSend(v7, "isEqual:", v4) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v5, "gadgetForCollection:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11 != 0;

  }
  return v10;
}

- (void)navigateToCollection:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[PUHorizontalAlbumListGadget _navigateToCollection:animated:interactive:completion:](self, "_navigateToCollection:animated:interactive:completion:", a3, a4, 0, a5);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v6 = a3;
  -[PUHorizontalAlbumListGadget provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "albumListType");

  if (v8 == 6)
  {
    -[PUHorizontalAlbumListGadget sessionInfo](self, "sessionInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUHorizontalAlbumListGadget provider](self, "provider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gadgetForIndexPath:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    objc_msgSend(v9, "setTargetAlbum:", v13);
    objc_msgSend(v9, "setStatus:", 1);

  }
  else
  {
    -[PUHorizontalAlbumListGadget provider](self, "provider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "gadgetForIndexPath:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUHorizontalAlbumListGadget _navigateToCollection:animated:interactive:completion:](self, "_navigateToCollection:animated:interactive:completion:", v9, 1, 0, 0);
  }

  objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v16, 0);
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v7 = a5;
  v8 = a4;
  -[PUHorizontalAlbumListGadget provider](self, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "gadgetForIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "collection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7B328], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v12, "springLoadingEnabled");

  if ((_DWORD)v10 && objc_msgSend(v11, "px_allowsSpringLoading"))
  {
    -[PUHorizontalAlbumListGadget provider](self, "provider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "gadgetForCollection:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "albumListCellContentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "springLoadingTargetView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTargetView:", v16);

    v17 = 1;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  -[PUHorizontalAlbumListGadget provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "destinationIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gadgetForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v8)
  {
    v9 = (void *)MEMORY[0x1E0D7B6D0];
    v10 = v8;
    objc_msgSend(v13, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dropAssetsActionPerformerForAssetCollection:dropSession:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setDelegate:", self);
    objc_msgSend(v12, "performActionWithCompletionHandler:", 0);

  }
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  -[PUHorizontalAlbumListGadget presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
  return 1;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  -[PUHorizontalAlbumListGadget dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, a5);
  return 1;
}

- (unint64_t)gadgetType
{
  return 11;
}

- (unint64_t)gadgetCapabilities
{
  return 0;
}

- (unint64_t)accessoryButtonType
{
  void *v2;
  unint64_t v3;

  -[PUHorizontalAlbumListGadget provider](self, "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowSeeAllAccessoryButton");

  return v3;
}

- (id)accessoryButtonTitle
{
  void *v2;
  void *v3;

  -[PUHorizontalAlbumListGadget provider](self, "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "seeAllAccessoryButtonTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateCollectionHeight
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__PUHorizontalAlbumListGadget__updateCollectionHeight__block_invoke;
  v2[3] = &unk_1E58ABD10;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

- (id)targetPreviewViewForLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PUHorizontalAlbumListGadget gadgetAtLocation:inCoordinateSpace:](self, "gadgetAtLocation:inCoordinateSpace:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "targetPreviewViewForLocation:inCoordinateSpace:", v7, x, y);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)previewViewControllerAtLocation:(CGPoint)a3 fromSourceView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PUHorizontalAlbumListGadget gadgetAtLocation:inCoordinateSpace:](self, "gadgetAtLocation:inCoordinateSpace:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D7B498]);
    objc_msgSend(v9, "setGadget:", v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "previewViewControllerAtLocation:fromSourceView:", v7, x, y);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  -[PUHorizontalAlbumListGadget setPreviewOrbContext:](self, "setPreviewOrbContext:", v9);

  return v10;
}

- (id)previewParametersForTargetPreviewView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUHorizontalAlbumListGadget previewContextGadget](self, "previewContextGadget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "previewParametersForTargetPreviewView:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)contextMenuWithSuggestedActions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;

  v4 = a3;
  -[PUHorizontalAlbumListGadget previewContextGadget](self, "previewContextGadget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUHorizontalAlbumListGadget sessionInfo](self, "sessionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isForAssetPicker");

  -[PUHorizontalAlbumListGadget sessionInfo](self, "sessionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isLimitedLibraryPicker");

  v10 = 0;
  if ((v7 & 1) == 0 && (v9 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "contextMenuWithSuggestedActions:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)commitPreviewViewController:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[PUHorizontalAlbumListGadget previewContextGadget](self, "previewContextGadget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
    v6 = v5;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_6:
        objc_msgSend(v6, "collection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUHorizontalAlbumListGadget _navigateToCollection:animated:interactive:completion:](self, "_navigateToCollection:animated:interactive:completion:", v7, 1, 0, 0);
        goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "px_descriptionForAssertionMessage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUHorizontalAlbumListGadget.m"), 292, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("gadget"), v10, v12);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUHorizontalAlbumListGadget.m"), 292, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("gadget"), v10);
    }

    goto LABEL_6;
  }
  objc_msgSend(v5, "commitPreviewViewController:", v13);
LABEL_7:

}

- (id)previewContextGadget
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[PUHorizontalAlbumListGadget previewOrbContext](self, "previewOrbContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUHorizontalAlbumListGadget.m"), 298, CFSTR("previewOrbContext cannot be nil"));

  }
  -[PUHorizontalAlbumListGadget previewOrbContext](self, "previewOrbContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gadget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[PUHorizontalAlbumListGadget previewContextGadget](self, "previewContextGadget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "didDismissPreviewViewController:committing:", v7, v4);

}

- (void)didDismissPreviewWithPreviewView:(id)a3 committing:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[PUHorizontalAlbumListGadget previewContextGadget](self, "previewContextGadget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "didDismissPreviewWithPreviewView:committing:", v7, v4);

}

- (void)commitPreviewView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PUHorizontalAlbumListGadget previewContextGadget](self, "previewContextGadget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "commitPreviewView:", v5);

}

- (void)gadget:(id)a3 didChange:(unint64_t)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUHorizontalAlbumListGadget;
  -[PXHorizontalCollectionGadget gadget:didChange:](&v6, sel_gadget_didChange_, a3);
  if (a4 == 64)
    -[PUHorizontalAlbumListGadget _updateCollectionHeight](self, "_updateCollectionHeight");
}

- (void)stackedAlbumTransition:(id)a3 setVisibility:(BOOL)a4 forCollection:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUHorizontalAlbumListGadget.m"), 337, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (id)stackedAlbumTransition:(id)a3 layoutForCollection:(id)a4 forCollectionView:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUHorizontalAlbumListGadget.m"), 341, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (void)stackedAlbumTransition:(id)a3 setVisibility:(BOOL)a4 forPHCollection:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v7 = a5;
  -[PUHorizontalAlbumListGadget provider](self, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gadgetForCollection:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v10, "setIndexesOfHiddenStackItems:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIndexesOfHiddenStackItems:", v9);

  }
}

- (id)stackedAlbumTransition:(id)a3 layoutForPHCollection:(id)a4 forCollectionView:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PUStackedAlbumLayout *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  PUAlbumListTransitionContext *v21;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PUHorizontalAlbumListGadget provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "gadgetForCollection:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "estimatedIndexInCollection:ofAssetForStackItemAtIndex:", v6, 0);
  v10 = 0;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v9;
    -[PXHorizontalCollectionGadget delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "gadgetViewControllerHostingGadget:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0DC3628];
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "layoutAttributesForCellWithIndexPath:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "rectForStackItemAtIndex:inCoordinateSpace:", 0, v14);
      -[NSObject setFrame:](v17, "setFrame:");
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[NSObject copy](v17, "copy");
      objc_msgSend(v19, "setIndexPath:", v18);
      objc_msgSend(v19, "setZIndex:", objc_msgSend(v19, "zIndex") + 1);
      v10 = objc_alloc_init(PUStackedAlbumLayout);
      -[PUStackedAlbumLayout setReferenceItemLayoutAttributes:](v10, "setReferenceItemLayoutAttributes:", v17);
      v23 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUStackedAlbumLayout setVisibleStackedItemLayoutAttributes:](v10, "setVisibleStackedItemLayoutAttributes:", v20);

      objc_msgSend(v19, "frame");
      PXRectGetCenter();
      -[PUStackedAlbumLayout setReferenceCenter:](v10, "setReferenceCenter:");
      v21 = objc_alloc_init(PUAlbumListTransitionContext);
      -[PUAlbumListTransitionContext setPhCollection:](v21, "setPhCollection:", v6);
      -[PUAlbumListTransitionContext setKeyItemIndexPath:](v21, "setKeyItemIndexPath:", v18);
      -[PUStackedAlbumLayout setAlbumListTransitionContext:](v10, "setAlbumListTransitionContext:", v21);

    }
    else
    {
      PLUIGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v6;
        _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_ERROR, "Couldn't find coordinate space for stacked album transition into collection %@. Failing gracefully.", buf, 0xCu);
      }
      v10 = 0;
    }

  }
  return v10;
}

- (void)_handlePinch:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[PUHorizontalAlbumListGadget navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pu_currentInteractiveTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v5)
  {
    objc_msgSend(v5, "updateInteractiveTransitionWithPhotoPinchGestureRecognizer:", v12);
  }
  else if (objc_msgSend(v12, "state") == 2)
  {
    objc_msgSend(v12, "velocity");
    if (v6 > 0.0)
    {
      -[PUHorizontalAlbumListGadget collectionView](self, "collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "locationInView:", v7);
      objc_msgSend(v7, "indexPathForItemAtPoint:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[PUHorizontalAlbumListGadget provider](self, "provider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "gadgetForIndexPath:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "collection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[PUHorizontalAlbumListGadget _canUseStackedAlbumTransitionToNavigationToCollection:](self, "_canUseStackedAlbumTransitionToNavigationToCollection:", v11))
        {
          -[PUHorizontalAlbumListGadget _navigateToCollection:animated:interactive:completion:](self, "_navigateToCollection:animated:interactive:completion:", v11, 1, 1, 0);
        }

      }
    }
  }

}

- (BOOL)_canUseStackedAlbumTransitionToNavigationToCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[PUHorizontalAlbumListGadget provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v4);

  if ((v8 & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = 0;
  }
  else
  {
    -[PUHorizontalAlbumListGadget provider](self, "provider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gadgetForCollection:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v11, "estimatedIndexInCollection:ofAssetForStackItemAtIndex:", v4, 0) != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (void)_navigateToCollection:(id)a3 animated:(BOOL)a4 interactive:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  void (**v11)(id, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PUAlbumNavigationHelperParams *v22;
  id v23;
  PUAlbumNavigationHelperParams *v24;
  id v25;
  id v26;
  PUAlbumNavigationHelperParams *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PUAlbumListViewController *v32;
  id v33;
  void *v34;
  void *v35;
  PUAlbumListViewController *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  void (**v49)(id, _QWORD);
  id v50;
  char v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  PUStackedAlbumTransition *v56;
  char v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  _QWORD *v65;
  void (**v66)(id, _QWORD);
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  objc_class *v74;
  void *v75;
  objc_class *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  objc_class *v81;
  void *v82;
  objc_class *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void (**v89)(id, _QWORD);
  id v90;
  id v91;
  BOOL v92;
  _BOOL4 v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  _QWORD v98[4];
  id v99;
  PUHorizontalAlbumListGadget *v100;
  _QWORD v101[4];
  id v102;
  _QWORD v103[5];
  _QWORD v104[5];
  _QWORD v105[5];
  PUAlbumListViewController *v106;
  void (**v107)(id, _QWORD);
  BOOL v108;
  uint64_t v109;
  _QWORD v110[3];

  v7 = a5;
  v110[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, _QWORD))a6;
  -[PUHorizontalAlbumListGadget provider](self, "provider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUHorizontalAlbumListGadget canNavigateToCollection:](self, "canNavigateToCollection:", v10))
  {
    v92 = a4;
    -[PUHorizontalAlbumListGadget albumListViewControllerSpec](self, "albumListViewControllerSpec");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataSourceManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUHorizontalAlbumListGadget px_gridPresentation](self, "px_gridPresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUHorizontalAlbumListGadget sessionInfo](self, "sessionInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    v18 = v14;
    v19 = v15;
    v20 = v16;
    v21 = v13;
    v95 = v19;
    v96 = v17;
    v93 = v7;
    v94 = v18;
    if (objc_msgSend(v17, "px_isFolder"))
    {
      v85 = v12;
      v22 = objc_alloc_init(PUAlbumNavigationHelperParams);
      v23 = v18;
      v24 = v22;
      -[PUAlbumNavigationHelperParams setDataSourceManager:](v22, "setDataSourceManager:", v23);
      v25 = v20;
      -[PUAlbumNavigationHelperParams setSessionInfo:](v24, "setSessionInfo:", v20);
      v88 = v21;
      -[PUAlbumNavigationHelperParams setSpec:](v24, "setSpec:", v21);
      -[PUAlbumNavigationHelperParams setGridPresentation:](v24, "setGridPresentation:", v19);
      v26 = v17;
      v27 = v24;
      if (objc_msgSend(v26, "px_isTopLevelFolder"))
      {
        -[PUAlbumNavigationHelperParams spec](v27, "spec");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "standInAlbumListViewControllerSpec");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUAlbumNavigationHelperParams sessionInfo](v27, "sessionInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "photoLibrary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = +[PUAlbumListViewController newMyAlbumsViewControllerWithSpec:sessionInfo:photoLibrary:](PUAlbumListViewController, "newMyAlbumsViewControllerWithSpec:sessionInfo:photoLibrary:", v29, v30, v31);

      }
      else
      {
        v33 = v26;
        -[PUAlbumNavigationHelperParams spec](v27, "spec");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "standInAlbumListViewControllerSpec");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = [PUAlbumListViewController alloc];
        objc_msgSend(v33, "photoLibrary");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[PUAlbumListViewController initWithSpec:photoLibrary:](v36, "initWithSpec:photoLibrary:", v35, v37);

        -[PUAlbumListViewController setCollection:](v32, "setCollection:", v33);
        -[PUAlbumNavigationHelperParams sessionInfo](v27, "sessionInfo");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUAlbumListViewController setSessionInfo:](v32, "setSessionInfo:", v38);
        -[PUAlbumListViewController setCanShowAggregateItem:](v32, "setCanShowAggregateItem:", 1);
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B710]), "initWithCollectionList:", v33);
        -[PUAlbumListViewController setDataSourceManagerConfiguration:](v32, "setDataSourceManagerConfiguration:", v29);
      }

      -[PUAlbumListViewController navigationItem](v32, "navigationItem");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "px_setPreferredLargeTitleDisplayMode:", 2);

      v12 = v85;
      v21 = v88;
      v17 = v96;
      v20 = v25;
LABEL_21:

      if (!v32)
      {
        if (v11)
          v11[2](v11, 0);
        goto LABEL_50;
      }
      v47 = *MEMORY[0x1E0D72798];
      v48 = objc_msgSend(v12, "albumListType");
      v49 = v11;
      if (v48 > 6)
      {
        v50 = v10;
        v52 = 0;
        v51 = 1;
      }
      else
      {
        v50 = v10;
        if (((1 << v48) & 0x39) != 0)
        {
          v51 = 0;
          v52 = CFSTR("com.apple.photos.CPAnalytics.otherGadgetAlbumSelected");
        }
        else
        {
          v51 = 0;
          if (((1 << v48) & 0x42) != 0)
          {
            v47 = *MEMORY[0x1E0D72790];
            v52 = CFSTR("com.apple.photos.CPAnalytics.myAlbumsGadgetAlbumSelected");
          }
          else
          {
            v47 = *MEMORY[0x1E0D72A20];
            v52 = CFSTR("com.apple.photos.CPAnalytics.sharedAlbumsGadgetAlbumSelected");
          }
        }
      }
      +[PUAggregateDictionaryTracer sharedTracer](PUAggregateDictionaryTracer, "sharedTracer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "userStartedViewingCollection:withListViewItemSelectionTrackerKey:", v96, v47);

      if ((v51 & 1) == 0)
      {
        v54 = (void *)MEMORY[0x1E0D09910];
        v109 = *MEMORY[0x1E0D09818];
        v110[0] = v96;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, &v109, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "sendEvent:withPayload:", v52, v55);

      }
      if (objc_msgSend(v21, "usesStackTransitionToGrid"))
      {
        v10 = v50;
        if (!-[PUHorizontalAlbumListGadget _canUseStackedAlbumTransitionToNavigationToCollection:](self, "_canUseStackedAlbumTransitionToNavigationToCollection:", v96))
        {
          v58 = v12;
          v56 = 0;
          goto LABEL_41;
        }
        v11 = v49;
        if (!-[PUAlbumListViewController conformsToProtocol:](v32, "conformsToProtocol:", &unk_1EEC31120))
        {
          v58 = v12;
          v56 = 0;
          goto LABEL_42;
        }
        v56 = objc_alloc_init(PUStackedAlbumTransition);
        -[PUStackedAlbumTransition ph_setPhotoCollection:](v56, "ph_setPhotoCollection:", v96);
        -[PUStackedAlbumTransition setDelegate:](v56, "setDelegate:", self);
        v57 = v93;
        if (!v93)
        {
          v58 = v12;
LABEL_43:
          v61 = MEMORY[0x1E0C809B0];
          v105[0] = MEMORY[0x1E0C809B0];
          v105[1] = 3221225472;
          v105[2] = __85__PUHorizontalAlbumListGadget__navigateToCollection_animated_interactive_completion___block_invoke;
          v105[3] = &unk_1E58A4C18;
          v105[4] = self;
          v106 = v32;
          v108 = v92;
          v107 = v11;
          PUPerformWithNavigationTransition(v56, v57, v105);
          if (objc_msgSend(MEMORY[0x1E0CA5920], "px_allowsDonationsForCurrentProcess"))
          {
            if (objc_msgSend(v96, "px_isPeopleVirtualCollection"))
            {
              v62 = (void *)MEMORY[0x1E0CA5920];
              v104[0] = v61;
              v104[1] = 3221225472;
              v104[2] = __85__PUHorizontalAlbumListGadget__navigateToCollection_animated_interactive_completion___block_invoke_4;
              v104[3] = &unk_1E589FCE8;
              v104[4] = self;
              v63 = CFSTR("com.apple.mobileslideshow.people");
              v64 = &__block_literal_global_33068;
              v65 = v104;
            }
            else
            {
              if (!objc_msgSend(v96, "px_isPlacesSmartAlbum"))
              {
                if ((objc_msgSend(v96, "px_isFolder") & 1) == 0)
                {
                  v66 = v11;
                  v67 = v10;
                  v68 = v21;
                  v69 = v96;
                  v70 = objc_msgSend(v69, "assetCollectionSubtype");
                  if (v70 != 205 && v70 != 1000000201)
                  {
                    objc_msgSend(v69, "localizedTitle");
                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v97, "length"))
                    {
                      v71 = (void *)MEMORY[0x1E0CA5920];
                      v101[0] = v61;
                      v101[1] = 3221225472;
                      v101[2] = __85__PUHorizontalAlbumListGadget__navigateToCollection_animated_interactive_completion___block_invoke_7;
                      v101[3] = &unk_1E589FD30;
                      v102 = v97;
                      v98[0] = v61;
                      v98[1] = 3221225472;
                      v98[2] = __85__PUHorizontalAlbumListGadget__navigateToCollection_animated_interactive_completion___block_invoke_8;
                      v98[3] = &unk_1E589FD58;
                      v99 = v69;
                      v100 = self;
                      objc_msgSend(v71, "px_requestActivityWithActivityType:titleProvider:completionBlock:", CFSTR("com.apple.mobileslideshow.album"), v101, v98);

                    }
                  }

                  v21 = v68;
                  v10 = v67;
                  v11 = v66;
                }
                goto LABEL_49;
              }
              v62 = (void *)MEMORY[0x1E0CA5920];
              v103[0] = v61;
              v103[1] = 3221225472;
              v103[2] = __85__PUHorizontalAlbumListGadget__navigateToCollection_animated_interactive_completion___block_invoke_6;
              v103[3] = &unk_1E589FCE8;
              v103[4] = self;
              v63 = CFSTR("com.apple.mobileslideshow.places");
              v64 = &__block_literal_global_257;
              v65 = v103;
            }
            objc_msgSend(v62, "px_requestActivityWithActivityType:titleProvider:completionBlock:", v63, v64, v65);
          }
LABEL_49:

          v12 = v58;
LABEL_50:

          goto LABEL_51;
        }
        v58 = v12;
        -[PUHorizontalAlbumListGadget pinchGestureRecognizer](self, "pinchGestureRecognizer");
        v49 = v11;
        v50 = v10;
        v59 = v21;
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUStackedAlbumTransition startInteractiveTransitionWithPhotoPinchGestureRecognizer:isExpanding:](v56, "startInteractiveTransitionWithPhotoPinchGestureRecognizer:isExpanding:", v60, 1);

        v21 = v59;
      }
      else
      {
        v58 = v12;
        v56 = 0;
      }
      v10 = v50;
LABEL_41:
      v11 = v49;
LABEL_42:
      v57 = v93;
      goto LABEL_43;
    }
    if (objc_msgSend(v17, "px_isPlacesSmartAlbum"))
    {
      v86 = v20;
      v27 = (PUAlbumNavigationHelperParams *)v17;
      if (v27)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_10:
          objc_msgSend(v95, "createPlacesViewControllerForAssetCollection:", v27);
          v32 = (PUAlbumListViewController *)objc_claimAutoreleasedReturnValue();
          v20 = v86;
          goto LABEL_21;
        }
        v90 = v21;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIViewController * _Nonnull PUCreateViewControllerFromCollection(PHCollection * _Nonnull __strong, PXPhotoKitCollectionsDataSourceManager * _Nonnull __strong, id<PXGridPresentation>  _Nonnull __strong, PUSessionInfo * _Nullable __strong, PUAlbumListViewControllerSpec * _Nonnull __strong)");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = (objc_class *)objc_opt_class();
        NSStringFromClass(v76);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUAlbumNavigationHelperParams px_descriptionForAssertionMessage](v27, "px_descriptionForAssertionMessage");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "handleFailureInFunction:file:lineNumber:description:", v73, CFSTR("PUAlbumNavigationHelper.m"), 70, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collection"), v75, v77);

      }
      else
      {
        v90 = v21;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIViewController * _Nonnull PUCreateViewControllerFromCollection(PHCollection * _Nonnull __strong, PXPhotoKitCollectionsDataSourceManager * _Nonnull __strong, id<PXGridPresentation>  _Nonnull __strong, PUSessionInfo * _Nullable __strong, PUAlbumListViewControllerSpec * _Nonnull __strong)");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (objc_class *)objc_opt_class();
        NSStringFromClass(v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "handleFailureInFunction:file:lineNumber:description:", v73, CFSTR("PUAlbumNavigationHelper.m"), 70, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collection"), v75);
      }

      v21 = v90;
      v17 = v96;
      goto LABEL_10;
    }
    if (objc_msgSend(v17, "px_isPeopleVirtualCollection"))
    {
      objc_msgSend(MEMORY[0x1E0D7B668], "sharedInstance");
      v27 = (PUAlbumNavigationHelperParams *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumNavigationHelperParams peopleViewController](v27, "peopleViewController");
      v40 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    v87 = v20;
    v27 = (PUAlbumNavigationHelperParams *)v17;
    if (v27)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_17:
        v20 = v87;
        if (!objc_msgSend(v87, "isForAssetPicker"))
        {
          objc_msgSend(v18, "assetsFetchResultForCollection:fetchIfNeeded:", v27, 0);
          v89 = v11;
          v41 = v10;
          v42 = v21;
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "keyAssetsFetchResultForCollection:", v27);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          PXPhotosViewConfigurationForAssetCollectionWithExistingAssetsFetchResult();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D7CD28], "defaultManager");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setLoadingStatusManager:", v46);

          objc_msgSend(v45, "setOneUpPresentationOrigin:", PXOneUpPresentationOriginForAssetCollection());
          v32 = (PUAlbumListViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B810]), "initWithConfiguration:", v45);

          v20 = v87;
          v17 = v96;

          v21 = v42;
          v10 = v41;
          v11 = v89;
          goto LABEL_21;
        }
        objc_msgSend(v95, "createAssetPickerPhotosAlbumViewControllerForAlbum:", v27);
        v40 = objc_claimAutoreleasedReturnValue();
LABEL_19:
        v32 = (PUAlbumListViewController *)v40;
        goto LABEL_21;
      }
      v78 = v18;
      v91 = v21;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIViewController * _Nonnull PUCreateViewControllerFromCollection(PHCollection * _Nonnull __strong, PXPhotoKitCollectionsDataSourceManager * _Nonnull __strong, id<PXGridPresentation>  _Nonnull __strong, PUSessionInfo * _Nullable __strong, PUAlbumListViewControllerSpec * _Nonnull __strong)");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = (objc_class *)objc_opt_class();
      NSStringFromClass(v83);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumNavigationHelperParams px_descriptionForAssertionMessage](v27, "px_descriptionForAssertionMessage");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "handleFailureInFunction:file:lineNumber:description:", v80, CFSTR("PUAlbumNavigationHelper.m"), 75, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collection"), v82, v84);

    }
    else
    {
      v78 = v18;
      v91 = v21;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIViewController * _Nonnull PUCreateViewControllerFromCollection(PHCollection * _Nonnull __strong, PXPhotoKitCollectionsDataSourceManager * _Nonnull __strong, id<PXGridPresentation>  _Nonnull __strong, PUSessionInfo * _Nullable __strong, PUAlbumListViewControllerSpec * _Nonnull __strong)");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = (objc_class *)objc_opt_class();
      NSStringFromClass(v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "handleFailureInFunction:file:lineNumber:description:", v80, CFSTR("PUAlbumNavigationHelper.m"), 75, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collection"), v82);
    }

    v21 = v91;
    v17 = v96;
    v18 = v78;
    goto LABEL_17;
  }
  if (v11)
    v11[2](v11, 0);
LABEL_51:

}

- (void)setGadgetSpec:(id)a3
{
  id v4;
  void *v5;
  uint64_t ShouldUseSingleHeightLayoutForGadgetSpec;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUHorizontalAlbumListGadget;
  v4 = a3;
  -[PXHorizontalCollectionGadget setGadgetSpec:](&v7, sel_setGadgetSpec_, v4);
  -[PUHorizontalAlbumListGadget provider](self, "provider", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ShouldUseSingleHeightLayoutForGadgetSpec = _ShouldUseSingleHeightLayoutForGadgetSpec(v4, objc_msgSend(v5, "albumListType"));

  if ((_DWORD)ShouldUseSingleHeightLayoutForGadgetSpec != -[PUHorizontalAlbumListGadget shouldUseSingleHeightLayout](self, "shouldUseSingleHeightLayout"))
  {
    -[PUHorizontalAlbumListGadget setShouldUseSingleHeightLayout:](self, "setShouldUseSingleHeightLayout:", ShouldUseSingleHeightLayoutForGadgetSpec);
    -[PUHorizontalAlbumListGadget _updateCollectionViewLayout](self, "_updateCollectionViewLayout");
  }
}

- (void)_updateCollectionViewLayout
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int ShouldUseSingleHeightLayoutForGadgetSpec;
  __objc2_class *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  -[PUHorizontalAlbumListGadget provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "albumListType") == 1)
  {

  }
  else
  {
    -[PUHorizontalAlbumListGadget provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "albumListType");

    if (v5 != 6)
      return;
  }
  -[PUHorizontalAlbumListGadget layout](self, "layout");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PXHorizontalCollectionGadget gadgetSpec](self, "gadgetSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUHorizontalAlbumListGadget provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ShouldUseSingleHeightLayoutForGadgetSpec = _ShouldUseSingleHeightLayoutForGadgetSpec(v6, objc_msgSend(v7, "albumListType"));

  if (ShouldUseSingleHeightLayoutForGadgetSpec)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = PUSingleHeightHorizontalAlbumListGadgetLayout;
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = PUDoubleHeightHorizontalAlbumListGadgetLayout;
LABEL_9:
      v10 = [v9 alloc];
      -[PUHorizontalAlbumListGadget provider](self, "provider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithHorizontalLayoutDelegate:showsHorizontalScrollIndicator:", v11, +[PUHorizontalAlbumListGadget _showsHorizontalScrollIndicator](PUHorizontalAlbumListGadget, "_showsHorizontalScrollIndicator"));

      if (v12)
      {
        objc_msgSend(v12, "setScrollDirection:", 1);
        -[PXHorizontalCollectionGadget setLayout:](self, "setLayout:", v12);
        -[PUHorizontalAlbumListGadget _updateCollectionHeight](self, "_updateCollectionHeight");

      }
    }
  }

}

- (PUAlbumsGadgetProvider)provider
{
  return self->_provider;
}

- (PUSessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (void)setSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInfo, a3);
}

- (PUPhotoPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (NSUserActivity)siriActionActivity
{
  return self->_siriActionActivity;
}

- (void)setSiriActionActivity:(id)a3
{
  objc_storeStrong((id *)&self->_siriActionActivity, a3);
}

- (BOOL)shouldUseSingleHeightLayout
{
  return self->_shouldUseSingleHeightLayout;
}

- (void)setShouldUseSingleHeightLayout:(BOOL)a3
{
  self->_shouldUseSingleHeightLayout = a3;
}

- (PXGadgetOrbContext)previewOrbContext
{
  return self->_previewOrbContext;
}

- (void)setPreviewOrbContext:(id)a3
{
  objc_storeStrong((id *)&self->_previewOrbContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewOrbContext, 0);
  objc_storeStrong((id *)&self->_siriActionActivity, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

void __85__PUHorizontalAlbumListGadget__navigateToCollection_animated_interactive_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__PUHorizontalAlbumListGadget__navigateToCollection_animated_interactive_completion___block_invoke_2;
  v5[3] = &unk_1E58AB968;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "gadget:transitionToViewController:animated:completion:", v2, v3, v4, v5);

}

void __85__PUHorizontalAlbumListGadget__navigateToCollection_animated_interactive_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setEligibleForSearch:", 1);
  objc_msgSend(v3, "_setEligibleForPrediction:", 1);
  objc_msgSend(v3, "setEligibleForHandoff:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSiriActionActivity:", v3);
  objc_msgSend(v3, "becomeCurrent");

}

void __85__PUHorizontalAlbumListGadget__navigateToCollection_animated_interactive_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setEligibleForSearch:", 1);
  objc_msgSend(v3, "_setEligibleForPrediction:", 1);
  objc_msgSend(v3, "setEligibleForHandoff:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSiriActionActivity:", v3);
  objc_msgSend(v3, "becomeCurrent");

}

uint64_t __85__PUHorizontalAlbumListGadget__navigateToCollection_animated_interactive_completion___block_invoke_7()
{
  return px_deferredLocalizedStringWithFormat();
}

void __85__PUHorizontalAlbumListGadget__navigateToCollection_animated_interactive_completion___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("uuid");
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addUserInfoEntriesFromDictionary:", v6);

  objc_msgSend(v4, "setEligibleForSearch:", 1);
  objc_msgSend(v4, "_setEligibleForPrediction:", 1);
  objc_msgSend(v4, "setEligibleForHandoff:", 0);
  objc_msgSend(v4, "px_setPersistentIdentifierFromAssetCollection:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setSiriActionActivity:", v4);
  objc_msgSend(v4, "becomeCurrent");

}

uint64_t __85__PUHorizontalAlbumListGadget__navigateToCollection_animated_interactive_completion___block_invoke_5()
{
  return px_deferredLocalizedStringWithFormat();
}

uint64_t __85__PUHorizontalAlbumListGadget__navigateToCollection_animated_interactive_completion___block_invoke_3()
{
  return px_deferredLocalizedStringWithFormat();
}

uint64_t __85__PUHorizontalAlbumListGadget__navigateToCollection_animated_interactive_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __54__PUHorizontalAlbumListGadget__updateCollectionHeight__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  uint64_t result;
  void *v11;
  _QWORD v12[5];

  objc_msgSend(*(id *)(a1 + 32), "gadgetSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentInsets");
  v4 = v3;
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionViewContentSize");
  v9 = v6 + v4 + v8;

  objc_msgSend(*(id *)(a1 + 32), "collectionHeight");
  result = PXFloatApproximatelyEqualToFloat();
  if ((result & 1) == 0)
  {
    v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__PUHorizontalAlbumListGadget__updateCollectionHeight__block_invoke_2;
    v12[3] = &__block_descriptor_40_e47_v16__0___PXMutableHorizontalCollectionGadget__8l;
    *(double *)&v12[4] = v9;
    return objc_msgSend(v11, "performChanges:", v12);
  }
  return result;
}

uint64_t __54__PUHorizontalAlbumListGadget__updateCollectionHeight__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCollectionHeight:", *(double *)(a1 + 32));
}

+ (BOOL)_showsHorizontalScrollIndicator
{
  return 0;
}

- (id)px_gridPresentation
{
  void *v3;
  void *v4;

  createGridPresentationWithViewController(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUHorizontalAlbumListGadget sessionInfo](self, "sessionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionInfo:", v4);

  return v3;
}

@end
